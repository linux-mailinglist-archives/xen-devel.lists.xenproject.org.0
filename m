Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9822668C6B2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 20:22:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490698.759511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP73e-0004vI-MF; Mon, 06 Feb 2023 19:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490698.759511; Mon, 06 Feb 2023 19:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP73e-0004ta-J1; Mon, 06 Feb 2023 19:21:42 +0000
Received: by outflank-mailman (input) for mailman id 490698;
 Mon, 06 Feb 2023 19:21:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJHC=6C=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pP73d-0004tU-E8
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 19:21:41 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79d7c36c-a653-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 20:21:39 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA1PR12MB6210.namprd12.prod.outlook.com (2603:10b6:208:3e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Mon, 6 Feb
 2023 19:21:34 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6064.032; Mon, 6 Feb 2023
 19:21:34 +0000
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
X-Inumbo-ID: 79d7c36c-a653-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkQgJ0wLdntU9VH1Al87kQfnjmqhG3TqFQJs+9xfnizKT9ETnHuXK8oiPjfDeh9pC8nZDL1i8h2eEBAD4/bq8iR9PjNJCsYUzdshk0hqFUlocSDZYMWmkEn57clcl4WdGyYgbnuKvSlL4XSxWWU4cqHs+SiEG93cGHGyCoBE5vUp8F/gtqyF5nzuthBXB3BFeNuPVAqS7SBs6nGxlCLEmaqw/eO28TcrAdgOQD4s60TrgIKWePta82gaB2MRml8dBDTx/fYxizGjRH1y3RRTrP7cGzmigFePOpLSnJTiBhKPKXXO0/2w3pRlVFg8J8v4xW1IIw3W9jri6MAhi9x9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFMIzuROk4KVY1ZC3vF6DMro9amPOV07A1IIMt8JDpI=;
 b=LACoX2TUMktdVQef8seLjxlTUGgM1yXJ+utwYfVyo9Mblc8PlhinLrFtEE7WtvgB7rTuR+fD9lqyeVIvDpNgadyfbmHmDT261HAx4zTNeWT/TYqc3lIpp5Evtx+9BbuzoyiB4i3OQv6OlRWWlA/xWxqhsngkihU4arXOGuNOBPtWvSWjSgbRFIYV0G1543PXNTor2H2Q897l3EzO6I6bdl5UqL/RaRTHQvV/z+X0+HEKGnn4VFD1HHsaENsuZTNsm2Kg0n2e67ZkKNLV8u/TSjToC7Y9N0Yo1vgsJqnwBOVUertKvK/VyXGOXVLWaMUqFr6i+/8QPaZjo0o30nRRUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFMIzuROk4KVY1ZC3vF6DMro9amPOV07A1IIMt8JDpI=;
 b=t1sj3d5Ba2MAv25XkXpXF0JlWfFakQ2i9r2A9q4pTNpmJBGYTFB1lUlL9n5hnOnvuBNPr/bskRRlF3B8l1DrBvl/wHF0Oitu795NJmGZClbeTgVENQkPGIRYRRYUQGqWMch76jpPRdBQG9t/cPF3YCPnKNaNkqBKW/BYeVfWYJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8144403d-0899-5b25-f1b0-f798d4b371a6@amd.com>
Date: Mon, 6 Feb 2023 19:21:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for
 address/size
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 julien@xen.org, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-6-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191522170.731018@ubuntu-linux-20-04-desktop>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2301191522170.731018@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0154.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::11) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA1PR12MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ccd8dd-54b2-4c68-48b1-08db08775c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cN/Ctfw6/q92zU5cuvlZYKpJ58/FZpm32HCxctpU1cr3OOxFJxgxAyF6BzYswqRh+WDF/D0Nxv8wMLcb5xLna3kPEweCRizv7W0Q7OBXQzcyRipA872D8PAbAE4mf41R68FPAUIlo1Evf93dNFUollO5C0wnIf08YkOA3atYsXlMCSL6InAUAgPIaAX7CPQEdx2hYnAheCU086V3cs+13YjSZpaKkxUY2WUBqLu2kbqvrAbeQrt2MJQOcDvsL3UAMMd0kuOjBltLuH6rvtbvTjiVUJS3/a6zxsfrgEPtNaszhHHU2vA4w2oFkCMbBU+Dv/q2xQBmCQFVk0Su7grXSeDdntJnlrO6Q6Oi+lgARlplgVp6xvLhGfr5SpCZ9CRJlc8N1u435G8igU/WkhTOY7+GZBpGdixnOZs3XN8z0i6uiBT+PjIR+2Ena757AIcwyDQsOHgGdlgq7lzS0yTjtGF0jCpDuddqQTajUuCgWA4f8vqUIqxPwNOe4X5XkNx3OU43nr6omRxyzIfiMgmBx8Bi/DTLA9nJjJP3GMI/SqWMDOaUaROXHVX0p+ZGAlgU7rHrwVp5c+StPltnzY6+OffCStu1hYXxMW/YVpCKNWmJDU7Fd5fhyn62vBV+49fg/ua6FALORI4OLh8lnWx0mzs7YhPxoE45rImeVG5RImgsRBIE2LCXwlfTZJmKT4DJds1jVFGBQQgsws9tfpPQ7vvGCiMH2uXnV0ZNfv2M0fY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199018)(66476007)(66556008)(8676002)(66946007)(8936002)(41300700001)(4326008)(31686004)(316002)(110136005)(83380400001)(6636002)(5660300002)(2906002)(36756003)(6666004)(6486002)(31696002)(478600001)(26005)(2616005)(53546011)(6506007)(6512007)(186003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEQyTC9FVmJaZ1Y4cC9jcVpkSWROSnVjaFdsZGpOVnpQN0RZYkRMU0tHanJv?=
 =?utf-8?B?cThlQnhNV2RvdnpxaG9Nc0dJOFJ0RVZnVnFZTTVFRU9sc3lHeHhQa0k2MVQ3?=
 =?utf-8?B?aUdteEo4d1BEc2lnbkVQeGsxVGFCNUhVWkQ4YitERVJRVmRMdXo2Tzl4Rngy?=
 =?utf-8?B?RGwyTmI5c1NNYmI0bkFZNW01dEs1cGhoRmJuUTd3Y3ZKRXJLalJUczczTThE?=
 =?utf-8?B?SUFubHUvM2FWVlpQcEswU1VGanRXNEVUaU01SDZ2bDRDVyt6NXhLdU9ybmVN?=
 =?utf-8?B?Y09KMG5oS3BRV285dlQxaElVWU1rSzhHYXRLVDhmK3AycUZqSlI5Si8rV2d5?=
 =?utf-8?B?OHdRcnQ4d1FZRzhlcG81SWp6OWwxYUlnTGoydnhxN2M1czdGejBzMXdPczhm?=
 =?utf-8?B?NTh6RzlUeHA3M21FS0xrdFRXM2dlK1ljRFJhWEo4b2lRUW1lQnEzVGpBSG5j?=
 =?utf-8?B?M042Z01rcGZsTXF6aE5XQ2NDQ2dubWcxbFl0V3JQSFBPRlFkdGZUK1NMTU9a?=
 =?utf-8?B?djZIM1l2cDV4VzBnNTVVK21lL0NMZDM5QS8wY3F2RTlNTWdVVEJteXBSaHdw?=
 =?utf-8?B?TTg4VzM2d3l3WHJIV3BMVXQ2SzlwQUF0L2RzYkdBcm01bUNEQnB0OHRkbnVv?=
 =?utf-8?B?Nk1rZU42Z29OTzdHUDE5S0FPNUl0WVpxZTViZUg3b2VRZTdEWkV4eGpYZXUy?=
 =?utf-8?B?TUtqbnJXTE91TndKUU5EcnB2REZxMnVncWtFOENCTkRQTHBKVk5DQ0JzRmpn?=
 =?utf-8?B?TnNaZ2RONzFhNkZKd2VkYVF5U3VXRzRROXF4TVJXZkRHbjc1cVhLc2dKWlVs?=
 =?utf-8?B?c3ZIdmI0MGdvZUhYc211Z0Q0N3h4SGFWa2cyT3hXeHd5aVc4NHNEYmZFTDVx?=
 =?utf-8?B?NHlxTzVkTUMrUkp3a0paR05HcXppZS9WbHRXU3RUekVoWnp0cHhzcTlibng1?=
 =?utf-8?B?OEhlUnJxTTVkWHNvWThGODZmaDdldUtwSityNVZIMmRYdlVCMWRTWkVXS294?=
 =?utf-8?B?a3ZZYXQvZnRxbEVka3JldFMxWWhyMHJuazAwYnRjUDNESFpMWlhLQS9WeUxy?=
 =?utf-8?B?MVB5M2VSYXdDWWk2ODJQeEY5UlV1cVRhR3EvV2tnL2lLUlZsY2hIWmphNEYv?=
 =?utf-8?B?Z1ZncE5tdG1oK3ozS0Q2a0JRcGlPK2oyQVhtWFNoSXI3Ym9vN3NJRXhURDJ5?=
 =?utf-8?B?dTlMdzdKOHl3ZjlMeDhrdGl1Ni9LMmJLS3YyakMxWDBKNDhDQklJcmN6cUYr?=
 =?utf-8?B?ZFFGcVhxUXBNWU5GVEd0K3dQeFFaQ3JZNmN3ZDNGMUVMbmw4U3o4M2ZPRFlQ?=
 =?utf-8?B?aWowd2VuRWpPSldRaGV3OU5qaVVPeFZacXFPdXRaazVxdENEYzFURnFUQ0Yx?=
 =?utf-8?B?WkV3b0cxS3pWZlpWa08vVE5aaFlTN2JWcnhPTlJjUVlwYWZNYTJ6UnJydTdR?=
 =?utf-8?B?YWwzZ1lVaHBqdkUzN1dBWmtZS2taRXZCb1BORjZLRlVzVkhjMFRaV1ovb1BX?=
 =?utf-8?B?bXUvTm5DcEFVRmszKzc3ZXYxSlRoTmpFQUQ0emFBN2ZsSEgvV1JDcFY5d0RC?=
 =?utf-8?B?cC9YdHdZYUwvV0h2ZHJzN1kzUzNmd1FDbm5xc0J6SWlPR2NIREM0eVVSL01L?=
 =?utf-8?B?U1cxR0RkQUtJREN5UmMvK2ZaYURZcW9MOHFHMFZ6T1F1MW53WHRaRTlaMUZh?=
 =?utf-8?B?UUx4OUczZFNOUEs1Qm9uc0VDc2lVT3FoenM4NjlyRjVXaHAxd2RjMEUwQmoz?=
 =?utf-8?B?SC8yL3BVaGtMNGlpOXBrZXZvYnFRdnVZejY1YmRtY014K3FYQXUrRExoTVJR?=
 =?utf-8?B?SFdmdVh4OFBjMStXbEdIU3J0b3d4NG1JT2RtemwrMlFudklNRnMyMDVrVlhu?=
 =?utf-8?B?VTV5N2RqMGIyMWcyY2FReFN3ZjVCY0tIU0c2MlZHNG42UENsWGxmek9OY3NC?=
 =?utf-8?B?ZkNodk90S0djRTNXMktadG1DU1pOLzhmRG1IaG9UTkxLNVdSUiswWjlWYUMz?=
 =?utf-8?B?Qk04ODBFYldUYkxVOHZRbEg2OFZwaWtTc1NKaktlRGhkQnowUXFuazJKY2Fp?=
 =?utf-8?B?T0tLTndib1QrNU9SbGdTTmZlMTUrR3g2NW51STFWcUIxT0MwUGlrekZzdTl6?=
 =?utf-8?Q?t7gO8p2DQeSTAEWBCp6Cju1Kw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ccd8dd-54b2-4c68-48b1-08db08775c2c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 19:21:34.5624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXkD7di2VU7VtV1lCMSszvajmVtqOgr1MBQ0uJAwKSodYritOJwL6NX6FAIWrSxssUtEIfiXNAhRzOo9oJWSKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6210

Hi Stefano,

On 19/01/2023 23:24, Stefano Stabellini wrote:
> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>> One should now be able to use 'paddr_t' to represent address and size.
>> Consequently, one should use 'PRIpaddr' as a format specifier for paddr_t.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from -
>>
>> v1 - 1. Rebased the patch.
>>
>>   xen/arch/arm/domain_build.c        |  9 +++++----
>>   xen/arch/arm/gic-v3.c              |  2 +-
>>   xen/arch/arm/platforms/exynos5.c   | 26 +++++++++++++-------------
>>   xen/drivers/char/exynos4210-uart.c |  2 +-
>>   xen/drivers/char/ns16550.c         |  8 ++++----
>>   xen/drivers/char/omap-uart.c       |  2 +-
>>   xen/drivers/char/pl011.c           |  4 ++--
>>   xen/drivers/char/scif-uart.c       |  2 +-
>>   xen/drivers/passthrough/arm/smmu.c |  6 +++---
>>   9 files changed, 31 insertions(+), 30 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 72b9afbb4c..cf8ae37a14 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1666,7 +1666,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>>       dt_for_each_device_node( dt_host, np )
>>       {
>>           unsigned int naddr;
>> -        u64 addr, size;
>> +        paddr_t addr, size;
>>   
>>           naddr = dt_number_of_address(np);
>>   
>> @@ -2445,7 +2445,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>>       unsigned int naddr;
>>       unsigned int i;
>>       int res;
>> -    u64 addr, size;
>> +    paddr_t addr, size;
>>       bool own_device = !dt_device_for_passthrough(dev);
>>       /*
>>        * We want to avoid mapping the MMIO in dom0 for the following cases:
>> @@ -2941,9 +2941,10 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>>           if ( res )
>>           {
>>               printk(XENLOG_ERR "Unable to permit to dom%d access to"
>> -                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
>> +                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
>>                      kinfo->d->domain_id,
>> -                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
>> +                   (paddr_t) (mstart & PAGE_MASK),
>> +                   (paddr_t) (PAGE_ALIGN(mstart + size) - 1));
> Why do you need the casts here? mstart is already defined as paddr_t

Actually, this is because the PAGE_MASK is defined as 'long'. See 
xen/include/xen/page-size.h :-

#define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
#define PAGE_MASK           (~(PAGE_SIZE-1))

So, the resultant type inferred is 'long unsigned int'. Thus, we need to 
add an explicit cast.

- Ayan

>
>
>>               return res;
>>           }
>>   
>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index bb59ea94cd..391dfa53d7 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -1393,7 +1393,7 @@ static void __init gicv3_dt_init(void)
>>   
>>       for ( i = 0; i < gicv3.rdist_count; i++ )
>>       {
>> -        uint64_t rdist_base, rdist_size;
>> +        paddr_t rdist_base, rdist_size;
>>   
>>           res = dt_device_get_address(node, 1 + i, &rdist_base, &rdist_size);
>>           if ( res )
>> diff --git a/xen/arch/arm/platforms/exynos5.c b/xen/arch/arm/platforms/exynos5.c
>> index 6560507092..f79fad9957 100644
>> --- a/xen/arch/arm/platforms/exynos5.c
>> +++ b/xen/arch/arm/platforms/exynos5.c
>> @@ -42,8 +42,8 @@ static int exynos5_init_time(void)
>>       void __iomem *mct;
>>       int rc;
>>       struct dt_device_node *node;
>> -    u64 mct_base_addr;
>> -    u64 size;
>> +    paddr_t mct_base_addr;
>> +    paddr_t size;
>>   
>>       node = dt_find_compatible_node(NULL, NULL, "samsung,exynos4210-mct");
>>       if ( !node )
>> @@ -59,7 +59,7 @@ static int exynos5_init_time(void)
>>           return -ENXIO;
>>       }
>>   
>> -    dprintk(XENLOG_INFO, "mct_base_addr: %016llx size: %016llx\n",
>> +    dprintk(XENLOG_INFO, "mct_base_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"\n",
>>               mct_base_addr, size);
>>   
>>       mct = ioremap_nocache(mct_base_addr, size);
>> @@ -97,9 +97,9 @@ static int __init exynos5_smp_init(void)
>>       struct dt_device_node *node;
>>       void __iomem *sysram;
>>       char *compatible;
>> -    u64 sysram_addr;
>> -    u64 size;
>> -    u64 sysram_offset;
>> +    paddr_t sysram_addr;
>> +    paddr_t size;
>> +    paddr_t sysram_offset;
>>       int rc;
>>   
>>       node = dt_find_compatible_node(NULL, NULL, "samsung,secure-firmware");
>> @@ -131,7 +131,7 @@ static int __init exynos5_smp_init(void)
>>           dprintk(XENLOG_ERR, "Error in %s\n", compatible);
>>           return -ENXIO;
>>       }
>> -    dprintk(XENLOG_INFO, "sysram_addr: %016llx size: %016llx offset: %016llx\n",
>> +    dprintk(XENLOG_INFO,"sysram_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"offset: 0x%"PRIpaddr"\n",
>>               sysram_addr, size, sysram_offset);
>>   
>>       sysram = ioremap_nocache(sysram_addr, size);
>> @@ -189,7 +189,7 @@ static int exynos5_cpu_power_up(void __iomem *power, int cpu)
>>       return 0;
>>   }
>>   
>> -static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
>> +static int exynos5_get_pmu_baseandsize(paddr_t *power_base_addr, paddr_t *size)
>>   {
>>       struct dt_device_node *node;
>>       int rc;
>> @@ -215,7 +215,7 @@ static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
>>           return -ENXIO;
>>       }
>>   
>> -    dprintk(XENLOG_DEBUG, "power_base_addr: %016llx size: %016llx\n",
>> +    dprintk(XENLOG_DEBUG, "power_base_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"\n",
>>               *power_base_addr, *size);
>>   
>>       return 0;
>> @@ -223,8 +223,8 @@ static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
>>   
>>   static int exynos5_cpu_up(int cpu)
>>   {
>> -    u64 power_base_addr;
>> -    u64 size;
>> +    paddr_t power_base_addr;
>> +    paddr_t size;
>>       void __iomem *power;
>>       int rc;
>>   
>> @@ -256,8 +256,8 @@ static int exynos5_cpu_up(int cpu)
>>   
>>   static void exynos5_reset(void)
>>   {
>> -    u64 power_base_addr;
>> -    u64 size;
>> +    paddr_t power_base_addr;
>> +    paddr_t size;
>>       void __iomem *pmu;
>>       int rc;
>>   
>> diff --git a/xen/drivers/char/exynos4210-uart.c b/xen/drivers/char/exynos4210-uart.c
>> index 43aaf02e18..32cc8c78b5 100644
>> --- a/xen/drivers/char/exynos4210-uart.c
>> +++ b/xen/drivers/char/exynos4210-uart.c
>> @@ -303,7 +303,7 @@ static int __init exynos4210_uart_init(struct dt_device_node *dev,
>>       const char *config = data;
>>       struct exynos4210_uart *uart;
>>       int res;
>> -    u64 addr, size;
>> +    paddr_t addr, size;
>>   
>>       if ( strcmp(config, "") )
>>           printk("WARNING: UART configuration is not supported\n");
>> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
>> index 58d0ccd889..8ef895a2bb 100644
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -42,8 +42,8 @@
>>   
>>   static struct ns16550 {
>>       int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
>> -    u64 io_base;   /* I/O port or memory-mapped I/O address. */
>> -    u64 io_size;
>> +    paddr_t io_base;   /* I/O port or memory-mapped I/O address. */
>> +    paddr_t io_size;
>>       int reg_shift; /* Bits to shift register offset by */
>>       int reg_width; /* Size of access to use, the registers
>>                       * themselves are still bytes */
>> @@ -1166,7 +1166,7 @@ static const struct ns16550_config __initconst uart_config[] =
>>   static int __init
>>   pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>   {
>> -    u64 orig_base = uart->io_base;
>> +    paddr_t orig_base = uart->io_base;
>>       unsigned int b, d, f, nextf, i;
>>   
>>       /* NB. Start at bus 1 to avoid AMT: a plug-in card cannot be on bus 0. */
>> @@ -1259,7 +1259,7 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>                       else
>>                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
>>   
>> -                    uart->io_base = ((u64)bar_64 << 32) |
>> +                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
>>                                       (bar & PCI_BASE_ADDRESS_MEM_MASK);
>>                   }
>>                   /* IO based */
>> diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
>> index d6a5d59aa2..3b53e1909a 100644
>> --- a/xen/drivers/char/omap-uart.c
>> +++ b/xen/drivers/char/omap-uart.c
>> @@ -324,7 +324,7 @@ static int __init omap_uart_init(struct dt_device_node *dev,
>>       struct omap_uart *uart;
>>       u32 clkspec;
>>       int res;
>> -    u64 addr, size;
>> +    paddr_t addr, size;
>>   
>>       if ( strcmp(config, "") )
>>           printk("WARNING: UART configuration is not supported\n");
>> diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
>> index be67242bc0..256ec11e3f 100644
>> --- a/xen/drivers/char/pl011.c
>> +++ b/xen/drivers/char/pl011.c
>> @@ -222,7 +222,7 @@ static struct uart_driver __read_mostly pl011_driver = {
>>       .vuart_info   = pl011_vuart,
>>   };
>>   
>> -static int __init pl011_uart_init(int irq, u64 addr, u64 size, bool sbsa)
>> +static int __init pl011_uart_init(int irq, paddr_t addr, paddr_t size, bool sbsa)
>>   {
>>       struct pl011 *uart;
>>   
>> @@ -258,7 +258,7 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
>>   {
>>       const char *config = data;
>>       int res;
>> -    u64 addr, size;
>> +    paddr_t addr, size;
>>   
>>       if ( strcmp(config, "") )
>>       {
>> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
>> index 2fccafe340..b425881d06 100644
>> --- a/xen/drivers/char/scif-uart.c
>> +++ b/xen/drivers/char/scif-uart.c
>> @@ -311,7 +311,7 @@ static int __init scif_uart_init(struct dt_device_node *dev,
>>       const char *config = data;
>>       struct scif_uart *uart;
>>       int res;
>> -    u64 addr, size;
>> +    paddr_t addr, size;
>>   
>>       if ( strcmp(config, "") )
>>           printk("WARNING: UART configuration is not supported\n");
>> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
>> index 0a514821b3..490d253d44 100644
>> --- a/xen/drivers/passthrough/arm/smmu.c
>> +++ b/xen/drivers/passthrough/arm/smmu.c
>> @@ -73,8 +73,8 @@
>>   /* Xen: Helpers to get device MMIO and IRQs */
>>   struct resource
>>   {
>> -	u64 addr;
>> -	u64 size;
>> +	paddr_t addr;
>> +	paddr_t size;
>>   	unsigned int type;
>>   };
>>   
>> @@ -169,7 +169,7 @@ static void __iomem *devm_ioremap_resource(struct device *dev,
>>   	ptr = ioremap_nocache(res->addr, res->size);
>>   	if (!ptr) {
>>   		dev_err(dev,
>> -			"ioremap failed (addr 0x%"PRIx64" size 0x%"PRIx64")\n",
>> +			"ioremap failed (addr 0x%"PRIpaddr" size 0x%"PRIpaddr")\n",
>>   			res->addr, res->size);
>>   		return ERR_PTR(-ENOMEM);
>>   	}
>> -- 
>> 2.17.1
>>

