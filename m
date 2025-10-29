Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A77C1DD4A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 00:55:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153178.1483648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEG0R-00036k-0E; Wed, 29 Oct 2025 23:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153178.1483648; Wed, 29 Oct 2025 23:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEG0Q-00034m-St; Wed, 29 Oct 2025 23:55:06 +0000
Received: by outflank-mailman (input) for mailman id 1153178;
 Wed, 29 Oct 2025 23:55:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xz0O=5G=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vEG0P-0002OI-DT
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 23:55:05 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aff06c27-b522-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 00:55:03 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI1PR03MB6336.eurprd03.prod.outlook.com (2603:10a6:800:139::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Wed, 29 Oct
 2025 23:54:57 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 23:54:57 +0000
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
X-Inumbo-ID: aff06c27-b522-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ht77dcaBFwddSNfHVhoDhL03ltwHNxiWCS1qxJpD11X2JBPy8CSJBYEeLpvzuxFwj9B+Y0HnXkpsE+S/FjoosWzb4IFy0KN1v+jhS8K9fLoYjLK2VMhVIek/vn2I2GTb62dHmzJLKRC3gMINvzhOFCEfjGvW2+LDOMUla510Eb0xDXAgVLb5Wic34kw7fd5gudcGC9NFTR/MEFJTYYJerkUekI5XKQ2tTU2IsHfTHFHXEcLCYhwWkdCVXnpGETbPfMpgPahTzKVPj++7IAPW2RQTGMxstRCH787wBQd69B25VOaRVncwb6VUIHLsGHMu56E/EJn68mUHRaQSuJuLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=il7YhGntNP2H/6iqRFr6trkLVAFYpSgjbytJCfNcxDo=;
 b=Tia7udHTlYMCLactlwlZjB+iwNjdyc/Ma6LWGQh/Pc3nuEeRdDIGfFjLKFFrESOR0VTHM7U/Ww96/MVcNaqG4nNLAlfYppLLtfnf4UZNehQwOipc0XWG12W24CDZArvFafNWx2p28P2W2uSEe4iWTGgdvG8CcFKtqieM3xPoJk+7arYvCJ+0MaDWjBmZLyTUez4UDOfRUv5yTzPFmEKEtSW7QyOb+A4uerKbnPd7kuRidmvIdppN1H+KaQHvvARVFtbk2MYhC2Bw8p5y2P9CoKHbTHUc4WNDLp8oc5RjlBaTGpmXj86Pr2QTBiKsXiyeqo69olibqdJZ7m8BnK/78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=il7YhGntNP2H/6iqRFr6trkLVAFYpSgjbytJCfNcxDo=;
 b=AL3wObV3d+yy5qew7SQvzr3Qw8xrzMiwnn5/EPM7OZMcTiSX9oZv/ENMF6BcATp2Q+nIQcFaLggW4TLO7rjIfUx8945ajG9R8fWl1DY82VQnE8XX8WdCKndrFTDDL/6HvZEHvUC30reDm5FBLTe8sL0YdE9GGG7wKxQD+R6EtLyyd/2YSVeOU6jkLv9bfncCjuYXV8E7uCgs8r+lSXgGYKDD45L2XgKM7E+EP5fiS4gQ6dPvntvKK2YAbq/1N5+eIxFkgm4tLdRdAf/m5J4FDuXtPtK0E7ox7v7fvBpQZxhqt4dyfO34RXZIc2Axfx3n1gyfkoFnBgT92XfdI0D6GQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Tim Deegan
	<tim@xen.org>, Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [XEN][PATCH 3/3] x86/hvm: vmx: refactor cache disable mode data
Thread-Topic: [XEN][PATCH 3/3] x86/hvm: vmx: refactor cache disable mode data
Thread-Index: AQHcSS9ubBvE8ofkdUWCspcCjT9/kA==
Date: Wed, 29 Oct 2025 23:54:57 +0000
Message-ID: <20251029235448.602380-4-grygorii_strashko@epam.com>
References: <20251029235448.602380-1-grygorii_strashko@epam.com>
In-Reply-To: <20251029235448.602380-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|VI1PR03MB6336:EE_
x-ms-office365-filtering-correlation-id: f645fb71-d978-4838-cd34-08de174690bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7tyB1sSsCwWzcaYSGHa7PC89goEy3ZwJqYuoHz4Xr0w5wDn3YvYxQrlk+P?=
 =?iso-8859-1?Q?SyaznnWdKF2Fetd1tcx8tbIfy+3j9pESuSrjEohAK1dgnSI5hGbiHflYga?=
 =?iso-8859-1?Q?LzxaM3YtbvKV4SE1LeaFC17eUms/j4Cav6cjZYXHCY4v/I0801y8aKTgXq?=
 =?iso-8859-1?Q?shC9RkWwjLD6PeoE1PIs9GdiWhKRr2YJLPg3CgH+bILFambGOQztJAJPpF?=
 =?iso-8859-1?Q?fxP2NtCjiVsOu/m/RzyHoUCzDZPycofagZg7tjePAcLnNRwlCtsMZq9X4Q?=
 =?iso-8859-1?Q?BNjIdLUX4GJJ+zbDMJqD9x3sX7Bo++tUYTymGNI/xIwitfaallvM9L/csf?=
 =?iso-8859-1?Q?NIm13UH9mNGiJ11nwpk0fbm621p/va5ciuqNxEVLW/RDkwlGw4ixhNzVwB?=
 =?iso-8859-1?Q?A8taapZHvc5sHwT8pAJWB1TDtoKd+AFwCFv0YTCxFSUJ1MgtQ4lgon58sh?=
 =?iso-8859-1?Q?YxhvcIQ/rPx0WvLbdRQKrv5aZUKHhVP/Dkt6GqcS16WDp3MXqQEbm6ijxd?=
 =?iso-8859-1?Q?iSiDsKChHmOI4WJubG/GGezi2RoMp/Po7ZSaDRmb1WeQXdh1Fc7MjTfTlH?=
 =?iso-8859-1?Q?Ben0wtZOLt/30j4Fgx6sZWWnd9UhTAIRCWhbCoo8hhf1Le/Av2FMqxxa6g?=
 =?iso-8859-1?Q?kMwVvi74WFURgK62ANliVN2NyfhGalrYh9/Dw5y05ENUfcNAy3q306oEv2?=
 =?iso-8859-1?Q?/KAewb5xw9FAIuGPkg201rqrVsJVzZ4/+b3F64DME71HwvXwwOjBfNX186?=
 =?iso-8859-1?Q?dSAmdjFHU+urLn668daEIgnscNSRSQ4COIBshu2iMPyqbsraecZ6igS+4s?=
 =?iso-8859-1?Q?EBTrWqKGc57hOq77Zcyoipe+VhwCIS4AEktp2qjzh4hu/oyf2xbkEUr6Sa?=
 =?iso-8859-1?Q?Aq0Chmv88hrTUiwSQERYaMRxkWTyTm/Ba1lC2e6BDvJRVlJG1skxk9Sivk?=
 =?iso-8859-1?Q?lHJQScsLDu1hVjUzTkWNgve00Go4nIvWq3AgH5bPXfDsydrXTLfkurTPts?=
 =?iso-8859-1?Q?lQ5TyhsCfhJDa0mQAnmUZ31JDV4T02CVGf+Bzukh87BePb9BgE2uA0vI8+?=
 =?iso-8859-1?Q?Vem3H/XZglbzHIeJeeV9mUUKB2j7PPxD2ivTC0oB2auEq6F8bazAxCb0hG?=
 =?iso-8859-1?Q?GVM9kIfpdKEpOp1a2ZjG1lNw2d2djudBlcAwIXRaBeEJo3qbOLo/GY2KOQ?=
 =?iso-8859-1?Q?N+lqTwiF6F5IDqvfpXYkl2FHCo8dhZNh1LaQXmv1nUvEPM9ZtasghL7OMj?=
 =?iso-8859-1?Q?CkDsnVMvcCtiMXcSKaw0iOqAnmPauPv9kHiuxkJGFg8CWOAOeWVI3v3xoS?=
 =?iso-8859-1?Q?xRq5WqAE8+vF8ll1PjbRNNecUGBbXKguc1I1DtvE1d6XcGSJkWgM1VkcWl?=
 =?iso-8859-1?Q?F7aCAx+6PV4PCmALtpbW8gx4mIW+Khjzu3/E9nBeEP4tTEMcBHSe9zpTPq?=
 =?iso-8859-1?Q?uwHPAKLmb2IbBYcamWoo9ne55qKS/YgVPTP5Hpgfhap4aZNDQbdIsncyh/?=
 =?iso-8859-1?Q?R25XAOeTDUEhEshKNKIBS0+81vyVc7GYKX6sHKNukN9B9rzbg3FekN9WL3?=
 =?iso-8859-1?Q?4CHC1/dWegpTCEaTQ+CQuNI9Gf2M?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?EdMDITq49WLRWJMlKr8eTu0U5aLNDFTWG4J2QjXdRivVxNKcro4lBnJPfX?=
 =?iso-8859-1?Q?lOatSkg6LvDudUYEbqktxIZWUDm3TAS+Pz306EgJ95Ny7NTWMisZVp0WY8?=
 =?iso-8859-1?Q?3l8bGLEbCtlfWTQG4vMMdgx2iNuiX8L4S/CsfrksaoyCG3k0g+MqNfPhG2?=
 =?iso-8859-1?Q?kFlYYS8vvi8tgUPxHJ1Jyk2CArkh21tg1HRAxmUFTLSA5zTQx5JEkGc5rh?=
 =?iso-8859-1?Q?tGpk2T8GhuYM1uMgXchgomfL9yhg+3uH/tsld7BKXQSKAl0Ic0RGdp+N45?=
 =?iso-8859-1?Q?g5YYFKtNef4qZQBHHlRe5aItVYFcIvBqnUPfEK5xLxvUK6GbE5QUQqcotY?=
 =?iso-8859-1?Q?09GfIjS7sGvKWWrQcqtp0g/l5Jr1GQ9Gkqsyyw6pomo8jBWGHu0vN3FEhk?=
 =?iso-8859-1?Q?y+Y+o7QPwYO9fygy/JrphcoOjptGWKVPufNaCd14ymf3QPSZ/LkrbP8akA?=
 =?iso-8859-1?Q?ePQzN8pudwAZdwcDJiHXZ8co22Bvkvj1Vu3D6BFseesij1B6TtSmq8T/Ml?=
 =?iso-8859-1?Q?gnoYpzZa0I5loZHGiwQbgLOFGSLwcMGCwod6T7XGeym9JKm7nX5ftCT8FK?=
 =?iso-8859-1?Q?5k87vprql9TTCqdMiLG3roVUcj++ALbi3YwPxVsNy4GAJPFUvxJdsxN3Fq?=
 =?iso-8859-1?Q?dA3adR+DSIYJAbs51TPEDmZ5qhcYGkgDY2hnBlV8HBiQIHZJv01gocvQF8?=
 =?iso-8859-1?Q?arycHMIHGYVX/gb81hXLYVnzL6PLX902zyr85doeORm29qlmVNjR7Txp8i?=
 =?iso-8859-1?Q?MSI2XQQq0iXHtTvyOVMyqhrc2WJeaOCFZTQ3zct9YHqjT/8msuEQrWbCjh?=
 =?iso-8859-1?Q?T8lERQLAUg/88ExzswO9FXCUfctG4GH3E3r84V0dHjFsyzkmb1sNN7UmXc?=
 =?iso-8859-1?Q?O4vs3JPvjWvOEtxhuLdShlbz1NDL3HpP4hCSra/1YTxlhyrCWoMhRKihcf?=
 =?iso-8859-1?Q?64D+8mZaCOjjfWF9HeRhq46hL2F9Oxwy17O01PsaVQGRT+/IhFKPSaPrOG?=
 =?iso-8859-1?Q?eZMscSEBeex4U2MsawQO4vQS7khajndsfUOPiGYXCha7V/9NmfVbOqCB33?=
 =?iso-8859-1?Q?jqyBz7/x0gG/zrxL1bDoZluFWVilWlOlX2/QrB3NdpjC5ujEL4jZiBBMmQ?=
 =?iso-8859-1?Q?UL1kQj9YQkOhQRf8P49R7UWTq+on7j1Pj7w4+Q0ocp9CVm4M09JquT0exZ?=
 =?iso-8859-1?Q?NMwwY3BVTJL5t4Y2QXtkLjp6GSPIj1WeoK5AcYb5VM49z7CT13uG9LtVvZ?=
 =?iso-8859-1?Q?fZQDjtcKT6NsD0xoHQI2O3P2pg9tZ2hYWCQ1ALPZOqoD/QfAhmyOnC1CgB?=
 =?iso-8859-1?Q?0Qx3bn/KoMS1nEO6T5ND0ED20iX8hioJwTLf6WshlWLw/s0DMKuXjIyjZQ?=
 =?iso-8859-1?Q?jws3uNraG7jtnQ84UTvndASdc8caczdJ1Wu0rQw8wvNBtfxFbPYLn4qhzY?=
 =?iso-8859-1?Q?hfZ1D90gCMO+MdEGD88pPw097DaXCH1DTAZvJl2Po8uUgNbotkKLazbXqR?=
 =?iso-8859-1?Q?Rxg/d4VJPHwY8SaAoPrySqY1KUh3GuG8k78AEQHlIIZwTkdDR5b85usizr?=
 =?iso-8859-1?Q?dJF/bYaczRKQdKxLS2EeJeLlDtk8XlRyHr3RN5FjQxaeBTEYgsTS0Harwg?=
 =?iso-8859-1?Q?/YX7Hsl3jsz0/a+rCBEyDZkyqU0tLaLo3lAJI3t5sEx8rn2Bu7NTB4wZTX?=
 =?iso-8859-1?Q?6TZwvVQ3YBfIMEyKh94=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f645fb71-d978-4838-cd34-08de174690bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 23:54:57.6530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YMQctobJpjVCtVOPz+07f8WqMwI3HX+MNfLxGvYgKY/mSl0q9HKgfQDceVeepVZzYYuoVpGEf5n3eZMjv9PTdWKGzBeVSECqQPoqVlJaLco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6336

From: Grygorii Strashko <grygorii_strashko@epam.com>

The Cache Disable mode data is used only by VMX code, so move it from
common HVM structures into VMX specific structures:
- move "uc_lock", "is_in_uc_mode" fields from struct hvm_domain to struct
vmx_domain;
- move "cache_mode" field from struct hvm_vcpu to struct vmx_vcpu.

Hence, the "is_in_uc_mode" field is used directly in mm/shadow/multi.c
_sh_propagate(), introduce the hvm_is_in_uc_mode() macro to avoid direct
access to this field and account for INTEL_VMX configuration.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/hvm/hvm.c                  |  1 -
 xen/arch/x86/hvm/vmx/vmx.c              | 29 +++++++++++++------------
 xen/arch/x86/include/asm/hvm/domain.h   |  6 -----
 xen/arch/x86/include/asm/hvm/hvm.h      |  3 +++
 xen/arch/x86/include/asm/hvm/vcpu.h     |  3 ---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 14 ++++++++++++
 xen/arch/x86/include/asm/mtrr.h         |  3 ---
 xen/arch/x86/mm/shadow/multi.c          |  2 +-
 8 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 9caca93e5f56..c09fb2ba6873 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -608,7 +608,6 @@ int hvm_domain_initialise(struct domain *d,
     }
=20
     spin_lock_init(&d->arch.hvm.irq_lock);
-    spin_lock_init(&d->arch.hvm.uc_lock);
     spin_lock_init(&d->arch.hvm.write_map.lock);
     rwlock_init(&d->arch.hvm.mmcfg_lock);
     INIT_LIST_HEAD(&d->arch.hvm.write_map.list);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 05b394840e59..23dbf60ec37f 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -583,6 +583,7 @@ static int cf_check vmx_domain_initialise(struct domain=
 *d)
     int rc;
=20
     d->arch.ctxt_switch =3D &csw;
+    spin_lock_init(&d->arch.hvm.vmx.uc_lock);
=20
     /*
      * Work around CVE-2018-12207?  The hardware domain is already permitt=
ed
@@ -1432,7 +1433,7 @@ static bool domain_exit_uc_mode(struct vcpu *v)
     {
         if ( (vs =3D=3D v) || !vs->is_initialised )
             continue;
-        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
+        if ( (vs->arch.hvm.vmx.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
              mtrr_pat_not_equal(vs, v) )
             return false;
     }
@@ -1442,7 +1443,7 @@ static bool domain_exit_uc_mode(struct vcpu *v)
=20
 static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
 {
-    v->domain->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
+    v->domain->arch.hvm.vmx.is_in_uc_mode =3D is_in_uc_mode;
     shadow_blow_tables_per_domain(v->domain);
 }
=20
@@ -1451,10 +1452,10 @@ static void hvm_shadow_handle_cd(struct vcpu *v, un=
signed long value)
     if ( value & X86_CR0_CD )
     {
         /* Entering no fill cache mode. */
-        spin_lock(&v->domain->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
+        spin_lock(&v->domain->arch.hvm.vmx.uc_lock);
+        v->arch.hvm.vmx.cache_mode =3D NO_FILL_CACHE_MODE;
=20
-        if ( !v->domain->arch.hvm.is_in_uc_mode )
+        if ( !v->domain->arch.hvm.vmx.is_in_uc_mode )
         {
             domain_pause_nosync(v->domain);
=20
@@ -1464,26 +1465,26 @@ static void hvm_shadow_handle_cd(struct vcpu *v, un=
signed long value)
=20
             domain_unpause(v->domain);
         }
-        spin_unlock(&v->domain->arch.hvm.uc_lock);
+        spin_unlock(&v->domain->arch.hvm.vmx.uc_lock);
     }
     else if ( !(value & X86_CR0_CD) &&
-              (v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+              (v->arch.hvm.vmx.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
     {
         /* Exit from no fill cache mode. */
-        spin_lock(&v->domain->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
+        spin_lock(&v->domain->arch.hvm.vmx.uc_lock);
+        v->arch.hvm.vmx.cache_mode =3D NORMAL_CACHE_MODE;
=20
         if ( domain_exit_uc_mode(v) )
             hvm_set_uc_mode(v, false);
=20
-        spin_unlock(&v->domain->arch.hvm.uc_lock);
+        spin_unlock(&v->domain->arch.hvm.vmx.uc_lock);
     }
 }
=20
 static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
-         unlikely(v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+         unlikely(v->arch.hvm.vmx.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
         return 0;
=20
     vmx_vmcs_enter(v);
@@ -1495,7 +1496,7 @@ static int cf_check vmx_set_guest_pat(struct vcpu *v,=
 u64 gpat)
 static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
-         unlikely(v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+         unlikely(v->arch.hvm.vmx.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
         return 0;
=20
     vmx_vmcs_enter(v);
@@ -1541,11 +1542,11 @@ static void cf_check vmx_handle_cd(struct vcpu *v, =
unsigned long value)
=20
             wbinvd();               /* flush possibly polluted cache */
             hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TL=
B */
-            v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
+            v->arch.hvm.vmx.cache_mode =3D NO_FILL_CACHE_MODE;
         }
         else
         {
-            v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
+            v->arch.hvm.vmx.cache_mode =3D NORMAL_CACHE_MODE;
             vmx_set_guest_pat(v, *pat);
             if ( !is_iommu_enabled(v->domain) || iommu_snoop )
                 vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/a=
sm/hvm/domain.h
index 95d9336a28f0..83be2bd1c29c 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -97,12 +97,6 @@ struct hvm_domain {
     /* VRAM dirty support.  Protect with the domain paging lock. */
     struct sh_dirty_vram *dirty_vram;
=20
-    /* If one of vcpus of this domain is in no_fill_mode or
-     * mtrr/pat between vcpus is not the same, set is_in_uc_mode
-     */
-    spinlock_t             uc_lock;
-    bool                   is_in_uc_mode;
-
     bool                   is_s3_suspended;
=20
     /* Compatibility setting for a bug in x2APIC LDR */
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index 6f174ef658f1..ce31401a5d53 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -392,6 +392,9 @@ static inline bool using_svm(void)
     return IS_ENABLED(CONFIG_AMD_SVM) && cpu_has_svm;
 }
=20
+#define hvm_is_in_uc_mode(d) \
+    (using_vmx() && (d)->arch.hvm.vmx.is_in_uc_mode)
+
 #ifdef CONFIG_HVM
=20
 #define hvm_get_guest_tsc(v) hvm_get_guest_tsc_fixed(v, 0)
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm=
/hvm/vcpu.h
index 9ed9eaff3bc5..eae9ac53767b 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -168,9 +168,6 @@ struct hvm_vcpu {
=20
     u8                  evtchn_upcall_vector;
=20
-    /* Which cache mode is this VCPU in (CR0:CD/NW)? */
-    u8                  cache_mode;
-
     struct hvm_vcpu_io  hvm_io;
=20
     /* Pending hw/sw interrupt (.vector =3D -1 means nothing pending). */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include=
/asm/hvm/vmx/vmcs.h
index ecd91389302c..44a535d16207 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -46,7 +46,9 @@ struct ept_data {
=20
 #define _VMX_DOMAIN_PML_ENABLED    0
 #define VMX_DOMAIN_PML_ENABLED     (1ul << _VMX_DOMAIN_PML_ENABLED)
+
 struct vmx_domain {
+    spinlock_t uc_lock;
     mfn_t apic_access_mfn;
     /* VMX_DOMAIN_* */
     unsigned int status;
@@ -56,6 +58,12 @@ struct vmx_domain {
      * around CVE-2018-12207 as appropriate.
      */
     bool exec_sp;
+    /*
+     * If one of vcpus of this domain is in no_fill_mode or
+     * mtrr/pat between vcpus is not the same, set is_in_uc_mode.
+     * Protected by uc_lock.
+     */
+    bool is_in_uc_mode;
 };
=20
 /*
@@ -93,6 +101,9 @@ struct pi_blocking_vcpu {
     spinlock_t           *lock;
 };
=20
+#define NORMAL_CACHE_MODE          0
+#define NO_FILL_CACHE_MODE         2
+
 struct vmx_vcpu {
     /* Physical address of VMCS. */
     paddr_t              vmcs_pa;
@@ -156,6 +167,9 @@ struct vmx_vcpu {
=20
     uint8_t              lbr_flags;
=20
+    /* Which cache mode is this VCPU in (CR0:CD/NW)? */
+    uint8_t              cache_mode;
+
     /* Bitmask of segments that we can't safely use in virtual 8086 mode *=
/
     uint16_t             vm86_segment_mask;
     /* Shadow CS, SS, DS, ES, FS, GS, TR while in virtual 8086 mode */
diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtr=
r.h
index 25d442659df2..3a5b4f5b6eec 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -7,9 +7,6 @@
 #define MEMORY_NUM_TYPES     MTRR_NUM_TYPES
 #define NO_HARDCODE_MEM_TYPE MTRR_NUM_TYPES
=20
-#define NORMAL_CACHE_MODE          0
-#define NO_FILL_CACHE_MODE         2
-
 #define INVALID_MEM_TYPE X86_NUM_MT
=20
 /* In the Intel processor's MTRR interface, the MTRR type is always held i=
n
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.=
c
index 7be9c180ec43..03be61e225c0 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -559,7 +559,7 @@ _sh_propagate(struct vcpu *v,
         if ( !mmio_mfn &&
              (type =3D hvm_get_mem_pinned_cacheattr(d, target_gfn, 0)) >=
=3D 0 )
             sflags |=3D pat_type_2_pte_flags(type);
-        else if ( d->arch.hvm.is_in_uc_mode )
+        else if ( hvm_is_in_uc_mode(d) )
             sflags |=3D pat_type_2_pte_flags(X86_MT_UC);
         else
             if ( iomem_access_permitted(d, mfn_x(target_mfn), mfn_x(target=
_mfn)) )
--=20
2.34.1

