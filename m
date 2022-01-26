Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB3949D008
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 17:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261038.451554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nClVa-0002IA-H9; Wed, 26 Jan 2022 16:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261038.451554; Wed, 26 Jan 2022 16:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nClVa-0002Ek-E0; Wed, 26 Jan 2022 16:50:58 +0000
Received: by outflank-mailman (input) for mailman id 261038;
 Wed, 26 Jan 2022 16:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nClVY-0002Ee-8V
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 16:50:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 206a147f-7ec8-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 17:50:54 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-NM488FgoNMyLyQryVpUpGA-1; Wed, 26 Jan 2022 17:50:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PR3PR04MB7339.eurprd04.prod.outlook.com (2603:10a6:102:8b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:50:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 16:50:52 +0000
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
X-Inumbo-ID: 206a147f-7ec8-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643215854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVoBSauL43wjcVPt8t8sL/oARtzHvIs2psLXuiupbu8=;
	b=DmOxUZsiKyS42HxsRL+Dtl2KnW5aYhm5VA9Rd0YG9EHvVGgxhJRC9TfIpJTyjPFmQMPZkt
	od9b8bQdoVc17PpJfDtULAU9/N2yQ6eK1+j4dMjoGBh9ALzxcxxW2illmOq8G6+6vvFl1p
	L5SJbFMBTLUtrwPms3lXW6qJCOBq2Dw=
X-MC-Unique: NM488FgoNMyLyQryVpUpGA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awZ+EhHz3MAQDHeUIQlavzxPioldpL8gWEHCiQJnc2065PalY6wpmlB1tjefY9cNS04W60PR849Cq3fUjG+wesgDwUh4p14I11HM2kgjHxnxOJ1LQpQd578PnUaxn4Fx8dIoLVEcHnn/k2AFqYatoGeCEEspwjtqDWXEye60tACv6PSAEAY0W/naZJpPcuMGRUx0p/orfHl+p+Cx6itbDaDYmCAbI8W8wlhyM9+M4JR/8AK1RpDSb94DiqVsU4IybvWDDgah5S9LNWiNrPbN+3m9Xb0C7iwprxTBQBwd1/yM+rZvYk+ISKd/cVNVcHdT2SNgDOe3H63BFZrASasOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVoBSauL43wjcVPt8t8sL/oARtzHvIs2psLXuiupbu8=;
 b=dKkhF35sLmXFGsfq0n/c61R1Ab0fNg5yWMOvqjhhxy6SoOUc7aHC0Crm2PemjHKvBis/8U1VF7zZ0RuRA0nu5/tusB2gnA8VeVmK+EOMMxLb9ubJQM79FckKc9RY2tHRolIQBeC1nQhTG9yUboMRrGGBwuOwkkmHcD7ZQcFFEhEYAevg+/Z/DNtdaGNUhSjL2h6xXxL4XOwj9n0y8QlrdLbCV9M4I8EmynfrBawT6qMpIn/9UDJI8J0BG8IUgLBZJbYBgzFswmf4+ZvvYcZLHhyJaxHYqruLvOT3QjFWVAWL0stSrGwWDSohP62TFz7j7Pdr6IHV2Et58Y/n6WRhQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5c1134a-f446-7031-877e-6a3177120de9@suse.com>
Date: Wed, 26 Jan 2022 17:50:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/8] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220126084452.28975-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0026.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f85af36-5a9c-4808-325d-08d9e0ec0314
X-MS-TrafficTypeDiagnostic: PR3PR04MB7339:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB7339F6055D04A90D3DC4CBA5B3209@PR3PR04MB7339.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tm70CTMSPihWaUwLNRgws73unMnCzNV/JZA9OV3EX4K523RhYYeCvgwd/903CFjs5rZj7Q+lwLQg7fXDqiR5C3OKFoXwfaGBwtESIA9/A9j7hLmoB2oxJm0GrlfC/IMorRTqWSNY+6pljKMILnvJs2QqjO6xNIDwDQr+yP9aDpU3y75inVvS8mex6bGoYuV/s/RdwL1ntjEmsgV/PHJKVRhQBQgDbwFTcFhxLo535IyUY//N7XHWQAr0I8KbcN+pFA4NsTiXsvxXBUMy8NHIF40bA9qp2NdVY5Ar4jHd9ZgJGHNPPQKJJCWSw+3OnwnZsRI8U2YA4/N4VArQqnHlvxQShtyjrPi3KwVNy/7ZZPVRG0OIE5vJOTXP6YX6pIKL8PSnkhjCTFUS4/iulr2Dq8lZbCt8eyteugEtxQw3Dctpx5cr2u1e2MTy5LkdTuCB8mQjTVotOn80VWiWSq1fflKGYWRWhVoOclaGJalmQ8/eumeqL7ZxEqLn+x3M7f0c8/cn7pbYSBXRFB34Ni46wt9L2Znkodk4DCc8GhrkyIVMh0E3v5G5eaH2/KYMN032NN+HvZu6sYi6/uA4MmrDQe7NVz+dYVNU/3pQ7GyEPI3sPfa87qEU7b7PY2LZa1/+em/p5OeA+/VaBWUQrNW9O5xUs4WYlGoNPL+lLknbgNbFPMsPJEAZwp/fqPC7z+4D/vfRndjZdtVTEzpmVTARTNFqqp5y/1NTMv9PZOJpxCyv+GfJdOVvqPoVtyEPv0BP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(508600001)(186003)(26005)(36756003)(316002)(6916009)(66556008)(31686004)(6486002)(2616005)(66946007)(54906003)(66476007)(5660300002)(53546011)(6512007)(6506007)(86362001)(4326008)(8676002)(8936002)(38100700002)(31696002)(2906002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnZSbkpFcERrTThTY0NEZ29BbkY5MzkzSDVCVHQxS1JVbjNwd3c1U0U1TGt5?=
 =?utf-8?B?WWV2WFpDaVZRemRkRlVLY2c3T3YxZFZCTlI4dEpNYkNSOUpiWG5KblVFZW1Z?=
 =?utf-8?B?dGhNNUFXRzFzVkxpU3hvK3NGdkpLNXJWK05JTVM3VjJJWDVQWmRsTU5aaGM5?=
 =?utf-8?B?OWE4bmNudWlIK2QvRWI2YllXTnBKNFBGaUV0SzQ3NWRqS29pVUx1SDdJMUVv?=
 =?utf-8?B?aS9tdGx4dCtmSWlLNjhrVTZJTHVlRHZEcENWMzBtdngyMGNENHZkT0VaQ2FI?=
 =?utf-8?B?NGZtSllJVEl6a1p6OG1mTHhmQXJuVWFacFl1bUdnT1FrSTRSeFdHM0trb0Fi?=
 =?utf-8?B?Uyt1UUxIczREYkRva2xjMVNKZTZSSGtVT1A1R1I2ZDZyOFlRdFRqRlYrQ1Ir?=
 =?utf-8?B?UElTYjFsRHllVnV1aHE1TUtmZE1rRGFKaFkyVEQ5TTJVbitZOE1PZFRVUDdn?=
 =?utf-8?B?VTVCbFFlVzFGRllyMmMyVzVxczdsdCtBdXpxZHdCOVZLcm5NS1hwSDMyQ1VQ?=
 =?utf-8?B?Q2NGYWZqZVhGU245OWQ3Q2VtVG9IbU81Sk9PWjlXTnJ0a2RteUM4Zm12bldw?=
 =?utf-8?B?UkdyVGE0Q3VwcUhPci8yUk9zYTFJOWVSMzZFbThBZkpjbnV4SWJCczVLSytl?=
 =?utf-8?B?bk4vTmVJMlNGeGhIYmptbG1HNW1vc3kyWjNVQ0xmZkVZQU5mTG1vcXNXNHkw?=
 =?utf-8?B?ZEdJY2ROS21ncFJRanRjR2pEQTU3V2pCYjBPbXAyK1Z3UnNHT1JlYktvRmxr?=
 =?utf-8?B?Y0J5ZU5XY21rWEsyT1p3MmxmTHNlT2pHMXNTb3FNSzU3MWNTSFlyR3VNU3hh?=
 =?utf-8?B?TjFmVkIwTkY4enpoL0JYRmRaN0N0NFJjalFzTVlHUklLRy9WY29QQlQxTVRu?=
 =?utf-8?B?MEt0dklDdzdjbWF0Ti9TaXNONDhVSDlNWXF5MkwyTlpzb3ZPOTZLQnd4bFBF?=
 =?utf-8?B?OEhiYjZQclppOXhBTGRhSlhNTXpCRWQ3U1o3YlIwbTNEWXAra1A2K0JLclgr?=
 =?utf-8?B?a2pmN1hSZ2VMOEJFdjZGWjB4MWpORmZsS01OWjF3b3k4MCszaG1aSUlhZUtF?=
 =?utf-8?B?UXlQNHBocmhlakFqbXZqY2pyS3JOMWtZM1JWMFc3SzVDY1NxTHowYUlqNDBo?=
 =?utf-8?B?QlVjdm5OYUF4UnRUQjhtK3pXeDZKOTBkV1pwaStJWFNRamFTankyMFR4bEUx?=
 =?utf-8?B?REFUQm15QmZVZXM1UlpSMi9BT3kyN2NhRFl3U3R1NVBkQWtLNmlSSHF4ekZy?=
 =?utf-8?B?SUxhME8wZEphUkRMT2hpSXRjb1ZFUnJyMEFLYlhwTHZxK011WTZIRlZYN3ZC?=
 =?utf-8?B?dFFCNS9UTG9PVEJ5K2c3SFhmUWVMVjNIazVtdHlUcXZHSkhtK0JZQzQrR3lE?=
 =?utf-8?B?bzUzOHRYVUZnVVM0cFFoMGRBeGw2cHdrZzZyRHVMRFV1Rm1BOVhkSzI3bWM2?=
 =?utf-8?B?M0J1MG1IZXUyZEIyaGN0dTVaQ2VQVDY3R0Fxa3R3NktBTnI3S3JJZFdoQld5?=
 =?utf-8?B?ZTI0TUhkbnFLUW1ja3BMbis2bWRKMWxCdk8zdHFaeXdxRzhlN1d6VStGMGNY?=
 =?utf-8?B?ZjA0U3JyS3ZMeE05d1RTaFVFYXF5MVRJMWo1SlU1c2Z0ZlVTclJnTzh6clVh?=
 =?utf-8?B?eE9ieWdQUWRHazFPaVM5SysybmlJZ2ZjUnVQc2Nxb3J5eDU5UWRNUEdjYk5a?=
 =?utf-8?B?SzVOK0taSDlwWU4rRHRpTS9ncnlQTFp4Vlc2M2NoME9rc29GcTFNTUdHd0ww?=
 =?utf-8?B?Znl0bDJ0N1c4RmxJUS9aOE1NVjMvK09ob1psYnJYVWN2Y3BjWVBIclVwaGZx?=
 =?utf-8?B?bjViQlBqWEt6Rk9jMUY2R1JOYitMTjhDQThUWjR0aTE0WFpDUEIrT3JjMVlS?=
 =?utf-8?B?a0FLb0tNZkdjeUxoNXM4VXpGbWdNbDdjTzJGWENqalVOWStBanBxQXZ3OEhT?=
 =?utf-8?B?VUs5cFRyWDlQanh5dWxUT2xrRDQrbjJPV0xFK3hxSklaUzVJYVB0UWNOdFZ6?=
 =?utf-8?B?UDRzM2UxRjNjZmVYbzBqYTkraGcvUnlqOXRNdG1FdGRHZWIvemVNa1JZb3dx?=
 =?utf-8?B?VER5Q25KcURzRWNHWGoxN1laNkxiOG04enVXRnRQeG5zbzZvOVZVM2pGK0Zv?=
 =?utf-8?B?K3MvaXNIcnJ0REdNL1c0RmJKM2loUUEwejFHTGg3TnBtQlJIRndJQVhIc3I2?=
 =?utf-8?Q?aEIdwnxweEN+tTmM1HP2PIY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f85af36-5a9c-4808-325d-08d9e0ec0314
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:50:51.9600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mN6SQTcdS9xOKWBfuk12qLFX+aiTTdkaEc/VqpSTTWQ7s14fetzEP2B1kckDrm6negAXUjAMZvUnijFcZ/QAKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7339

