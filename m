Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8AAC3729D
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 18:45:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156306.1485508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGhYU-0005fs-GE; Wed, 05 Nov 2025 17:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156306.1485508; Wed, 05 Nov 2025 17:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGhYU-0005eC-Dc; Wed, 05 Nov 2025 17:44:22 +0000
Received: by outflank-mailman (input) for mailman id 1156306;
 Wed, 05 Nov 2025 17:44:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vGhYT-0005e6-IP
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 17:44:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGhYS-002Tqx-2W;
 Wed, 05 Nov 2025 17:44:20 +0000
Received: from [15.248.2.25] (helo=[10.24.67.185])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGhYS-00EcvA-2R;
 Wed, 05 Nov 2025 17:44:20 +0000
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
	bh=9bANQMMiY9n3ayB50Cdxawp9PhXoZHdIk4X0ToNi7IY=; b=dAk1s4lJupj6wluCbsC2QpPgxe
	xG1ISeJ/+pF7gk/FUeiHDPwO+dSeY+SsVXgYR4agknch6te56F41Af53b2vBoHtOKCiN7g0++TQsA
	zGFkzy8lfT47Y5CIQfd2HEHuLNjvXVf0eFFo0fEmkDzEKJalSNOD2fkZjG934SSLQ4Rg=;
Message-ID: <1a4490d7-5fb5-44a0-bd77-c8e0548a2553@xen.org>
Date: Wed, 5 Nov 2025 17:44:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Limitations for Running Xen on KVM Arm64
To: "haseeb.ashraf@siemens.com" <haseeb.ashraf@siemens.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "Driscoll, Dan" <dan.driscoll@siemens.com>,
 "Bachtel, Andrew" <andrew.bachtel@siemens.com>,
 "fahad.arslan@siemens.com" <fahad.arslan@siemens.com>,
 "noor.ahsan@siemens.com" <noor.ahsan@siemens.com>,
 "brian.sheppard@siemens.com" <brian.sheppard@siemens.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
 <2b00a98f-6fee-4341-92bd-25909ebb6e36@xen.org>
 <CA753BD2-31FA-480D-B32A-2125F0F4981D@unpredictable.fr>
 <fc181349-d743-4ef0-bcd2-01c04d2a463e@xen.org>
 <TYZPR06MB4580126B98C6A38AA710F597E6F8A@TYZPR06MB4580.apcprd06.prod.outlook.com>
 <01527182-ccef-43a5-be55-a5450eb7919f@xen.org>
 <KL1PR0601MB45883069D3725975B49761D0E6C7A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <0fd2b8e4-bdea-4d01-a2dd-8d2e4b37090d@xen.org>
 <KL1PR0601MB4588FE9914010324E0CFE328E6C4A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB458825063113CD4CB2F9440FE6C5A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <KL1PR0601MB458825063113CD4CB2F9440FE6C5A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/11/2025 13:39, haseeb.ashraf@siemens.com wrote:
> Hi,

Hi Haseeb,

> I have sent out a patch using IPAS2E1IS. The R version RIPAS2E1IS would only be helpful if we have to invalidate more than one page at a time and this is not possible unless a batch version of hypercall is implemented because otherwise there is only one page removed per hypercall.

I have only briefly look at your patch. You have the following loop:

     /* Invalidate stage-2 TLB entries by IPA range */
     for ( i = 0; i < page_count; i++ ) {
         flush_guest_tlb_one_s2(ipa);
         ipa += 1UL << PAGE_SHIFT;
     }

With RIPAS2E1IS, you would be able to replace this loop with a single 
instruction. This may not have any value in your setup because you are 
unmaping 4KB at the time. But there are other hypercalls (such as 
XENMEM_decrease_reservation) where you can remove larger mapping.

So I think there are some values to use the range version. Although, I 
would be fine if this is not handled in your current patch.

> Thanks again for your great suggestions. Please review my patch, you should've received an email.

I will add it in my list of reviews.

Cheers,

-- 
Julien Grall


