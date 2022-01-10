Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F02B489D7D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255413.437662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xUm-0004cR-8q; Mon, 10 Jan 2022 16:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255413.437662; Mon, 10 Jan 2022 16:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xUm-0004aP-3S; Mon, 10 Jan 2022 16:26:08 +0000
Received: by outflank-mailman (input) for mailman id 255413;
 Mon, 10 Jan 2022 16:26:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xUk-0004aH-V0
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:26:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 028aa980-7232-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 17:26:06 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-mkJHBeTsOu-3PtrBbiQ_Ew-1; Mon, 10 Jan 2022 17:26:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 16:26:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:26:02 +0000
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
X-Inumbo-ID: 028aa980-7232-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641831965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=26g4ivn1MRCUqbsewHobzs7UcdJkFPDivX5/i4ZveLM=;
	b=cC3YNE9n4F1Cj3CaKf+BjaE8e5NjkpAnocrFlFkEQjDjheGeEskqltWoOBiSUztkb9H6EP
	wx4fh1tYYLyvIHmeq3s/kcXLf8dQvutzmD/dUi84JE8yLjyTNqEImAxeyzDHugNc3EeUg7
	WEkbF5UAxyKraboIUZBLhMFSOJo4rNQ=
X-MC-Unique: mkJHBeTsOu-3PtrBbiQ_Ew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCPZlyyjBlpGx6kn3tWwHgKZXlIgWbfseuAthvGSPetQ6M6bUM2PZHm8ojGqSoHOaiyt6VJcbYqPqI5Pd3+800fc+U6U11k+/PeK/qWs3tyk04zInm4zQzcJjYXR4Jfios67Lj/ul8AH9uOCR16WuvEDO5EIOfEiQojLBHKfyQXgV5fxYUGK8XLiD5fHrG+/2bGF+GPTfV1R0DiLNGFAMZNZmgz4AKuTXddUY5yWrMA29hFD62Ta0OUlB4tDCkqIFQ812GFV0UHcikAkwvzrJYt1QBFG1v91ViCpGHwRjPdeuozTvpSbvNTY3PokGAxOANvMCMVAqO48fMV7oicmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTdXIg9P0QuVubgLqaqmEja0RWzTevUYMxmQK3d9wRo=;
 b=lBF5m6QUVRhF+6eX+O57SNhwYbe4dmTDOBRlldX+fZ3Bj5jL3yzzMLPcaIvmLHFQ6fdWdGIEt/EE19UdteEU96JX1wPUKqS3bR2a2EsOLrq6trV+L7HlLI+G/3A0W30BxLc0OlnfYUZarOD4PXiT4VQlFXVNLFRDInbbhzvWU6aElIsda+hmKZkuMsyY2DgdTdVMIKWCN/U/UI8Ctzg9ToT+VERQ5077MGsisq1KyuYBHqeElLo2TY5twJsD0UPcmqxIhvTj0m+xhBptkjYUHEQl2Bh0DDqHS6qsLSk7wJTp3JQr+4m4xm5kMjIOw8XeN3+8Wgk78xFT7AgLSsbXzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e36382e4-195a-d9f3-95bd-88e225fc8c62@suse.com>
