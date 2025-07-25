Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D65B12011
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057934.1425661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLp-0007yh-CM; Fri, 25 Jul 2025 14:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057934.1425661; Fri, 25 Jul 2025 14:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLo-0007rM-Vx; Fri, 25 Jul 2025 14:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1057934;
 Fri, 25 Jul 2025 14:24:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGu/=2G=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ufJLn-0007Qu-N0
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:24:43 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1acfad7a-6963-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 16:24:42 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB7421.eurprd03.prod.outlook.com
 (2603:10a6:102:103::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:24:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 14:24:33 +0000
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
X-Inumbo-ID: 1acfad7a-6963-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKmHS4+cw9mEeRWGjkEH0hm+O9V7DS/w8j40DY7e2L5F2mq1a5YgqsGHATIu1HhJxlRTIHah/AGHkiMDkuSM/in5VOEoal7In/7t0YThFcr69Kf14Ay9cG0zeb1pd8Oer21AVCK329z7asnUtcvUlLVIlHHAbybV6s6Or66GIdLWhOIbeBEA+vZLqftYGR4JAMDS94eHl0UyEmihcl4JH4gr3MP+XGDqWyuBM3zgU2FbWW0dR+Bwsw9+QEhzYPAEMBxAjOznRsS9Vvy/NW19AmnK7hn4OeYnduy7G/eQlVq9S5qXv87Fh3tDj7eAZQ4oMCbCn7LWrnKSMUO8RUHasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OotdfLHKZjhyPJlV+BjTo76JI2XRgyIEJ4WlkkxrWJE=;
 b=ijJNhM8bng1cqWgeVwEphl0sJ/YUNsj53Z5+vvwTtACIe5XZjx+t9kEc8qCeN9ZydabUymzoA2RzB4v+165+ty5vel4egtx+M3cPnRY+jZW1LsDWkxp2GJD+5vG2TY/Gh8HoPXigIGOn1sV23LuiPv/OuR/hUD12of8JsaOHsZbR4GxuuFNows+TtOtJXv44MHwjJvFxARP8D79n95eczrITU1qUhxgmj+BxR8V712YBI9FUzBoRPVk/5Jwb5aIV2B/1/4P/pW3rCcWf17o44NA08KW5e6iIem24bL4kZokHCP5S+4r4rfpRVaPCecMXxDRosdv9CnFJm0JJ65+tQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OotdfLHKZjhyPJlV+BjTo76JI2XRgyIEJ4WlkkxrWJE=;
 b=N7BL3FKstDkfPAft4uxUi0/OKp2UGSPixeynb9xYqtqL2pBTm4geI52qhwuQ010jT8XT/SMi+acNrRYd0gWQQPWCWpy6Zy52XkgVWVe2H1GTVg3PIyg1tGBVCbmQCdZ4SzZ8kA0LbyPQjkiyMucceXXRGeIzgky7jzSJnoi+Q421rfTnEr/UrKmwQ9T38M+DaDc95iK1uS+UoBmoknGJntoL6ErT5qnMz7JaQz5n7wr6p+DF4eppfiQpWquL7l+cAJRmPHcKx5dZMjbrijUo6TUoLucwc8R0nYv5djTTGvcSjc+vG9mrkfYM34VUW82p1RW7bXrgf3GXHpKifKQFrA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Mykyta
 Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v1 4/6] vpci: add SR-IOV support for PVH Dom0
Thread-Topic: [PATCH v1 4/6] vpci: add SR-IOV support for PVH Dom0
Thread-Index: AQHb/W/XkRTIlDBdSUyf2rny+l8q3w==
Date: Fri, 25 Jul 2025 14:24:33 +0000
Message-ID:
 <c5cd0e9cd75cacee2127c45635c999bd296853a7.1753450965.git.mykyta_poturai@epam.com>
