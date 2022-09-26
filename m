Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61FB5E9C36
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 10:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411487.654430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocjfO-0006T6-Ku; Mon, 26 Sep 2022 08:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411487.654430; Mon, 26 Sep 2022 08:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocjfO-0006QK-HL; Mon, 26 Sep 2022 08:40:42 +0000
Received: by outflank-mailman (input) for mailman id 411487;
 Mon, 26 Sep 2022 08:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5U7=Z5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ocjfN-0006QE-9Y
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 08:40:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e573ca00-3d76-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 10:40:39 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CO6PR12MB5441.namprd12.prod.outlook.com (2603:10b6:303:13b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 08:40:36 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 08:40:36 +0000
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
X-Inumbo-ID: e573ca00-3d76-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyKA7S9l3p+Jvj6hdpV9KJjaKiMH+WXABQAt/+0cfOFp7xY8QKqABO08Pmo5nfH5SdjduyMAqZcsz7oPFh/xo5V+o1McawejbwQH6rvKzLP1bBj8opj/EtR5C/Qw91HzKLwnrj2pfb1XowY7DuCu1xNzlBY5lPTiwIF/1oI4IFUA43vYRJGu/AxArgjoc2BIH4YYZjYk6PzBZ1pof5JbQ1bo1C7AfjOLiUxI4M7oFkbY38/2++C1psLqVocJW0bpofMrCOPzOqnkA+rQ+yMWwP7YHp1otwRFZ1Jf1H54E+tSiHQIC1mN5UmnMKoWJgjLq3LvFt4nWXlKAPNsDcE1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6oxB1QN6CCqPGKi84u4N+pEruVVtZFmB1mmYLrlZP0=;
 b=bQoOhB7j4zu2ZgsxqgCGiuhqODbNsOTHvvkyMxg2GIhEZwwYxBp7WONTEm8TMnlGJY8IFsKicvOuj5FQozol8iQX9G2j1rfK1E40Tz+uCOJ78ZzjxhEQ1/lh4N+0QrL8+UlmXY+XvehUDsEV1wTiXEcWh0usOyBdTM9lYKuoNT5uP76TkhrvdlVHcDqQUHCuMV0Gc0sl3fdvLgZxk6b0dg484J/qxUnNrbL7pMx1q+7z6TL1ewJCJjoqu7IprrCQAYhGPPFRLiijZS8/CJUB2CLruV7iZwYy9107UBDibuEbtW4xQuQ15920GaqMCmlxXdtpL2JYMrfo0yEqDbViUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6oxB1QN6CCqPGKi84u4N+pEruVVtZFmB1mmYLrlZP0=;
 b=cqbjuFDlyOcNvT//oNEEaPL+PAXZtnFtKfwoJcmv6NDLUfeqOiOF9yAohbJ4LNuDe2iGhw1eGBS80IXjCpDUucB7skl+KBoY140sCv04qUEtl3ts5aSj5RSBzwHIsXII18/wJHgn0x+EekuaajipxSbx16cVyoXBu7y8AdhDloQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b4bef6a9-4984-41b5-e62e-65523cdc921d@amd.com>
Date: Mon, 26 Sep 2022 09:40:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] xen/arm: fix booting ACPI based system after static
 evtchn series
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <cover.1663928523.git.rahul.singh@arm.com>
 <0c53abc972264b0ea13864b7056fa2149cd78f9f.1663928523.git.rahul.singh@arm.com>
 <000f22e5-1628-a937-0871-44ed498e1b26@amd.com>
 <63b9a66f-6ee5-819a-5e37-33eaa8418986@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <63b9a66f-6ee5-819a-5e37-33eaa8418986@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0303.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::20) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CO6PR12MB5441:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ffc70f-b8f6-468b-6253-08da9f9ac80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qy9NZcnXlNme8LOSS+Qc0NO6ZIj9zrOFdlCsm9B8RVvregIy+mB6aPn2MOEKPUZlFzTxVYOIFV858ARzc7m0Y+FIYXmfOoT8thFzYqD+8DPvNnl3xqNqnJlRyGSLwRBpU1EJhC9JjowZXiWoryCaIzTc5lARKlGlpR0AcsGNmGyYxNsyT8LMdzxLFR38cZ4vU+u2QfeoV4dZ0OKUKVrvvTe97X2Y/oK134c2q55XAvGpocfqKq1E3QvNAyc8wVWpze462Rp+H9Rt2S0dl2WSljhC8NdrGKKmYT4VWQrG53+QGSluCAxCZTDpGpCvIHptGfTFEBQAMyzsBndQ/ZJLbj6Hh2NSO+wiS3xknQC83yYAxM+/qvXYGmEHG9m16p4zhnHC4ISyrnSBtB/aEBr9wp7G30r5KDtOfcBov5iFYrgD568SiU3lMAhbcwFN0O5ayZvaKA/c1E1DUJ1G6nClBGqMJbg7Ypl2aOss45M3DvRO8HnAyv694KlmxCO4NXgv2ixsktEP2lVfoKDF3Yzl084sy1tjmr/LpjejcZDbAxCgnfL4GIq8hXMrszxKbOsAk6mTHWWpcRWwDTHQK8tg/0Jr/35mYxHsSRnbbGWZ1jliUJvkiAxWrL0YmtyUjeCTnz+GxGL+fKYFaBLxf/GPq2TkR1WtVg0wbJ+UAF7PlxGzlg9wSlDYd/Qkgg2g7KI+5LSdgNqyM4ZxeyisNXiuEgrUDiJyZ8Kr5eHB4vfvXMwyTd7cfg77hsIDvXm5x0bVEFL5ycp+h3syxnzdZxh6p/hFeLZ06WkC/12HGocnjrY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199015)(2616005)(83380400001)(186003)(38100700002)(5660300002)(6506007)(2906002)(8936002)(53546011)(478600001)(6486002)(41300700001)(26005)(6666004)(6512007)(4326008)(66556008)(8676002)(66946007)(316002)(66476007)(4744005)(6916009)(54906003)(36756003)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cCtWc2hXSnVIS3VHejVOaEdMTUw2aFR5RHZSNmZZcTZnVldhNHlqYkE2K0RM?=
 =?utf-8?B?Z05EMXVPZ3lXRVBLbEFMYklzQXdGY1p4UE9OTWRjdEwrSU1BSlhjVVQyMnA2?=
 =?utf-8?B?SU4rRXorS3pvN01IbWtvM3FlR1RDU0tCMXVUaGNOSkxHckFQVFUySnQ4Yllm?=
 =?utf-8?B?VzE1MkZZSFNleWVPNGo3dnBpdmlkZFk0aCtJYVA5R2NHdEFoNXRVNENHSXFk?=
 =?utf-8?B?VG56N21VaDRsazNOaXkzVjlqZUtBbndtZm9hOEVqTHYveldmd1gvcVorOVVI?=
 =?utf-8?B?WUNtRGlVRjkwRHBTOWRxNmFDTDhLNTVNVjhORlRNSXBuS0VuWnJzK2hJdGRw?=
 =?utf-8?B?SzN5citRK0NqOFUvRWVqMVY1a2p3UDN4K2Z0UEVTdHo4b0hWdlJsT0hOeHJp?=
 =?utf-8?B?dHg4TlB4dWwzckkxUThUSHJjVHluOGZ1VS95M25wck9XQ21taXNydkttdHF4?=
 =?utf-8?B?ZnNodnpNaVBTckxvVUoxbmFzU1MrdWpNb0VKcHdVb3JoTkd2Y1M5Z1I4RDZu?=
 =?utf-8?B?ZG1sTHlDUzJqOXNGODMxNWl5LzVHR2haVnFJSmZablcrVlF4NWlKb3UvdkVz?=
 =?utf-8?B?M2N4b29HbCtCWTdhNmh0aVJ2OEhRTTlRb0FkOEVsbTQvTlY2QWVzbFY5cmtD?=
 =?utf-8?B?NVVSa3dNUUdvY1lLay9YQTdtTUhzcGMvSE02OVRPdVZXQnltZjRLY3dFanBB?=
 =?utf-8?B?WGNURndQQi9vdlBsb0lFc2kzdjR6WXN2TEZzZ0VOSzIxNG5saHIyMmFvdnRY?=
 =?utf-8?B?a1N1M3ZOTGJTcEdlRmNvU1ZqVkw1WFZIakt0SVFUdkVNWjAxaDdOMTVrMUdu?=
 =?utf-8?B?YlpWckNvVWdLamVmbTJrQk1YOTE2MXVBNlllVWdreTdoaEFXek14NWhtQ3Vn?=
 =?utf-8?B?SmVrRHRXRTVVbFd2N3JRY28vTXlwWXhkSWRSSGdySFIvaEo3UFlPQ25JS3BM?=
 =?utf-8?B?S2hMZys5a29lWHdmcWxJeHNhTzJ0L0FEVDNsOU9USFJ5NzBTS0VQa1NzOXpa?=
 =?utf-8?B?UnZSV2tDZlBEZDFtblpPREIyRlNoU0JyMUpIeU56RjlEVUpzSHluTzdLWDVF?=
 =?utf-8?B?UmtpNHNHS3IzOXBBQnFIdUNxb2NqN283elIrRTl5bS95Q0pHYWt6bEZWZWIy?=
 =?utf-8?B?bFd3aVg3MkZtYXQvM052c2F3eHRHUGFYM1lnenZtMmFETWZvMjQwVldoU3JI?=
 =?utf-8?B?SUhkTW9lekhORHZTYWZsNUNhTmhjQ08wNlB4TXdZSU5uTlA3eTlCblA5aUhi?=
 =?utf-8?B?TlZKZHZZSXphb0o0amw3NHhrZE42YmJWVkFiY1VOLzArSzllQ0RuN2I3aTJH?=
 =?utf-8?B?ajR2Z2I4dFhQbUpBTnJ0UkFUNFpYSm5DYy9NcE1FaVFmRzFqcHlzYlVCUEdP?=
 =?utf-8?B?ZWpDWnpubzdaa2hCKzFCUWZybTBmSGJ4NE1uR0VzZDljeE83bUdHNThNbTRT?=
 =?utf-8?B?eUJEdlBSQ1BFOVJhVDNuUnZsc2RrYnFURlVrMm1UMEVYc1BhNE01Z0J3WHUv?=
 =?utf-8?B?bVh2dkRRajdSVWpTYVRKeVVGYXZ0b1B3RTZSZE8vQ08ramVJNnE0YnlFaG51?=
 =?utf-8?B?ZUpOOGNJYVJqVEtMWEM3UitURkt4MkhNdGVDTXprQ2c5L0NnWXM4QVdyd2hp?=
 =?utf-8?B?cG4vRldNY01ROFVrc1pzOHNPTUVhS0lPalhubFc4OVhoUUpKZHJ1dXJyVTFu?=
 =?utf-8?B?NjNiMS9qYnVsQUNWNVM3MkRZMWlneW1pWWlFam1WVktjZFlKOUpMR0lJU0VD?=
 =?utf-8?B?SjBZL3hldTVxQWNxaXBmd0Q3L0NZdC9FaTVTcURRV2ZncXhLdWR2b1NFUkhQ?=
 =?utf-8?B?VnVoekl6SXY2Q0czZUxpbHdtMkFpUjJlZjNFTHRzcWw3TWw5a2dJbTByUm0r?=
 =?utf-8?B?V2NNM244Ymlqbm9XOWlVcHVOQk4vSXE2MUo2NXVMRzFMS09ISFpwbUI1RHox?=
 =?utf-8?B?cFhoUzVGanJYb05yOUdRZnFmT3FUN3Z4cjh3VGV1R3FYRlNFdmlDbkdvMHJw?=
 =?utf-8?B?bHFiNXBXUER3cTg3UEpjdDU5WUUrekkxZFVPQm5GSHE2TEhNeDYvUUlkQ0Mw?=
 =?utf-8?B?SFZPUEJXSWNBOXJ3Y2Y3YWFTQlBuOXcydi9uZHZnNVlkZlhZYTBhQi9sSGhM?=
 =?utf-8?Q?KNlJ9wehNFTQw3yoQSjky6iBC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ffc70f-b8f6-468b-6253-08da9f9ac80e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 08:40:35.8543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXDgUV2dUdsSPP/okyr70ZUQ3a91IWxeFUQpdt8Smuke6qt8M4qx41jRjufDybB777gaIKaVPrcRNLlDogm9lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5441


On 26/09/2022 08:38, Jan Beulich wrote:
> On 23.09.2022 14:10, Ayan Kumar Halder wrote:
>> On 23/09/2022 12:02, Rahul Singh wrote:
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -1166,9 +1166,10 @@ void __init start_xen(unsigned long boot_phys_offset,
>>>            printk(XENLOG_INFO "Xen dom0less mode detected\n");
>>>
>>>        if ( acpi_disabled )
>>> +    {
>>>            create_domUs();
>>> -
>>> -    alloc_static_evtchn();
>>> +        alloc_static_evtchn();
>> Can the code in alloc_static_evtchn() be guarded with "#ifndef
>> CONFIG_ACPI ... endif" ?
> This wouldn't help the issue, but at best code size when !CONFIG_ACPI. When
> CONFIG_ACPI=y, acpi_disabled might still be true, and hence the function
> may still need skipping. Apart from this I'd also consider it odd to have
> a non-ACPI function have such an #ifdef ...

I think this makes sense. Also Rahul's previous comments looks 
reasonable to me.

Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>

>
> Jan

