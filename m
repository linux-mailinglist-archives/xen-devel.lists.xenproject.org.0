Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFCFD175C4
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 09:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201205.1516896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa24-0003eg-3g; Tue, 13 Jan 2026 08:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201205.1516896; Tue, 13 Jan 2026 08:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa23-0003dJ-VX; Tue, 13 Jan 2026 08:45:43 +0000
Received: by outflank-mailman (input) for mailman id 1201205;
 Tue, 13 Jan 2026 08:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kCXa=7S=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vfa22-0003C7-8j
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 08:45:42 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d58556c-f05c-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 09:45:40 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB8709.eurprd03.prod.outlook.com
 (2603:10a6:150:93::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 08:45:35 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 08:45:35 +0000
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
X-Inumbo-ID: 3d58556c-f05c-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtUpDEEsjsY9yUano1cwJNw6/cP53dtvs9Vpytuntxua1ZIjRHTazCT0VZPPd2va+2aIR93vLPoJjm8HQ+M5XXfEKcxFVteiNRh3N+qo+nyiEAk3T0FVO9iWnnhrgOWJuA/YmXrScqYXhkCcFK6kYQUhq2JOtfQzq3aZyc2BLYaYgTv0WDDfknRaGTc73f4Zr4vFLO6vQCX6yAcSyOpS8eQ/+q5rcSvza/Nshb7RvErXA1byMIKXNbQGb33Wvh8l+FGy6lbSGfPucLEQMsFWgev2ihfkNRWQBwSlQ/aOsmUzzYMCzkUcOEWwZo97vJfsJfKylXbFZ7I44NkbwJWYTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WifUOeJgqNlDzh/YVDJM7F9LX69JT6jLySabIGEh2KY=;
 b=rnmtutq6gT2JanYRSPmY7BLlwb/YGoh+E3FxA2vSaCk4+m5CALs0M+viP26kz8lhCLIte3gGuwH4nbZ2IXiEOXU4nWItzULeKwpa+0g5+6KykAKUH/FTNPIkOEx5NDGAQZQhTxKhcFz0D/iSoiu0wkzAiutZVvflIi8V3yR+9XhHRiHrisu1XeA93QybJWrFtjOi/c2ti1wSPXKFoHhdK0Bbr1piJXgnDEXAWDVQeHNynma8d7KoaRkk9KdZJnb8oHgE273T96e1Slf5P3U4T72Pu8B+VBv1PXRrHFJKXKQf4eU37W0ZU/SBf+A8QJPlabKKaHXbHk4MMUGHQmOifw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WifUOeJgqNlDzh/YVDJM7F9LX69JT6jLySabIGEh2KY=;
 b=AK4Jrpy86J8uhLc0dRinVNzhzwnaL4GyxBOA+0CRsnzdtebmre4QXNBEXy19ycDHwmnkIXxRB8/9QXiiMaVm3o1jX5arNyC2lpO1bI7t810TRwxwWHIBAK72rzmZIRFySCZaUUU0IzL94OvH2H9BbJsUkPkphUhWwZe5eHt1/cMpKDg7tlynBM7UblkIpwT9xiRrhRCtBVXTeNkK4DSO8q8nR8Sd2V+/d3JfvJy7/QCmZXzfHzq80OsdMSWjiuK1nCMLwiG4reL3TaPGFyd6GlYRFvOLi/v4HvtY8kj251NqL+OdfPub7qeQKg23JRUS7jGpE5rlCOaUFMmA5qUt8Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 2/5] arm/irq: Migrate IRQs during CPU up/down operations
Thread-Topic: [PATCH v5 2/5] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHchGj73A4kTs3O/EWyR3N/eFmlXg==
Date: Tue, 13 Jan 2026 08:45:34 +0000
Message-ID:
 <63892f56f227fae75d78e2ef2ee63887e74c523a.1768293759.git.mykyta_poturai@epam.com>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1768293759.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB8709:EE_
