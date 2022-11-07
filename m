Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A2361F0D9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 11:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439258.693288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzUH-0007YE-AM; Mon, 07 Nov 2022 10:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439258.693288; Mon, 07 Nov 2022 10:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzUH-0007Vf-7I; Mon, 07 Nov 2022 10:36:17 +0000
Received: by outflank-mailman (input) for mailman id 439258;
 Mon, 07 Nov 2022 10:36:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEsR=3H=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1orzUF-0007Uu-5M
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 10:36:15 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffd4b0fc-5e87-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 11:36:13 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4877.namprd12.prod.outlook.com (2603:10b6:5:1bb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 10:36:10 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 10:36:10 +0000
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
X-Inumbo-ID: ffd4b0fc-5e87-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDNiw57FDlOSbw967KL48U28ctmGMaGomqC/ROgI16azWl35t37jWD3+gGhCrfvbui5JDHzDU4EvZrxyriU9lNiXadKpe9k/n4jrligmljTFbo/B5rImTQR4vmadnZiHC+WO8l8C56tllTo3Gi+gWTT9Q5VsU+Q9Bh/xG88EyQK0a1PLa094jXPzpGB0YDSXDT1SikgjmOtET9c4u5agn5oxyLiPIhNFI/n84s/YsYBXbs31ri4CgIgfZcAQLHxqOgeHjwm21/pjpNCcvFumOHslc6tpTPdNFSTfD8y5CPY1//famtfyUUbnDM3PjI/DJYlMKW0KALHM8HPspYr2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZ52wnRurqrAFke2eCTYx+Rx14aEnLyyYq0IlZtl2rY=;
 b=S+heH5FtyyH8MuRQHLdNyZ6vugav6/m5PkTD3RRjwJLAwqHvn55V7qvodJZOvnDjeBHEkuwDPB1NHC35NClZKm/LK0sGN61hf0p10GgJ2iWPVFo8+VXTIzUZlHoJ1L2UG6C6hU/zR57HUnJXS/x9JFCPdghg79QCqlkW+EXveUEM3YaQdQlgyqZOFkTTkjS120PyZ1W5ENrFvSWYjMWiPU1KmbgRt7/lQvRFpJWKYSP0Fbksmrjqde56aPYhFtaUr5VmkoYXEpExqj7jKXX5HxjHh011VAnNMQNbwMS7JvBSubyGYoWRAv/WoB3ZxjRzOep6SJhQSGnp2UEUbwbwJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZ52wnRurqrAFke2eCTYx+Rx14aEnLyyYq0IlZtl2rY=;
 b=LiS88zuA9uEPG/Nkk/ZYMHmjOLlQehKqGLxZqfuVHQrEIxYSQWlS6bgU7rxBaoA7IspHq2F2lQe18iFYIIRUOMK0HpRZzlmlBOGiQPv5/jj54tPTLzPlt5YJq3Cmnp8xTDqlF1F7nLJYmDv0aZ6AyNQ+jl1wDq4BttoeH1waCbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <33a2d125-b7f2-3637-9dab-6b7d616fd4ff@amd.com>
Date: Mon, 7 Nov 2022 10:36:03 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2] xen/Arm: Enforce alignment check for atomic read/write
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com
References: <20221104162355.23369-1-ayan.kumar.halder@amd.com>
 <062c9507-7744-0742-effb-76d2f1222a27@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <062c9507-7744-0742-effb-76d2f1222a27@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0415.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::19) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4877:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a347f6-74f9-4f54-10a0-08dac0abe29c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g+DJCnBs5BUjcGNNJjuQCioqUj2AEK4zwFRgYxTOHudAH9PmT5DJ6afrCVXXRgmHI+/O9EZPGubwhnRCQ2YmIlv5ExBjLM6upH4mY2FyIs+Bcf2eXYOD4e92w1XK4guPyPuILnTkUm9DLeC2rvGbEOxxgfDp3Cvib/TG8fAalwsKz5hv+gGibNCzjKFPElMeeH9d5XzgMVnALjED5360UrkzfrcP/AHvgk5JmLvWDbQ4SGPiHYOzPHJ4hubg+NUW61C5Vjpd77OqYz0y3//OLOgIw691niw+CWoRwHkJOinOYn82dHDbB7ukQDLDgCdtj7TFl50+SvCTKBj4lYZAiOoUqbNBWsnWfWCpD1RFCusAiyAnqsWjdVQOJNAc5Rpgn/Z9tIc4/nLT1Smma1zlpHb7we9K2us2zD3+NRyUrqDs2CSo1dJFfhGf1j6/17TEsawGZNaO9B+PpB4A/aQsfITnWKNkO1qSQOPdp8Lv9o3sfemKVXaCvL+zQOz6NmNntdHNBubKdAX536rnsjDywD9vCOE/MvWW2/wMroZqvUJ9g2j/zMnqoaObbO2pvKTdsrSC46USwmR5FPRnTj52TqPzSXfj8RpTI16UasbnsBusj+9E78ok9/bkgOnYvC+3xZ1jT/UmCnGX9MNntJs4sXJnpM+UigCPonfEdFR9QQLqO028GVbN2nmSHYZo07Ihvopb0ROeKqYOB/ZVG659SdhRcVWPI0bXALWCPYRdzI0MaY8duZIUlNn3qRqPLOYuBHbBy6PwTMSGeP4zHqG81plI2Jq44tMQ/Qxu/vJHEmE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199015)(6512007)(26005)(5660300002)(6506007)(53546011)(478600001)(316002)(110136005)(2906002)(31696002)(6486002)(8936002)(38100700002)(36756003)(6666004)(83380400001)(4326008)(8676002)(66946007)(186003)(2616005)(31686004)(41300700001)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHpMYnlMTGRBSkIyWmVraUFMRmJmMTZmT1M1bk5MdTBJWUZGaFB6S2orSlhP?=
 =?utf-8?B?SnU4TDBDZVBFZWliejg2emtYWjh6Y3hZem91cUd4bVlWc3FnNzRnbHJJRXFt?=
 =?utf-8?B?RzRTdHkrSzR5aVFrRy8wa2JzNjQzQVlhVkNwc0tFS0dnckZLbmxzZ01vQUd1?=
 =?utf-8?B?eFZKZ1UwYUt1YkViVFFKSENWc1FqUHFiUDNqblZ5QVNuUUduK1o3RGFidDJn?=
 =?utf-8?B?WlFMUm9Na1Z5K0JTbTI3WVo4WXBQZjVVSGV2U1p6Z25na0YvTklQSjY1anhH?=
 =?utf-8?B?dXlia0FnZFExb0V5dkxpNmc0SklxRkkwdkF3U2UyTzNJRnpMYTZqdHVsUW9k?=
 =?utf-8?B?cmxWOGFuOStVMmtPL2wrUExMM2F4M1BoZnZBYUxSRWJwZk52TldBT3RqR1BD?=
 =?utf-8?B?Q0REcXR2akgzK2oyNFFyV20ydjU5VFoxbjJ3cjRlRmY4Tk1oNHdIQUlMemNY?=
 =?utf-8?B?R0hVdytqb2ZRNUdYc2dwK3pjVUN1dEdtZlJMbW5wdlhuUXNlbzEvRDFWSDNH?=
 =?utf-8?B?VFFaUm5wTld3eFJtN082SHRNNGhreUk3T2diTWI5c013eVpDOTdHaFdlU3RB?=
 =?utf-8?B?SVNvUWlwR21hSnBkRlJsZ2hlL1NsSWFiY2kxZGdoQTlXbkh0d3YyZzhzSnRN?=
 =?utf-8?B?SFlZWUlGNUlCNXc4TFhXSWlNUjFBY3hJdjVHNzlTNFFzUnBoa3Jhbit1RnU1?=
 =?utf-8?B?NVdDVy85RjQ0SEJWREp2UDVKOUhGUThzZVhjdFdkRTR2eEJLbW5iN2creXhS?=
 =?utf-8?B?NkF1QlptbmV4ZGdSVVJZNXAxWU16OUM4ak9ORWFSVnVpUUxyVFhmbWc1aGhz?=
 =?utf-8?B?Q2V0UW10WllURHdRZXZuaGl1SEd5c29aMWdaR0tsSll3c3RRQ3Q3K0VkSlR4?=
 =?utf-8?B?YnBJMWE3NXM4RTRGZ1oyd1FSNEowY0U5TjdZM3g0Nys1NzF5OXF2UDlNa0dR?=
 =?utf-8?B?M1MrUEdsRXVGNDRWcG04dkhOZFA1dU84YVllNDlaaXpuTmtmTWw3aUt6bjFJ?=
 =?utf-8?B?Z0JKV2h3RmQzSnBxeEFMMmh3clJlK1hvcHNJNEdwTVdLbUlJZzU4VkN6dEt0?=
 =?utf-8?B?c1R6VUdvOHg4UENwem1XUE5mVlNYL0FFdkZrb3B1dkF2Z25BMU04ZVJLRXFD?=
 =?utf-8?B?OHl4YmpkK0dvZWpsaVR0cjNDSTVoYXFlK2p5dTI1d1l0S1ZhVi84ZTZISjQ5?=
 =?utf-8?B?WjVwL0xXMVN4K3o1TGRKdnBLZkd6K2k0ZUZMVkxxSjFDazB4KzFnS2ZNMzZY?=
 =?utf-8?B?VWFtWjRFSGRwQzBNRUl2a1d3clYyN2FRUGNNWVErcitQaklGR2lXQVl6TW9l?=
 =?utf-8?B?c0lMaC81TmdxbU93NGpPZ2pCT1RMV2pkMFdWVjlYT2VoK3AyQTl0UnpSY1FJ?=
 =?utf-8?B?MmNZb2x0UGNLWCtaWGl4UVcwcmU2ZDdrK2NXT2RkTmxvZ040cWJ5VGhaRFVN?=
 =?utf-8?B?TXZkQmJqTnpYd2s1ejVYK3RvV0NzOGdhRmdZVExBcE1abHdMUVdnT1hBVFVT?=
 =?utf-8?B?ajMwdmpzRk83WFlIb1RGaHVPQXl2ejZkNWh3b1dRdDNBdFIrTkNmYzV4dXV5?=
 =?utf-8?B?OFpSYlRNdFQvZ2hwRWhvbndpMld1MzhKQ1I5OFQ1SlRpYjBJbTB0L2pxYStO?=
 =?utf-8?B?ZlZBQ2czL3MvS0paM243MXAzdnluZ1M0ZHZuaWZxRXdpWHFDRGRQSk9uVE94?=
 =?utf-8?B?eW5xdTZCdGpuRG95b3JKb2ZUSEdLVlhGWXBFeERMOTRpSU93SC9qcHFSa2VM?=
 =?utf-8?B?OSs3SitHUDI1a1JHVTdDWkFBUC91YXNmZFIva0JocVEyZVI4RXErbk5GR2xQ?=
 =?utf-8?B?aDZTUTZBTU05dVdicXRoSXg0bE9HL2NiZmR6a0tsRjlpZHZoNVdsNktaTEtp?=
 =?utf-8?B?dXBXblhtOXViY2FBdzZqQVVRMjAvTkFkT0hjZ1RLMU5NL0ZLeDdTNFVVc2pl?=
 =?utf-8?B?UmljOHNtM3hIS0lmYkFFRGdhMkJ3ejkxQlhqK3g0VGM4ckMwUjRyZW8yRHFh?=
 =?utf-8?B?RDEyYzc0REk1Ym9QT2h4MXFYL25UMjB0YlpxdjRVMDB0eVpNcU12VE44S2J2?=
 =?utf-8?B?Qk1ic1RwNDdMNitOUlAwaVhkbzBIZENjdHQ5TmJsaEI1Y3VMU2tsWUkrdzhL?=
 =?utf-8?Q?De4OIBPG/P2Bd/IGeDbBcoAa/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a347f6-74f9-4f54-10a0-08dac0abe29c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 10:36:10.2353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5tmfx428q5+iBkpH0/rIXwmzh6mou7TZZ+9jZzaNICtQktEpp4css5Mc9nlMBNKtqXeIW2HAptlgsFKxsBcjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4877


