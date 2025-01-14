Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B4EA0FFE5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 05:26:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870904.1281992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXYVK-0008TB-OR; Tue, 14 Jan 2025 04:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870904.1281992; Tue, 14 Jan 2025 04:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXYVK-0008Qm-L8; Tue, 14 Jan 2025 04:26:14 +0000
Received: by outflank-mailman (input) for mailman id 870904;
 Tue, 14 Jan 2025 04:26:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sZa5=UG=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tXYVJ-0007T1-4L
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 04:26:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20612.outbound.protection.outlook.com
 [2a01:111:f403:260e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af320c79-d22f-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 05:26:11 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB8PR03MB6300.eurprd03.prod.outlook.com
 (2603:10a6:10:13f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Tue, 14 Jan
 2025 04:25:59 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%3]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 04:25:59 +0000
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
X-Inumbo-ID: af320c79-d22f-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSnouGHV/umH4ucsoS7EOUXQE1nqjAB5+yWyt29EwXkyequkZJokk+ZmYXb4DZM37mH5eXQyGk0RvvOmz/N8R3Svxh4ftL7n9WoR+qDlvrHhNoOZZwT+DmjW1cA6WP2DXGBsfPB0Dz31T0p4530AxZqCEvl1X6liAMamSVsVO9tjOcaAFFOd6CRb2wFLiRwwxSAAEAJ65kyOWq9+3KdLBRYw0pTG8WmOifal58VGM+D7WjvwQdXxrgLIXCvV/ZM1GTuf7+nONq3iwLTMZwF8cz7YeRPub+MzRNWQ1SvnWk1BHDbn290/xykPAEepekNlDDrXdToqwao6HpcSz4Ydmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ojki7nJQGFp6MabSULR9hew/zeC1tbVTuB9R0uaCM9w=;
 b=T+ThCKSx37kfsG8zyPOAwJAQwl3RodYQaC834flyQHEgZclGgUTQ0lBnatKDlaewMjZLxYfhJBzZAtB/KYsiapHhjmuNMWFeyW8efr5CtotyckDWXLo/m41dReGcT3wPcZUtd0TPBDU8xoUJoz2TaY0o/TohaqtTTaQmCtNryOBlJ6SQ7SLlv55G+3KsGMpxyhIsPqj3hgrrD/l0vHDUCD3aKZDqhnxmtHbj3Z0H304Kgdgyvw3IquxKC0QKuYGs8zh2Ye3ZvcZrqGsMiRiFGT9MhgWNbWzr3mU4WXvob+YGateBGJ2YDM4GRTtWHEy+px18khLsxOAR+YaB4lqKQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ojki7nJQGFp6MabSULR9hew/zeC1tbVTuB9R0uaCM9w=;
 b=o8ZV4NOSIRdWVlmo2KcY1WMFsf142wl+VabodXmTDwrdxoSP4+VRybtln+mZb3QrmqKqSz/jbd03wdUEynz9l4GPdWpT0er9WoeNV443AtpTcmdP3k9K+g77Uzmgtt1JMdG4xlhjIBBxv8hTiDTKg6tOdQsNQkylAtj0lrI1W+G0s9PjN46WpN0xnswfPBe/+KOWtEWusrUjKsavyRu2yQC6nr7Lp4xrL98Tp5JXmGiPti+74e7T0ypwbzPsdfuR/fF9QorMf4L8QW0sQjuUwX/KJA4spHnXqQ+1ZaYjDIly5HaksxMomlTxHnfLT4E6NXeKvcVxmbDEztwKdGLfqQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v4 4/4] CHANGELOG.md: Mention stack-protector feature
