Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B098280E53
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 09:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1722.5244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOFv1-0004fP-Ut; Fri, 02 Oct 2020 07:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1722.5244; Fri, 02 Oct 2020 07:55:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOFv1-0004f0-Ry; Fri, 02 Oct 2020 07:55:55 +0000
Received: by outflank-mailman (input) for mailman id 1722;
 Fri, 02 Oct 2020 07:55:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jYI3=DJ=nxp.com=laurentiu.tudor@srs-us1.protection.inumbo.net>)
 id 1kOFv0-0004ev-Nx
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 07:55:54 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.61]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 252cffd0-f0a6-4c87-b3be-7607a2e72c90;
 Fri, 02 Oct 2020 07:55:53 +0000 (UTC)
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Fri, 2 Oct
 2020 07:55:51 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 07:55:51 +0000
Received: from [192.168.1.106] (86.123.62.1) by
 VI1PR0501CA0034.eurprd05.prod.outlook.com (2603:10a6:800:60::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Fri, 2 Oct 2020 07:55:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jYI3=DJ=nxp.com=laurentiu.tudor@srs-us1.protection.inumbo.net>)
	id 1kOFv0-0004ev-Nx
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 07:55:54 +0000
X-Inumbo-ID: 252cffd0-f0a6-4c87-b3be-7607a2e72c90
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown [40.107.3.61])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 252cffd0-f0a6-4c87-b3be-7607a2e72c90;
	Fri, 02 Oct 2020 07:55:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCbdYdGyjJJ6KAl/Mn4RdmoMrTAL9GMr5/DQeqwzWiuDKHPF7VlMgT6Gjw0QVF+sdwY+PtWcrwWALrZ7v8PKEeIF9zI1y9WUxm5AattcIq1POqoVEAeRAhbiQyaznqPhOWjett9Q9zrEEWvJ/zY4fUoYZR1XCKkJAB7pnyEdjqQRUtEkQrK0nPPP11qmuP4u0tVhC/ryK1BowWN0NSEWF/7MkkJNvMKeCKzcCW2KHBV+isUUkEFTFyxJ94e+VsdRPizkXPVaEtTm1pqHjzc6mUWZnL05POhdgqKYMlAgQDjlRK8fbRaYS8Vjm9ONLv1PyHnqVuahS4PWclGn1mzr9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=il+wQHf/vOJMi4/A137ryVjrMt4OuqFJ9IvT4CoF0SQ=;
 b=l4qWWZD+ietJLg9yn6MDerCyooUz2alyZHN570fdMkFyOLO83OMCUDBjQ6WcgUk7qUcYmeXy0TWN96JEc6Mg9ql5AbyzCX9SfJhKONuV2kPN8QaYL/FLZ11+ANfZib9qrg5g/a0pP2d+UhlAkX1z/l1s9g0NPyvltmdMUhO4PX/WKg2fdXC/nvNlc5eJ+LWGvrX9YluNm4xYhaQ8u5KHVu+eTUt2qHJcVQiiBIjzkWcfn5y5OloMEcnBQ9b8iAE/EeoBLpVri7/9IsKZhJQhhuflFFnBt8neYZL74MMX5HC3Ua8RwRvguGPaKkaEjC6F6tzqDpfmmNH81Q0XrLoVJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=il+wQHf/vOJMi4/A137ryVjrMt4OuqFJ9IvT4CoF0SQ=;
 b=UhpO5JUryMzhvxLDe8zurPbuS74wVQn2UOxnrU5OS4+y1SpO1YwyFi2K3M2+3kzopYwit6MXh/Scp0Rr7NbyNlcoHM8aN86vtnSsqEWvCMfcqZY0KKjtsm9wfCLsBBkEQkdCMP7oOBrP8g99sYiG/spDgb8f+PFF3XcVlSOd89U=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Fri, 2 Oct
 2020 07:55:51 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 07:55:51 +0000
Subject: Re: [PATCH] arm,smmu: match start level of page table walk with P2M
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com, will@kernel.org, diana.craciun@nxp.com,
 anda-alexandra.dorneanu@nxp.com
