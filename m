Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4906969C7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495350.765703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyIU-0002U5-Nz; Tue, 14 Feb 2023 16:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495350.765703; Tue, 14 Feb 2023 16:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyIU-0002RL-L1; Tue, 14 Feb 2023 16:36:50 +0000
Received: by outflank-mailman (input) for mailman id 495350;
 Tue, 14 Feb 2023 16:36:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRyIT-0002RF-J1
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:36:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c693a1d7-ac85-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 17:36:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:36:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:36:46 +0000
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
X-Inumbo-ID: c693a1d7-ac85-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFOoAOHI6nRZtjwrRLa62i8f+D340Q9VkjfsM+/6wjmfFth3LYOJM6nk2QKR7k8c9HjUugFUGToZeG8DOkJEHvZyzwGj38VFm3t9ZCMPFhZAC84jPjT9JDn1YG66WmMvamULbVoY8P4mpY64OwKteEGPR6BytPkPwuqkODfobReJhHG6FngWi2riC55XyYXoHjlm2YVCuRr7Ia5Mpzcf84PUcDMMTswpsFk1yq9tLuOHgO5Drd0nQ0YHWsWFm2KlQgG8s9JVUeWkiwz6j89stcakk/v42WuRaE46ClZGkMAP5FP7Km47dWsu8xOn7VUiaRwZlYvnUPv8lrmqVbIvvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wLZdtPbWHxYTlvWrqzkBQatYcECfedhQOcN11o8W/s=;
 b=c2CzqJF5yId+i0s0j2msyr8dJCRrTRH3d8aNGbxH8CNdtbDphzrrpM73IyL2Jq9CfK3PsSRsziGmQ8lvhQjTs6WnQqcv5IWnYM4vh0E+oaPSuR/P2U+V/1FRvANugSFxHO5FvLAsj9XFKwkFN8WyCRBRYOxdiUlMWrpnUkJ7yE8AXve4rCWCUUSvjRswTRCvgo29c47YdrwR2BZ4HmGhoN607rtEYCqn9JLeEepVpUBHxP1IJfX5VQ0Hd0SaAUIV6Kbh25kmU0DG1HWX3nLkQpqqMXp4v2ViKItiOd23JziEk/M8bA4kaPESprlStQ4y1hiDUGNK9RiZaGznAPDNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wLZdtPbWHxYTlvWrqzkBQatYcECfedhQOcN11o8W/s=;
 b=NjENAanRug+1DPl4QNriHv9FqXCNTMToh5VWtF7X8sSGV+qvgUAZUBlLA/J0rfizaGUwUti+p4rqY4RHcMK/Z0XRTtdCIwMhReqhr2ciiFHYKdLK3dipd1txP4oW4SNKn60IFhutqmPzn2uyPMNWMaBL1cgAdZKnsv1r+jplcMJtdPBvQqDCjK/5s+Az9TxwwLP/KjCRzsoW/9i8qcoO+BHgsHM8kHHfh7MKX48jOi3OHOIVqfckb0wYC7abMHcNwnmw5t9kTKokV/TP/TuGLw0L7eZ+yzC5Kkf8q6rd4aI+HIMcYrbTBuuosSoO3PVxN/CHGMb4ZjW/tsMzqfL6dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ddf5aa2-8bb2-9831-fdc6-833bb4d259f7@suse.com>
