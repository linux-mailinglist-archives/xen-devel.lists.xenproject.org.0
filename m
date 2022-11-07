Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBAE61F4E9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 15:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439416.693459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os2fs-0007ZE-1V; Mon, 07 Nov 2022 14:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439416.693459; Mon, 07 Nov 2022 14:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os2fr-0007WC-Tk; Mon, 07 Nov 2022 14:00:27 +0000
Received: by outflank-mailman (input) for mailman id 439416;
 Mon, 07 Nov 2022 14:00:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEsR=3H=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1os2fp-0007Vn-WA
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 14:00:26 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8478f909-5ea4-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 15:00:21 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 14:00:16 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 14:00:15 +0000
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
X-Inumbo-ID: 8478f909-5ea4-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RD6WW09V/yt5DgDXFNmFwpxuNPXgZrHHu6kok/8rH0qboo8QYPUM1UAVGlwMk1Jw42IbrxbaUkxbQHgOyNYzn9OTI/M4R2TDfl7K6ukwqZk9aHW09jJo1+Nl9YdVeCxWcPQcDzO3n4tSB1DDjX5AvhnBDKfGE8ZrX0EhsR8wdX2IzQgKNbp2G+/e78hmv2t4aQpm0i5/i1y+HUTbzOCVhSLNmwWxOQB8bV7+SCJPp5VB7fbH4S+lChHTbWtftxT2QjYRo4YfBTVVZtX18sayw8WG6XRLDW7X3tKBIountx0n6G88juRfM1VbkspSXf58GSt41oxJRXAqcwPJKbPSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL8uh4o5OnqxFdIWC5o66OuCu2zVKxRXW7MDG4snNlo=;
 b=PmXukiQj5A2QDk3lKtV12m3jKn9yIF+nDEicwoCpOJ/aZISUftuzCQE/iXBmR77Mpn01jvemy4+2vAWYdgrJzVwCsQVHFYqMDZ/AD3NwjkgbNBXqy22C6zDNKrSOiv4oz2Eh33QfTNknrujx6J458vvbR2byUEf5OM51XiMYYqe6oFcqTNRoFvCQySRIjePnEMyv6XyVYZdypaLKD3It3HWqICsF4sbCongE8yeNbM1X+6Tt1eLcHRdckqC4E33EzdjJIOVzhozkqFzDXWpnaBJ1tIiYaZuvN9r5r9b/cmElbgPx2Dup5syLWHyBCifolnseMVIEh4iHqtXq4Ah8eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZL8uh4o5OnqxFdIWC5o66OuCu2zVKxRXW7MDG4snNlo=;
 b=CQAmoyNtGVon7urrY5AlR22YssO41J03Gw+PuYr830QuePL5cbWiOw/4oG60oGQzWomHifv1pZYDBS51yU6Lm5RlIddXp89hUs9PdBS0HVMNn7oj1KB3CbRRtfyLhSMzG6LC3YvYHsE9lG8OnRYcgDaM4qKOVgMjHJg9E7BRKCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <00e4eb67-2b47-346a-f5cf-98b73c8ba218@amd.com>
