Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8D44A4046
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 11:34:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262922.455388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETzx-0006u3-VG; Mon, 31 Jan 2022 10:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262922.455388; Mon, 31 Jan 2022 10:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETzx-0006rh-SC; Mon, 31 Jan 2022 10:33:25 +0000
Received: by outflank-mailman (input) for mailman id 262922;
 Mon, 31 Jan 2022 10:33:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nETzw-0006rb-Bp
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 10:33:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37194bf6-8281-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 11:33:23 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-6uR36Z7SM_ihiSSGf4j_Uw-1; Mon, 31 Jan 2022 11:33:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 10:33:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 10:33:20 +0000
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
X-Inumbo-ID: 37194bf6-8281-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643625202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S1iac42JhS2bsEO8binrXVcaRRw4uyiZEvawB+9tOgc=;
	b=OnJ81ar2mqBV39lfBGhXEbunz+In3rRyrqF4qGUbjjyFV3UA3jSfrloxL8KjcpF+68y6qB
	lVn/Z0dWllORzNcO2dWGp1ENtnCe7VSOU9GFHdbwLlnnhdYkg4yvVrd8icPP0l+EpPJ9DE
	ih5yrXqDobR1ZWh/zHM4TeWZzB46Iwg=
X-MC-Unique: 6uR36Z7SM_ihiSSGf4j_Uw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWr3i4wL6J1POEi+VCZNmllYSKxKow8GQSwivwbqLp5wxPguvW7Sq0u0vVhGM3eZ94IcAIDXUo0RlUUkMmUb9DniPGThS4ARmU9FYsdiqAVpsHM+zWDs4xp5G+VVb8ThIBq8XPIIENjSqhi+U43P3b8BoGWnY/qTZw1TzaouEDs8eRgeX3tK+qKrWVuHz3pKjYM7kte/OWD662HWu7+peeoGX+5OXWaTVoPi7p/m9gn+2sGvh7nXeqgZC1xpXNC2GmQdXUnFb+1+rkcD0IuwYY3DQ7hF2Dv5sGWyLe0xYn0ZfiJyFjqpppAFvHC5MH6C5gV9NP0I8PU/Yv9J2U7Zlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1iac42JhS2bsEO8binrXVcaRRw4uyiZEvawB+9tOgc=;
 b=lLI5+dvja3laJAXGFHA9s15uHRJur/tHbanzENZBtkpRCYeuoTwbD+tMG1loUN0c1woG5WTHkZzewRQM1CDejyy9VlLviC+oaSovbLH+I6J8DzJnnIkFvBz2SbF0TMvUpRbt+/0ZAH+UJz1ldrKrG5DkF7/GUTAvpOsbo78y3F8F0yNW/61XbkdWZJFciKGwfo0W37fcPfyMbgjYhvgioEZdv158qBr7eiDJYNFxiDMFqp7QPahUIKjhdJ1bP3/4aG3WFMKUj+m8vzGLU24Y+Hp8hIi4yXMHX3Ci8P3nhq9Rox55N2kuw2IUN4ibET+4frMx+lKCU3pyJVjEHXAqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46bb7297-cdf1-2196-a261-4357621792d7@suse.com>
