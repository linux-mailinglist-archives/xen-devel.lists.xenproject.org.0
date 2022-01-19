Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F10493B46
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 14:42:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258862.446306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nABEP-0007jG-Ak; Wed, 19 Jan 2022 13:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258862.446306; Wed, 19 Jan 2022 13:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nABEP-0007ga-6l; Wed, 19 Jan 2022 13:42:33 +0000
Received: by outflank-mailman (input) for mailman id 258862;
 Wed, 19 Jan 2022 13:42:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nABEN-0007gR-Kk
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 13:42:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5ce4d53-792d-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 14:42:30 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-OGPPcF3WM0idDUUnpBcqPg-1; Wed, 19 Jan 2022 14:42:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR0402MB3477.eurprd04.prod.outlook.com (2603:10a6:209:12::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 13:42:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 13:42:27 +0000
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
X-Inumbo-ID: a5ce4d53-792d-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642599750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qe5G8AAbk3c9GVBW4sjMFyXmYsej6fV3Uco9Ow5qGHY=;
	b=WWOVF54RGsPcv5ZvI/lgbFowLYo+5tEnoL2HihWYqBTHDdlPdio0THs82GzuKea8Z47BTm
	zhxYxNFwWP2Ey2XigMU13y9una2r19Xhv5ddLmp6pr3oIaEN8Bc1Iox8sjVzrKn4xsb/H0
	i6EyKky46D2uGqt/vZYSb+9QAR4Ckhk=
X-MC-Unique: OGPPcF3WM0idDUUnpBcqPg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFNC8J+2Ct57+DU2dsgURRVeOjpFEG6cal7A/BecDG96x+/HMiPsSLL9dEv4Y3khKTZp+1AmBItjd/F/GYSmFahPExUEJJwsynXD75u/tubPKBT9cYDz3UumWh6vRd/QDfxxYRAl02p8f9pZn09GpB7xsgbNZaAMJ9GFNnz6ADfoByRFSS/I53YsMsXBGtbHvfL0qfDbJII9mZrpVuBvbfOoKI2Rd4abLGsmDHtTkBPbcoxSKNkw7xIc2dOsx/RWA5ABvdUvZSszkDJ1S5oIll7h9bUVjJVqfInwRnVM5fqmmh8lOUa5tnYeR7ZRLyiGzzzoAZyp7SNe1J78p6pGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qe5G8AAbk3c9GVBW4sjMFyXmYsej6fV3Uco9Ow5qGHY=;
 b=P1+JUd/CwY5M+8auQeHSqjVmz6xezqYV3x9xSi0uIAYc7Tw7nQ6tlY8qBVnp6hUmKj+WK4DwmKqwS3vwgEqqT7yJwXsnOeHqFjYaw2sh44W4cC+ljlYxMmgiSCtFWn0HR7p+CmoCOOz1gfL9XA+7R8yXsqagQWF17jM8j65AyCHNYtPToThemwjbcFH8QeO9YXl2Kn92O1qOVPD7rM8sNwdZwDk17DQgkYt0gHXCIFuEJ1XU1v0N8GNM71OeQROdhdWiIOQ0LxFkSzPSPMMvksJHQEEyuY5goX85UBYbk+xiqS1I89KnTSzlmt0UfPuBmiZLcmfNC0ChMbapp2Qf7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3395e756-fa47-8d94-148a-03a573331e5a@suse.com>
Date: Wed, 19 Jan 2022 14:42:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/4] x86/spec-ctrl: Fix NMI race condition with VT-x
 MSR_SPEC_CTRL handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
 <20220117183415.11150-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220117183415.11150-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 635084c5-6ec3-4c99-f99c-08d9db5187db
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3477:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB347720F63C3C43F0B05BC2A0B3599@AM6PR0402MB3477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ian8azgz4eznVBJsHV7Vp3wm1+C+BPn2aYrKDfeFZDqCyWVaYVRjMV0JpQfiINNKJyvuAPFfuYb030zHuDGQy6Y2F3qMrGF5ED0IqcJvgXyDURaeIpTf0TDzYu/RK2O2+U2rCNdwTHTZzF3X1m0UtxPAO2UMUC/8lHunOd1XBWlkc8TbQwtEN3knbP7X5YT4IUNu4vLLp4yfyHCmBdqhbNeqtK7Zb8f5xNAO2VazUyCBfnZPPr+ZBmIjIPC4xYPz90a/HXq267SMPvVJtYhfQ+UYVjTzXXv/yn6abxG5365l7arX89j8R5O8zgGxOYLwYp6VgJI15EHXQInEN+AqW/8b8J5Q1y48+3EU6qu6RPElP97zU1Se+MkARkdC6uqbXHI+gr/tCXw49wJqzipG4CLaKQgKf8OGOHmrteuthFSjTr6BjXKAUeJSMxmIoPacbRpehyirV3Q0Rg9ttiTdQc81+K5bCp5xpHs+g5VcGJYZtlOvg5/rXr9Bt/hoq63V63iuOdFwWG0kYO/bDLcuYZE1zFmJmwVqDBssa/IDTNrnV8PwjjkVdBcyzNx2brtlXHz3B2tLcwi4KThF6TCzyXzT5A4gRSLh4M4YnEvFHlWMp3+PKwHbl2LkFWk9v6mx2LAK2Sya7QlG4FChpAXQxjaerCvl8Yl61QA8VxAysAI4BIV2Y58BFvmd5xZ1/g0bJWFa8Ilmb+tGNPJhhtr6VJD60ZLmVLYo/bRfSVula+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(53546011)(6506007)(26005)(8676002)(8936002)(86362001)(2616005)(186003)(31686004)(31696002)(83380400001)(6486002)(2906002)(66556008)(66476007)(54906003)(6916009)(66946007)(36756003)(316002)(6512007)(4326008)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ri9SK1hPZU84aGo0UW9tc3VYampZbkt4VjVySWoxRzNFaGswNzVidjhITmVi?=
 =?utf-8?B?bVNYS1dPU3ZPVHJ2NExJNFpZdnRZYnFsZXIza05DVzFiRldKazd0czIwZnBJ?=
 =?utf-8?B?OTBZakthQVJDR1hrTU5jOFkweWJIN3FPRU5wNnhyMEtiNXFrTEllWFU3Ry96?=
 =?utf-8?B?VEg2eTBpNEhRdXBFbmU4Sk9sdjZuajF5Qkk4OE5wV0RYTFhSd21PNnh5TnNr?=
 =?utf-8?B?enZQRktpNzh6YnN2M3hybDFteHREUG0zMzM4WUhFZ0wzdElsUXFTcmRoRmhN?=
 =?utf-8?B?aFZnWEloZWZBZjhPSEtTa1F2WmVQYm9nQWlySlQ0bzhsd3RaYjFocHcvSnc1?=
 =?utf-8?B?MDZOYVd5RHRyQ3RmMW0rMXdOMUJwSVJlT2dVWTBaWVdaV3dxaDNMQ0xhMzRE?=
 =?utf-8?B?SlpCbmRkTnE3cmlDZ0Z5M1RhL1M4WlRsVWVpUVBRRTgwajNyMUNDd2FTU2g0?=
 =?utf-8?B?MVJMNlZLRU1zcmJtdEhRZWdqS3VFSDIwbktzQmN2V3BBaVZGdUFIZkd1aU9X?=
 =?utf-8?B?SmFISlRrMmc0Z1FwNEt4SkVLL2xUY21xeGFOQjByQjJuSm10RVgzd1ZrUUxj?=
 =?utf-8?B?eGJLVk5XbEpTSlJ0YjNQNzdxWEg4WkkwUUhQMjZkVS8yeTY5Z2F1RzZ2SVlG?=
 =?utf-8?B?dzRxWFVLTVM2aVFmQVRvSDV0QXd6Y2J1Rm5pMWlqenZTckI0K0UzTjVzbVFl?=
 =?utf-8?B?cHpVd0kxdEp2NFkyRUp4VXYyMTNVK0IwQVRBZSt0UUJZUHVxcWJIR2JEUEhL?=
 =?utf-8?B?aERCdy90Z0hQK3lZNWswd2c4ZWZkQWdSR2tuQjV0Njd3WmxzVjVSc1QyNmhU?=
 =?utf-8?B?UkNHR3J1TnpuT1ovUW9nbm5xSW8xTHhMalVSd3dmSnBuTXI4MHZEOGRkNTY4?=
 =?utf-8?B?QVFqMURROWdyN0oxaHlQOWpVYk1GcFRZSm92MTRCOEp5Z3hselEvZFA0eHFE?=
 =?utf-8?B?bzRoVkVkZjBmY1BjVjZzTThhMEQ3OWRFeHVtWUVZWjF5ZHdVaklCd1JPbU1V?=
 =?utf-8?B?eGIzTjJNU0w0UWwyeUV6MW4zSHF5OWh4Q0w0YmtKeTdiMWdRQ0lTdGJSNTY2?=
 =?utf-8?B?c0trTmJubEZHbW1RcjBQT3NwL2dMempjNE93SWZGN3owVkMvRk5Sc01PaDRJ?=
 =?utf-8?B?a0JZVXl5UUpEOFp3QnpKWHFrN1ZSWjBsWFl3SjEvOGRWQit1Rlk3YmxYSHIv?=
 =?utf-8?B?ZWxXUmZuc2xyRVh1MkRZWmxRd2VUbkYwTU52cEUrZmJsRWRML0IrN3ZhUUYz?=
 =?utf-8?B?dTdNUXlBbmk1TEpNUHBJcE1ORlpkOVphWG9ZSld0c05wZXJFMWhEaTB3NEw3?=
 =?utf-8?B?Nzl3QmZPVy8rbzNPUFpMZ1N1ZTMvUGx0TlFsd0EzMWxSWnpiaU1zTnBNSUpN?=
 =?utf-8?B?Rk1jenVyVkNvNjVOVUFhS2d3NTFGa1BhUEd3eHgyeVRsZldRMGNZTi9GU1Rj?=
 =?utf-8?B?TGtKSUdncWx2Y25QWXAvUVp6VmJOSkJrWkI4SnEyVHp6ZzB2WU5YeVNMR1hW?=
 =?utf-8?B?L1BwaWxTNmoycDUyd1FYcUVNNTAvZU52T2xMclF4Zlk4WmEva3JmUnFaN203?=
 =?utf-8?B?aFo5UUlEZktOajg0bktSYXpadzBFL3dzL2lFRHYwV1ZNY0xSeWkxZkNoY1RS?=
 =?utf-8?B?SFB3ZmVldkdWOVVTVEh6TlI1R3czR2hoR2VpRG8yTVhPSGIvWXBVa3pVNEJm?=
 =?utf-8?B?azRGL240bnNEYXMzM0R4V0VRdGZ1RXlEZFAydDQ3ampsZlJLN0hObjkzcGJt?=
 =?utf-8?B?WitDb3lHS0pvY3gxeHppNkMzOC9abnNsUG1vNHNIelIzckJBV2JFcEJ5Zk1x?=
 =?utf-8?B?ZnhENnhBd1E4WGRQWG8xUmdLZmc2eURLTGhjNGdYdmZ0N3ZJdVllRkVDVnBm?=
 =?utf-8?B?UUx0KzJacUFPZk45aXJSUGpYRk1mNFdhY3VuVURtQ1lzV3lKbE1DTmZOV3Jh?=
 =?utf-8?B?dlB3K3BURnRpN09nNUxKbW5rVklWUWUyckJEakcwUFA5QlNsM1prQ1pZVFlD?=
 =?utf-8?B?b3dZSURFZXdBVC93eDNUY1prcVdySHhkR2poWm1kamZxOVoxa0pyK3JsTVFo?=
 =?utf-8?B?cWo0RU44KzNRaS9JTFNGY0ZqQm5BV1JiRDRMcTZ4N2ZZLzlsMzZ5OElZUGVG?=
 =?utf-8?B?UlI2TnFOcXU5L1hpQWp4cjFmRTNvOENpMzRUMXpING9iVVVUUzl4SXplY1VX?=
 =?utf-8?Q?hJ61B0j0jTwikbve91n4TMM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635084c5-6ec3-4c99-f99c-08d9db5187db
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 13:42:26.9729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvujXcGZ34Ai0aW92G8D5ON8BnbN9g38H43YNB08n7/uBmmEUy3QZQBHebZx632Te6+F1GQ0PsDCJzF/ea3yfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3477

