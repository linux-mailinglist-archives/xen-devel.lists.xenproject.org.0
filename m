Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDDF260E48
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 11:04:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFZYB-0007Lo-Sk; Tue, 08 Sep 2020 09:04:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFZYA-0007Lh-7i
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 09:04:26 +0000
X-Inumbo-ID: 94d759e3-b179-43c3-b00d-9209770666d9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94d759e3-b179-43c3-b00d-9209770666d9;
 Tue, 08 Sep 2020 09:04:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64AFFABB2;
 Tue,  8 Sep 2020 09:04:25 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] x86/xen.lds.S: Work around binutils build id
 alignment bug
To: Trammell Hudson <hudson@trmm.net>
References: <20200907190027.669086-1-hudson@trmm.net>
 <20200907190027.669086-2-hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b8f533d-c646-8a52-cf37-d21b182ccf9b@suse.com>
Date: Tue, 8 Sep 2020 11:04:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907190027.669086-2-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.2020 21:00, Trammell Hudson wrote:
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -156,6 +156,7 @@ SECTIONS
>         __note_gnu_build_id_end = .;
>    } :note :text
>  #elif defined(BUILD_ID_EFI)
> +  . = ALIGN(32); /* workaround binutils section overlap bug */
>    DECL_SECTION(.buildid) {
>         __note_gnu_build_id_start = .;
>         *(.buildid)

It being "just" 32 bytes may make it look as if we could take this
without much thinking, but I'm then struggling where we would draw
the boundary. The binutils bug having got fixed (or at least worked
around), I don't really like this getting applied uniformly, the
more that nothing would normally have the requirement you have (to
be able to objcopy the whole thing).

Personally I think this kind of a workaround patch is something
distros ought to be fine to carry, if they care about the
functionality and only until they get around to upgrade their
binutils. But I'll be happy to hear differing opinions.

I also don't see any mention anywhere of why it's 32 bytes, and not
16 or 64 or yet something else.

Finally, please Cc maintainers on patch submissions.

Jan

