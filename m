Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49095445125
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 10:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221368.383050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZ6C-0007Bt-1u; Thu, 04 Nov 2021 09:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221368.383050; Thu, 04 Nov 2021 09:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZ6B-0007A7-UV; Thu, 04 Nov 2021 09:31:55 +0000
Received: by outflank-mailman (input) for mailman id 221368;
 Thu, 04 Nov 2021 09:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miZ6A-00079z-OY
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 09:31:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b66879c-3d52-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 10:31:53 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-j_vE1JZZNY2o6D1aQ0y_PA-1; Thu, 04 Nov 2021 10:31:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 4 Nov
 2021 09:31:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 09:31:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.5 via Frontend Transport; Thu, 4 Nov 2021 09:31:49 +0000
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
X-Inumbo-ID: 0b66879c-3d52-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636018312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YowYuaSMRJ/uJ0Zf0DC1BaJOVZ2nWimwP7x/ERMX9NI=;
	b=l1mOia+l5xvALY3mKf91QrWQgVlqSl38y5/K4th18yIlStaB+IoyMbsmvRhR9WfQUaVq7F
	nv678WF0VHXmEbZ4yk2Mo2TszMTPWCgM1BEr1XFLYnyRtCzG4BsXdcMZv+YN9u2KszcLee
	1yzO4ELwOftf/1sqElRW/8FhbPgwGNk=
X-MC-Unique: j_vE1JZZNY2o6D1aQ0y_PA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJafmPF6+EtjRZG41nDVc2yo1q+UfAInnauRZqL5D0dy3wALsBU3E3neXuqTaLFkqlBoASeTZPyHIVoMvgaBiPhArm3AA8tAt6vxceGeLWfoVtRLCb34gYG5D2dn0W1iTKahNafmMR5LZ0rzkk724PQtMH0g50a92ONfIL2JNhd93XfVxcS+j4faJNK5ynyggZBJgoxPQhvTqWNYUULjB+zOKocpELXhDalsRzhAroQuMTL7YPESgZPUn+enUzwxywD8HRgDL7jNX3bgRb3GKetikiQDwpixTB6vv7et54JgiNyl2BSDNoxIxBbO8DpqVAHJ9C3nLhO2ENAPmX83HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YowYuaSMRJ/uJ0Zf0DC1BaJOVZ2nWimwP7x/ERMX9NI=;
 b=kXRxht7Ksvuqq4/Y3BDwVs2Oz6BIetvvF8uBPRsCHJsozyu6pQTdo2HvBVmZccSq3jYneoVVG4gLfSHVKkKB/k8wSMe0vaccRETKe05OI68AEi/yLHT/OaEXv30gxdnkqVDaqszoWVTW2WMPzAazMG/gOrliNG5RrXgQWNbEJxylCGGcBplQr6C+dBeVmYmVndNTmLCRtFeOoixTfrxvWJ+OCvHaIStrbDTdAf9BqAokRXO+sYXWLkWYX6Hsv3gnHis1Uk2sS9XNQ5YnvRCLeuVl/LDJ9dSjOh4kmQd4egqKqiN1oHiJjt920S03F8/ClaFcjvbSiqjemGRR+GFxUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a3dfc2ea-3df8-0d78-80c3-4bcfa023efc1@suse.com>
