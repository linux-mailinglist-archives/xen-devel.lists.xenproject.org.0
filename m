Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C987C92725
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 16:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174947.1499903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0Ir-0007Mc-Fh; Fri, 28 Nov 2025 15:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174947.1499903; Fri, 28 Nov 2025 15:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0Ir-0007L1-C0; Fri, 28 Nov 2025 15:22:33 +0000
Received: by outflank-mailman (input) for mailman id 1174947;
 Fri, 28 Nov 2025 15:22:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YqkP=6E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vP0Ip-0006eN-Qv
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 15:22:31 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dff3549-cc6e-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 16:22:30 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by AS2PR03MB10087.eurprd03.prod.outlook.com (2603:10a6:20b:62e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 15:22:21 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 15:22:21 +0000
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
X-Inumbo-ID: 0dff3549-cc6e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGz7F9vy1LaVdK4lfQSdHh2jqnoIcRtK7WQHYSQHy3SClF0c1s2atj9y/ItuEy5C5H3KLBP48XGrMcdS1qbKqdpP/NH0BV+sjm6yKhBanBsWmqr2+Vp6vrJM6KiMLlIjMCQFzToeCx7LszpBtBuwftVItjBuy6iuN+uh5jZ+fH51zHOMjNFB/YD1r54LZ/EkOwnm8e3W/4C13HO4vsraXXEfFm1kKUBaOfqGyCOeiO+W3GvKiWQAjaMGKEzXK64jA5y+t9yZxJUr7/O8K8xZCrg7hKxVwMsBWhVsAuTDeqbFtgFsdAh6ZlhV19YWyqvlDx7RhPYCIic4EWiI9/qpdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tD4HZxi7jTmnmsP0GYxaGrHKc3EJbTUhiaZg1ZgjwY=;
 b=Ws13GKOxTXstdafS5C1AN1vIo6sg+Yqv6XMQdzUAuOmnhcAjpq5CKCi14utlSbUWnt1Qp9N/pmH/dSTwJCsfbjbJ8XpnrDjOZAIHHgg3nnsSa9SI/Lu6qMOtLqAVQnm78Jhm6REmbEaY05ThDtaS6cnGlV+uW86hYbPQ/5lw0bp8FHaHCJvucS86j6Yb0gfvH/0vbiNEmlfmLHiq2AlYL8e5cej1Yj9DyTCqkQCMgtiDiGece+tHUNpkYisWR+Eiw+ufCzaaJQTBTSFHgek8qOW9fQ1M/C+2WcHDwmyjqoBlhjsKzS3pn+pIUXN9we5QXBTmy9o8JX7KeHJ/nlPwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tD4HZxi7jTmnmsP0GYxaGrHKc3EJbTUhiaZg1ZgjwY=;
 b=ffXIAWO1xApV+/zKi8kJV4BcEyBIfgXl1Y3w0N9EAzffJ8N11Wd1KG4BCSLL2AQr8oZ9bTBAVFayLjBw0xKSrTyg71KBV/oBWCyIU/lgn5kaaoxQLv1FapVhR2fCu4723GatU7MQU3735EWHeQ7lB5TSK0fMIeM0hJGVY/840CeVLwIMi2D9GLo43621uHO6qQwY2/7Qf2PUp+ETxdxLLe3Gi4Cokqx7b/TPMBP2YKk0jFNSrtFziSj3qkJyJ8uNEvQFqgQHiTwJtnBYGDXf5m8HhXAj2588j/cjyFuP/HASUcnPeOSmfGgtNBI24HWuc1BDveNuWejr8017fIXQpA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v3 3/3] xen/x86: move d->arch.physaddr_bitsize field handling
 to pv32
