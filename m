Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EDA49E3D4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 14:48:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261481.452810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD57w-0003w7-JA; Thu, 27 Jan 2022 13:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261481.452810; Thu, 27 Jan 2022 13:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD57w-0003sd-Fm; Thu, 27 Jan 2022 13:47:52 +0000
Received: by outflank-mailman (input) for mailman id 261481;
 Thu, 27 Jan 2022 13:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD57u-0003sX-To
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 13:47:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aebe40a7-7f77-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 14:47:35 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-i_LZgdhpPWCwDPQj48tvhg-2; Thu, 27 Jan 2022 14:47:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PR3PR04MB7322.eurprd04.prod.outlook.com (2603:10a6:102:8e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 13:47:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 13:47:46 +0000
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
X-Inumbo-ID: aebe40a7-7f77-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643291269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQYWCRAkXu0eUBODgJtaz5stVxp/6sBRE4yTBikJc8o=;
	b=YjEHEJOd962jkeHXytrrN2/YFYSw5Q/nfMvGibm7TyzmkehhDhAZ2kSpoBtQ1//mbWo/dQ
	tGPY7OZQm3Nf5yNliiGNayd6Kym6F1m1/w/22KGVUGXBRLucoIS1gHbpGGQ3u9qlAP3hac
	UZdxvnmYucHO9RSdYnQvm87Cvg/KvWw=
X-MC-Unique: i_LZgdhpPWCwDPQj48tvhg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrLPpDRdgJar0XTDMmhut+97ZIuC4vP0ypXfQiaYOb51A/JSKmDMII/KMJuSD4oYt0uyyExANtSz8V15d1RSA6RJ8pcgPE/wyy4BRTK22kLRBC4/3urCtz0N9Epbbbaq5OA1vZBgsstf1xOJGGV6bnReLIg/wujxrzAfu8srz++AcrF9ctGjOiyQZPJ/Q5aZFoErj8DckkZqP/EwSSOQyDYnV0qw4lyno3w6DX6I+0gDQ0S6Q3WZFU+C40tvBDD8jFABQJnYmrT0jU/F+cyOG8s0BH7hoBqVh6dqNZ85VSdPPKy0tVU8U/GWf6MU3vPuCqfIjmwcu1pTl+6iUIaPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A296S82GnOFGZIwRRMQW9CHBp1hVssunKqLk7bn85Ko=;
 b=bkauZaTKSYPJP5jpZhRLNot+8iaeX3OIySjEfkyxCJGwVD7WTJXbRPUCsKpt8XvLHnjZbgF4ZhXQEld9Le0KO0Vdygx6vyCKsMXuphTClBXgCQxbeBGI4F4T4ed6F4GljWuuzjNVLi74oGXnf6PQ4+WTDQ8uWxZntu/BK13XeuiqsTtAdTLyenNXSbWbxUAiEWw4cSTFVWWkk0XO7yOCY3t6YXi8VZIVSpcKM/2qEks5y2rYoZt/W+fTujySYL4kC8Jh4qv//98pRYSOMZQ+ln0M7gNGtkCGMB/z6U5fKfdfFa34v7ys0nRc15hU3FegORu8yDAxCaIxAYsTZqlCBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a9c11b0-1564-9014-2185-01318a98b334@suse.com>
Date: Thu, 27 Jan 2022 14:47:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 8/8] x86/cpuid: Enable MSR_SPEC_CTRL in SVM guests by
 default
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-9-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220126084452.28975-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0502CA0044.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ff57f4b-5ee5-403a-4cc6-08d9e19b99a3
X-MS-TrafficTypeDiagnostic: PR3PR04MB7322:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB732233B86B2407436F57CEEBB3219@PR3PR04MB7322.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vdjnw59lv7GcWMbE00OJt9zsTiGerZra6QAcN3O0lunH02vJTbgY5r8xNpezmtRKTkuNfq4OyzKj19mx080TxJEQkwss+Dm0TAawSDEDTAcbklTaAHsRPsCdOiGUQw3ZjFnqFf/wdlpbkEy/eFjOFAWzlKq+huI4tw6hhP3zCcLF+GE9F9kCAHTeGACHxdaSMcBrLxa31c/3CYniU5sCV6lSDZeVGfhSW27++v0CrPrLnqsc2Q876ZtekrJ9CMB7uUnw8LtF57irC9CA9E10zgD0VdIZTQOU6yrEFX0H5Kt9Gg5itAnzpSNgIsJTu8+IceMKXdjwm4VC9Z2OGwJww0W4vz3Lj/ON1kFl+AsOUYZZFjUMAMRJk3d6EA3R+HO3bi9rpSa0FLDUGqV5vH7QUGBwuUuYnYqivw4ps6jEmvEIq1URrySPRZpgEKgb2fXq60TolJcg5g0syryDoEZxQqWj8Kzd9U6siuj/vTD18WU+r2cAncoVIcFQ+65hfKxMkEqTL+syvGme2Z6zorSVSfDKo939PwdLy9Ihy5oLfuQ/CKncpLUdEEggT5feUJT+yfQYwtiR0QcR2lLr/EujLik7B8h6/xkPvVtqA4TzUAjLBudYHSARvUKWTT63YwWI7h3wFbvAmHEx56iDpz4nUP1zmZN1b7yEGWACH53MwU41fXzPJ2cJmYIPbInXaHURz3nuIT87zEjcya2Qla/CKbBnwc3nazM4zYmgzOh0M/WSKyHuJrs5huhpKy8LOeK3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(38100700002)(2616005)(26005)(83380400001)(186003)(6512007)(6506007)(53546011)(2906002)(5660300002)(31696002)(36756003)(316002)(8936002)(8676002)(66946007)(66556008)(66476007)(4326008)(86362001)(54906003)(6486002)(508600001)(6916009)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xh/TFp+KbpCLA0DErPtH23AywvSNPPRiJ85RfVF2wANd4rWP05AzaGVvpTbB?=
 =?us-ascii?Q?DyZhnwr39SVWuBfEGAZTx0zkCdXKeIfbPgODPDz+7NyO39Cnj2frkhtXF7Wu?=
 =?us-ascii?Q?vDlRoiRBqjE7/m0lq3MQA7rvI3KvQUJxyntsEfm9KBGMshRRS0JldMixpT99?=
 =?us-ascii?Q?AGumxXJxApqQ/0XSH8R2nTbNg7S0OkxvCCThOfw+oniYCMvZMmI/++1UTDxO?=
 =?us-ascii?Q?qDohhXJY1+Pesr8yv1DWIltlmXyuk52qo/MTE1WPQlzSz52usdVYKOCuqBLy?=
 =?us-ascii?Q?TxDXcc+QjLd3wTntSGeDu9Q7gBzMLsdKooIq3VdiHJgEBuYT2L067gWNI3BF?=
 =?us-ascii?Q?eCI2p+JEs00QOQmpfnx+zvMMBnibOn5a1h6HZJXVxF6Rw2BoSTmXguaEGiKI?=
 =?us-ascii?Q?gJZ36JfUVGzkPzQl15iv/mJYzoUzOPbGXUiCZdtr6j33bAi4UpJ7biTXBNRC?=
 =?us-ascii?Q?IlQrXJagFsMXSi1srpadgoXD02Tbem3CI6wbEB551znkxAztHJHBUmmGXsOb?=
 =?us-ascii?Q?lL6CVYsYxrHGeEf8Uzv+3qt0VJ3bTILrMigaAc2fyVtISFytG1ISt7zh7zuI?=
 =?us-ascii?Q?/mYXCGFspjEkC8Lx8p5DU2PkIyGMNQJ6bFCpzTf3UhKfGeNZ9MzlKFcc8r6Z?=
 =?us-ascii?Q?cE8UnucRqIMi3SoCoJvjq5dUtrujT1CGr5W/djqy6QwhUQfqGbYNqDDTledF?=
 =?us-ascii?Q?CbMdrDR0IENWXfak4sSM/jRTVFf4hJEGc7j39GhTjLsdsEC3Z63ek6RGrp9M?=
 =?us-ascii?Q?284HV5r6Uhf9hOz52mxE/J50iRX4qulzi8L+wo/PJrRr2yWfhvSStkGNyhWM?=
 =?us-ascii?Q?PITej/q7iqY4FbcgsELpXdVmDKO47ug/XdP577/KAfb7jZ0iV9rjNE9c+3xm?=
 =?us-ascii?Q?Lo3meyi13JYyQzE6b1D9x8R4303HaytRL9DWx7f8caC+/crQlpaMnO23Oy6X?=
 =?us-ascii?Q?i/ft8ed1jysEhtDO1ptD5MMHRJZzu6QKBuVZPjuo1Mqfrn8OY4xCkCz1gsCW?=
 =?us-ascii?Q?qafOmiX/2Vmnsc0Dyzoo7mCD4w4RNJyQWM9n+en23KLKV23rD5JOE5DxN+Q6?=
 =?us-ascii?Q?iX5STh70AOgM8eD4vwOzGnCtn/Rqrl4COI/kskC9F6cCqiMqkDk1S/rf+Lg1?=
 =?us-ascii?Q?BbgQ3IIkvuClKI03FlZ6E3m1+aDgVIvmCuxR0c6S0XiwbboTUbk7Ajg+sEZL?=
 =?us-ascii?Q?hcqNgIIvKefzhosCa/5bzKmhSHovDW88PWDJXSgY/fTWyMYS1G4HpcktxqnK?=
 =?us-ascii?Q?xUso01VVSFo0l506cyPOnQiEwWwbc490xICu1R8m0qE1aIUBnhMVgo/9mvcg?=
 =?us-ascii?Q?zTaaB9yX/QBZOjUWITg3m646hSml297peak0lVXTBTzqneuLVpmYY3OS55dG?=
 =?us-ascii?Q?RbP/VmhAgKX+9Uxt3hTAkX1gRevosOBDewIm/SPdMa47e2+ubH2JrmTj2k1w?=
 =?us-ascii?Q?FWZvctEqQHH1LNmIE544Qeen6KSewT4c4nbJBMzUgKNzdwEJf1J7JUTpVBP2?=
 =?us-ascii?Q?cSoLCjm7TnHLBXb4zK4uqbrEXI+zhSfA+320T/NLGwKXpqMto8GC/i8vgvMf?=
 =?us-ascii?Q?rlCJuJHGguw5rVrJgNZSsOhnWVl/iNph4POVL4lHTAhyYZbceQr+WJJixLV7?=
 =?us-ascii?Q?2jdXXFldzXFlqhVoCkM9v/k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff57f4b-5ee5-403a-4cc6-08d9e19b99a3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 13:47:46.5776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGeEMbkesvhkyFWbkKr40crTWjf2rhgKnUREi9oOM0JcSJVYUc/J2iblthhs2KVngSZ6/E++rNY0z0oDYhpMzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7322