x-ms-office365-filtering-correlation-id: a5ad89dc-f3bf-4a1a-0864-08de52801e3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZSK1d/FmJjW25s6MSw1hJvXmSJ3H71JYUIkeKrIOOMQluibrA04SdcPQkc?=
 =?iso-8859-1?Q?ESJGsevrp9RgB2ofK57IgBDt87GhcWkM3nCH5dNQiqUcSmIJxf6OH2HcXF?=
 =?iso-8859-1?Q?vhb2vFCCfeIAVwRfMRbYVG3hbZutyQh/cFHZUVd0h/mM0YAJyVPjZRYxWc?=
 =?iso-8859-1?Q?ijHHDKbSDWGOzFtNk6hTTFC2EY18XVHFlmODZMbh7s9rZD0LbPsUVc3z5z?=
 =?iso-8859-1?Q?LdcrpaSsFbrQEF/MGrEfDJPuda7FADw6B+5FiuySHGYeS0q66PNCYcwK/L?=
 =?iso-8859-1?Q?iikm1k5Fg+qn5GTwmaDSEQ3kZGsGCjkLqAJYGwQs4GI7XX4G8LE5l1VW9o?=
 =?iso-8859-1?Q?VwZFozJypE60m0YIDQJCCDIJlZySoZq6zCeuGfeaRNvhrxL8zFn4ePOJAm?=
 =?iso-8859-1?Q?uMIQZtO/s2aQsORxz490F1zaGkzL87hkKVYQpLOGXTs7eeCJ2t3hJs3UeN?=
 =?iso-8859-1?Q?Ty3zMvAXx4MTlLokOBE7FZ4xd3I+gcxlAn95dRKmPOikdb150++HO12P4i?=
 =?iso-8859-1?Q?nB9dssXZPSnE5lWLMDfUWk+O3dqkoxvYkVjpOAnn7c9yvvB1F0MUqFd5gA?=
 =?iso-8859-1?Q?u94i2Nzo+04Aw9eWWShSWpK8D6WW0Y50tDaU5CE60sY78V2F+CSwVybq8P?=
 =?iso-8859-1?Q?ncINAcGiWfnWAYIQ07qH+pOnBcseUhp/TLdTJTgFgPNIKDazJXRxslwVHN?=
 =?iso-8859-1?Q?eGlqV+kdiSqbDXAiKyHDTHannEG1Q4ql/uleI0HSL29GuH37BfaUKbprnN?=
 =?iso-8859-1?Q?Oq93ubvPQiCMenTpnweKnj334qxrIkUWY37hx1kEgtldZvqPeoCkUE56JI?=
 =?iso-8859-1?Q?zTCS/D/OvakiAEUrBdiBRLN38Bpnh/Mocfjo2bbJS3N6oolcykyPudqkk7?=
 =?iso-8859-1?Q?JApR6hgTRhKKwRcflce4zg+54jyW2FC60vwqzR7niGbVj7RSy64rTpO9q4?=
 =?iso-8859-1?Q?7gBw90GPi1tKVXsAR1KPuz/E+hdWMvmQ901i9rmGoPoOL2TYqn7wmpzHu0?=
 =?iso-8859-1?Q?UaoylHOQHPq2EwDYXO7UsOaT+R/wHwylWFbglvDJ9fUGO3eR7Do29TsWCO?=
 =?iso-8859-1?Q?NkFeBoq+w7aX9PH4N5WdFqdBixkusyihBbBMeQQSEJfHMZeJGLqIBS/zr9?=
 =?iso-8859-1?Q?54yHkBP/KjJu8wcmoXwT9Eh0BxFUEVKUS854FPXxZtdVgz/RO5WeFp5r31?=
 =?iso-8859-1?Q?mEahHV65XHeSUUEKF2Ts+ZzNXL41rXIXSicHgFgKNhjNvTJVy1prUIGxZn?=
 =?iso-8859-1?Q?9F3w6tG85/2OEv7NxqBzSSCalAR2hOLfv6qfbxkL/ID0DveHjddnyCtKFu?=
 =?iso-8859-1?Q?cDUEi4aThNigN7byNaoqcrUT0MfsPRsGRZfHypUvRC+nYXGVu5DwLB1AWd?=
 =?iso-8859-1?Q?lWjMKQpdnpDiK4yKO842vd850dHHJied0tVrNicPZ9dNPO9Kp1SICs6uct?=
 =?iso-8859-1?Q?FR+7s1MlOHfbjnQYN8goF8X5CJF8tGHNDX7EJ7T1GauqCVpEPvuB+iY8oI?=
 =?iso-8859-1?Q?z4HCzat6iVXWIl6WT0KMRG+ouciNhgriNbjSoGxvE6QlBjvQ/yK0pctFw0?=
 =?iso-8859-1?Q?xx9lu6+skcYdZPJaYKQ5QKMnWLFn?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HnPXaj9VqTziWChYbjXvpZ2sfShRsPTJP9QqsPSz1vP9MSuLncuuTv3wiI?=
 =?iso-8859-1?Q?ioFncBR3ADeX4Ln727ZDtZY378XkPJY1YvWdM17ZdGa5JUFQQf8UJd8JQx?=
 =?iso-8859-1?Q?61ar2IYnLoDRvkBbzBuuk3rtR0sHyKZtH/idBM8erielUHxL/djU7sinki?=
 =?iso-8859-1?Q?gowR+1elULXPIKjP1ksO7qMImzwSGsB4GjesXt7Cmde1Ce0JxKKc27dcKG?=
 =?iso-8859-1?Q?4I80cu3UUnTIEP7+V1RRP58xH0KxCwHdZM9hhMEMT2UWIU2PQDEMatvncq?=
 =?iso-8859-1?Q?OEGqTzXFRNjiTJdKg30czyKsD3ElpDR1rWOr3pf11p1k1oUsChydoex/m1?=
 =?iso-8859-1?Q?mdyrBlXU/E3uDtyKrgFtQp0QU/4X6yP9dsTkkodqHakWSJCzECx3crnS45?=
 =?iso-8859-1?Q?6kUj9oZQMDnJ7KfqXs05uRJt+fkGzJ3c3Tur8yrxj+oZEUhQv/qPp0IUKI?=
 =?iso-8859-1?Q?qNt5g0sR++cKKsSmotfVggtEguFtIQg4ntdAMXGke6X4NaZhGrkmO1mQr2?=
 =?iso-8859-1?Q?nOlz4gl/48pFLcTyB6EMZb8lTNL/t778CHTgKRYk2UFeH4l5rZfz7oZjWU?=
 =?iso-8859-1?Q?TiflnxVzt8Tx82bdHZpXdMo48rzsEWt00IqXvtg9U0AqDa/mFHUNajzsYp?=
 =?iso-8859-1?Q?lg0mC+KZ7W5yBEdNq8sSte84GKIrAS1nLwtP+ojGdap0I4QS2pOYI99jd1?=
 =?iso-8859-1?Q?Cjciy8pXxsqfWFsFWGbQr2os1AsPVct7ps9I/DwlxlkeHdLmFuEqRno7EF?=
 =?iso-8859-1?Q?TX+bbivUgQaxGGVjI/wmTUPBHq7hjf0uN8/rkNflAjQ1bAskRU20M30euK?=
 =?iso-8859-1?Q?K9LBBEf5K7vTKL6bZD2VyBBLuHcjVy+4gsv4PjL61MbHRxQaKk2GNrOufg?=
 =?iso-8859-1?Q?2e3YoDNVXqes1iva9IE3wCa38U3/yFwwHXQ75NFvpeRBSFopmi/JqM+qyk?=
 =?iso-8859-1?Q?7ijb8NAiWHiwnhcjfCNH/8J0XOY1FADZRMVZEgsgdBqmAFlgEgf0AYZL2l?=
 =?iso-8859-1?Q?+JxYF8jP1J67tEOhBxDhJKpG9HNYhvz35mhkNFForBymf5nhzaHxvBhqAz?=
 =?iso-8859-1?Q?NUMx+FPy9tlRDWU7e0zs2X6+74Jlievv4aAFrwOej6eR9k9Jae7vRZK3AL?=
 =?iso-8859-1?Q?R8aFCJ32Lxpwhwon1+fgF+gGeNcQvOoCyvwrGSTFelTO+hSQttOho/R5py?=
 =?iso-8859-1?Q?/XePxqZwAxo76ZmsiVyiySED7xWEH78YGyORXgtoNoRoIFLqDOEbkmgipW?=
 =?iso-8859-1?Q?nDdIRnMyRbQekeAnJaM7a7hwZkjafnnVDQtcukP5e29L2AlayGI08wPyB7?=
 =?iso-8859-1?Q?yFBkospSgtUa1sinH+b7cmNTGbswE6l87fK9LapN7I5OrV/Y8KA3cJoZXd?=
 =?iso-8859-1?Q?w99u+GO4GAnKWuyV5T1xrjxlQiH77JGmTIQcJ6FHDBo+ymjw6FrqB5qf5S?=
 =?iso-8859-1?Q?anADlCTKDr/Ru/Xh0W9F0HGpW9vpf5NCCGvHCzspl01aO+WPcMos5rbHRO?=
 =?iso-8859-1?Q?zTGQbe7Ijq13lFJDQlEdI0+SEb/fmJlmFYLOLEGJNy6trDtTCsOM0a6dn+?=
 =?iso-8859-1?Q?9bUqs9EZr7VkwQT2wu6PL8ds0e0slTUAlegZu9Rebl6AqXNrk5m00pVKIF?=
 =?iso-8859-1?Q?4WpAKb4gRBU8J/j7YatIn2ZsMQH5Gf6j3m8/i6IPThzDppAuWEvBkmm6Sm?=
 =?iso-8859-1?Q?chMTVxoRl9Bz0aDiCnnK0mpoosBzCTptLoRWvUUTakjgZ5Tfayc0E46bJN?=
 =?iso-8859-1?Q?0prjL7X1M7l31ObfWAas6RK1p5F9MHOxtyX+SpgyhWsOm/FD6B1MSHP9gy?=
 =?iso-8859-1?Q?jXJzYL6lrdks3G26rYBr1Lun+fhjJ0w=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ad89dc-f3bf-4a1a-0864-08de52801e3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 08:45:34.8464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nneXLAvNx/qNE0/i1jaA9Zn3mSzv+iMZoseRK1l8rYnjyF5sI6ojOoURBf8HMhN6HciFkgFBMAsielrU7xdGzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8709