On 26.01.2022 09:44, Andrew Cooper wrote:
> 1) It would be slightly more efficient to pass curr and cpu_info into
>    vm{entry,exit}_spec_ctrl(), but setup of such state can't be in the
>    ALTERNATIVE block because then the call displacement won't get fixed up.
>    All the additional accesses are hot off the stack, so almost certainly
>    negligible compared to the WRMSR.

What's wrong with using two instances of ALTERNATIVE, one to setup the
call arguments and the 2nd for just the CALL?

> --- a/xen/arch/x86/hvm/svm/entry.S
> +++ b/xen/arch/x86/hvm/svm/entry.S
> @@ -55,11 +55,11 @@ __UNLIKELY_END(nsvm_hap)
>          mov  %rsp, %rdi
>          call svm_vmenter_helper
>  
> -        mov VCPU_arch_msrs(%rbx), %rax
> -        mov VCPUMSR_spec_ctrl_raw(%rax), %eax
> +        clgi
>  
>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
> -        /* SPEC_CTRL_EXIT_TO_SVM   (nothing currently) */
> +        /* SPEC_CTRL_EXIT_TO_SVM       Req:                           Clob: C   */
> +        ALTERNATIVE "", __stringify(call vmentry_spec_ctrl), X86_FEATURE_SC_MSR_HVM