References: <cover.1753450965.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1753450965.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB7421:EE_
x-ms-office365-filtering-correlation-id: 51f437bc-54b2-4140-d07b-08ddcb86f9de
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?BDaShWk5nCRLXUF91VWWrv0SWPDiZ5vAlp4b9V6ltHOQkCDgHpuYte+Q1Z?=
 =?iso-8859-1?Q?E7GJ4k6aGh8//1yMLwEx6+HlhHA8+4ccKxbCfRfNDRPu/d+medIbG6SxoT?=
 =?iso-8859-1?Q?c9s3t2mNw6GR9FxW+Lk+oiKs8eOpbUMQzWLcguQopCusXt5Aw+c+dO+bmA?=
 =?iso-8859-1?Q?rYd1lWlLJH5/Z+a7D9PnD1g9d0L3GhQ9odecx4eIgN17QthGMtO/0///lu?=
 =?iso-8859-1?Q?JHfRM0SPLJOz+zbkwYRiEMfSs+P6xUdBS+zoX6C5fbrqXB00ehrqIvWdQK?=
 =?iso-8859-1?Q?GwhIKIh9ooNqC6qjDk1woPlo7cMt3R/hviiEQqM+YIckhpDL81ryXErslA?=
 =?iso-8859-1?Q?NRM1+W6x5UByG2Z/8LyTamH++kcJrlW7FGYf18h6IwKMNjgcpczHWP+HxY?=
 =?iso-8859-1?Q?htgxLpRcJaTLW+SjbXUXfo7y938oWXsSAEKZtp6DNFBZgvPoQl9Tq87Am3?=
 =?iso-8859-1?Q?dBZWue1KOOvOx9CK4MVxziwtDwmuiTcx67xn74yaE/45XPhe+aR6h80LxU?=
 =?iso-8859-1?Q?Ll5xis/flm1yGVr0EmetXXQbmuURSlAXwCEgajkBoNc1cBeYV9vrFMT8vj?=
 =?iso-8859-1?Q?zVFlyniv3x9y+JOdiOzWBwB9vaemEmGlQDpdY1iWtzhVrah21WoClnTvBU?=
 =?iso-8859-1?Q?lVNa1WypPzL+e54mk0FqukB+CqNjAmI/mEE8+0oXONoqJWCTIF0NM4xbBO?=
 =?iso-8859-1?Q?GtiCfxIBTpSh8j2zuIcVkTI5ZZH+VvNabucJT8zRE2kZf0L2N1Zc9CV/+n?=
 =?iso-8859-1?Q?pMuTmCinEVwfmeqWk9pp77kfoOH5vtfVYuRa5qkPF7SfsczBEoIJ3f6yu3?=
 =?iso-8859-1?Q?/+kBIKU8rLege4FmBmQFrb759ZUNtrHuxvAfjenFvC1K7nqPRW1k8F0f3U?=
 =?iso-8859-1?Q?t0ZP7IOQwOcve6x2Y8l/rr0fQun0UOEvFPDFrdG4ttoo0iLu/JIS4hAnjE?=
 =?iso-8859-1?Q?xk3GE5TkA8fVaXG6Yu03wqTsPxxvN2rJLiLTUx84YO6Tuo3u2o9v89ClsG?=
 =?iso-8859-1?Q?1Ild90UyUCq8fvCZE7FbcvtS1eq8VsJkAALTdHpS0Jjg2RLM3GVUvuVzDz?=
 =?iso-8859-1?Q?yh3/abRtloeCujQcSNhReOT2AAppjgW0lcDhxh+3DWNmP9K3MZuE3sYTzF?=
 =?iso-8859-1?Q?FkEx1cTcHgim75jGZ7Tr+NYLQfxi50a/N8BhQ8aQVr+bAT0aRwsT4NxuQ7?=
 =?iso-8859-1?Q?3IIiEvlzUHDCVwo4Kmy8isMqH2XhrEcbMB+YFnDg/mq2Ap1ossEbhEYdns?=
 =?iso-8859-1?Q?Hxx/+Q+sByz0hy+jrBSLIW23oXRH0KJtAiXpdCIuigzmfV5Cllkovk07W/?=
 =?iso-8859-1?Q?d3TwvMIja3UOHqjkLmwiWp0zzKVULMVUOwFXatOanFR0KhKOVxp7cYYYOn?=
 =?iso-8859-1?Q?I6FSxzgkbg3gdqhAkEc8t7ld97OeQgd7q40xFuAEARxUAFajaHrjWka0Rb?=
 =?iso-8859-1?Q?HDbDRzxkc9tfZDhL/3f2al0FmflwX6IQ1Z0yJYS9Gd1ks4bzTk2YOGjvO7?=
 =?iso-8859-1?Q?s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/zPG9LLikny03nsLxVJHqjrYEqD33JW7CuXBZcEmk+v9dIKCXmQzDZXghE?=
 =?iso-8859-1?Q?27+N6rm6aUEX0Y2w5wqxNe0t8+yKa9cNqgzCJakG5UN4mD2Swj2fdR0WIY?=
 =?iso-8859-1?Q?FGAK66F+C5OKLw6JZ0ZDxtkWR8tjtp8F9glFI0lOTWlzxnZAGFVN4VBHGL?=
 =?iso-8859-1?Q?LeT0OPmIgs2ehy0JHzWsA4f5T1Hjpw9JrFDxBNqzW7yaZOskdCZE8LrxF/?=
 =?iso-8859-1?Q?x4VfpboYqV2xHpUFfSP04LUsR1D7paVk+6zS2zOB5jyRu5BLFOC9+uAnuZ?=
 =?iso-8859-1?Q?Mn4EVEUaYJPvqy8EYRWVlas/+/wD0dfzp1vqTW1I9YGBjzLDjvDafTWDwG?=
 =?iso-8859-1?Q?OMEnSK1uvgFc8zBqeeXzkjZMjePhGcvNL8dOziBRVxL4REFRlhtwOfTGX8?=
 =?iso-8859-1?Q?0Ayy0dM7sja2/7dQSDVooZIXensCEo/jDqmh3aCO+OzajHa1cpk2AGJRvr?=
 =?iso-8859-1?Q?vDe2zVuXHwUYjUEhQDXQhm5oJM0A+Vh1GtiNRpybGsXJpeV2+9XCzRui6d?=
 =?iso-8859-1?Q?AGqCJ72YEFftiW5SSuUFK+DtSm4QBLOliubhE5gHrZF6Zb4dkj2UU3iutd?=
 =?iso-8859-1?Q?L+JUOI+zxacf5KLyz0ofv9MunriHZfNe7KuRp3iSQzcLOx2t/mymMpvJow?=
 =?iso-8859-1?Q?eZlPfJJCRwj6p3CNz/2Tb9JhCEEIhnZd5wugIJO7JVO0TgnTY0Re4WKr5/?=
 =?iso-8859-1?Q?Croj3ijuqsj4vltjdT6vpHTDa4sCMLAf2hgADBjxkHZv5cew72EwW/LWeQ?=
 =?iso-8859-1?Q?0l/HUrGi9zvNLixiRQHfyvTiEJasIKp8lKg2e6dWrgTzAQJUw0Auhllv/Q?=
 =?iso-8859-1?Q?TMNZZcjc1kpbTu5iBPtksTvwqScXNMANPw3clowh5YOK5ZiYhA1cp7YIH9?=
 =?iso-8859-1?Q?+Jkrn20X2WO8+o+W4t/xatiu6IxPlz8sk3l3pAK2muW0yDhlNq9EZq/7LI?=
 =?iso-8859-1?Q?4OlPIPkWUWK89sydwCJY30BzEoDCghvYvvP0Bf01j77gbze8RrIpmIl6qo?=
 =?iso-8859-1?Q?SB9EDpL+OMl+eDj4kRK+a0AnIk/DgVOe3tP4ZQGyw4P72CdT/LjWncVQXj?=
 =?iso-8859-1?Q?acL3z6WTWacTqIHafyV2ZmCFjOcajD3pcOcm10OOUVEkcGgbo9D4axHk7O?=
 =?iso-8859-1?Q?YNYxwUNyLSEJDVxeLk+Qorb3coH6oMFoAnUJEFKAlYPP0JhkwOOG2qWSsa?=
 =?iso-8859-1?Q?09cxoogJLyWEweLBMo8ELm8CGrAkxFkEFLQwFevuxIqqjSzrc3sB75Q8RF?=
 =?iso-8859-1?Q?SIIswLo2uJ+3BOztPZGRzNXbNLRD9vBmPDrJeeFIe64f/5TiOo/a/piUHt?=
 =?iso-8859-1?Q?zw8EkxofGVeiwe+kab2jCt12lj5E6J6REezvO987fd+Cb8w4y9ZWzwESyt?=
 =?iso-8859-1?Q?LtBVjWFFc5b6B9uNJ6Gdkm0DI7QYpJCASBtN9wk5is0D7qaqVmTN90OCyX?=
 =?iso-8859-1?Q?XrgCiowvadWCy3/ujQ0sItTQ9FW/k2Hw52msY4JdzrPwwPG/hf8CQT1WSd?=
 =?iso-8859-1?Q?BvaP+9BzcRnpR35qFgo40+tP9L8p5tRMOZV+5Uz27v6b2ihAbgyl+ShUwt?=
 =?iso-8859-1?Q?r+S6PAcvwK8VMsqRxQ79InZgJA47krTyq8YfCnEaqaf+Zd9kwtf1OEQxO1?=
 =?iso-8859-1?Q?lWJQgFxkKHzjVcQ1z6j36keG5DQVNFMs3A/JD27LnBAw/IcVar4NDulQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f437bc-54b2-4140-d07b-08ddcb86f9de
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 14:24:33.2222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 39ChrFTBUdLD82ERlhlQOFdCbJAXJy01LNIyWpULl3AQMu2/skpre7V3J2NIFTjkEyxEqIZmkLhgDSJZXtNgCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7421

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

