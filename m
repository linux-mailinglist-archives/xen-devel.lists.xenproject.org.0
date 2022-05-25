Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02405338B0
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 10:42:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337026.561497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntmae-0004NE-4l; Wed, 25 May 2022 08:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337026.561497; Wed, 25 May 2022 08:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntmae-0004K3-16; Wed, 25 May 2022 08:42:00 +0000
Received: by outflank-mailman (input) for mailman id 337026;
 Wed, 25 May 2022 08:41:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntmac-0004Jv-Bc
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 08:41:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8933c8cf-dc06-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 10:41:57 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-J740Ea8ePgOW6uwEgJJLIQ-1; Wed, 25 May 2022 10:41:55 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8425.eurprd04.prod.outlook.com (2603:10a6:102:1c7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Wed, 25 May
 2022 08:41:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 08:41:53 +0000
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
X-Inumbo-ID: 8933c8cf-dc06-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653468117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3zvJ+3CbKfVe5BuvouP2HmiIFmU+zLfOcH4Jg3T4Cg=;
	b=iDEUb81pMwI3BFzKJ+IJeF0Jl90mIjUvb2AIlvv+tlOvwp3hbvokHKNoh1aZaTqGLrg5R6
	/EfZnai98MHXxLrtwQADhMuwJWoNN8tE4ThTB0QVjnCSnH0jjg/UaptUo3ALJ9Ehxay5cR
	h9oi+UDEU4FCr3xlCENqRT4RKbWOOc0=
X-MC-Unique: J740Ea8ePgOW6uwEgJJLIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2MveAswbsFe0dwOaRER8HEPkA7avgQ/ihtX+aWIYrFGj15uxViJcfFWB+GUViL17ACeNWcSMKuPa4Fu2J0zviOlobZnF0GLrtTLqZTfEMTqRsmk1UBW6+tteGHrwl94XlHbbCiwFIRW7oLGeRNq9qAS3ZL/tQ5Doat8qmDCDtBskFjXKs43ew/Vk8oEiUke27KC+q4NtZD0XITV2Dd6rrqsEars1CQq7E3ZKeKYEhRa/3f2AH6A+b1gVkshy/g+3cfgHunFsjzfWztGUIsBRfkzxafiBacPesWTpmt2hQah2FCX2Kd7E4dfQasfc3wKFmsIo7+x7YjacAw+Mz8XoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDjnvdxJLioNfy/x/qT7aOKTN9KZ8mSz1GaRpPQ9z0o=;
 b=nR4crWXQconKDYEz230n/YdkcMPjg9ftdm6m8tZRtIbcFOFaf+YsY3hu332t3aMn8flMWB7Vvd7Yl3IrALRg8C69gcbgcVr0dgIMumofWuTtirh4oQKZCrypHriep/D3+UX/3i68NbuxsEaNRt/u1s5cZY/VAOqhvbpYJVFe66R426K56yiyFlBS+KiqElINZck6+6zaCbtqEb4PBKQJcznke2MEgdoZYnMPavmkfPrGTcMoBaJWtYhdhI7EiWWuw/jn38zUHkH3U5a5K0BJw9sUyXIQMnz8em03kTKLdE6WLr6pPLBMFSxeQGkiugVO6CjBwYpTWsqS5AXhz13IYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f030cf7-fbba-6ae9-b797-f695221ee081@suse.com>
Date: Wed, 25 May 2022 10:41:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/2] x86/flushtlb: remove flush_area check on system
 state
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220525081311.13416-1-roger.pau@citrix.com>
 <20220525081311.13416-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220525081311.13416-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0502CA0021.eurprd05.prod.outlook.com
 (2603:10a6:203:91::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fce41658-b27c-48d2-2bfa-08da3e2a6b1a
X-MS-TrafficTypeDiagnostic: PAXPR04MB8425:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB842575020F79495CA7697122B3D69@PAXPR04MB8425.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UDpAz37K99swBEPNIeLNQLWrlUVtKx9hTFC/jgmi9PuwSZaOXBVdxFcD7A2ZAupVw3r405CJVoJ+IqkWbsb7y50OiSWHCqNioeq8Gu9mnvPxR1IFnSQmeTElS+cuZxNTg7BuJWUiWVyZY+SJjNUwZAPjh0IAIDjKhRoIcUJ+VdKaNrTfMhzdx4EgraCS3N9hDZErYU4RsFT3rdAevqypzoNPLSaFtySfhQCm5E4YX65b3YuV8SgVLmxWl6znGNid4jKvAyTJNhhdHWla844E7acafFa9KiuVRfTBxh8nb2lxV5cNYhZvs5JuE8CW5kXeYbj9p0xqkJK8LMLUUReG+MA1tAaavqkb8smBbUgM+tZwWlZKsjNQUu69oEkScV8JxgniEtQtVsznlLL4vlRegaxX5LXpirE5ZqDV/U7MLUPOJi2xNh/rAc4XcnTHg2CwZ2EyyXotWeEtiOV9K9g5pfbLO2SIof5DNncFmfkRTDoSryQzhKq0qEZizhJ7OfXXl/USiJN6Prht0L2Dc2KJ2PirL+7m/NiR0J0Wq8O93MotG8/EFjtuautf86Z9y5V+jdaHSaE0bZGMpxsBxwwVmiCY689YoD4v5LyQ2BOBE9NYGITIYPXoRs5XLKrTXk1BMmHdxPu26uipiFIeEx//mJROn0j3BTncEEI/XwM8YnCaaECJmSMlqZgnKPkgez0MowJAyYOHIsG8WmJFJbjcEwSQsnFZSzQDiMoPi89WLgNMSn6ZmHNuG2omh7683bgW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(86362001)(31696002)(6512007)(26005)(66556008)(66476007)(8676002)(4326008)(66946007)(508600001)(54906003)(6916009)(5660300002)(83380400001)(316002)(6506007)(6486002)(2616005)(38100700002)(36756003)(31686004)(2906002)(186003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LKWE/VCP3Cr3l32HbtlvPjx4aDCcWA6PGS+SOMlgm1Ioxwief2Pq/GaJZ5T2?=
 =?us-ascii?Q?FCcdTymSsaDtAz9noQYSNAsuwL7UiUjpM31FWDw2YUXRvMl/IXSKlPh8qtxb?=
 =?us-ascii?Q?53BnANie/f2gYZ0H2CvyPGwinodoxI6mSp5SIlLqbA6mAdi3+4fr5tyqULjB?=
 =?us-ascii?Q?BzeiaU5rSthXz4CGEJa3pDswSzK6tyCM2ARMJzU/J+1gvTfjIAbx599Q9oVa?=
 =?us-ascii?Q?JseUlcCRti9vbe8ekm3QbYCALySm7Vgp6dsMjEo4nrBBT+RvmeJfsjnfbO1v?=
 =?us-ascii?Q?ImSAjtv6DUpOxPBdBGEY1NUX+L5ZiW3Uz8L5ZZ3WUqO9iJMx0O2JuYxA4r+k?=
 =?us-ascii?Q?JTKlRzBUkbQtQPDqtQvQNRLnoUMmSXzcICbZxRZ/EexJ3etiXOWPhXnuJWzs?=
 =?us-ascii?Q?M7RDi/Nyf9Rkrkq90tN1R1OZT3vprsdAizzaQlWvdYgKCWw/sKtmU3llLOi2?=
 =?us-ascii?Q?DH6baln6fx9Q+21qXrK7eBeotJeE3dIZlzW3//z0jRrcReL+/bv5xoDiSm5N?=
 =?us-ascii?Q?nQvxMuu/x9287vW3f0giLn23AJEFuJYbmJLz+zNgvWbhPdrXejNojy4dz1Xz?=
 =?us-ascii?Q?wmGUW/3byh/JDStM7iOFJevkCLhAeVSSQ11CDsPPdgpunJ1m8zGQg6Q9WVhN?=
 =?us-ascii?Q?YwCVhDmmhDhs8AkGyqrZd7i0wDQI7KqCeZRAQQ7RcFAyw6OppRkVYTGm1338?=
 =?us-ascii?Q?G9aEFK7DZGKGHNt1NXQs8H+Wq4Qx2mj75M0e7WaTO94HJSE+cAI2gLVXb2s3?=
 =?us-ascii?Q?UI8DE4GlZCk8w/A4Q8whYdF0QmslexRXK1Behbe1qAXiDoJYUvcYVz4cpq/k?=
 =?us-ascii?Q?8LPXJjkUu+w126gjTduaF4xeIPvFlWruEbWDnHEAiT9jcGtExlgN1Xpqfz2X?=
 =?us-ascii?Q?bVz/w8cuaDaARDOZ2pw63XSRvQcs/vrM8O1qt83PC1oIsNnAw5BuNOYajrMV?=
 =?us-ascii?Q?vgb7+DFyD0ABSY/TKwjyqaAkOwr5O8QS25mKA5BLMANqI0AsrvpuXQmJYChT?=
 =?us-ascii?Q?6nNsXLfPGD9KLr6QwumAQqCbNnj49rPFo9NnP+/dgLOGM4tnWRYmG1/4Lr7H?=
 =?us-ascii?Q?uvoNhlPwumZGRCls25y2d5czMD8L2YEcU2W7sPFZ/7LgrQiyRhBN58X45nEm?=
 =?us-ascii?Q?V0oL/LyBiVNLKJ/4YnFujbYm98g8Z0LQ6OtHbVja1B4eq3amnGAM0oDSR7z/?=
 =?us-ascii?Q?rmsQAenumgj2EWMstTboF/ByNnN4pcc66ypcNvoGhodj1DbdvN8fcqu4Iy9M?=
 =?us-ascii?Q?nqPcfFemeFsAk4Ge/8X25AO0qXr5jV2CVyuJgxyxUkSjCLiePASw5DsSLsa4?=
 =?us-ascii?Q?3+ZDUvXm2tNalGmOHiVm/cA0i148BjxoBX3hoB7B3rPdL35KgfJTe1Ufb3K5?=
 =?us-ascii?Q?I8bLbmHNmn064U6xdPQFoacU4dVfmd6bUq9mTX+lsBZk1/bUfF1QZPt9stnT?=
 =?us-ascii?Q?kZ4nEEZKUVXhOBnbtERRN+lTBPebHyNG+91bGWfvKjkD1IwySKbpX8NqkmsL?=
 =?us-ascii?Q?pzgaqOMY9juChaebHVPIBBx+NmX9r2Ttu06i20sICf7iJrxfsxQ8JgMCoJIi?=
 =?us-ascii?Q?vn3tR9O76Yulm/T5v/mNG5BItuX6DsH3z3FqfBHJy7FI5zHrurJSQpf0ziZE?=
 =?us-ascii?Q?sCuvOLVHxrx/+okjSKussGMZNy89gqVjn/5bfp+rHqkpvFH4HcfF/AQAHgCF?=
 =?us-ascii?Q?a9t4c7v6pz0C0JUeys7B2wyjKLcRhaLXfnrk/DJw9DF3xrvFnG01GtFojatm?=
 =?us-ascii?Q?Pnpkf5Hysw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce41658-b27c-48d2-2bfa-08da3e2a6b1a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 08:41:53.3866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UK01YIWr8+9M+iQAdBkyUsDw3xJ5Bj5kiv6NS4NSLqUmTnHTKh6VE1xsmOaFagVzGZeGzaBochm3aT2EfSvPVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8425

On 25.05.2022 10:13, Roger Pau Monne wrote:
> Booting with Shadow Stacks leads to the following assert on a debug
> hypervisor:
>=20
> Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
> ----[ Xen-4.17.0-10.24-d  x86_64  debug=3Dy  Not tainted ]----
> CPU:    0
> RIP:    e008:[<ffff82d040345300>] flush_area_mask+0x40/0x13e
> [...]
> Xen call trace:
>    [<ffff82d040345300>] R flush_area_mask+0x40/0x13e
>    [<ffff82d040338a40>] F modify_xen_mappings+0xc5/0x958
>    [<ffff82d0404474f9>] F arch/x86/alternative.c#_alternative_instruction=
s+0xb7/0xb9
>    [<ffff82d0404476cc>] F alternative_branches+0xf/0x12
>    [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x2776
>    [<ffff82d040203344>] F __high_start+0x94/0xa0
>=20
> This is due to SYS_STATE_smp_boot being set before calling
> alternative_branches(), and the flush in modify_xen_mappings() then
> using flush_area_all() with interrupts disabled.  Note that
> alternative_branches() is called before APs are started, so the flush
> must be a local one (and indeed the cpumask passed to
> flush_area_mask() just contains one CPU).
>=20
> Take the opportunity to simplify a bit the logic and make flush_area()
> an alias of flush_area_all() in mm.c, taking into account that
> cpu_online_map just contains the BSP before APs are started.  This
> requires widening the assert in flush_area_mask() to allow being
> called with interrupts disabled as long as it's strictly a local only
> flush.
>=20
> The overall result is that a conditional can be removed from
> flush_area().
>=20
> While there also introduce an ASSERT to check that a vCPU state flush
> is not issued for the local CPU only.
>=20
> Fixes: (78e072bc37 'x86/mm: avoid inadvertently degrading a TLB flush to =
local only')
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5070,13 +5070,8 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
>  #define l1f_to_lNf(f) (((f) & _PAGE_PRESENT) ? ((f) |  _PAGE_PSE) : (f))
>  #define lNf_to_l1f(f) (((f) & _PAGE_PRESENT) ? ((f) & ~_PAGE_PSE) : (f))
> =20
> -/*
> - * map_pages_to_xen() can be called early in boot before any other
> - * CPUs are online. Use flush_area_local() in this case.
> - */
> -#define flush_area(v,f) (system_state < SYS_STATE_smp_boot ?    \
> -                         flush_area_local((const void *)v, f) : \
> -                         flush_area_all((const void *)v, f))
> +/* flush_area_all() can be used prior to any other CPU being online.  */
> +#define flush_area(v, f) flush_area_all((const void *)v, f)

... v properly parenthesized here as the code is being touched anyway:
One less Misra-C violation. This surely can be done while committing.

Jan


