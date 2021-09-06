Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99526401D85
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 17:18:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180042.326553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNGNo-0004Ky-K7; Mon, 06 Sep 2021 15:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180042.326553; Mon, 06 Sep 2021 15:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNGNo-0004IC-GK; Mon, 06 Sep 2021 15:18:04 +0000
Received: by outflank-mailman (input) for mailman id 180042;
 Mon, 06 Sep 2021 15:18:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNGNm-0004I6-Dr
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 15:18:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d433e749-219c-45e6-afda-c2433cf10c6c;
 Mon, 06 Sep 2021 15:18:01 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-LYPiVYPMO4u0kudWfCMQQA-1;
 Mon, 06 Sep 2021 17:17:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6302.eurprd04.prod.outlook.com (2603:10a6:803:102::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 15:17:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 15:17:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0701CA0023.eurprd07.prod.outlook.com (2603:10a6:200:42::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.4 via Frontend
 Transport; Mon, 6 Sep 2021 15:17:57 +0000
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
X-Inumbo-ID: d433e749-219c-45e6-afda-c2433cf10c6c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630941480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdCd0JKyDD9QE5Baa1mY81Z0aybW8BdpAIrhBi9YKkA=;
	b=EnJHLqwQRXkfbqWrR6BABUmC69eWRN/XKDlAt4xKS64iVX5EyYCGwyUGUKfGc5KySKAlyH
	1dC+80k0q4MpaVQJaOCNPKRMAYAsSYlswiVwCPu1dUjgCMqCRB7XwZublHbROVNPRi1qE9
	Oz+umVYCE5MPh11+9CNEdlyqw3Ym5z0=
X-MC-Unique: LYPiVYPMO4u0kudWfCMQQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcH7BRB4QfsE4qI5YLnKnB++J17UcwM358d9O/Han3EoY6zLOSjxMpQgSRY/IRDzIkPKNjeSifekkxJ+6lb8fCJoImhvujMnhGjKbYEx5HLv3OtB40OaLut5ulDaUSAbmxB0yfByS7ndg+jQMe/gA2ADq8ejbZ03XpkGcYg8f7XQ7dpNjSW36ntwtGeDXRLmyrPeyFc/+v9LJV1x0oBYSvAXlSCf7mZL3I3m9WzyEOnOILakMZnXCv4CBpl6iriahfjlOJeglsu49KGXAvfPOtzT4DPN1erquhaRO8xF1X24dfbDv5xyae02QPLJ/nMqiFulVnLxwIXuL5hX5RVFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FdCd0JKyDD9QE5Baa1mY81Z0aybW8BdpAIrhBi9YKkA=;
 b=ik+HONU9/etGr8GuVTVlDtswh3MRn/Za4SCUSOoXAAZ8ra/+nM7jdhpOCp/KL4G0V8LHnEWB2aKtsdgG2U/H2mx17R9YPMsieFFFJl3w6TnLAcw2WHyjOe/7OSed4PnxwIiLybDNHR48wwbUpI4mLKMNsSfX4lwWFHXmaswrTChgVWZ8VV3PcS76uaDw3LLQqg9TE/bUbFi/X+4tJfQji0yj5742RlRpkl448adRS+rotDRFmxM/KJ/NbUKvh2D2S6KDfvXLAh/0acPz6vLJ2JvAwMsw/2Uuw1f4kqo3qANOtXV2SDGKTEfCPxaro+qMDhqjmtDiCrosm+dhT22VcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1 2/2] x86/cpuid: Detect null segment behaviour on Zen2
 CPUs
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Pu Wen <puwen@hygon.cn>, Andy Lutomirski <luto@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1630929059.git.jane.malalane@citrix.com>
 <c9c3228982cc81c79cab4ced983f80296107124a.1630929059.git.jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26b88d5a-ae6f-0065-7c3f-5eeb6dd80078@suse.com>
Date: Mon, 6 Sep 2021 17:17:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <c9c3228982cc81c79cab4ced983f80296107124a.1630929059.git.jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0701CA0023.eurprd07.prod.outlook.com
 (2603:10a6:200:42::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e6f0b92-df84-4f07-0e95-08d9714981e6
X-MS-TrafficTypeDiagnostic: VI1PR04MB6302:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB630217C99B6A833C496D4085B3D29@VI1PR04MB6302.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VvmXU54w1o+pBl//WH8iStYC4PNZt5OOgQHEcKvf9JqaVNmpb2vyGp5Vfaik7Au0PwI1em92KHjHLVUuNsRREfS3y7KGvkuYzF+vGOeihhxkWboORVyzb9k2nh7301A3GFcssvtnHGgkfgq/L9EvWrmZIsmif37qIsvEormJS7zOmbU6+q+Vwmv0IZhGK2Mef1bwydgaCGa1F0dbjhd90alwF9nsiWDBU7Ccq4WGLIueMpisyEVNAlyDfADW6XC6xC3V1t5TBvO7MA/TTS+GhrvH4p2qmYWH9jHTH9GxQJAHd0iVCh9pvxMJT7oiEt9NszBDd7A70opKaNRhDEmBlL4UrZQckRblviMZouHyOEHhKxhMuSNt6h6nuIxN5WsD7jFx2gTbyLQZlniXb3fuQkI9wD5lCcACFqJT0rtzzBb7WB0mrh4tYK/pj7ko3OvTau+VBD7B23POgXWhcwnhY7/Ux1YM162uPrtRPisgHEcRNpEY4LA+9M6Q2pW3b2sqGlAAt235snQTyJQTpTA/HF7PZSnk/KjdEtYmVR67Nf+nOM0PzW/+04bSlDQ8GiYCgFvO5URBTBT/423Tgy29LzYklHxfM4uDBacB7F5hCQ4jpgQAH7lR14QOPfRPA/kfoKPPqyLxZi4G9GzVzjO5kTnQNWT8Cle5cIjZ9za4G+cEiZQ2uIei5+Ibw9As3hPCcojvpt8hTSxkGeNIVsF9tXOTt5FD5ZofU3h/UuYmaPo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(346002)(39860400002)(136003)(31686004)(86362001)(26005)(16576012)(186003)(6916009)(478600001)(31696002)(36756003)(4326008)(5660300002)(54906003)(2616005)(956004)(316002)(2906002)(8676002)(38100700002)(8936002)(66476007)(66556008)(66946007)(53546011)(83380400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzNoZHEyWXQwQVRhU2N3bXpCUGNjazlXLzYzeUFiL2pEYjhob3JqNStTY1dl?=
 =?utf-8?B?NU51aVpKa25TS1lUUmpSZWp0ODZETVZsb29lZ3ZhNkhaNk5TaW1ZYzNhZTc1?=
 =?utf-8?B?SHZPd3ZoaXJrUVZMYUJ0dVBKa0pWNnpBdXgyZC9Va1RTMHM3WXJ3Q1V2enRl?=
 =?utf-8?B?VStBUUVZdEd0b3ZCTGMva3U2S2ZPTVNTRFBzbENKbkhiVnRoUXhiUFhNR3cr?=
 =?utf-8?B?TEh5dCszbHdtWjlZeFQzd1hMVTUvaEgwZk9sZUgyTkpQWDkzZzBaSVFUU1p4?=
 =?utf-8?B?RHRUVjd3QkFNckFydmMxVUl3Y3QwVStnRzJ3QTJKMmUzcDVBdVJGMldTSVY5?=
 =?utf-8?B?SGZUbnpSM0pCOWsvdHBydnhNSzRKNDZFUVhLSDFScTlJM0I5c1B5Z2tNNFlh?=
 =?utf-8?B?djIzVnVlZ3l5dnIvTEpQdS90SkxsMG1ZQzV0NG5GYXEvcjM3VUQ2L0NscFhZ?=
 =?utf-8?B?UWJzTHdFUzRDdkdPYVk4R1ZCTVNjY0hBaXZkS1lxdXd1dzl1M093cjdVU1N2?=
 =?utf-8?B?UFFPaEIvZnlxY0h3NlZkbGtkc3NaVU96YzNHS2tOS0g5cmZ5eUNzaTdjTk5E?=
 =?utf-8?B?WGpaWHhNZFgzamxLTlFacURjZ0dUdnZrT3gyd1BuQWJSdjBpa05NRXZ1VGxV?=
 =?utf-8?B?cHAvY1AvMlYyby92cU9TMEd4TnRWcjFhRTY1OEpuSkpKYWhuR2EwRFpBaEJu?=
 =?utf-8?B?NzVVWTB6NnU3K0hKUFRsWXBZMXJWOWNOTE8zNy81blU3dWtDMmQ2SjlRV1Va?=
 =?utf-8?B?TmZvcGdvVUdVWVFSUkhtTzE5aFlyKzQ5NXN1elU2L3dZRGJpZi9MNGRoeTNQ?=
 =?utf-8?B?bThYZG5DUUdQRHFseXl6QzlIWjl3bTNiTTA5c3REc3JpaHRpYUpNbFBXaytP?=
 =?utf-8?B?T3ZBUCswbFlsMWxZd1QvNGNZVE9ZY1hqOVd0Y2k5NTVMZWlZdCtPcnFQTE5w?=
 =?utf-8?B?ZVduZk04dzNCcHRQSUJxU0Z5aENUK3k5WmJPWTNlY1NVNWNXWVluK0swY1Rt?=
 =?utf-8?B?S1dqc2pDdkNjQU5EeXFkVFZhRHBXblQ5U2ZOYWEvQmdhbmFXK2NDU1dncm84?=
 =?utf-8?B?cGRDeklEQVJiTW5oaFlUMUJRT2dWcllOUkVrWllGTHJHMzQ2alBwWDJjQmxZ?=
 =?utf-8?B?QnlESEtTSnlwT2p6dTRodzIxbXJzRktDck9VZ3NoeXc4T2NmRDlJMDNpWXJF?=
 =?utf-8?B?YUE3QUM2ak1aQVhodFBRK3B4K3lWR1pxYmpTZDhqa3dqQ1laSXBHRzZmVHhj?=
 =?utf-8?B?T09VRFVPRkhSb2hFUXg4NFVRaVRoVE5QY3I0L3ExWGZWbkl5WGxyeS9jSkRp?=
 =?utf-8?B?YTNRK1JsL25KYi95dTN2Kzc4RW5IeUlXUXg4NlBwNGxkT3krUEpyNHZLVHJB?=
 =?utf-8?B?SFVjTDFSNm9EcWZLMVhVOXFPMGs1NVEyc0RFcHZzZFQxbS8zOVkwbHJWT1Yy?=
 =?utf-8?B?allBbHArNnJoM1hzNnVCcXZsTGoxT3M1V29FbzF6MWN1Z0hhc0RoU0h3bXlZ?=
 =?utf-8?B?KzhxUGdHdmRvRklGbzl4bS9objR6WVZPVXR5dGtac3YrdDBTbk1GaHFMNzE1?=
 =?utf-8?B?QWkxcmp4clgxd1Q0emhXeWlIYjFRdjVJSXhzempVNUdsK0MvUVhCcTRFUEFs?=
 =?utf-8?B?VkhpSEVkQ2tCZmFJdXducWtCQjMrZTRwYmFRLzlCTDhxM1RQbDErZHJhMnha?=
 =?utf-8?B?TE1oaTkyZFNyS1RzaVVjZ1l0OUV3enQwb3Jtd09aTWI5QnNJakNJeWtzVFhX?=
 =?utf-8?Q?BAAE8R3oH7Q0/U4tbd6GgLQono/Twy5ZTANsjFP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6f0b92-df84-4f07-0e95-08d9714981e6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 15:17:57.6584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21lLh7WhMg4mm5/yIXse6kZU+56GJcq85eFhh77Z/wvErLfnPNnBm0v+dkmHsQHhiA2oqWJPWITthk2W3shkiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6302

On 06.09.2021 14:00, Jane Malalane wrote:
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -681,6 +681,19 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
>  			  c->x86_capability);
>  }
>  
> +void detect_zen2_null_seg_behaviour(void)

