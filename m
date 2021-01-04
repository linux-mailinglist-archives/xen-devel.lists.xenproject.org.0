Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1FD2E9649
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 14:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61222.107527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQDZ-0003FK-L0; Mon, 04 Jan 2021 13:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61222.107527; Mon, 04 Jan 2021 13:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQDZ-0003Ev-Hl; Mon, 04 Jan 2021 13:48:17 +0000
Received: by outflank-mailman (input) for mailman id 61222;
 Mon, 04 Jan 2021 13:48:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwQDY-0003Eq-NZ
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 13:48:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95860c78-92d1-422e-b4e6-b7c5ccfba77b;
 Mon, 04 Jan 2021 13:48:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC8E1AD4E;
 Mon,  4 Jan 2021 13:48:14 +0000 (UTC)
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
X-Inumbo-ID: 95860c78-92d1-422e-b4e6-b7c5ccfba77b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609768094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pWeprLmfTbsHUJQYuSaHF2EIxICXAxIDwBdQTKeboQo=;
	b=BHtEj/sjvVWEEsGVwBDsHoQ1Tsr8XUv3o1nagUuTBYMAIEHGET4fEbZGYOBR8P9mMHaroL
	bG3rQAOJWe+KmG9yWTfZxDTQpx/FxazXfDCUUnTy/Bbw7HUNzQhAYmhPRQSP8M8a7swk1h
	3NvvtSKJQAlXnExBACA9RNhYwDAcTVk=
Subject: Re: [PATCH 2/5] x86/build: limit #include-ing by asm-offsets.c
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d7ac370e-2e1f-5b7a-b832-63577689053c@suse.com>
 <20201228125442.gnkadcfrrnzczffs@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d8dc87d-3d37-eff5-7ae4-2cc39e538a28@suse.com>
Date: Mon, 4 Jan 2021 14:48:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201228125442.gnkadcfrrnzczffs@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.12.2020 13:54, Roger Pau Monné wrote:
> On Wed, Nov 25, 2020 at 09:49:21AM +0100, Jan Beulich wrote:
>> This file has a long dependencies list and asm-offsets.h, generated from
>> it, has a long list of dependents. IOW if any of the former changes, all
>> of the latter will be rebuilt, even if there's no actual change to the
>> generated file. Therefore avoid including headers we don't actually need
>> (generally or configuration dependent).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/x86_64/asm-offsets.c
>> +++ b/xen/arch/x86/x86_64/asm-offsets.c
>> @@ -5,11 +5,13 @@
>>   */
>>  #define COMPILE_OFFSETS
>>  
>> +#ifdef CONFIG_PERF_COUNTERS
>>  #include <xen/perfc.h>
>> +#endif
>>  #include <xen/sched.h>
>> -#include <xen/bitops.h>
>> +#ifdef CONFIG_PV
>>  #include <compat/xen.h>
>> -#include <asm/fixmap.h>
>> +#endif
>>  #include <asm/hardirq.h>
>>  #include <xen/multiboot.h>
>>  #include <xen/multiboot2.h>
>> @@ -101,7 +103,6 @@ void __dummy__(void)
>>  #ifdef CONFIG_PV
>>      OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);
>>      BLANK();
>> -#endif
>>  
>>      OFFSET(VCPUINFO_upcall_pending, struct vcpu_info, evtchn_upcall_pending);
>>      OFFSET(VCPUINFO_upcall_mask, struct vcpu_info, evtchn_upcall_mask);
>> @@ -110,6 +111,7 @@ void __dummy__(void)
>>      OFFSET(COMPAT_VCPUINFO_upcall_pending, struct compat_vcpu_info, evtchn_upcall_pending);
>>      OFFSET(COMPAT_VCPUINFO_upcall_mask, struct compat_vcpu_info, evtchn_upcall_mask);
>>      BLANK();
>> +#endif
> 
> Since you are playing with this, the TRAPINFO/TRAPBOUNCE also seem
> like ones to gate with CONFIG_PV. And the VCPU_svm/vmx could be gated
> on CONFIG_HVM AFAICT?

Maybe. I didn't want to make too big a first step.

Jan

