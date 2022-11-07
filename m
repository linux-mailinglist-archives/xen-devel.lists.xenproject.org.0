Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F4061F1EB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 12:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439324.693376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os0Nd-0002Mb-PY; Mon, 07 Nov 2022 11:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439324.693376; Mon, 07 Nov 2022 11:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os0Nd-0002KX-Me; Mon, 07 Nov 2022 11:33:29 +0000
Received: by outflank-mailman (input) for mailman id 439324;
 Mon, 07 Nov 2022 11:33:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEsR=3H=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1os0Nc-0002KR-2x
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 11:33:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd4fc237-5e8f-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 12:33:25 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH7PR12MB6717.namprd12.prod.outlook.com (2603:10b6:510:1b0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 11:33:20 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 11:33:20 +0000
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
X-Inumbo-ID: fd4fc237-5e8f-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WohRqy3TWCMsecD3e+SS36ObHev+PYCWtYMX2lDC9fs44dB2BkMrgVLzEVtzDckFBN8S0FP0gyA/U6fgxw7Ieg9pYVIbIryZPKoMweoAK/aIx0+o5YBnfaVOeym4s9xmIj/pxuwtk7XIhhiiXzTWpCUgAKMsxJEZUgGZlgToTfqInSRDhcwc87dv3yW1px5/Edm7zq6g6M0m+jMLOWiU6vp3/zn4GdBcnruoUjvFW28L9nfZmHgxVZnYdzsyXSMjupfWLINPciof6ZQghAWYAgvB4WP+60/w/9sJqcnIAYVw6F+vA+UE+vB6sB+FvNZbGyI8nUDlBfkKMXjuVPf/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HEMvp3MyZ9J4dHmLMpIh6FR/Xf+YNy3jfWaVMUQg8E=;
 b=g6jxeqAFxzSvkGiIL7suwYNyp7KHAH/4IXCxEEPMYOYSENwsvfupb/O1IPEIIGIOUVIzqNEgwtIf5R0/r+Tu/Np0OXY+YvOwUihjkKGLyXzohYvzL5HyyUlsjoBdxBZwGTeBgN+3Bnbq1Kb986b8cvNQbMz0xXVJNhFb1DVfLdT0Gkmb9alMFbA9uPWeV3U7I25cD6ouCo7asQP//24ciFsqjZ5/ONMsNk1hPiKrOad+wR5uSBxcQz7oe2/rEB/6cB4B87P6xMlkISYbfcmpD0cwQp6xaPyq2Y5/k1o/yP03W5SPoaHRue1NO+UpeUPptuqzNECWAPoLvQhetF48qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HEMvp3MyZ9J4dHmLMpIh6FR/Xf+YNy3jfWaVMUQg8E=;
 b=uI3cHxrCuA3MlkGYQlg3llPy9KrSG6cWKo4mSYkW9GPYRtAy/IeKMcQY1GBFVfwSXAZhMTAl1MKqcGP6WVEDrj10D1e0pORz6F2hRhXJQ+7W8Mhs1CwXpzle/mf3nfkhXdmVtjBxpSS9rm0GiowTZoyCvGsn1XihYfsEqIkL2i8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a10978a2-2887-5819-f5c6-3ebf56c32d19@amd.com>
Date: Mon, 7 Nov 2022 11:33:15 +0000
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
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <5d369b95-f412-67b2-5c34-3cd317128ec3@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0206.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::18) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH7PR12MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: b9889e12-97e5-4eca-a5ed-08dac0b3df4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ia8ZIPymUqbXBQHILMRAQGR3Ea1RFL5wtokpUy9K0gVPCAL9IgPJx5p3gqLX+PwhKGRl+1F40StdxAnYs3mdg9aUtAmZs9zvE47O4cA0Jd8jgJIbQAS+WyrMQaao9Xy1Q3DTs+7kRSiIlqaDTSKvY8kPYj7cJH6CnalEep5a1oZqqOOe9wXKwcrbwj4lLBgztPZ9dZDhg2+Rh0c+1vLPnT3xFTm1NrBGa47XZrfOUP9aKLC+FTs4n8vvrqBBQmJ7A3F9v+mqgPWh+VKl/+vsnVX/6iSOaeKZ7goBmr7Ob39v3aINvIokQiWJbD2wdcw8d59F3qUxvVfCgMsSuoVkUNDa0uZLHOMLPOw78bwwtdhWrmKcvk7xGDPbt3CeYQoncIMWduHHjGXEETpCWmZhHW/E3CjURuS5dwzs+5SsW5uZyxrWMygl6FdysxufvzesDWqt4YXsyY0+wCUTUc2S2IMOIxuKoVOP1k+5iA34e+Fi3ND504GwhufaTiY0nksTb0/9HDYBG78iXGtfHdX4qc81YV8h2XT+W4VPg8sV+UA7YTbVEsmWoJH7Hdy3KjQrB+iGZreUBGHHiQmbo7NRqomum9PUkFb2Xm0tLLKx64CUKUYvcKth3+D1HN90THIs28Pn/IB2wVXteSeqWJ0lULpBrXgha4JlFd5ehfGJUrWRSDXZAyxwVWb3bePcXx1KN0N+jPJC7sfZHd5jllfIw9r9doUQf5pFr4wEOaHys5Qz5VIb8AkR2g3zc14hTEGvaFwZqn7JwjYMQ6MzoC6MbobgIGLnl4nBzrZky/91TeY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(316002)(36756003)(38100700002)(6666004)(8936002)(186003)(31696002)(53546011)(6506007)(83380400001)(66946007)(66556008)(66476007)(8676002)(4326008)(41300700001)(2616005)(2906002)(31686004)(478600001)(6486002)(6512007)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0xYNjJrdGtlcUZ2N1llNnM4UzBaUTc0RTFXNmowclZGeEpjbWx5WmpwaVNK?=
 =?utf-8?B?TTRzZkRqTTQzZkVBVFFEaDFXbHN1aUZuY2VvVldxdzh4ZjJtVkNMSHFoRHhX?=
 =?utf-8?B?Z0R0dFlxZ2hQbHNzT2cwMjdlWUtaa2RzcHZqK29zWG5pNTIrakc4ZGd0a2dW?=
 =?utf-8?B?SUlqVUUvMWpIcVVVTmY4dHBRYzB4VitlYXZONHBxMXlWTC80N3hQNTNVWFE2?=
 =?utf-8?B?S05XakhvT01ySmJwTEZXLzVEbENuakdyNHJHbVlxOGxJMnVUZzdGY0o4YUIz?=
 =?utf-8?B?NEZER3ZQdGV3blVaL3ZzYnZWWllGcnlQWkh3VS92WHA4WkhWM2xWY0NrOE1H?=
 =?utf-8?B?YWZ1clhidm8yTXlGTXBuLy9PZzJaQ0NkVTFTTzJ5bjgyQ01zZGJFKzlOVUxr?=
 =?utf-8?B?YmFHcWR4K00yNVlJcEhGY2EybnJVV21uTlpmaGo3UmgrRXVuUjRKOU5yWDBH?=
 =?utf-8?B?UUJUUVh1bmtHQmYxUFhnL3A2QlFabHRMVDNDckt3NmRwTTNwRGN6QzEwTzFD?=
 =?utf-8?B?YVlJM2VaZEcrUmx0WFZycjlCajdYRG8rdS9JRDcrVUxtak1SeUw1ZWt4T0ow?=
 =?utf-8?B?OFNMYTdnNXl5eDlJSTZuTmp2VUlTYU55QW5ISlp0MU95VUlxTndIaGRXNWNp?=
 =?utf-8?B?V09aTVVUSXVRYlQ1SkUwVmVxYjZzanp4a0Z3cUY4cS83NzgxRGNlRzgxOTZu?=
 =?utf-8?B?VUxvZ1BBYmtBSkp2VU5TMDlvYWh2UmR2S0xHZWE4ME5OM0ZmS2p6YkZwR0Iw?=
 =?utf-8?B?K21Jb2dEUEl0ckxBbkd1d3VyeHpDYkZ3eGpiVVdDZWcwaFdKYnAxc2RlbzZ5?=
 =?utf-8?B?Y2dwQllsaEZOVWVvdER5TUh3dzV0QzdlUC9mcDZuc28vRXM0b0VZY1lwOXZQ?=
 =?utf-8?B?bGNVUHFvaVROcm1qZ3NqZ01pMG9KMlpaQjhCbHlEQzVaOUVGR29WWjMvTkQw?=
 =?utf-8?B?SmsyMlBha25vUWo2WW5TU2s1bGhBUytDRXlPd0QrNlVxejdJZE1EUXVmWFc5?=
 =?utf-8?B?NHl2VEtVSmMveUhxbkpHaTlzY3VvNk1xd3V4RzUySWI1RzV6TU14TXg0bTVK?=
 =?utf-8?B?NUJoL2VZMXljUFZpNU9BYUgzKzRPS1h4ZUtpamFuVHdMaloxT2VwSTBVRGts?=
 =?utf-8?B?Q2JTMGdTTDhDT2FmcmprWGlkeURvcmdZZXV3Mkx6Uk9xb0RmR21jSUtMOFRh?=
 =?utf-8?B?bmxSVi9USUJkVUoybnlSSFhEZHliYkxkN0JLT3BwNkRHT1U4L29YYkJBMEpL?=
 =?utf-8?B?QVAzcERVYytJNDZCbGUwNTBlbmZmcjFTLzJuL1A0anVzZUhlVTBXRnpGeEFj?=
 =?utf-8?B?Y3RDRm5MaUxYN0tyb00rK21QdnZHN0pJdFA1OE9XN0k3RGozZkNqTndtanJE?=
 =?utf-8?B?blZDOFhLSHk5dFIzWlQ1OTlkTjZGZCtaTnZuMlZ5U3ExeExvSjJxczJ5MmJ2?=
 =?utf-8?B?TU9LNThOemdQVHUxVDFsNEFoYjQ1MFRXNFliVkgxYnRuK1RieEJKY09DQmZT?=
 =?utf-8?B?cGt5cVBOMVRMeU0zWGJmWmJQUGs4cTFpNk82eVVESFJJZ2o0VDR0VC9Md0ZU?=
 =?utf-8?B?WGpyazJucmlOSHhvY0JqYzNqTU91eUp5REl6cmZ3V0h5dWxVWjRuRVF3VDEv?=
 =?utf-8?B?a2ltdW9WQ0N6cXNpZE5UWXJ0dnRSa0JVb3VEVW9LMXlzZWtQYUVXT3Z6cS9j?=
 =?utf-8?B?VkdaelF1b1ZZcDBsOCt0VVhUTXpwYXJqalc0RStkRGlJNnpPNUh2dUpMRVcw?=
 =?utf-8?B?UitmM28vL1RXRGh6UFVBYXVCWncwN1VLdjRaTTM4SDU4VFNmakhFN0JUU1Z6?=
 =?utf-8?B?YVFUOWVoUkE0QzdZOEErZk5EVERxaUhEb0JXRGlDZEpINXpteXhWcjFZZExP?=
 =?utf-8?B?SUllSDU4ODNWR1gxd3MxVnRmcnUzSGxvb0NHUy9ITjYxNmNheVQ2MU9yU3NN?=
 =?utf-8?B?UjUyamFtZGlEMHFMVTkzQXJaMjA2QWhiS1A4TTBDQVNnd2tFbEg1Vm9yNWIw?=
 =?utf-8?B?RXNtWWRtbXl4YjQ4RG05cUJUZ1QrcmtKZXo4bnVkLytSdjhNenZrZFFObzhV?=
 =?utf-8?B?MGhQeVVzL2tNSDZXU1VqaW5CZFRDMURGYlR4dFNZekdqU095Q1ZINmNhcFlh?=
 =?utf-8?Q?njWSdqOFnyIn9xJVmNZoL6yWd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9889e12-97e5-4eca-a5ed-08dac0b3df4b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 11:33:20.6020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wsJcHOQSXQ5aTgNwrudsJW50WdrgSGqopD7+pb2tniP9rd2jvMAdesFrVGqFqK0nuTwWB0Z1u+bFaJ5HzzE/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6717