Date: Thu, 4 Nov 2021 10:31:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [4.16?] Re: [PATCH v2 13/15] xen/x86: add hypercall performance
 counters for hvm, correct pv
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20211101152015.28488-1-jgross@suse.com>
 <20211101152015.28488-14-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211101152015.28488-14-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41ce6161-95de-4cf0-504f-08d99f75edf2
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB270250DCAB3D141C90909936B38D9@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	osOfYUerImBB0+78VJ6nOos7BrSu5wBdWZeR1ChNfzFir5lNdCBV6oALIGU4/UpT58ksSN/C4yQueTYbS7Pkt/m/ZQ8jwqk8OP1pJQSEv/Mv9aKmj41+OranzG7eFoqp31QeyxAeo1nsHyJ/uWaOxC5vHP0f8xZRg44YoGCVQCLs/NOT38QOHUOhRKxPwYIt8TOolaRhqajUo6PMQc3z88pRWqxbgWRlGE+ELHjh7MHs92xJyc4rgUbuITeTpqpnhsfLkFjzTW5rB7LSwvIxex9phrA0PXn/TJJZXdfwDpLFGYKnYuHXpF8LD4wqEYW6Y9uk6Ces946ph9OJKj0lohE4Bt8nE0gKNM+/ma7pgmJWlB2y/n/2uVMgfqICtw6vf/nEYGLlKn3LWxU4bM1khar+Qeavc8tVK8rgcu640pkYIIL0n6AfUPhptady5kor6jo+2W8NNIw1Rk/C1Ry+64dTwCdC3wjzN1t3jin2OBAMBKpJbAuBXTSXCKH7uEEiEl9a++PyDF+fXBrkACKh6Ka/HDDiv4JZGfE4FGcgLp/W/XukuU/WahrsOTupaeyfJysiQplKvCPHnCa6pXj72C4j+oCQAv8dUPOGVnbTmKcpfBGZVtw0vcuGeMGPuVRL35nol6fKCZDjDxBP4iSkNGJtOYtUgbrs5U0bmIupvI5gqwfqIh7SepvK1XT6zsDAFy/4YRdjoA5iOfQP42DsReM7uHxNIx9dK9E8rA0YsPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(2616005)(508600001)(31686004)(186003)(26005)(38100700002)(31696002)(956004)(36756003)(5660300002)(4326008)(16576012)(6916009)(8676002)(107886003)(53546011)(8936002)(6486002)(2906002)(54906003)(316002)(66556008)(66476007)(83380400001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE42SmRpUFdrNEc5YlhRTmtQb2pFK1BaVmF5WitlMmV1QmkwVm4vcVJlUmEy?=
 =?utf-8?B?V2JYem5hemdRczgxQ3BpMDFYLzF2RC9DdVhsSHJTYTRaTmZiaUgzWnYxcVU2?=
 =?utf-8?B?bmhxTVRmUURjMHZ4ZjRqZ1p0Y2dTY1RDVWpqOWxXVldNM1dLckZmaTVISkJy?=
 =?utf-8?B?S3F6bGpLU1UyS0Rub1I2d0NyUkxPbHJDR0w3cEVDc3ovWjJuRnhERFVkamgx?=
 =?utf-8?B?ZUUxNjc4Mzh0OVdHMFc0Vmt0YnhHMWJVSnVzTlBXOG40STA1WXBsYk1kbUht?=
 =?utf-8?B?Y1NNLzlTNElTU0dZdm9BRVA2bHhocGlwOWtCRytwM0tsY2lMOGhvZkdyMHdR?=
 =?utf-8?B?Y2JkMVhrWXZ0eng5WGRabHNlVm5UZEdjV2pJaGpSV0YyUS9ORldBRmcrQko1?=
 =?utf-8?B?VXVqUXV0aU44QkpjeXQ5VC9Ra2FVQzR1MEd1MHhPc3JzNWJ0YnRkdkZQZDZs?=
 =?utf-8?B?WW16eG1QajBSTDNETW5vZW9MeEcwaWVTRU1Bb0NLV1c0aDJ5S09zUEdDUWpO?=
 =?utf-8?B?Y1RicXZGVE1ueE5aeHdIdzZMOUQxUHJ2VlNBZlBGQXVUY1o3MDllUlpVT3Jo?=
 =?utf-8?B?ZlhidlE3R0VYZlhmZHdQVmJhT1FnNGlMOFB1aWhZQk1RT0JZU1h0bzkwd2lF?=
 =?utf-8?B?RytSYUE4R05zbStOOVg2SElkSUlIMVVjbzRERHgwQitPUEpDUnRTKzJFMnBw?=
 =?utf-8?B?a0htRElFdkt6ZVcvZCtMVjBiUHpXSWpnVTErREZLZWFyOVhRdW5sekcxdGFU?=
 =?utf-8?B?TUVTTFFncGFEUW1yb2MrRVFwV29WcVk4M3YwWFdHM1RyQlZQUXBaTHRjSmx3?=
 =?utf-8?B?ejc1QjdJdHpBWjJBM21VTEIyaXZtbExZWWdxc1NCckZHM2h2VW1ZZEdzenJY?=
 =?utf-8?B?Q1BKejhPc0hCMENaWVAxeEdjTTlaREFhU3hQVDJ1SmF3S3lHaGs4M1VBOVVV?=
 =?utf-8?B?Qm1Sb3JoZFRUU3oxQm5CczZHTHEvU0kzUnNWdWpjcFFPYnEvY0wwOTEyeUJP?=
 =?utf-8?B?RklVM1k5ME9TZHVRVG5QWkhLZGdZNlA0TEdTSEpxU3p2Y2RLU05zUUhtTFhN?=
 =?utf-8?B?SXNzQWVYT3ljQnd6NDRTNFRBRUJETm1xT2lCczNTOUttd3ZvbXpGaXM1L3JJ?=
 =?utf-8?B?K0dJa0xpQWR2LzZWOGVYcHhwRDhkZGdwOSs0eUFzRjJleDBGckhoRlNMSEtZ?=
 =?utf-8?B?K3IxNEtVS0U5QnNTNWh1ZGtWZWRQcTZHTGlzRmhyUVBwSitzZ1NkbXorVEgv?=
 =?utf-8?B?Z3RzN05rdVo1czdYbnRFYXJIZVpuYWFxSmZsaE1FcEFnTmNvYlRLUDBHZFlm?=
 =?utf-8?B?ai9jSis3cnpGdFZNN2tSVmtmcmxPZEtxNGRLNHBjdGhlV3JPZjRkYUEzZ2pR?=
 =?utf-8?B?NGJnUXRWdDNCd0IyWmlzNTdkRloxY2lBVmZOTHhuQVZPVlVrRjZjakZCTmFr?=
 =?utf-8?B?eU9GeXJFZ0YycFk3YkQycndCbnVEZVUzd3hpODZBTUlmQ0JOY1kwUUZzTG5U?=
 =?utf-8?B?ekVkWldnNkdOdUtHQk5PYytCSDhkMkgvbVI2eFdSb1k0TVM0TFdTdUtnWVBD?=
 =?utf-8?B?bk1kTkczVktEaEFDbjJHNSt4bEZEZmlsUHBZUXNKWFVjbFp4U05MaUkzUE1Q?=
 =?utf-8?B?Z2k2blVPZisrRlpSYjBvdlZ5KzRZeHVob052WXlvZzJPMlo3OWlBM1lxSU9M?=
 =?utf-8?B?cGJIWjA5dW5qNHA1WDQxWEVJWVZVSlRqM2JtSzFDbGdCcWNwVUJ3cVhmeVRk?=
 =?utf-8?B?dUFtQlVZdmlJM0pJanI0VHJCVWZOQk5kQksrZ0tyQmJYby9leUtOMVhJV2pN?=
 =?utf-8?B?aWwvMzc1MU9NdjZTemVDdTVPKzJOM2F4czFQc3ZEcnczZituVjJiY04veEcv?=
 =?utf-8?B?VFF5MW5md2UyVGNWQVVqVXlKVjlCUHh6cGdoQ1huOHRQL3cwUHdVYklsRkM1?=
 =?utf-8?B?VmdXNytTR0tTcE1GeEFXNmtveWZJWStIVkQvR0R1aXpVSmFleXVLOStDNnJ3?=
 =?utf-8?B?bm9KYTFzSVdmVnp4TzFCUXpOLzNDSW0wS2ZySkdMMXdldlQvdkJZMTI4VXk1?=
 =?utf-8?B?aEZGN2treDZHdGU5NkJrQU10SDJhOTFiTktvZEZ6d2ZQaXBrZEY2NlVQbERm?=
 =?utf-8?B?L2NsYkdRdEtJSkppUmFRYnZQQTROejN3TjhTOUdocksvTktzMk5ITGRwVklW?=
 =?utf-8?Q?jHeBJKOU/nIbKijx1lk0cUU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ce6161-95de-4cf0-504f-08d99f75edf2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 09:31:50.6203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b41hYte/Wn6KUeMgkL4evvuqSOdFOfrvfu2y6dtwvubgEu1sOa3WKaJCg0ShQuTTYyGaW/jW0XeTloxa08NlaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

Ian,

On 01.11.2021 16:20, Juergen Gross wrote:
> The HVM hypercall handler is missing incrementing the per hypercall
> counters. Add that.
> 
> The counters for PV are handled wrong, as they are not using
> perf_incra() with the number of the hypercall as index, but are
> incrementing the first hypercall entry (set_trap_table) for each
> hypercall. Fix that.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

this looks to be independent of all earlier patches in this series,
and I'd like to suggest to at least consider taking this as a low-
risk bug fix for 4.16. Thoughts?

Jan

> ---
>  xen/arch/x86/hvm/hypercall.c | 2 ++
>  xen/arch/x86/pv/hypercall.c  | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 6d8d6693dc..1bac5d4d44 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -210,6 +210,8 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>          ioreq_signal_mapcache_invalidate();
>      }
>  
> +    perfc_incra(hypercalls, eax);
> +
>      return curr->hcall_preempted ? HVM_HCALL_preempted : HVM_HCALL_completed;
>  }
>  
> diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
> index ef92266620..bf64bb41bb 100644
> --- a/xen/arch/x86/pv/hypercall.c
> +++ b/xen/arch/x86/pv/hypercall.c
> @@ -102,7 +102,7 @@ _pv_hypercall(struct cpu_user_regs *regs, bool compat)
>      if ( curr->hcall_preempted )
>          regs->rip -= 2;
>  
> -    perfc_incr(hypercalls);
> +    perfc_incra(hypercalls, eax);
>  }
>  
>  enum mc_disposition pv_do_multicall_call(struct mc_state *state)
> 


