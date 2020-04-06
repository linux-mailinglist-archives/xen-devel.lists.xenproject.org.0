Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D1F19F408
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 13:01:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPVi-0001O2-5N; Mon, 06 Apr 2020 11:01:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8YOW=5W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLPVg-0001NR-IK
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 11:01:44 +0000
X-Inumbo-ID: 001faff4-77f6-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 001faff4-77f6-11ea-b4f4-bc764e2007e4;
 Mon, 06 Apr 2020 11:01:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DEC70AB8B;
 Mon,  6 Apr 2020 11:01:41 +0000 (UTC)
Subject: Re: [PATCH v2] xen/guest_access: Harden *copy_to_guest_offset() to
 prevent const dest operand
To: Julien Grall <julien@xen.org>
References: <20200404130613.26428-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <391ef401-b5d3-2f95-5fe3-c32f372dcc92@suse.com>
Date: Mon, 6 Apr 2020 13:01:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200404130613.26428-1-julien@xen.org>
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
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.04.2020 15:06, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, *copy_to_guest_offset() will allow the hypervisor to copy
> data to guest handle marked const.
> 
> Thankfully, no users of the helper will do that. Rather than hoping this
> can be caught during review, harden copy_to_guest_offset() so the build
> will fail if such users are introduced.
> 
> There is no easy way to check whether a const is NULL in C99. The
> approach used is to introduce an unused variable that is non-const and
> assign the handle. If the handle were const, this would fail at build
> because without an explicit cast, it is not possible to assign a const
> variable to a non-const variable.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I'm not convinced it is a good idea to add (recurring) comments
like you do - there are more aspects of these macros that would
be worth commenting on, and commenting on some but not all may
give the wrong impression of all subtleties being covered (also
for others).

In any event I'd like to ask that each header gain such a
comment only once, with the other being a tiny reference to the
one "complete" instance.

Jan

