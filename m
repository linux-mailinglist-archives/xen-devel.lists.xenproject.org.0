Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F59D49B73B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 16:09:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260461.449972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNRE-0005kZ-Tn; Tue, 25 Jan 2022 15:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260461.449972; Tue, 25 Jan 2022 15:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNRE-0005ij-Qk; Tue, 25 Jan 2022 15:08:52 +0000
Received: by outflank-mailman (input) for mailman id 260461;
 Tue, 25 Jan 2022 15:08:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCNRD-0005iZ-MX
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 15:08:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b908469-7df0-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 16:08:09 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-mFOkSpw_MiSBwktvugYb0w-1; Tue, 25 Jan 2022 16:08:49 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4881.eurprd04.prod.outlook.com (2603:10a6:208:c8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 25 Jan
 2022 15:08:47 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 15:08:47 +0000
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
X-Inumbo-ID: 9b908469-7df0-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643123330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzmuLSJWvxxUUir396QfJ0+0rafvIDGyCoSlzTrMYbY=;
	b=JwE9dPTnELDCHySbmzU/bpfmgMHvWYOF8eWWGX4X5heEZywjAE0f8HO1aBXOB8qC2RoSl8
	Q5KVpa8MUtFyiyTsQY6UAOHyPVxI6/lJAB1ooySmbrT5jxHVbw/3g7NDiT/yZm2M/e29/L
	CKQnp/PjnmEKtbrsJrmw13v/OILLYQk=
X-MC-Unique: mFOkSpw_MiSBwktvugYb0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpeTivsvj09MHy53e4yyMlMF6p7cds87Sc2YW7sUw/YxDaSA9lcPhEtiw2+ApwY1WdmU0SlQuMKD7Vs/OlkggOWlKjzAOw2IvRoTReDQaAgMkBu62xX14RISj2U9SxdyTkRu9p5skJGSl6d/xp+85YDDLf1Zyz6yv9TTbCwd/sNHiPu1PWDPeolU/M8QsAcWB54qW9k960RL0LdJBmJfGYWWL5APQXzILZewmPoZVCcSJZOoX9AXqld9xsH8sEa5m4Lo54O/7wt8+wtZDxHqwItS3LkGVMEg9EXqefxSZqK534fNSXK7PXwLZSUhAHQt7OPZolPNtCLTe9RQbNzF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzmuLSJWvxxUUir396QfJ0+0rafvIDGyCoSlzTrMYbY=;
 b=SYo7xcO9jfD4gcDfgxfJ7M259EX765xrw3oYi3rYz9RZNl7icgw/6AKYAIJWdY8+D9u+hb2VY/Tlep8b/WcR0ihdgSZPx1Bdjp2+s/rbqST/grAYN5mE2nVK0of7JkKh8tmUOa/cIBVAM4hHyoBWxC6AH6UZM/FtNJxrccEl3vCiPg9gJlyjlkgTDqKq9vwjYeEQ4ArZLyBxJxwJhcXqP+bpMPFoVy9RHaxxTc5kjw7e4YtoE9k7xqF4yfiuY4GqHfnywHzfteDICL2g2+VJqxryiv3KNwpxQvW8SklKUBrAyB0p+8w0GOwcAuN8r4rwwU3i1NFLc8H3sFrDvyujUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d8a339f7-b875-492a-8697-1195aeffd8db@suse.com>
Date: Tue, 25 Jan 2022 16:08:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86emul: recognize CLDEMOTE
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <5812dc8e-d77d-f9de-4f37-b0ef094c5c09@suse.com>
In-Reply-To: <5812dc8e-d77d-f9de-4f37-b0ef094c5c09@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::23) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8edfb453-ca45-498c-85ed-08d9e0149675
X-MS-TrafficTypeDiagnostic: AM0PR04MB4881:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4881E59640ED4391BD8C87E5B35F9@AM0PR04MB4881.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fs4Ddw4ebwcXz8ICGhKs2bg9wVO4MO24QgqEQRgov7ADeLetlaE561CvbfAy+cwiYKlNLKxVWCmm4wn3zZ0uVms5QJH8ijrCk8vAXzUNdW1ViNX2FOnlz6hHWlCVG/QwIM7CSQBvpa79jIb2/Eg2V/20BDgQu6wVI/yZIdzyELYL4fBvD40tX2tgxuc2KFTbGYr7IkuAAOp4M2qCpjofUnNMEN02LrCx+gL1wfcHiYj0ThOJhp6A+i0oDUV2bIJKWlsXrLe9UV7SHiMA6060sgx97RZrEXpqR7zo1njcsWqB+kUmyE6jHGgx2FgSLJaF+Jd8KwahxiKIjsgreUsitIgQcDL+tIM5F6548GKWfkqGlMIOhvbmhlORV+7UA/3jD/0EvtLU8KR4/9oepo+cqQlU+ayMzk4S/8lyMkxjjFtFTW6+ZR9SUC7i7Qv7P9GTXPOtwO44G1f6hniuB9J/Tyanur0Hg/3KnwdpDmupZnuT0N/nn26ZDtFjfYtWA5ut4P9UK4MUMnLuRrk0UISqGpZIe8/yBixhMfO3ql30O5oUdBJ9bfUC+KnDHtC6vTqPywMzAuhvRDWOpCKnIubExUXnWBbZ1KO46fQfoWRzd6s6SUc8Bu8Tey2Hwx1ng2tMzm/w+AfDuLXWp4NWWfUbT+qk1KLGN5v4jjMh4EaQVxMQQzl4BrBlPA6aZrajQzMQo+GWt2n2gtcvoveoHbubtnxEE2MvEo+hg39WmnBclcgD051ZOU5Vo29BC+E+/ZXK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6512007)(31696002)(86362001)(54906003)(316002)(6486002)(83380400001)(508600001)(6916009)(53546011)(66946007)(26005)(186003)(2616005)(38100700002)(36756003)(8936002)(5660300002)(31686004)(4326008)(2906002)(66556008)(8676002)(66476007)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnpmZTY0dXFVdkNDajN4R0ZJQlZoc0ZuL3FkZG9xTXgxcFFhZ1UwMDU2T0oy?=
 =?utf-8?B?NnU2Q1prZi9hT3BjWDhjSTFSdnhIQjVaNGRTYis0R2VmNmJoNjBEcWNRMG1H?=
 =?utf-8?B?dUZlZmkvdDBqdCtBZlY2WENXSldXa2tpRGVUZG9UeWhZbENTYkh4T1RUMzls?=
 =?utf-8?B?VC9acnlNWUJWS3dOazFUWm90QW0wUXZ1VjZmWUthN3k5dkNqZzV2TWdKK2V5?=
 =?utf-8?B?aVYrU09HV0xxci9LeDBPTDg4dWpLRUM1cFR5djUvZW9FNUlhNUttcEhjTlM1?=
 =?utf-8?B?TGQwemE3V3FpSFlCdUxDOUwzMm9BcHBNNWwrR2M3MHBzWStIc3pESW0vaW9G?=
 =?utf-8?B?THJjK1NvMWxlS0FvYzR4TlRBRE12d05YcVAza2ttTzRxMHBsR20rdlI3d2x2?=
 =?utf-8?B?OFZFOFV3R3B5blhHRzd6NEptczdsMVpUakJMQW51bWpRZzNGazRNMmFaT1gx?=
 =?utf-8?B?RUIvWklwaSs5NHJGVTAxUU9DT3oxbzUzSUpMdFUrS1kxblF5K2N1TTNoTWpR?=
 =?utf-8?B?bnJidFJ6M3ZNY3hnaUQzempmdTN3czZBakJMdHlvQXE4VzJ0WkxVN2xMTktW?=
 =?utf-8?B?aS81N1FhZjExbUd2Rk40Y2ZSRDNpR3hvOElwaEZNaGZod04zY0N3ZUNvaUEv?=
 =?utf-8?B?ZE45VGsyRENIWTA0bHBsd0hVMGRNMGZtZEFaVXZlTmxZVkkyek1lSTVMVnVW?=
 =?utf-8?B?Y284b285cjZreTV0ak1KbHRHZS8zSW5GdEtPajFJY2hwSmhXU21yQ2RwQk9F?=
 =?utf-8?B?T1huL3JvdXdWRzVDYkxyYVUwcmMzYU83N0dCL2tVOXE3aWFYcWFvN3NnY29E?=
 =?utf-8?B?enR2cm54UWdHUjlrQlBweDFkQ1IxYjdNb2RBTXZtUGpRalhFdzRjWFJ0ZSs2?=
 =?utf-8?B?ekZHcmE4UEZCUmgvL0c5a25WbTJ3UGZXdTVBamFoa05rbjZsd1JTUGFwWE5N?=
 =?utf-8?B?NXRpejRiNUJQNmFjRTd6TTRwaElhUHZaYWlQaW5kTkdYc1A3QzBJLzVDWUMz?=
 =?utf-8?B?b3ZOYmh0ZHdPZ1FXbnpYUU5ra1FNWVRlYjhVS1NYWFM4Nm84U2h6d251WHRZ?=
 =?utf-8?B?ZTRwOGgvY3EwcG5VY3N3MXFyOXBsOVVmY0EvcUVERlRSeXVjTGhlWGthS09R?=
 =?utf-8?B?Wjc5T3FZTEpGUkhaWHdDa290OXVwTlZFYXVCT296Yis3cEltYWwrVFd4K1ow?=
 =?utf-8?B?RVFrWXNtL1lrUW9QeWtuWG8wRWlnS1hKUkw4R01BeGJ6S3lidk9NRmxvdHVK?=
 =?utf-8?B?M3hpSVhPRmxlSEtHUURnNmRXSXI0WnZMVXlWOVJDaWNGSUJCaDB5czZPMGx2?=
 =?utf-8?B?b1UyWHZweCtLbFVqV2pocXhXQnNUUGQwMEpmQ0lNV0kyUy9lS2FqVXBKTGlN?=
 =?utf-8?B?cFl4U3FCckZ0WE1xemhTeXpVMUJIOWx0MzVJRGFRS2hzekl2NXBWbXlkQWZ1?=
 =?utf-8?B?RmoyVW1MSUxSYXA2Ui9wSWdKWVVJTzQwNVE5dWd3U3BIamVETlRuR0I5czNM?=
 =?utf-8?B?M3N6VnByVWlsMWNrT09vOUFnTWRnbDV4elhPcXBza1FNcDFwczdlVXVHVDhr?=
 =?utf-8?B?aFFLRGpHdzlabXFCR2J0MW5QQ0pMUHU2WlBib3dFSzVZRVRaajM2anVTdDM5?=
 =?utf-8?B?a2RrS3gzbWdtOWM5TWxqWER4VkdaUEliWFZ0MlFaU3c4bmtscm54NDdEaWlS?=
 =?utf-8?B?aWJVSEcxcFhhdFNwRW9zdU1QRTcyV2ZQNHNrci92SDhsempLOVR6ZFZvekps?=
 =?utf-8?B?U2ZKRTJWSi9aemtwT3hGTDd2ZXJzaHk2bzlUalpoVnFrdEtXWGppMlNIQWlN?=
 =?utf-8?B?MzI1SlYzMHlQUEtkenFzeU1HNGNaaURiQjFEeWVlaWFPVnJQS2tidmk4M1JD?=
 =?utf-8?B?WnUrS1FiZHg3bnk0N3doU2NVOWxWVjltUUlQTEdWa1pERE0zSU96M2pUUmhR?=
 =?utf-8?B?b2FocHVZbjNPMmFVbUpxbjMrbVJVL1BSYnlQa05OQlFQSmRxQ1dVQ2hOblF4?=
 =?utf-8?B?ejFPU2MwS1FiSE03cTR2U0JFSElLOXRyYmFzME1KWlk4STZrNVVaOG9sandw?=
 =?utf-8?B?OW5EZHQwZ1JzTHBmQjBkMHBNRkxaQ2FaUTFuSHZmQ09WN0I3RWZ0NFlYZ0pT?=
 =?utf-8?B?dUxFVGR1TWtMUlFGbHU2RHR4WmZEejcwMFNSMjduajNMQmtYZGJJRjBkeUxF?=
 =?utf-8?Q?/7EsLa5YiisuAtD0rTcsPeU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8edfb453-ca45-498c-85ed-08d9e0149675
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 15:08:47.8669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0MwKeAi7gh2DmCh9wHtmKkKy5K+EGVHx1QyyfukWb2Ww3shxuIz/+YhmnEpoXOsKKqalsaeijveOgmwQB1deA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4881

