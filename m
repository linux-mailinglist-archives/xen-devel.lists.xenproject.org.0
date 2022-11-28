Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAA063A582
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 10:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448844.705402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozasJ-00074M-Jl; Mon, 28 Nov 2022 09:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448844.705402; Mon, 28 Nov 2022 09:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozasJ-00071y-Gl; Mon, 28 Nov 2022 09:56:31 +0000
Received: by outflank-mailman (input) for mailman id 448844;
 Mon, 28 Nov 2022 09:56:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozasI-00071s-Hq
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 09:56:30 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecb263b1-6f02-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 10:56:28 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH8PR12MB6964.namprd12.prod.outlook.com (2603:10b6:510:1bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 09:56:23 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 09:56:21 +0000
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
X-Inumbo-ID: ecb263b1-6f02-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHWLs3rUpJkfBZeiMUes2lqx9yriFePJib+jjAlFKUC31Hzh6egUNI5DlO8WwsS8FLOUvuRA5hQHpMdf2i4zVUrajubEUZIOFfCJSBhd9uV0BVRoc8P87zzbhZylVnO5jVgER1/r8+6Ql/RgE83FZz/HU1ao8R62oioPrp98Sgw3pV61oQ4NCoEA7q4OIDC8jQoTp9NivBzAuI9anlErD0ReLIqpoIm3k9kV8khES5Q7g5MXrGas+3pJ0N0YgvjIaN0qvWc7mjhjwd/FNxPQgq5oOZunDyIQlz21zaORgGxPITQzIV+jMvp1LXi+SZZin61X+t6guefGs+yiusyBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsZNMND5Nl7inyH0pKOhR0yFnlOgfOG790G2NUvqmPI=;
 b=cdpQ9onCN51z83ydq+zYtTkKHSr61GYxII0gn+3Oz1kfdzB/Z6Q/k6+OPP6eFESHsDFvTe8wvrN90T/aMbXNDlryRlnfZ2rSAem6ZmSIFL6TXsJc4B16XNknOpRTGpbIhTkwb2EYyE11ZFPSMgUS1YIxz22asFx2Pr4BfLeId4GEUdAjMlJMnKgSJvY/btYI6BkjcYcK8r7jBq23TmhL21e41iDc9OxmCSd2v40jcEKdaJ1Zpwtv1JaZ5G93AldDeopZQUAnVnIAu8YBz/mBp330nvKJM18u+xtru5gzJDflmng/kc1110QVxeGhiNEjLRDGO8E1Stqd9D1+Mw5b5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsZNMND5Nl7inyH0pKOhR0yFnlOgfOG790G2NUvqmPI=;
 b=xpTW/bGZqL3DjBIgpFDFvtXWeAtDH14zE7Fvdp5e3GiEvxcX2SDgU5xgxoNezIwKWS2RqNmxiXt4Hq8PuMsuLUdWWSW5oIIQLlhpXhi9nTadfAIAEVGfFOYZUeY1LhyH5TbHOGDz7NobsfWyG8OapPEc0ap/wsoV62Yxu+ITZs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ab0417ec-3f44-0f2b-186a-80c02ad30ca0@amd.com>
Date: Mon, 28 Nov 2022 09:56:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [XEN v3 04/12] xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for
 AArch32
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-5-ayan.kumar.halder@amd.com>
 <52e12805-169b-0ffe-ab7c-192d31320194@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <52e12805-169b-0ffe-ab7c-192d31320194@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::28) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH8PR12MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: 3359be25-a648-47c5-5ad8-08dad126cd11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rtWPf5BHZABboe/Q1Qubk4vcG54ABsgfIhDJyaXkBc3L2/P7DlC2ACeIviAFyQDSIUcdjW9tIOvS1nHL98t4HHDxXJ+WlW8SeY2yZzI6mlDxa+6rj7Zd+M/zEzl7x3Z5HLYQTG48A21OwTuyPQqMcC91WofE8t0cmsvyb9OBHNaHQM8q1x6lYu1ZDu8MeI1Z6F4zduX/5JwAqZY1KqPceJZ220aiPk1icA5oJg4HBjpfZd96QnWdyx2emIHQPnHvHXdEHwiAl+eugqv+p3N7LXqlE82thFPztTj5T/xDlZsrDxqAYgpuGLZdKPx+4uqWXi9VAEnomvcY0KqHd5k2sUBM56Tlll/467I1BXN+CgePhk6XVv2J/rn9+BORwdOzojaxuf3c7CRD3Qh81kfinWSZrNRZWm4Sx5tLYyXn6b9C+1MSDfy3VJ5kj46huSBUjim8lFwN0KycBqzK601mQCLcxyAYnh02ebAzPa4HiV3laUnDrgbrlw4ugXpOU/S//kDLTAYAh/nIrNBSmCpcvXhce+KeDvpoxf3/V25/z9UX9aS+jS1/clWcsWPcvIHXrZYX5/CSs/c7uBQpC1zfntUcon95AHylq43LWMKlXHoXg44QjD9uUz0spoC/gKoB6tN8gFRveC9Uhu7kiubsZYChdOgvmGfZo7E4E3qQa7D2lyukFAmuAwytnk5rbrRg2v/7aKtb2o1H3AiecNLgDRedmqQfMrwXwu+4xa6+nyk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199015)(5660300002)(6666004)(38100700002)(110136005)(6512007)(26005)(186003)(316002)(8936002)(36756003)(6506007)(4326008)(66556008)(66946007)(8676002)(66476007)(31696002)(2616005)(41300700001)(478600001)(31686004)(53546011)(6486002)(83380400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0VPY0F2Rk4yVnJmNm5MTzlvWWdPd0VjZWlmY0tmZzlaVUM1NW00R3VOMDZK?=
 =?utf-8?B?VG9DNmRZcGRlNEczeTh0QUJSVldNSWRMVThXMldsSnUxYk0zaUFUcjIyVFdi?=
 =?utf-8?B?OUlsbUVQSW5oTUY3WklYNEtCSWN3K1FQSTJHYXFBTzd2Mm8rNW9rQmlFSU1r?=
 =?utf-8?B?STcwWGpzSVhNcmYrQWZWazNvVDJoQWQrYjVtc3NFeXFCNW01ZWZFb3BGa2Nl?=
 =?utf-8?B?MmFXQklleXlRaVdLWFJyQmwxZk9hMGVQRU82TkVMYXZKNFlxbTl4ZW1wV2Zu?=
 =?utf-8?B?R21jUHNiUE9RQ05FcEVXK2gzOU1qVWRqS25kWGxCZ2lFMGUrVlRVOTg5NDNS?=
 =?utf-8?B?ajVnL2l4VHRoVERsTGJwSFN5VjR4VXVvenBOTUdibnp1cVNVVm14WFRnNFNw?=
 =?utf-8?B?SnpuMEttcnM5dzdnekdwU1ZrYm5WcWxNem4zNHc1R1hIVXYrOC91WkM1dkh0?=
 =?utf-8?B?Z2t1V1FVRWJFM2RjdDdiMVVUbXh1ZlhPcE5RcGtGcFRkUmNlamlyR0M0WU5z?=
 =?utf-8?B?NGRjZlhGRk5XNFNZYmhCaXVUbS9hWFdJQVRremZZZFFzeVlIR3VBeUp5ck9G?=
 =?utf-8?B?ak9QVGRiS0tOSTVDOE0rU1VkRlVicjF6VExualQrbUJtRmNYdVE4cHFZNmxu?=
 =?utf-8?B?ZWRtYkpxNTgyK3N0ck9RbnZBbEkyWEVsZDQyMjczd1dtN0kzeGNWLzZQMTB3?=
 =?utf-8?B?SW5IaDlFVEt3UzUzYyt5UDJueG1yVFZYQi9QQkFCUWNybmVMeExpWk04ZVE3?=
 =?utf-8?B?NjdWNWEwNHFQK3ZVYlgwRU95WWs1L1NPaEFBa29ZL2Nlbll2TWs5L0FZSW0y?=
 =?utf-8?B?R0N3WTJ1RVBZQWhJRkd3cTZiNEJLMnhxRU55Y3FKeUloVCtDZGEvazNtS0Q0?=
 =?utf-8?B?TFZyWWNDazBCdnRnOEFmblJoNXJ2b3VTNVFZd3JJMlRyT2wrOW9rVFR0MFRu?=
 =?utf-8?B?YTYyZEhJaDhWMGgxWEp2aVd0VjA0R3FEaTArc3ZQZVlUbU5sMVJRSnFYaWI2?=
 =?utf-8?B?cG85a3ZSR0d6WHpKc0VPN21jQmRZMmdiWGJmcGNtdDhWcExIWXNlWEtvQWps?=
 =?utf-8?B?K25NN0tORHFzZWtuWEtQV0JVNXJjaEtSVVd3dkI3ZGZSZ3Q4MmxBc0ZNRm80?=
 =?utf-8?B?aE1JUzBPWjliUHRUSWxJWHVYRzZ6SDFmU01QQUt0UDVVOG5oNzlMY09NSTkr?=
 =?utf-8?B?cVVxUTEyUGJMTDE3ZmVCWlI5T0JUV1laNjI5dDBFc3kzSGEyWXJZWUREZVZX?=
 =?utf-8?B?aGtHY21uTUxJNzRDTjFIeHcxRzlWbVI0anJiMzJKczhlSnpETWYzd21yNTN4?=
 =?utf-8?B?RTBjTWk4UDh3cnpyRzdIZUhZY092OTJyMzVmT2h2OFhNemtuTTFXMnNUdjkv?=
 =?utf-8?B?c3BYZ24zRnJhaEdVaEhEdVhOa2JBRnJFRlFDci9oVjNJN05SWlpHYW1YbnNC?=
 =?utf-8?B?TFB1UDNMUUxkV0NsZDVHeGVJV1BXRVZXWm5tOW9aenpnTS9naDJtMW1Ed2tv?=
 =?utf-8?B?RTlzT2k0UW45Q3BvSG5uTDRxVnJ2U3RZZVd4SjQ0cVVETG5MSHRiOUtDdWZS?=
 =?utf-8?B?dGdzUjJqODUvVGVGYVpEUUZWdW02blo0ZEdjdlpCUndSOElyQ0E4TjhCLzNq?=
 =?utf-8?B?Wngrazd4Y05lRTdweVVJczRZWVBDN0NRb2xMcnAzMG1tN0ZwYlJ0aGlrZitY?=
 =?utf-8?B?dEdIRTFpZEtBV0IrSXZwWjUyMEJUZEMrZjJ0M1BFK3BmQXhvUjRnakllVktI?=
 =?utf-8?B?M3Noa0cwWW1wN0FLbTEyVEk2QU5CYU5wU1R2Ym5GaHRCNXI5Z2RMSEt5cTly?=
 =?utf-8?B?WlRENFl4RmZzNkUzbzU4WDNDVzNORVVpa2VVQmQvVlFLRG0wN1B5d0R2U2lO?=
 =?utf-8?B?aGxDbGJrbDR6WVVEa1YvZEp0dldOMFQweGNxalhwWjlYcXdVc0M1Y0hvM2Yx?=
 =?utf-8?B?bXZKWGh0YWJGZHE5TlVwamNwQWJTVlBDQy9KeXdnR3AwT0ZvTjBnWGNuVDhM?=
 =?utf-8?B?TnEyaUZMSVAyQkY5SjdHQURTazgxcTZ0YUVlSTQ3My9TUVFhUG1PVXJrdk92?=
 =?utf-8?B?UEtKQ3BYUm1nRE5jTXRBN2E2TWduU0dWNVlHRG5xS05QdDBuSmNTOXVsQWdD?=
 =?utf-8?Q?2KsyWvOo9EF4fk6Y+HkYHR4XK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3359be25-a648-47c5-5ad8-08dad126cd11
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 09:56:20.7962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmsVtZ7JNS4Wh+zuwKjBj1FTuD35u1rvqTp3rivtyGUyxov68wVEblv2kq153KjFadoxZ/LDCidKqZFEhr9oTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6964


