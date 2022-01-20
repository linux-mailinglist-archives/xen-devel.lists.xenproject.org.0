Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D57494FC0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 15:03:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259074.446826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAY1d-0006vi-RE; Thu, 20 Jan 2022 14:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259074.446826; Thu, 20 Jan 2022 14:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAY1d-0006sv-O2; Thu, 20 Jan 2022 14:02:53 +0000
Received: by outflank-mailman (input) for mailman id 259074;
 Thu, 20 Jan 2022 14:02:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAY1c-0006sb-Sn
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 14:02:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a83948a9-79f9-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 15:02:51 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-qm3J6sdGM0y_EV224iY3CQ-1; Thu, 20 Jan 2022 15:02:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 14:02:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 14:02:48 +0000
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
X-Inumbo-ID: a83948a9-79f9-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642687371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nv7AY2ipZylSfprvqAq1EN3qHGjDUPWKZzBPAIOB3I8=;
	b=V2bI0FlLwCY8HPOxR6x2KmqO5j46BPnOfBNQiFE7xffU9h0GBg1ei9AgIRv6lGrF+8fldH
	lnEcyMPwHqolyFmsEs7XRJN1cl5RacmU6+iG0lqnsXglV2HReZQGTTWVubgM80O2L9dqVQ
	/w4LWvmX8wTeHL+QAONK7xmuUA1z140=
X-MC-Unique: qm3J6sdGM0y_EV224iY3CQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mkysnr5Js6PCWKd2z2YvxKt4eRn3J3fOpIBERZUhJE+71+yUD0hirGfR/qFF+j62VBspFJwtMukXm+d+Anfa45YB9/Xu/LdM+MAAt8n9QZya8Uk3Mj2pWwbksVM7R+75davFmxgqO75j8TT2SRqaXkBLDeHmuHv9/rOEcjuRDN1laPvnhCe3eqrxtFZRQ+fVvstysslPfOwc4ZodzM3E5/KEhBMFJurgmbKh0QnVwN0CwwLYNiG8V/gO/MBntysw8SBkvgLNqHRciaWg7E6DgRS73y+j0hpckxCG198ubRXY+CbPRk4PGZyQXz0s9dUbwo/Ui6InM7rQGnv3/fkixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4Wc9t+1vhwqA/dFF3ORfoGoLxLZ4aHX6+/gI+XOdLE=;
 b=E3YyI2S2SaxUtK67tX7kroeS1FSbFb4g9e1hsWOeC/uK3vFFoQluyB0Dl6/mZdWwgVjZgSyngQlfW6iaMdtfNzk89VtnShBuCWIyzElJE09wquMICsUWc4Zc439Xr6GZX4JPwOT/nEfabg+M8VJ6kzXbcPqZnQLg7ErQgY2ahdmGAI9bva+gZTemV44QcqPWZ3MhDNJER597Sxic+WC8hVHSMy+jFrm6Q6YNIR4fDq++fBBhthZGSn7iFi2HxfCoebDXhbHIgLDYpS97Yn+BRKXyzUEA2c7EwtOs+DFkDytPQqZrfuYzKUbksFoqNj5XVvDgUScCsbEb2Xhny0t2+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d2391797-deb4-e6c6-58af-aef7ca47c3f0@suse.com>
