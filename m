Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E023BA1108
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 20:46:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130741.1470160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1qyf-0003VT-G1; Thu, 25 Sep 2025 18:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130741.1470160; Thu, 25 Sep 2025 18:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1qyf-0003SP-D4; Thu, 25 Sep 2025 18:46:01 +0000
Received: by outflank-mailman (input) for mailman id 1130741;
 Thu, 25 Sep 2025 18:45:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NIhE=4E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1v1qyd-0003SJ-PO
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 18:45:59 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df410973-9a3f-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 20:45:57 +0200 (CEST)
Received: from SJ0PR03CA0103.namprd03.prod.outlook.com (2603:10b6:a03:333::18)
 by DS0PR12MB8365.namprd12.prod.outlook.com (2603:10b6:8:f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 18:45:53 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::24) by SJ0PR03CA0103.outlook.office365.com
 (2603:10b6:a03:333::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Thu,
 25 Sep 2025 18:45:53 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 18:45:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 11:45:52 -0700
Received: from [10.71.195.192] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 25 Sep 2025 11:45:51 -0700
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
X-Inumbo-ID: df410973-9a3f-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uaui5JdAhgqo5FaEB9n3Q+rJpd32MO7aupt1qUb4AaSkuxLMB1K9wHy0sSN3NyekFJGp3EjN1jTCES+St2OZhbopH+HioT/DEbGwiZZHut1hYPpJLV6+WUFkiCMMOBV8AQ/7T/UNnEXolM/FTF71IKi9hF2a/Xh0URKBfGIUmiw637X1W2E3TYNoAtEBa5YPljQshj+TKvl00yu3sN75Td1imsW4GHEGeqKxyd5BCgO232jBiFQ+psqRWFZMk/W4cr7HG6b+4RnN8q286JNQNJ1TNGh1YpFIFNxzLSOh4KI6gowvGqG2uhMSteL7obRXVqHftE+4G26tf5Dr0f+VVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WK6JEI2NPrrhjlYUehGgTpiNDft3cd2ZTkSrs8nuDg=;
 b=jm5mysyz1sARKxtf2d8LHlTPqdKKCYNwPpGTnum+dORGikjc4RevBrGvA0bvM+TreK3UxD/FJk8phUJe9SJuuO0jJ87WUKd6zvOfsSx0sxYDDl9lzlaPEJZ9ahO2mA5plChCC7WJc4aklstbKG4rgXNb6afXYA/ETnzcHBz7Gmcx0g+yxf1bfrqdpPruEPqT5pDiWLXs5DqqFfCQDd/RBL9ZQPcTI4S50psn1C29RvQn4O5Eg6F7DdCmNoqef90cqtZpg0XlhQPpNsgMLCTjBiqdEwtoXYMAfvIgiLljzLkteo59Hh6AbsajoumhMSwtMOpEYhm+WeL0NCtMxxwy4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WK6JEI2NPrrhjlYUehGgTpiNDft3cd2ZTkSrs8nuDg=;
 b=KwCOS6j+csICj7wfXsH96tFkVVbbZ+lZ2V3x27+XOmd1uZMntrCkNien5bjWOG5aWgAO6iXx8wjoi3m5JEMgRT619Y4cpZIwEK9S1tT81LN2OIMbS+ORfR09O/K3TRCp0VXRhT/n0M7134CTOBP54NpGcHmwWTOQUXYEpvWSE7c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <542fef14-a123-4d7b-9bd6-8bc280276684@amd.com>
Date: Thu, 25 Sep 2025 19:45:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Introduce GICV3 Self Tests
To: Grygorii Strashko <grygorii_strashko@epam.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250912170055.3077923-1-ayan.kumar.halder@amd.com>
 <bd0d3670-51c7-4c60-9b45-201f00a14b8e@epam.com>
 <762b9d19-f1dd-4bfe-a298-d88ab8e7bbd2@amd.com>
 <054b31c6-8911-495b-a8b4-b7a807c95786@epam.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <054b31c6-8911-495b-a8b4-b7a807c95786@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|DS0PR12MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: d9611c75-fdff-4675-47c2-08ddfc63c130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDY4Q0hJempIU3VmMVltL1YxVjJSaHB4RkcyVXFjdGJuU2ZRbzNWNHNON0Zu?=
 =?utf-8?B?RnJ0UDEvK1JSNVBCSEZRc2dmKzJiRjhCVzZvMEErd2E1WmN0UVNNdjRpSFFT?=
 =?utf-8?B?STZVZ0lWSjBLVGZNay9TR0d2em5yU1BDN1M3SW1Ea05zMmFvQWtLQkVuUi9I?=
 =?utf-8?B?dG5OVXRTQ2ZPVjlKelNqanNnR3F0cUR1MkNRS0Zyb2h6Nm1BNXNZTjU2bWky?=
 =?utf-8?B?TksrQUlBWHA1REVRb1cxRXRZSE5lQlpTaVJLTitsaEZ1Q3lSUmUxeUJsRU83?=
 =?utf-8?B?NUNJZHJZN0RmVXAxSjZtY1lyamQwSWF0aENtamtoRVdzbHNlYUxUL04zejZa?=
 =?utf-8?B?bHVRdU5rWXlXNFl3NUNBUll2WnNkbUU3Yk5RaDVGaTJha3kwNGwyNkQ5T1o3?=
 =?utf-8?B?d0FSK0FjemkrUktjd2VJNHQ2SnRCVStuemRMTFZ5UStheldkOFZuTVBwcWVH?=
 =?utf-8?B?dHQ0WGZuZGZtck5QMkxld1NoY2dTYXl6WXB1c01pdU9ZNE5BQ3cvNzBZZ3Ja?=
 =?utf-8?B?cVVkaHRpVkFJbVp0V2FtQUQ2dWhGY3puQzlkV1BiYTkrOHJ0VnA3N3BJOFlE?=
 =?utf-8?B?b05IYk81SU52aHQ0aWxUVGR6M0hmc042cVRDcU43a0VRNmlqZFpZdGFvOFVj?=
 =?utf-8?B?b0JpMEdGRG84K1VhczJIeCtYQWxUQlN4bUJMZHhGS2tGQzA1b21Ia0p2b0hR?=
 =?utf-8?B?SEFvektUeWE5eXB5TGF6SUE4K05IL1VSZi9tbmZIUmF1cDJmY3NINWQ5NTEx?=
 =?utf-8?B?Q21WVFUzL3FNRGVvcHFra0I3VU9oUUhmMEdjN3EvSzRKN3N2MXpuR0E5anVn?=
 =?utf-8?B?QUpBZVY1aVNQUGozZEt0TW91SENhM1k0a2lFODhXV0lpMzlRbDRGamE2WHdj?=
 =?utf-8?B?V2MydWlZMnlKeUZ1OWlidWdqUGRkU3MxV3pnY2U3eFVYNUdiZ2xIWThZMzdF?=
 =?utf-8?B?VTVjdHUyc2VtZkxMMVd4QkVaRjNqV2s4WXlJR2xwbGlvbDQ0d0hPb3paRHhX?=
 =?utf-8?B?MmlWclk2R1Y0Zm4vNXJMWHF1aG5aRWwxUG9ZdVR4VVIwRGtudkJYMTViaUVW?=
 =?utf-8?B?Tnk5VTVKS3VXeXA5eTdjLzczNnRGMkFtcTZuOEN1eXlqN2xBWjlkZzRqcExB?=
 =?utf-8?B?Z1A2VWU2YzF4K2plckVXYUZRZDczRUIvaWVQbHU0UDRsU0p3UDNLUHpjY3d5?=
 =?utf-8?B?Lzl3NDlvemhqcUUwNUFqcTJJRmp2STk0b2g0RW9CZnVaM0tmSzIzTDBpb2ly?=
 =?utf-8?B?aXNXVzk5UWFUWG1obW5kU0dDTnVodjN0RkRHVnFRUzV6a0E0MnFJNDJGRWZH?=
 =?utf-8?B?bFRMSWNJMmhINmRZRm9tWit4TjgyU1NnU2RSdU11SUZYUDl4VUJyVmpyZkZQ?=
 =?utf-8?B?TXQ4RGpic2J0cFBmUWRId1FtdjFGRFVVc1FINlVHaHJvTnN1Z1Y0U2VGUW91?=
 =?utf-8?B?ZHJ6Wk1rQmF1VWUxR3prTWU3cWdXeTRJV2d5UjNvN2tlbGk2eTlTeEgyWHZx?=
 =?utf-8?B?SnNMRmRXT2JuVVBPQ09yQTl1TWJBRGJESDRIVE9VRWhQaVZJOU82VlRib1RS?=
 =?utf-8?B?NEdIWDZrM2RsOVR5YXNUcy9OelU3VndRYUdMaGYzTXdhdThQNll5TUpJVEZ1?=
 =?utf-8?B?QTA2eE84Si9ySklLT3Z4Q0k4WG54dXd3WWU4dDJHYVFBMklZWkdSOURTT2E1?=
 =?utf-8?B?N0t2Yjg5WkpEdXJXRzc3RXRXbWFwQ1JGYWxQSkNvTTdjUTJaTksxV2NHUGRR?=
 =?utf-8?B?UTJIRElJY3dhNm4vRUZ2WGN3SWx3U1dwNVlIWlMxRWgyNFpXTjN5bEswdm5z?=
 =?utf-8?B?cUJmLzdZM1ZBM2xIY2J2TkNMSUl0OHVsTjZBK2k0TUVhdVJUdmFld1VwZTBK?=
 =?utf-8?B?NThRb2pLU0loMUQ5STdUVXF3aVU4SlY1cGhUL0xjR2gvbDA1eDdlN3FRcUFq?=
 =?utf-8?B?cDNaUEVPY25STUJNSkxNYmpwWGgyZ1R5amd3ZTFwMWI2eHpZdE9CcVdTSTdM?=
 =?utf-8?B?N2FCdzREbXVMY2V4V0o1N2pCT2VaVkJ0YzNXQnF2ZVMwYUs5V095eUJVVmdL?=
 =?utf-8?Q?NUaI2s?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 18:45:52.8257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9611c75-fdff-4675-47c2-08ddfc63c130
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8365


On 24/09/2025 16:48, Grygorii Strashko wrote:
> Hi Ayan,
Hi Grygorii,
>
> On 22.09.25 19:55, Ayan Kumar Halder wrote:
>>
>> On 16/09/2025 11:55, Grygorii Strashko wrote:
>>> Hi Ayan,
>> Hi Grygorii,
>>>
>>> On 12.09.25 20:00, Ayan Kumar Halder wrote:
>>>> Introduce CONFIG_GICV3_SELFTEST to enclose tests for GICv3 driver.
>>>> Test that Xen is able to generate SGIs.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>> One of the aim of functional safety is to test hw/sw interface. 
>>>> This means that
>>>> Xen is able to configure the hardware correctly for the desired 
>>>> functionalities.
>>>>
>>>> Normally this is tested from the VMs. For eg if a VM is able to 
>>>> receive irq, this
>>>> implies that Xen has configured the GICv3 interface 'correctly'. 
>>>> However this is
>>>> a high level (or integration) test which uses not only the GICv3 
>>>> interface
>>>> between Xen and VM, but the interrupt injection code for Xen to VMs.
>>>>
>>>> We want to have some kind of unit tests to check that Xen is able 
>>>> to receive
>>>> various interrupts, set priorities, etc. Here, we have written unit 
>>>> tests for
>>>> software generated interrupts (SGIs) as example.
>>>>
>>>> These tests are expected to be triggered as Xen boots (right after 
>>>> Xen has
>>>> initialised the GICv3 interface ie gicv3_init(). The aim of this 
>>>> test is to
>>>> check whether Xen can trigger SGIs after gicv3_init() is invoked. 
>>>> If so, we can
>>>> claim that gicv3_init() was done properly to be able to trigger 
>>>> SGIs. Likewise
>>>> we will have tests to check for priorities, SPIs, etc.
>>>>
>>>> A script will parse the logs and claim that Xen is able to trigger 
>>>> SGIs.
>>>>
>>>>   xen/arch/arm/Kconfig  |  8 ++++++++
>>>>   xen/arch/arm/gic-v3.c |  7 +++++++
>>>>   xen/arch/arm/gic.c    | 21 +++++++++++++++++++++
>>>>   3 files changed, 36 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>> index 950e4452c1..739f99eaa9 100644
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -73,6 +73,14 @@ config GICV3
>>>>         Driver for the ARM Generic Interrupt Controller v3.
>>>>         If unsure, use the default setting.
>>>>   +config GICV3_SELFTEST
>>>> +    bool "GICv3 driver self test"
>>>> +    default n
>>>> +    depends on GICV3
>>>> +    ---help---
>>>> +
>>>> +      Self tests to validate GICV3 driver.
>>>> +
>>>>   config HAS_ITS
>>>>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if 
>>>> UNSUPPORTED
>>>>           depends on GICV3 && !NEW_VGIC && !ARM_32
>>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>>> index 4e6c98bada..eb0c05231c 100644
>>>> --- a/xen/arch/arm/gic-v3.c
>>>> +++ b/xen/arch/arm/gic-v3.c
>>>> @@ -1818,6 +1818,13 @@ static int __init gicv3_init(void)
>>>>         gicv3_hyp_init();
>>>>   +#ifdef CONFIG_GICV3_SELFTEST
>>>> +    send_SGI_self(GIC_SGI_EVENT_CHECK);
>>>> +    send_SGI_self(GIC_SGI_DUMP_STATE);
>>>> +    send_SGI_self(GIC_SGI_CALL_FUNCTION);
>>>> +    send_SGI_self(GIC_SGI_MAX);
>>>> +#endif
>>>> +
>>>
>>> I'd like to ask, if possible, to minimize mixing selftest and 
>>> functional code.
>>> Like add gic-v3-selftest.c.
>>
>> I can try that. However, the self test needs to be invoked from 
>> functional code.
>>
>> Also, your suggestion gave me an idea. I can do :-
>>
>> +static bool __initdata opt_gicv3_selftest = false;
>> +
>> +#ifdef CONFIG_GICV3_SELFTEST
>> +opt_gicv3_selftest = true;
>> +#endif
>
> I'd like to propose to consider other approach according to the 
> following assumptions:
> 1) the goal is "Test that Xen is able to generate SGIs.". According to 
> the goal and your code
> - for this test, it doesn't matter which one (SGI) is tested. Any way 
> you don't call real handlers for
>  GIC_SGI_x.
>
> 2) there are 16 SGIs available, only 3 are statistically defined (enum 
> gic_sgi) and
> It's possible to reserve one more for testing purposes,
> like GIC_SGI_SELFTEST

