Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304904B5581
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 17:03:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272485.467349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdoa-0006b3-IO; Mon, 14 Feb 2022 16:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272485.467349; Mon, 14 Feb 2022 16:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdoa-0006Yy-Eo; Mon, 14 Feb 2022 16:03:00 +0000
Received: by outflank-mailman (input) for mailman id 272485;
 Mon, 14 Feb 2022 16:02:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJdoY-0006Ys-VX
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 16:02:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9378c640-8daf-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 17:02:57 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-YkrCbjy8N0-60A-n1oItvw-1; Mon, 14 Feb 2022 17:02:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB2939.eurprd04.prod.outlook.com (2603:10a6:3:db::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 16:02:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 16:02:54 +0000
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
X-Inumbo-ID: 9378c640-8daf-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644854577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aLXRdMyAMi502YtU1OXQwzwtcJOxQaIsusG0Q+2HtLU=;
	b=khEP2mB/sslJuE0YTvHLwf9pqtCqFF3IGfvdTfZjxr2NG81+9CE7qKbcRw3uC6jzFuO3I3
	FB0b7ieS5hOSm/uC6iNJY3dmdlLRAyqS7ofcfA7jLWVEdeGCkiYSxZRHV+Fey0gQWtjTIP
	I3IBxgdm90iMy2hEdPY3P22T78IyMWo=
X-MC-Unique: YkrCbjy8N0-60A-n1oItvw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYOfCTh/3E/wA85/rzn8eeVRLRedbEHe03SLBugrv0pgNuTVQXJ3Qr/zVfB/YiqYCfI4ay2Gc5wqgFe+LDQ+NO5ZHfMZJOcIGJSlXX/W9TqGXnUUxxG1Xvrc7LjgUA3O35ZEh3lncal07q7G9CzuqCIcQ8Ks3bvvGBKDNq8ojqvagm/N3ZnTqdnKE86oPvYaK//CRb1hFxRZtilsTysdfDZz4KYInBPli/Nepv/JPmgzd5B9rEIeNNAL2YYfVQKsUg8xx0CDTc2pLVZsOhuCaPZtjEscaJba1IEsrRM1BynF1NEpkaBotg6FjsFEnBpr+r1iqr4Nyqo2/NXjVExKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLXRdMyAMi502YtU1OXQwzwtcJOxQaIsusG0Q+2HtLU=;
 b=oWWsDbfmHa7tVEOB2m4EQPXhElctMKew2H5nZmvzikWyMg5Q9zgLJI7IHcPNHllCTZLu7OVLf4suymuYjST8MIs44UFYVqjFRurCvOCWuNfAiEWEOTsq1LKk+F8jc3tbTchn0AnRrBP/zxuzvVRFFLcFCz7ZalffKszqkMUS2v/Ezp1yGMO8NYo06A5NVshc+rD2hDzZ9tbNXzP/u11+AtlH0O2u5ausBe2XoVSajpJXfG8zUcz95RHeDJ3di0+xiF944HYejuGQ6X08eNI14o8axv/VXX2pwVBpSH9nZjxuqvvNTHRYJYW3AQOiLo41acEZCB/DtcKSRmALoJlzaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea9c7232-a98b-7fb4-a151-0c1e3ce1e1db@suse.com>
Date: Mon, 14 Feb 2022 17:02:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM
 guests
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220201164651.6369-1-roger.pau@citrix.com>
 <20220201164651.6369-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220201164651.6369-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fd23e26-e526-4167-8914-08d9efd3756d
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2939:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB293901557E32D100A074B5D0B3339@HE1PR0402MB2939.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7s63LR08y7l5VrEBjCAlc82Cq2ktxxi5hqumN3wtXDlnAEOevB2jLqIXorVzVYnwKyXz9k7XAtLmCn62l9eqkBvImKTMlzIkeyaFqdvD/N57BEj+KTyTkep+RP5ePrQcdmu7S0UAF8Jvdgcx6mxNlDxyoU4CvfYS/BHsoq2kjKftRdt7RfddxUk+XKn5RE0OxXyk6iTRH7FJgvlSazD9/K9rDyLufn1jlBFmDT7+eOOud/1u2szDLr6zuG3pFocALWYTAhBKaAf9r/Ohkvj5kg/rjd9c52+d+N1bpbYK6vtclbytAX/aagYNOUH7WY340gVqibifxBLeKKx9rPJ37IN1XeiUY80OD3Q83E6IEKBsV+NUmzY+ItoRDzD6qS1xG4nBfaCeTxFpuNppHMMje/NYCU1MV8mavZcnZUlsVU8YJtM1gsSLvG5IlZOcDGRpAZiJaUer/qSn8jsA0+uYUfQDo/XUyLdeRdylTD8aHk4noHWBLZ7LCv21tqq5Oatlou074UY5z4pzvROzq1cxaJC7IBrgXPC0281FjIzR383tebkmvo8uI+5bg0kHIcwWum2P93KbVVVdFHUXJrlWQIdbyhFePVRUftmE2lBSkRxBoe8FQMuiGSHtD41GhdmCQKMgw4I1QMudkti9I3tQXa7KOJHXMf5TpVSZ+2pFEE1FGUbTgdGQfMttdSKjHTZ64+b6JGQKPgj70w2OOj47EzGcYAcIyBip7rJNOiUwL1Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(8936002)(2906002)(38100700002)(31696002)(86362001)(36756003)(66946007)(2616005)(66476007)(8676002)(66556008)(6512007)(6916009)(54906003)(316002)(6506007)(6486002)(508600001)(31686004)(53546011)(83380400001)(4326008)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFVFYnhqeWc3OWp1K1VMcnBBMG9aVjNycC9hUlczeU9hQ3VhSnhyNVBhM1BY?=
 =?utf-8?B?V0lPNDQwMWZ1eWJGUElleGxvcHhsNzVrRmFWV3pERXFKR2RSVnhGdDlxZ2Ix?=
 =?utf-8?B?SnRHQkhodHN6MEJmVkRKcnZMSDV2VWlmcjZsU3ZsQ2FUeGM0cGxDK3JEdDRw?=
 =?utf-8?B?cnIvMFpnVUdLYS9GRlZvbEVyS1pOZWtRRnNmeFZvV1IxTDI0ZTVQVjdIYVFy?=
 =?utf-8?B?MHlZWkRJUXRkWkczQkVULzJhU05ERTUrMWZ3akJZU0c0MlVGc0RiQWJ6RjZy?=
 =?utf-8?B?Y2ZpamI5WFM2M3FnbHRxTW52azd5Y3NwS04vbitaWlZ3MmRNTTB2bjBxRW5y?=
 =?utf-8?B?WCsxMzBxNGZqeDE5cWhwNElyeURXNlErZUQxT3l3OWVvWi9tUlFCQm1ESzF4?=
 =?utf-8?B?aDZSVkt6ZnVBMGxNSEthM0swemg4dk1vdzBhMm56b055TTVLU1VnaGFEU0RM?=
 =?utf-8?B?c2V2cjhtemJBVmJpOXRqRGpxQmVaV3hvQ2tBNWp5MnZLLzBJWGZzQk9jZHpv?=
 =?utf-8?B?a054M1REVzM0OGtpQnRrVUx0T2pCSU9tb0xTOCszSGVLcXFvZms0OTdUV1Va?=
 =?utf-8?B?Rk01WjlRT3pwaEkrMmplWTFvc1BWREg4ZkZpeFRJejdzTHlPT0Vub2dqWVRD?=
 =?utf-8?B?bkR6eW9wSkxyc2c4aENSRUJES0loTzRkSndCcFY4Qk1JYU5SM1NiV3FqWXlJ?=
 =?utf-8?B?WE9KUUVlVVZucGpxRk9CcXJ3Nm85TGxiWENYTitCcjJ4MEo5dlp0WjMxSUgr?=
 =?utf-8?B?Y3VtRWZEbStjV0pjSkhmRGNrU3FmeWovV0laTUtZVFlQcmtQUGtNZjZ1UFpQ?=
 =?utf-8?B?SWxFb21VOXVhTktNNGFORkJBeWpkUURxS2tjQ09rdzhZYzZpb1puYlFlZVgx?=
 =?utf-8?B?bkcyWEQrV3dhcGErbVNXWXFnTURmU1g0TnVKNzYrUEhyK0VCV3Q4T29rbFhC?=
 =?utf-8?B?L3dFVDd1NStZdGR4M0QzaWJVVTdrV0tkN0tFVlpGWDdhRkNpYXRWWEhPcnBD?=
 =?utf-8?B?N2hKR0RyQVNLaW5JbERab0NUOFVRbnloK28rQ1laaGpGbG5hRU9YRlFkbXI1?=
 =?utf-8?B?Zjh5K2hIQ2tmaUMrdEVhQ2pPRFJXV3d1blNmSWVXKzJKajFrbFltVy9BTkpR?=
 =?utf-8?B?ZDRJL1FtMVRkY1ZNVUVwZyt2OHZocmwxMUZRajFITnNzYXRlbUZBSHNZWUhF?=
 =?utf-8?B?Tk1YdlRoNndjUWF1ZEx4T3pMdWRKMHlQVDlUaXVPZUYzUjQ1dnlOM0VaMDRy?=
 =?utf-8?B?V2xCRjFJSjJpZlhsSUdyK3QwOGtXenBhUzNDby9Db0pwK3VuUzFrdTRSd1o5?=
 =?utf-8?B?OHd1QU12QlZRbWgzQWhON0VIUnZiWXo3R1AvRHZJRzI3RXZvVkJ2WUJmRE5Z?=
 =?utf-8?B?eU5nM3lNNmlVeS95SVNMVHdsQndOQTBtVWY3U2llZkJFY2hpYStPWjBiQ1o4?=
 =?utf-8?B?TStVUzhwakxRRlYxZGY1NC9taDFSMGcvVUF6UGtBeEU2dGNTZ0c5RFVOL09O?=
 =?utf-8?B?KytiMnpnQ2lNT0EyUUVEZ1VHaklpQjc2SnRBTnN0bjd1elFUMUpmRTBUaUxq?=
 =?utf-8?B?QzJPMGJFcFpBZGQrY1dTa2l5TzlVKzNKT280akd4M1d1d29wdzVVS1EzZmxz?=
 =?utf-8?B?TTVCZFdzRE5KRUIrQ1p2TUhCNlhqcjBVUUNkUEFrcUdjKzV1NTMwSm8xcitJ?=
 =?utf-8?B?dExCVFpSSnoyeVlkblNtT3hEbzZJckJjNFhxaDJ6NlErV0xZdGltd2cxMXZH?=
 =?utf-8?B?bjlHeVJ3U3lsSXVaUHpCczJkMGMyR0xvSlJBK2dMU3hpTW9qNit3aUtGWnZh?=
 =?utf-8?B?SDNvRzVQdmwxeG1vMUo3dEVVMm5YWWhvSXozRTJoUFVyMWdvcnB2a0dINkg1?=
 =?utf-8?B?MzRORGg5K00yWllTdFVrdElQbGZ2Y0pzVW03dGsrS0N4bkI5anYyZzhNNzh1?=
 =?utf-8?B?cXdwUnI1UjF5Y0NXR0Z1MHJQMzJBNlltbHFscU8vRW5SelVqNWJKbm9iY0pP?=
 =?utf-8?B?V0VXRWpQODg3MWdQTXppUUU5M3B4NWxDVFpNRnlXemRLVkpIbW4vNzU5cWVT?=
 =?utf-8?B?TlA3YU50NzVlaCtYVzBOZG1HSXZSQkZxR2VYcVFKTG1hOVoyQ0NIUHVLWkVZ?=
 =?utf-8?B?eXZIRTJacDJSOTBTazVUYndhNnlYQmNYU0hGTmtWVmNrUXdYV3h3RTBmNVFm?=
 =?utf-8?Q?bUO1vYfjtRyFLftwLYdZIw0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd23e26-e526-4167-8914-08d9efd3756d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 16:02:53.8917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBdozjrlQu4EQPb9cGS4HlAFX9To8EpHx84o5H+nIArHyfS2+UWfk87j5cN+DYxuWXHx6aT87Yyt9M2Eu0d2OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2939

On 01.02.2022 17:46, Roger Pau Monne wrote:
> Allow HVM guests untrapped access to MSR_VIRT_SPEC_CTRL if the
> hardware has support for it. This requires adding logic in the
> vm{entry,exit} paths for SVM in order to context switch between the
> hypervisor value and the guest one. The added handlers for context
> switch will also be used for the legacy SSBD support.

So by "hardware" you mean virtual hardware here, when we run
virtualized ourselves? While the wording in AMD's whitepaper suggests
hardware could exist with both MSRs implemented, so far it was my
understanding that VIRT_SPEC_CTRL was rather left for hypervisors to
implement. Maybe I'm wrong with this, in which case some of the
further comments may also be wrong.

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -687,6 +687,7 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
>   */
>  void amd_init_ssbd(const struct cpuinfo_x86 *c)
>  {
> +	struct cpu_info *info = get_cpu_info();
>  	int bit = -1;
>  
>  	if (cpu_has_ssb_no)
> @@ -699,7 +700,7 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
>  
>  	if (cpu_has_virt_ssbd) {
>  		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
> -		return;
> +		goto out;
>  	}
>  
>  	switch (c->x86) {
> @@ -729,6 +730,10 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
>  
>  	if (bit < 0)
>  		printk_once(XENLOG_ERR "No SSBD controls available\n");
> +
> + out:
> +	info->last_spec_ctrl = info->xen_spec_ctrl = opt_ssbd ? SPEC_CTRL_SSBD
> +							      : 0;
>  }

Besides me being uncertain about the placement of these (preferably
the writes would be where the other similar writes are), this re-use
of the values suggests that you mean to prefer VIRT_SPEC_CTRL use
over that of SPEC_CTRL (see below).

Additionally - the value you store isn't necessarily the value you
wrote to the MSR. It only is if you cam here via the "goto out".

> --- a/xen/arch/x86/hvm/svm/entry.S
> +++ b/xen/arch/x86/hvm/svm/entry.S
> @@ -71,7 +71,9 @@ __UNLIKELY_END(nsvm_hap)
>              mov    %al, CPUINFO_last_spec_ctrl(%rsp)
>  1:          /* No Spectre v1 concerns.  Execution will hit VMRUN imminently. */
>          .endm
> -        ALTERNATIVE "", svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
> +        ALTERNATIVE_2 "", STR(call vmentry_virt_spec_ctrl), \

I'm afraid this violates the "ret" part of the warning a few lines up,
while ...

> +                          X86_FEATURE_VIRT_SC_MSR_HVM, \
> +                      svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>  
>          pop  %r15
>          pop  %r14
> @@ -111,7 +113,9 @@ __UNLIKELY_END(nsvm_hap)
>              wrmsr
>              mov    %al, CPUINFO_last_spec_ctrl(%rsp)
>          .endm
> -        ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
> +        ALTERNATIVE_2 "", STR(call vmexit_virt_spec_ctrl), \

... this violates ...

> +                          X86_FEATURE_VIRT_SC_MSR_HVM, \
> +                      svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */

... the "ret" part of this warning.

Furthermore, opposite to what the change to amd_init_ssbd() suggests,
the ordering of the alternatives here means you prefer SPEC_CTRL over
VIRT_SPEC_CTRL; see the comment near the top of _apply_alternatives().
Unless I've missed logic guaranteeing that both of the keyed to
features can't be active at the same time.

Jan