On 17.01.2022 19:34, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/vmx/entry.S
> +++ b/xen/arch/x86/hvm/vmx/entry.S
> @@ -35,7 +35,14 @@ ENTRY(vmx_asm_vmexit_handler)
>  
>          /* SPEC_CTRL_ENTRY_FROM_VMX    Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
>          ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
> -        ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM, X86_FEATURE_SC_MSR_HVM
> +
> +        .macro restore_spec_ctrl
> +            mov    $MSR_SPEC_CTRL, %ecx
> +            movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
> +            xor    %edx, %edx
> +            wrmsr
> +        .endm
> +        ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
>  
>          /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if debugging Xen. */
> @@ -82,8 +89,7 @@ UNLIKELY_END(realmode)
>          mov VCPUMSR_spec_ctrl_raw(%rax), %eax
>  
>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
> -        /* SPEC_CTRL_EXIT_TO_VMX   Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
> -        ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_HVM
> +        /* SPEC_CTRL_EXIT_TO_VMX   Req: %rsp=regs/cpuinfo              Clob:    */
>          ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)), X86_FEATURE_SC_VERW_HVM

I notice you did update this clobber remark, but what about the one further
up in context?

> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -287,7 +287,15 @@ extern struct msr_policy     raw_msr_policy,
>  /* Container object for per-vCPU MSRs */
>  struct vcpu_msrs
>  {
> -    /* 0x00000048 - MSR_SPEC_CTRL */
> +    /*
> +     * 0x00000048 - MSR_SPEC_CTRL
> +     *
> +     * For PV guests, this holds the guest kernel value.  It is accessed on
> +     * every entry/exit path.
> +     *
> +     * For VT-x guests, the guest value is held in the MSR guest load/save
> +     * list.
> +     */
>      struct {
>          uint32_t raw;
>      } spec_ctrl;

To stand a chance of noticing bad use of this field for VT-x guests, would
it make sense to store some sentinel value into this field for all involved
vCPU-s?

Jan