Thread-Topic: [PATCH v3 3/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
Thread-Index: AQHcYHrKMY8RaksHyUKCNstHynUmRA==
Date: Fri, 28 Nov 2025 15:22:21 +0000
Message-ID: <20251128152218.3886583-4-grygorii_strashko@epam.com>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
In-Reply-To: <20251128152218.3886583-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB4600:EE_|AS2PR03MB10087:EE_
x-ms-office365-filtering-correlation-id: a59c69e0-25d3-48fa-e58f-08de2e91ed3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9jo2/GPyYpzUapaSUU5qXmNRNxM99m5F7CJjTGMWPaggMTp2Gxt4kcV6Cm?=
 =?iso-8859-1?Q?H4FpFFajMbi90P5tsMZCpx+x0ddCyT/jQm/ZDVkBboLlm6KPWe8u2qoSIK?=
 =?iso-8859-1?Q?HKcWrVizzhb7DJzxOEQmJxz9QzZTb7iOv7MdxrMqC1jYsiB2I0D3SSxW0x?=
 =?iso-8859-1?Q?3Db88w0ZadPQ5P7Fi3wXMscZvJy2G7p6gYbPDlWLWgWO7MbTBGU9WdsAqh?=
 =?iso-8859-1?Q?5zfUiSYiFHCSzgCn2cxRKVm6ru9g1KhdMdRC1mnNr3xN9pgd94QlhcMHs1?=
 =?iso-8859-1?Q?OI8Yq+nQ+0BSZ8KZehtgn8EbCgVBwwSdagcAd1Zaief4mSX4EazJGGWQCN?=
 =?iso-8859-1?Q?KYfbAYTrIpdWagGj+LX+swavMZjgiqbwVB9pqcJVrDHWxSrfVlP471qy2L?=
 =?iso-8859-1?Q?PKEOW/+YX7epjEaGBRBxeGCLJuaO4iPyEGCSHP7090W5+uPkugpLNoltzw?=
 =?iso-8859-1?Q?SoXwEygb2bEYD+cQVsBlmVv0G3BQR8UMqLyxCnzdK6Hde/GCyfcZjBeUwj?=
 =?iso-8859-1?Q?1Hzyd3Rf/AcZiYOwm70ARXc8R2KbE+FqA1tNPQyprZakcZtCHCoI0RxktF?=
 =?iso-8859-1?Q?0GXh7GRjnK08hNJEtJ1XRUH6YIUy9FJK7REIFDjjKJBdBNo7TtkYjoJspW?=
 =?iso-8859-1?Q?h65oNwfOsg1TPklfMcpdJCZsr0c5fCpNEAIOl7JQgsBmNZGllMKeVaQIbn?=
 =?iso-8859-1?Q?pOxU4ODo1IpXZkmqFWN4SYYYeFIwfnKxcZiptZLtQOZEYscln7uVd8LEnI?=
 =?iso-8859-1?Q?B6paGHLDdqgeKZmEHoJK0IdQDlsAm8y2tjXKDw2RZr3RMs7fIPRdRVGNDi?=
 =?iso-8859-1?Q?N/YvIv1HvtL8HuF7lAlM/+dszTuel2zRlulFftui9Lg44NZLkYseUw61y2?=
 =?iso-8859-1?Q?+lJyU17xrQN1dRMGtYDShTZE4oIc4JtQM69bRFpoScvYQRWSDvuG48BudK?=
 =?iso-8859-1?Q?hbPMSK9bcHJY+naQLK7WpkHER+eMe8v0z5GBE3c8BHTinCgsXUSn2iReAg?=
 =?iso-8859-1?Q?Pc/t0VEdNK9+aj6esLUqZPX0X4ahpYBYMNQBKT5D76QHejZwqghuKN/0jw?=
 =?iso-8859-1?Q?4jTA6fpID9oprxvpIBArgWHEJwlNn4arLxFIKzFF4SGZDCx5kKQ7j0Ezuk?=
 =?iso-8859-1?Q?SGbBf9X1jcL7iyluoVwNxetTPyQP/M6lsP3C+Z4hUo+pUp/1CI9MQrg3/F?=
 =?iso-8859-1?Q?EYdBhNUllVsr4kCoRSaKgIbQqD1owqKoobEI/hQ5ylGLJBC7xVdMjf9N1I?=
 =?iso-8859-1?Q?3Idv7BNzn5dVog7ceFxWTgIEpYlh3Q1IyDcFZUFQKd7PglSbWEAepI5OBg?=
 =?iso-8859-1?Q?nH0F6FATidjKdUub9ZgQ6Njfe14qYegmbtJ4ZUd2tCXnu3J3BqUDJpspKD?=
 =?iso-8859-1?Q?rZBMBYzBNEdn8xxGpwfeonneTIMcRrPFABmbfJ0Oe1DAct39rocOcTHTZD?=
 =?iso-8859-1?Q?bhlxI4giMKxAUTCHl0Gx38frgmPbENxbw+8+MsD/8Wfe20jrusGc9SNxYg?=
 =?iso-8859-1?Q?8PJWv9WalE2dFjd7Bdzk5e6O/w8ncIkNMSNFWqc8s4vWpnBICpwBiC3e8H?=
 =?iso-8859-1?Q?nZN9w1QKnqAm0Z03pNGJKR0We23b?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qL774CDbx4YDn5kKZtPnPrn6XSPdByi0Om8tYOL88kcUAoRpiwG0WPhaIf?=
 =?iso-8859-1?Q?Wo/+iQINJOVy1FXsRkHS/y0SDPGUe7cIln5/fsSfyUMlEitFLTPCVtyUgv?=
 =?iso-8859-1?Q?emVypRlS3Qfa2lhmDbjF1GFtZRteud6V0ZwkiWLwhK+BI+YKHFaZRxbHJV?=
 =?iso-8859-1?Q?+rRnBgU/xTgtyooudatuQGFSmvE0wvNsSJWEK1YlmGFibPVH9f1ogW+/Tf?=
 =?iso-8859-1?Q?/VJ8hHuIMPGtV7LIkSPKizNNM5Za8O2EcHjSNxhf1vRwnxUt6+RvnfGjeW?=
 =?iso-8859-1?Q?QYIDODPDHva7WMCT1lWz82yKGW31GjmIB09+IcGoFvmGq1vrOl2U3Yvxxd?=
 =?iso-8859-1?Q?THCw5S6k6aXKOp4YeprjMWBw1250HUPtMhgMrKUfJObRe3aUnnRftx7jWQ?=
 =?iso-8859-1?Q?Dq4irTaQ49EaKXtDuHeXjSDOQnuyjVoZBNaUJseZfZ2Rlk9OmhfYrRoDiQ?=
 =?iso-8859-1?Q?Lj4prvke4jGwfg09qrnlkZPnRgpl7Svhuq+ipPuacJQ0pM9y1WwK5MqLRZ?=
 =?iso-8859-1?Q?rrLNFdnukOFdUpieiL/5+Hy6fDtqw9BrF7qWNtfMUh5pc1kTaflnK/J3+B?=
 =?iso-8859-1?Q?YdTqg1J4RuElYpd9c2hSLLmsT2J0NdXdKmHnJMyA3nrk2GF3/JUZle5G17?=
 =?iso-8859-1?Q?yUJQAbFXkFEyzlSk5RbtOwMi7UYphUxE7SeTZdAnzs+QrTr8QOkDQxYyzU?=
 =?iso-8859-1?Q?PCVQcyNUL5OySQPagWTD7hdNQO8hTIly/w9RpQPj/ZLm6QhtcdsIl4sFXT?=
 =?iso-8859-1?Q?oAvFegyii1Rt+1jpqQwGTDs4sueNiFsVM7idk3ZVM88n5hYsIT/zr6CLIL?=
 =?iso-8859-1?Q?X4zQPp0Ui80v/5b7fqazktu6iIQM+ZokHINIryIOJJxYhfSuCycdWsBp4P?=
 =?iso-8859-1?Q?munB63AUCL0tKUpiA4O2kmb4kcZZuzoRlYgO5GTpvn3agUxZxiTSmWuM5K?=
 =?iso-8859-1?Q?lmL0ZR3FzGUhKz2kJFBVQUwLDya5XdWImfqCgEnT5Q/wDyNUgqbczXlItk?=
 =?iso-8859-1?Q?DeyZmZx0xEv0YrgJc4ZH0aMJnWDWTXt8KV63Ho03ReNj1N6l/9jvdx1JMP?=
 =?iso-8859-1?Q?8ofvuaXYvQS4vPEkfmXlotvs2SYVD3At1SBG+dd3fBtuZE5Cn+ouhVPYMS?=
 =?iso-8859-1?Q?2e3jYSmmLXvJ+nU8wFsq0yQ5RQnNQvxFM7df3y3OxU07tdaIE2HxhQgITo?=
 =?iso-8859-1?Q?BSVvHr7eDldO/0q/Gv29BrnRd0Lq/3EPaMzLiJeJu0wnBp4auMgYex3DqS?=
 =?iso-8859-1?Q?s0RFWR0OCyhcD6J3UyYm0dRhHFFs2T+k8VJMA9xrq8GegBAC4j71ka3Tt0?=
 =?iso-8859-1?Q?BraWcqJTZ2j8BQr4kVdfDFAGANAjwu+iyVj4wRlujRanY/5oWmqajI9lwq?=
 =?iso-8859-1?Q?07e2EXv04y+nk/AFX609B6LoAfPW2SZ0p4K4fwfI0ZPZDuokg5hnQ4AnCN?=
 =?iso-8859-1?Q?TFxkqmd1asC6VMPBH/0aD82RgZzYcKbKj/bOqo1EXUWrPpzlCa6pFU18i6?=
 =?iso-8859-1?Q?TF8l4HDnqG5NPO1BLVlvqtItcfwpDk8NHWFY+c8g0b8ba/+60kKTubzSu2?=
 =?iso-8859-1?Q?Z0jfKJQ/BQnKK0bdXwYUCFVSUuoQe3dK96NSkI67uLIQ7g8Vt/7ZTmLP6N?=
 =?iso-8859-1?Q?oa3ma4ofrqoKLE8Dm7U39nDz8B7gWSfQiDxrHoYK7QK8UlgU7Zbm81yQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59c69e0-25d3-48fa-e58f-08de2e91ed3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 15:22:21.8276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bw260g9f59EEhIhsJJWceJSLPheJ+HCLxwzuprhdTxpXqUe+A+9VYSLo3OwTBLg/PXJM15DKe7WDGlESCu3qFOkcIWh6B1RFBfZBAdAkndI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10087

From: Grygorii Strashko <grygorii_strashko@epam.com>

The d->arch.physaddr_bitsize field is used only by PV32 code, so:

- move domain_set_alloc_bitsize() function into PV32 code and
  inline it into switch_compat()
- move domain_clamp_alloc_bitsize() function into PV32 code
  and convert to macro
- move d->arch.physaddr_bitsize field under PV32 ifdef into
  struct pv_domain

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v3:
- domain_set_alloc_bitsize() inlined.
  Note change of condition to "(MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page)"
- domain_clamp_alloc_bitsize() convert to macro

 xen/arch/x86/include/asm/domain.h |  8 +++++---
 xen/arch/x86/include/asm/mm.h     |  9 ++++++---
 xen/arch/x86/pv/dom0_build.c      |  7 +++++--
 xen/arch/x86/pv/domain.c          |  6 +++++-
 xen/arch/x86/x86_64/mm.c          | 20 --------------------
 5 files changed, 21 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index 5df8c7825333..6cdfdf8b5c26 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -276,6 +276,11 @@ struct pv_domain
=20
     atomic_t nr_l4_pages;
=20
+#ifdef CONFIG_PV32
+    /* Maximum physical-address bitwidth supported by this guest. */
+    unsigned int physaddr_bitsize;
+#endif
+
     /* Is a 32-bit PV guest? */
     bool is_32bit;
     /* XPTI active? */
@@ -316,9 +321,6 @@ struct arch_domain
     unsigned int hv_compat_vstart;
 #endif
=20
-    /* Maximum physical-address bitwidth supported by this guest. */
-    unsigned int physaddr_bitsize;
-
     /* I/O-port admin-specified access capabilities. */
     struct rangeset *ioport_caps;
     uint32_t pci_cf8;
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 17ca6666a34e..a308a98df2a4 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -619,9 +619,12 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
=20
 extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int=
 pxm);