Date: Mon, 31 Jan 2022 11:33:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 7/9] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220128132927.14997-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0013.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 571a180e-9283-4493-102d-08d9e4a519d9
X-MS-TrafficTypeDiagnostic: VI1PR04MB6909:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB69090910BF4ACC2E9AB2C2FFB3259@VI1PR04MB6909.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z57XoDIGFAienURu/asTsaWmxpwvW8SiEmGGQAfymnL2uQUodRitKCULfjArt6hDxBOWNcm33L+vFZnq1LbUQsiGKQlVreku0qfaHijuoC7l4tw9KP99ylUWMpaEVOAqQpmA+JeGfr9byw3Fk4effHlmbzeifshazTA0MX7ioWgsro5fw22SX2fv362sNY8gw1kdEE9e21KfFLR16OpxYSZt/6JgAMMyzwK4Y3gbCQT4XQ/7QX5+u8i01xloLHd7xaIOk4hwpVdvHeI5RLvTkniaRn3nsVpxPwBBpx+XYMk3vUNLxDyO+iYnNvFyu6LQy23EiMGr46awwkqXa+/fc5XcdfI01+MQqtn9wlVpX2zbyCb5Zft3w8YZwjsx/el+8yk0kNAMDxwSEf28356VOHHJKz+0eombF6F6lGZ7r+Cy/AKQCaD6mPcldbbiuVACA33A8nnw7yo84aJbvaPenTf/vbYOU90q3rU70bSEwZl7T2JdjgAzF1GHow0oLdJAZ/CaJrwb4lFUsNT9M5Nxi3c0PiZnrhZ/fOsVwoLg9xDTLiOtZYyJWAq/nzE34+fF1a9vxl3wk36ngGeCL1EqtLHM2BoqN2PUBcm+Uq4rpc9Yo9xyIvBXzNZjLcK0l0IIW4x679y/3O+ozWkH4ljhEsQ4tCua19W9ctenH8ZerMutsNdYKrfr4c83GaiskTKDIqS7dxzslyZ5asGFuppGKgxoDfFBpn4w8qYRdgq+eIyuGhqBH0A5fIRraYHViQr2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(6512007)(6506007)(36756003)(54906003)(6916009)(6486002)(316002)(38100700002)(2616005)(26005)(186003)(508600001)(66476007)(53546011)(2906002)(66556008)(66946007)(83380400001)(86362001)(4326008)(31686004)(8936002)(8676002)(5660300002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTN1VHZxWjEzMUtxMUdiMUkyOTBIMW9DWVV2SGhTTmkrVHVwdk9wT2tad3RZ?=
 =?utf-8?B?NU9iZEo2K2szbWxyVzBrVlhCK214aWlkN1R2UEZlNUhvdzV2cHlObTRNUXk2?=
 =?utf-8?B?QzhWaXY4ZitRNk9yOFMxZ1lrRWo1N2xEdjNNQ2NVZEs4ZitvY1ZYUkFtU1Qr?=
 =?utf-8?B?UllJc3lyZkRES1pVb0pDM1Q4N013dkROQ1BUR2JxOVpaS0h1ZWpudjNYNFYw?=
 =?utf-8?B?RDNJMmNoUVVLZjlTbENpZm5Jcks1cXJwQjM5bHV4ZzdxOURCZVNGNWdzaUxQ?=
 =?utf-8?B?MTUvNXJ2ZEY0bGgxU3JWYmRLTy9HdEZ0dU1mU05pckxoWGpwckdDUEJYOW5v?=
 =?utf-8?B?UTREWnBZNGZPUkMvbFdaYm5zc3ZqU2FoRkg2UitVSkp5ampacXVNUmhhWGNJ?=
 =?utf-8?B?ak9ReWtDV1RPMTJ5QUJMd2YyTldtNk1WcHI3MjBjOEU2K0JMV3ZyUWF5WWVW?=
 =?utf-8?B?U1RVWVgzQnJSVE5UaE1hUW5yclBPYzVqUVBjeXoyRm10ckp2S21uTXVQTWpC?=
 =?utf-8?B?VDM3bC9IZnU3S3RSeDR2M1kwR1l6Tnc1VzdXQUUrSGZiaStNcjF2ZkVZOFZC?=
 =?utf-8?B?YVY2Y2N5SkJMcEJ5WTBLWHRRQ3pabmZ6ZnZqZFd6MWdjYnBQK01VdjRkNW9v?=
 =?utf-8?B?em5LZWx0TFNINWpReGJVZjQ2SWMwN1J2bkpJbDdWVG5pc1N3cmJaTUhBOXhB?=
 =?utf-8?B?RFlGTy9uSEduOEF2cks5R3loMXEwcmpWd0o1ZWNlbkFZTWVlYjFYSU40WVFQ?=
 =?utf-8?B?aGJHVGNnKzg1NEVjR2Z2VDlMRE5IYVZLZkNUd1B2RzlMV0ZjVHhlQXdETGxn?=
 =?utf-8?B?c1JFUXNUVjNWUnVIS3lWSk9jd2Q0Q0ZNVHFxYmI5UXJ0alZ6WU0wK3VLbWg1?=
 =?utf-8?B?MkgrWE9QQ216Y1B4V2tZTnZZQ0hYSnUwZENOb1ZaQkk5dERYU2R2MjFKYXZT?=
 =?utf-8?B?d2pxR3JWRlQ4bTdPbytHblIzMHR2R3BsLzYxRnVXT1lWV3I1cFhGL2NsMnFj?=
 =?utf-8?B?Q0tpV1hIMURST3lWaXR3SksrQzN1UC9La0k4aDNLbVRWaTJiM0Zxd1ZZYmJn?=
 =?utf-8?B?ZTZvWVVmekRTeE1ndVdTS0h5ZjhQN0F3dmZMT1NZYjRpNFBRSFd2b096cTBV?=
 =?utf-8?B?dHFjQXYyZEdSUGlkd21NSVNLRGY4SVhuS3N2bnY2OWh0TTUrRkpObmxRWVIz?=
 =?utf-8?B?RDY4VkFqT3lWQzIzRGhFek1kYm41Ykk2MEh5am44a3dON0ROQmFoVVArQmg1?=
 =?utf-8?B?azd6amlPNlg0SWltZEI3YVhtUjc3UHpRNm14L1hKWmhHbW5RMjM0VUt4ekJn?=
 =?utf-8?B?NlExa2h6RHlIejdEY3RzVjZsQlJyZjdkd2U4ZmlWc3VHRmV5TWxZZjMwcU5u?=
 =?utf-8?B?dUxSL0RxdnA1NmNJQzVSbWlaeTVrZ203cVVvc0hMZnhjYklYVE1OZVI4TGxE?=
 =?utf-8?B?OGJzMm5qeTV4Tjd5bTdnaUFidkZqbEE0bzdwck5ybXZiSWpRajIxc1YveGtQ?=
 =?utf-8?B?SEhJbmh1WlhsbmYvS3UrZCtXOWozSVFDRm9vczBicjhDS3BEQnNxSFd1WmNC?=
 =?utf-8?B?N2tWWVMwOXpORW9pSVIySFZLTDhMV210dEhKUXl3NnhidlNtNzZYK1VNYzR1?=
 =?utf-8?B?aG92Rm1ENmlQT2xTbitoSnIvc2t4V05IbUJ6QjZINk5pQy9mK1huWnFIRnY0?=
 =?utf-8?B?dmk1cXhsc0s0VVZTVXAzd1NWZGR3Nkx1UTFiVmduemYzVGx1ZmNUOTZwblJ0?=
 =?utf-8?B?TXBDQTJ5SlhOMHVxTm9xNDkyM1VTWlVRbGtCUmVJc1hmQUNSZzF6aTVYaWky?=
 =?utf-8?B?Zy9wOVBQS0VjRjlwdE1lN0U3UTA3ZkVGMXA2ZS9RZWxwWStvSEErb1dCd2kz?=
 =?utf-8?B?UlM5NExicmZ0a1FYWGxLdGx4NWxFYjhoM0tUZFYzbUJ5aFFkbjR3OGdIcExm?=
 =?utf-8?B?MG1vU0E0YW0rSEQ4aHh3Vlk1UlUzRkxXbmQwMWxtRG9zaG9xQklxeDJ3U2l4?=
 =?utf-8?B?M0xYSjBGM1IrMHpJSmw0OEFjQ1k2aVRaOHlXYlJqWHRsb052ZGEwZ0ZHc2px?=
 =?utf-8?B?NkFjbmE0YXRkWGJWWHhyaDBhMUpRZVNEUEtHa1hHUXhHNmRwTGhWYUZza2Yz?=
 =?utf-8?B?Q0Q1VlJEcFRoV3RQYU8vdnBDOG04ZEJwMml4SEljb3d2NVB2UHowSm1JT2pF?=
 =?utf-8?Q?GoL7NfEU0vUMlqHroh7S05E=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571a180e-9283-4493-102d-08d9e4a519d9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 10:33:20.5434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXkc4kun5ml+S1Yqg7ytgFBHz6KbgJ+GyPHfLKhiQw73hJ3fW1Hfz9BbGQEWThqQi9moNQ5eqL9OMPt3ZUtJkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909

On 28.01.2022 14:29, Andrew Cooper wrote:
> Hardware maintains both host and guest versions of MSR_SPEC_CTRL, but guests
> run with the logical OR of both values.  Therefore, in principle we want to
> clear Xen's value before entering the guest.  However, for migration
> compatibility, and for performance reasons with SEV-SNP guests, we want the
> ability to use a nonzero value behind the guest's back.  Use vcpu_msrs to hold
> this value, with the guest value in the VMCB.
> 
> On the VMEntry path, adjusting MSR_SPEC_CTRL must be done after CLGI so as to
> be atomic with respect to NMIs/etc.  The loading of spec_ctrl_raw into %eax
> was also stale from the unused old code, so can be dropped too.
> 
> Implement both pieces of logic as small pieces of C, and alternative the call
> to get there based on X86_FEATURE_SC_MSR_HVM.  The use of double alternative
> blocks is due to a quirk of the current infrastructure, where call
> displacements only get fixed up for the first replacement instruction.  While
> adjusting the clobber lists, drop the stale requirements on the VMExit side.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Again technically:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
But ...

> --- a/xen/arch/x86/hvm/svm/entry.S
> +++ b/xen/arch/x86/hvm/svm/entry.S
> @@ -55,11 +55,12 @@ __UNLIKELY_END(nsvm_hap)
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
> +        ALTERNATIVE "", STR(mov %rbx, %rdi; mov %rsp, %rsi), X86_FEATURE_SC_MSR_HVM
> +        ALTERNATIVE "", STR(call vmentry_spec_ctrl), X86_FEATURE_SC_MSR_HVM

Is there a reason to use a macro for converting to a string here at
all? There are no "inner" macros here which might need expanding. And
"brevity" (as you have in the rev log) would call for

        ALTERNATIVE "", "mov %rbx, %rdi; mov %rsp, %rsi", X86_FEATURE_SC_MSR_HVM
        ALTERNATIVE "", "call vmentry_spec_ctrl", X86_FEATURE_SC_MSR_HVM

.

> @@ -86,8 +86,10 @@ __UNLIKELY_END(nsvm_hap)
>  
>          GET_CURRENT(bx)
>  
> -        /* SPEC_CTRL_ENTRY_FROM_SVM    Req: b=curr %rsp=regs/cpuinfo, Clob: ac  */
> +        /* SPEC_CTRL_ENTRY_FROM_SVM    Req:                           Clob: C   */
>          ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
> +        ALTERNATIVE "", STR(mov %rsp, %rdi), X86_FEATURE_SC_MSR_HVM
> +        ALTERNATIVE "", STR(call vmexit_spec_ctrl), X86_FEATURE_SC_MSR_HVM

Same here then, obviously.

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -3086,6 +3086,33 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
>      vmcb_set_vintr(vmcb, intr);
>  }
>  
> +/* Called with GIF=0. */
> +void vmexit_spec_ctrl(struct cpu_info *info)
> +{
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
> +void vmentry_spec_ctrl(const struct vcpu *curr, struct cpu_info *info)
> +{
> +    unsigned int val = curr->arch.msrs->spec_ctrl.raw;
> +
> +    if ( val != info->last_spec_ctrl )
> +    {
> +        wrmsr(MSR_SPEC_CTRL, val, 0);
> +        info->last_spec_ctrl = val;
> +    }
> +
> +    /* No Spectre v1 concerns.  Execution is going to hit VMRUN imminently. */
> +}

These living in SVM code I think their names want to avoid suggesting
they could also be used for VMX (irrespective of us not meaning to use
them there). Or else they want to move to common code, with comments
slightly adjusted.

Jan


