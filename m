Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7352344B4
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:45:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TTb-0007UT-HZ; Fri, 31 Jul 2020 11:45:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1TTZ-0007UM-QQ
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:45:25 +0000
X-Inumbo-ID: 520a346e-d323-11ea-aba1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 520a346e-d323-11ea-aba1-12813bfff9fa;
 Fri, 31 Jul 2020 11:45:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E18E7AB71;
 Fri, 31 Jul 2020 11:45:36 +0000 (UTC)
Subject: Re: [RESEND][PATCH v2 6/7] xen/guest_access: Consolidate guest access
 helpers in xen/guest_access.h
To: Julien Grall <julien@xen.org>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-7-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <17a7da1c-78eb-a86b-85f1-2372af93476e@suse.com>
Date: Fri, 31 Jul 2020 13:45:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730181827.1670-7-julien@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.07.2020 20:18, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Most of the helpers to access guest memory are implemented the same way
> on Arm and x86. The only differences are:
>     - guest_handle_{from, to}_param(): while on x86 XEN_GUEST_HANDLE()
>       and XEN_GUEST_HANDLE_PARAM() are the same, they are not on Arm. It
>       is still fine to use the Arm implementation on x86.

Is the description stale? I don't think there's any guest_handle_from_param()
anymore.

>     - __clear_guest_offset(): Interestingly the prototype does not match
>       between the x86 and Arm. However, the Arm one is bogus. So the x86
>       implementation can be used.
>     - guest_handle{,_subrange}_okay(): They are validly differing
>       because Arm is only supporting auto-translated guest and therefore
>       handles are always valid.
> 
> In the past, the ia64 and ppc64 port use a different model to access
> guest parameter. They have been long gone now.
> 
> Given Xen currently only support 2 archictures, it is too soon to have a
> directory asm-generic as it is not possible to differentiate it with the
> existing directory xen/. If/When there is a 3rd port, we can decide to
> create the new directory if that new port decide to use a different way
> to access guest parameter.
> 
> For now, consolidate it in xen/guest_access.h.
> 
> While it would be possible to adjust the coding style at the same, this
> is left for a follow-up patch so 'diff' can be used to check the
> consolidation was done correctly.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Apart from the above
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