Date: Tue, 14 Feb 2023 17:36:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC 08/10] x86: wire cpu_has_svm/vmx_* to false when svm/vmx not
 enabled
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-9-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230213145751.1047236-9-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 10af31ba-96df-42e9-b222-08db0ea9a9f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bCM+FWxNIaFbOaJYg5tRQ+54EfdG7Q4xrjWuVotmoDdBPZiaI/lxewJvg0tB4J+tChFejdBqJBoOQ6ZNnPErRsDdH0O7PKUIxpv15R4lK6uF4uIzCzHzi5Fix7Q/R+UEIrUCj0vS5lb6Lp3udGyVXXqss8VzbG17rI5hHHFmjbjhL1GS2hkG9AeHsEIzMM4rbnwqlVOz0Z3MmCpKOxLLvPMvZ2baSkEcW6FUPVFbrmTRtfzz35dJPOMgIPZZ+khWbU//txYTiXt8/ZsIx9X7+h0GvuvO2I7o/SfBqf5yOMFZhVPUTb+bbr7GLZXAhDU7rCQeOpQs35sA27XJu9sLmQNsNBGMhh12ZfQVYOmiXQCenj3MK3OZJMB2414c1Ou+rwE4BIP8u6QIeGaLKejs/DvJe8Oixu0nr4dd6dawQg1GPajKIRV9PGOGDJKyJmdsBFcT4O09Xkvb8mBI8kCDNDzKXp5ritDFSy6VL/jDM8LwnQTCQBH2FU8/gUufMZWSRMjvxjbNdPHC4JDAJPK+MeQYsg/5F45Uu8dvEvWkQ9WYFcSitlJX90zNnLVFRzvoDtO+lPzS12zLUbRJfDCgv1/EAobckRFUVUlPJ4WGPdEv8GQkWs39FpPhiYGVoZJRZuoZLKnSdRqfuuGRx4Qs0NJDwK6mwC/oVz1ZnU02Yfz+Rj8CSGdaSzW/zBDYy+gwRvtc2amHeay1rExtiDIEbaUO8dnhOidtCfTVvaN7qCY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199018)(66946007)(83380400001)(54906003)(316002)(4326008)(66556008)(66476007)(5660300002)(41300700001)(8936002)(8676002)(478600001)(2616005)(6916009)(53546011)(6512007)(26005)(186003)(6506007)(6486002)(36756003)(31696002)(2906002)(38100700002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkNhemJxL2JBU0swdHhSS2JwL1puZGREbEwxaGpPTUx3cHZpTTZhOThkMGpD?=
 =?utf-8?B?djVVM2hIdjdFZUlHQklleUJwZXFKRDFWTkRZOUVJREZ3VmlFN21GamVqeFhk?=
 =?utf-8?B?SGJwYmZLcFl2V1lPSGxkN1Z3SGdnQ0sxQm8wOERCTmRDWitDS3FScEo3d3B4?=
 =?utf-8?B?akQrTUY4cE1SWUhlS0t3TlVwT1M2aGRBMHN1UW0rZC9lV01ad0lnaUk3ekYy?=
 =?utf-8?B?VEJHQzJ6SzlmZ0FrdFcrZWlzTmRRZXE5U0p6MFA3QWpsUTNoWm8rYitoaUNn?=
 =?utf-8?B?VkJyM2FEVTV5WTNwT2tPbThWZk1WTXR0cDA4RjEwczNpcmJvbkZIbkppaGtQ?=
 =?utf-8?B?cTJBbXZWc0YzR1RqM3pJNW5CN0dZZjIwZEJvQVMxY00yK0xCaHlXQWxITERQ?=
 =?utf-8?B?THdFTjJjNnd1Y2UwVkU4YVpvYVFUQXFHSDJEdnZrRmhyak16NUZybmwzRnBw?=
 =?utf-8?B?Vnd1V3JKUFl5bW5FZ2FzVmVienRFSGJDd2ZkWXd4MVArV2RiZjNhVCs1UFdk?=
 =?utf-8?B?WHlFdnlxTFRCRCtlSUV0WnUxbmQ3c0NzdGdSQkRCS0JSM1NvMlpmWTlNY05K?=
 =?utf-8?B?Y2hBQkhYYUtlanVsUldmR1RYUmg5QWFlV25Vdk40VnVHSURWM2d3bGhDRmlo?=
 =?utf-8?B?WXRwZ0FoVDNtaDNVaDJRYnZVSmUyQ2VhV2ZKYUt3WkE3TlBqMGdmMFJBeVRa?=
 =?utf-8?B?UVIrTlBuR1NkUkh6MkNJOTc5amx1ZktmQnJST09oZWtLdVhiVENVL1U5NnNF?=
 =?utf-8?B?Y0paWlB6VGsvSE1OdzNTRzUvcUNQQjZQMlREOHhzaUQ1eGo0L0JkL1AvTHRT?=
 =?utf-8?B?QTJJbUNRWDN0NlBoODZkMGVWRjNKK29Uclp6S0tWYW5mUGRiRlA2TWplR2xC?=
 =?utf-8?B?TmNKcS9IS0Y3ZGh4TnE5a1M4dncvZGZOSy9HK0NVZXVJWUpNWEhTMHR6dlRD?=
 =?utf-8?B?RFBHSTgwN20xOEdNbHNmYUo1KzZwaVR0WFp1aDRyRjM2K3R0QlNwTDh3TGE1?=
 =?utf-8?B?VlNwY25qaXlIMUFSeHBNZ1A1cGRYMGZPNzkrc25oYjFmUUp3OWNaejEzUWVK?=
 =?utf-8?B?aGJTWVdMb1RCdklPVVF5cTNtcXMwK3ZWWFBEZGUwVm45M04xOGZ5dEFYc084?=
 =?utf-8?B?c29XSEVkd3JxL3RMNDZHdzFLMEUyZ3E0ZmZDRVpmdkRBUGx5RmVNSnN3ZkVs?=
 =?utf-8?B?ZFA5QTFSZ3pycHNnRVRHMlZMQm9iUVhGRDk1b3ZqMW53Wm9EZFVPaVFMaFZi?=
 =?utf-8?B?RWNHckhoblRiMy9wN1MxL0tGTTMvckVoRUJsZS9DRXpydVd1dXprS0tjSmFC?=
 =?utf-8?B?aDhyYy9wK1g2TXB0amVOQVBKQ0NEajVVSlZyZm1BS2hmR0FhS1dBK211UmJw?=
 =?utf-8?B?Vk5wVHV0TGhKa3pzZzRqRWxEMGp3N3orWHFYTy9VRUtuWE5IbUNONjh5UjA1?=
 =?utf-8?B?RzZxMDViSDRQVkVIc1dmUm9tZE43TmZLYUxMSzNURDhWdU1McTV6dW91MHVC?=
 =?utf-8?B?S0RUMjA1S2FEakF6MisrazlFMkM4NDFRTXAvSE1rWEw1cmFoTDhXM3Bta1pM?=
 =?utf-8?B?ajliTHFOQXV2L3hYOEt3WDJJVjJBRjhWL3l3VzZmZlhFL3BIbWljUlk1UjVT?=
 =?utf-8?B?WmFqSVZFUVVPWVhIU0d3aUViN2plZEZzbzdiRnlUekM4ZHdybGJ5SGdsbmtr?=
 =?utf-8?B?VTM2UWhNdTkrL2RiLzcwNHJ5Y08rMnV5d2M0eG5tWFVXQXRQRldXYk5BOVRw?=
 =?utf-8?B?WHNXNm9BV3YwQ1pEWTA3SkkrdHdlTVc0bVBHY2MrYmhXS0dlU01tK1pMdHpD?=
 =?utf-8?B?UnowNW1SZmJKWndsZ04wUzZvb0NiVkorcThqL1BnM0FOeFhmbTUyMXNNRjQv?=
 =?utf-8?B?RFo2Um5HOFpvdTFNL293K1I5aGdIQ1AyOXV0WHlUTlBBZzZqcGN5b3FSTnp2?=
 =?utf-8?B?MjdNKzBQWlNhNTNjRDBZQ2oxaXcxWitOTWY4K1VrQ1NKWGJTYjV3eWdxcnAw?=
 =?utf-8?B?ZjJJR1Rra013RzNoK215LzVmeEV2QnFuT2JneGFicDBkZnBueFhYMmhlZTBX?=
 =?utf-8?B?bUhreHFPWTlqQ1dHYTE1MW5ZYnhPSU93cFF4ZWV6STZ3Mk9kRFZGQWpjL3Fh?=
 =?utf-8?Q?zck2tvWpXS6U0KvMSTZwRfh6q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10af31ba-96df-42e9-b222-08db0ea9a9f5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:36:46.8176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkCEiXij+4X7JVXMN/C29unxYb4bhGfUy66Hfs1klV0X29TtmSRJ8xJQ69IGUJdmIlWfIKiovBSdnlTY4A9zeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599

