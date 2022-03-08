Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD204D1AB8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:38:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287012.486776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRayF-0005X6-TX; Tue, 08 Mar 2022 14:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287012.486776; Tue, 08 Mar 2022 14:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRayF-0005VH-Pk; Tue, 08 Mar 2022 14:37:51 +0000
Received: by outflank-mailman (input) for mailman id 287012;
 Tue, 08 Mar 2022 14:37:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRayE-0005VB-LZ
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:37:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53bf3612-9eed-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 15:37:49 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-TLiBp7roPcaLgiXu49K6PQ-1; Tue, 08 Mar 2022 15:37:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB9094.eurprd04.prod.outlook.com (2603:10a6:20b:445::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 14:37:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 14:37:40 +0000
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
X-Inumbo-ID: 53bf3612-9eed-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646750269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmIB820mIJkMQVcBkt4Q3e7hNuolTUsMcT6sxtleA0w=;
	b=OOtGV5XYfm6aETb1sm8jI8wq30ueusQeLyvRdBUTkYv4DB3d4x3hkSea6YEyUR8eHapoVn
	1ph66jMyg5Miy5b5N3oSkA5c8cjXtDLzBlChsb19ERiFePoZ4ucy1H27yXnF+X/TuYThUQ
	VmnuRB2DfIlUFZOokdYaB9C6Yyi1fKU=
X-MC-Unique: TLiBp7roPcaLgiXu49K6PQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cv9c7JF2wQlSX67PMnTvp18LGuSxuiBU1EDO76K/VeF2+nS/XSGcMSUkPyOgQJEMpXgC5krQ4NsPAowuKHrv5bnZ4Ip6Zno9m78DxfCjg+3vXm15FhoZcGNV6fSvFJdxN3DBjxeE5l6GdcG+qE+wgHos4ObW0VJsIu8Ee96In7OfGwO4Xiv3dnYBrWiBE9pOG3O9t32d3UWCXaMzJXYNuOSiTd9rTDUPz+8aPts3gcxKLz8cl4RjSoOgFplyQgSVN5uXQjAiLi5h071GcghIj8Ts/cBJNv/xZxMIe6VRtIIJ0IqN3JqOVtHm8R51z7qUdxUbMkDeEW2+jen9Oye8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYoeYTUrEsfdZN8EWGkJp4LDTrT0YyJ7/wR7cBQ7f5I=;
 b=iFD4Y2Vt5/9WnnL3+YXwvyzCXijeHcrc6LmLMoO5uxNJXP4i88HdCSTgw6DCxhWse2O9ruFJ6PBf50i/7pHG2X1pw4435hR1hISB8sq6slhokqshlhjAL4ccaKzCLabhizdFxSG8T9SPxYZaZ8nYnAxGFhRZzRvaCSdpb3wgKk2Fc7KAbGTBwWgEggZMBO0feMWR+dgBX3vg26UTz2vm8ViTR1/UwQdSJPG+HpS0ts251haf4Lrc1WNFy5p3spXljwfUpf/S75WrWSBdLPSOdJnUW2clueXvrk9vnE5zDDixJF5jxYpgpFR1r8myG1ZJWNUaKWOkY+TZe2ErPKuCWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18fb4115-94d8-16c2-e39b-1be895e254f4@suse.com>
Date: Tue, 8 Mar 2022 15:37:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Bjoern Doebel <doebel@amazon.de>,
 Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220308140126.8815-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220308140126.8815-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR05CA0027.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d204083-8cfb-4125-402a-08da011132ea
X-MS-TrafficTypeDiagnostic: AS8PR04MB9094:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB90945164530C9F36DF7184F7B3099@AS8PR04MB9094.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	21dSoftlOsZhvMXt3rg1Rm2ciVnaBOGhHfIVW+qiVVykaG8G0+mHEceM4IhsZKIkZ5rWMDosDvMJslysK3al+JLWSiWm6XyIcpfwQhtDEHten9CGBlxqXuu9mS6ueA2HzR8mukNC/ED2FrNCpFsd77Eetu4rhY3ZP8Nmm74v2mvhcamNgnvmapbUKEHF+6JfPUd4lqElGKFjmc/5pi/SVGKkK3WmBnp5sY9cCZ85If2M78CdLe6mj59sNy+PD2WZcc9ClyJl0fK9xEIYiAMOmWiG81ZWAWmBV5YH6IKvbdD5TNxcMlKMvMrqcl3yGpn0xdrvVnO6wudcQ8RMR9eaSVL1BTDVYPO6SLL+q/rjReR6XhGz65CBBLnxTe7EDmLZTeaXshjfK8UF7GHaEffPBvmF8M0AoNjnM49UMwTQsPjQnaxfbhkGrK9Ijfmkr9365AihYF/WR1fW+7I4peWiAfzWhexicL+FYHtACtAhVt/B3CZCh2Xy3OxEI3X/kVhjXCM+GvuzuRIqqAfGm04PTOoTLtaZAVZKCDdtlHnfWMx3ZeJL9mPJWNMuLjozzmv02drcg69C53CNKOQpAAOYXXPTvgeywXeRimvxqXhwC59MzmR9Zow7tHvcCWAq2R8lbuv2cIMYE7F31ohYQfu7efML8fJaG5q0OSAL3PcVa8Dkpe8l+5GSgCyo0NtY1Y1G6hVRE4upm/lWB+sAVfXZVPN6qfvGp7YA1m/eeVJS0mI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6486002)(86362001)(31696002)(38100700002)(2906002)(316002)(54906003)(6916009)(508600001)(5660300002)(8676002)(31686004)(66556008)(66476007)(4326008)(66946007)(6506007)(6512007)(36756003)(83380400001)(53546011)(186003)(26005)(2616005)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vCoMPziSL1b3d4jHwrgKxtrTruW3C9tn1945hg5JrsyfeaJh/EnjHDYRysgB?=
 =?us-ascii?Q?DnVyGNcqREOFJBp40r2e0Fq5KAenCkvCoHPiE09J3qhbdLoCgxReOzjaI6zW?=
 =?us-ascii?Q?Nu5cXtl/Q31/Yf0z3Tf4A1lv/eRBep9puZFFBiySyowjcVG6kJkz4PdQjLYO?=
 =?us-ascii?Q?B/qDhAdMpi+rz6UExRnDiFfNtv3PNq1SfxV8OHX4Ym7cwEXB3ej+/HvmqBtL?=
 =?us-ascii?Q?/Z0Y0+PhHpO2/HryG8zGArMGOgM0OXUgBDOsnBCzEpFGTMmr2ygCGESoA8lZ?=
 =?us-ascii?Q?KPcfBdfMbLBkrGCi2YMFNVMsbF7djPd4xtN/DKK5xtnyHuTAdZr3ZcOlHN9i?=
 =?us-ascii?Q?i6fzeRII2kfFlxFjeoHg0rvwfTtNCap9fQjLok+DVqYze4LGT6ui7h9xo/LC?=
 =?us-ascii?Q?ppSP5vl+sU/9G64HJd14GjNE6hJx31bLLzQA68iLXFxckqyXN/+VS/e2Vttr?=
 =?us-ascii?Q?bPYjnvjn17FOaqj1RzVUuq5EvARKkCT9MToA5z427lGDFskIBSQM0k01R79f?=
 =?us-ascii?Q?C+Hym4WIZv0LCrO1wg1mHCY4/PI928NCq18p3ZgqvjH2QBKhiBhzawtny6fk?=
 =?us-ascii?Q?OhVkyoQIBjgkexwGgyG4qon5GMgcKobP6g5nmgs7OAW9Ym9JL6uSRyeZTiXs?=
 =?us-ascii?Q?gMuFkM21D8ezm7G2f4K5f75qnj3oBmfCfQW4APqhq0B64vySQ5HRml9tJMBk?=
 =?us-ascii?Q?NK9HXqDcXge+whQFB1mWqGTblhn1nb3G+9ebuH68ZjdPeHRt2YpiOsp/cjt+?=
 =?us-ascii?Q?syY5yBzzg8/k2M7O36FoLaPEKYKKvhgmvE862EUkaP6e/380+ip+nG/OPZMg?=
 =?us-ascii?Q?XslNdYIBjBsCnemPZm78yxAIKXNTSptdzDkng4OXP36nYJtSIkpJFOR02C7F?=
 =?us-ascii?Q?zBSY51P14rGoIJ2JgCyAyqy8iqkgLFRRi5TPk2enIMUW5RAt4GXt7Hu0WQGv?=
 =?us-ascii?Q?OwcIqVqnW4a9sk7thBuUEShkXeA3OQv3PJOEnMbh2evkjyxMoWPCm5yS2sHC?=
 =?us-ascii?Q?GjSU9IXeq+is4rAeDOmpML+24lV2fwqzVYxpfBTVmucsXSvzeNwBGy1IAYKX?=
 =?us-ascii?Q?sHsTJCzF8qrzwSU81V4mhGe6O1N4WVT2yQMfOSP1KeJuVA+cEVjOIb+hCFiU?=
 =?us-ascii?Q?UVw5rPgozuFjOb3tPGN0fF1McknsnvjLRpqPWW09b7LRiXtTFNiFgh0Fn8Ih?=
 =?us-ascii?Q?CPZ/USDG8rKmUIyB2D9GaedT2jNo48Ok4loi15eaiKrXlxDzpYu68SH3G1BD?=
 =?us-ascii?Q?QqeluU8odysKfhu9XhhRNONHilBQCm+J5COSGBicggQoW+EKRy+u6vwPoxYh?=
 =?us-ascii?Q?s8kb1SqIWLjna8d9kycZD2OriMO+42jMPj7cu3HF+P0IGSylknR7uAAEWYUd?=
 =?us-ascii?Q?TfpI3NBT7SvynFf4xk8sRU32ThaFaGqRWE1a8Jq9eqGm4pYDtBj1qFNZBFB1?=
 =?us-ascii?Q?TWkDgtxPQqvuJzUG5/DfYOkPae9YM550Xs2S77MGbGuJsMTl75PZiYixn2/X?=
 =?us-ascii?Q?QGlobswfLm5PuvRvS5VRXk/wduV8Da40p3eKNKo0JE3E5eMueZh6sP2vExPO?=
 =?us-ascii?Q?lasiwwN+4Zi5BAnlBfyuBqIbLQUcqRUQ/7iyJNqF8E7rQ8/FLVg4i6s292DO?=
 =?us-ascii?Q?XoxchNBp1G69dSDHx+2iaZU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d204083-8cfb-4125-402a-08da011132ea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 14:37:40.7880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGeN5T05oSZj+O91H1o+8sLf588Aluc2VSZ8PO8rlELBjFId9FCDsI8tqVEKLOHyWnXktrfUPizL4Bsy7guZGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9094