=20
-void domain_set_alloc_bitsize(struct domain *d);
-unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bit=
s);
-#define domain_clamp_alloc_bitsize(d, bits) domain_clamp_alloc_bitsize(d, =
bits)
+#ifdef CONFIG_PV32
+#define domain_clamp_alloc_bitsize(d, bits)                               =
     \
+    (((d) && (d)->arch.pv.physaddr_bitsize)                               =
     \
+         ? min_t(uint32_t, (d)->arch.pv.physaddr_bitsize, (bits))         =
     \
+         : (bits))
+#endif
=20
 unsigned long domain_get_maximum_gpfn(struct domain *d);
=20
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 21158ce1812e..94f7976e819f 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -626,8 +626,10 @@ static int __init dom0_construct(const struct boot_dom=
ain *bd)
         initrd_mfn =3D paddr_to_pfn(initrd->start);
         mfn =3D initrd_mfn;
         count =3D PFN_UP(initrd_len);
-        if ( d->arch.physaddr_bitsize &&
-             ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)=
) )
+
+#ifdef CONFIG_PV32
+        if ( d->arch.pv.physaddr_bitsize &&
+             ((mfn + count - 1) >> (d->arch.pv.physaddr_bitsize - PAGE_SHI=
FT)) )
         {
             order =3D get_order_from_pages(count);
             page =3D alloc_domheap_pages(d, order, MEMF_no_scrub);
@@ -650,6 +652,7 @@ static int __init dom0_construct(const struct boot_doma=
in *bd)
             initrd->start =3D pfn_to_paddr(initrd_mfn);
         }
         else