Move IRQs from dying CPU to the online ones when a CPU is getting
offlined. When onlining, rebalance all IRQs in a round-robin fashion.
Guest-bound IRQs are already handled by scheduler in the process of
moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
itself.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v4->v5:
* handle CPU onlining as well
* more comments
* fix crash when ESPI is disabled
* don't assume CPU 0 is a boot CPU
* use insigned int for irq number
* remove assumption that all irqs a bound to CPU 0 by default from the
  commit message

v3->v4:
* patch introduced
---
 xen/arch/arm/include/asm/irq.h |  2 ++
 xen/arch/arm/irq.c             | 54 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/smpboot.c         |  6 ++++
 3 files changed, 62 insertions(+)

diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 09788dbfeb..a0250bac85 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -126,6 +126,8 @@ bool irq_type_set_by_domain(const struct domain *d);
 void irq_end_none(struct irq_desc *irq);
 #define irq_end_none irq_end_none
=20
+void rebalance_irqs(unsigned int from, bool up);
+
 #endif /* _ASM_HW_IRQ_H */
 /*
  * Local variables:
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 7204bc2b68..a32dc729f8 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -158,6 +158,58 @@ static int init_local_irq_data(unsigned int cpu)
     return 0;
 }
=20
+static int cpu_next;
+
+static void balance_irq(int irq, unsigned int from, bool up)
+{
+    struct irq_desc *desc =3D irq_to_desc(irq);
+    unsigned long flags;
+
+    ASSERT(!cpumask_empty(&cpu_online_map));
+
+    spin_lock_irqsave(&desc->lock, flags);
+    if ( likely(!desc->action) )
+        goto out;
+
+    if ( likely(test_bit(_IRQ_GUEST, &desc->status) ||
+                test_bit(_IRQ_MOVE_PENDING, &desc->status)) )
+        goto out;
+
+    /*
+     * Setting affinity to a mask of multiple CPUs causes the GIC drivers =
to
+     * select one CPU from that mask. If the dying CPU was included in the=
 IRQ's
+     * affinity mask, we cannot determine exactly which CPU the interrupt =
is
+     * currently routed to, as GIC drivers lack a concrete get_affinity AP=
I. So
+     * to be safe we must reroute it to a new, definitely online, CPU. In =
the
+     * case of CPU going down, we move only the interrupt that could resid=
e on
+     * it. Otherwise, we rearrange all interrupts in a round-robin fashion=
.
+     */
+    if ( !up && !cpumask_test_cpu(from, desc->affinity) )
+        goto out;
+
+    cpu_next =3D cpumask_cycle(cpu_next, &cpu_online_map);
+    irq_set_affinity(desc, cpumask_of(cpu_next));
+
+out:
+    spin_unlock_irqrestore(&desc->lock, flags);
+}
+
+void rebalance_irqs(unsigned int from, bool up)
+{
+    int irq;
+
+    if ( cpumask_empty(&cpu_online_map) )
+        return;
+
+    for ( irq =3D NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
+        balance_irq(irq, from, up);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( irq =3D ESPI_BASE_INTID; irq < ESPI_MAX_INTID; irq++ )
+        balance_irq(irq, from, up);
+#endif
+}
+
 static int cpu_callback(struct notifier_block *nfb, unsigned long action,
                         void *hcpu)
 {
@@ -172,6 +224,8 @@ static int cpu_callback(struct notifier_block *nfb, uns=
igned long action,
             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
                    cpu);
         break;
+    case CPU_ONLINE:
+        rebalance_irqs(cpu, true);
     }
=20
     return notifier_from_errno(rc);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..e1b9f94458 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -425,6 +425,12 @@ void __cpu_disable(void)
=20
     smp_mb();
=20
+    /*
+     * Now that the interrupts are cleared and the CPU marked as offline,
+     * move interrupts out of it
+     */
+    rebalance_irqs(cpu, false);
+
     /* Return to caller; eventually the IPI mechanism will unwind and the=
=20
      * scheduler will drop to the idle loop, which will call stop_cpu(). *=
/
 }
--=20
2.51.2

