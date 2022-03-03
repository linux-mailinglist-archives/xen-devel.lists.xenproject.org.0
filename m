Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA9D4CBB04
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282937.481809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiMv-00056b-OR; Thu, 03 Mar 2022 10:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282937.481809; Thu, 03 Mar 2022 10:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiMv-00054I-LE; Thu, 03 Mar 2022 10:07:33 +0000
Received: by outflank-mailman (input) for mailman id 282937;
 Thu, 03 Mar 2022 10:07:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPiMu-00053r-0i
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:07:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcad49c7-9ad9-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:07:30 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-lFUJprtaPsKH9rlJTkrhfg-1; Thu, 03 Mar 2022 11:07:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 10:07:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:07:28 +0000
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
X-Inumbo-ID: bcad49c7-9ad9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646302050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oa6iC2T5QUROEVeYq1WfshK6wYPb0g27s45ej1AfY/A=;
	b=ZKMcAs6C+kx+5r2oWgyiPVpAjySJVM8MYDqlziVb15vF6sY34jZXL/Y2j9dDvNVtS3+JSv
	eRHKb32y0JjWf4+xdqPhmCeRdf1qHjMLqMzdfYcbTYOVih8sDbZiRP+nnXmVYTOgpimc8x
	BcjhEDLzqsaIdzYfFDwSkdqHm4J91Ik=
X-MC-Unique: lFUJprtaPsKH9rlJTkrhfg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwH6BLAHiHFDQYzqP1Gsim6/Z5fIL+pCEF0bNJhQlqBzaaO/Bbjfar/nFwTPaLkiBSCTec20KnF5VB6AWpC3eNVbtliecg2pqqpy+WFgHCtAUp54F6Dnpw/kg6Ti2d+CJOE7QOp3O5/gjbuubDbC5JmkoDykKA5EZm4LQMcTjZWdScgwz+KAUbGKF8yFmT08QFt4NdyXa1HY/Zy6c4gKOtQB974emSO+QjF4mw4NXHelLir027PEDa15s5dLWnjz19FiW9WImbwg82bE7IL1pD92QFUUSKChcVcBPDgw3hu4WO+rcDchbOMdROom6Ol5brfI24/66b+xva3kGyu0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oa6iC2T5QUROEVeYq1WfshK6wYPb0g27s45ej1AfY/A=;
 b=cC+jTSUI30HxG6k1gSUcIJIQK6xfpVcWNMB0RTbWKPcGhjavjDq4StIRZ15lneM+jlhcGW9NDJTC360DjdFt40oNq+i4jK1RvVmQ6I8yL7PlvAK3n0gIlxVXgMJzAnFWHdj2HYpMsS77Mgwz4K6HOKoM3wdlRqmISNiuq8h/MHONzcWfwpirKDjPBmv7aVNfGI91g2FAER1pLGk4CRHjY9RQop9rqapm98jAsEsnwnVYf3Zqfp5Ku5PUkmn8k3U3YoxAwxp04ZaOaEn/WGnOBoCfU3FLyqNi1FA7G40hQaUcYQDOh6Y+5BRB9AnePji6ics1/B2UBa2Yf0MXBPqR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <202440c9-f515-bde5-ea87-ca06a7f11dab@suse.com>