On 26.01.2022 09:44, Andrew Cooper wrote:
> With all other pieces in place, MSR_SPEC_CTRL is fully working for HVM gu=
ests.
>=20
> Update the CPUID derivation logic (both PV and HVM to avoid losing subtle
> changes), and explicitly enable the CPUID bits for HVM guests.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>=20
> Given the adjustment to calculate_pv_max_policy(), we could use 'A' rathe=
r
> than 'S' which would avoid a second same-sized diff to cpufeatureset.h, b=
ut
> it's also a bit misleading to say 'A' when the PV side won't engage at al=
l
> yet.

I agree with using 'S' at this point for most of them. I'm unsure for
SSB_NO, though - there 'A' would seem more appropriate, and afaict it
would then also be visible to PV guests (since you validly don't make
it dependent upon IBRS or anything else). Aiui this could have been
done even ahead of this work of yours.

> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -433,6 +433,8 @@ static void __init guest_common_feature_adjustments(u=
int32_t *fs)
>       */
>      if ( test_bit(X86_FEATURE_IBRSB, fs) )
>          __set_bit(X86_FEATURE_STIBP, fs);
> +    if ( test_bit(X86_FEATURE_IBRS, fs) )
> +        __set_bit(X86_FEATURE_AMD_STIBP, fs);
> =20
>      /*
>       * On hardware which supports IBRS/IBPB, we can offer IBPB independe=
ntly

Following this comment is a cross-vendor adjustment. Shouldn't there
be more of these now? Or has this been a one-off for some reason?

> @@ -456,11 +458,14 @@ static void __init calculate_pv_max_policy(void)
>          pv_featureset[i] &=3D pv_max_featuremask[i];
> =20
>      /*
> -     * If Xen isn't virtualising MSR_SPEC_CTRL for PV guests because of
> -     * administrator choice, hide the feature.
> +     * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functiona=
l
> +     * availability, or admin choice), hide the feature.
> +     */

