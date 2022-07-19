Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB8B57930F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:25:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370356.602059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgey-0001JH-NL; Tue, 19 Jul 2022 06:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370356.602059; Tue, 19 Jul 2022 06:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgey-0001H9-KQ; Tue, 19 Jul 2022 06:24:44 +0000
Received: by outflank-mailman (input) for mailman id 370356;
 Tue, 19 Jul 2022 06:24:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDgex-0001H3-Lx
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:24:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130075.outbound.protection.outlook.com [40.107.13.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7997e6f5-072b-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 08:24:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6854.eurprd04.prod.outlook.com (2603:10a6:20b:10c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 06:24:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:24:40 +0000
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
X-Inumbo-ID: 7997e6f5-072b-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWLomfDueT00QcMKrAO9mzmYjbsFWQfvC9a4FhXTyxjF9kmJRvlzO/w4Df/kAIZr92YQB+LkLFR85RxZKUO6uw2G3QJQ4EOGQt9+BZckB5Zn03/HsKXPYu3fHZ1cBOD9JlgM1ZyFNt28B2nHs2/RSHFWDKx4nI7m8YRqguH/7gvpDaYM+sCh9kKs53fbKee622KNOGYRTpX2BzFzf2q1JIUAXIg2t9on138qKoFO5Icuew8MQUnI2yueAOVuu2OaLgFaiZ2ougNbP8VNVy14ul8c+ssNmrReO5XO/F9qWI2cPa60U+fmiaatIsa+3ujEQC7QtBqfL/kwBLe+xNv0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x72as8QuhGziGKORR5Eq/6hR1cWgcm/44/vg/7Fd6Qo=;
 b=RBg0oIZqrRJM+RyH1dg3x6HPc70LJCY2eA5gbdi6nVELQk0tKZRqCR1SaituG1zWAyWMUBSEZaXQcFpzyRAH6MJsnJleQSOpZ/mr8u6QMzG8+OCGntu+xvXVrXAJ6glZcqYPUTXCydOzpMHOt+OBpa94ocSxK1PGrzX3udI/VVs6olTbqDHDTiKgv7/k5zR4ngl7GxRCSn3rBAQdN/mkD0GwmpQWu3+KmmJsiTcL11qKEktWM4K2NlaNjfR6j+v9+cXz9yGUmvlPLPbJ6qMnNIxo1dRsR7b+F8PHHxffcL5FQb5NMLoifSwN1OcnDM76y3ReSyxrgvHhZbr8saS9Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x72as8QuhGziGKORR5Eq/6hR1cWgcm/44/vg/7Fd6Qo=;
 b=3ehKtVKiPjA5m9Vf4CNinqkVIU139FJDsBUhuRSJPPHZ47LuSZzTFaBz9fInk0QMRUmYPt8EAvnqfzcAGXecrGWLJAju3dfC8LmNlJ/xyLDUactVFWbIxFRhwsiLH3/if/ExtV3kXrqm44+6r9ETSU+1QO6uiZjiyT3R1rcAk2r4rB2erakBvtrKn0See8/Dz50t7TURBrS7mft3z4P3p9Ec7vzGt5G/wqDjPTi5d9F6xDKhx+7c3RppZozKuHKcEKzPmKkAZ8RRroUvW87XfUzUUjMJ4+uhXyXd33+wow6QFlD4BWEW1ieS7ccM/F/QhIfQEC3wMUHc5FrSeR5lYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29855733-aac8-8c32-f4fa-e0b5922c5be1@suse.com>
Date: Tue, 19 Jul 2022 08:24:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] x86/spec-ctrl: Shrink further entry paths due to %rdx
 being 0
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220718205009.3557-1-andrew.cooper3@citrix.com>
 <20220718205009.3557-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220718205009.3557-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb64c329-5092-4c8e-023d-08da694f5cc1
X-MS-TrafficTypeDiagnostic: AM7PR04MB6854:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EbW8eeR6jHXi7oGBgB23aKa9v5KbFLdrTBwZBKDgOV8YE6R52/nU7qnX8L7Rt7TRt2LX4iwfJB61m3OdAxkDpSkzyuUjwkRTawy2myFOil2SFLGl9Asm60m4EeHkZcyMumty6Ww+Sk/duDCueVAOWslCFjLd4P4G0GAKo5TLlNVgvhZDMJWSBepE4QdNI+xTasz5cYncDl0lyVcW7KefZi7QDVsuBY4tL7RFBjNngVwqxaiO0T5Kyoigsz5VdSTxSs7MgxeCMtcIOEr5NGJ1aLflhPr1be4Ii5tA8GRXtmzO9GPrNLbO7tKILejG+tDrbQw3yPrAzdpyYzH0ODTNwPclfz9OL/ePBkWNvB387nlmLDzli8s3AMtYziGjupsepBWHvAm4R1aiqMK54fKhtiAP0LsJkzs0HAMgBpnbdI3BR04m8TW8x75Ud2V9JnT8Br/FtZdlfwr5aT8EQYG1PJ3gRt9ahEM6XpmcbCcdK29lWCI3yJeLRL+YpH6EY8YtLemuE1QCTBhGoTlCXl/LKfEq16+SKTjVBltWJY2flBqsckYJt5mkOSBWB7DbX98v0LQsOjhYAC8usSUUEariwKE/wSAG7bOeh5kr9aEZcxfR5PPmhp6NgD0069L4nEhjp9cVrwAWfmSp/fvie3ncAUODSXi0cvCLp2glSbrE/2rYIe6ECxRpNTrbyAO4bkU3ky2OWCjPNcSy99IGIThuOpuiKCFy3Ru6N9QtG0yRWTxaVt0XYgstW1Ko53m7BEqtWOzBPL8FInrbbBE2Q/H5DLsGrESS1ATRfm1ZQIxjcNYtxIUbWukjcDg1DpGuF6qPPom1rcmjHR/CZqzi9porOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(346002)(136003)(396003)(366004)(6512007)(186003)(2616005)(478600001)(6486002)(41300700001)(53546011)(26005)(66476007)(38100700002)(6506007)(54906003)(4326008)(83380400001)(66946007)(31686004)(2906002)(8936002)(5660300002)(86362001)(6916009)(36756003)(31696002)(8676002)(316002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnduWFRSTDhYcEwzd3lmdktGVENkUjBtWWtNUXRrRVdiWWVndDdhNGJlaElp?=
 =?utf-8?B?NnVzTjFZcm1RTEd6WXdUTFBZSytqUTgyVURNdVdGL0JhT1BRaldyZjBVaU1h?=
 =?utf-8?B?N2lqOUVtNXBTZWs5VG9wcUhiTVB5UVpzbTd2VGhWOXlzd3I0SVhXeEFHTnFo?=
 =?utf-8?B?THJKMkpzWjRTcHY5emJaZ2RsekVPWkNTNVdVUmdsQjVLRmZEUmYrOUx6bEpH?=
 =?utf-8?B?TEhCMEpGRCs1ZEY3S3JLRVlYWnpDNk5La2RuVVdlajdXNEhpUTB1VStMa250?=
 =?utf-8?B?MzhPeGV4RUtZSE9OaC90aFlMbUlzWmRjaVZXTnN6cTVTVDJTK0xkWThFVldS?=
 =?utf-8?B?U1liU0loQ3c4ZjNLUGtITHI1KzFITUhmTHBHeVRibDcvbllwSFA0dUI3UzZZ?=
 =?utf-8?B?WE1CQSs1d2FNRVBXWTZjNTNPL0pRVmNPL0RuSWh6cUxRWHlvRWw3K3NkTzB0?=
 =?utf-8?B?bG14d2h5V0h0ZktOVjBqUGF3NlhKc01MTUNLeFFGV1F3eUt3Z0xZbEUyUnl2?=
 =?utf-8?B?dGYrOSswR1NpR3pKZElZVXV5UldLeVpXQzVaWk5CKzgzb2VoZlMrY2VubEF3?=
 =?utf-8?B?UGpmUkJ6WWFteDdhdG81emhSWDRMQ0N2c083eWppN3hyVmNRZjFHWnhDT29q?=
 =?utf-8?B?cmZrVkpENUlOTjZMWDc4Z21hQWlReGxNOEl3WGhVM016ZHEzYnMrajFIOUph?=
 =?utf-8?B?R2VNMEdzVEc3NUVsMk1FM09wdmMzYTUrRXp2UXJocFRKRWtiUkJ6QnFIU0Ru?=
 =?utf-8?B?TjZqYUVuUDc0U3k0d2Ixa2dLeUV4cERnV01qb3NPQzFET3NDNW52RWd2R1BK?=
 =?utf-8?B?S1JvWUt1RDZHdkt5VGhNZ2o2cTZNcFFTQ2lsYXBXL0k2WXMrV2FRR0dJckZH?=
 =?utf-8?B?bWFIMStqTjhBR1pXNEhFYmxEbzVRS3k4VjFRbEZzSTR2eXlGWEVDNG5IZHFm?=
 =?utf-8?B?MHMyU3lZVUV1enAzc2luUGMzZzZOdWdNUmJMQlYwUXhlOFdWbm83Y2h0enll?=
 =?utf-8?B?a3lpUEZlMEY3SjVIaCtWQVIwR09wOWdPV0VFR0lnR0xYYlFFREx6akZiY2ZL?=
 =?utf-8?B?UGY4bjdGOE9Wa0tnYm91cytXYStlQktJVURINVpBMEFKVTFnL0pkM0ZvTXhG?=
 =?utf-8?B?RlNaL0crNis2bmNhVE5nTEV0ODhrWXl4bDhqdFpJbStKR2RibGxtMmo2RVAw?=
 =?utf-8?B?YXd2ejN0bHRDRzNnRlFsRUFaUzRGaHlEeGFFOWYzeW5WMnYyU3hKbWR2NW5q?=
 =?utf-8?B?VW8wTkVTYmdaeUlRM0pVK3ZaRFVsWFRpYmZFODJXSWlZOE5FeVpxeDgvMnNk?=
 =?utf-8?B?THBraHFkSGpYeGJTOWVIUTU0ZEEvdU14ZkVVOFRuUmdpMHF3UGgrZTA1dzRs?=
 =?utf-8?B?dU4wWjV6QmQ3WEZNSFJRdW1MT2lScmJQeENTTE1FQmxzcVp5aEZOM016cGhy?=
 =?utf-8?B?OXpJSnNweXhTZEFEWm9iSDJDRUEwTGhFaHRvMmt2OXp1K0VCR2ZFZXc5eHNP?=
 =?utf-8?B?bDlKZHVhdGhCM3drWFBGZERDaHQzcFY0NDQ3Rm9oazlacHFsNjNKdFRtekQy?=
 =?utf-8?B?Z3BzQ1EvL1JsaG9wUjFoNkVPcld0TkNuMjdseGQxQU1tS2s0eWdXbFJ6Nit5?=
 =?utf-8?B?b21yazJSWEZUN2M2dVZ5V01zdEdibG1ZdXhkTjhRdC9nWE9BWTl6ZmVOQzc2?=
 =?utf-8?B?cHEyL0VpYThnNzJ5T2Q4aTlTRktOSTA5Mk9LN2hPUXlEdDdnSGpsWWdEOW10?=
 =?utf-8?B?YW8rZnJuc3JvQTJtWkhVWWt4KzlJNVUvR1NQNy96QmtTTnhmWTFuNEc0eWZo?=
 =?utf-8?B?TWVRMFlYaEt2cEhUcWhQbUJISDZvOFJpV3FpWE56Qmh5U0NKd1AvcVhFRVhD?=
 =?utf-8?B?OGVTb2JuMFdGNUkydktnWWlYS0JVTTRFYUVHblNuMnhGSEw4NXdzTGZWL0dL?=
 =?utf-8?B?VWhabk5HTm9QV1FrbmduSW0zbURlMWVPVW5ibHZvVmxZVjI0cGhlZTBNcy9t?=
 =?utf-8?B?TGVuRmJraVNhcjIrUVYvK052R0pQSUo0NVV6aTVtRmY2SGZiSDZzQjdFb0tF?=
 =?utf-8?B?WDQ5VkN3TG1jTHpYOXZ6TDF1NVpBQnRHdVlQT3JkQTU1TzlSWGlFN2pYRGVa?=
 =?utf-8?Q?Sc+16HYHIvS/YsoS4OQuJwfYl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb64c329-5092-4c8e-023d-08da694f5cc1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:24:40.7082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfhBTtjIOWie+wmwcB4hCuA4QmwysyaQNaxam/nm9IOSzEJZsIWcIWrhE468Xxw4I+EhjBDSrIjeJjCHAT43+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6854

On 18.07.2022 22:50, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/vmx/entry.S
> +++ b/xen/arch/x86/hvm/vmx/entry.S
> @@ -33,13 +33,12 @@ ENTRY(vmx_asm_vmexit_handler)
>          movb $1,VCPU_vmx_launched(%rbx)
>          mov  %rax,VCPU_hvm_guest_cr2(%rbx)
>  
> -        /* SPEC_CTRL_ENTRY_FROM_VMX    Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
> +        /* SPEC_CTRL_ENTRY_FROM_VMX    Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
>          ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM

Leaving %rdx documented as clobbered here is misleading - the scope of
the comment is likely meant to extend to ...

>          .macro restore_spec_ctrl
>              mov    $MSR_SPEC_CTRL, %ecx
>              movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
> -            xor    %edx, %edx
>              wrmsr
>          .endm
>          ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
> @@ -49,7 +48,6 @@ ENTRY(vmx_asm_vmexit_handler)
>          .macro restore_lbr
>              mov $IA32_DEBUGCTLMSR_LBR, %eax
>              mov $MSR_IA32_DEBUGCTLMSR, %ecx
> -            xor %edx, %edx
>              wrmsr
>          .endm
>          ALTERNATIVE "", restore_lbr, X86_FEATURE_XEN_LBR

... here, but that's not necessarily what a reader might gain. Plus
with the change the register isn't clobbered anymore.

> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
> @@ -176,7 +176,7 @@
>  .macro DO_SPEC_CTRL_ENTRY maybexen:req
>  /*
>   * Requires %rsp=regs (also cpuinfo if !maybexen)
> - * Requires %r14=stack_end (if maybexen)
> + * Requires %r14=stack_end (if maybexen), %rdx=0
>   * Clobbers %rax, %rcx, %rdx
>   *
>   * PV guests can't update MSR_SPEC_CTRL behind Xen's back, so no need to read
> @@ -184,7 +184,6 @@
>   * while entries from Xen must leave shadowing in its current state.
>   */
>      mov $MSR_SPEC_CTRL, %ecx
> -    xor %edx, %edx
>  
>      /*
>       * Clear SPEC_CTRL shadowing *before* loading Xen's value.  If entering

This is used in SPEC_CTRL_ENTRY_FROM_{INTR,PV} after
DO_SPEC_CTRL_COND_IBPB, which documents %rdx as clobbered. Since it
doesn't actually clobber the register, it's the documentation line
which needs updating along with making this code change.

With the respective adjustments
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