On 08.03.2022 15:01, Andrew Cooper wrote:
> For livepatching, we need to look at a potentially clobbered function and
> determine whether it used to have an ENDBR64 instruction.
>=20
> Use a non-default 4-byte P6 long nop, not emitted by toolchains, and intr=
oduce
> the was_endbr64() predicate.

Did you consider using ENDBR32 for this purpose? I'm worried that
the pattern you picked is still too close to what might be used
(down the road) by a tool chain. If ENDBR32 isn't suitable for
some reason, how about "nop %sp" or "nopw (%rsp)" (and then maybe
even "data16" substituted by rex, cs, ds, es, or ss)?

One neat thing about ENDBR32 would be that you wouldn't even
need memcpy() - you'd merely flip the low main opcode bit.

> Bjoern: For the livepatching code, I think you want:
>=20
>   if ( is_endbr64(...) || was_endbr64(...) )
>       needed +=3D ENDBR64_LEN;

Looks like I didn't fully understand the problem then from your
initial description. The adjustment here (and the one needed in
Bj=C3=B6rn's patch) is to compensate for the advancing of the
targets of altcalls past the ENDBR?

> --- a/xen/arch/x86/include/asm/endbr.h
> +++ b/xen/arch/x86/include/asm/endbr.h
> @@ -52,4 +52,16 @@ static inline void place_endbr64(void *ptr)
>      *(uint32_t *)ptr =3D gen_endbr64();
>  }
> =20
> +/*
> + * After clobbering ENDBR64, we may need to confirm that the site used t=
o
> + * contain an ENDBR64 instruction.  Use an encoding which isn't the defa=
ult
> + * P6_NOP4.
> + */
> +#define ENDBR64_POISON "\x66\x0f\x1f\x00" /* osp nopl (%rax) */

In case this remains as is - did you mean "opsz" instead of "osp"?
But this really is "nopw (%rax)" anyway.

Jan


