Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A33B2B34AD9
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 21:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093660.1449122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqcmI-0002x2-E1; Mon, 25 Aug 2025 19:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093660.1449122; Mon, 25 Aug 2025 19:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqcmI-0002vO-BI; Mon, 25 Aug 2025 19:22:50 +0000
Received: by outflank-mailman (input) for mailman id 1093660;
 Mon, 25 Aug 2025 19:22:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bS3=3F=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqcmG-0002vH-FT
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 19:22:48 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1825b14-81e8-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 21:22:46 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by VI0PR03MB11138.eurprd03.prod.outlook.com (2603:10a6:800:2d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Mon, 25 Aug
 2025 19:22:44 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 19:22:44 +0000
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
X-Inumbo-ID: e1825b14-81e8-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHON+4GGjgolE2DgjQB7t5tCBPyVdcMyrjtpxu3oCZrFo33wCRAWloS80ApOR06nGT00L4bK9BoH7QvdlHW6gmH6VmPE1wvHmISMRlLKs0LkR5vFfxMddzUmL+JudSJ1v7cIpFBtNWrjaTAJp4OoUBzVHaDW8msWjFZfT6oaf1w71IiMs7ra9xTAPDXln4rwnh32g/tGbzMjMfHAHBqOFb3BFZERHOwXuTvN6karlE7RnXwYyD0BCL5EH8UtYYotbFVcSRxEbGlbLPm0j5v8L2M4A2DpO1ueSAdiMu5JvVewEQQwaDBHdgw/xy3yKdmxYZMfL4l+oZMJC0LfA7r9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/Xy/3COfnhiDSZCPBz0IK4noAE6y9YPe8zvOoVWyO0=;
 b=O1SAGdIExk66FHYjM0uC439Ei58Jm8oDwfjm+dt4sOAZReowWo4XWrj2A3rgoea4COEt0SHi2xz+Kxyy4wqPIN3CS7ZO4+t0fm1Z17rjwgC8T3voY33zHsixVJ+Bo9CldKVt9CszFj32LKSgn6vmxacdpj7wcozgaNqNAxul6+NrRtq/8yIf4arvul9OTBTkWu/eYwG3ic+G1+HYWCOybeYvO6ZNvxczGcFFrnUy5vfmlLqSG6K/7ftjlmXmeFp5SBC7se4TfO+EUDX7VVtk/cDH0q1He1ZzRCmtJN+tfUDgvkKeYNhm4MPHVQZK3Voq3FTx6wCa6zLcHMbOvfmQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/Xy/3COfnhiDSZCPBz0IK4noAE6y9YPe8zvOoVWyO0=;
 b=lWrJnBuFMcvq+ohU2089DrJ+uL2WVA4EqwROMxRoQuZWDo3bj/nPQhLXqWCodt8K8hbZLYEy+s/5M4MZz5g0CQ72R0UaoCwAAAS5MVikkPTfAj7gHruA0TBXXtJkd3SwRORNYyAyyWzTCdY4IyyeM77h6F6aFGSWPiuz6cCk+rHXnprnGfVd23wsVj6v8P/cY4W/qwdHmKKT9pNar7lPL+G1Rnn+/3CDklLnxc07aiWNC3BEvoTRjcxBXQ8ttl5jEQo0rSBMxsfzpxht35K81KZPTpF+LyH7rBqfpyZ400ylc8LMs2WYkUTAqj4zHvu+qo3Ir/PVRcstXJNiotzlmw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Dmytro Prokopchuk1
	<dmytro_prokopchuk1@epam.com>
Subject: [PATCH v3] xen/irq: Delete the pirq_cleanup_check() macro
Thread-Topic: [PATCH v3] xen/irq: Delete the pirq_cleanup_check() macro
Thread-Index: AQHcFfWhxHP2kMnOQkiD7UseguEusA==
Date: Mon, 25 Aug 2025 19:22:44 +0000
Message-ID:
 <0959802e4fa73b848b2b9e47c57c6daf062e9630.1756149543.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|VI0PR03MB11138:EE_
x-ms-office365-filtering-correlation-id: ce6db846-9a5e-4717-e3ed-08dde40cc466
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5+MatIXv3CGEl8SAvtvd5JQAhrMrq/N9RXl4uwbm2HlwmFp+1ngGdc3ebE?=
 =?iso-8859-1?Q?wHXH7WehrSUOKqFU7egR/dhGi6PvRrzNeEGOF1njonv8PVeCIK+08uA85N?=
 =?iso-8859-1?Q?D/Bob2rdJbMxwzCkYbtfVy6gwCX4sKTBGgqJEBtZW0kQNdNlf64BCqQY4a?=
 =?iso-8859-1?Q?YWDV7m8wptGLX5AJa4I1L2FZOX7nT3QHOECPJ93l37yVm4/Rwc1Nw/bkPA?=
 =?iso-8859-1?Q?6mh5PcR1uxA2Cv9ujZOedH8D/Wo34rZp5/n71XsNVpGIx/AJ3c8R5LLcHb?=
 =?iso-8859-1?Q?CvoCiuZ8Cazbam2/ogx7evMEwS2e9iGHLUKRSFgAHxuxaHB5GabN8pPYql?=
 =?iso-8859-1?Q?GncCWyBfxgffWanlieWPJGDoD8CrhBGbTcMEUwDpD6dv+tOSYY/qTHrgE/?=
 =?iso-8859-1?Q?Pvxs2/qkc3yufFj8KbzaEquTH8dPQ8AiWb+BALAX2iZVTpWVJA25tFYqhC?=
 =?iso-8859-1?Q?YoIVLs6IkyE0nrJxJ0x5ZllHzyN5BmiFphE1pvZRzMRNYN/+8BjFdSU10I?=
 =?iso-8859-1?Q?rFN8mkyz8tceTkzvxlu3y75w8gBl8oPNfUQZ5bhDjJdJfTb4XMJTDiMdbV?=
 =?iso-8859-1?Q?e+IWkIq1FOmQgb40B50N/nRhjl8q9b2Pm7tkWS1swXx8zhYvvsV85K84lP?=
 =?iso-8859-1?Q?IDOq66KMB/qNc1aR2J1pRdzwh+FjPF8tnpg9Oo7VX4O2RKO8dwy1N0vRzI?=
 =?iso-8859-1?Q?lxWqq+w55v4tl7+9y3n+Wide3hamlBO7pJn5UuxskD4YlnzTcg4lHt2uX+?=
 =?iso-8859-1?Q?8mRPI24fvWwhlj05UEn4wJeJKJZEqVp79JYd3AS5f/RSm1lJssIji3JD4f?=
 =?iso-8859-1?Q?tH1gOL6R4mJvqQGHlsbr3n8LzxlYY9CXM5nHxQ+GpDTs4kyCvu/4hSJaSj?=
 =?iso-8859-1?Q?XAAG3YY9qapMrpfWkX261Jj7HQozvohTffmH4ND2jigldF2QlEbIcHkGsG?=
 =?iso-8859-1?Q?74V0JslJY5QUFxGo118JJjNP8BXFsoLqJCSDzntWADz46oltCP8tR1z7ah?=
 =?iso-8859-1?Q?liTThFYF5p1O6qDB5U0RcSkEggLWJE4POZHyBGuZtk9+AdbvKRo0ztIW1/?=
 =?iso-8859-1?Q?XjfvOzpcC0VkQKRVOdnL4mxfu6i+Os3TTCjQU1Ychd/lVP9fff5wbsd5jx?=
 =?iso-8859-1?Q?6Cmykx43PRVsE0B70/phhjJS5/VKQ38IKM6Ocs0Xt+O1qn8ITJqU7VV4ju?=
 =?iso-8859-1?Q?NRnZgCbrjLq7lewk8k1XVj4LOlFC2o2ECj12OfQvPd0oPgtY4a7X/OvLWw?=
 =?iso-8859-1?Q?X/XoaVTqGUMjKo3OxEf5xNyZK142evdSQGSD9XPlNKyw7DVU7an8CqpZMz?=
 =?iso-8859-1?Q?kHjS06EhgyJYrZumxlU1qP2HnF/EprHToJyk/azNuCQ104Kq13UJK2gkF9?=
 =?iso-8859-1?Q?jmispq50MQWQal6RTORtPIp1sWaCHx/aCppl75g88KkFG6GJwS9xUqmcSi?=
 =?iso-8859-1?Q?LiNfVSYR9zfiRiOehq2mMJvIVPu/1rBx+M+3K3cZy9xssDpd3A1SWvKqMw?=
 =?iso-8859-1?Q?g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UwztkSxeU70hUqWAZBwX8Cn1YGhYKXp/rUj/MoGA5KrFI34a16BLfw4gQm?=
 =?iso-8859-1?Q?bJ1JJLjL3TalyNq3j4PIVDdQtzfiHKWYIj4tSZwg68Xkn88gYEaxeyuFal?=
 =?iso-8859-1?Q?yb/gqOeagdV0pZlikN9Tl+bYuv175EQ80A9pw662NCYbvHmYflZUMMGA27?=
 =?iso-8859-1?Q?hWUlT68uXlXchxXYmBCMRWxcfi9NJdpqfZXtFBHCb2u4a3A1xdMuK4Zzvf?=
 =?iso-8859-1?Q?UjV8yblcBljFd6VCDjAjav7NPkyQis5hkt7cKwAa29+iq2h6QnFkuSn8Lf?=
 =?iso-8859-1?Q?ewa0choCTpM5UgvJHZYBp5LXVKtZKGKWQFGdbiRUtevx3/JBaLGCRcna2H?=
 =?iso-8859-1?Q?XAukTF2Lx4heD1YqTZ8nvP+kD0rl7mZPkjAfIscIQY1n4+ZYVJCCUZZh49?=
 =?iso-8859-1?Q?0Xg78Yemw5yicdmJ42WTHPVa9Qbvk1MZ3VIC8/iF6pHxg6/28qBtVtvnzP?=
 =?iso-8859-1?Q?EFLPT99CnfFkfLuUt/5rAoFh06KB3DJe/MHu/unq35hnDLlCma6t6kwbmF?=
 =?iso-8859-1?Q?gprQtGB552T4mXTAbeNBbTr2Z+LB2ywmVVvLq4S5nvROgh1cLOrxu46S+U?=
 =?iso-8859-1?Q?V4PDbddaLDxth/mF51jfvDIk6KGb1qb5wNN4jXYJl3Jl2ShakFVCD44tMy?=
 =?iso-8859-1?Q?3OtG0sojBv0bRJvfx2rLOWDe/XtUgXS+IbMW/SPs7o182/ndLx3znoENqq?=
 =?iso-8859-1?Q?LfgF/Dh0fOCYpIEoEDu3I2Fc2Vv8WEYI1pPb6XZ1RY3WZqiG7IL5kb7G91?=
 =?iso-8859-1?Q?qC6QnaxHeGYVt6I+l4y/HXBoaMM3W3F03n2VNj9mnV9v9v6rPgSzaup/Bm?=
 =?iso-8859-1?Q?T8ummFTlhECZ+Waki2zE/wHGgcG707LdEbVky8HZl4L6D0Aqygh4w0twbv?=
 =?iso-8859-1?Q?1QaDlxBUJ15x4OEA8EadMcpRvp/PYrJeJSlwCI65UTROsCrWCIr9d4KLto?=
 =?iso-8859-1?Q?WWTmQ5VvNWwLUxIwHH9rTc/PIQUKlxPYnpWsoVlwFSHXvm6JDDdNN0Hk+t?=
 =?iso-8859-1?Q?eLiT3zin1NPbGGeIa4DdhgzE7qzRlcZMyvBfjKKVqYJDNnB05sPjfKCDHl?=
 =?iso-8859-1?Q?7D49Tiw7WKgi9IvJ1FMuun8QfJ09xp/C84Ca8xWDZEEkJGIVatZ5gJewLQ?=
 =?iso-8859-1?Q?Casj7E5gQnfbrNhJYnvXIVezbEcxrCSm8PmIQTOerQQs7ZGttZU7wUcMdb?=
 =?iso-8859-1?Q?P7apzORBfJYDUpK8UxIt07sZUkmCPfqdxkP/6kRlU1GXw5m+UA/47FjKWD?=
 =?iso-8859-1?Q?xGTGnKVK+fSwpAzz0/TRcjuDqY3fYvDKGkZ/kBrT7uAje0K4/yjTt135Uf?=
 =?iso-8859-1?Q?mlb3ocaknE6vTYN6Jzfg9uLYk7rq5NqgjDMiVebc/NMW5+wUdSloAxifse?=
 =?iso-8859-1?Q?ZcnucjBiBIXHrIjN0ONTiPgfL8XLWnn4bnbtmufcQlCO35iV4iqDMgYbTB?=
 =?iso-8859-1?Q?3yl8c60+rOEkhvbdmNBPrevdHBx5KtL0ccIVMDdv6kVXb8WQMcx8gjlZas?=
 =?iso-8859-1?Q?bK51i5IGOZocYL3TLxHwRr5YZ+jJGVrIrT1Ofgnln3CVvzdXMVUS8CMZJq?=
 =?iso-8859-1?Q?RhqW4pgc6JNkiMYO7gBfEnyeuj1Fe/7EALS5G1QT5LROMAddSU20pksdmz?=
 =?iso-8859-1?Q?n7iWpl994e4SySnSpGKTGAT7c0Q/teU4BWaRSIpw+/FIlwchixerTOBQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6db846-9a5e-4717-e3ed-08dde40cc466
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 19:22:44.2238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0u5nAAz/JkY0+LffFllwSub+01Tl5//x3smLWIgXhBS8UztDAPfRw0wOw+sQUeKAle66xujFiO8hrRTcCpbES/qBaWRtR92SsKXUuZPhzd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB11138

From: Andrew Cooper <andrew.cooper3@citrix.com>

MISRA Rule 5.5 objects to a macro aliasing a function, which is what
pirq_cleanup_check() does. The macro was originally intended to ensure
the condition 'if (!pirq->evtchn)' is always checked before invoking
the function, avoiding errors across call sites.

There are only a handful of users, so expand it inline to be plain
regular C. Doing this shows one path now needing braces, and one path
in 'evtchn_bind_pirq()' where the expanded form simplies back to no
delta, as it follows an unconditional clear of 'info->evtchn'.

While this complies with MISRA, it shifts the responsibility to
developers to check 'if (!pirq->evtchn)' at call sites.

No functional changes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v3:
- added back wording from v1, originally written by Andrew.

Link to v2:
https://patchew.org/Xen/ce37bdf7b5189d314c0f41628dbfb3281358bcf4.1755361782=
.git.dmytro._5Fprokopchuk1@epam.com/

Link to v1:
https://patchew.org/Xen/20250729223110.3404441-1-andrew.cooper3@citrix.com/
---
 xen/arch/x86/irq.c                | 11 +++++++----
 xen/common/event_channel.c        |  5 ++++-
 xen/drivers/passthrough/x86/hvm.c |  9 ++++++---
 xen/include/xen/irq.h             |  3 ---
 4 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 556134f85a..1ed85c0c11 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1325,7 +1325,8 @@ static void clear_domain_irq_pirq(struct domain *d, i=
nt irq, struct pirq *pirq)
 static void cleanup_domain_irq_pirq(struct domain *d, int irq,
                                     struct pirq *pirq)
 {
-    pirq_cleanup_check(pirq, d);
+    if ( !pirq->evtchn )
+        pirq_cleanup_check(pirq, d);
     radix_tree_delete(&d->arch.irq_pirq, irq);
 }
=20
@@ -1383,7 +1384,7 @@ struct pirq *alloc_pirq_struct(struct domain *d)
     return pirq;
 }
