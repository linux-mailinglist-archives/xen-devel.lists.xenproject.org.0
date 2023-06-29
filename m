Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B377428C2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 16:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556870.869714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsss-00017L-BZ; Thu, 29 Jun 2023 14:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556870.869714; Thu, 29 Jun 2023 14:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsss-00014y-8V; Thu, 29 Jun 2023 14:44:34 +0000
Received: by outflank-mailman (input) for mailman id 556870;
 Thu, 29 Jun 2023 14:44:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1sCV=CR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qEssq-00014s-Qu
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 14:44:32 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 745a1a07-168b-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 16:44:31 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN0PR12MB5930.namprd12.prod.outlook.com (2603:10b6:208:37d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 14:44:27 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 14:44:27 +0000
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
X-Inumbo-ID: 745a1a07-168b-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amQez3fQOVBStty5c/TtJPUta0V2S0adQm/6nu7FA8ZjMqcs7Z/Ol6axcz0i+bIIHGxcl9GWcsFVPdUujNcrdph1quGRhw8LLhnPzOnM2yOcxxb7kPaOiEeJeR5KTk/lF7gzpUzRE7a60lLix7UdmDXio1DVUnvJkoP4FgynmnEMmqs2UZz5MlDTlcXeTa0V7CiEFhn8FvHljWfv3Fzd68cuXuzyWS6CBw0e64Uaq/JwFMBBkhk82UOcyB4Ef39VYhpAuuiZFmXEziXi6iU/aKR2Ksb9Yo5y07L65wGc7CpuCDOAS79/Yb5ZHG74F1xlfGQZrVo8eVnC5Dku52TKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cE+fUOLsQb5yMN6+QmJ+ZXjlAG77kHKXhfg7+dgWk0M=;
 b=EoiuuQelawpTQrw7KRtrYlxQ3yO57IBMsRk30EptYEmhAE2HaGzk0EAC8cxbfpDGji/Nrwh7IF79uIwOYicfZ5IzF9fQdhaWK7CtxarW658WtmbPK82e8AQB3oR0Mia7YZiCxuM9nmMQPYv5lfVY87yNxCRL3ZoTRF3EH78K5s4PGqufwEunTrVByIN+dGlh9lOIbKp+smeQ8fNZkiNK0NTSNFeJPXOKC2dsiEBcbQnc5i9j8QNC3vELZLndmn/baJy19wuZjHfG0Bn84RNQsqGqtFUqU8PHPYpXWHHwSbYsSGcauVDkCcyi9uxH606kO/owQGA6wmwH4dXE0d7N9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cE+fUOLsQb5yMN6+QmJ+ZXjlAG77kHKXhfg7+dgWk0M=;
 b=o7tzMTO470Q+qSRI1NKVJG8pjB9dgw0/R+uQJAJz/gJvoNVgK68WhHsj/icpViYxOXwVSqmfS7/1pecXK1kW39LJrAek+E7P3mXWUr1ILEnkTdasogvtDrtXvdas7+ZAUjD9kgnNz0Xsp70MPeLUmkLBrAghrM+k0uVwHlsFk4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e86edf7f-b543-4e9d-746e-2caeec36db79@amd.com>
Date: Thu, 29 Jun 2023 15:44:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 28/52] xen/mpu: plump virt/maddr conversion in MPU
 system
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-29-Penny.Zheng@arm.com>
 <674011bb-b8df-d11e-a322-1827096c1b74@amd.com>
 <2c8387ab-547d-5bdf-5d62-e7a950e5c1de@citrix.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <2c8387ab-547d-5bdf-5d62-e7a950e5c1de@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0035.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::8) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MN0PR12MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: b2b2fc9f-6f7d-41e8-9904-08db78af56af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n+ilIQ5yZ1J9XxxQzRFtvrX3QZzfDf/stsOmzC4uwrh9BKp76zMNHEj079fvRSLbivuV6/HexVMkWDECYx55wEmlGWfKEpY6I85LKR8abyNiyLCQwLk/nnHc9YejdyfCDLeJ/lFntFBAwNSLPCF6BgpZw06yxFQbxHm/n3GzHFkQTFU3XcbCccQtjE6QazRgTyUsmZ3Zdyg/+v6Sadnkcpl4RCXj91jLbfRQwo4ev+DdocMZhkA8071EDXFE4q69VV45MQHIrAkBds1HgNAzXxLB2vKAXSXiL4n5PxpFjCeGlfBv0DBVSIyMvH4zaJR025iJkoiu6i1JIxGctXJJ+O5SnRg4q4qIfTJ6ENk45DVmjOe54mGEY3YxWlnJkzk4wzL5/Ov1PI0rVWgupFwKRbvydjiIRIrVrTnrgvcBu6E34RQNET62sDUuOwTq5O8069P9jmgAgPAu+HBdfnzFHkzq5n8E8+OB7hqN82yiLdM+rwZ6xZwwaS6LywmkoMTO5kQdm8YNpvIUFT+W9I0USPESB4cmEznyKi9H3+o6VUbXpOjHehGtAR463aKEWG7toEdZy10OdeGXLZ5nLX+bRmU9z8GvCjpg4zLgY2aBbCbxJO8aVuOPifJEe48jSpkbvsm6O2vg5F3CrkFQ8Mnb1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199021)(38100700002)(31696002)(53546011)(6506007)(6512007)(5660300002)(66556008)(66476007)(66946007)(2616005)(186003)(26005)(478600001)(2906002)(54906003)(110136005)(8676002)(4326008)(316002)(966005)(8936002)(6486002)(6666004)(41300700001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkpudHhhMFFzVnNmeXZvOVdxYWVsUWNWWVRhTEN3NG8rYkhDa0tDa3ZvY1p2?=
 =?utf-8?B?REtOdk12NVMzWFk2MUt5L01rancvK3AvSERoR3IzaFBIaHpwL1BYM2R0cjll?=
 =?utf-8?B?T0ZjS3AxRnpyUU1YemJQZTAxeXBCaHJ1QXZUaGtCQWZXYnpNUWVxWHBtaFg4?=
 =?utf-8?B?cjJ0N1d5T0VlZ0IxZmszL1AxSzJ0UWRuSHk1cUw1Sit4eXg4b2VJZFgrdkVL?=
 =?utf-8?B?cEx6MFVYTHg4VlRJSzFYK3JwZkdrTmlZL1pxV29NSVVYNXVwYWVKeEd6T1JG?=
 =?utf-8?B?dkdMaHlSMWRnYVJOK1A4bUR6WHViOWQrNEkrUDNlSE1PMEV2YXhtZ3pCYUoy?=
 =?utf-8?B?TVc5eHh0cDNkU25EQ0xqUnlWVmw1cTEvSE9TVTVOeE1Mek9pM1NBR1JwQ3Q0?=
 =?utf-8?B?YlM1YTg1Z1pUQUpBR01yVU9INEgwc3Nyckd3SGJjUzV6S0RZaU5WRVlJdm1a?=
 =?utf-8?B?aU81NStHaXhLSm96U3RrOGxxUlJJRFVFVW8rWFVnRnRnWjRtazZKV3VJMGxr?=
 =?utf-8?B?U1ZYeCtGNUZKV0tpclliTXZDNWNHdjdtTTBaWlNia0YvTU5DcExXZWNoQWtV?=
 =?utf-8?B?VFpoTExiQlRhd0JWT0R5dDZXcWhPU2tjK2d1ZXRnbEsveGNKZUY3dzNrUDg4?=
 =?utf-8?B?VHdtUEUwbjBMTnZWNTJBUGRjUlB2Sk1Qam9Jc0NtWUZpNGRaS2g1dkI5eGkz?=
 =?utf-8?B?ODBNQ3VuYlc1aHNoUERYK1lyakhrYWZTaWlGZHhiNEd5U0VNWFQwdlBmb3g2?=
 =?utf-8?B?UHI0elk2YlQwSm9JMld3YWVqdWtzcnFyL0xSVE80NTl5VUpEWnZBVnZiR0dN?=
 =?utf-8?B?RXZGelVYNVlSTWJDTUt5b3Z1Tzh5U3U4N3JtMnZxWGIzTFNZNGZQSEtrV2lU?=
 =?utf-8?B?aVFaWXc0ZDE0ZU5WeEpkYVJiUU44b0Z6cE1UWXZrU0UyLzZFd2dRRVRrTE0z?=
 =?utf-8?B?NmZTWlE0ZmRHSVFUcUNBYzVPOTdmeHVsVEdqUy84N1dNSkdKZzY0bU0wV3g0?=
 =?utf-8?B?cUtvZlV5WlE3alY1eEQ1VVVCem96alhmcVM0eWpRL0x3SDlheG1pYlZBRmFj?=
 =?utf-8?B?SFRxUE5xaVQ1Si94NFA1Uy90V3BlVGo1K2tEOGdHKzQzN3BROWg2ZGFjdjds?=
 =?utf-8?B?bUZLMEVsQVc2bFByZWhCNDhxTkR1SmNnNCs2SWRXWm1kWjQ2SHM3QWtSSHRN?=
 =?utf-8?B?ZHY3RFFaeFM5MHp3bXFqU2JqempEUzBrblNBLzgxanNOL1h6c09HWElwYlc3?=
 =?utf-8?B?WFJyOFdEZUVkUDBJOUI5aUVzV2NvSm1MV0hkQ05zdytTNzFLNEZ2Z0RLdDBC?=
 =?utf-8?B?bU9WS3ZxcElqRWpzNC8vOXBDallTUktXQ1FqWE9FVFpTVktmT0xmNXNjYk5I?=
 =?utf-8?B?M3BHVTUzaWJCbnpLK0xpOEJkL0twM3BRcWE4blFMRkJWaW1RU1Nzd3Y2Ym1z?=
 =?utf-8?B?VXpCenAxMUZmKzIyMXhNV09MYzhBMHNlbVZ5YmhtMThuMmFwY1A2dVpQRGhR?=
 =?utf-8?B?UWtwb3ZCTDlVUm13bmJndHY3dGhSUThOUUVpUEdmRkh5RHVqOWtNajJPeVhP?=
 =?utf-8?B?OWo4M1Z0bEthdTVVVkFBNVoxNjVEMkpVbVFUU3l0ZmhRUkRxRUZNdW11dDk3?=
 =?utf-8?B?TDdmdENyY1IyTDdnN1ZYdjRxOERqN1FFRHRZOWdLbEIrUktEamoyM1hRdVhv?=
 =?utf-8?B?ekYzdWtpakRiS0FIbld3MzlYQVUwOXFPNDdMYlNnY2xuZ2JqUzBCMHFRQmVu?=
 =?utf-8?B?dWwvbXhpRWRIL28zaXJhZWppY2IxTCtyMFJxM2pxcmJwV1RjOGJiMEZYSU9a?=
 =?utf-8?B?QkNySTdUcVRoVWVmQVJXRFh4ZEQxaC9kcSt2dSswRlRQOWp2K0h1eVdNZFB1?=
 =?utf-8?B?bC9XdWUvNXpoM1BnZkQrRFpuZW1FRmQ1V0o4TlJYSG03QmdQcUpVdUYxTDYz?=
 =?utf-8?B?YUhhdDlnSHlQNStCcWV5Um83TUllaXZ4YkF6bGdRQTBKbVUwNm96YUNBOEVq?=
 =?utf-8?B?MjAxNjdNZTJKUVkrTHBVbzlPL3I5UUE1TjBBdnZqN3lBSVJZSFdEVlVjYmJB?=
 =?utf-8?B?dlNoNUVBMmY3cXgvUjNQb2NSNVlkcm9lV05sSDFIcXh3RlRqaG9UOG9VUDBo?=
 =?utf-8?Q?k8L8y+rFrHdegdXkRwBgKgBAT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b2fc9f-6f7d-41e8-9904-08db78af56af
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:44:27.2972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pt45v6nAY5UQEmV1lSmsnVWoUgPG4SsLpgVJZuC6IsdXUcBHx4Fc0IJfWIgpkEqPMznoz62+h0jeprOtQXKnjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5930


On 29/06/2023 15:23, Andrew Cooper wrote:
> On 29/06/2023 3:20 pm, Ayan Kumar Halder wrote:
>> On 26/06/2023 04:34, Penny Zheng wrote:
>>> diff --git a/xen/arch/arm/include/asm/mm.h
>>> b/xen/arch/arm/include/asm/mm.h
>>> index eb520b49e3..ea4847c12b 100644
>>> --- a/xen/arch/arm/include/asm/mm.h
>>> +++ b/xen/arch/arm/include/asm/mm.h
>>> @@ -292,6 +301,12 @@ static inline void *maddr_to_virt(paddr_t ma)
>>>                         ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
>>>    }
>>>    #endif
>>> +#else /* CONFIG_HAS_MPU */
>>> +static inline void *maddr_to_virt(paddr_t ma)
>>> +{
>>> +    return (void *)(unsigned long)ma;
>> Why do you need "(unsigned long)ma" ? Both "unsigned long" and
>> "paddr_t" are u64.
> For when paddr_t really isn't u64.

Sorry, I am missing something

From 
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/include/asm/types.h;h=fb6618ef247fe8e3abe472e50b4877e11cc8a96c;hb=refs/heads/staging

In CONFIG_ARM_64

typedef unsigned long u64;

typedef u64 paddr_t;

So, why do we need to typecast "paddr_t" to "unsigned long" as they are 
the same ?

- Ayan

>
> The logic is correct, but it is an opencoding of the _p() macro for
> turning an arbitrary integer into a pointer.
>
> ~Andrew

