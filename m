Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A2E494FBF
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 15:02:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259071.446815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAY17-0006Eb-DR; Thu, 20 Jan 2022 14:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259071.446815; Thu, 20 Jan 2022 14:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAY17-0006B8-AC; Thu, 20 Jan 2022 14:02:21 +0000
Received: by outflank-mailman (input) for mailman id 259071;
 Thu, 20 Jan 2022 14:02:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAY15-0005h6-SX
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 14:02:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94a19109-79f9-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 15:02:19 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-6OTQ2TJyMLO0E_q5aSKY6A-1; Thu, 20 Jan 2022 15:02:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 14:02:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 14:02:16 +0000
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
X-Inumbo-ID: 94a19109-79f9-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642687338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ERHBkt0ZLZoh+unVkYGz4LgaW/QtEiIYQdXID6w202Y=;
	b=bBg3DlgSPxV21OpqcUekAdxCbE0Bo/nJcDHeoDW9BaYS+jYcgjVsCaFvK2XPpnjgysuRS5
	NeOMeCDI8C5LwpYy36DPoxy3itDH0rCk8FD88i+11uBXNtO8UCcMeDVPevWTIxToqoy5lL
	WinD2m94CTtnMF4bUR30S9RFbbuhTfo=
X-MC-Unique: 6OTQ2TJyMLO0E_q5aSKY6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhqqiMfKMvP5JEbddtHnMpKpi7u7yULYVdr6pRptnTLqsPpQ9tmU2cOVs6uFOrk4vKOSQ2uOw40kPgB2sASGmXc846UPbAjB4mMCWIzJqPQ4+hjD6mCfH1o3l5QiSH92Ht8VEalPkjEhxHxOFihH5MI1FwGmaYHlGpCSs87dwbMWT+kIU6NilB4cekY9T2FdxKnI21SEfwz46aJvYJYLQMUPlCdWvdh50MzYfbRhDvCm5tBDqIMRWu9QjwdDugvwImDNm907MgevkBX9Rq1gDkUJ3xL9lb5SI8ESkXD+DP4bXHJ9fwawNnW1+Ayg0ppsOO4jSkp/2/LjGcR8JS7yig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIqEnurXfCEWFhZMdoHlOkaoI1CmFSGgajePTq0Qfsw=;
 b=ilrUll0zzybhPXH8f+FlgeD81ONCub+J1hKyjUfmlzPkJjKdwY4/zZZbKVKmFera2/0ntsmFlui2MEKYFbG9OeFRvS/ii/pGKdzNig3m9zgmzozDHVtBf5TazkTEo2b1PHOpjYqPhflU8zWpGh6K+LmshWiX89Y7z7yBJroRaRJiGHFzwVy/g24o89L5rWmigBUUaKyj0RJrWfp0qINdpZXK8XKulNQysGXyB6RrE5ghQdylguD2ccT8yDDsJs9c7eD/JIg4U6c98d8qEO1GquaYRXJbwNLwdcMohJeDhxq9QNPW6yPDtq7gv4ILBr36RC/ZNBPAVLWbJ9gE9uqfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <79cc9a46-15b1-b2ce-e462-7c46848a86fe@suse.com>
