Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26698705278
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 17:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535398.833091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pywp8-000303-TD; Tue, 16 May 2023 15:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535398.833091; Tue, 16 May 2023 15:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pywp8-0002xx-PR; Tue, 16 May 2023 15:42:50 +0000
Received: by outflank-mailman (input) for mailman id 535398;
 Tue, 16 May 2023 15:42:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pywp7-0002xp-Ek
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 15:42:49 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e6cdb5e-f400-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 17:42:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7113.eurprd04.prod.outlook.com (2603:10a6:10:12a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 15:42:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 15:42:44 +0000
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
X-Inumbo-ID: 4e6cdb5e-f400-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRPOkUqqghNs+T1+f7QJXQIazpEDdeWdaghB51voz76DKX5xFAINZFqL2xoep87rYXNkhw+hFcnLfQJ0EVq/ZufcRZwH/xCwK71DuUd7Bw+4hoGwUuPdCbFErSJ7Q1SUvv2gdfaDtsUuSsp7OKpEN/+LRdv639Lyhs19HuYZOC16mMXQ+kswsvrmAYpuKG646gnVDIi0Ahic3rCkKHSaKk4EPD9mkkPQHVxqGk/e2/BIfHCzgiXIZT/SaNogvC8620H8tHWvvyPfcprEI1iW14hfwRTCEbB3uXen7wBsDcRDNKDRO26Q6ImRDZEemkM5vo3Y+hGU6sD30J1B2ubMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NMD35Yuc/kijxQlK4gShHDcs8NAlHM861Ruu5CJ210=;
 b=DbreSjUzlGHpRdYbcC3yMC7PSpP9M9A2tK81xeScca2OmLOU1KTsrZtYMooBHs8NCLatZ/4BneBwGq0G80FHgXEMeq2hDovp/5lNxRyz5lzoEz7Yyti+dCMxHq6HHPSFWdvfTokJ1jrKp79P955bxEItu7taanzdY4xWYSnYN0XPeKVF3bColRcYoQxm1SKRJ1tG6SFN64vbd6oGnfNtouvpsthDjA9DVxtP3RCfw1VRNSh8tzTCPw+66tRz4QzAuwo5fe7G50wb6Lh7fUT+ecNtOaN3pBCmuR+6C9skK2FzlKou7yHNm3Kg0D1gAwjqj9j7Ars6khnXUwyRi+ffRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NMD35Yuc/kijxQlK4gShHDcs8NAlHM861Ruu5CJ210=;
 b=logwn2XKub35bwvxEnFHmjhhJCSinSeMYn9mmK2hR25ihtblIUWKjTiUo20dXjNAEAHaBga2JlPf9O2jQpgoTsopb4r6V8rsvqTnGQZFTUDdGX74Z7gdQ82eYjmmosL2wchxCwe57oiljBZJYGL4mzr/BmCzrwUb/5ne2DADUuvWsTduD1pWqXpd5w+taZ0Mk6eJzwdULkVUlnrsEgpWSLzZYKKUzg9F3UErnBFDe7Qe6cjWz1Reyux61f0Vtczt8jJ5SmQXPgEYV07Y42MuV4JsCzrG6P3eLJAwtPKH8xisQ5ICxM60vG/VcxR2HBO7VP/7P7xftVCUjMreKXi/Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d1529686-ce06-a707-de9e-a4b28c9f2e02@suse.com>
Date: Tue, 16 May 2023 17:42:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 1/5] xen/riscv: add VM space layout
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1683824347.git.oleksii.kurochko@gmail.com>
 <7b03dbf21718ed9c05859a629f4442167d74553c.1683824347.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7b03dbf21718ed9c05859a629f4442167d74553c.1683824347.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c077a1-dcbc-4482-ab59-08db562430eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JUuFwQwV4TOWbMSwsZllct1zQ2dG56DZd62fvegWwWcL0xp+2sbSqyd1pvwi2oPRitMD/99eaqFlka7RPPk1d6JJuojHTSBzVte6XFdqY5m9L+afH8pGe9I7MtL7QuubCepYRDMm/XHZQRDDGBHkAGpzF5Lw9otAG1owS71EV7fH5elgZFWAECT4MxDah6YVu8pHpN61lGer4Gqb2nMe9ng0q30CcDjTAC4zQ/TtEwhXMPV36/ClXWIGnbMMnvSlXIIHTXeFHIWLjwWy3p2VsOOVt1bGg/0fzAh4G+DXT7ltgT1tbFiDUoSHkDe3fG6C3TkaPNeE8fgwdi0qlWD3eKdBovIt28La5nSK77FlePPWn7dgmWDKCnx9R5hCl0glaiGmhUJuim5223NW+4sswd8xHqOBgJhPyTRurQ18jS+fXy7Gbg4avL/8P0nCjblHe9XgIUy0b23pdxXPi8dOHZWJ2c7M/Q0YYmzEB+LaczC6/W1BvH7Ov9H6bnrPvfDOA0zfMa0MFQ1b9wGvdM+VXfU51yNFpXG3l50g5JUMQb6/TLrB7SLDKedRkRrqWWu2T60DCL5KY32UBbEGeuntQzc55Aq92uXgRShGI3wUwGehpUt2bz6xH2LQKanc4mwqKfyTkiM5LTZXSZvxgwdDDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199021)(53546011)(2906002)(31686004)(6506007)(6512007)(38100700002)(8936002)(54906003)(186003)(8676002)(26005)(478600001)(2616005)(5660300002)(86362001)(41300700001)(66946007)(31696002)(36756003)(316002)(66556008)(66476007)(6486002)(6916009)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEp2d2FlVlhwZ0NDTVMrYXJ5SExMSENvWnBCenlkdDhBdU5lbElJQ21mRk5x?=
 =?utf-8?B?MVZyajk5V0o0cXFDZ1FwYTJZZVZBWFVPL0F6ZFkrUzlZelMzbDRxWllQK3M2?=
 =?utf-8?B?Q2pZeWxsbHR0M0ZFM1VXQmJnMDcwd1ExYTNTY2FJbEEra1dYd3gwL2F1cUFR?=
 =?utf-8?B?L21BZzkzd1l5a2M3eGJzQ3JZUDZNd2IzektvTzRsUk1kZFhNS05Xczh4TGNh?=
 =?utf-8?B?TUowTU9QdXVSdEM2QWhrK2dlNlpvR0doTC9acURGTUwzNUJKSjlvUnJrMkNQ?=
 =?utf-8?B?dC9icWRvaEd1U0s3Z25OK1pOWUQvNnUvdHZlRE9HNDVzV2VxK0RZUWowRXBF?=
 =?utf-8?B?aXBqMEVWN2pKa09vcUVqTUlGRXZWdUVWSTc0SE9rMHE4VzJtcFBaeTZ5TEJj?=
 =?utf-8?B?Y0lzRVhjTlZYNlVTQzcyak4rTmY3cldJWW5mbW8ySWU5RXpoNTg5ZUZLWEpX?=
 =?utf-8?B?QUpPZmU0ckl5QVpzM2hINnczQ0E0dUUvRldmUk1idWtmckVKY2REaC9GeWVy?=
 =?utf-8?B?dEo1WUY2WHJkdEIxWDF5NGZ3TnZDdjRkUEhYSEJQaUsyUEQ2UllaVnMzU3ov?=
 =?utf-8?B?SnlyVlNBVEd1QzlzVTA2QlU1RkdIeDNiSU8xbXR5UGlIemk4UHFlRVRhVitz?=
 =?utf-8?B?Szd1V2lRd3BwR056NVRFRFpIaURkRnRMMU9nbnY4aWJhWVozSXNJT1htdlJ6?=
 =?utf-8?B?aVVzNGxzSS9pMTBXaU8xSlBiQkJYK0JibXY5TVA2TUg0eDlCQUkwa3V4N3Qy?=
 =?utf-8?B?cjdTL0srUlNZVmVucXBxQi9oUDF6Nk5hSUlRMnFualhja2J4M0FHUU9lQ3Fj?=
 =?utf-8?B?N2VwUXdmYzdwMEZ5WElpdGZaMHNTK3BPMG5wTmdGZmNNejcxUkpOSEdjbGpr?=
 =?utf-8?B?QjJCN3FMWG5EQnlqUFYyY2ZtdWdUd2IrZE93WVQ5ZExsZ2k0SnlQZ0g5NDBE?=
 =?utf-8?B?WFdTdmVRVllhZGVrNTF5WkRoZE4zbCtUOXZnQXp2S1A2aXhlcmdybGZTSlE4?=
 =?utf-8?B?UmdDUFAxOHZWZDFhc2JSekVleEJSd2Y3NGtUNEFLUk1RQ2poZXNQNzFId1pW?=
 =?utf-8?B?SGRnazhWRnBRZ1Y4Z2pJaXlwTWt1RFNiVUpSMlRuSHkzenlYN25nTmR3dWtU?=
 =?utf-8?B?N3lJYmsvczRsZEpXdlFtS3R5UTYzYkppeExUancweEdQaEhCcXIzR0N2ZHBa?=
 =?utf-8?B?TmpKS1RFbUIrS01VSkdQUWx6RGRWN3pra3IrQldacGFmSmEwMWNEOUlEbm96?=
 =?utf-8?B?YlltTXZNK2JuVXFUdjVLNFFTZUJoOUlNdksrMkZJUTlEOGhzTjJxVGhndmxh?=
 =?utf-8?B?eU9TQ2szWkNVYTlpZ0hDYTloaUQyTWlubnhEY2lIYytidFIwOGlybUxSd0xE?=
 =?utf-8?B?MEZiTUlKWFZWSVFSb3dlbWE2VTZlMUtDRTlZZU5ETDZXczZSbnVRbmlWL01p?=
 =?utf-8?B?VzB5ZFp2NUVuNDdpdURZOVBHTHJRbEdFM1F1R3BVTGljVHNTT21LODdDdGdU?=
 =?utf-8?B?alcyb0YvNnZzV0Y5bzZpK0UydWhJVUpaWDJvTFlJUmdHQTJuZHdhVWVmekxr?=
 =?utf-8?B?OXVCbGt2NE0wUGNwVVA0RmREL3ZjRmxGSzNnUDA2Z1NjUmxtZlN1dnlpWEFr?=
 =?utf-8?B?OXJPdXduaFZZcjZES2RRNHZwUUtNcC9Eb0R0ajNIMlVxV1dXaUtIZXhmOHVj?=
 =?utf-8?B?c25GdmNOSDRkMGNRLzEzVzIxMWl2MjNUNzJ1M3A0REdVTDdkakFHelhVWldt?=
 =?utf-8?B?Nk5nV3VJTGR6T0E3cE55aHpseG1WbmhlZ2lMaDR6aHpPYTlaSHZxVVJFOUtT?=
 =?utf-8?B?TUtReUlVSmhadlc5clJmeUh2bVNLUHA4Qk1CZHVrWi9yY2VreU9oVVhVT09a?=
 =?utf-8?B?c2ZpZjE0Qks2ZDJkbkpveURlUG5YVjNKL2c1MGlrdGNHL0lhSmR0dTRDWGl5?=
 =?utf-8?B?ZlR6aDdtdlo2Nm96OFdCbmY2S2tuMDNnZTczZGdIZEVwS1NsYUJKU1hGd3Fy?=
 =?utf-8?B?TFFVTXQzZitFeDhzYk15aVVLSWtBM2VlamU0T3MyOVMzQnRYc0xtVUREcDR1?=
 =?utf-8?B?M3lBQ2J0WC9MaHhHUmVQaS9NbGZoQUJMdkQ2dTA1MW1zcThQZHd4WnIwWU9R?=
 =?utf-8?Q?v51lSTIKlKJwUD/ryb+MGrEIy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c077a1-dcbc-4482-ab59-08db562430eb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 15:42:44.5462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZN6gXscuoZO3Z/hWTltanRbGTzZPoS50hjoThDWGffv1pZex+IWOoMC4JFHS64oeLF3snv7p9MA8lbg1zVjeSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7113