Date: Mon, 7 Nov 2022 14:00:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 04/12] xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for
 AArch32
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-5-ayankuma@amd.com>
 <5d369b95-f412-67b2-5c34-3cd317128ec3@xen.org>
 <a10978a2-2887-5819-f5c6-3ebf56c32d19@amd.com>
 <8bb1c421-2dc5-cdbc-94f7-6ea09f2d64fc@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <8bb1c421-2dc5-cdbc-94f7-6ea09f2d64fc@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::16) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MN0PR12MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d8bf5a-92d2-47eb-3912-08dac0c86595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AxIVX6rARPOOsRrkHsOHkn8DLc4Vj8I1W97ImbYwfkZubzbtuywF9TA96tmAQ7iHwGhFDZ7uTPE3soagTo5bHZhKn5WzEc251aBsNnZutpRM38SvKcfOskiINtTWw2LRUMmPy3+q7P9hhagS4jvNwlhKoMWrlT9MlwAwqKm/0s28yks47/PqugKq8oNww/nXD17RmQ+eD1dsFqB9pTNmS0ea7kIpehWF33u+mArrgX0xS7vzMpcnhTpe0cqm4ovqP5j5hCRHHkeT5Rv26jandREJKGPkgGVYSkZ6/13bPynMf9iQm6RUHR2nYRn7Qlgz1CEwwHGKP7d7G16H/r80/uQIsJWgKOPtH21+5UFjmZnwSjwytyXKm2WZ0RfHk4sTzM5dWo/q7tLbqpIWXn4dRkW26lmBoCqhJgWc4EYYONQRlfP/w09Neejot2ZItHIXw4JRNSK+VDffgrmAR5IpM5VXUJk5PI+GKSJA2Sw0XdNsG8JB+pPLTqCBOu8po+qviAUaVc5R72Cva0qp9AQUOZdtsfWTno+Cm38ZQD06Dg+ak1B7NqC8D1QQ3PdbSPtjlJhUjxhdGSSnB4ayfPvsG84dQSapEpZJ8H9Uxem0uWC9DWMD3O268z6SPy3LaN9vp4H/JZpB4xkoh9mU4ilEiRIkaBpvCMadJuJWTUzvR5XHAHB0O9kB+W2I7boCsi6W/tXu+Rdt696uH+Rj6J1nRTJmq5sAF2IxFGhCxUvQuyYukOTKYxly05EZclWA/E28mP7HtUMIbamSI/6JRejotdA03og7Mgy1LW34FnRO9Kg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(2616005)(83380400001)(186003)(38100700002)(2906002)(8936002)(5660300002)(6666004)(478600001)(6486002)(26005)(6512007)(53546011)(6506007)(66476007)(8676002)(66556008)(31696002)(316002)(4326008)(41300700001)(66946007)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTcvbTh0bDJ1RUdObExGRUFJRGZuN2t1NVhHVFh0cDFJMktObGpHbmRGbVA1?=
 =?utf-8?B?TGRXRkZ4NzFFOURmRU50WU9vOXRlV2FhS3I0WWxXRTVhZWtLd0huK0JPMWVP?=
 =?utf-8?B?cUh1dndmTXI5MDV5eFd6QWwvR3dySmxQdlRyWFBZRHhITXF1SktVaFo4djNi?=
 =?utf-8?B?clRhSVhYZVFWTmZOL2tIZi9uK1BIL3grSnVyd2tuSmR4OUpneUZQQiszWUpo?=
 =?utf-8?B?WHQ1a2pwdFVGSUh4M1ZXc1RYYnd2dzRScXAyTzB5Q1NwVW5LRTZDSy9qOU5W?=
 =?utf-8?B?NU1ZWDYxTXBKcFgzY3dBdk5KQXVPSXROaEQwRG42VHRCeTZZR0p1dDBsRm90?=
 =?utf-8?B?WkVrczkwdjFMalRmZmYwTytjcXR1a0NNSUFhTDFnMEdXQ2NSekZiZG4wV3pG?=
 =?utf-8?B?ZTByOGUyOVR0NXQ2dnVWZy9vNUdhSU9lRVdaQ0JndDdqMThkRDgvOHNGeWgy?=
 =?utf-8?B?aUhpOVZYdmNnVlRWQkdncVRneHVKV0p0dFBlc2VmaU5KZlNYNFNoNkh4d3ZK?=
 =?utf-8?B?Nmt6OSszQ0JKOWVvM1cwOFBscEFTKzBFdlVkV3htN204eGdGMTd6NVJxMGZ2?=
 =?utf-8?B?cW1EMXpCMnlycjZnT0JnTnp0MUh1WlB3VjZVaFdwalVxbHhzKy9pbEhQSHpM?=
 =?utf-8?B?VWh6U2Y4T0lCSjlXV01rUWU3MnR2QU1PZ05jbStYcEx4K05lbmpCWmx4YVZG?=
 =?utf-8?B?UHhvZ3NLT1d1cVRkV0dLSnEreXFBc29mQnNIaGJTWUxheE9neFBLSzk1ZUlJ?=
 =?utf-8?B?SEdUT2xGdUdlUExzTzB3RmZncHVyaEo3RGFoOGhmalp4bmU2ZkhWcU9kQlRy?=
 =?utf-8?B?R3htRHlTbFhSNXVPUElwQWhNd1FiR2xBVDdpN0VqTXBkWWhtTjQ2MWdTYU9V?=
 =?utf-8?B?RjZaeUp2Y2lNZU5wamtjVkZtTGJjZFpGUEJTcDY4TEE0NDBLRHhkNmFXTW4v?=
 =?utf-8?B?UThtckdHZFBYTUtGRUVDUHhnYUlWSG1yMVMvKy9qbGliNnJwZ24yZ2k3Tmc3?=
 =?utf-8?B?VVBaN0VMNWRRczdQK21WdXRDc3FycEFYRFRjRForSUo1TmRnT0dSQ0xCZVJ2?=
 =?utf-8?B?RElSVkRLSWx4TDdZN1lGWS9wUTBWTk85bkJlbHF0cW5YRWdxSDBYME5pTEtX?=
 =?utf-8?B?VHR3VDFEOEJyMlJCTm9HOENUSWxLQk1WTWs3QUp6N3c4TlBQU2hJUW94VXRC?=
 =?utf-8?B?NldjdHhXUHlkM0ZmWEQ1WXdYaHRFa2RuWXVtUXdkc0pveVpqeGlmMkpOWEM2?=
 =?utf-8?B?eW16c2pTMlFEbUtBWXB2Z2ZkYjNuUU02UGtFYnNVbEZqWC9YWHo0RWNuVnpp?=
 =?utf-8?B?emlQMTh1T0lxRmFmSDhOUTA2VFFTRXk2bGw3SGlTSUxRWWl3VW4zMHFnazJq?=
 =?utf-8?B?bUVCdDRCcFk3VG5xNWcxSHFvdXlyWlA5K28yV3lHd1RDd3RjWFgvZElCVUx6?=
 =?utf-8?B?Y2htbUpXQTE0VkkvbnhnVUVjZ1ZoT3hDeXpJdzgxc2ZNL2prZW5sZXZiUis5?=
 =?utf-8?B?VHVyWHhFNWttelV1ZjFQOVdzSmxjc2VuMmxINmJncHJVLzNZVW9UZE5nNG1l?=
 =?utf-8?B?YjNsWU1NWlIyUTV6ZFdaRERJU21oV1ZmTHNJYkk5czNUT0tGL0Y3WE41UCtT?=
 =?utf-8?B?aVNiU2dXVmF1VjRvQXVzcVQ0dWU0bnc0dmJlMmF0M2NBNUt3VzR3SHFqVlpr?=
 =?utf-8?B?RVp1S0J1WGFZdGd5akt0eHpnQXRPK3dWTGpzMkgvSS9McGNHaVR0TUYzd1F5?=
 =?utf-8?B?Mmd4UHdnSFZYY0xvYTFsWUUvUllhU1JTa0lybXJCK3BhVzlEMVRNbE1iT3o1?=
 =?utf-8?B?OFpHK0ErTElrWmtmWWRGTm1xc2Z0eVM4NXBJZUxEVWFscm5SaXdjYjFIUklx?=
 =?utf-8?B?YlpFQWF5dU9uWTBsSGZaaVZGNlhzZGdwc21GRmIzWmZGTWVCMUFWUC82Y2hq?=
 =?utf-8?B?TmpQcEZsYzlYWWtyMjlJVms2dGkvZTNKS0htdWxFZTZQMFBCL0dBT1dsbm4r?=
 =?utf-8?B?QzVoUEVSNGpJQWlwRWIyZ0k3LzVFVXhZVzdvSmtQZWtVOTJuemJTRzA0aXUv?=
 =?utf-8?B?TFQ1VWxqY3B5ZjRmV2ZrWlVqQlUvV0Z0ZytiUllxYi9tUzBTa2pvWXRHQjdL?=
 =?utf-8?Q?DEShdHgpL+vcz/eoDURKV25f6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d8bf5a-92d2-47eb-3912-08dac0c86595
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 14:00:15.8804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OG6sDXxdAOc9XJW/il0ZavOsr0JZAsvOQSfcjX2jIdbBi6UnX8REwq076P41EwIt06uNp7jehSuR5aMk/ZxNGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317


