Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F654198CEE
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 09:29:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJBIU-0000IP-UQ; Tue, 31 Mar 2020 07:26:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJBIT-0000IK-Ls
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 07:26:53 +0000
X-Inumbo-ID: fe0632bc-7320-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe0632bc-7320-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 07:26:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2C1A3AC46;
 Tue, 31 Mar 2020 07:26:52 +0000 (UTC)
Subject: Re: [PATCH 1/8] xen/guest_access: Harden copy_to_guest_offset to
 prevent const dest operand
To: Julien Grall <julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
 <20200330192157.1335-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33a36f0e-5adb-b8af-445c-bab765c84589@suse.com>
Date: Tue, 31 Mar 2020 09:26:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330192157.1335-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 dfaggioli@suse.com, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.03.2020 21:21, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, copy_to_guest_offset() will allow the hypervisor to copy
> data to guest handle marked const.
> 
> Thankfully, no users of the helper will do that. Rather than hoping this
> can be caught during review, harden copy_to_guest_offset() so the build
> will fail if such users are introduced.

But there are other implications you break:

> --- a/xen/include/asm-arm/guest_access.h
> +++ b/xen/include/asm-arm/guest_access.h
> @@ -126,7 +126,7 @@ int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
>  
>  #define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
>      const typeof(*(ptr)) *_s = (ptr);                   \
> -    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
> +    typeof(*((hnd).p)) *_d = (hnd).p;                   \
>      ((void)((hnd).p == (ptr)));                         \
>      __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\

Until this change, it is "ptr" which all sizes get derived from,
i.e. it is the internally used type rather than the handle type
which controls this. I'm sure we use this in a few places, to
copy to e.g. a handle derived from "void". Compatibility of types
(disallowing other than void) is checked by the comparison on the
line immediately after the line you change. Yes "_d+(off)" right
above here then changes its result. I consider it pretty likely
you'd notice this issue once you go beyond just build testing.

To address this, I guess we need to find an expression along the
lines of that comparison, which does not cause any code to be
generated, but which verifies the properties we care about. The
line you change should be left alone, from all I can tell right
now.

Jan