Date: Mon, 10 Jan 2022 17:25:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 05/23] IOMMU: simplify unmap-on-error in iommu_map()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0012.eurprd03.prod.outlook.com
 (2603:10a6:206:14::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9a01eba-bf58-4f0f-7184-08d9d455e48c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3392DC9BF15B46CC4310DE23B3509@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t9AYGJ/OF+zJvKuVEoxxyAvLMs1JuL6OAFO1KWi3DXeXw3SvmUSmDCAfXiQ7jb+BLtOlPe+O04TThEexu9HITKwwhgg8TOJgl0/p1earIpAB8JzWd1Nvrc/ZCDyCcLrdNpCTlC7Fo8/PisJjSMiyOPiqnVJuU79lTh779k7l+KGJD6T0qop2XuDvIHQGRDj1GFk9v4N8tHb5T7lTTw/3jJ5emqUKD9PsWiJIBGeTbrKmi5HmRjKgraJgr6pzk7PFz7D3yhc0s7efOWHsCXC1h/uPKaHldSLn+OjPzEk/DS7yUG+maTg2SnRtXr6+jPjCzJgjBO1Nqb/kN49gdW644KsITZqoC7w+xQu5fb9pUhPFLnwrmvGecDqf0RTG8b6BajwOMNLBTqwinOlY13udujDg60YcCKCCz0ojoguQDypz1t9cQF085gAVeHRPUmnQy13wKHp3EAZJ81W0k4n3CkvnQuy052MDc7GeCKzh4Fm3lJbBAakrvGa5x9SiD83wlCmqrXK4771sPX0WPVrbDvd7bmIn+2Qw5+6soU6FDcDzMIVbuoGxrmPw0/nfZ+qFOUSkg5o5zMq/UVr8JqH7ALsQrFIxPboLQYWxvjYVxwafkFNy1hn2IoYom358bLLod7IYRxnT5E5aHhh4npYQ+rZBzK4rqPW1WHk4biArA3PO86i14bX8R2Wex7R8phkVWSoAB74CztKSjiIb0tK+ZiU0oGuXwM34egCtiTQxU2656BgnjmH3dOOy2fJqafl4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(66476007)(66556008)(66946007)(86362001)(8936002)(2616005)(316002)(5660300002)(508600001)(31686004)(26005)(31696002)(186003)(6916009)(4744005)(38100700002)(36756003)(6506007)(8676002)(6486002)(2906002)(6666004)(4326008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1jU+M6f2xwHoS+rTtezggcIkBYL+V1AqFELNEI/5ZviJWXlTLxpu/RfhqhQ3?=
 =?us-ascii?Q?Q1/vjrFu49Ze0TNyJ2uu95l44IEPTaehU4421j3KYzqYm2FTYvp00U3HFYFf?=
 =?us-ascii?Q?qsmudaInzha98G4f1IoX9BSK8xUvren2D74n0DzbJ29T8aS3A81ROhu1K7rc?=
 =?us-ascii?Q?veXikNfaUpaUsvke735WkDDClT4MqvSdaiumSkJgDNtEVPdTuZKzghDACVKQ?=
 =?us-ascii?Q?l6DCtyBJA9q/ZlY0Ih/Ie2i1E5IG952LLpTLQDLj0QWr81GAdyZS+BBaRwxC?=
 =?us-ascii?Q?1Eqsj5CUZ1rvzyDxDAGHRz7+cMdW+oRSGvau1XkrgAfNqCSPm4URVSwL/ogr?=
 =?us-ascii?Q?Z43C7XW/b7Ql2MQcdRbP1jxtXTaGX0eGWKsXgeBKezoJKgSf0RnYovCRxxaw?=
 =?us-ascii?Q?HjWYovi2T8ghCNF9ON58Vy6TWaM7wy4G4uEKwBcNwjcOdX9r1JYi3pbDqVzU?=
 =?us-ascii?Q?xfihO4HZFv86sOS6nlTP8MrTJqkwxwt2gvNU9KWZcG7VsKaiTpxGHo2lKN9P?=
 =?us-ascii?Q?FALjiyhi+dAJfvvi9SHDOdjufBAm7hcmggu7GktYxzpSrQNEfBDWDUPnDkL9?=
 =?us-ascii?Q?9D+nSeMMw10Fk9EznYCobn9PzESDx1rQZm13bEhHXcUkI9mFPcWhvBnbz/EZ?=
 =?us-ascii?Q?hQR7xFBMP8dIAvcXO35HIVh82ewfwHNB5dyjTWARQBJ+XEO+n5J1aO1fEPCs?=
 =?us-ascii?Q?tFZ3DuA6pzdh81prPXEFdu+Gd715TGwGZOgGSY2WktmVDFJjakvDzzug2E81?=
 =?us-ascii?Q?u3QIDFD+i7iH/g0EtZzfoW88jaVS5eU8aWqeEuqwhKI+QgqEq7Zd/XPNNqoE?=
 =?us-ascii?Q?5jIeEzFuyGMHq2FFYv2sJqXFORKyQHTNrzjmF4/BZTfJtrVNRb4mxJSDjc+/?=
 =?us-ascii?Q?poVYxPTzATicZ/zSvB1LQoTKmjlVh/1KbAq+addq8PB/ZoP2I0oSW+WMxIvx?=
 =?us-ascii?Q?+N2NouHV6FVB109jrq75IdDO3mL0EXIsekPX6cARx0gNTto386ksLoOak0p1?=
 =?us-ascii?Q?OQTP22j0006rFAgr6CvxZ2Uvf4SDsqXVtcdPOFssUJXsBfleCyKokg7h2zJd?=
 =?us-ascii?Q?SWdl/1Uon+QUtVUfC5zW7JJ8fbyFAP8gbppeTBO5inhVfRA9SBGindy6l+A2?=
 =?us-ascii?Q?aERCEh4Q+WNwPA+Y+n87DuDb0iu/kXmo70WBjRM9GQ5D0uUJZia9jfurkL4D?=
 =?us-ascii?Q?cNm1tLrFSnf/CJTsu+IxLOgfmFktXcXYER43zzS5Fkqh3HDoc65DfUxtAEiI?=
 =?us-ascii?Q?xkGSU0cLpOfeUKRNQ70ek+szA0sGQ9sCKwmA1aqDD76GaUzpvz/vgntQ9GTN?=
 =?us-ascii?Q?gFGhW3TnzRnZn5B3SUQim/WRMZuPs01nZEj9pr6CdVqx1Ujf86e4ii3bQvY0?=
 =?us-ascii?Q?14nppQFZsIChr6ebwjA5xFvq2Sl9r9zmlx4OISJZJgqa6y9/OiUa4RUmF6PN?=
 =?us-ascii?Q?9/QUCQEDLhpIYC9N+LmJHmsJGSwwoMiWX2jEm/LVNVMvxa5jVk5GDHPXNzZr?=
 =?us-ascii?Q?8AYX0qKxuFILEss/7ZOgl1nyRiuDOag89a+yElBsZhvn49SL2BMCElIkF3f1?=
 =?us-ascii?Q?917kkMHAsjC62DTXTSx7cGfp/fYiG61kJeL77XtZLADEhx+cgqlH1OdMnkrY?=
 =?us-ascii?Q?0PyGORXSe/zS5+loLAeoIoY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a01eba-bf58-4f0f-7184-08d9d455e48c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:26:02.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mreh7tWg3+IatIpfGJ9AsMcmdUeofQdTNaVvWoOm6rGMVSY+HdFRMnJG0R6ISbfaNh5vJGxcF7WuAbEjOXEDQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

As of 68a8aa5d7264 ("iommu: make map and unmap take a page count,
similar to flush") there's no need anymore to have a loop here.

Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -285,11 +285,9 @@ int iommu_map(struct domain *d, dfn_t df
                    d->domain_id, dfn_x(dfn_add(dfn, i)),
                    mfn_x(mfn_add(mfn, i)), rc);
=20
-        while ( i-- )
-            /* if statement to satisfy __must_check */
-            if ( iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, =
i),
-                            flush_flags) )
-                continue;
+        /* while statement to satisfy __must_check */
+        while ( iommu_unmap(d, dfn, i, flush_flags) )
+            break;
=20
         if ( !is_hardware_domain(d) )
             domain_crash(d);