Thread-Topic: [PATCH v4 4/4] CHANGELOG.md: Mention stack-protector feature
Thread-Index: AQHbZjxoP9pre94pwUyb17Ngp5RsMQ==
Date: Tue, 14 Jan 2025 04:25:56 +0000
Message-ID: <20250114042553.1624831-5-volodymyr_babchuk@epam.com>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB8PR03MB6300:EE_
x-ms-office365-filtering-correlation-id: b592ae4f-a3b4-4cd1-dbf1-08dd34538bf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?W5baY+ao0+c7SVyksNryF+SPy4f8HV+NtjpgXuA2tWsdSxnXdqtiBwR5jx?=
 =?iso-8859-1?Q?RnqZICm2Am5VMMv/WJbEhA/BCUBYOqd758ga1Dz13uAAQU4Ab9sHNb1pw3?=
 =?iso-8859-1?Q?KbHgqyMVPrPWbj91WxLeCxHMpnOrVRCEZoB5sTYXuVSGCbp1O1+QZmgXem?=
 =?iso-8859-1?Q?tX/bpw/LjS1kcQaWhjDmYyKwlQaWcQgZ1lCJB/aF7sqytnip3zWjBxGamV?=
 =?iso-8859-1?Q?IEdw7xa3MNOUFBM1SjMxGeSPcTFxZQisl7gR4szxk6UCBMzicYYWo4MF/9?=
 =?iso-8859-1?Q?+X1viIt/rUOVk0FPzVa9cFynCE3+HPGSTeyxza9PVQTCbynJjpSM1J9mJ3?=
 =?iso-8859-1?Q?YToKsw/WsQsITSMncXLL/x1cXoVy6oMt1I5NVgbQZjO+QZJ9rmdSOztWgw?=
 =?iso-8859-1?Q?V+G1dyPUz5jivkHr4veacHwSwt990nM+B7FOBoTNVvz+VIjg0Zf+2Trf/Y?=
 =?iso-8859-1?Q?GNxNVL2i2uIJBaALSOslBlgC31H/SOxWuEArUqMxBmlIZoocIMeKGUDY4k?=
 =?iso-8859-1?Q?Ro6HKNFZAh4EvT+D8ul6BxOJ5wguoSSZ5Wm+lqJdIVShFJHal5wJwYh/2y?=
 =?iso-8859-1?Q?GkyXtUm9qnb6JPXvTnAw0DMKVSoVs4rkSnOrlyDWQbmnWrdwntZmlbMSmV?=
 =?iso-8859-1?Q?uMyAilFrw9/UrhZ1EitVmFaxd0aGZt5AP3Hhe4TzUEjvEH8S185zz/iWvn?=
 =?iso-8859-1?Q?QWk/ZDnzOCjMtuNOh5dV+Z3gZ3ZLve/HBVoP9vP2oVMXg180BL75ZIUPYi?=
 =?iso-8859-1?Q?8iNJdbxtUC49RGyrn7zXUjo8CR1P12Gp4bmPjFKgOjgdB6aZ70m+SaTG3S?=
 =?iso-8859-1?Q?YoptpiDlWyzRe2uIqyc2wSzX/77wqAl/Fkt/DFmKAaFIcnev5m5fX8b2Wz?=
 =?iso-8859-1?Q?C7Pt/KjBW4PKuxSuz2gf2w1URtxk67pbTpMLDuTtQsttxvvo7dbaN2DKbS?=
 =?iso-8859-1?Q?ksOy9VfyGZ7Ve0zLGRmwcjbAsb5tqq/CtzvxmYR0c9TzPXEatmy3KuYYad?=
 =?iso-8859-1?Q?eUweAYlwyH2O71NHjddZ4Jjs/Gh+PEz3i3fpAFqWexr9eMaOWoKcoEdPi/?=
 =?iso-8859-1?Q?gEfituEewWQWCDeakPLgaMV34O6/Haxjp5m95O55DZn7WXcF8yHFKvWvu3?=
 =?iso-8859-1?Q?DLN2I4Bn9wQQrCdjPvFG/bCaEvWybQCG5sAx9r/x7Ex6vDhacA2oIgIVBu?=
 =?iso-8859-1?Q?qnFFn0X4yQRTaZ0a7A91JQMO6oJ3pkryhdBQV2Y/tmTmEcrcm0T8YOUq9R?=
 =?iso-8859-1?Q?qt4t2FYwI3CSwnutGdyEuegoCRtGDfUGx2krCyoAYfsj65D7inWVPKLL80?=
 =?iso-8859-1?Q?aAx4HJpSMY0fFZMkaW9RDI7K6n6YFagBA+pgQ0l3EruZ39v4Bf+u+c/bCO?=
 =?iso-8859-1?Q?8mYKnAjYuIZqbthCCZsDk1wXCPX032sI/+4zcd7+UHbBGBrzsTdbxmoqiW?=
 =?iso-8859-1?Q?dmSr3NIupcjMQFPn?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mpI9arIxDVbscoZdZRiUNb7/xR2jb5cqZidTtdXJoH+B0ZanHKiQLVI39a?=
 =?iso-8859-1?Q?LnN5mJXFq/60gO2L8O64Fzn/I0tINifn9W0Wi3ckurp6Tul2Em86/5JtnA?=
 =?iso-8859-1?Q?4HkZBFid4p/Ra1krzJfWBQKDh+w+p67FXVGLehq25KvherZBGgxUCwl7zl?=
 =?iso-8859-1?Q?JjPCOZRi8XjdpPtbScKVhqh+NR2N87lmo5uDKzdwCDJ5dC5Qtq268yJCFB?=
 =?iso-8859-1?Q?XpzcK1iggP/NRbuuavhhbKV1l0whCeyWiPh6ATMolh2uATTIYIjXlt2pUf?=
 =?iso-8859-1?Q?/SpdiSmQYqc/6udA++TdR69+i9Pjex5HHPWHNk+XfbOwWTphzzbhS4VPub?=
 =?iso-8859-1?Q?zs3jvP2VSZBHa9xvigRJU7zTImOIWyHdQiU7dvztNayBhhkqNkEfp5guiz?=
 =?iso-8859-1?Q?k0YeFqRojdkxQ6TTnhb4oIJAYhXFjTWBE4O9UjfYrCg37WEyWCJ1VQKsAU?=
 =?iso-8859-1?Q?Rk6QhbmAlvrKGWoChhaHSZdUsZJTT348sP2Vgoson9xU/hNkmAV1rHuYwo?=
 =?iso-8859-1?Q?K0HtEO1Bpj2DJSkO1FqVrI+4cYhcK8YVa+BiUgzdC6HvD/riN2XRsstnkB?=
 =?iso-8859-1?Q?Y3suEIpRHtOXhhDmeAhGlT+ufCVVII6CYde7o43su+VXJ3dpVzzPDHGGdS?=
 =?iso-8859-1?Q?OjoDi5cNTN3us9gtX49jaVjZGFGINlwl1Z2eo2U8zbIklmHvGOT74LAmkD?=
 =?iso-8859-1?Q?LLAlD9XRSXIlE8wukHcaLe309eK17g2awBOWTiFRe4BqiH0mq2ALlsm3Xm?=
 =?iso-8859-1?Q?wZ/IhQo2sY250q3Fw9YjZ776/WyBlk+yqaItf6sFz4nqjJ1oYwSJ4v2A7h?=
 =?iso-8859-1?Q?3pJRs0A52Tla7hVaBIZpwTIup/DSI5Q+DlAqDxKGHKUQjuUHBMmuJlDBzM?=
 =?iso-8859-1?Q?fNypPjU00WOHldTDLics4FCmfmuKOV8x0ogC5zh90Q2400kJjZzpe+Ezp1?=
 =?iso-8859-1?Q?+AS+iPwf9bYXoF3lzOqS8duYOyNEdD/pMtSQ1t2I71SWuWznCATkRWsbqD?=
 =?iso-8859-1?Q?xYbTHMfYnFBiEgt8SLfPlcpmjMQSh3zaE+T8MJPLRymOvWG6iDZdN+nm1B?=
 =?iso-8859-1?Q?252fAzmnjehHajYfmfR61z355HzAqlNc1r8GI96hHLZ75ngosvj9dDAGhD?=
 =?iso-8859-1?Q?gnNLtrliFCjvsSYemN6L1scVCz4vZIOzmN2sB5M7DbB/Ye0LebMayV07ou?=
 =?iso-8859-1?Q?QB1+Ayy/U+ZmZoQ4uFPOoqNCKQyN6gVveof1qAK1DkjZZAOklomHiibLFQ?=
 =?iso-8859-1?Q?r8iVSyKW9ewUWkLRFGeZ3cny/MiwubQyvTY4ghO58Sxints4TKOSxjAJs9?=
 =?iso-8859-1?Q?CvLHZX4H2hdQ1B4CZdEWSjQP4/IzOLeS/CAnLhSSzGnOv5miD+SSn2XwlG?=
 =?iso-8859-1?Q?1eYW0O3R9mByHmmGHybfBOD4xKUJY4mZXRKrxskGSOpOd4WLfUfrW+f1lT?=
 =?iso-8859-1?Q?ly6iX80xipWfIk/VxpRZ56nnv1QryMyL0NiJZWRIZFDwyzJamaMBCxFzB7?=
 =?iso-8859-1?Q?vERaCzyWokQIy1deJ46fdR6zMBV2KfuB2vibAa9qclIXeIoPZF3oxfg3Wz?=
 =?iso-8859-1?Q?p9MDTx8Lx0E1msQMSbZiDEiXTCv8+JgQYC/wKBvr8VtFt9Q4C5plIO1roq?=
 =?iso-8859-1?Q?eKShlov15ZUPC2GIKMTK2BA5Rpv2xtf5p84WAugaqD+otYh/tEHPl3iA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b592ae4f-a3b4-4cd1-dbf1-08dd34538bf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 04:25:56.9105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TEKMDAKVKMjmMFf1NHIGcv8ncuv8qCFJMhXIm3f8MOkXw7863yGYfXrTUsviuYpqkUZGjl6IJLBJBYna8mdhsGlf4zKAkQhn/AnjbV6XwVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6300

Stack protector is meant to be enabled on all architectures, but
currently it is tested (and enabled) only on ARM, so mention it in ARM
section.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8507e6556a..62e6c26aaf 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -22,6 +22,7 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
    - Basic handling for SCMI requests over SMC using Shared Memory, by all=
owing
      forwarding the calls to EL3 FW if coming from hwdom.
    - Support for LLC (Last Level Cache) coloring.
+   - Ability to enable stack protector
  - On x86:
    - xl suspend/resume subcommands.
=20
--=20
2.47.1

