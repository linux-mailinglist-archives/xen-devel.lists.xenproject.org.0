Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E61651D75F
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 14:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323052.544582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmwsH-0005jW-3l; Fri, 06 May 2022 12:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323052.544582; Fri, 06 May 2022 12:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmwsH-0005iT-0f; Fri, 06 May 2022 12:15:57 +0000
Received: by outflank-mailman (input) for mailman id 323052;
 Fri, 06 May 2022 12:15:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmwsF-0005iK-Jz
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 12:15:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46cdbbda-cd36-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 14:15:54 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-Od0Br0g3PZ6a_hV4mjaVWQ-1; Fri, 06 May 2022 14:15:51 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB5500.eurprd04.prod.outlook.com (2603:10a6:10:87::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 12:15:49 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 12:15:49 +0000
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
X-Inumbo-ID: 46cdbbda-cd36-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651839354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZ1qEo4Rd9MIG4RAQQAmB4EKLXIO9dWWevg+YaxVE44=;
	b=diNPVQX914Mdnuv/PGeuTN1LjQQWcMWQO2tlBNyD5kulipHIcAN9A+CzWo4j0t/SJ/rnsQ
	y27LW0CmKdxUp5FzfMyPiTpOYyz/cD7zSHKHu+Iv9WG7HIw/gV2EMh4CZJFYcdbrnhRVrm
	hOlkCw8onMy+gLb5k8XkcycbUV191xA=
X-MC-Unique: Od0Br0g3PZ6a_hV4mjaVWQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVWOnjfkOJVjLWxo6ZLpJwl+Uu30NVn2mw2JiUmxpuWKrTO5tO0JFtjUzYbcfCw8Y+nfYwm8x4407yXxOfFP1Af41Jlf+b8KWJLRLmLLRLwGBWDVKkoMp0tY2nYyoECBaRIUXRAtJNeIEZ31KWsFyPdryabH4gx7AvW/QXhEE3iDScGkMBpuMxqr0cQkEbExwrO6Kr5LFexk0Sr73Jj0n5kccAVY2lzmhcGa/OspUqsAv0H/NPI0xo97G449nuSonGbP2Gv+cuWydMQUd1BvXQ4ucg6xCEWcskDH/UiBESJs//HU220sydZNim/RbhAoXQ11HVSnIhG8AmFkHK5EHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ1qEo4Rd9MIG4RAQQAmB4EKLXIO9dWWevg+YaxVE44=;
 b=FSmPlYFwBp7U2ddqsWuwMQ7tvGd5CnRHfOTYnzKM8o8eHzTQ2BpxyrRrOXPKT9UAMxCRGQExI2aZ4409CRXBgQSYgTj4motpHhUqvDfJniIobg758zEGO60oJjgzRGMr9641XeyqyieAuSXTGJYWQLchlL1zS5H8iva589C2YjLCgwyBxEpHL8bKIdHRl46X1Z700/4mOTqLvfDxP8oXtX7aaK2Eh/GDvcfutFdWCgXMZV1LmK734iqnhUiLRY8m2EuaTyV5WM6rVtxu6xEESSbLSGLhGrInXAPTpjjPkHSoyKCehrBuiPXLBG9ao8mqxrxOIJrsYSiImHtsUF3INw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7525a9e0-2334-7b6d-5d42-fb68fc6ef0c1@suse.com>
Date: Fri, 6 May 2022 14:15:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for
 HVM guests
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220503082650.23049-1-roger.pau@citrix.com>
 <20220503082650.23049-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220503082650.23049-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0043.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bffa1e0-6e62-49d9-ce84-08da2f5a2807
X-MS-TrafficTypeDiagnostic: DB7PR04MB5500:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5500CACB4BA4D17C50CB2A44B3C59@DB7PR04MB5500.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XNGVlhW2/n9m6uXqnAfxVNtkUFdd95BDZOoMj1Yv5PcRLVHD94MC7DchGKXmhcbGO+QsP9WNeNSUYSw+xpoGH602eFjyg69IG2JI91C9iHcH7Yx00VwE7+eqNvKJyAEVg2AC0YmvddjVVhqE+klEhwCS2QbwrQZVvCba/5vxLbo6ZCWIolpJ4A7qzEt3hT7cu4pWFsF9ADnll6dRAgvO0hroDVp4l0R5zZxYbOV+LNt9tywihhoVsiSOzFIpDo7YUUNQAVbeR0rn8qM4PX2lLLQJ5gMSj2Uiz7HFgcuXFTojLb0uydslUdcI6Cdfud4sPs7/jXgBxW8KuqqLwUMuanXQlNuSlb/t55CtVyXCM5oj9R8hv2DCz86VwR7vAWmfhWdhZq97QAWOuUc5kuyBKZAECblz5OPjZNLSmiPKMzV3PutU6O9VrgxFmgfqFk+bVMazskVlScxxU8z3OJRFV4FFZbGu+REhJJkc5286rKMZ3MDDMG3QbFJckJlCpwVJvmYq/gx0aiMUGQGl9HTjF0NcpCQ0cMYQEJiZaFdkYVymdibZVsoks0zCfBN75rK5XnoFTT3+YUcf6rYNk+FRDwJZaLhVP4bWg95e148mGYnJRJC31lYoZl6YMr2pa7WmxDVusKF20KysPBfDUX2FHBuu3Q8CMMXlcLjr58zr9c0xCatpq6z6CJ5naUFEQbRFcPqvPraxLdUrQrbh6H8TzmR+RZyMawD4cz+UdQQnD7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(83380400001)(36756003)(31686004)(2616005)(54906003)(31696002)(186003)(6512007)(26005)(86362001)(6486002)(316002)(508600001)(8676002)(53546011)(6506007)(66946007)(66476007)(66556008)(2906002)(4326008)(8936002)(38100700002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWFnS0QvdGRJYUFzT1ZsWjlVWFlhN29UVzdZVjY4bnFTS3hNUDJMM29XdDRo?=
 =?utf-8?B?bnRpbFJPSFRpOFFUeVJkZXJKK1E5M21XeWxZSVJjQkhzM3N1dm5GdStUODVN?=
 =?utf-8?B?YkkySmJSNmIzcXY1cGlETWh1djRoK3hsUEhaNksxbVNMR0FFcWlqZ091Tkhy?=
 =?utf-8?B?YitZNlJrbzlJTHBGaEhRVXpPS1lYc1ZCU2Fhclk5S3lzeWRPNk15VkJOSTc2?=
 =?utf-8?B?WS9nV2hzVjYxNTZzVzJ1Z1dGdnJwRlhFOWpiem05Wmo1THQ0RlJ6ZWtnSmNu?=
 =?utf-8?B?QWZYY2x0cmQ3M3B3SlRnS09QUCs3TVBKNyt1cFBISjVCT2pxdTR6TVhBZ29H?=
 =?utf-8?B?aUpWUjgyYmt4ZnBvY1EvcGNhdVpmZ1JISndSMlUzeVR2Ulp1ZUJ4NVcvdE15?=
 =?utf-8?B?ZkdoMTRzQWhuZ0MwV2hKSFEvZ0x1K1dnUWszQ1JTK2Z5ZFRaaGJMc1lJQUZs?=
 =?utf-8?B?bmpCU1BhSDczVVd4YndEdmVZdThna0tNYVU0N1Bra21MY2NNZzJERysxK2Zq?=
 =?utf-8?B?K2EzM1RUd1J0OHBwZFprTkgrWC9RSzFZcWRQTldWMTNJcjR6dEtwcXczL2tN?=
 =?utf-8?B?TlJEQ0dKbXRZZEVBcVNPSTNnWjQxQWFkTjNVTm16d1BEeEtNQ3JhN0NMQU1B?=
 =?utf-8?B?WU9YelB5cmYwM0JsQjNvUjhQQk5FSnd6V1AzL0hoZzZ4VkdHT29raGMzYVIz?=
 =?utf-8?B?dkdYZEZzVHpEYWdLSktHTnk0UGtsdHhyVFF5M2k2Q2pwWlk1RVE2dHB3cG9L?=
 =?utf-8?B?M1RlMVRoc2t4L21VTmRQRjdta2VEZW10YmJHTCtxZmpZbTc2aXl5bzRmbis4?=
 =?utf-8?B?S0hUWWtTcHJ2ZGJ3TnhEcnZnRndxZnhYZnNiMHMvTVAreVpnaS90anp3dlFY?=
 =?utf-8?B?YzFSN0psdlFIWlNvZm9sM1RDODVnV2NZRUZzRXBtc1k1TTlPNWd0eVlDUHAz?=
 =?utf-8?B?dThFTmRDbndHdE9PVmFzcmZKOGFrOWhzMzFId1p0a3czWTBLRHhIUy8rS0NX?=
 =?utf-8?B?ZVovbHZGcHJYakxGY1A3bEJXUmx1SU9jTVJHNzcyMDB5bGROeDVUWjlreSsv?=
 =?utf-8?B?Tmt4UXBhckE1Mm9GeWpPZlZ6d0xBVkUra0NmOS81NXMzaTdRaklrWUVwVTJo?=
 =?utf-8?B?R2V4SnFCNTBPZko0a1dBZHpMaWYvSEY4czF3R3VDUHdDNDQxNEtMNjh2ZEts?=
 =?utf-8?B?cjBuc2swSnJTa0VkMFZQTVY0Nll0dDgvUXNkQUdXSmZMMTdZblpQVzIyMzhG?=
 =?utf-8?B?N2t6c0VaTW44ajlMQWYxUitJTnhEeTZsWEVxQ1NTZ0xQOEdKZWpTRGxFdnAr?=
 =?utf-8?B?YVo5ZmN6MkRqSmtUZFNqT2FGcUVHSEY2SEJVTkJ2aDRrc3dwOHhHR1Z5WFdH?=
 =?utf-8?B?bk0wSVcreGtlbHpJNFZPeWR1eHNnS1g1K3BGdDRJcXhXWFZxQktJRDRYclht?=
 =?utf-8?B?cnYwK1ljdElCN2h3clFaOEorK2JhMWJhWnZETTd2T29QeWlZZFp5cnRGaDQ2?=
 =?utf-8?B?VHRlK3p0T2N5MWpaNC93Zi9nWXc1d1NnY2hranVYUkkxSmt6clRQdE5Vb3RB?=
 =?utf-8?B?QmdUMU5rY2VQOVpZSzVLa2g4QnBja2haSHBVRnlnSStrYTVSbmwyWW5UZGRw?=
 =?utf-8?B?NGhLNnlFdllTVTB4UFAvR2NUUVNJazRPS2xvNm8wNXg2Wkp4QjBENlBkUXNo?=
 =?utf-8?B?V2tveVF5eTdhODlGR1FicDJ6MFFQejNYSWFLUitnTndpOFZFZXNkcFBKdXlQ?=
 =?utf-8?B?SXZ0eW1Jazh5S1hQcmNPNHFqOU1pVVFlRVhTS1U1OThWMzNmSFFabDZtcHNW?=
 =?utf-8?B?MUNZQmFRV3MxckVvTzNkMWN5R3pyNlRsb0ZSRzBsM2hsQXc0cXZXOXNiZFMx?=
 =?utf-8?B?VElmQ0YzaUI0WUd5Ukt5Qi91MGY0MXkrVDdaQ2NpU1poWHZ1QW90cXFJRk91?=
 =?utf-8?B?ZW1TcjBCRng3SFo5THR3Q0JSRmZwRjAwTFR0K2xzVndpV05qL2YwbzBBbHJS?=
 =?utf-8?B?YmhVZ0VIeEFEMGlselZtazR3TVREZTc1VkRYVVQwUTVjNkFvZkx2WVFtY3cw?=
 =?utf-8?B?dkdoaElhTUhha1BGeW5tV2xGZEozcVE0c1lKazlJYnNXeHE3K04yOWJ6YWJV?=
 =?utf-8?B?RGRIWnJvOURXdjlqWk14ZTNBdmpYRjdRTFRqVk9KNDRVby9OTWx1b3NPK1Vz?=
 =?utf-8?B?Q2ZQZit5ejloYW8xR3I4ZUZzdjhMOVJtZ01peXRYUkNZZjhEdjhCUTkzRHNR?=
 =?utf-8?B?RWo2alJrQ2dkMytZTzZQam03R3hIcmJZc0FheFpCSnpwenppZHhoMndUTFBC?=
 =?utf-8?B?NUZvME96c3VnVGtkZlBtWUUyTmZrclJwdmlSQUxScjJuRTQxKzRBdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bffa1e0-6e62-49d9-ce84-08da2f5a2807
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 12:15:49.3539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhRHXoVLufBulJLrBk8T7/R4B2K3F1qM8bTD5/jtze3L3g1KznaybPxFKA6JnDVsbUVtotI16tt0r+HUeVHNcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5500

On 03.05.2022 10:26, Roger Pau Monne wrote:
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -541,6 +541,9 @@ static void __init calculate_hvm_max_policy(void)
>           raw_cpuid_policy.basic.sep )
>          __set_bit(X86_FEATURE_SEP, hvm_featureset);
>  
> +    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
> +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> +
>      /*
>       * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
>       * availability, or admin choice), hide the feature.

Especially with the setting of VIRT_SSBD below here (from patch 1) I
don't think this can go without comment. The more that the other
instance ...

> @@ -597,6 +600,13 @@ static void __init calculate_hvm_def_policy(void)
>      guest_common_feature_adjustments(hvm_featureset);
>      guest_common_default_feature_adjustments(hvm_featureset);
>  
> +    /*
> +     * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
> +     * VIRT_SC_MSR_HVM is set.
> +     */
> +    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
> +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> +
>      sanitise_featureset(hvm_featureset);
>      cpuid_featureset_to_policy(hvm_featureset, p);
>      recalculate_xstate(p);

... here is about default exposure, so cannot really be extended to
the condition under which this is put in "max" (except that of course
"max" needs to include everything "def" has).

> @@ -3105,6 +3116,30 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
>      vmcb_set_vintr(vmcb, intr);
>  }
>  
> +/* Called with GIF=0. */
> +void vmexit_virt_spec_ctrl(void)
> +{
> +    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
> +
> +    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
> +        return;
> +
> +    if ( cpu_has_virt_ssbd )
> +        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
> +}
> +
> +/* Called with GIF=0. */
> +void vmentry_virt_spec_ctrl(void)
> +{
> +    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
> +
> +    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
> +        return;
> +
> +    if ( cpu_has_virt_ssbd )
> +        wrmsr(MSR_VIRT_SPEC_CTRL, current->arch.msrs->virt_spec_ctrl.raw, 0);
> +}

I guess the double use of current makes it difficult for the compiler
to CSE both uses. Furthermore for symmetry with the other function
how about

void vmentry_virt_spec_ctrl(void)
{
    unsigned int val = current->arch.msrs->virt_spec_ctrl.raw;

    if ( val == (opt_ssbd ? SPEC_CTRL_SSBD : 0) )
        return;

    if ( cpu_has_virt_ssbd )
        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
}

i.e. "val" always representing the value we want to write?

With at least a comment added above, and preferably with the change
to the function (unless that gets in the way of the 3rd patch)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


