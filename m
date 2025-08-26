Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40A8B36762
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094541.1449919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ9-000165-1o; Tue, 26 Aug 2025 14:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094541.1449919; Tue, 26 Aug 2025 14:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ8-0000t4-HJ; Tue, 26 Aug 2025 14:05:54 +0000
Received: by outflank-mailman (input) for mailman id 1094541;
 Tue, 26 Aug 2025 14:05:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqrf=3G=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uquJ4-0007NC-1o
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:05:50 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4591b08-8285-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 16:05:48 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAXPR03MB7887.eurprd03.prod.outlook.com (2603:10a6:102:216::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 14:05:40 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 14:05:40 +0000
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
X-Inumbo-ID: c4591b08-8285-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzo4aWxaUGhxVolxVQAnEwC/JrftSL13Q1NESg2eUNg8CooFfyuHaYPmdyhEm038t6FJO6QJBIgfuKqMeOI6P3+97R3J6eTWE/GKQ3cVy3TSviz98hiMpmQFIPOr3LlpS+y/80M4AuoLJeeMaSZ7MnbYVlDgLwBPhl2TUMCT/F9uZHf6DhXH5OGW4baK1kEp0AuHHgQpXqM2Ex/hGW0EVy44BO5nnCSUlLRmu483ZqH8oKJYfwRToQ3AkZXKtIpZsHXfd31fwWIs/gRN9TLw95JxBClCtQkBv0Jp3jL/cwS8kfclkceX6YjSa2iwt1poP3M8xP3SUamCdlhc6qE0tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6MIjZW1CBjFKc4mIxF2/dfXj2CJ3BIGOeBCmG7IwAA=;
 b=uK/UYfL/maBMBLuy61KM22CQPeYeKv2+YZJXQ8BlQctfkqPP8l1mEbIiom+o0LwyDnzNQ33/AdHlfuyN6+5Z1dOaTX6U1UMpHKwXN+SO2sd10NGa1UbN2U4/UMyLGfvfXBEn9afrXvZXlgZtuiw0lyk/TjJytgeDVulheTvYsMTir03oDSddyblgrrXjqhX/jZ2iRqpXmAlEyPvywn4DZ6X6MQi7jcy12DwxF9KEK6Z178V47LT9fMX7HCzHigf+lNN6Nu6KUcKE5B1IRxhMkes0PG4j88iA4spbrYw2yXdlp59Xo2xYCqmYClJ6D8qhFtydTsgqd2PucPq2dF2JfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6MIjZW1CBjFKc4mIxF2/dfXj2CJ3BIGOeBCmG7IwAA=;
 b=dMq7/BYEjAYr8bcctVqHAQhd+awoJfLMCTO8Z9RuxnWfEWkhCdd0UTdCnre2CRLWNLA13/jchcU7y9WfqdRrXBMjFjtKXJFhCMkdvoNq/7K5D+D9eiwhJhy22UuU5+/de8kqhdmMkR0pMfyUtByfclXYiT9OhFopP3SsXXycTxf6pfr957iH2rkVTj5sKETMPZFjzxEUwVfQPMd+XwI7T4tfcKgftARFJ4ejOCAqFbIiv3tl9sSoz+O48l8AoCXZ/6F3zmK9LL6wIvlVivQLDjp8jkEx85diqedhGoUBDCC1tXoj3Mg65cN9F/F3MuFaLD7xBp+RcY0qxZuGC1JCsA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v3 11/11] CHANGELOG.md: add mention of GICv3.1 eSPI support
Thread-Topic: [PATCH v3 11/11] CHANGELOG.md: add mention of GICv3.1 eSPI
 support
Thread-Index: AQHcFpKAJEYb0CN0HkuGQwymf9ybDQ==
Date: Tue, 26 Aug 2025 14:05:39 +0000
Message-ID:
 <9dc68c29751aeacf37b51d3bd345e87e9a0f0ccf.1756216943.git.leonid_komarianskyi@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756216942.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAXPR03MB7887:EE_