Unintended replacement of "PV" by "HVM"?

>      if ( !boot_cpu_has(X86_FEATURE_SC_MSR_PV) )
> +    {
>          __clear_bit(X86_FEATURE_IBRSB, pv_featureset);
> +        __clear_bit(X86_FEATURE_IBRS, pv_featureset);
> +    }
> =20
>      guest_common_feature_adjustments(pv_featureset);

What I had done in a local (and incomplete) patch is pass
X86_FEATURE_SC_MSR_{PV,HVM} into guest_common_feature_adjustments()
and do what you extend above (and then again for HVM) centrally
there. (My gen-cpuid.py adjustment was smaller, so there were even
more bits to clear, and hence it became yet more relevant to avoid
doing this in two places.)

> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -290,6 +290,11 @@ def crunch_numbers(state):
> =20
>          # In principle the TSXLDTRK insns could also be considered indep=
endent.
>          RTM: [TSXLDTRK],
> +
> +        # AMD speculative controls
> +        IBRS: [AMD_STIBP, AMD_SSBD, PSFD,
> +               IBRS_ALWAYS, IBRS_FAST, IBRS_SAME_MODE],
> +        AMD_STIBP: [STIBP_ALWAYS],
>      }

Could I talk you into moving this ahead of RTM, such that it sits
next to the related Intel stuff?

Jan