On 22/11/2022 20:37, Julien Grall wrote:
> Hi Ayan,

Hi Julien,

I need a clarification.

>
> On 11/11/2022 14:17, Ayan Kumar Halder wrote:
>> Refer ARM DDI 0487I.a ID081822, G8-9650, G8.2.113
>> Aff3 does not exist on AArch32.
>> Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106
>> Aff3 does not exist on Armv7 (ie arm32).
>>
>> Thus, access to aff3 have been contained within "#ifdef CONFIG_ARM_64".
>> Also, v->arch.vmpidr is a 32 bit register on AArch32. So, we have 
>> copied it to
>> 'uint64_t vmpidr' to perform the shifts.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from :-
>> v1 - Assigned v->arch.vmpidr to "uint64_t vmpdir". Then, we can use
>> MPIDR_AFFINITY_LEVEL macros to extract the affinity value.
>>
>> v2 - 1. "MPIDR_AFFINITY_LEVEL(vmpidr, 3)" is contained within
>> "#ifdef CONFIG_ARM_64".
>> 2. Updated commit message.
>>
>>   xen/arch/arm/vgic-v3.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>> index 3f4509dcd3..a7a935ff57 100644
>> --- a/xen/arch/arm/vgic-v3.c
>> +++ b/xen/arch/arm/vgic-v3.c
>> @@ -191,12 +191,16 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct 
>> vcpu *v, mmio_info_t *info,
>>       case VREG64(GICR_TYPER):
>>       {
>>           uint64_t typer, aff;
>> +        uint64_t vmpidr = v->arch.vmpidr;
>
> The type-widening here deserve an in-code comment. Otherwise, it would 
> be easier for someone to decide to open-code v->arch.vmpidr again.

Does this comment look fine ?

         /*
          * This is to enable shifts greater than 32 bits which would have
          * otherwise caused overflow (as v->arch.vmpidr is 32 bit on 
AArch32).
          */
         uint64_t vmpidr = v->arch.vmpidr;

- Ayan

>
>>             if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>> -        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
>> +        aff = (
>> +#ifdef CONFIG_ARM_64
>> +               MPIDR_AFFINITY_LEVEL(vmpidr, 3) << 56 |
>> +#endif
>> +               MPIDR_AFFINITY_LEVEL(vmpidr, 2) << 48 |
>> +               MPIDR_AFFINITY_LEVEL(vmpidr, 1) << 40 |
>> +               MPIDR_AFFINITY_LEVEL(vmpidr, 0) << 32);
>>           typer = aff;
>>           /* We use the VCPU ID as the redistributor ID in bits[23:8] */
>>           typer |= v->vcpu_id << GICR_TYPER_PROC_NUM_SHIFT;
>
> Cheers,
>

