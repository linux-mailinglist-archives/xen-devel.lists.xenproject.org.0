Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420CE76E3EC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 11:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576115.901896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUHE-0005j6-Em; Thu, 03 Aug 2023 09:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576115.901896; Thu, 03 Aug 2023 09:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUHE-0005gn-B5; Thu, 03 Aug 2023 09:05:48 +0000
Received: by outflank-mailman (input) for mailman id 576115;
 Thu, 03 Aug 2023 09:05:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRUHD-0005gg-C2
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 09:05:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edf4b94f-31dc-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 11:05:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7625.eurprd04.prod.outlook.com (2603:10a6:10:202::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 09:05:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 09:05:42 +0000
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
X-Inumbo-ID: edf4b94f-31dc-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyrX5O5fkmHRBI54yX/NnCP/daYMi+9aKIdG8MH5WGkLSvJcYbaxOQubjJg5CY7EiHHsdq3BVj+0kM/V6Z17ulBboLxfitPlp+XgDrEMYb5QFo0B6Pc5xjbSFPwEbzymvjj9UMoiENUHbXsHwMj+HlXjabXDaRcBNI2PMn8Y5HZKjdI2YdL02elvn6KuXaFL5KfSX3eIu3K6/PQFwTJfz5Y9JnQNWAmBMLL8F3zz26LW2mMzjE6xCbSodZRa5qweteHbw7llXavNb0PREoWAYu9Ma642ks4XhJFM2lUNI5Ay8A7n46eqaAI4QI1i4vO4r2tulKIOHZ51sPXVWu7qHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ct6eL2qweUjt6jjItz65Fg+I3CL67e6ZcInGGy57IiA=;
 b=FHCu2vf4XTRm8PhNG3/yL+s1lp7hQLiWsbvLlsM/X/OW4+6nBuN51/sgxEJU8ra0EWDNk6NXJ3ZHhl0aCeulcWwETjL8dVXom8ighLv1rHdJGJFdBQ5Xo9Dt0ImEt9CPOPMHchbSkz3Kl2s48QhqqPtMPqlB+jam82rgLd3GXc3y60ajjgx/Es6wlLzHCHjMNPclZrGUyeNCZ4prBYrU+PA/4MXfvWF3SIR6ryyI4P6tKCvVU8/SrtmfcWQcUCt8vrgqISMW3prDOG4CZEFOo2zNLBU+wHeg/ndm1LqqWJ5sEhUEWyfKD39mqLHzuASEXpQPsqfGfJnKcKqZ5CXuZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ct6eL2qweUjt6jjItz65Fg+I3CL67e6ZcInGGy57IiA=;
 b=WP4mvyGPVUAM9TaVhSvyeyp4qpdcgKNeSgcgC7zzvaXAgvb9WAXzC1QmwhlTNlw4y22hbZRtZ9M12gGeEDilucxC/VM6MPBJbxV6JhT1Ork8vYO2uQ+u1rzOL9sOadgf2DtpDEYBD2ymn35eLbkqiEy1z+hlMiKo+PcJxCSRRhyM0g9UtbH4kcicoBIv1rANVIEjnY/zzq0Zx2NN2KCAGF3u8ScUjDwcGWBLPp3ECaNtywzPH49RtLvAe3tF5hXLd7ObRgh47YlUqmrHxTNd51khEBzw6fDUwTVdbglN7B8ZXz7ZAOeUWAPXybFe1xkb6jbkx3b+QLGtO9sk/dw0ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1db67ff-4254-a292-afae-9ff8fbf9cf37@suse.com>
Date: Thu, 3 Aug 2023 11:05:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 02/11] x86: move declarations to address MISRA C:2012
 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: cacafcd9-ac69-469f-aab7-08db9400d0ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ac+7Fvme0NpSlrKSvvexU9uXRRWoIvgBAOp6EU2oyV8tfOPWB2ko0gO+4vN2PmIco3LZxOxhaFHHG72k4hlwmOBnwvR8+DVLII71dkHpSHcltnm8SOF+h/UmUIRcjYBimRB3mindfznPLfdpnwdz4IsDsZ4g1MM8sojWHyQs76XgS8CEiMQ/2VDAhf2vyqeglXHIo9iv97AASOYsNrWCH4J+Jx97q3ZkMl09uiS0MAhnp1eZBsXt7lJDKQ2rTpsQLbmeOURgUKBfC5YfnL+PIByXWb1GT45nnOgwIJW8xQsxE+MkNVkmMac9icjq9KDyTHaRTf6rSTm+cTUcbIUl8z6l20X9/oHj9zvk7Lq//Is6LAxH5jPta5jK1AuFQX+X2KtuUfE4GrM+kVURuRXEafLlTXNSOEW627sC8IbLHPf2J36OJsIFMpelRVQXFau0P6t9kyTPju+kduUExWd0o/4WTsrFyhXAe+Fk4rGpeJ9lZK2Flt9FFdO1mIYZYoP/UxUPWQF8DhU8sjQzqkbYsHfT0NqOh41+CGP2HcpbWy5Ad5BBKo5xWHBXhJsuk7a4dolD3MHsO5Dxaz8plqILdpfGdQ+8ooExEodFjp7HZqAqIdTYOx+0zwS9vvnWjJEt35gEzdXyz7g9qnMOXax8QA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(2616005)(53546011)(6506007)(26005)(186003)(316002)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(6916009)(7416002)(41300700001)(8676002)(8936002)(6486002)(6512007)(54906003)(478600001)(38100700002)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTBPMWVKTHQ3RDN3NlZicVducWhvemNNSU9NZFo1YUx6bHBPRUI3T2k3YlM0?=
 =?utf-8?B?V3kzTllPYjFscmtnTjB5dHY5SHo3VUpraUVkNzg3Z2IyOW5Td3hsZGxKbEI2?=
 =?utf-8?B?WlVEUjJmb0hhSHZ1VUxmakFpZW5ZdFlzam41SCtDZTd1djU2U21BYm12NUlh?=
 =?utf-8?B?VVg0WnJZS3R1c0gxaG51ckNKMDNRYmVoV0NpSVpEZ215Uzd0QXAra3NGY0lQ?=
 =?utf-8?B?ZGZteTZEWllZQkVrZ2xURml0T2paRTJvSkw2RFhTVWxDVitlZmowcGo3OFNM?=
 =?utf-8?B?SXVtdzZjdEhxSmpVc2xEVGJaVUxQejBNZzJsSVdYMHJlWHZCcC9SZTNlR2xv?=
 =?utf-8?B?S0J1a3Rzb2dIK1k5Q2gzMktYL25ZR1lwQXRsVDBSdFNFaUhxbndBRndJWjBO?=
 =?utf-8?B?ZUx5L2RXaVFVWW1RdUxpeXdOR0ljYVQwNy80RXZSRGlRekY0VFFCZGgzaDVm?=
 =?utf-8?B?aHRVNDRib1Iva3hEa3RKNlVzSGtWb3hHNVI2Yjdweit1aU5QcEk0aUtVTjB5?=
 =?utf-8?B?UVpLRzE1dHVwcjE3QXRSYmZtZTVpbHFzTGQ0ZzJ1ZHovNWpMV2dVUVpvUlE0?=
 =?utf-8?B?OGFiTTJHbndYQ1ZPV1VMdytWaXd6Z3QvOTBuZi91Y2JFaTlQTkFVWmFCSkoz?=
 =?utf-8?B?L1BQQVQ3OFI1YklPL0ZtNUFOcVNNTnZMcUJXbFJNUFJIZktYekpMSXVxZDMx?=
 =?utf-8?B?SStQM0JidzhnZzFaR0lrUXJmVk56clZLTVU3ZXRpQXQyT0hac21saXZFVEpB?=
 =?utf-8?B?VFpIMHJBNW9GZUsrZzBzYnhZUTRMT2J3NlFiKyt0cUE4MHJ1QUtFdkh0SG10?=
 =?utf-8?B?dGY0RE4rV0paemZlWXl4RW13SDhhZTlZQSt5WVRFY2o4SXMxdFJidWFnSUNN?=
 =?utf-8?B?dnNMOUFnMnk5b2w1TmpibVBoclRsY2h5WjZwTitIMFQ5V2tlWCtGVm41alVJ?=
 =?utf-8?B?Y09OcDAvbEtHalRkVnpibGYzRnFpUFJoM3l1TFlXVlc4RTc3UFVBY0c1NEtL?=
 =?utf-8?B?VXEwcXBLYkZpOWJuM0hPQmYwNEcyYllrOGRHQjY2bVFXdG9BMFpUa2crS1hE?=
 =?utf-8?B?eS9TY1I0bms0SmF0dWRhQ21ORFFzY0Npa3NYTCs5aitEeEpKejRqZnphY2t6?=
 =?utf-8?B?QjFYRWRhTk5wMjNDS3I4dHdScE5YbnhpU3ViU0M2TEVNM0c2eXcvZDRJVVhp?=
 =?utf-8?B?Qkh3TzhRN29PWVU2UERzSlhyb0QwcG5wS3lPV2xxNUdlUE9HSGdwWGZNc0Fa?=
 =?utf-8?B?bXZpMGVJWVlBcjhCYy8rNG9zOFRpL3d6ODJJMlhpYWlrTHl0cjRFTWFVSlJW?=
 =?utf-8?B?UCtZTXFnODNFaHN4RHRLQkRPUUhhUllEeHFqSkNBTXhOSEVqYS9SalU5MVIw?=
 =?utf-8?B?bDNxeUZZK2ErMjVrNzZqVGduK09qZ2VOblhKWmZ0RVZBT000a0lJYjFXZDVt?=
 =?utf-8?B?ZCtUbk14OTR0YzhlRFpEQXB4WGtUOGNpS3Q1TFRMeHlqT1pLTTN0RFhKSXZr?=
 =?utf-8?B?bWtDU3o1VWhPalcwY2U5Zitrc2lrYzF1V1RHKy9oNU9GTzIrWmVsQjRETE9K?=
 =?utf-8?B?Sm1iZ1JsMEh2SGVTbG0wU2RWajR2bXRybkNFN2l3UG1UUkg5elk2MXI3UTl6?=
 =?utf-8?B?K1BzMmhWdHYraXUxVHFWMnBidm94S3MrUnp3Z29hbWNnMDhIMFhwVmtXZktH?=
 =?utf-8?B?MUxsRGYxUTZERDZpWTlIeElXVWJMOFpPOFhsMXg4OUVYdFBPK3ZOcFVXQkt4?=
 =?utf-8?B?OXBsSGtrdzRGTXNScStmNHg5SlpOM3poOHQ4eEpkRkVVay9MMzBpc0QxM3BK?=
 =?utf-8?B?THY0R2tNYW5lWUp1WFlPRDFQcnI2MUtBemdmblBlVlpMR05HSFlyU0VNUnRy?=
 =?utf-8?B?TWtBQlRWRWtNU0M4MVIrN3FNUlR4U0thUk5HR21jTWd4cU45Y0hYRnNvdkNI?=
 =?utf-8?B?WDFQU2VheGptSGk1SVlyTG41VHVqclYxZkwvcGtRK1NRSG9kODRodTVQVSt6?=
 =?utf-8?B?RnZYZmdHRGZkbjBlOFcxK0pGOVQwZ3ArQWFoWWlhNE9aVzQ4MTM2MzBVZjY4?=
 =?utf-8?B?SWhCN0Z2V1lRaHBGY1cyWmFnOHpHS3Y4SGs0VkZ0VEcvc005NEw0YnZvbUp5?=
 =?utf-8?Q?Qsc3tGryuSxGx1I4Efxy1QwPy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cacafcd9-ac69-469f-aab7-08db9400d0ca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 09:05:42.9030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgQY/wOHLvHzR/r5IZYmBZI8TxkirjcAKvy2m1RcQ1AEaEVY4tJlFzUwnMZIorXU0Dqlw+nfSc+2jj7LLC2jIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7625

On 02.08.2023 16:38, Nicola Vetrini wrote:
> Variable declarations between a switch statement guard and before
> any case label are unreachable code, and hence violate Rule 2.1:
> "A project shall not contain unreachable code".
> 
> Therefore the declarations are moved in the smallest enclosing
> scope, near other variable definitions.

This needs further clarification: There's no "code" involved here
in the sense that a compiler might eliminate it. Yet that's what
the rule's rationale is focusing on. There's no even mention of
declarations like the ones you move. In particular (and on top
of my comment on patch 1) ...

> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -37,6 +37,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>  {
>      const struct domain *d = v->domain;
>      const struct cpu_policy *p = d->arch.cpu_policy;
> +    const struct cpu_user_regs *regs;
>  
>      *res = EMPTY_LEAF;
>  
> @@ -136,8 +137,6 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>       */
>      switch ( leaf )
>      {
> -        const struct cpu_user_regs *regs;
> -
>      case 0x1:
>          /* TODO: Rework topology logic. */
>          res->b &= 0x00ffffffu;

... I'm not happy to see scopes of variables widened.

Jan