Date: Thu, 20 Jan 2022 15:02:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v2 2/5] x86/mwait-idle: switch to using bool
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
In-Reply-To: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04258d86-03f2-4e27-830b-08d9dc1d7754
X-MS-TrafficTypeDiagnostic: DBBPR04MB7643:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7643D4015A522ACCF4C30F72B35A9@DBBPR04MB7643.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5AeZi0jbvQXMoy3WYdM3Q24Xmp50vxqiIwZjVTRmxABz0a8bC56CkpP3c+AOP8mI3cvRX396K8VkAGHomEE4SqWPWViAXS49DVUhH7A4SKVjUntM3L+dIwoZbAUIAfeQFYnPhJa/e40tIWadvTp9ldFdnJUkfhyM6NZ4byawc6HgjPEH/4ckNbRCcNzKtTjGOCeodKU7Rh7KQldqYViyX+Y+rpw5iPwzF4lUdlzsjEgeoMAiaPyhIyRPSn53DruLOn/FANW4hvlQ1VdQXq1J6eP69sbocljTJ4PQ4FcvH7onQSCxVg6F+UyWIdAwavbK5lPXN8St2hVZef54Dy+im9FpXmc1/lzS8Xmu8wssQ2iS+Zlkddkddcky32FMn1QcPagPzIXnO88f6kYEkNqO662i1Vlx5ja0yTNZ4y0cK55vmB2u7otkIMzklPtrTMgiR64bAsVgA9pnJPWiNq9S7QRRkvsUdq2O/gXCWCd4KKPNPGb1CwiESNT2pVv5XVhyYtfrgyMz4dafNzAAxhDvTPi6pI5xlyNGuG8smA5jnRZQD2hH/S3gMAm5nR2YF2Y8S6KnikbpoEgGuU1/vCD+eY8Fy2iR8UiEo2Aa5LqIwIoHQsBRuHc0r+b6sYRUym302oRpSfn7p76vH1zrPZMXnAP1kFL/SpRVld0zAIjMv+1ZK9wfvcGoWuesE2FUrbTLpNHSkOXwm/ar71QFZD3KjS+2F5ng6mYSLqRxHbxx2s2mmOYZj49UkfrJH+9Nu/T8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(31686004)(36756003)(66476007)(508600001)(8676002)(31696002)(8936002)(38100700002)(6486002)(86362001)(186003)(2616005)(83380400001)(6916009)(66556008)(66946007)(316002)(2906002)(5660300002)(26005)(6512007)(54906003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6CkeJo2G72z/dybhkKi2xfPW8ozbariL4IYNDUrAtQzKuzJdZfygPbjKDGAc?=
 =?us-ascii?Q?HmVvKxlxhMSt+j5BhQGTmkX4r57c8072nJey4hxzdmNFznFW0fqKrXTr2A8p?=
 =?us-ascii?Q?Zb3jFYcogZVLsMh6Kpz7KwsuwYZJssidzY80vCcUh4Tz8PM9E0O5omdAJoQB?=
 =?us-ascii?Q?JPdQJWkolTE+/0Xt56zu2abH68a/+X7aa3e8tTuqIhZHpf441GedNiYD42VA?=
 =?us-ascii?Q?KaE/9SRuJj/vLD9SgsbsJutC9zbJthlfrebGWqiuJ5frZsNYAv3jlMAIw6xI?=
 =?us-ascii?Q?OZ+D4p+j/Z9TNQTkrSozqhtl/6kDRWqTbVwtvIospvpXZ7Yn0KFl8blROrDd?=
 =?us-ascii?Q?3X1GjFGaX0byXWT/SKKwtD2djMTFIxm79/UNlDF2oTb90xjsJP74FCCgdGGx?=
 =?us-ascii?Q?Wv17MbrXLrWmjIne+IrYr/YzotuvDEojCMuBWC6ofqNl9AWNah4NZGoEA/23?=
 =?us-ascii?Q?iBj2LVZR4VtcTNfgKii5NlxRQH4Kz0RdYWV+rhmzQ5rVPNbLVuhaVsfBJPn2?=
 =?us-ascii?Q?GKX26etsjPxERUK1m/Lb3M+HT2BIKKYc7sqQ2qOfPsMz7DcFtuxxNMpgP4O8?=
 =?us-ascii?Q?LMn2B6HzpPWaDjfxPTTQHWL87+UnCqDQrXtzhN6xbnJ3mI55BokQuReVmHbE?=
 =?us-ascii?Q?sB1rS4kMOoOFhQyW3ULPBvOJhhxprCBxnFvS+a8f1i2C6j9O9kcq2BmVW6rT?=
 =?us-ascii?Q?T/hBf6bQiECgkoEUT91n04SVUD9ZhfVWneYr204FmrRDfUbFdtKOx9AeEMm9?=
 =?us-ascii?Q?+R4kqsw/VlKrpiirh2JyeHT92WBah1iOSOQvHMVufdal+BNfl8N3uI5Kz5Jr?=
 =?us-ascii?Q?Be4CI/El3uGzk8BAhZVZY2Cr1sEb5ywenEjyCQF3HNCJ+Ra18u+mnH0aL+Cy?=
 =?us-ascii?Q?SzdsVi0BZ+F527pq+MM0L7VcKEMdzx9LlAHfcTYz5Pitly3wuO7ail8ZuYVo?=
 =?us-ascii?Q?PsIXNHw7Emm8081EE7NnWcUEyyRpZy0OtUIEUBJ7SPWZqg6+8cNXw+9kYNA+?=
 =?us-ascii?Q?19duLj3XAY8PcYEm9MJP9SuOUXK5tOlwa4EM9lI3dDbTEKyYUsH5CoFWZZGe?=
 =?us-ascii?Q?UKXbfZcnxHgkyTb43zG+2jr2vCI1xtbSuLxphS6jTKS4/6FYwQicQmKupTt1?=
 =?us-ascii?Q?9hMx4t36Fh/+QJOasJRTiDsdNuCY/7Q6BfDjQiJtQUg2myOFcmhPClqAvHjJ?=
 =?us-ascii?Q?G8PSW5EqXmpr2jdiwFMh64wQTmCtf+ijnguJ/dG8K0QoaEWqHoNsmBy2GhNr?=
 =?us-ascii?Q?0+MOpi/u9x6Mb70iTIL0yUffCTKalE9hHlXgHVqYKRdj5joXrFEBM1aWmKyF?=
 =?us-ascii?Q?V3IQbCE2SopEpEDIiXWJPbWag+HL3fsFEqRHCBvmLVLOycEMHfzdEwvUa4Uq?=
 =?us-ascii?Q?1wKO50sO0o32KoVlQPcJ/rPf56TbiO/sBFMBL8+TLrp3oq5tGv52BIZ62now?=
 =?us-ascii?Q?Vyq4iowj0L2d/75Nz6CEJrNcLze3J+pt/ecpDDMqxlai0FU1nMl9BtO4k2hI?=
 =?us-ascii?Q?cwBEslGPR6yS57kBhjcZ+JKjuJ7cAGy4R8sE6q4trQPJXMJhC+cMbB+BZIt/?=
 =?us-ascii?Q?jXpZoGMETKf38f1+X1raAgOakHaSyC2z17X6WHH6uf/a6vltkiCQA7+owYDc?=
 =?us-ascii?Q?kv0K9X4R6npPthLK5RuHIXs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04258d86-03f2-4e27-830b-08d9dc1d7754
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 14:02:16.5304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVJMlcdzOTwjlBuzGRK0kuM3jDVzhArcNAlftzrcDgHVTGmDj6rD6MUzhbDq2nJVIEtmTxGTTYIg79zzhNW+9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643

When the driver was first ported, we didn't have "bool" yet, so
conversion to bool_t / 0 / 1 was necessary. Undo that conversion, easing
ports of newer changes as well as tidying things up.

Requested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -76,7 +76,7 @@
 # define pr_debug(fmt...)
 #endif
=20
-static __initdata bool_t opt_mwait_idle =3D 1;
+static __initdata bool opt_mwait_idle =3D true;
 boolean_param("mwait-idle", opt_mwait_idle);
=20
 static unsigned int mwait_substates;
@@ -93,8 +93,8 @@ struct idle_cpu {
 	 * Indicate which enable bits to clear here.
 	 */
 	unsigned long auto_demotion_disable_flags;
-	bool_t byt_auto_demotion_disable_flag;
-	bool_t disable_promotion_to_c1e;
+	bool byt_auto_demotion_disable_flag;
+	bool disable_promotion_to_c1e;
 };
=20
 static const struct idle_cpu *icpu;
@@ -867,7 +867,7 @@ static void c1e_promotion_disable(void *
 static const struct idle_cpu idle_cpu_nehalem =3D {
 	.state_table =3D nehalem_cstates,
 	.auto_demotion_disable_flags =3D NHM_C1_AUTO_DEMOTE | NHM_C3_AUTO_DEMOTE,
-	.disable_promotion_to_c1e =3D 1,
+	.disable_promotion_to_c1e =3D true,
 };
=20
 static const struct idle_cpu idle_cpu_atom =3D {
@@ -885,59 +885,59 @@ static const struct idle_cpu idle_cpu_li
=20
 static const struct idle_cpu idle_cpu_snb =3D {
 	.state_table =3D snb_cstates,
-	.disable_promotion_to_c1e =3D 1,
+	.disable_promotion_to_c1e =3D true,
 };
=20
 static const struct idle_cpu idle_cpu_byt =3D {
 	.state_table =3D byt_cstates,
-	.disable_promotion_to_c1e =3D 1,
-	.byt_auto_demotion_disable_flag =3D 1,
+	.disable_promotion_to_c1e =3D true,
+	.byt_auto_demotion_disable_flag =3D true,
 };
=20
 static const struct idle_cpu idle_cpu_cht =3D {
 	.state_table =3D cht_cstates,
-	.disable_promotion_to_c1e =3D 1,
-	.byt_auto_demotion_disable_flag =3D 1,
+	.disable_promotion_to_c1e =3D true,
+	.byt_auto_demotion_disable_flag =3D true,
 };
=20
 static const struct idle_cpu idle_cpu_ivb =3D {
 	.state_table =3D ivb_cstates,
-	.disable_promotion_to_c1e =3D 1,
+	.disable_promotion_to_c1e =3D true,
 };
=20
 static const struct idle_cpu idle_cpu_ivt =3D {
 	.state_table =3D ivt_cstates,
-	.disable_promotion_to_c1e =3D 1,
+	.disable_promotion_to_c1e =3D true,
 };
=20
 static const struct idle_cpu idle_cpu_hsw =3D {
 	.state_table =3D hsw_cstates,
-	.disable_promotion_to_c1e =3D 1,
+	.disable_promotion_to_c1e =3D true,
 };
=20
 static const struct idle_cpu idle_cpu_bdw =3D {
 	.state_table =3D bdw_cstates,
-	.disable_promotion_to_c1e =3D 1,
+	.disable_promotion_to_c1e =3D true,
 };
=20
 static const struct idle_cpu idle_cpu_skl =3D {
 	.state_table =3D skl_cstates,
-	.disable_promotion_to_c1e =3D 1,
+	.disable_promotion_to_c1e =3D true,
 };
=20
 static const struct idle_cpu idle_cpu_skx =3D {
 	.state_table =3D skx_cstates,
-	.disable_promotion_to_c1e =3D 1,
+	.disable_promotion_to_c1e =3D true,
 };
=20
 static const struct idle_cpu idle_cpu_icx =3D {
        .state_table =3D icx_cstates,
-       .disable_promotion_to_c1e =3D 1,
+       .disable_promotion_to_c1e =3D true,
 };
=20
 static const struct idle_cpu idle_cpu_avn =3D {
 	.state_table =3D avn_cstates,
-	.disable_promotion_to_c1e =3D 1,
+	.disable_promotion_to_c1e =3D true,
 };
=20
 static const struct idle_cpu idle_cpu_knl =3D {
@@ -946,12 +946,12 @@ static const struct idle_cpu idle_cpu_kn
=20
 static const struct idle_cpu idle_cpu_bxt =3D {
 	.state_table =3D bxt_cstates,
-	.disable_promotion_to_c1e =3D 1,
+	.disable_promotion_to_c1e =3D true,
 };
=20
 static const struct idle_cpu idle_cpu_dnv =3D {
 	.state_table =3D dnv_cstates,
-	.disable_promotion_to_c1e =3D 1,
+	.disable_promotion_to_c1e =3D true,
 };
=20
 #define ICPU(model, cpu) \