+#endif
         {
             while ( count-- )
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 9c4785c187dd..d58e4e213e5c 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -254,7 +254,11 @@ int switch_compat(struct domain *d)
             goto undo_and_fail;
     }
=20
-    domain_set_alloc_bitsize(d);
+    if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page )
+        d->arch.pv.physaddr_bitsize =3D
+            /* 2^n entries can be contained in guest's p2m mapping space *=
/
+            fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1 + PAGE_SHIFT;
+
     recalculate_cpuid_policy(d);
=20
     d->arch.x87_fip_width =3D 4;
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index d4e6a9c0a2e0..8eadab7933d0 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1119,26 +1119,6 @@ unmap:
     return ret;
 }
=20
-void domain_set_alloc_bitsize(struct domain *d)
-{
-    if ( !is_pv_32bit_domain(d) ||
-         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >=3D max_page) ||
-         d->arch.physaddr_bitsize > 0 )
-        return;
-    d->arch.physaddr_bitsize =3D
-        /* 2^n entries can be contained in guest's p2m mapping space */
-        fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1
-        /* 2^n pages -> 2^(n+PAGE_SHIFT) bits */
-        + PAGE_SHIFT;
-}
-
-unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bit=
s)
-{
-    if ( (d =3D=3D NULL) || (d->arch.physaddr_bitsize =3D=3D 0) )
-        return bits;
-    return min(d->arch.physaddr_bitsize, bits);
-}
-
 static int transfer_pages_to_heap(struct mem_hotadd_info *info)
 {
     unsigned long i;
--=20
2.34.1