On 07/11/2022 11:54, Julien Grall wrote:
> Hi Ayan,

Hi Julien,

I need one clarification.

>
> On 07/11/2022 11:33, Ayan Kumar Halder wrote:
>>
>> On 06/11/2022 18:04, Julien Grall wrote:
>>> Hi Ayan,
>>
>> Hi Julien,
>>
>> I need a clarification.
>>
>>>
>>> In the title you are using AArch32 but below you are using...
>>>
>>> On 31/10/2022 15:13, Ayan Kumar Halder wrote:
>>>> v->arch.vmpidr is assigned to uint64_t variable. This is to enable 
>>>> left shifts
>>>> for Aarch32 so that one can extract affinity bits.
>>>
>>> ... Aarch32. The naming also seem to be inconsistent across your 
>>> series. AFAIU, it should be AArch32. So please look at all your 
>>> commits and make sure you use the same everywhere.
>> Ack
>>>
>>>> This is then assigned to 'typer' so that the affinity bits form the 
>>>> upper 32 bits.
>>>>
>>>> Refer Arm IHI 0069H ID020922,
>>>> The upper 32 bits of GICR_TYPER represent the affinity
>>>> whereas the lower 32 bits represent the other bits (eg processor
>>>> number, etc).
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>>> ---
>>>>
>>>> Changes from :-
>>>> 1. v1 - Assigned v->arch.vmpidr to "uint64_t vmpdir". Then, we can use
>>>> MPIDR_AFFINITY_LEVEL macros to extract the affinity value.
>>>>
>>>>   xen/arch/arm/vgic-v3.c | 10 ++++++----
>>>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>>>> index 3f4509dcd3..e5e6f2c573 100644
>>>> --- a/xen/arch/arm/vgic-v3.c
>>>> +++ b/xen/arch/arm/vgic-v3.c
>>>> @@ -191,13 +191,15 @@ static int 
>>>> __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
>>>>       case VREG64(GICR_TYPER):
>>>>       {
>>>>           uint64_t typer, aff;
>>>> +        uint64_t vmpidr = v->arch.vmpidr;
>>>>             if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>>>> -        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
>>>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
>>>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
>>>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
>>>> +        aff = (MPIDR_AFFINITY_LEVEL(vmpidr, 3) << 56 |
>>>
>>> Shouldn't we #ifdef this level for 32-bit? Or maybe check if the 
>>> domain is 64-bit so we are using consistently regardless of the 
>>> hypervisor bitness.
>>
>> We have typecasted "v->arch.vmpidr" (which is 32bit for AArch32 and 
>> 64bit for AArch64)  to vmpidr (uint64_t).
>>
>> So, we don't need to have any #ifdef for AArch32 or AArch64.
>
> This is not related to the typecast. This is more that fact that 
> affinity level 3 doesn't exist for 32-bit guest. For instance vpsci.c 
> will protect level 3 with an #ifdef.

Just to make sure, I understand you. You are suggesting this ?

--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -191,13 +191,15 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
      case VREG64(GICR_TYPER):
      {
          uint64_t typer, aff;
+        uint64_t vmpidr = v->arch.vmpidr;
  
          if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
+        aff = (
+#ifdef CONFIG_ARM_64
+               MPIDR_AFFINITY_LEVEL(vmpidr, 3) << 56 |
+#endif
+               MPIDR_AFFINITY_LEVEL(vmpidr, 2) << 48 |
+               MPIDR_AFFINITY_LEVEL(vmpidr, 1) << 40 |
+               MPIDR_AFFINITY_LEVEL(vmpidr, 0) << 32);
          typer = aff;
+
          /* We use the VCPU ID as the redistributor ID in bits[23:8] */
          typer |= v->vcpu_id << GICR_TYPER_PROC_NUM_SHIFT;

If so, then we can drop the patch "[XEN v2 02/12] xen/Arm: GICv3: Move 
the macros to compute the affnity level to arm64/arm32"

Also, we should do the following change :-

ayankuma@xcbayankuma41x:/scratch/ayankuma/r52_xen/xen-pristine$ git diff 
xen/arch/arm/gic-v3.c
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index d8ce0f46c6..e7d5338152 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -527,7 +527,10 @@ static void gicv3_set_pending_state(struct irq_desc 
*irqd, bool pending)
  static inline uint64_t gicv3_mpidr_to_affinity(int cpu)
  {
       uint64_t mpidr = cpu_logical_map(cpu);
-     return (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 32 |
+     return (
+#ifdef CONFIG_ARM_64
+             MPIDR_AFFINITY_LEVEL(mpidr, 3) << 32 |
+#endif
               MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
               MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8  |
               MPIDR_AFFINITY_LEVEL(mpidr, 0));
@@ -720,7 +723,10 @@ static int __init gicv3_populate_rdist(void)
       * Convert affinity to a 32bit value that can be matched to GICR_TYPER
       * bits [63:32]
       */
-    aff = (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 24 |
+    aff = (
+#ifdef CONFIG_ARM_64
+           MPIDR_AFFINITY_LEVEL(mpidr, 3) << 24 |
+#endif
             MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
             MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8 |
             MPIDR_AFFINITY_LEVEL(mpidr, 0));
@@ -972,7 +978,10 @@ static void gicv3_send_sgi_list(enum gic_sgi sgi, 
const cpumask_t *cpumask)
           * Prepare affinity path of the cluster for which SGI is generated
           * along with SGI number
           */
-        val = (MPIDR_AFFINITY_LEVEL(cluster_id, 3) << 48  |
+        val = (
+#ifdef CONFIG_ARM_64
+               MPIDR_AFFINITY_LEVEL(cluster_id, 3) << 48  |
+#endif
                 MPIDR_AFFINITY_LEVEL(cluster_id, 2) << 32  |
                 sgi << 24                                  |
                 MPIDR_AFFINITY_LEVEL(cluster_id, 1) << 16  |

- Ayan

>
> Cheers,
>