I guess the new upper case C after Clob: stands for "all call-clobbered
registers"? In which case ...

> @@ -86,8 +85,9 @@ __UNLIKELY_END(nsvm_hap)
>  
>          GET_CURRENT(bx)
>  
> -        /* SPEC_CTRL_ENTRY_FROM_SVM    Req: b=curr %rsp=regs/cpuinfo, Clob: ac  */
> +        /* SPEC_CTRL_ENTRY_FROM_SVM    Req:                           Clob: ac,C */
>          ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
> +        ALTERNATIVE "", __stringify(call vmexit_spec_ctrl), X86_FEATURE_SC_MSR_HVM

... why the explicit further "ac" here? Is the intention to annotate
every individual ALTERNATIVE this way?

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -3086,6 +3086,36 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
>      vmcb_set_vintr(vmcb, intr);
>  }
>  
> +/* Called with GIF=0. */
> +void vmexit_spec_ctrl(void)
> +{
> +    struct cpu_info *info = get_cpu_info();
> +    unsigned int val = info->xen_spec_ctrl;
> +
> +    /*
> +     * Write to MSR_SPEC_CTRL unconditionally, for the RAS[:32] flushing side
> +     * effect.
> +     */
> +    wrmsr(MSR_SPEC_CTRL, val, 0);
> +    info->last_spec_ctrl = val;
> +}
> +
> +/* Called with GIF=0. */
> +void vmentry_spec_ctrl(void)
> +{
> +    struct cpu_info *info = get_cpu_info();
> +    const struct vcpu *curr = current;
> +    unsigned int val = curr->arch.msrs->spec_ctrl.raw;
> +
> +    if ( val != info->last_spec_ctrl )
> +    {
> +        wrmsr(MSR_SPEC_CTRL, val, 0);
> +        info->last_spec_ctrl = val;
> +    }

Is this correct for the very first use on a CPU? last_spec_ctrl
starts out as zero afaict, and hence this very first write would be
skipped if the guest value is also zero (which it will be for a
vCPU first launched), even if we have a non-zero value in the MSR
at that point.

Jan