x-ms-office365-filtering-correlation-id: c1a27202-e1a8-46d1-4eb9-08dde4a9a3cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?b5NXHdIuGZ62PJ1RrfdqFNMoMk7V52jg50l67Q4PVTRO3KWpuLhMGTB5sy?=
 =?iso-8859-1?Q?SSX/ceibIjU/o27BufCRBiMNWU4hJ/zAnbtyml8ojSTwWFwah8dgRXAw9I?=
 =?iso-8859-1?Q?rQ+iFfyRGa0CxhOOPXh6joJrfpAj3Lkpr7TZdoUDzOpk3IFHawn3l0ZEfN?=
 =?iso-8859-1?Q?jxeIU66MN4wbeL8cOyiJgCoOi0TndlAxzJudWFczKPk7OBImrFij2N9cFf?=
 =?iso-8859-1?Q?AuL+9sMtt2b1T6dL88OpJNddDxyEq4r4uLPrrWJTpgoq7ote+3hgNBBfEx?=
 =?iso-8859-1?Q?JeZertfU1V3Xeh4pWvu/WxZ+tj37rieVd0BmCwWe8WI48WFSzGmnciAjKp?=
 =?iso-8859-1?Q?aZRJlu9mFgXPFKObRxygSMvVr/2Jg6RdhA6XP0G00CFS7wgeRCgqv9zXoI?=
 =?iso-8859-1?Q?7KFClWKPNrBwX0nJrwzLSey+17u5qoXgj2ZCtj1FLDS67zMOLkGjicq9Gb?=
 =?iso-8859-1?Q?gXpTU/gkZ33jUhCqDwb9gr8Hv789ZGwnkKQM95sTsDMttwG9LBu/Hp2Kt7?=
 =?iso-8859-1?Q?jpSvIppLt8UY0HG0uNrwwWJz50xNQMblWiKzv1PQCT5f1ex8Kmd9PyzNhr?=
 =?iso-8859-1?Q?DYSWPnmhoQ25elZOTnp2KKJ0hebSAUhbSBA6W90x0l2vuf1wD6xXp43mlw?=
 =?iso-8859-1?Q?PMWy36kJS8XZ7a4jffcTNl/QEOq3yodWg5NsxxFAq5cLShqWvb5b/2fqIf?=
 =?iso-8859-1?Q?Y99vGKuNz2+gLDinar2HtBnJRVIDL5sfMPdN1sZnaAfyVyqw1Mdpiku2SO?=
 =?iso-8859-1?Q?rlnrC2gB2eBdwzPBIEAV4b/cbRD6vhc5Ltalok5DteO3DYOLCvyWywkM8d?=
 =?iso-8859-1?Q?F5yskBdB5oL/4HV6+emjBMEcBs+rzuM/74aUGg6hR1ajsciqZtz/44C9Y1?=
 =?iso-8859-1?Q?I7Q9XwJLkuR0mH2rbLnCw2SsDlWj2XPYeUW95tmOOrzAN0yVrgZFauyk5w?=
 =?iso-8859-1?Q?9y5ZoEMfo/dWLsfR2yKl3AgPyFBlK5PM3pimrgeV0ZizteO2fBlBloYrYt?=
 =?iso-8859-1?Q?9amtes7fkFVeOKdGXlg3jGkf5O02sZCPHtHj2S2lmL2mr4EwWVzXUWsuwe?=
 =?iso-8859-1?Q?NF2zVdyZam+TmI9P2eA/5JTcDl+xamYDe0L7PiEDSdq4tFcy7hwUCgb5lM?=
 =?iso-8859-1?Q?fv552biq4pdiIIzYXsvffwpvJOK5RPi3V58yO+P1JfvEYywIo5E0voccK4?=
 =?iso-8859-1?Q?PriBdDFVKKvio26Qwrbvlp/v29y+f1MMeXLUFYcWu4qIdDBw9JfIqRtY+K?=
 =?iso-8859-1?Q?xQLUIha2EVsFlF/DT8Zm92bhCcIlXMq4NNr/A6KDbOaIOUO/8kFT9yK2a2?=
 =?iso-8859-1?Q?wUeK/6QcKhFI15GUm5E4Cf217MhIyhUoQCyQVL3jYTAhZvfmcK+VR3BDYN?=
 =?iso-8859-1?Q?7YRFJObZY3iqMF7gLGWL2Ozq+eowYB2nUqlBF6uFgch/3sSK0+Nlly0gZM?=
 =?iso-8859-1?Q?T2Z6c4FqsgVKfB73T0VdXDwrc1uxoD2Vgwl8Vz4upHXIQBro4Qvcnv/3bx?=
 =?iso-8859-1?Q?4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Pr1370XKvzkRRP1v5j6HXbX+Tv5fRaBglc27rtBBqJPyUY/rMvos2afomT?=
 =?iso-8859-1?Q?7KG47BMJOCitdfBFSqp2BxR2+VZNfwYm1xPkYpdWd64oqGqBhtYayZMkxU?=
 =?iso-8859-1?Q?gegRsnEtQ+gMjOH/LHhTvC1sTIqLZQhFliI/t51MoLRMN4cN1/Wh4IS8Vx?=
 =?iso-8859-1?Q?uiVnPsh5MI2lF4YpEUlborPR5ZpZSoWBRUWfsVLDxzpMTCOBC5eXa+BGwH?=
 =?iso-8859-1?Q?9TM7wd2xKIGGV/9g+p57rv2oyy8cNf6/akCv1kQB6aQzuDLn0ikOtGuT82?=
 =?iso-8859-1?Q?zQWIKxm3SKN4zkgxUL8f9U1+2uMoSBkVKBvaruEr+AMbumgoXcYiXR3UCB?=
 =?iso-8859-1?Q?i3X9qS4NSh+kEmBy41BEntHKX7dYtdwFkZOgqY0i5U+E3oqtCRyHIOTTdU?=
 =?iso-8859-1?Q?W8/21W61ZsY9OYfwiiUjBfzHQFCpYkzQbf8wBvV5TQPNDJzZPNsyjTj4PZ?=
 =?iso-8859-1?Q?BuclhiN5HfEyPrvm+NlLrelp8sHwZq5cLoF8PxKPfINXVrXB6UKA+fyp7G?=
 =?iso-8859-1?Q?jT2mZGn1/cCoWxuPB9KD3bGOYqW+wEw1Ym7TRfHt8/DcSqn/i4wnMt4zsS?=
 =?iso-8859-1?Q?BIlW7v1nqU1eOofWnTP0a3wku2qIxV0x8PTez2eNJAiw9HGp+srRIj1BTW?=
 =?iso-8859-1?Q?vyTzKAzQaU/0xKMfl+LLzHWjeKufwoA9+1QYk+lIyHXLghQpQpL9usL13X?=
 =?iso-8859-1?Q?ZH/oHRH03PrYMlBS4IsE2FZbZzzK+8PXAOPAKkPqxXQZMGd513aG7vCxXF?=
 =?iso-8859-1?Q?NqzM6vM686r8dNC6Be+GbcTfwkpIl7wU9e12EzK+kBLUYTTQizp5jgJjsh?=
 =?iso-8859-1?Q?OleMZhF12yvNq3BnIiCeeieWLhOaECRhOV4gIqImeNYX1uZB+wke24Fb46?=
 =?iso-8859-1?Q?7mvJVvfAuvr+0LnoggHtBbYixIdHSoTcnZr3k6AWRPIA3uP3Xn7zQ3cUjn?=
 =?iso-8859-1?Q?vmyvnucWNasGsmmVkq2PtvEDLYZs2DzroHvdMxsr6ovccFQ9NCqPTGqETH?=
 =?iso-8859-1?Q?PcDBNHTNjKpf8+7P2fhURQeJSx54OKFrG6QPNf1fKir+uATWQ66faGD7QU?=
 =?iso-8859-1?Q?0uLJnhrJmWzYbyqCziN8Nu7eujesFr62l1TDNN92F8AYAoBt6bePbgF85g?=
 =?iso-8859-1?Q?n9Q7ZBAhMEXa03itC+XMU5VxyQQp0eqZ8xRU34yAVB0gQMJu9Gdcsc3PlR?=
 =?iso-8859-1?Q?9maKvDUz6eXlyRomPOvzeSeJv7KqwBDWJYht5OYdjkYrVlN9QfTbMZuNrj?=
 =?iso-8859-1?Q?bzr3KIA/+/fthOA8MlBKqr+RQ54E5+u7L2RuvhVnRZdNX0OGsfz/iedNzt?=
 =?iso-8859-1?Q?pq2RmOoDiPUoRZ41lAT6ABEtWAn/5H+TFPtCmYGUJr/kmGuH6eYc1FWeo0?=
 =?iso-8859-1?Q?o9tNkkAKO08+oduOZTHjLcQ5Py32piFvplNULAwsjaypNObMWyUf6uIDAd?=
 =?iso-8859-1?Q?CWuIYBliVFT/Gi6DxXIljVe6gl7c7J5hd91muAN58W9eflqfrHgW+J63bE?=
 =?iso-8859-1?Q?CFRhw6J4JLO2HdHGP/TGTFun3rEGglS1U3PGlQeLaBP6RYQ9Ep/bxgtPTE?=
 =?iso-8859-1?Q?QvAV5smfovU8wp+b70aQdHsMeUl28SvEdmLrFf86I7W05GRcUXE1EzoD6A?=
 =?iso-8859-1?Q?GMeLv14q2mosHplnhBti1PunAlceacCGiC3h80UnOBGeetVtvWc6AvyXEJ?=
 =?iso-8859-1?Q?49vyOkYBgseZs6VwTlk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a27202-e1a8-46d1-4eb9-08dde4a9a3cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 14:05:39.7788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8KsEt+hghwNj0IN3SCqvC8lVs0pFaLtNx8D78EE3sBzQWUPn4xsOZSG2ZgcnNEyMFHA1jwdE/3uxCq35CneJKgIYwA28hwijKRVhcQV/Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7887

The GICv3.1 eSPI (Extended Shared Peripheral Interrupts) range is
already supported with CONFIG_GICV3_ESPI enabled, so this feature should
be mentioned in CHANGELOG.md.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V3:
- introduced this patch
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..dc34d29d99 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -29,6 +29,7 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
=20
  - On Arm:
     - Ability to enable stack protector
+    - GICv3.1 eSPI support
=20
 ### Removed
  - On x86:
--=20
2.34.1

