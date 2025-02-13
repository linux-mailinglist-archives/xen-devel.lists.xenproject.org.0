Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1784A347C9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 16:38:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887826.1297291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tibHz-00009T-Hv; Thu, 13 Feb 2025 15:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887826.1297291; Thu, 13 Feb 2025 15:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tibHz-00006U-EB; Thu, 13 Feb 2025 15:38:07 +0000
Received: by outflank-mailman (input) for mailman id 887826;
 Thu, 13 Feb 2025 15:38:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bb01=VE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tibHx-000853-Vf
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 15:38:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2614::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83bfc019-ea20-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 16:38:04 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB7030.eurprd03.prod.outlook.com
 (2603:10a6:20b:295::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Thu, 13 Feb
 2025 15:37:58 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 15:37:58 +0000
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
X-Inumbo-ID: 83bfc019-ea20-11ef-abfc-e33de0ed8607
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bl5ebXVtgIhkPMEwNgHsOof++VfPRAA2ThrYaEK8VBybKn3hR/Ea93U9qHuX+tJ3hkgXNNMeJNeA8SkV6h4ts0+BrBgtoh/eeJNFP3gnAJaQf7TKYylaGhdvYbJoLY7jxR/KKfb7QAgTiVPxFS3RjnkBtvXHCPLxNoEwsTjcQ0T9N1J9+ddkXRLrcatgMlfkWmlqOQzfxu7L3PM6mcKHkJre2o7bHFUvFo1STViwf6vTItruxl56rL17G7ndl99xMv/E+LhQexe6KcL+t8SSwTBE3qRh8Pq+fjDk/F7Az5rOA8/kyw8tZ+Ao+XPiWRzueZnbezx2U7gpKRzFKp5tgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lUWhDpk9z4EobijUnTQ7RN6XrcUJy+kCom73IXEI2I=;
 b=sEJfZL+ygAgiR6OUfcNsFhPyUM0LIrBZmwjgtMeriyQOfr3cd73TfmLxSHHypeC4Tj4FNTtmQclC4Wq+4z+1/rTaTqad+jrGXZu2vXbloUo7gZOaGFOyBKfCKyAf9c33dIorcDwjGWstsKjVU5h56+F5QjJ++MMiDiBJdN/XChEFR9ziYN3EF3C2ZVKK0DAuP7CVWZzjQjAjlgh8gF9wA/L6rXcQ7ub4nOP8qxLgIzGtV249nQ5hV4rSvaxsbWkzPOs8srbuSHx1rzO9R4VpB8vX3Za7u6whM4EuNFOMQpMVsFukRpOa8ofAXNuEqsIKytYHOTf24m7m7HVTWFYEgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lUWhDpk9z4EobijUnTQ7RN6XrcUJy+kCom73IXEI2I=;
 b=U58N3qkfmEWu46XZHXxAEk0bvf/oQgRiWMKE2yIzuDvxrl8PABkQ7b2BFL1GCH//AyyrjuAqz4DomUm0cmUHADRG8CD87QTrBAiCZ9/WoQCBlbx/mSesCma8FqppIqavNcMB8ACdNfC1/jVqPW2vXJZoAwzybRmO1B0LoKX+V49fq3I+rWs9gvZ/Qtd2KXuLjbRlUI7lBgfB2Io55hPNJuXDD04oQeazYMkDO3AHjC7krw/bloUfbXMhjRXHk9foYe7nF15G3U4+kpu4yifm9Q0pkALwDr0VUhe+t5T7jtgpepeZt0QxAzBfiD4CBQzAzUo3bJEcNyo/jOdPswl0lw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/2] arch: arm64: always set IL=1 when injecting undefined
 exception
Thread-Topic: [PATCH v2 1/2] arch: arm64: always set IL=1 when injecting
 undefined exception
Thread-Index: AQHbfi0/n6EK9tAEc02lOS/WV8Illg==
Date: Thu, 13 Feb 2025 15:37:54 +0000
Message-ID: <20250213153748.2869989-2-volodymyr_babchuk@epam.com>
References: <20250213153748.2869989-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250213153748.2869989-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB7030:EE_
x-ms-office365-filtering-correlation-id: 4c258905-ee91-4b4e-372c-08dd4c4464ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+hE5/EPOory/gJH98RH2d7ZjYEUuEcVz9tsb21ykBI8OSf0ehRYXaz+v2U?=
 =?iso-8859-1?Q?xHd5hYKFCUXcrL0pMmpkzVszq93jtpRtlKvmrY01s5LIE0C1Eelc7SMOCb?=
 =?iso-8859-1?Q?dhgxsXyjPQ4oB7Lcza5uIGbC3KIW9rHfWNBsVoaqJx5V1aEK+LgnoyHm3V?=
 =?iso-8859-1?Q?c71sKJxq8ZVF+YcYR1MsNvBOQQ9EgPPpS8hKN42+cDyvN2Ez/kCOL2/ocJ?=
 =?iso-8859-1?Q?lGdThhAfk6klL59cqsZfpbs9oxb+PSPErxFUpwtItpWo+as6W7Gq2QlR6o?=
 =?iso-8859-1?Q?bKgpes2WhXHijIPz2+vYDGGPDgxev0IVi1TtvUw8Y3oHFNqzVRPAx9kIlM?=
 =?iso-8859-1?Q?P2662TH8B8wOm5WGbJfwO0o9r17xTQl7VZ8QU0nZiUhOW2Xnwf02Iu/HXJ?=
 =?iso-8859-1?Q?Tt3sd0NhdUvCqG545A7GJ1OgHDz3uxJq/JA/5u0ZO6HMctqNISA6tTQi56?=
 =?iso-8859-1?Q?tpSN3n6eoFgwMUUKYsh55xwOv9jMSPd9kJyFFT7d2mshMRAcTHJID62CCI?=
 =?iso-8859-1?Q?PhHrSf2AhQDsmAN+tDe8MCLNIPfz+70CDtKuE5ULFmkqSoo3wX740TE7ZM?=
 =?iso-8859-1?Q?vS4aQCGrn9woUfRStjiiVuoldaCMtkjYE+G7d6IIv0qG63XCTd8fNtthul?=
 =?iso-8859-1?Q?kVZr/TTHT2p6Ns/lLGms0F5Yabr2LU08iN+UANJfBeoivNKIqJ3Gc83oko?=
 =?iso-8859-1?Q?BB9TvpB9AIrZ2pxgwFYgTQjUg6OM/BdXFn3TAW8ma07YU8Pp/vMhvxZ3Kp?=
 =?iso-8859-1?Q?oOfXFqIBCJgaGboBexPzi4e6cp0gjY53jvkj7rLAm/QWAVr4irW+hze4ds?=
 =?iso-8859-1?Q?ajKdeXF912ZPHkyWwq9F3muiUd+5IaasgcdYWVgqxygBsjuuNRPcGaLb6M?=
 =?iso-8859-1?Q?GADfVz6y2GOqTh+1JiJlBk5AAA9DrVxEaNl0uMZMDTSuKMm8cqvpwtTLcd?=
 =?iso-8859-1?Q?E/WsU/1+RVuPPoYBETG95CQOhtpsG+uYVjqF6nvfqyJF7QEmWeFkK0PVDE?=
 =?iso-8859-1?Q?RyqFOieDMrepz6wS4bvAJyauTRD3eclYk09euQysZnj86EJuZmTCEIQ691?=
 =?iso-8859-1?Q?GMLU1ZxkPFgs+l930nhN3nnqcc67dtnedUlmagxTu11xL9UjhuWPv3k4oD?=
 =?iso-8859-1?Q?7s4vTTn6Dn+5veV30HrywknOQ4tz5IxlCw7B07Yo1W80EBCInt3u/q/wAl?=
 =?iso-8859-1?Q?zBZCWCktg5eBdIs+71ptqRh2vsxMbeKYbkKoTCqkKk0DmZJqy78yU/qNI6?=
 =?iso-8859-1?Q?vz6TiE/D7UFEvVKRDf/WM/km98qvmxMBSq7N19LZpnOA1RvuL/NZUCv0+G?=
 =?iso-8859-1?Q?oX1qZdoQfpMC5XUy0f6Kk7DUb+AcL8DCZlsZuqm4TXG9h+eoIgJeMjYZST?=
 =?iso-8859-1?Q?szh0XpGSSwUGNudjvDWpiN2NzyXeGWABiqIBH/1gdlA1ngOS98a4nYyHVX?=
 =?iso-8859-1?Q?V4VLM8uK38LA2Zj/0hqbyC+qPr9E4ulxa68z22ouQCLYmAOI+qv1pFrnk3?=
 =?iso-8859-1?Q?tnaMjR/om0IGblr+NAepXK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1sekgi7J6469VcZEmv9xCQ9jYe7hYyG2lYY8xtAowfoTgrUqY8ihACQUBz?=
 =?iso-8859-1?Q?/ltlHMMAXWIdTvtX3t98qsAug4LagdJtEwtpXmH8GnA0wawL61WeOX0Q0V?=
 =?iso-8859-1?Q?zppFvffLPfBfgFINRM/89w3MZ6pUJBXOOzhr6NYSiDb90Tue8OYTmXtTNg?=
 =?iso-8859-1?Q?8oVce43laIu0Pb9flD1EBPzV5wD5QiOyb56e/7LgRNhjzAQU0+Dgxe9Mlv?=
 =?iso-8859-1?Q?awycwBvBfldgmy9nvSl8bQzDGWU7n4qG9vqckFDmo2kglCTzdLTelJvdS3?=
 =?iso-8859-1?Q?78MX7Y+QIlzMGLKpHho37oKpjGOo3fydpsr77g27lNz7gJOLXU+VsArbsf?=
 =?iso-8859-1?Q?4QfoeVnLCcdJD0xq+AL369RtYGfEE+20q7BTcYL7j6+SUHROtzvuBpDcG2?=
 =?iso-8859-1?Q?Xy+K5ep1ZVXSo5j2ihaPMyNMwqUfcrqi98i07gZ1U7/mr3cwUVwlaaZPbY?=
 =?iso-8859-1?Q?iDKPgPGQQ7uawEpUMzE02VHeeA46xIp6WtUiQn+5F6qLpfpmSIPYpWQwLO?=
 =?iso-8859-1?Q?IHowQMGVsI901xK5c+ITIC0nTAHMc6JaA6R7OuAUFMjN7V8w5GXxlmqorJ?=
 =?iso-8859-1?Q?ucZ2JNnjPWMdGL0xFCTeMTmqUkjbmUhEShJhVdhHagElQdhv7UNwwhN0BF?=
 =?iso-8859-1?Q?UVDWNdMVqIXtUZHc/HuNSg7+C4UvVIKX1YMfHcpF06IedEDcMPkZGjZaUR?=
 =?iso-8859-1?Q?X8pBRD+5wWEr5dnSqrZohQ9TQgrYFE2lpoH7r3na1UBUAVnahCELN4keE1?=
 =?iso-8859-1?Q?2m6GRooml+OK+mOTJVo5DoiNbSLrZ6Uaau/wBhZWsituuvwBAs3Me/PmHn?=
 =?iso-8859-1?Q?a3Xfh9Dxb1K4mdEgmGII/Jre3G7Z1wsu0ReRFkSAdfvKHxYC7TAGZdbQoS?=
 =?iso-8859-1?Q?epCtKxUdmLXsXQtfMqm9kMr2S1XMc1HhcEOALK/L3k+OikgsdHbcrZgyR+?=
 =?iso-8859-1?Q?YrlxgwyTBMpn2PsLy6CE4bmXygV1C16F/ZPBP8G7B5ZGA1jp+rDvAJtPfM?=
 =?iso-8859-1?Q?XTM/nvVDwufZ8zx7AUoqDK5AkfR4IP6434jeSvVUtgZn8nvqHfcgmD2j9C?=
 =?iso-8859-1?Q?1W7OJpTyr8kRXFqyyQGT8ySYDgpAoYuGV6QLczctxUT/LAvZlL2AJIRHN9?=
 =?iso-8859-1?Q?sigNG1nKn5KDy8K0kLlww6a69fBIkB5PclabRARhhboXL68RSjWcIF+wOw?=
 =?iso-8859-1?Q?9XwZ9Y5sIDM454zH9cTxDYEXBKvWZKo5mU1rOFNsemZ7P+hflw+oJBIOpM?=
 =?iso-8859-1?Q?D2XUxH7dgtE+5aPystASOMxImnFyAvq29vG9tYiBBc+esYkJyoeNznYbao?=
 =?iso-8859-1?Q?Oo1X8uwOe6PhhS2i2YcwnZ5NaBqiUuwALqFc1NCcBozvnDzeViSv4TJy9a?=
 =?iso-8859-1?Q?Xz7/ZUWQmKI4HYdUE4Ja60U7sG33MePHe3poKPfNud9kPvoC8m/CYxNVQ3?=
 =?iso-8859-1?Q?udr66jNISta8EFAhEJJEFN+iW/Jc9YpH2ZidAdP68HN/RK5FH3h5jjg4nV?=
 =?iso-8859-1?Q?khw99oyCa0FF/im1p4dQdR7VCjlYnneo2dWDzTZzrWVwKGkUY4/Rpx9VMN?=
 =?iso-8859-1?Q?0PI6kuqKmWeR/Un71PpnJr7nbAc+LIqfxK8DX4S8vXXW59O7xes38lyP1R?=
 =?iso-8859-1?Q?iFIx5nULOLKTN1kON4/HNYrwMlxZd/ClTzfpIS1yAZHAeRTsBgPc+Ktg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c258905-ee91-4b4e-372c-08dd4c4464ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 15:37:54.7576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iMs8IH+ncpS7ECODAxLIdojuL6blmQZZ+AH6OHpN1FUoRwLCqcQoz6O1brBdp99khq80D3mlLsgw0cwv0cUXmMSlmMG/tWWIY8D+5/sGSbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7030

ARM Architecture Reference Manual states that IL field of ESR_EL1
register should be 1 when EC is 0b000000 aka HSR_EC_UNKNOWN.

Section D24.2.40, page D24-7337 of ARM DDI 0487L:

  IL, bit [25]
  Instruction Length for synchronous exceptions. Possible values of this bi=
t are:

  [...]

  0b1 - 32-bit instruction trapped.
  This value is also used when the exception is one of the following:
  [...]
   - An exception reported using EC value 0b000000.

To align code with the specification, set .len field to 1 in
inject_undef64_exception() and remove unneeded second parameter.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes in v2:
 - Removed unused parameter from p2m_set_way_flush()
---
 xen/arch/arm/arm64/vsysreg.c           | 10 +++++-----
 xen/arch/arm/include/asm/arm64/traps.h |  2 +-
 xen/arch/arm/include/asm/p2m.h         |  3 +--
 xen/arch/arm/include/asm/traps.h       |  2 +-
 xen/arch/arm/p2m.c                     |  5 ++---
 xen/arch/arm/traps.c                   | 24 ++++++++++++------------
 xen/arch/arm/vcpreg.c                  | 26 +++++++++++++-------------
 xen/arch/arm/vsmc.c                    |  6 ++----
 8 files changed, 37 insertions(+), 41 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index c73b2c95ce..d14258290f 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -95,7 +95,7 @@ void do_sysreg(struct cpu_user_regs *regs,
      */
     case HSR_SYSREG_ACTLR_EL1:
         if ( regs_mode_is_user(regs) )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
         if ( hsr.sysreg.read )
             set_user_reg(regs, regidx, v->arch.actlr);
         break;
@@ -109,7 +109,7 @@ void do_sysreg(struct cpu_user_regs *regs,
     case HSR_SYSREG_DCCSW:
     case HSR_SYSREG_DCCISW:
         if ( !hsr.sysreg.read )
-            p2m_set_way_flush(current, regs, hsr);
+            p2m_set_way_flush(current, regs);
         break;
=20
     /*
@@ -267,7 +267,7 @@ void do_sysreg(struct cpu_user_regs *regs,
     case HSR_SYSREG_CNTP_TVAL_EL0:
     case HSR_SYSREG_CNTP_CVAL_EL0:
         if ( !vtimer_emulate(regs, hsr) )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
         break;
=20
     /*
@@ -280,7 +280,7 @@ void do_sysreg(struct cpu_user_regs *regs,
     case HSR_SYSREG_ICC_SGI0R_EL1:
=20
         if ( !vgic_emulate(regs, hsr) )
-            return inject_undef64_exception(regs, hsr.len);
+            return inject_undef64_exception(regs);
         break;
=20
     /*
@@ -440,7 +440,7 @@ void do_sysreg(struct cpu_user_regs *regs,
     gdprintk(XENLOG_ERR,
              "unhandled 64-bit sysreg access %#"PRIregister"\n",
              hsr.bits & HSR_SYSREG_REGS_MASK);
-    inject_undef_exception(regs, hsr);
+    inject_undef_exception(regs);
 }
=20
 /*
diff --git a/xen/arch/arm/include/asm/arm64/traps.h b/xen/arch/arm/include/=
asm/arm64/traps.h
index a347cb13d6..3be2fa69ee 100644
--- a/xen/arch/arm/include/asm/arm64/traps.h
+++ b/xen/arch/arm/include/asm/arm64/traps.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_ARM64_TRAPS__
 #define __ASM_ARM64_TRAPS__
=20
-void inject_undef64_exception(struct cpu_user_regs *regs, int instr_len);
+void inject_undef64_exception(struct cpu_user_regs *regs);
=20
 void do_sysreg(struct cpu_user_regs *regs,
                const union hsr hsr);
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.=
h
index 4818dd4b6a..594dc40041 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -298,8 +298,7 @@ void p2m_domain_creation_finished(struct domain *d);
  */
 int p2m_cache_flush_range(struct domain *d, gfn_t *pstart, gfn_t end);
=20
-void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs,
-                       const union hsr hsr);
+void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs);
=20
 void p2m_toggle_cache(struct vcpu *v, bool was_enabled);
=20
diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/tr=
aps.h
index 9a60dbf70e..3b40afe262 100644
--- a/xen/arch/arm/include/asm/traps.h
+++ b/xen/arch/arm/include/asm/traps.h
@@ -44,7 +44,7 @@ int check_conditional_instr(struct cpu_user_regs *regs, c=
onst union hsr hsr);
=20
 void advance_pc(struct cpu_user_regs *regs, const union hsr hsr);
=20
-void inject_undef_exception(struct cpu_user_regs *regs, const union hsr hs=
r);
+void inject_undef_exception(struct cpu_user_regs *regs);
=20
 /* read as zero and write ignore */
 void handle_raz_wi(struct cpu_user_regs *regs, int regidx, bool read,
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 65b70955e3..ef8bd4b6ab 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -428,8 +428,7 @@ int p2m_cache_flush_range(struct domain *d, gfn_t *psta=
rt, gfn_t end)
  *
  *  - Once the caches are enabled, we stop trapping VM ops.
  */
-void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs,
-                       const union hsr hsr)
+void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs)
 {
     /* This function can only work with the current vCPU. */
     ASSERT(v =3D=3D current);
@@ -438,7 +437,7 @@ void p2m_set_way_flush(struct vcpu *v, struct cpu_user_=
regs *regs,
     {
         gprintk(XENLOG_ERR,
                 "The cache should be flushed by VA rather than by set/way.=
\n");
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
         return;
     }
=20
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 737f4d65e3..5338d5c033 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -533,12 +533,12 @@ static vaddr_t exception_handler64(struct cpu_user_re=
gs *regs, vaddr_t offset)
 }
=20
 /* Inject an undefined exception into a 64 bit guest */
-void inject_undef64_exception(struct cpu_user_regs *regs, int instr_len)
+void inject_undef64_exception(struct cpu_user_regs *regs)
 {
     vaddr_t handler;
     const union hsr esr =3D {
         .iss =3D 0,
-        .len =3D instr_len,
+        .len =3D 1,
         .ec =3D HSR_EC_UNKNOWN,
     };
=20
@@ -606,13 +606,13 @@ static void inject_iabt64_exception(struct cpu_user_r=
egs *regs,
=20
 #endif
=20
-void inject_undef_exception(struct cpu_user_regs *regs, const union hsr hs=
r)
+void inject_undef_exception(struct cpu_user_regs *regs)
 {
         if ( is_32bit_domain(current->domain) )
             inject_undef32_exception(regs);
 #ifdef CONFIG_ARM_64
         else
-            inject_undef64_exception(regs, hsr.len);
+            inject_undef64_exception(regs);
 #endif
 }
=20
@@ -1418,7 +1418,7 @@ static void do_trap_hypercall(struct cpu_user_regs *r=
egs, register_t *nr,
     if ( hsr.iss !=3D XEN_HYPERCALL_TAG )
     {
         gprintk(XENLOG_WARNING, "Invalid HVC imm 0x%x\n", hsr.iss);
-        return inject_undef_exception(regs, hsr);
+        return inject_undef_exception(regs);
     }
=20
     curr->hcall_preempted =3D false;
@@ -1655,7 +1655,7 @@ void handle_raz_wi(struct cpu_user_regs *regs,
     ASSERT((min_el =3D=3D 0) || (min_el =3D=3D 1));
=20
     if ( min_el > 0 && regs_mode_is_user(regs) )
-        return inject_undef_exception(regs, hsr);
+        return inject_undef_exception(regs);
=20
     if ( read )
         set_user_reg(regs, regidx, 0);
@@ -1674,10 +1674,10 @@ void handle_wo_wi(struct cpu_user_regs *regs,
     ASSERT((min_el =3D=3D 0) || (min_el =3D=3D 1));
=20
     if ( min_el > 0 && regs_mode_is_user(regs) )
-        return inject_undef_exception(regs, hsr);
+        return inject_undef_exception(regs);
=20
     if ( read )
-        return inject_undef_exception(regs, hsr);
+        return inject_undef_exception(regs);
     /* else: ignore */
=20
     advance_pc(regs, hsr);
@@ -1694,10 +1694,10 @@ void handle_ro_read_val(struct cpu_user_regs *regs,
     ASSERT((min_el =3D=3D 0) || (min_el =3D=3D 1));
=20
     if ( min_el > 0 && regs_mode_is_user(regs) )
-        return inject_undef_exception(regs, hsr);
+        return inject_undef_exception(regs);
=20
     if ( !read )
-        return inject_undef_exception(regs, hsr);
+        return inject_undef_exception(regs);
=20
     set_user_reg(regs, regidx, val);
=20
@@ -2147,7 +2147,7 @@ void asmlinkage do_trap_guest_sync(struct cpu_user_re=
gs *regs)
     case HSR_EC_SVE:
         GUEST_BUG_ON(regs_mode_is_32bit(regs));
         gprintk(XENLOG_WARNING, "Domain tried to use SVE while not allowed=
\n");
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
         break;
 #endif
=20
@@ -2164,7 +2164,7 @@ void asmlinkage do_trap_guest_sync(struct cpu_user_re=
gs *regs)
         gprintk(XENLOG_WARNING,
                 "Unknown Guest Trap. HSR=3D%#"PRIregister" EC=3D0x%x IL=3D=
%x Syndrome=3D0x%"PRIx32"\n",
                 hsr.bits, hsr.ec, hsr.len, hsr.iss);
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
         break;
     }
 }
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 0b336875a4..e7c484f2c1 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -206,7 +206,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union=
 hsr hsr)
     case HSR_CPREG32(CNTP_CTL):
     case HSR_CPREG32(CNTP_TVAL):
         if ( !vtimer_emulate(regs, hsr) )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
         break;
=20
     /*
@@ -217,7 +217,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union=
 hsr hsr)
      */
     case HSR_CPREG32(ACTLR):
         if ( regs_mode_is_user(regs) )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
         if ( cp32.read )
             set_user_reg(regs, regidx, v->arch.actlr);
         break;
@@ -232,7 +232,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union=
 hsr hsr)
     case HSR_CPREG32(DCCSW):
     case HSR_CPREG32(DCCISW):
         if ( !cp32.read )
-            p2m_set_way_flush(current, regs, hsr);
+            p2m_set_way_flush(current, regs);
         break;
=20
     /*
@@ -397,7 +397,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union=
 hsr hsr)
                  cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->p=
c);
         gdprintk(XENLOG_ERR, "unhandled 32-bit CP15 access %#"PRIregister"=
\n",
                  hsr.bits & HSR_CP32_REGS_MASK);
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
         return;
     }
     advance_pc(regs, hsr);
@@ -421,7 +421,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const union=
 hsr hsr)
      */
     case HSR_CPREG64(CNTP_CVAL):
         if ( !vtimer_emulate(regs, hsr) )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
         break;
=20
     /*
@@ -433,7 +433,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const union=
 hsr hsr)
     case HSR_CPREG64(ICC_ASGI1R):
     case HSR_CPREG64(ICC_SGI0R):
         if ( !vgic_emulate(regs, hsr) )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
         break;
=20
     GENERATE_CASE(TTBR0, 64)
@@ -467,7 +467,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const union=
 hsr hsr)
             gdprintk(XENLOG_ERR,
                      "unhandled 64-bit CP15 access %#"PRIregister"\n",
                      hsr.bits & HSR_CP64_REGS_MASK);
-            inject_undef_exception(regs, hsr);
+            inject_undef_exception(regs);
             return;
         }
     }
@@ -532,7 +532,7 @@ void do_cp14_32(struct cpu_user_regs *regs, const union=
 hsr hsr)
          * is set to 0, which we emulated below.
          */
         if ( !cp32.read )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
=20
         /* Implement the minimum requirements:
          *  - Number of watchpoints: 1
@@ -631,7 +631,7 @@ void do_cp14_32(struct cpu_user_regs *regs, const union=
 hsr hsr)
              cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
     gdprintk(XENLOG_ERR, "unhandled 32-bit cp14 access %#"PRIregister"\n",
              hsr.bits & HSR_CP32_REGS_MASK);
-    inject_undef_exception(regs, hsr);
+    inject_undef_exception(regs);
 }
=20
 void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr)
@@ -669,7 +669,7 @@ void do_cp14_64(struct cpu_user_regs *regs, const union=
 hsr hsr)
              cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs->pc);
     gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 access %#"PRIregister"\n",
              hsr.bits & HSR_CP64_REGS_MASK);
-    inject_undef_exception(regs, hsr);
+    inject_undef_exception(regs);
 }
=20
 void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
@@ -698,7 +698,7 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const unio=
n hsr hsr)
     gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 DBG access %#"PRIregister"=
\n",
              hsr.bits & HSR_CP64_REGS_MASK);
=20
-    inject_undef_exception(regs, hsr);
+    inject_undef_exception(regs);
 }
=20
 void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
@@ -731,7 +731,7 @@ void do_cp10(struct cpu_user_regs *regs, const union hs=
r hsr)
                  cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->p=
c);
         gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#"PRIregister"=
\n",
                  hsr.bits & HSR_CP32_REGS_MASK);
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
         return;
     }
    =20
@@ -756,7 +756,7 @@ void do_cp(struct cpu_user_regs *regs, const union hsr =
hsr)
=20
     ASSERT(!cp.tas); /* We don't trap SIMD instruction */
     gdprintk(XENLOG_ERR, "unhandled CP%d access\n", cp.coproc);
-    inject_undef_exception(regs, hsr);
+    inject_undef_exception(regs);
 }
=20
 /*
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 62d8117a12..e253865b6c 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -346,13 +346,11 @@ void do_trap_smc(struct cpu_user_regs *regs, const un=
ion hsr hsr)
     if ( vsmccc_handle_call(regs) )
         advance_pc(regs, hsr);
     else
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
 }
=20
 void do_trap_hvc_smccc(struct cpu_user_regs *regs)
 {
-    const union hsr hsr =3D { .bits =3D regs->hsr };
-
     /*
      * vsmccc_handle_call() will return false if this call is not
      * SMCCC compatible (e.g. immediate value !=3D 0). As it is not
@@ -360,7 +358,7 @@ void do_trap_hvc_smccc(struct cpu_user_regs *regs)
      * ARM_SMCCC_ERR_UNKNOWN_FUNCTION.
      */
     if ( !vsmccc_handle_call(regs) )
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
 }
=20
 /*
--=20
2.47.1