Date: Thu, 3 Mar 2022 11:07:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v3 7/7] xz: fix spelling in comments
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
In-Reply-To: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0010.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: facd8390-c249-4aa3-7189-08d9fcfd9f5d
X-MS-TrafficTypeDiagnostic: DBAPR04MB7256:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB7256FD313BAB9FA233305C49B3049@DBAPR04MB7256.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T4U+Ty+wpnWKIzlvJIg2wkORj31DwH/szd4d7F5nabp4bAlr1YVafPHjZJK1lKV7FcShMeMTq1ZT28pYlVo6rY3YEH6oYSmJXe3JspamdNt5PGX3PcGS5dF0FxHLmDCJjImHwzsMRm7W4MXJcUkNZOGgfXWXCkuowTZuflIPyyT7RGF7zM1By90QTudb1W9jHTnT1gm6SEvSqNaWQDL35Q7q8K5yZZc4YzyXk0700ijgH/XTlT9T98C+oR38tX3+zDG49O6d7/RpHGGNhkxEsC4C/iyH/qIyfNK6F7K/KdSzOc7nzczJAz3DyvpaGv1aESuys1uyyMXyzXCHp3afHowjdfxdQJEk0F84sSpzMGzm+xd8Hdv9Q+xPHZMRpqLTmU1bdTAK7FCZ5jEzqHrhRAINX85oUcwmUhKtVBkotpIsAoX+prFeneuU78Cm5OVCys6tVy0jNJHRrzzGZkw5DMN1XEkHvQh0XqXIUKRzECsIi6kFuqzLeFfVCkLWeQ3K1rFtUSam/B8yDvi8zGpzFNneDoKVNRGcAnimVd3Gg7VSYr5bw2j5GSn1z+OaJCzszCgbs2itlQPiyp2ZO6XmWM2MLP/ms9pa35iS/+S4HYPuCXJdaPArqtFhwVyzZm+oz7OpkC2WYiC93qCe/U5ooMjWhpVDj84AKbhFUf//8M3kW0xrvhaJ0lKuGY4z+ZUxsqBPfcysq8iZ/qlc1wsPNkyGEkf3l5ADpnLD1CFQzxu0hD59dQNKEAFFI0PcBYZhkaP6uovN0ZibZ7RYczAefAp/l4N5vsRqO5I2R+zREum2Ez6qLuGP5DVEYdqDZ+Wd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(5660300002)(26005)(8936002)(508600001)(54906003)(6512007)(6916009)(38100700002)(6506007)(6666004)(966005)(6486002)(86362001)(2616005)(66556008)(31696002)(4326008)(66476007)(8676002)(316002)(31686004)(2906002)(36756003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHRxOGR1RWtqQUhuYmhka3Q5cHduam1IU0ZwUjVmZHMrOFVxcWtNT2k5djF4?=
 =?utf-8?B?N2ZFdzR0TGZCZmo2VlNrNmJwekpXajVnMmRkaW1GdTlUYnJsTTM3eGduYVRi?=
 =?utf-8?B?UXJYcktFcFNZdEd2M1k5UW5YY09pcm93a2lnR283NzdvQXE5Rll6R0lxRHlF?=
 =?utf-8?B?V3R6MmZSTkJ5TDY0bDF6QS9ieCs5RmI1YVdONmpRTFdsZ0lTNnE1dEk0RmZD?=
 =?utf-8?B?V2F4WU1leHozMDgveUp0Znc5Y1VHZ3RwMTdPay9lVmZRSkpqQmhxQWREMlgz?=
 =?utf-8?B?WlVTS1RuZEhRNFY1bXk4cnRZVUlUM0NmQ0taUWpYVGVaUmcvV2QvWFhQT2JC?=
 =?utf-8?B?WCtmYmlsVi9IU3hpdmsyeXdBbkRxRm9sLzF2aTl0UDhJTGxZVitkbGtHRkNX?=
 =?utf-8?B?emp4RzlveXVOSFVVWWRDMzBqWmRwVGJJQUxUVmNJb0hYZ1l0YWh3eGsrcGtU?=
 =?utf-8?B?ZnRnN3pjVlZ5S1VZOVg1L2U4Qm56SXFlKzRrMW5GODB3RGg1S3lhb0xxY08r?=
 =?utf-8?B?QSt0bHYyaEVXSDcyZG0vR21VeUJoTElkT1RiTnV4NlBKRlJRK1dVZGlpS3lp?=
 =?utf-8?B?YVZ2VWd0alA2dEF0QmlSR2xFejFlTXM3UFJab05BY1NEQzF6OEJ4amhnVVJG?=
 =?utf-8?B?Um9PWGxRc0V0MHVhd2E4S1E2UnlFTnpQeWt3WGVFNHNQOUx2WXFBTU56SWF1?=
 =?utf-8?B?NDl5Mlk0TzJpMFIvak1QVURaOWgwNUZoSG91YzFDWlNSbXpRUW5HZFZEOG9N?=
 =?utf-8?B?MDJ5dXVTVXRaaDN6Y1R4WHl4andCSDdOQlNLWll0dk54by82czNDcXU0YXds?=
 =?utf-8?B?bDRNSXFrUUpta2txRVQrT1d1Y1RQd3pLZEp2Q2dFTThWdUh4aXBhNGhhcjlG?=
 =?utf-8?B?RlluN2ZpdjJYa1dnMk9sYzZPMjJaa3lSM1ZFVjdDWlRwZFE2MElpUUsxR3NP?=
 =?utf-8?B?YllqNnloSTdEblFOWjgvenM1TXBIWm9QY2I2aGxPS3F4RDRMc0dSaFA1eUJT?=
 =?utf-8?B?UWxCZGJuVFRSWHc3Vytjd2lNQnpVVnNjaFJTbDhqRkFSSVZSNEdaQ2JQWWdo?=
 =?utf-8?B?RUloNHE4TjZFbVFFY3BIa3c5dlpGYVdMYmhoNlUyWlRyTEJJMHorU0hwUHZQ?=
 =?utf-8?B?a2d2Y003cDZERkVDZ1FDb0ZhRXhkVWtLS3BjMy9XM2VDVUdjRndCM1IxNTg0?=
 =?utf-8?B?bTVFVkwwZ044U1hQdU1PZlM5NER4OWZrNldJekhxMXFyVndnUk5nc3B3WFFO?=
 =?utf-8?B?MVhYSk1BbFZQU1pud0Z2TDY4ekpPY3lmWjF1enYyczlQNE1aYk9KTnpJWnRk?=
 =?utf-8?B?M3F3bEtCeGR0cmdPYmJjemk0SWJWNEJPWVBSWEl0b3hXRmp0aEkyQmVRL3NZ?=
 =?utf-8?B?V1JnNmFqTHJtN0ZFZ3pqYlBXL0wxeW5LR25pSFh6VVZzVFdzRisrS1kxVG44?=
 =?utf-8?B?aE5MVU81YmREaXNQWThhNlVGT2tvcVFyWEMzdDBCaTQ2bWxhNFVvbVU4YkE1?=
 =?utf-8?B?U2FHOVVCQlpNVnlLbDhGbEttYUs0R3RTWjdqVVpWTDhoNFdOWDFIN1JSMmE2?=
 =?utf-8?B?bGlNZG0xdVhTQzZPeHNEaXdxNVdFZEQ0OXJPYTRoV0NSSFQrckgyS1lDbVl0?=
 =?utf-8?B?UmxWT2YyNVlXclRHR0p0VytIbUNnSXZ6ODl6eGVxMVlscjhGM3JRRDRBVG1u?=
 =?utf-8?B?ZU45MkJSeVo2azZPK2hKL2ljZ3lHZHdEZlhDcUNPUktQZ2RpM0pNVnlkWFlF?=
 =?utf-8?B?SWRCdzlQaWJoangzR1NJMW9CU0l3dFV0dWdGclMzcXU2cUVZWjVSZmNWZThN?=
 =?utf-8?B?RjRsRG9nRURQbkYzVHErZnoydmRKdHIyc20wWGF5dWN6WjYxaDhQZ29GWE4z?=
 =?utf-8?B?bll5WkcwYm5Va2NNTE01ZndNRUd1VlpBWHVMRWhDRytVYUtwK2JiaUx6aWhP?=
 =?utf-8?B?bUtFdzlsSVBoSmtzaXQ4bE5pZXE3aDdvRTBEdUMwWEtQaTlNaE8zWTRhOHMx?=
 =?utf-8?B?cDBJdysvN2EvdHF5R3F5MUtwS0Nvbis5SEtvME1yQTVDWFRFTncxWnhtRlA5?=
 =?utf-8?B?VjB4NSs1ajcweWlSNUxIN0xxR1JtT0NqUVBGRm5rRS9WcHJBWmlHN21UM1Jh?=
 =?utf-8?B?M3A0bytXbWNqclQ2QW5iL1FrQnZLaTFNYjBoeElBcEpHQkxqWjE1UlM4VFQv?=
 =?utf-8?Q?rtdbDdMKfgpAzf6ZhXAm7Qc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facd8390-c249-4aa3-7189-08d9fcfd9f5d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:07:28.1356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azu/V+EkVKUi1oXpLJU16o44iV4V7mvqZLwdCiGKvbrvsWAWsIsybObzyHwNV3pOliMTU/b8vyWz2CE9jnR8+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256

