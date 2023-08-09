Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0493776213
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 16:10:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581144.909711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjsX-0002j2-Ll; Wed, 09 Aug 2023 14:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581144.909711; Wed, 09 Aug 2023 14:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjsX-0002gu-Ib; Wed, 09 Aug 2023 14:09:37 +0000
Received: by outflank-mailman (input) for mailman id 581144;
 Wed, 09 Aug 2023 14:09:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTjsW-0002go-D9
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 14:09:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c706ae3-36be-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 16:09:32 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 64EFC4EE073F;
 Wed,  9 Aug 2023 16:09:31 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5c706ae3-36be-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Wed, 09 Aug 2023 16:09:31 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH 2/2] xen/delay: address MISRA C:2012 Rule 5.3.
In-Reply-To: <E970F516-F626-4F8A-8A82-DF3E31ABEA20@arm.com>
References: <cover.1691567429.git.nicola.vetrini@bugseng.com>
 <47e2c8770e38ab064cbcdfaafa8467c5e733f11d.1691567429.git.nicola.vetrini@bugseng.com>
 <E970F516-F626-4F8A-8A82-DF3E31ABEA20@arm.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <dd2787dcd2c694141690fc71e5b811cb@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/2023 15:56, Luca Fancellu wrote:
>> On 9 Aug 2023, at 08:55, Nicola Vetrini <nicola.vetrini@bugseng.com> 
>> wrote:
>> 
>> The variable 'msec' declared in the macro shadows the local
>> variable in 'ehci_dbgp_bios_handoff', but to prevent any
>> future clashes with other functions the macro is converted to
>> a static inline function.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> xen/include/xen/delay.h | 8 ++++++--
>> 1 file changed, 6 insertions(+), 2 deletions(-)
>> 
>> diff --git a/xen/include/xen/delay.h b/xen/include/xen/delay.h
>> index 9d70ef035f..9150226271 100644
>> --- a/xen/include/xen/delay.h
>> +++ b/xen/include/xen/delay.h
>> @@ -4,7 +4,11 @@
>> /* Copyright (C) 1993 Linus Torvalds */
>> 
>> #include <asm/delay.h>
>> -#define mdelay(n) (\
>> - {unsigned long msec=(n); while (msec--) udelay(1000);})
>> +
>> +static inline void mdelay(unsigned long msec)
>> +{
>> +    while ( msec-- )
> 
> Does misra allows to modify the function parameters? (Truly asking 
> because IDK)
> 

I checked: there's an advisory (R17.8) that disallows this, but since 
advisories (apart from
a couple of selected ones) are not taken into consideration for 
compliance, so it's not a big deal.
Even less so since it's not a pointer type.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