On 13.02.2023 15:57, Xenia Ragiadakou wrote:
> To be able to use cpu_has_svm/vmx_* macros in common code without enclosing

Both in the title and here the spelling you use made me first think that
you talk about "cpu_has_svm". May I suggest you follow what we typically
do and use "cpu_has_{svm,vmx}_*" instead in such a case? However, the
title may want changing anyway:

> --- a/xen/arch/x86/include/asm/hvm/svm/svm.h
> +++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
> @@ -80,6 +80,7 @@ extern u32 svm_feature_flags;
>  #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
>  #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
>  
> +#ifdef CONFIG_AMD_SVM
>  #define cpu_has_svm_feature(f) (svm_feature_flags & (1u << (f)))

Why don't you simply provide a 2nd form of this one macro, leaving all
others alone?

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -294,6 +294,7 @@ extern u64 vmx_ept_vpid_cap;
>  
>  #define VMX_TSC_MULTIPLIER_MAX                  0xffffffffffffffffULL
>  
> +#ifdef CONFIG_INTEL_VMX
>  #define cpu_has_wbinvd_exiting \
>      (vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
>  #define cpu_has_vmx_virtualize_apic_accesses \
> @@ -352,6 +353,36 @@ extern u64 vmx_ept_vpid_cap;
>      (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
>  #define cpu_has_vmx_notify_vm_exiting \
>      (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
> +#else
> +#define cpu_has_wbinvd_exiting false
> +#define cpu_has_vmx_virtualize_apic_accesses false
> +#define cpu_has_vmx_tpr_shadow false
> +#define cpu_has_vmx_vnmi false
> +#define cpu_has_vmx_msr_bitmap false
> +#define cpu_has_vmx_secondary_exec_control false
> +#define cpu_has_vmx_ept false
> +#define cpu_has_vmx_dt_exiting false
> +#define cpu_has_vmx_vpid false
> +#define cpu_has_monitor_trap_flag false
> +#define cpu_has_vmx_pat false
> +#define cpu_has_vmx_efer false
> +#define cpu_has_vmx_unrestricted_guest false
> +#define vmx_unrestricted_guest(v) false
> +#define cpu_has_vmx_ple false
> +#define cpu_has_vmx_apic_reg_virt false
> +#define cpu_has_vmx_virtual_intr_delivery false
> +#define cpu_has_vmx_virtualize_x2apic_mode false
> +#define cpu_has_vmx_posted_intr_processing false
> +#define cpu_has_vmx_vmcs_shadowing false
> +#define cpu_has_vmx_vmfunc false
> +#define cpu_has_vmx_virt_exceptions false
> +#define cpu_has_vmx_pml false
> +#define cpu_has_vmx_mpx false
> +#define cpu_has_vmx_xsaves false
> +#define cpu_has_vmx_tsc_scaling false
> +#define cpu_has_vmx_bus_lock_detection false
> +#define cpu_has_vmx_notify_vm_exiting false
> +#endif /* CONFIG_INTEL_VMX */

For VMX you first of all want to separate out vmx_unrestricted_guest(v).
Maybe we can even get away without a 2nd form. Then I think it would be
much neater a change if, like we have for SVM, a couple (three I think)
helper macros were introduced, which then is all that needs providing a
2nd form for. (Both steps may want doing in separate, prereq patches.)

> @@ -374,8 +405,12 @@ extern u64 vmx_ept_vpid_cap;
>  #define VMX_BASIC_DEFAULT1_ZERO		(1ULL << 55)
>  
>  extern u64 vmx_basic_msr;
> +#ifdef CONFIG_INTEL_VMX
>  #define cpu_has_vmx_ins_outs_instr_info \
>      (!!(vmx_basic_msr & VMX_BASIC_INS_OUT_INFO))
> +#else
> +#define cpu_has_vmx_ins_outs_instr_info false
> +#endif /* CONFIG_INTEL_VMX */

I don't think you need an alternative here - it's used solely in VMX
code. If one wanted to this could even be moved to vmcs.c.

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -289,6 +289,7 @@ typedef union cr_access_qual {
>  
>  extern uint8_t posted_intr_vector;
>  
> +#ifdef CONFIG_INTEL_VMX
>  #define cpu_has_vmx_ept_exec_only_supported        \
>      (vmx_ept_vpid_cap & VMX_EPT_EXEC_ONLY_SUPPORTED)
>  
> @@ -301,6 +302,17 @@ extern uint8_t posted_intr_vector;
>  #define cpu_has_vmx_ept_ad    (vmx_ept_vpid_cap & VMX_EPT_AD_BIT)
>  #define cpu_has_vmx_ept_invept_single_context   \
>      (vmx_ept_vpid_cap & VMX_EPT_INVEPT_SINGLE_CONTEXT)
> +#else
> +#define cpu_has_vmx_ept_exec_only_supported false
> +
> +#define cpu_has_vmx_ept_wl4_supported false
> +#define cpu_has_vmx_ept_mt_uc false
> +#define cpu_has_vmx_ept_mt_wb false
> +#define cpu_has_vmx_ept_2mb false
> +#define cpu_has_vmx_ept_1gb false
> +#define cpu_has_vmx_ept_ad false
> +#define cpu_has_vmx_ept_invept_single_context false
> +#endif /* CONFIG_INTEL_VMX */

Same suggestion for introducing a helper macro here, which would then
also be usable ...

> @@ -310,12 +322,18 @@ extern uint8_t posted_intr_vector;
>  #define INVEPT_SINGLE_CONTEXT   1
>  #define INVEPT_ALL_CONTEXT      2
>  
> +#ifdef CONFIG_INTEL_VMX
>  #define cpu_has_vmx_vpid_invvpid_individual_addr                    \
>      (vmx_ept_vpid_cap & VMX_VPID_INVVPID_INDIVIDUAL_ADDR)
>  #define cpu_has_vmx_vpid_invvpid_single_context                     \
>      (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT)
>  #define cpu_has_vmx_vpid_invvpid_single_context_retaining_global    \
>      (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL)
> +#else
> +#define cpu_has_vmx_vpid_invvpid_individual_addr false
> +#define cpu_has_vmx_vpid_invvpid_single_context false
> +#define cpu_has_vmx_vpid_invvpid_single_context_retaining_global false
> +#endif /* CONFIG_INTEL_VMX */

... here.

Jan