On 06/11/2022 18:04, Julien Grall wrote:
> Hi Ayan,

Hi Julien,

I need a clarification.

>
> In the title you are using AArch32 but below you are using...
>
> On 31/10/2022 15:13, Ayan Kumar Halder wrote:
>> v->arch.vmpidr is assigned to uint64_t variable. This is to enable 
>> left shifts
>> for Aarch32 so that one can extract affinity bits.
>
> ... Aarch32. The naming also seem to be inconsistent across your 
> series. AFAIU, it should be AArch32. So please look at all your 
> commits and make sure you use the same everywhere.
Ack
>
>> This is then assigned to 'typer' so that the affinity bits form the 
>> upper 32 bits.
>>
>> Refer Arm IHI 0069H ID020922,
>> The upper 32 bits of GICR_TYPER represent the affinity
>> whereas the lower 32 bits represent the other bits (eg processor
>> number, etc).
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>
>> Changes from :-
>> 1. v1 - Assigned v->arch.vmpidr to "uint64_t vmpdir". Then, we can use
>> MPIDR_AFFINITY_LEVEL macros to extract the affinity value.
>>
>>   xen/arch/arm/vgic-v3.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>> index 3f4509dcd3..e5e6f2c573 100644
>> --- a/xen/arch/arm/vgic-v3.c
>> +++ b/xen/arch/arm/vgic-v3.c
>> @@ -191,13 +191,15 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct 
>> vcpu *v, mmio_info_t *info,
>>       case VREG64(GICR_TYPER):
>>       {
>>           uint64_t typer, aff;
>> +        uint64_t vmpidr = v->arch.vmpidr;
>>             if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>> -        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
>> +        aff = (MPIDR_AFFINITY_LEVEL(vmpidr, 3) << 56 |
>
> Shouldn't we #ifdef this level for 32-bit? Or maybe check if the 
> domain is 64-bit so we are using consistently regardless of the 
> hypervisor bitness.

We have typecasted "v->arch.vmpidr" (which is 32bit for AArch32 and 
64bit for AArch64)  to vmpidr (uint64_t).

So, we don't need to have any #ifdef for AArch32 or AArch64.

Please let me know if I am missing something.

Also, GICR_TYPER is 64 bit for AArch32 and AArch64.

- Ayan

>
>> + MPIDR_AFFINITY_LEVEL(vmpidr, 2) << 48 |
>> +               MPIDR_AFFINITY_LEVEL(vmpidr, 1) << 40 |
>> +               MPIDR_AFFINITY_LEVEL(vmpidr, 0) << 32);
>>           typer = aff;
>> +
>
> Spurious change?
>
>>           /* We use the VCPU ID as the redistributor ID in bits[23:8] */
>>           typer |= v->vcpu_id << GICR_TYPER_PROC_NUM_SHIFT;
>
> Cheers,
>