On 06/11/2022 17:54, Julien Grall wrote:
> Hi Ayan,

Hi Julien,

I need some clarification.

>
> To me the title and the explaination below suggests...
>
> On 04/11/2022 16:23, Ayan Kumar Halder wrote:
>> From: Ayan Kumar Halder <ayankuma@amd.com>
>>
>> Refer ARM DDI 0487I.a ID081822, B2.2.1
>> "Requirements for single-copy atomicity
>>
>> - A read that is generated by a load instruction that loads a single
>> general-purpose register and is aligned to the size of the read in the
>> instruction is single-copy atomic.
>>
>> -A write that is generated by a store instruction that stores a single
>> general-purpose register and is aligned to the size of the write in the
>> instruction is single-copy atomic"
>>
>> On AArch32, the alignment check is enabled at boot time by setting 
>> HSCTLR.A bit.
>> ("HSCTLR, Hyp System Control Register").
>> However in AArch64, alignment check is not enabled at boot time.
>
> ... you want to enable the alignment check on AArch64 always. 

I want to enable alignment check *only* for atomic access.

May be I should remove this line --> "However in AArch64, alignment 
check is not enabled at boot time.".

> However, this is not possible to do because memcpy() is using 
> unaligned access.
This is a non atomic access. So the commit does not apply here.
>
> I think the commit message/title should clarify that the check is 
> *only* done during debug build. IOW, there are no enforcement in 
> producation build.