From: Lasse Collin <lasse.collin@tukaani.org>

uncompressible -> incompressible
non-splitted -> non-split

Link: https://lore.kernel.org/r/20211010213145.17462-6-xiang@kernel.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
[Linux commit: 0a434e0a2c9f4395e4560aac22677ef25ab4afd9]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2: Retain one more S-o-b.

--- a/xen/common/unxz.c
+++ b/xen/common/unxz.c
@@ -20,8 +20,8 @@
  *
  * The worst case for in-place decompression is that the beginning of
  * the file is compressed extremely well, and the rest of the file is
- * uncompressible. Thus, we must look for worst-case expansion when the
- * compressor is encoding uncompressible data.
+ * incompressible. Thus, we must look for worst-case expansion when the
+ * compressor is encoding incompressible data.
  *
  * The structure of the .xz file in case of a compressed kernel is as follows.
  * Sizes (as bytes) of the fields are in parenthesis.
@@ -58,7 +58,7 @@
  * uncompressed size of the payload is in practice never less than the
  * payload size itself. The LZMA2 format would allow uncompressed size
  * to be less than the payload size, but no sane compressor creates such
- * files. LZMA2 supports storing uncompressible data in uncompressed form,
+ * files. LZMA2 supports storing incompressible data in uncompressed form,
  * so there's never a need to create payloads whose uncompressed size is
  * smaller than the compressed size.
  *
@@ -127,8 +127,8 @@
  * memeq and memzero are not used much and any remotely sane implementation
  * is fast enough. memcpy/memmove speed matters in multi-call mode, but
  * the kernel image is decompressed in single-call mode, in which only
- * memmove speed can matter and only if there is a lot of uncompressible data
- * (LZMA2 stores uncompressible chunks in uncompressed form). Thus, the
+ * memmove speed can matter and only if there is a lot of incompressible data
+ * (LZMA2 stores incompressible chunks in uncompressed form). Thus, the
  * functions below should just be kept small; it's probably not worth
  * optimizing for speed.
  */
--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -505,7 +505,7 @@ static always_inline void rc_normalize(s
  * functions so that the compiler is supposed to be able to more easily avoid
  * an extra branch. In this particular version of the LZMA decoder, this
  * doesn't seem to be a good idea (tested with GCC 3.3.6, 3.4.6, and 4.3.3
- * on x86). Using a non-splitted version results in nicer looking code too.
+ * on x86). Using a non-split version results in nicer looking code too.
  *
  * NOTE: This must return an int. Do not make it return a bool or the speed
  * of the code generated by GCC 3.x decreases 10-15 %. (GCC 4.3 doesn't care,