This can in principle be marked __init.

> +{
> +	uint64_t base;
> +
> +	wrmsrl(MSR_FS_BASE, 1);
> +	asm volatile ( "mov %0, %%fs" :: "rm" (0) );

While I don't strictly mind the "m" part of the constraint to remain
there (in the hope for compilers actually to support this), iirc it's
not useful to have when the value is a constant: Last time I checked,
the compiler would not instantiate an anonymous (stack) variable to
fulfill this constraint (as can be seen when dropping the "r" part of
the constraint).

> @@ -731,6 +744,11 @@ static void init_amd(struct cpuinfo_x86 *c)
>  	else /* Implicily "== 0x10 || >= 0x12" by being 64bit. */
>  		amd_init_lfence(c);
>  
> +	/* Probe for NSCB on Zen2 CPUs when not virtualised */
> +	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
> +	    c->x86 == 0x17 && c->x86_model >= 30 && c->x86_model <= 0x5f)

DYM 0x30 here? Or 0x1e? In any event 0x5f should be accompanied by
another hex constant. And it would also help if in the description
you said where these bounds as well as ...

> --- a/xen/arch/x86/cpu/hygon.c
> +++ b/xen/arch/x86/cpu/hygon.c
> @@ -34,6 +34,11 @@ static void init_hygon(struct cpuinfo_x86 *c)
>  
>  	amd_init_lfence(c);
>  
> +	/* Probe for NSCB on Zen2 CPUs when not virtualised */
> +	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
> +	    c->x86 == 0x18 && c->x86_model >= 4)

... this one come from.

Jan