References: <20200928135157.3170-1-laurentiu.tudor@nxp.com>
 <alpine.DEB.2.21.2010011647020.10908@sstabellini-ThinkPad-T480s>
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <e591b03a-f05a-5e01-2fd6-f14f3c8e1039@nxp.com>
Date: Fri, 2 Oct 2020 10:55:48 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <alpine.DEB.2.21.2010011647020.10908@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0501CA0034.eurprd05.prod.outlook.com
 (2603:10a6:800:60::20) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.106] (86.123.62.1) by VI1PR0501CA0034.eurprd05.prod.outlook.com (2603:10a6:800:60::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 07:55:50 +0000
X-Originating-IP: [86.123.62.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5aff353b-6b87-42ff-21f2-08d866a894e9
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3421C714FA542D73A787327AEC310@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gc7C0cczhflJaxwLypKfQ7bwEl27dMFahH2OvxB1IriI5Zfiw8C5KM0rF5ZqwYmCFPOEZqaTVB2hj0P4rWNXIGscaShDXgN+auRkXwze8LGaT77dO/lwdts5q83Uepo6h9O5opz22ns7oykVR1zofhCdc040q/YuYpKk+f//gDzTpxoWHxMbHQqt9W3Zo8S4iU0u3m35y8/QbZrBe1Ka67hRveLJ5aA1Rd0W/7jLFt4PgXDO5SrfWR6gwxgGkNcph3zD80pnKTMtEHFTOfxjE4llLs4iL758grkaDoAkoNNYUclC2DirptbbiWzQL1PAHjqKKanNgQUcmxdkKQ4PpfFKcVmltivXXosym9CWHOsWuqPJrW4lDOishEtqEWmLJP4xsGHWj3+67496cDHQqQTnSRn9hpsF5DNt69VBiV2cI8H3O6OyPfKJJM+ti7fy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(316002)(478600001)(6486002)(86362001)(16576012)(31696002)(2906002)(36756003)(66946007)(186003)(83380400001)(8936002)(5660300002)(16526019)(4326008)(31686004)(66476007)(66556008)(8676002)(26005)(52116002)(2616005)(956004)(44832011)(53546011)(6916009)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	X/BaLvPyokLZZXmeCBRzMKpYIBCVKnb+LxY7mMMBpr2YvSGVG/Z88K0t7eXg+Kh4LL5Nw/+on0c1SzDcEOTT3J8tljDxWNJnrfL7g9hY15gIqS9/gcNftMw5lRMiUlS/466p2J8BqEozBPdmS2Xuqx7noFoTI3vm+RnfBc71JMYxMHJU+Ug2140HmIIsfqsUM/mrIo+QklGrLQ/MQrtgAQhIxNGu6CLxeqCLJK2HqJH9qPsz+2Avk2KpLtSp0amEZqceBJAOUxVYnYK45Ni0hMXoH9ZhmAOu36WVcyjqGrzXjYE7kFDKKATUlj3AS+Cyqwb7pkGlWEjv8pPFTVR/B5z6YokDU0l81zBP8ZCZ6B/ErsX7yGoBHIZgiVeIjAv5/8+KQ+xK458/BmKVJQvbEpNEF1KKeMipsHof6/2JxkOwQruzwwuEs/Ll4BDGhiMSCVJinOMusNP8ohbcSqRFcuIce2M7ip21iYaEI71oQvxexLXDPmiUB6tk9SMvCjuSlOuU5Nww2mtVs/eOHeKQf5r+NTST5G/X7eymYGnZR8BTwwofiePRzi4M8QU/LaxNpkqLFmEbNQdJLGqC1OG3T2fa/mxTdv5pztO5mz14f4rkq4r8/7/Pn+hItlyEIPqveEnzoSbRE33mQFmMKT4/4A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aff353b-6b87-42ff-21f2-08d866a894e9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 07:55:51.3899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkVkHkgPFpqgHui763mdefcRLpfoIgtu6ASe3G+EyOJp4Foj1UhBSdsa5T++VIBP68qB21NWuU/H+KrAuc5pBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421



On 10/2/2020 2:52 AM, Stefano Stabellini wrote:
> On Mon, 28 Sep 2020, laurentiu.tudor@nxp.com wrote:
>> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
>>
>> Don't hardcode the lookup start level of the page table walk to 1
>> and instead match the one used in P2M. This should fix scenarios
>> involving SMMU where the start level is different than 1.
>>
>> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> Thank you for the patch, I think it is correct, except that smmu.c today
> can be enabled even on arm32 builds, where p2m_root_level would be
> uninitialized.
> 
> We need to initialize p2m_root_level at the beginning of
> setup_virt_paging under the #ifdef CONFIG_ARM_32. We can statically
> initialize it to 1 in that case. Or...
> 
> 
>> ---
>>  xen/arch/arm/p2m.c                 | 2 +-
>>  xen/drivers/passthrough/arm/smmu.c | 2 +-
>>  xen/include/asm-arm/p2m.h          | 1 +
>>  3 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index ce59f2b503..0181b09dc0 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -18,7 +18,6 @@
>>  
>>  #ifdef CONFIG_ARM_64
>>  static unsigned int __read_mostly p2m_root_order;
>> -static unsigned int __read_mostly p2m_root_level;
>>  #define P2M_ROOT_ORDER    p2m_root_order
>>  #define P2M_ROOT_LEVEL p2m_root_level
>>  static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>> @@ -39,6 +38,7 @@ static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>>   * restricted by external entity (e.g. IOMMU).
>>   */
>>  unsigned int __read_mostly p2m_ipa_bits = 64;
>> +unsigned int __read_mostly p2m_root_level;
> 
> ... we could p2m_root_level = 1; here
> 

This looks straight forward and in line with what we do with
p2m_ipa_bits, I'll send a v2 right away.

Thanks for the review.

---
Best Regards, Laurentiu

>>  /* Helpers to lookup the properties of each level */
>>  static const paddr_t level_masks[] =
>> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
>> index 94662a8501..85709a136f 100644
>> --- a/xen/drivers/passthrough/arm/smmu.c
>> +++ b/xen/drivers/passthrough/arm/smmu.c
>> @@ -1152,7 +1152,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
>>  	      (TTBCR_RGN_WBWA << TTBCR_IRGN0_SHIFT);
>>  
>>  	if (!stage1)
>> -		reg |= (TTBCR_SL0_LVL_1 << TTBCR_SL0_SHIFT);
>> +		reg |= (2 - p2m_root_level) << TTBCR_SL0_SHIFT;
>>  
>>  	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBCR);
>>  
>> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
>> index 5fdb6e8183..97b5eada2b 100644
>> --- a/xen/include/asm-arm/p2m.h
>> +++ b/xen/include/asm-arm/p2m.h
>> @@ -12,6 +12,7 @@
>>  
>>  /* Holds the bit size of IPAs in p2m tables.  */
>>  extern unsigned int p2m_ipa_bits;
>> +extern unsigned int p2m_root_level;
>>  
>>  struct domain;
>>  
>> -- 
>> 2.17.1
>>

