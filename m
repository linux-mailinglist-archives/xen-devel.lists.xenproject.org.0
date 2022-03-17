Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FE74DC806
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 14:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291579.494961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqbw-0007FI-CK; Thu, 17 Mar 2022 13:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291579.494961; Thu, 17 Mar 2022 13:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqbw-0007Cx-95; Thu, 17 Mar 2022 13:56:16 +0000
Received: by outflank-mailman (input) for mailman id 291579;
 Thu, 17 Mar 2022 13:56:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUqbu-0007Cr-Rk
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 13:56:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01e2679f-a5fa-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 14:56:13 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-kqie5FRcONSdO8aLJ7F-Sg-1; Thu, 17 Mar 2022 14:56:11 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB9219.eurprd04.prod.outlook.com (2603:10a6:102:222::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 13:56:10 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 13:56:10 +0000
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
X-Inumbo-ID: 01e2679f-a5fa-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647525373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H42I1FnvSYPHFjU9zWsT4UaO8HPkcD+fx7AddMMXOGE=;
	b=PiaQinosNSTQcHYaN3lJ2J3avHEXPJbDs450WyxnWnbA7hZR6d1XRm1nXZtxE4/F6tGCLM
	U7akWRwaaUDgNFynnIr2ZFBJqLpKxzEzQFdfwMvHJtlkUMhmpZFivHTSjF8Q19lYwD2Doq
	xIjhBziwlpFrGl0opDaKdvnMvvYHqxU=
X-MC-Unique: kqie5FRcONSdO8aLJ7F-Sg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nb/0P9jav0SNvp284toqMukkGHdt+ZXXhEHSqVrXdluAkVSQJRELhVVTcDqMlBf9wjns5XM4SDN89+1JpjueoZaTGV+a0nt/62zv/bSq+0P3uszD9FYRnldey06EmlQ179Z35lRDg/lGKN+slt3zmWbDf9JAdGbLgps0s7QOEZilPQGuUJErhoGA+WLtvQoiETkHy/uDFCLtJWU/Hlpvt91vuIC1DXsMozIbVzI7+Sppej+WjhlPa5iLxoMi35rBlg8oPWJ0EkfPzJ7FE7kAtnd/3NczrVYi5sh61R+kAL4HOsh7OskGc34SPXM6o6rtitUsXHZVBece7HHbL+smMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H42I1FnvSYPHFjU9zWsT4UaO8HPkcD+fx7AddMMXOGE=;
 b=baMPr43+zMjVEOd4zgJ6z3EIXMEXC4bWP4pmOMHJczby03vGacg9hiWtrWfzAvQ9fZk/L07GhO9btEAPCZTYfsERXJwu5m4m8el8Yz4E4xzrwuQ+u/gcdVLMVS9539HTPwv+2Js/hnpSj4+LN1hzKzQTOdPSCgLs3cOVy9x6Gv4mi9GnUiHQnYPfh7uMpC7CzfE1NmtkfM8Bo54TnvSeakrbgoYxFwae1IsvoUnF8HhuR1XFihMfQnQ6IV4ep/h6qnKvvXTejBXll9cIOpkcdflbjJyZ0nAxmxGTpbxyLwWnZdg3O/WBrYh8nl9jLFH76SDrj7+jTt2038RFfYT4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <28f869eb-c6f0-cc67-8d29-9751447d2ad3@suse.com>
Date: Thu, 17 Mar 2022 14:56:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0009.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::34) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 293e60e3-31b8-4bf4-a4a6-08da081de449
X-MS-TrafficTypeDiagnostic: PAXPR04MB9219:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB9219EFD88EE20E14E0906133B3129@PAXPR04MB9219.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6z+XhHTF4lGsR3z7WZ5gsixMCkHm9tZKnJ53wh+9DjH77C9Vk/GnueaE5PSBoHybHtzy/MZpOC8nyGB2+et5J5oUoME6RL/rezwoe9TCDRFg2Gb6lDb/UCezZqQXSZcQKNP8DUKjkWyy5m92vkFykp6HqGF6UHmlNDQgnwanZ4iE6BaLG+HEEfMiDg+8qV/Qk4yx5XyhYrT4JzM+jtaQsVtHlFAJwt7pzb7uM5h+ZhM7832gQCVykXVwqTRZCm8NCMNlr2Z9aAMibNvH6VdDQu4YVnjT8+BrCkihOFnjhXqdMe9Y8FuJCj2F1Tb5Ot0qOhLtJG3y7XygXmSMH84JDnEuzZYQOlxAu06qZuYTftUder1SqoWs8r6xfUBVFtKJhqhvTJarmfwoedMXpU2jUoINtgOtOcWZkdGiYnOPJBy4OLToVeyzlRZzOJp9wUDabRSEscAIz6HjM9HQ4eD7BwvUAiqXzd8zutqJu84xzpkqs8vjcd5fbeYoXXgt9Bo4tzsj8JR3EYJ7kLAVgleGIiGRHKKztzMgz3Rx+2MdPFbYqRrw722AztecZm0cnAcXgSOf3oXCTLWToqQR5xJnFf0vyCv8tMfG/msDvD9U1l623BM+84tMSOETNLX1OqCNH8hdb5pPmd81ntqmYeW0+LxLiS3FUEtA82w4Q9C9SkaGYjzYkwT2rGj2LWIlzYhHknSq8U7qu+xLvQCIn7Fa4PRCvGsH03JCNgY2taEhs+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66946007)(66476007)(508600001)(4326008)(31696002)(8676002)(6512007)(86362001)(2616005)(38100700002)(6666004)(36756003)(53546011)(6506007)(6486002)(54906003)(6916009)(316002)(26005)(5660300002)(83380400001)(8936002)(186003)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlN2dndUNFBLbTBNYzhNdE9jWmFLRDRvZDFqWjJHRTVycm5VNjdEK1YzVFhT?=
 =?utf-8?B?a0kvVVZFRFlYTjVZbWxQSTlnZTZEb2ZGUmpPdHByMGNNMGNZTEVvbEpEdGls?=
 =?utf-8?B?Z1pOa3hwa0QvK2I4WDJtd21VRFFMS1Flc3N4djZuUUEraEVMS2JGOTZCYWRs?=
 =?utf-8?B?OUZwcmR5Q2F3SmhTVDhoNGNMaExOUVZlenpHVXN2Z0VSUjlMSHpEaTZWM3pV?=
 =?utf-8?B?ODU1akdFK0l0c082ZFhTeVNzK2dnVEIvT3hZWTFUSVhxUXFhMWNCZnpjTUxz?=
 =?utf-8?B?MTBtcVlzQVoyWHpvcWNrZkVNd05DMDk4cjErZFYxaVJ1bEovZUtkTktNdmph?=
 =?utf-8?B?SEMyTjJzZ3hNd1FwT3RjV0VGSGNVS3N0ZkFhZHpTK3NyZWhabERxa3d0VStZ?=
 =?utf-8?B?YWZzN2xjbk5sRVlsU0pxaWlNREhtQmszbSs5WllzS0FNQzNnakhLRE1PRXh0?=
 =?utf-8?B?aXM3eUl2T0VHbUZpYzFqR083b1hxR3lOb3FOU0pLMGFnd3dHdmx2TDdjSmVp?=
 =?utf-8?B?UWZsVThVVGxVZmx0dU1Cd2JrOVIrbFVyU0JTdmhWNDBXUE9zaW9aeXdoT3No?=
 =?utf-8?B?THZXa1BtRnJmdURjRzU3d09QZWVXbmE2NXZBUXIrUzNZRlBaSjVzbHZxZVIr?=
 =?utf-8?B?Q1RndGU0ODYwdmNxK0ptbjdXSzhpeC9MQWVWRUpVemEwYVBrUWxHVTNWSEMx?=
 =?utf-8?B?VkpsUWtLM0FHNFE0RUlFNjVmWllDYnVVWEhaelRva01kRytjZnk2M09KWGY2?=
 =?utf-8?B?QmNqUU5SNDlxelJvSjFNTFU4bkUyR3FKaHhXK2VOT0ZmVWtJanFWT251cGhJ?=
 =?utf-8?B?VWY0ckpZVXFCckp4TU9zdkhSR3dBQ2JhbUdBdi9JNjhacExkK2owVkVMdTFz?=
 =?utf-8?B?VzBNeW42L1J5dHFsTnFDNnhuMUhGQmR3UmFVTzZWMzZFNjlTQzBQTlRpK3pp?=
 =?utf-8?B?RlU3N1Y4dlhYWFlDcHEzcHk3azVFZWl0RDQ2d0FRbEpCdjh4YkZTZ3VQMjlE?=
 =?utf-8?B?UW82emMvVm9oM25RdTFuRVcrUE5tRmpDRzAxa0t2VGR6c2VwL1dwRW9rV0Mv?=
 =?utf-8?B?WEtHdUZueXIvNG1mNzBNbUFFRjlaZ29yVk9rRjExRWlQWGNUNnYzUm13K3F4?=
 =?utf-8?B?aDFaT2dFQTZkN3J0dWdUejJpdis0OVQzVDBEWGM4elN2NWpCYXpVMVROVU9o?=
 =?utf-8?B?WnJxcEpscmQvVDZPMDBQbmxuNEZ2OWhCcHR3WWpPSXpvNHhkRWJRNXcwc2ZX?=
 =?utf-8?B?d2Z5L1EycTBnZkNJYzdRRjJiSldCNHpuNTZLOWtWTXNNcGVaaDd3UWUyc013?=
 =?utf-8?B?SkdSd0s4a1J6ckMybWhEQTd2dnlZUVlqQi8xODdDaXFXL3lJTXBSWDBXRkZr?=
 =?utf-8?B?V0xhbEJoVC93cHNkQ2FrVTBiMmRpbTAyRk0vVi9mMWtSa3V0Z1czcVdlc3RV?=
 =?utf-8?B?THljSS96d0hQSVlWOHhOTENZQWtkSitmcW5WODV3aEh5WXNJSWZBSW5zRzF3?=
 =?utf-8?B?eVlGcUlzdWt0aGpKNkI3amdkMGE4Z0pKUW50Y1ovb1RjVmZCN1ZwbHczY1o3?=
 =?utf-8?B?SEpUTkFaSWdhbDdOVHRGNE5TOFlpR2lSdFBRTGtveFZ5RnAwM1VLQkw4TXFU?=
 =?utf-8?B?Yi81Mjc0MmF5K2tiTTlKNllVUkRKVFZhV0NCdUg4R1JaV3c1TUlhdXhiajhk?=
 =?utf-8?B?SmhlL0JPTnQ4b1NYZG51cDFhdGNZc1VMT2lyVzc1QlVKd2Zob3ZBYU55Y0h1?=
 =?utf-8?B?azBhYnV0ZnlHdmlsUXRacis3S2NxREprSUtHaCs1SUFlR1ZVOW9pQmlYNDFT?=
 =?utf-8?B?V0FDWDh4YWxpNzJITHljSnFWYTJKQy9tL25BTHpaSXRVWmNyOWsvMjVkUkFI?=
 =?utf-8?B?cXAvc016ZEYwS3dsT3ZVWGFoYXZNUG5SZ3NMNHRPd1BkT1NGVzQ1aXRtTUNK?=
 =?utf-8?Q?VN+AYrCsvshrzw8+ujNSOB3OrBLxUGbq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293e60e3-31b8-4bf4-a4a6-08da081de449
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 13:56:10.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8UVVxarPreIcj8WJgRwKI3jp0tM1UFQOJIfK5GRK+rBknxJX08QEr4G9UeB/HvLpX34vd/26+jwyPFGLMiV2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9219