=20
-void (pirq_cleanup_check)(struct pirq *pirq, struct domain *d)
+void pirq_cleanup_check(struct pirq *pirq, struct domain *d)
 {
     /*
      * Check whether all fields have their default values, and delete
@@ -2823,7 +2824,8 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq=
, int emuirq)
                 radix_tree_int_to_ptr(pirq));
             break;
         default:
-            pirq_cleanup_check(info, d);
+            if ( !info->evtchn )
+                pirq_cleanup_check(info, d);
             return err;
         }
     }
@@ -2858,7 +2860,8 @@ int unmap_domain_pirq_emuirq(struct domain *d, int pi=
rq)
     if ( info )
     {
         info->arch.hvm.emuirq =3D IRQ_UNBOUND;
-        pirq_cleanup_check(info, d);
+        if ( !info->evtchn )
+            pirq_cleanup_check(info, d);
     }
     if ( emuirq !=3D IRQ_PT )
         radix_tree_delete(&d->arch.hvm.emuirq_pirq, emuirq);
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 67700b050a..a3d18bc464 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -741,11 +741,14 @@ int evtchn_close(struct domain *d1, int port1, bool g=
uest)
             if ( !is_hvm_domain(d1) ||
                  domain_pirq_to_irq(d1, pirq->pirq) <=3D 0 ||
                  unmap_domain_pirq_emuirq(d1, pirq->pirq) < 0 )
+            {
                 /*
                  * The successful path of unmap_domain_pirq_emuirq() will =
have
                  * called pirq_cleanup_check() already.
                  */
-                pirq_cleanup_check(pirq, d1);
+                if ( !pirq->evtchn )
+                    pirq_cleanup_check(pirq, d1);
+            }
         }
         unlink_pirq_port(chn1, d1->vcpu[chn1->notify_vcpu_id]);
         break;
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x8=
6/hvm.c
index a2ca7e0e57..b73bb55055 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -329,7 +329,8 @@ int pt_irq_create_bind(
                 pirq_dpci->gmsi.gvec =3D 0;
                 pirq_dpci->dom =3D NULL;
                 pirq_dpci->flags =3D 0;
-                pirq_cleanup_check(info, d);
+                if ( !info->evtchn )
+                    pirq_cleanup_check(info, d);
                 write_unlock(&d->event_lock);
                 return rc;
             }
@@ -536,7 +537,8 @@ int pt_irq_create_bind(
                     hvm_irq_dpci->link_cnt[link]--;
                 }
                 pirq_dpci->flags =3D 0;
-                pirq_cleanup_check(info, d);
+                if ( !info->evtchn )
+                    pirq_cleanup_check(info, d);
                 write_unlock(&d->event_lock);
                 xfree(girq);
                 xfree(digl);
@@ -693,7 +695,8 @@ int pt_irq_destroy_bind(
          */
         pt_pirq_softirq_reset(pirq_dpci);
=20
-        pirq_cleanup_check(pirq, d);
+        if ( !pirq->evtchn )
+            pirq_cleanup_check(pirq, d);
     }
=20
     write_unlock(&d->event_lock);
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 95034c0d6b..6071b00f62 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -185,9 +185,6 @@ extern struct pirq *pirq_get_info(struct domain *d, int=
 pirq);
=20
 void pirq_cleanup_check(struct pirq *pirq, struct domain *d);
=20
-#define pirq_cleanup_check(pirq, d) \
-    (!(pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
-
 extern void pirq_guest_eoi(struct pirq *pirq);
 extern void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq);
 extern int pirq_guest_unmask(struct domain *d);
--=20
2.43.0