Date: Thu, 20 Jan 2022 15:02:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v2 3/5] x86/mwait-idle: add SnowRidge C-state table
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
In-Reply-To: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0036.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ebb1a70-b48f-44e1-b91b-08d9dc1d8a7d
X-MS-TrafficTypeDiagnostic: DBBPR04MB7643:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB764374CD02D18AF39A6DF65CB35A9@DBBPR04MB7643.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qa1meuUfO3vodwYUKCoUKSsjF2JkOGIFbdkrR9VjOEu+gH9PEwNDJvJqdK0ZqvGB5u+LpdtlMGdvOvFMSBUqKKrd3kdZb/lqeAWDtfqQNlEvA3l6tFtZIa0BnSx4pFG6jcvCb+SRZgA0KvTp/ZwmaEnPkCjH7idPq0v5AmdoFPUZ92nt2KfPlwha3xEICsWcRphUygeFPBYGzaIESk2q6aNrqaU/+uqJ4/Vxm51B95UFACjFVzSlTAw/mMCFH3540qGcl/eLVyx3e/3824uboGkD5KjtuNDulf7W2oikuVgJyzQxeayGP5JiNmdHlfzxIM5Y49VqBf2NDhqqlcc4n35Hqw4MqzWz9HCHCTA0D35v2ONUXSArsr9MI80yjAskAKLekdglw8Eq1R+gosLikoFDKdGs8alDbqNXVEip8cbRr/cMS9h0gW99APRbriz1yaXnMLu3vbarScDmoIIrLnm3BPgFQ7Q0su10qDZwUt+vGPhIKRI2lUzrd5+f+bg8whyeAr7Z9lblzuFVTwGRPbJ83iQ32NRw5D9IfzbZFX35+4kobiBUkOS97rpwjZa9eqW5ReuJWE2Bzt0hZiYSI4cgLAVVVPn3YgchV+Y88W/WKXfCEYXPvIhKT75vKIZnx+YcKOewJYBa3MvAlTmIrj89/UrAikJvRON1nE9fD16s9m5yFBlJh2pnzl0j3TGnKy+SXm4J/bmckdXyVYl1pS9iq05h/ySURlBXDGmkM/B5hvvT/jBftesG5ITV3TK1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(31686004)(36756003)(66476007)(508600001)(8676002)(31696002)(8936002)(38100700002)(6486002)(86362001)(186003)(2616005)(6916009)(66556008)(66946007)(316002)(2906002)(5660300002)(26005)(6512007)(54906003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1hDG/Lid7PYDtZYTC7FwSN7AVmLqyURoV6IOxPxTRku7Ph5OtHL8PEt6XzUa?=
 =?us-ascii?Q?d/D1OAgIlWrM9/IveTOT3GNtej+cKWPQTay+ZERt/8EEfgE5pmIA0eIHZIrR?=
 =?us-ascii?Q?hoE+VaHavxkctgn7h+KEz75Wnf/sWKCfhHDd0SaZsq7MwDDoYSg9A5myBKsn?=
 =?us-ascii?Q?cC428HOhsLkCkqndiFWLEpOZy6mrfhqqGO+na6fUtH+7KEzZkZAt1U+oQOw+?=
 =?us-ascii?Q?lb0v7NjmfjGBlBZ9KssBMGF7nqZ1VhUsME1yCnQnD4vWYOJaWRwO/1cJoUp7?=
 =?us-ascii?Q?LU9yPtxWC6AJgRFdZrsOUtPsWZmkZR+1J8LtE+9G4rhfX6+ELHkyO7u1XUcm?=
 =?us-ascii?Q?M5yPee8qZboGVZ7wIdpSt5LP4WZE2FJ1+QNpCmWHwszhcjKeIYCY6eLtaX+I?=
 =?us-ascii?Q?mMmtxzD6OYCWT252aHDSp/ra6Iygaa8443IMDH/TAsg8iE2gxW3zLMGMyL+5?=
 =?us-ascii?Q?rT4WX5KF1ZlS4O9ULVWrM7O2yK26ALjSD9NwOwCl/Diqmpg1hFUD/89QBJGQ?=
 =?us-ascii?Q?xnsFSFqa20ceMA+DuVO3jMwyQBkI8D/lebVpxAGreUm2LVjzIjx/OwOVJj/F?=
 =?us-ascii?Q?JxE2AzhmZgCliirTWmUDq7WggodZL2GDa2nJ3YQdQn/wfUxZF4Gv0NaXKN9v?=
 =?us-ascii?Q?5Y+84salCiJYaS8kIOocrJwbY3oii8IdtFAI3zWyFQG8gD933QOjh3BDLu+D?=
 =?us-ascii?Q?yzZb/l0aLsub/KO6A8EVYGgkyB96STpJh4loM0E6Ggmn4Ob1ON65HgFlB8m2?=
 =?us-ascii?Q?PMQ6X3RSGZwc/e4u3jWTfD8TA3m7cnpqHacdWwrvA+RfJjClp90g4I13nxpN?=
 =?us-ascii?Q?maQ5cNz9y4M9k7hQZh+cOBOtd2cDckifzLDzeHaJryPKkj/F40tOgNXZ0uft?=
 =?us-ascii?Q?RikfswmPU+VaSilCvdKqJCXRV6EcTaiCyeDBkl7pUDXYJ/YHvCwG/XlPoU+5?=
 =?us-ascii?Q?ZkE7ha3QR9ymJMjg0lTL5U3ou4ZXzhBRr9ZDJFWgSFdqKV1HGNXgLcv5f6p0?=
 =?us-ascii?Q?BswazDDo1/iitWu3LmZfEw9viAvex8wcZrOtFaew5zsI52EGtT+76ej/i+mR?=
 =?us-ascii?Q?pKdXQ0+S6HbGOjmHPvWZJ3yZwcQSA2xBhNShUEm4ih235NfWxtHBhVRMRKEi?=
 =?us-ascii?Q?B5DSau0l61Rl3vqNL0zXVM7W+Y8HKJZX/CswrGFde4+a098luReurtaKE262?=
 =?us-ascii?Q?KfMBthTRQKLMyonsYmGiId+YrYyBArIQN7TN/JK+LyLI7xz84188Mxm1GhIe?=
 =?us-ascii?Q?aswmrBfjvnHStBUvYgvzFlXTdSoUy4znGcGnCM4pFbsafOG7h4OotIU5PopN?=
 =?us-ascii?Q?Sq5DErmbZgYiH49GCQeGN0wt1JFynWxWgd98os6Kzj59xBCORW3LdVTfFuQq?=
 =?us-ascii?Q?WQEK4MwHL8fLZdMvZ1IWVfuBtscA+EUmPDHWyq822k7/ShOdcT13DY7WeuvY?=
 =?us-ascii?Q?ZWSO05QRsVD0qruZE9UuSr+7Nj1vs8ejm2hHUZPKf2Tx3xlLN6Yd9rHChxyN?=
 =?us-ascii?Q?wq64JfLsUh76GgHjkWpNttwcQTfhJMKMyGWUmandu42HSv6FkoL9BowyD8gP?=
 =?us-ascii?Q?w2aSIxnMg76H25xdTaMoDb2dWjOr1ewkFO0p8L2EocqbAeGSvZBJiiyoGAun?=
 =?us-ascii?Q?Ts2ZCtR3oLFrZVrAKWW0XEI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebb1a70-b48f-44e1-b91b-08d9dc1d8a7d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 14:02:48.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JRZhf2yy62qZ+I9XzKXK3vZP1RDS8fQJpBMoGKRXBt0kuMLU2humFQlS02l5fPq1tjR/KMSBgk/vkw2sTIk0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Add C-state table for the SnowRidge SoC which is found on Intel Jacobsville
platforms.

The following has been changed.

 1. C1E latency changed from 10us to 15us. It was measured using the
    open source "wult" tool (the "nic" method, 15us is the 99.99th
    percentile).

 2. C1E power break even changed from 20us to 25us, which may result
    in less C1E residency in some workloads.

 3. C6 latency changed from 50us to 130us. Measured the same way as C1E.

The C6 C-state is supported only by some SnowRidge revisions, so add a C-st=
ate
table commentary about this.

On SnowRidge, C6 support is enumerated via the usual mechanism: "mwait" lea=
f of
the "cpuid" instruction. The 'intel_idle' driver does check this leaf, so e=
ven
though C6 is present in the table, the driver will only use it if the CPU d=
oes
support it.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
[Linux commit: 9cf93f056f783f986c19f40d5304d1bcffa0fc0d]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -742,6 +742,32 @@ static const struct cpuidle_state dnv_cs
 	{}
 };