AFAICS read_atomic()/write_atomic() is enabled during non debug builds 
(ie CONFIG_DEBUG=n) as well.

For eg :- vgic_v3_distr_mmio_read() --> vgic_fetch_irouter() --> 
read_atomic() . There is no check for CONFIG_DEBUG.

- Ayan

>
> The alternative would be to use a BUG_ON() but that might be too high 
> overhead.
>
> Cheers,
>
>>
>> Thus, one needs to check for alignment when performing atomic 
>> operations.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com
>> ---
>>
>> Changes from :-
>> v1 - 1. Referred to the latest Arm Architecture Reference Manual in 
>> the commit
>> message.
>>
>>   xen/arch/arm/include/asm/atomic.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/atomic.h 
>> b/xen/arch/arm/include/asm/atomic.h
>> index 1f60c28b1b..64314d59b3 100644
>> --- a/xen/arch/arm/include/asm/atomic.h
>> +++ b/xen/arch/arm/include/asm/atomic.h
>> @@ -78,6 +78,7 @@ static always_inline void read_atomic_size(const 
>> volatile void *p,
>>                                              void *res,
>>                                              unsigned int size)
>>   {
>> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>>       switch ( size )
>>       {
>>       case 1:
>> @@ -102,6 +103,7 @@ static always_inline void 
>> write_atomic_size(volatile void *p,
>>                                               void *val,
>>                                               unsigned int size)
>>   {
>> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>>       switch ( size )
>>       {
>>       case 1:
>