On 10.03.2022 19:44, Tamas K Lengyel wrote:
> During VM fork resetting a failed vmentry has been observed when the reset
> is performed immediately after a STI instruction executed. This is due to
> the guest interruptibility state in the VMCS being modified by STI but the
> subsequent reset removes the IF bit from FLAGS, causing the failed vmentry.

I first thought this was backwards, but after re-reading a couple of
times I think the issue is merely with you stating this as if this
was what always happens, while it really depends on the state that
the VM is being reset to. I think it would further be helpful if you
made clear that other interruptibility state could also cause issues
when not properly restored. One way to express this would be to
simply insert "e.g." ahead of "a STI instruction".

> @@ -1155,6 +1154,8 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
>      v->arch.dr6   = ctxt.dr6;
>      v->arch.dr7   = ctxt.dr7;
>  
> +    hvm_set_interrupt_shadow(v, ctxt.interruptibility_info);

Setting reserved bits as well as certain combinations of bits will
cause VM entry to fail. I think it would be nice to report this as
an error here rather than waiting for the VM entry failure.

> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -720,6 +720,22 @@ static inline int hvm_vmtrace_reset(struct vcpu *v)
>      return -EOPNOTSUPP;
>  }
>  
> +static inline unsigned long hvm_get_interrupt_shadow(struct vcpu *v)

unsigned long here and ...

> +{
> +    if ( hvm_funcs.get_interrupt_shadow )
> +        return alternative_call(hvm_funcs.get_interrupt_shadow, v);
> +
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline void
> +hvm_set_interrupt_shadow(struct vcpu *v, unsigned long val)

... here are not in line with the hooks' types. Same for the stubs
further down then.

> +{
> +    if ( hvm_funcs.set_interrupt_shadow )
> +        alternative_vcall(hvm_funcs.set_interrupt_shadow, v, val);
> +}
> +
> +
>  /*

Please don't insert multiple successive blank lines.

Jan