On 25.01.2022 15:22, Jan Beulich wrote:
> We claim to support the insn, but so far the emulator has been handling
> it as a NOP.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm sorry, I should have Cc-ed Paul here as well.

Jan

> ---
> While handling x86emul_cldemote separately in hvmemul_cache_op() means
> to carry some redundant code, folding it with CLFLUSH{,OPT} / CLWB
> didn't seem very attractive either.
> 
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -23,6 +23,7 @@ $(call as-option-add,CFLAGS,CC,"xsaveopt
>  $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
>  $(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)
>  $(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
> +$(call as-option-add,CFLAGS,CC,"cldemote (%rax)",-DHAVE_AS_CLDEMOTE)
>  $(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1",-DHAVE_AS_QUOTED_SYM)
>  $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$$(comma)%rax",-DHAVE_AS_INVPCID)
>  $(call as-option-add,CFLAGS,CC,"movdiri %rax$$(comma)(%rax)",-DHAVE_AS_MOVDIR)
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2351,6 +2351,28 @@ static int hvmemul_cache_op(
>           * to be sensibly used is in (virtualization unaware) firmware.
>           */
>          break;
> +
> +    case x86emul_cldemote:
> +        ASSERT(!is_x86_system_segment(seg));
> +
> +        if ( !boot_cpu_has(X86_FEATURE_CLDEMOTE) ||
> +             hvmemul_virtual_to_linear(seg, offset, 0, NULL, hvm_access_none,
> +                                       hvmemul_ctxt, &addr) != X86EMUL_OKAY )
> +            break;
> +
> +        if ( hvmemul_ctxt->seg_reg[x86_seg_ss].dpl == 3 )
> +            pfec |= PFEC_user_mode;
> +
> +        mapping = hvmemul_map_linear_addr(addr, 0, pfec, hvmemul_ctxt);
> +        if ( mapping == ERR_PTR(~X86EMUL_EXCEPTION) )
> +            x86_emul_reset_event(&hvmemul_ctxt->ctxt);
> +        if ( IS_ERR_OR_NULL(mapping) )
> +            break;
> +
> +        cldemote(mapping);
> +
> +        hvmemul_unmap_linear_addr(mapping, addr, 0, hvmemul_ctxt);
> +        break;
>      }
>  
>      return X86EMUL_OKAY;
> --- a/xen/arch/x86/include/asm/system.h
> +++ b/xen/arch/x86/include/asm/system.h
> @@ -37,6 +37,16 @@ static inline void clwb(const void *p)
>  #endif
>  }
>  
> +static inline void cldemote(const void *p)
> +{
> +#if defined(HAVE_AS_CLDEMOTE)
> +    asm volatile ( "cldemote %0" :: "m" (*(const char *)p) );
> +#else
> +    asm volatile ( ".byte 0x0f, 0x1c, 0x02"
> +                   :: "d" (p), "m" (*(const char *)p) );
> +#endif
> +}
> +
>  #define xchg(ptr,v) \
>      ((__typeof__(*(ptr)))__xchg((unsigned long)(v),(ptr),sizeof(*(ptr))))
>  
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -6290,7 +6290,8 @@ x86_emulate(
>  
>      case X86EMUL_OPC(0x0f, 0x0d): /* GrpP (prefetch) */
>      case X86EMUL_OPC(0x0f, 0x18): /* Grp16 (prefetch/nop) */
> -    case X86EMUL_OPC(0x0f, 0x19) ... X86EMUL_OPC(0x0f, 0x1f): /* nop */
> +    case X86EMUL_OPC(0x0f, 0x19) ... X86EMUL_OPC(0x0f, 0x1b): /* nop */
> +    case X86EMUL_OPC(0x0f, 0x1d) ... X86EMUL_OPC(0x0f, 0x1f): /* nop */
>          break;
>  
>  #ifndef X86EMUL_NO_MMX
> @@ -6627,6 +6628,12 @@ x86_emulate(
>  
>  #endif /* !X86EMUL_NO_SIMD */
>  
> +    case X86EMUL_OPC(0x0f, 0x1c): /* cldemote / nop */
> +        if ( ctxt->cpuid->feat.cldemote && !vex.pfx && !modrm_reg &&
> +             ops->cache_op )
> +            ops->cache_op(x86emul_cldemote, ea.mem.seg, ea.mem.off, ctxt);
> +        break;
> +
>      case X86EMUL_OPC(0x0f, 0x20): /* mov cr,reg */
>      case X86EMUL_OPC(0x0f, 0x21): /* mov dr,reg */
>      case X86EMUL_OPC(0x0f, 0x22): /* mov reg,cr */
> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -177,6 +177,7 @@ enum x86_emulate_fpu_type {
>  };
>  
>  enum x86emul_cache_op {
> +    x86emul_cldemote,
>      x86emul_clflush,
>      x86emul_clflushopt,
>      x86emul_clwb,
> 
> 