=20
+/*
+ * Note, depending on HW and FW revision, SnowRidge SoC may or may not sup=
port
+ * C6, and this is indicated in the CPUID mwait leaf.
+ */
+static const struct cpuidle_state snr_cstates[] =3D {
+	{
+		.name =3D "C1",
+		.flags =3D MWAIT2flg(0x00),
+		.exit_latency =3D 2,
+		.target_residency =3D 2,
+	},
+	{
+		.name =3D "C1E",
+		.flags =3D MWAIT2flg(0x01),
+		.exit_latency =3D 15,
+		.target_residency =3D 25,
+	},
+	{
+		.name =3D "C6",
+		.flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency =3D 130,
+		.target_residency =3D 500,
+	},
+	{}
+};
+
 static void mwait_idle(void)
 {
 	unsigned int cpu =3D smp_processor_id();
@@ -954,6 +980,11 @@ static const struct idle_cpu idle_cpu_dn
 	.disable_promotion_to_c1e =3D true,
 };
=20
+static const struct idle_cpu idle_cpu_snr =3D {
+	.state_table =3D snr_cstates,
+	.disable_promotion_to_c1e =3D true,
+};
+
 #define ICPU(model, cpu) \
 	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ALWAYS, &idle_cpu_##cpu}
=20
@@ -996,7 +1027,7 @@ static const struct x86_cpu_id intel_idl
 	ICPU(0x5c, bxt),
 	ICPU(0x7a, bxt),
 	ICPU(0x5f, dnv),
-	ICPU(0x86, dnv),
+	ICPU(0x86, snr),
 	{}
 };
=20