I do like this approach. The only mild concern is that the test 
introduces a new SGI. IOW, it is not testing the existing SGIs which are 
used by Xen.

I need to think a bit more on this.

>
> Then, gic SGI selftest might work without breaking Xen boot (probably 
> for gicv2 also)

The goal of these kind of self tests are to validate Xen drivers (or 
rather Xen's configuration of the HW component). We will not be running 
Xen with any domains. Also, we don't intend to have the self tests run 
during regular boot of Xen as it adds a significant amount of code to be 
executed during boot time.

These tests will help to isolate issues when there is a potential 
misconfiguration of Xen for the hardware component or the hardware 
component does not work correctly with Xen.

>
> gic.c:
>   do_static_sgi()
>   {
>    ...
>    #ifdef CONFIG_GIC_SELFTEST
>         case GIC_SGI_SELFTEST:
>           gic_sgi_selftest();
>         break;
>    #endif
>
> git-selftest.c
>
>   gic_sgi_selftest()
>   {
>     // process test SGI, like count number of triggers
>   }
>
>   void [__init __constructor?] test_gic_sgi_selftest()
>   {
>     setup test 1
>     send_SGI_self(GIC_SGI_SELFTEST)
>     setup test 2
>      send_SGI_allbutself(GIC_SGI_SELFTEST)
>     setup test 2
>     send_SGI_mask(cpu_mask, GIC_SGI_SELFTEST)
>   }
>
>
I do like the coding suggestion.

- Ayan



