Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DEC5744D0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 08:06:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367063.598114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBryk-0002ey-RR; Thu, 14 Jul 2022 06:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367063.598114; Thu, 14 Jul 2022 06:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBryk-0002cP-Ol; Thu, 14 Jul 2022 06:05:38 +0000
Received: by outflank-mailman (input) for mailman id 367063;
 Thu, 14 Jul 2022 06:05:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBryj-0002cJ-2S
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 06:05:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80074.outbound.protection.outlook.com [40.107.8.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f90c8d66-033a-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 08:05:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8347.eurprd04.prod.outlook.com (2603:10a6:10:245::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 06:05:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 06:05:31 +0000
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
X-Inumbo-ID: f90c8d66-033a-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYAIjuyLuEejay4mhMFDu3jYQ58gAtC0Qj7v4WYdclfli9YclGHNzNkKQeAB3TfNRLBHQrfR77Xbl99gKWsjrCifGzdmSz0rbvwYposownHMTOgw9B9O54CR+XfBvzB4jC66QlP4nrF9+GD/HdlSEkqHIWY8RK1mYBJoz+hqcXmO81s5N6Mp+DGNw4t5AYKHhXwtRGM53OpLN/u5RW+/Z3sdvKL/qwJwXvVGheHo4DJUArz+lhS2/c5Dkohy3Tt4tGxTCRphuUNpOHG5o/z4pbGEJPBuOmHfGJfhvpRD1VMMKyPcq4gBSP47VW8yhF2sKZ0UfQMDZlqYDhSUBkHJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24sQSeTVr8k/uNw9hI04MeMtAN4nyVGXxJrihRxWGkk=;
 b=Acv6/L4VA/DF3ihTpM6XDv7VIzPnHUmbrYgbIHdpXdOe99p77WuGA/Sd/c4zwVcArgoytDI+Smx8xak1vJRguYaYTjbRH805A5LDVxTWEtMV/4e7o7Hd/o/d6JMbWv1Y8k4k6vcICLTmszEmll6lYFYXLdEVnQkYa22VaIdN4jiBX7BYqFflybMMxaTRaVVkQSDZ73SBgKeTe1+1BzUcxTMWqKl33m8HKk5jn1MizRTHseNoaA+xQ2/Fk+hQsoPWDt0oh1mwpG2rzzynl9t3sU+KWXPAVClISxXT8882OS54kz8xC7zsTgElE2VQhu7TiCuD/tRcDZQUJAYPbvsXCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24sQSeTVr8k/uNw9hI04MeMtAN4nyVGXxJrihRxWGkk=;
 b=Aew3WbasWLpNSs7FPakHTSBp49j7mmLU2WVgVZmdKk9t8sCFJoyCh7nHX0JAfLtVVBAjINvKOl6abaaIxyo0PhlTF4vFPDf14+PiX7DhFDsxi9mP1LL8LLYaTrHuS0ZMK0WJjeoQFlp3H4NbHsyHR58wd4WuTt66HMC0c0RegUfiYB6eZBw65ZrV3arlceHEV7IBQE+cmcP4cfvM2PXD7cZoXty/gGoqxPf6MuUBAUgLoB+1dprCX+8wZUhYWsEqtBqTamwx142Vqorf65iuwlraka/ub5fX78XW+8sTFFmdlKWpunNNuEcBP9CIdPXArZIBgTHVuZQ/QxkO7zNlBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d55ad603-1d54-f3cc-5a7e-87103704564d@suse.com>
Date: Thu, 14 Jul 2022 08:05:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/9] drivers/char: Add support for Xue USB3 debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Connor Davis <connojdavis@gmail.com>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbcd722d-9453-4810-c8ce-08da655edb7f
X-MS-TrafficTypeDiagnostic: DB9PR04MB8347:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+YbIBLkcKQ9BS4/SzyFSKf/BHMS6gMcMNCeBXKMzZXhGa7fI5O8zM+T0+LY8kOT70+ciE8krpZOIye5z5mkJyaUHc/oINkpvpVyg+JMWa6RymqlGAxjMekaxnHRIH8xnh/1P5b6id9P5VrYs7+mzkLzvX3o6OJB/mNRjOI1GMKCxCnQVQYTKbaYi5Pn4LaPAsJIAIQVf94mtOQYSI0KLCdsvtI1wTQnSwCDn29F3t2Q2ZU5v1gcwiq006ylbYncyobSOIBOIvh9FV1uAr6f+lZEKoVIRaiLz6N5DB1H26XRH1ZskttmoK2YQqdzIfaxjntxwilM6PgUMxxuvd2TIY861QkN+ReyyR2x4o/FW0ow7x6UXjlc8fDAh9sYjahsg0u27ykIRfaS8gb/kiqSDxsDfmmDL+5ZRwm4iKMRVPcxZDeB10mqh1OXhlwHW4LY0pUtUy1IHuxiQEcSdoZRrXg1Rw71hmrSGPqEPKMS798yY8ngqPakkhISVTKq7VUfm2k7vWA/0QhLiU//9QsPgVViz369lgH9Nf+O0OsdOY5cJdiODjvI8ZbEqSq/lVPAtJJtRrioeqrWbnhlgsZbIqGBkPBwRHTAWd4bN4+fYb4MtWPvKv2uSXrhyYrRN+nuKs0uLugtXGMPGe/6mQYh7pG5MlkG+t9L3mnMR14lGst0QzNRha6Z447ehBT/eeiNLS/kh+Zs9OUNYvNa3L4Xhhyf3qDkBRWZ5ETd93tz1RqI9vfaaY8C0S7/KFKWqhF211oqcV3Hor+NPS3kW3Di3PQGcTX8sOfaZqEvSw0I2RSrh9dlb38QhXLV7V0PC1PQy0ff/J4JwGzAa151T+FOqIkhh24/nes8QVffGs2yk58k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(366004)(376002)(39860400002)(136003)(4326008)(26005)(5660300002)(6512007)(4744005)(8676002)(66946007)(66476007)(66556008)(478600001)(41300700001)(6666004)(8936002)(6486002)(316002)(31686004)(36756003)(186003)(31696002)(6506007)(54906003)(6916009)(53546011)(2616005)(2906002)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkFmN2EvS3gvSHFWNWhSTWJ0WXc3R1ZOQjIxSVZENUdiOFRXZXlYYnpmK21X?=
 =?utf-8?B?WkljZ2xOamVxbFh1U3YvUlRMQm9ZZW93WXlYR29rdmdjYVpHekxJMUdhZWYr?=
 =?utf-8?B?cEhXckJaajhidVErTVN6NjJydlBTK01IYUtQTzc3ZjBnUDR0NjdSS3UxWTRN?=
 =?utf-8?B?ODZxcXZQODJqTFFFK09pbGFJS215RW50OUVOVVByZ2tkdk43Ni94a2VNakRJ?=
 =?utf-8?B?c09ydmFScUdCNVFjU0J3R3ZLMHI1R1ovUlNkeGo0YW1YMFN3aFlOdFVvYzJv?=
 =?utf-8?B?eXdjUGtZaWFHUXdheDIySk5YbklRN0lXTURDTFBsaFZLc0RWQ1RyMWRnYmdH?=
 =?utf-8?B?OXJSUFRGVTF1c3ZxZEhtZEp0Sm9zRDZxalQ0VHRTRWtjNldaajhHZngza1A3?=
 =?utf-8?B?T2JWZ01LcWp4SjdlU0xqYlFVem5DTk9vTzhMbk9rajd2OXNhck54aW1Zc0lT?=
 =?utf-8?B?VWhqdEVqQVh1Nys5UkJ1K2p6UjkrcEVXWTVqbVU3Z2lsUEUxQkgvOGc1SHZ5?=
 =?utf-8?B?N3h5Z25WU1k0aCs1K096TzAvTU4zR0dBdFpKbjk1ZnRIOU52QnI3a25tU2pD?=
 =?utf-8?B?a2FoYkt3bzlBakZKOElDbzBEVitmWWdKbmZkL3JTY1QzS2EvdW9TdTlVallZ?=
 =?utf-8?B?eG42ZHEwMkUyZFVRdkNuSkthMnNEQjhoTlFJc2grcnNZQlo1YUdBbnZ2dm5Q?=
 =?utf-8?B?VXFYZ3dmeHFXeXBOdyt6WGt0TnN4eDUwQXBkRnIzRFBiYlVwSzlXT2RGMmQ5?=
 =?utf-8?B?UE9hbWRCeG1PeW52QnNDeHQxSkpGZEd0eDkxSU1HSzFpUUZjb1pua3ZodlBm?=
 =?utf-8?B?S2l3UnJPOHRTNmc3RDYyMzFndVJiVFRJTkNoQ3RIdkp0NTJEVm45K3hyQ1pq?=
 =?utf-8?B?VkVCdXBBVS9qUk8xaFdUem9TT1ZTd24zZHV5cmN3S0FMdXdRb2dHbGo5a0Yv?=
 =?utf-8?B?UkRBUFdFNnorMzZvSXNGOFdIekpDbVlEYi92Nlg4dGpGd1E5cFNROFZxQ2Jm?=
 =?utf-8?B?Nmt3OHpzRUxEakU3WUlzZml5ZHFQZ2JsVzR3MDdERFZ1M0c0WTFyeHJTM1ZH?=
 =?utf-8?B?Q1dPc0FxT0ZQbW55K2xIU3JrRUpIMFJFWlA5U05UdnIvTzhMdlRxbmpGeWVz?=
 =?utf-8?B?eTRkRzIwV28yTlNYQ25QelVzZnhGU0x3Mk5HdGZCK1lGS3lNOHpTMW9ON0h6?=
 =?utf-8?B?cmt6Tm8ySUczYWdac2NZdStuZktEYnRPczV4dzU1cjdlMUZBM0I3dlAzMTIx?=
 =?utf-8?B?U2tZTjR4bTYyRlU1dGY3UWRRRXF4RlhZc3VZelJrR3k3dHFMYTB3T2ppcnhI?=
 =?utf-8?B?QXJPSmxFRENhS3l1cnZ3aXl6RVBadWVacDNUTm1qdkhOZ1FWQUZRYXRBMlp1?=
 =?utf-8?B?VmQ1TW1xU2ZMdUM3QmRvaFBpa1pxTWhNRm9JQmtQYkVNdnBvZGpCWWk4UTZJ?=
 =?utf-8?B?akpxNVF6UWgzMk9kd3cxTDRmNmM0NHZYVmsxQldMQnR1bW9qZWc4cDBxcWRW?=
 =?utf-8?B?UjErMDE2MnRNaGVjZVFPY0hTVjB0Y3J1bkNYai8yM3BLN1NTVk9NNEs5YjRE?=
 =?utf-8?B?NVo3T3BEbmpNZG5ZZ1JqTzRjS0RkKzcvTlBUNjlCaUJ0dVlIVU1KMHVybGVC?=
 =?utf-8?B?S3BVbzY1VnRqaVNCTXNxc240b2NhRitPM0JNc3FzNjhxY1k3SHM1UG0xUVdK?=
 =?utf-8?B?a2tnM2w3WU42NTJ4NjNWQ0lNUyt3TWxwcnl5cFZHSll0cFN2K3RUNSs5dVpG?=
 =?utf-8?B?VkF4aFhWOTVZVjhaODl5NURjZUswV2E5Zy9rSnc4eDdUVVZWT2N1dlhsMGF2?=
 =?utf-8?B?QVltaERFQWQ1ajlHeG9NaG9RY25rQjc5L2NJcXI5V3ZpK1RsMHNGbzhYMG93?=
 =?utf-8?B?ang4WkhRMjNEVEg3d0tjSUlNKzZadFVkdHdyR0NFMWU3RE5UYkJ3a3FNRG1J?=
 =?utf-8?B?L0NITXd4dkFLM0pqMXM2MmhpR042RXJZVkRsRmdDbDhPODVSMjFXUlZhK0xY?=
 =?utf-8?B?Zk9TWXZsdjFqVnY3U3dzUStid1ZJUk1RVlFSWW1hRU1iQ29LME9QS1NCUHlO?=
 =?utf-8?B?UGRWNGI0Y25oZmUxK2ZETWR5a2tFQUVLWS9yblgwcEFRWkx6YTlQbG9iRzkv?=
 =?utf-8?Q?mM6YsRs2VVWCIPDbCp2X9yOjV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcd722d-9453-4810-c8ce-08da655edb7f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 06:05:31.1981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UufLYRvyTW9oIvloZo3QcKJ2yaq4GgxfHPdVp80Q7zqUTuDvYfysAlH61q6lFosEfl7EqF/+Px8OSR0yuHnzdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8347

On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
> +struct xue {
> +    struct xue_dbc_reg *dbc_reg;
> +    struct xue_dbc_ctx *dbc_ctx;
> +    struct xue_erst_segment *dbc_erst;
> +    struct xue_trb_ring dbc_ering;
> +    struct xue_trb_ring dbc_oring;
> +    struct xue_trb_ring dbc_iring;
> +    struct xue_work_ring dbc_owork;
> +    char *dbc_str;
> +
> +    pci_sbdf_t sbdf;
> +    uint64_t xhc_mmio_phys;
> +    uint64_t xhc_mmio_size;
> +    uint64_t xhc_dbc_offset;

One more observation: None of these four field look to be needed.
They're all used only in a single function, so could be local
variables there (and xhc_dbc_offset is only ever written, so
could be dropped altogether).

Jan

