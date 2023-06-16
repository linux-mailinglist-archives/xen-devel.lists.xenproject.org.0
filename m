Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE89C733AE0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 22:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550425.859507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAG5Y-00027B-0I; Fri, 16 Jun 2023 20:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550425.859507; Fri, 16 Jun 2023 20:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAG5X-00024O-Tl; Fri, 16 Jun 2023 20:30:31 +0000
Received: by outflank-mailman (input) for mailman id 550425;
 Fri, 16 Jun 2023 20:30:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qAG5X-00024I-3C
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 20:30:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qAG5W-00076a-AY; Fri, 16 Jun 2023 20:30:30 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.4.107]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qAG5W-0005dI-3e; Fri, 16 Jun 2023 20:30:30 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=I45QOau/oIEzrkz2+wEE6KNVRDwA41PPDd80laVbQgE=; b=Gki7GMDXvhtyi1qPEKQLWlx4Lr
	DVS+KYp8KBXXWnQ60ZA0d6h+OX7rn8pdZIPrbjjr7zU1bn3w3ZacTzztl2AV4CMPTt5S/+5kZEh6H
	h9njr5BnAPuAru39/XCmQ5O7deSNbktCzUaG6iusIxeZsOJ1PDYliIP6Tsqfj146J5sc=;
Message-ID: <4f00f865-ab41-e1ed-31cd-867b4f5b1623@xen.org>
Date: Fri, 16 Jun 2023 21:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN v8 1/5] xen/arm: p2m: Use the pa_range_info table to support
 ARM_32 and ARM_64
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
 <20230602120754.23817-2-ayan.kumar.halder@amd.com>
 <c48d763b-4b58-69f1-4cce-2f9855aa8ee0@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c48d763b-4b58-69f1-4cce-2f9855aa8ee0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/06/2023 09:05, Michal Orzel wrote:
>>       /*
>>        * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
>>        * with IPA bits == PA bits, compare against "pabits".
>> @@ -2291,6 +2299,7 @@ void __init setup_virt_paging(void)
>>        */
>>       if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
>>           max_vmid = MAX_VMID_16_BIT;
>> +#endif
>>
>>       /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
>>       for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
>> @@ -2304,26 +2313,41 @@ void __init setup_virt_paging(void)
>>
>>       /* pa_range is 4 bits but we don't support all modes */
> this comment makes sense really only on arm64 as it refers to PARange field of ID_AA64MMFR0_EL1.
> 
>>       if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
>> -        panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
>> +    {
>> +        /*
>> +         * In case of ARM_64, we do not support this encoding of
>> +         * ID_AA64MMFR0_EL1.PARange
>> +         */
>> +        panic("Unsupported value for p2m_ipa_bits = 0x%x\n", p2m_ipa_bits);
> NIT: Putting variable names in messages visible by users is not a great idea IMO.
> "Unsupported IPA size" would read better. Furthermore, I do not think printing IPA size in hex
> is beneficial. I would use "%u bits" (i.e. 32 bits reads better than 0x20 bits).

I went with the following:

-    /* pa_range is 4 bits but we don't support all modes */
+    /* Check if we found the associated entry in the array */
      if ( pa_range >= ARRAY_SIZE(pa_range_info) || 
!pa_range_info[pa_range].pabits )
-    {
-        /*
-         * In case of ARM_64, we do not support this encoding of
-         * ID_AA64MMFR0_EL1.PARange
-         */
-        panic("Unsupported value for p2m_ipa_bits = 0x%x\n", p2m_ipa_bits);
-    }
+        panic("%-bit P2M is not supported\n", p2m_ipa_bits);

This should be generic enough.

-- 
Julien Grall