On 11.05.2023 19:09, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -4,6 +4,42 @@
>  #include <xen/const.h>
>  #include <xen/page-size.h>
>  
> +/*
> + * RISC-V64 Layout:
> + *
> + * #ifdef SV39

I did point you at x86'es similar #ifdef. Unlike here, there we use a
symbol which actually has a meaning, allowing to spot this comment in
e.g. grep output when looking for uses of that symbol. Hence here e.g.

#ifdef RV_STAGE1_MODE == SATP_MODE_SV39

? (I would also recommend to use the same style as x86 does, such that
the #ifdef and #endif look like normal directives [e.g. again in grep
output], leaving aside that they're inside a comment.)

> + * From the riscv-privileged doc:
> + *   When mapping between narrower and wider addresses,
> + *   RISC-V zero-extends a narrower physical address to a wider size.
> + *   The mapping between 64-bit virtual addresses and the 39-bit usable
> + *   address space of Sv39 is not based on zero-extension but instead
> + *   follows an entrenched convention that allows an OS to use one or
> + *   a few of the most-significant bits of a full-size (64-bit) virtual
> + *   address to quickly distinguish user and supervisor address regions.
> + *
> + * It means that:
> + *   top VA bits are simply ignored for the purpose of translating to PA.
> + *
> + * ============================================================================
> + *    Start addr    |   End addr        |  Size  | Slot       |area description
> + * ============================================================================
> + * FFFFFFFFC0800000 |  FFFFFFFFFFFFFFFF |1016 MB | L2 511     | Unused
> + * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | L2 511     | Fixmap
> + * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | L2 511     | FDT
> + * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | L2 511     | Xen
> + *                 ...                  |  1 GB  | L2 510     | Unused
> + * 0000003200000000 |  0000007f40000000 | 309 GB | L2 200-509 | Direct map

The upper bound here is 0000007f80000000 afaict, which then also makes
the earlier gap 1Gb in size.

Jan