This code is expected to only be used by privileged domains,
unprivileged domains should not get access to the SR-IOV capability.

Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
for possible changes in the system page size register.

Relies on dom0 to enable SR-IOV and PHYSDEVOP to inform Xen about
addition/removal of VFs.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 CHANGELOG.md              |   3 +-
 SUPPORT.md                |   2 -
 xen/drivers/vpci/Makefile |   2 +-
 xen/drivers/vpci/header.c |   3 +
 xen/drivers/vpci/sriov.c  | 235 ++++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c   |   1 +
 xen/include/xen/vpci.h    |   7 +-
 7 files changed, 247 insertions(+), 6 deletions(-)
 create mode 100644 xen/drivers/vpci/sriov.c

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..7b0e8beb76 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -23,8 +23,7 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
  - On x86:
    - Option to attempt to fixup p2m page-faults on PVH dom0.
    - Resizable BARs is supported for PVH dom0.
-   - Support PCI passthrough for HVM domUs when dom0 is PVH (note SR-IOV
-     capability usage is not yet supported on PVH dom0).
+   - Support PCI passthrough for HVM domUs when dom0 is PVH.
    - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
=20
  - On Arm:
diff --git a/SUPPORT.md b/SUPPORT.md
index 6a82a92189..830b598714 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -170,8 +170,6 @@ unexpected behavior or issues on some hardware.
=20
 At least the following features are missing on a PVH dom0:
=20
-  * PCI SR-IOV.
-
   * Native NMI forwarding (nmi=3Ddom0 command line option).
=20
   * MCE handling.
diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
index a7c8a30a89..fe1e57b64d 100644
--- a/xen/drivers/vpci/Makefile
+++ b/xen/drivers/vpci/Makefile
@@ -1,2 +1,2 @@
-obj-y +=3D vpci.o header.o rebar.o
+obj-y +=3D vpci.o header.o rebar.o sriov.o
 obj-$(CONFIG_HAS_PCI_MSI) +=3D msi.o msix.o
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index f947f652cd..0a840c6dcc 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -839,6 +839,9 @@ static int cf_check init_header(struct pci_dev *pdev)
=20
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
+    if ( pdev->info.is_virtfn )
+        return 0;
+
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_NORMAL:
diff --git a/xen/drivers/vpci/sriov.c b/xen/drivers/vpci/sriov.c
new file mode 100644
index 0000000000..640430e3e9
--- /dev/null
+++ b/xen/drivers/vpci/sriov.c
@@ -0,0 +1,235 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Handlers for accesses to the SR-IOV capability structure.
+ *
+ * Copyright (C) 2018 Citrix Systems R&D
+ */
+
+#include <xen/sched.h>
+#include <xen/vpci.h>
+
+static int vf_init_bars(const struct pci_dev *vf_pdev)
+{
+    unsigned int i, sriov_pos;
+    int vf_idx, rc;
+    const struct pci_dev *pf_pdev =3D vf_pdev->pf_pdev;
+    uint16_t offset, stride;
+    struct vpci_bar *bars =3D vf_pdev->vpci->header.bars;
+    struct vpci_bar *physfn_vf_bars =3D pf_pdev->vpci->sriov->vf_bars;
+
+    sriov_pos =3D pci_find_ext_capability(pf_pdev->sbdf, PCI_EXT_CAP_ID_SR=
IOV);
+    offset =3D pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_VF_OFF=
SET);
+    stride =3D pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_VF_STR=
IDE);
+
+    vf_idx =3D vf_pdev->sbdf.sbdf;
+    vf_idx -=3D pf_pdev->sbdf.sbdf + offset;
+    if ( vf_idx < 0 )
+        return -EINVAL;
+    if ( stride )
+    {
+        if ( vf_idx % stride )
+            return -EINVAL;
+        vf_idx /=3D stride;
+    }
+
+    /*
+     * Set up BARs for this VF out of PF's VF BARs taking into account
+     * the index of the VF.
+     */
+    for ( i =3D 0; i < PCI_SRIOV_NUM_BARS; i++ )
+    {
+        bars[i].addr =3D physfn_vf_bars[i].addr + vf_idx * physfn_vf_bars[=
i].size;
+        bars[i].guest_addr =3D bars[i].addr;
+        bars[i].size =3D physfn_vf_bars[i].size;
+        bars[i].type =3D physfn_vf_bars[i].type;
+        bars[i].prefetchable =3D physfn_vf_bars[i].prefetchable;
+        rc =3D vpci_bar_add_rangeset(vf_pdev, &bars[i], i);
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
+static int map_vf(const struct pci_dev *vf_pdev, uint16_t cmd)
+{
+    int rc;
+
+    ASSERT(rw_is_write_locked(&vf_pdev->domain->pci_lock));
+
+    rc =3D vf_init_bars(vf_pdev);
+    if ( rc )
+        return rc;
+
+    return vpci_modify_bars(vf_pdev, cmd, false);
+}
+
+static int size_vf_bars(struct pci_dev *pf_pdev, unsigned int sriov_pos)
+{
+    /*
+     * NB: a non-const pci_dev of the PF is needed in order to update
+     * vf_rlen.
+     */
+    struct vpci_bar *bars;
+    unsigned int i;
+    int rc =3D 0;
+
+    ASSERT(rw_is_write_locked(&pf_pdev->domain->pci_lock));
+    ASSERT(!pf_pdev->info.is_virtfn);
+
+    if ( !pf_pdev->vpci->sriov )
+        return -EINVAL;
+
+    /* Read BARs for VFs out of PF's SR-IOV extended capability. */
+    bars =3D pf_pdev->vpci->sriov->vf_bars;
+    /* Set the BARs addresses and size. */
+    for ( i =3D 0; i < PCI_SRIOV_NUM_BARS; i +=3D rc )
+    {
+        unsigned int idx =3D sriov_pos + PCI_SRIOV_BAR + i * 4;
+        uint32_t bar;
+        uint64_t addr, size;
+
+        bar =3D pci_conf_read32(pf_pdev->sbdf, idx);
+
+        rc =3D pci_size_mem_bar(pf_pdev->sbdf, idx, &addr, &size,
+                              PCI_BAR_VF |
+                              ((i =3D=3D PCI_SRIOV_NUM_BARS - 1) ? PCI_BAR=
_LAST
+                                                             : 0));
+
+        /*
+         * Update vf_rlen on the PF. According to the spec the size of
+         * the BARs can change if the system page size register is
+         * modified, so always update rlen when enabling VFs.
+         */
+        pf_pdev->physfn.vf_rlen[i] =3D size;
+
+        if ( !size )
+        {
+            bars[i].type =3D VPCI_BAR_EMPTY;
+            continue;
+        }
+
+        bars[i].addr =3D addr;
+        bars[i].guest_addr =3D addr;
+        bars[i].size =3D size;
+        bars[i].prefetchable =3D bar & PCI_BASE_ADDRESS_MEM_PREFETCH;
+
+        switch ( rc )
+        {
+        case 1:
+            bars[i].type =3D VPCI_BAR_MEM32;
+            break;
+
+        case 2:
+            bars[i].type =3D VPCI_BAR_MEM64_LO;
+            bars[i + 1].type =3D VPCI_BAR_MEM64_HI;
+            break;
+
+        default:
+            ASSERT_UNREACHABLE();
+        }
+    }
+
+    rc =3D rc > 0 ? 0 : rc;
+
+    return rc;
+}
+
+static void cf_check control_write(const struct pci_dev *pdev, unsigned in=
t reg,
+                                   uint32_t val, void *data)
+{
+    unsigned int sriov_pos =3D reg - PCI_SRIOV_CTRL;
+    uint16_t control =3D pci_conf_read16(pdev->sbdf, reg);
+    bool mem_enabled =3D control & PCI_SRIOV_CTRL_MSE;
+    bool new_mem_enabled =3D val & PCI_SRIOV_CTRL_MSE;
+
+    ASSERT(!pdev->info.is_virtfn);
+
+    if ( new_mem_enabled !=3D mem_enabled )
+    {
+        struct pci_dev *vf_pdev;
+        if ( new_mem_enabled )
+        {
+            /* FIXME casting away const-ness to modify vf_rlen */
+            size_vf_bars((struct pci_dev *)pdev, sriov_pos);
+
+            list_for_each_entry(vf_pdev, &pdev->vf_list, vf_list)
+                map_vf(vf_pdev, PCI_COMMAND_MEMORY);
+        }
+        else
+        {
+            list_for_each_entry(vf_pdev, &pdev->vf_list, vf_list)
+                map_vf(vf_pdev, 0);
+        }
+    }
+
+    pci_conf_write16(pdev->sbdf, reg, val);
+}
+
+static int vf_init_header(struct pci_dev *vf_pdev)
+{
+    const struct pci_dev *pf_pdev;
+    unsigned int sriov_pos;
+    int rc =3D 0;
+    uint16_t ctrl;
+
+    ASSERT(rw_is_write_locked(&vf_pdev->domain->pci_lock));
+
+    if ( !vf_pdev->info.is_virtfn )
+        return 0;
+
+    pf_pdev =3D vf_pdev->pf_pdev;
+    ASSERT(pf_pdev);
+
+    sriov_pos =3D pci_find_ext_capability(pf_pdev->sbdf, PCI_EXT_CAP_ID_SR=
IOV);
+    ctrl =3D pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
+
+    if ( (pf_pdev->domain =3D=3D vf_pdev->domain) && (ctrl & PCI_SRIOV_CTR=
L_MSE) )
+    {
+        rc =3D map_vf(vf_pdev, PCI_COMMAND_MEMORY);
+        if ( rc )
+            return rc;
+    }
+
+    return rc;
+}
+
+static int init_sriov(struct pci_dev *pdev)
+{
+    unsigned int pos;
+
+    if ( pdev->info.is_virtfn )
+        return vf_init_header(pdev);
+
+    pos =3D pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
+
+    if ( !pos )
+        return 0;
+
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        printk(XENLOG_ERR
+               "%pp: SR-IOV configuration unsupported for unpriv %pd\n",
+               &pdev->sbdf, pdev->domain);
+        return 0;
+    }
+
+    pdev->vpci->sriov =3D xzalloc(struct vpci_sriov);
+    if ( !pdev->vpci->sriov )
+        return -ENOMEM;
+
+    return vpci_add_register(pdev->vpci, vpci_hw_read16, control_write,
+                             pos + PCI_SRIOV_CTRL, 2, NULL);
+}
+
+REGISTER_VPCI_INIT(init_sriov, VPCI_PRIORITY_LOW);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 09988f04c2..7af6651831 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -120,6 +120,7 @@ void vpci_deassign_device(struct pci_dev *pdev)
     for ( i =3D 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
         rangeset_destroy(pdev->vpci->header.bars[i].mem);
=20
+    xfree(pdev->vpci->sriov);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 06f7039f20..9e8dcab17e 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -138,7 +138,6 @@ struct vpci {
          * upon to know whether BARs are mapped into the guest p2m.
          */
         bool bars_mapped      : 1;
-        /* FIXME: currently there's no support for SR-IOV. */
     } header;
=20
     /* MSI data. */
@@ -192,6 +191,12 @@ struct vpci {
             struct vpci_arch_msix_entry arch;
         } entries[];
     } *msix;
+
+    struct vpci_sriov {
+        /* PF only */
+        struct vpci_bar vf_bars[PCI_SRIOV_NUM_BARS];
+    } *sriov;
+
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
     /* Guest SBDF of the device. */
 #define INVALID_GUEST_SBDF ((pci_sbdf_t){ .sbdf =3D ~0U })
--=20
2.34.1

