Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBBE4B6E41
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 15:02:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273195.468291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJyOv-0001yl-6M; Tue, 15 Feb 2022 14:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273195.468291; Tue, 15 Feb 2022 14:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJyOv-0001wb-2v; Tue, 15 Feb 2022 14:01:53 +0000
Received: by outflank-mailman (input) for mailman id 273195;
 Tue, 15 Feb 2022 14:01:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJyOs-0001wU-RU
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 14:01:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfc751e4-8e67-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 15:01:46 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-Z7dIUmiOOTu3pPl_zdg3TQ-1; Tue, 15 Feb 2022 15:01:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4937.eurprd04.prod.outlook.com (2603:10a6:10:18::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 14:01:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 14:01:44 +0000
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
X-Inumbo-ID: cfc751e4-8e67-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644933706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HHsgt/pCVOD8X4+s5UZ1Dj1Y4nRKXR4uUA1dt6XbSfY=;
	b=F8Zxhjw1Mh8kYZYbhL4Ka5Ie70Z7Lvi1IoI+4d1eftSmQfuKNv9le5dzKbXiA4GGPVPdnE
	XqUucy3sFIixatj1A3CW1yxGQ9qlPnzAwiVtaO85Hp/SORa/hMeusgOjG7YFiY9xYnB5O0
	qLW8gRwVgHvxu3byGZomGVQtdBMq1go=
X-MC-Unique: Z7dIUmiOOTu3pPl_zdg3TQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RY9jKxhT6nP1ubwZ9g9jjkWsOvLo8oLoj00ogOjXei7RHoCHC5dYmdpu4J/RkOrMmrzbYdiv2SFSdUZsLkRRlt/I3o3FtioAV/iXzFgR66eW0lT/xFr8j6kchjCxGTfKunJNPFLk6+yfvCXp01GLWKEgLHSJ+h5jrN6hqVWnyPcB8Kvjar43iAUQx92LRlYb6bJPcnwiVUMKplkvJ8fRKC60OO+aKBwdiaFgB4a70XBQz3L8U9djKLSaUxfp3EawOlBtOaRKUvLxIR9IdggMXBK/ncY/NquhbkCN90JzlYq1rKIIV9K0e6isq0WxayKXtX0V5Vq2xTa/8te1vp0ORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHsgt/pCVOD8X4+s5UZ1Dj1Y4nRKXR4uUA1dt6XbSfY=;
 b=cAp9uG1VLhkPFIxGm19hulH0XhAroKWNzn61zT/1h4YLM4Ok8n1iFn2uR/cGGYOJELIOATl7lZy/nWczx1sFImz0dtLSKVesl9tvIJWskpD1WhC5nApgoDNLR3MnOQLPxFkOza1c4WEu+8ZuqBPv1cVPibEP9Hwow1oMxatbmL4QeMiykFkAI3IVYf2/c6vqQHaiXJJVq0iuCcOO+e/gz6xK24a0qum/w6gC3MfQ7EWOPaJtIy2gVoozCgCVC3yqSCM7KMOO/VlK1crv2k8zw187v3gqcKW/D2A5aDWFFdt4DmHL6pMPP6rVHjzghZn13sFbL5fM3SQIGOZGvLeyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <26bc666b-e9c3-7f12-6d8d-256311846233@suse.com>
Date: Tue, 15 Feb 2022 15:01:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 06/70] x86: Introduce support for CET-IBT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125127.17985-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0025.eurprd06.prod.outlook.com
 (2603:10a6:203:68::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd3a96c2-67a8-4dd5-34da-08d9f08bb2e3
X-MS-TrafficTypeDiagnostic: DB7PR04MB4937:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4937B46E0141B0C540648620B3349@DB7PR04MB4937.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v4Qab6UF3PyBQLhlkZ9mGRo4b1DJffb479pcqGe+LxdpA56L3mfeEaLV9Xzi6QuxqSuBxtqwG2xJsAIMz2pIX3VI7wPZ9yaFSCm9Kg6kHbt7Fsds+uRlxraJVD8qZUmkkROW+JAHdTBhPYsRiNjYxEFX7aeD4JWmYTETxtQAmq8a+OWKHvyYr9uiXaRBU6e65m3WXw0gHFGR6K48JZlLaar1Crf/hODCDLlaSkZYYeo/4RsABAdT0LAGKPxgGRf/MRggsdc0n6gobTqEPpdvCB2qTZcHaP/5n21Yxmpasyatjo7ZUr/8bGv0RT/hycXnFyovEHd35iRffHAIg1VBMY/90dSpI9I2JNMfa1raPYIzuZ6r+CKua2XnTtW7azLUpSBasIpVdtZfKuakE/ABM7fRDvACcH81tca6JAp3nH38Bl2UdOFwUlgWlNGYYqmoc01lq2qbcuwAIXlUuhIXybZRz+oGdH2rbAu4cO2Rv8V+uhRwK1Q8+g3AXldVe9N7nF7AOCoErhrL3yv+vuKEi5KKAqUVZMhFD4TQofeDyPK6OFxHurAEtfCwfZ6dgppgJGNHqxzSN8yUL+o2fBheSzOCimD5L4uP24/AVRDmdbiMA3hELxmK6V/aIbqmNnzW0ZgI8HLgYt7hdpsLLlQRQMrH5Oapk4M30dn+aOtrbixHwUrkYQLb/80IvcMFsPjZUXohDVvwy8YCzIESuDKEM2NAwsunyB0Axw51goJZsEziC0wJ/JcluL3lgdRIEb+Goi/Gh3mp5G7rGjCotvhA/y5Aq6tzfRvsOB9wp1qsLRoYLdXv9vdM03fZSwC1Vwyh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(4326008)(8676002)(508600001)(66946007)(66556008)(2616005)(6512007)(31686004)(2906002)(86362001)(53546011)(6506007)(54906003)(6916009)(316002)(5660300002)(186003)(31696002)(38100700002)(26005)(8936002)(36756003)(966005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW0zYTFsSHh0L2I5ZVRUU3BOdEQxWXIxN1V0aTJ5OVhTdjhjZWdRUThjMmtY?=
 =?utf-8?B?SE94U0UzMjRKSlJlTktNSFdKOVltREhtSVJYQk83RGpsMGRxRVBYYWRvdGdG?=
 =?utf-8?B?dVgxdXZaVzVWTFVLU2hmZXZwSVAyMUJLS01LNFZmNkpKRnM5eTI5S2x0TFlj?=
 =?utf-8?B?NTZVT1Y1Y0sxb3h5S0JxZ291WVhabC9uM3JaWko3Ly9DSFQ3TGFtTWk5NHRl?=
 =?utf-8?B?UTdnNGtRbDExcmZzcVF6eUlSaWRlM3RuOE1tTUdtYlp6cy9QL1BhUHBYWnNC?=
 =?utf-8?B?UnB2MVlsRU5wdnMyQkFBcjZCa0RybU14MnRRSERiUDNKVUZKd2RqTWVEY1Fn?=
 =?utf-8?B?OWxMWlhtMFZWNDlwc0V0WTVCOFpJSFphOXJEc3cvUCtkSXV0TXYreTgyMDMy?=
 =?utf-8?B?WkxMemQzRTJuMWVjczcyaURGT3pYSGExQUlxUTRvcGN3Z0VuVzlSbkJ2dkIv?=
 =?utf-8?B?cTBaS1BISHhwZjFUMFd4ZE5tTkphdFl1TCtaYnpVeWhhbnFwdWpHNmd0MCtm?=
 =?utf-8?B?VTF2WkNTL1VvNVEwMFdnYUU3elpRazlMSU1SQjdEdUFQaERsV1JRR3RKS2tV?=
 =?utf-8?B?UUsrYzllZjd1bjZpRDlaVWtDWkd1SzZyTnc3ZlhXRlJ1Y2pjQS9TQ1kxQVg1?=
 =?utf-8?B?RUJ5S1p6ek40M1J4RjAvbklpeW5DVEQ0QkYzSWZ1M2ZrUFJSTnBnTlFTYkNl?=
 =?utf-8?B?NlE3Zit6c0VFOEJ5aVU2d3YxL01jZ3BjS1I1Y0g1Znl0MUtXN3N6UWRUQ2ZF?=
 =?utf-8?B?ZzhBL3VTUXBOczY5ZUZNN1cra0U3Rk01TTdud2l2K1o2Y0V6WHc2a0hqZXhs?=
 =?utf-8?B?d1Q0dDFzZGt5dVF5bHdCa2l6NUIrUHc4Zmk5U3dLb0JiK1Rma2RVVUdGd1dy?=
 =?utf-8?B?bWVkMDdGaFdJa3h4a2llMWplMThONDViMHRFekxPbDM0VGU2eDhMYmdvelh5?=
 =?utf-8?B?RmZEZnFIeHp2RG5HTE1BelI4bW84TWRzVGh1UjJjSFkxdnYvTUxiTGpTOWc5?=
 =?utf-8?B?akpkbkhnSHdaN3NGcG5mTlI1YkR2QUE4R3dpRjZBeU8yekxqbi94Uk83SGxa?=
 =?utf-8?B?Y2tQYkJ2L2gyc3EwMGQ0SXNHU2pwWkJ3dnMxUEcxVWZYUGVHTnZ5Y3NhMlk3?=
 =?utf-8?B?THlhOFVUMmtQM0xxbmtxbUZlZnJLQ2xXWnJQOVJLMzBwVDNmcjFnZGkyTGhi?=
 =?utf-8?B?YTJzc3NRbkFQeFJsMms5Q0p5cENFd1Fjc21DQ3hVWm9uWHQxTitQb2FxVXRv?=
 =?utf-8?B?ZVdrNXJlYkF0bzdMcXE1LzZ6NkJOVXNNaDFkaExFOXorQlVQM3VNcTJybnN6?=
 =?utf-8?B?TnlxdWhFRjVXYXVOSkUrak9tRU9KZmRDQ0VZNlNveW9oWGxJczBGQ21jQ0Vi?=
 =?utf-8?B?VXd2MmFXT3VrS3pQcDlQSTB2M0pYV1NaV3lJZGUxVStNUUU1THhGL2hSQUxt?=
 =?utf-8?B?UHNsZEk5K3RsTnBKRkZ6M3hBSDdqdnVNTUlWZm9CV2VhWU9ieVIybDQ3TlhU?=
 =?utf-8?B?MXlQS24zOUhMcTZxRmk1T0lqQml2M2Q4TDVmUjJFZE41R3F4dHV1a2hDQjFY?=
 =?utf-8?B?MkZ1WHVBK3BTM09QNUxPQnI3ZHFCalZPb295NXNxNkV6N0FTYjM2T3VtZlY4?=
 =?utf-8?B?Rit0TEtzWFNsNTNvRXgyWkpqWm1tME5sL0VlWnVDRlUwUDlzK1RDeUJaZ3cr?=
 =?utf-8?B?Vm83ZkxXSnIvTXpuL1BaQjFWZjEwUkc4WDVaMzdIVE03bXNsOVFWQWg5UlJl?=
 =?utf-8?B?ZEhjb1EyYWY1dmlzWFVnTk95ZDdWbTBuRXM5ZDBOOHFBT2F3NnkyVWwzeE4v?=
 =?utf-8?B?SElmc055Z0UvTVc5R2h4RHRZeWRwcFF4Mlc2c3dsa3l2SVNTdElyZllDUnJD?=
 =?utf-8?B?M200cGlxWmZ5UjRYMENHQTEwMURsbXdPcHVxbUZjU0lmR1JGUDdjVnpuY0Zx?=
 =?utf-8?B?bC9SYm9mQVpEcnFuUndvQTNPTHk0bnpwaUZxSEZjc2VmN3JXeFBYNUtHN1Zl?=
 =?utf-8?B?QXhjTFNBOVAxNUQ0TWRzc0twTEdjTmpvOGF2dkhaQUh1cm4yYm1aMzdWWU0y?=
 =?utf-8?B?N3hhaDg0cmNkeXRMUE9oT3FVMDNLbWcwcStvWkFkRERUZXFVaXZoUlc2YmE2?=
 =?utf-8?B?U0hNdDFqZ0Vsb1dPN3RBaDA0b0dtemgwYWFGTWJsNzV4U25helYvVGJRemZq?=
 =?utf-8?Q?yMsS6hMAHASlMXIql5WRFA0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3a96c2-67a8-4dd5-34da-08d9f08bb2e3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 14:01:44.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DpXMfnvSwL0hlx+RTq856ysQupsppTIUrYTDJV6sWoe4GjxmaYrJSe04eQT8rPRFsEFK7iHffSEAeea0sNM2eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4937

On 14.02.2022 13:50, Andrew Cooper wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -39,6 +39,11 @@ config HAS_AS_CET_SS
>  	# binutils >= 2.29 or LLVM >= 6
>  	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy)
>  
> +config HAS_CC_CET_IBT
> +	# GCC >= 9 and binutils >= 2.29
> +	# Retpoline check to work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93654
> +	def_bool $(cc-option,-fcf-protection=branch -mmanual-endbr -mindirect-branch=thunk-extern) && $(as-instr,endbr64)

At the top of asm-defns.h we have a number of similarly operand-less
instructions expressed via .macro expanding to .byte. I don't see why
we couldn't do so here as well, eliminating the need for the
$(as-instr ...). In fact ...

> --- a/xen/arch/x86/include/asm/asm-defns.h
> +++ b/xen/arch/x86/include/asm/asm-defns.h
> @@ -57,6 +57,12 @@
>      INDIRECT_BRANCH jmp \arg
>  .endm
>  
> +#ifdef CONFIG_XEN_IBT
> +# define ENDBR64 endbr64
> +#else
> +# define ENDBR64
> +#endif

... it could also be this macro which ends up conditionally empty,
but would then want expressing as an assembler macro. Albeit no, the
lower case form would probably still be needed to deal with compiler
emitted insns, as the compiler doesn't appear to make recognition of
the command line option dependent on the underlying assembler's
capabilities.

> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -39,6 +39,7 @@ XEN_CPUFEATURE(SC_VERW_PV,        X86_SYNTH(23)) /* VERW used by Xen for PV */
>  XEN_CPUFEATURE(SC_VERW_HVM,       X86_SYNTH(24)) /* VERW used by Xen for HVM */
>  XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
>  XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
> +XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indirect Branch Tracking */

Is a feature flag actually warranted here, rather than a single
global boolean? You don't key any alternatives patching to this
bit, unlike was the case for XEN_SHSTK. And the only consumer is
cpu_has_xen_ibt, expanding to the boot CPU's instance of the bit.

Jan


