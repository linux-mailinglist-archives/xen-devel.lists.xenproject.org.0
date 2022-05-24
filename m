Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E224532D13
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 17:14:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336602.560958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntWEo-0006IO-SW; Tue, 24 May 2022 15:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336602.560958; Tue, 24 May 2022 15:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntWEo-0006FV-On; Tue, 24 May 2022 15:14:22 +0000
Received: by outflank-mailman (input) for mailman id 336602;
 Tue, 24 May 2022 15:14:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntWEn-0006FP-6M
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 15:14:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f579f18-db74-11ec-837f-e5687231ffcc;
 Tue, 24 May 2022 17:14:20 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-dzMBTvfZPbG0OjXOJxZV5A-1; Tue, 24 May 2022 17:14:16 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB3158.eurprd04.prod.outlook.com (2603:10a6:6:c::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.22; Tue, 24 May 2022 15:14:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:14:15 +0000
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
X-Inumbo-ID: 2f579f18-db74-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653405259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIqgFGSr9cVe7EoazhtwtVTPJiaYpK3y3sv9moeCmK0=;
	b=Pa2EjoZezPLVRCecGXIPFuiJE9ptUupxbSml6TE5lgrkDpRVM5v7KC9RIXs/UMDj28yT6Y
	FZ5+qQrCnXdGphGcMsrwmVWl9+noJ+KP/7mcWI+ypGJF24NDK6X9TboBnqMDzijZifyA7p
	BpGqTH9hdvOj3qKRYVDYr1Q06t2eMf4=
X-MC-Unique: dzMBTvfZPbG0OjXOJxZV5A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akBO7pQtHAJK23qV68IsMTB5UyktpxmJ5ieQCCnTtO+zmYAtN0hYOSM3bPyaKNJwYlxGiaJ+bpotUCnF/8peifQfIca7pv8rkWOP26z+3MxOEFLoR0AXRz/QE0WXS1rF3P9ns25Abvre9yTRvZKt+UpCKtcvo00HJL/gYeBy3NdsvqpiC3nY9CvvhzOhlo9k0o9fv8wDXJAIOWSrp1RjKfftP1sGA/p7XVYlw48WyKpmNaRUTHCT2VVlijaVBXv/mWbBeK41+gBKCm/JgutUwXZ0HzwqK34nz3J5mYxCLgVs2+/npgjmhpM+WVYQOoqhkeiD8UPwsDPZH8JrU7FQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIqgFGSr9cVe7EoazhtwtVTPJiaYpK3y3sv9moeCmK0=;
 b=cikT9eMox7XNiOK22Vg9F999ME6OKTS4kM5EqJrIsRs+VP0Enofcekpw2gBDlxoX++DGMarsJMqFP46Dej26uJwoEeKW0BkjlRj1pwfqDYxWiCeT0OQm/s2Iy1lNw6FzrT+9SklX3TnNZnYtdE9DuGSgdtMzxmDoTJR5NM1jUZZue8JHStM2/JsT2sZLhqyIMgOMo8ty1Fe83pd6N3y/v79JyxPmT8/U8Vtv26K0OSKpNQsT4mJkPgNZX0wSUrpdzlcLblOAkTg0vHLqHY9fu+90MYGNkowPTbCzaDanYM4QwA16hpLWwvi7NahsNJGGkSwbF3T1ICREpoEx9Q7Vaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <27a9ae9e-07fa-8300-d5b9-f9a88e4a1754@suse.com>
Date: Tue, 24 May 2022 17:14:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3] x86/hvm: Widen condition for is_hvm_pv_evtchn_domain()
 and report fix in CPUID
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220518132714.5557-1-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220518132714.5557-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0051.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a02677b-7354-4798-1208-08da3d981083
X-MS-TrafficTypeDiagnostic: DB6PR04MB3158:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB3158B30D0CDEA7A55D014724B3D79@DB6PR04MB3158.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ekr2Nn7AoVpfe0JzIR3pQVAn+IFThMxdt+mjWu2l4FO6JcsDOZTt/LbL5YpsHYlYcLm7A2uQEdSCY7h5gNGr91Rmw5eRh9pIKjlljl96iCQZHaChCj81CabMMgc32NyK1CR/Wc7wZ+Pm2w3IYyMt435kwO6yL+f/JDLT0DatA49VMflfQKsfSOq3ZDhxrqELj4jvm0BCcmWncXFi/ZR712fMAeJ6D5PH1gx7wJdwBLhcRDguyAMmLxcdGJ2EUZEtg4AUY24Kv20qkjyB6cB4rOOaprkbVO4+FJv5oU5g0RypDAfTR0ZchinT7SNAGUBJFN90SlphF/7H2lgQ8ByY5jktefz7/gWOI7Si6iHp0uhV4E6KH3L8OXtlbpnlyvNx2UT55UMvjzbyRMKoYFJaQu8zRqjT8698j8jf67Ki7Edu1C5j0/OszVK+A2jFjEeOnk/iE+9jnfbLYPlBUQTZO11xNfxUKHTg8n9vkfrU16X8wrJqxrQCr1c8DvcYI09Z3eq4Ref4EkzQkXSpwaPVTqI8DKq4WIdevSZPxMok8buWtLVS3hx0tfILYNlE7AXgbr9EMND3L1/lTHrrktHhIVXZ2J0T+0VkgUGaFvCgHMF8FxgKhT/dwMoK9w9B8idM2ofMUBm/763g5oiuIzwZN93+S3BeSBl6L7YxBXkTrNVrIa3+NsOFb+QKQ5nEhLUW7bkorLv42B0s9/HBMUGRFFlHAjmiDoDdK/cyAhNjdX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(38100700002)(6666004)(6916009)(86362001)(31696002)(36756003)(6486002)(54906003)(6512007)(53546011)(4744005)(8936002)(5660300002)(6506007)(4326008)(2616005)(8676002)(83380400001)(186003)(26005)(508600001)(66946007)(66476007)(66556008)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUJMSHN4aFNxbURibzA4MkZDVU5ISFZta3AydXdUcGdpd1k1VFpDTkVNeGdG?=
 =?utf-8?B?K2tKbVVvODFVQ2xLOUU1NnRHRUU1RUlNT1psV3UwVEpBbUZKcDlJbVFBRUVM?=
 =?utf-8?B?cDY1MnZHWThYUTcwOVlUc2FkLzhTZkh4Q3BxenArZTQvQ2N5ejFUWG9DekFn?=
 =?utf-8?B?bDllODZmdVZscnlKaTQvV1dXUjV4eER5S2Q3YUYzVlIyRXFEYkwzY1BPYmp0?=
 =?utf-8?B?N1dKaGhWaVdKMjBiVHVrTlQrVmw2Z3hRMGJBSUZnZUZXNHcvZVJTYzNTYk04?=
 =?utf-8?B?djJ1RTM3K3ZhbEVqYTdQR3VrSFcrRFMxUG00RCt0SnBOb0xYZVBmVXBDYjNi?=
 =?utf-8?B?c1VqOEFwNXBsRDJ4WFhXWmhqM0FvcE5BRWZHdW5MV3Y3dlFtaUVIYzRtOFZT?=
 =?utf-8?B?MTVYRlBjcUtZVEMrdzlXSTVJQnV3bFVUUHhNTlRmV25hSlVWSUw1SUJ3dk9u?=
 =?utf-8?B?SnlLOVRFOTNpN2Via1VqaHZVd0VqNjhTcVdyYVFlcTJlWEUvNXU5QXVMQ1R2?=
 =?utf-8?B?Z2taSW5CVGtWeDdtMExpbUlIb2pkbGh5WGNuRjlTNnp1MHJ2OUV6Yit5QnZ2?=
 =?utf-8?B?Nkhwc3NOeHhCLytCSzFCLzdUUjAvd3ZuNjc0UUJQTDZZbVU3QUpUN0NvNElS?=
 =?utf-8?B?dVhDeFRHZVBpMVduOXNsWndON2VUSUNrU3AxZDZ0VWxKZ2F6YVQyWVM3MFc0?=
 =?utf-8?B?YUh5S0Q0aExqRDhGeE9sdFBJSHNmSERMaDhmZm9kL3dtUEtLQzlHMjU5UWJp?=
 =?utf-8?B?bXdDTnB4a01lZDVsaElRN211ditvLzRMQ3QrRU5NVkJjVHNnR3pYQ21KckZu?=
 =?utf-8?B?b2RNcUVKdkhqZW9sSFJpMGhQZHdhYUwzdEJDN2FKVFpFRnN2cUwySk9LRjYv?=
 =?utf-8?B?NHJzR0NtbGo2V3ZOcjhHeTZLSWJBaGNkMnNXYk4yazdacHlQQzdtUUlYMjFN?=
 =?utf-8?B?SitrbThLTldhSFJEMnh4ODRvVjBGZXdYQnlHMThNeFdZYjRnKy9kTk5IbFh0?=
 =?utf-8?B?eFdNL0pSc0UvVk1jSVpHZ04vbGhnK0sxNW44alBsVUpEQURpWW1QeGRXdHhP?=
 =?utf-8?B?YnNGRzhVRXZBRXBpVll3K0hsbkxpb3FNS1RSTjFCTWFRcVJQcTB4OTd6YlRE?=
 =?utf-8?B?ZS9COFBWZUJLYm00TnF5K0x2TGtHWmtJWHhPOVdUeCtHNTE2U2hTbEM0bk9N?=
 =?utf-8?B?b2FQYkMxMEppdjAzS1pFYzRpb3ZXR1N2QzFRMktLOGpRL0FGYVd1c1FiWmYr?=
 =?utf-8?B?dTNTeTUrS05GR3Zsem9TZHBuU29vQmJmZmNTTTJuVVZoYzZUaDM1akxxL01T?=
 =?utf-8?B?U0I5aE9lQXdpa3V5bHBTWkVSYnBoSVZPNWxUb1BhUXl4M0NmbkxQWTlYVlJj?=
 =?utf-8?B?TER1OG96b1lDMmVLWFNoRE1OTVFuZXl3N3lHR3k5S0pJSTczVnhFNmJna3hx?=
 =?utf-8?B?ay84dWVOY1hqdEh3dUNmNHZsUnUwL3VoSXk1Q0V2UUNxVzJlU09Ua3lUaGdn?=
 =?utf-8?B?UVl3Z2pnbkxaVkhIbEY2cVIxNEdSS3YwM0hmWCtyazlWUVZ1L0xKaDFVVHFy?=
 =?utf-8?B?WDlxb0VFbHJVRURhNi9USm5FMHZMOHlqQ2pOVEZWeHJISjZoa0kzaG9Gbldh?=
 =?utf-8?B?YlBrWmVOSlllZ2llUFRtUytyUXlwTy9td3JQNk55NHNtM0lTbG9sekpsR3Nr?=
 =?utf-8?B?aWpWbjEvcngxbkpvV1RheDZlbzI1OW5OR0Jud1ptNkRlQjI3MWV0dzd0TUxP?=
 =?utf-8?B?T1U2VXo1QzQrOHI4amc5MHFUQ1JYcUVEd1FwNUhLT3lVZXhablRwOFVObEdZ?=
 =?utf-8?B?eldTdEVrdTl1N1VHRDdDOFlOTlg2LzBQNElSMG0xWU5oY1dWWjI5dEF2K1pz?=
 =?utf-8?B?UXhOSVN6NW54T2xuTFg0UEcrUFplVkRpelF1dEE3d1hUdDNhMTNieXVUSitr?=
 =?utf-8?B?czZnQWhjRWNrOTdIdVB1cXVNdEl0UG9jL2tsemNqNDJObllhWHJVQkJtNGpR?=
 =?utf-8?B?SFIyU2EyMWFtWlBmYmllMHlrUWk2SThtSVcvaTYwZTIvYmhQZXQ4VDBzTS9o?=
 =?utf-8?B?Szg2Z2c5blArbGc5UGVFazQrNnpqVEUwZ0IrSDNhbnRsVTRERUpTOGU1cWk0?=
 =?utf-8?B?UitiTHhEUzZPZDg4NURLQmtwZkUzNHErOXhBcmlFK1p1cGpDbXBLRmMzY0dU?=
 =?utf-8?B?TnpmK2k5aGFDaGlaUDBSam9oVTVZZlVyRm9DVFljZmJNQ3B2RklFUWZxUTRp?=
 =?utf-8?B?cW0vT0M5RDFBczd6ekt3RVlubExlWXU5T1kyYXJIQmxmalVLOWFUSlFJZmc2?=
 =?utf-8?B?RmF3Z1Bzd0h6SldQK2w0cDNoUnNoZmhzcFJMRjF2a0FyaWNoVTBEQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a02677b-7354-4798-1208-08da3d981083
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:14:14.9410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELRItQbni5kHvNHcaZt/H0DwJ0CechuONZ5t4rQCoDEKsDnG0OPew7+o/ykflRtwk/Drawx2CEQ6S0qK86672A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3158

On 18.05.2022 15:27, Jane Malalane wrote:
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -14,8 +14,14 @@
>  
>  #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
>  
> +/*
> + * Set to true if either the global vector-type callback or per-vCPU
> + * LAPIC vectors are used. Assume all vCPUs will use
> + * HVMOP_set_evtchn_upcall_vector as long as the initial vCPU does.
> + */
>  #define is_hvm_pv_evtchn_domain(d) (is_hvm_domain(d) && \
> -        (d)->arch.hvm.irq->callback_via_type == HVMIRQ_callback_vector)
> +        ((d)->arch.hvm.irq->callback_via_type == HVMIRQ_callback_vector || \
> +         (d)->vcpu[0]->arch.hvm.evtchn_upcall_vector))
>  #define is_hvm_pv_evtchn_vcpu(v) (is_hvm_pv_evtchn_domain(v->domain))

I continue to think that with the vCPU0 dependency added to
is_hvm_pv_evtchn_domain(), is_hvm_pv_evtchn_vcpu() should either
be adjusted as well (to check the correct vCPU's field) or be
deleted (and the sole caller be replaced).

Jan


