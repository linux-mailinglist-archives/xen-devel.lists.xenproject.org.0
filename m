Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC547BA872F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 10:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132646.1470911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v39ZB-0006WX-U5; Mon, 29 Sep 2025 08:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132646.1470911; Mon, 29 Sep 2025 08:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v39ZB-0006U1-Oh; Mon, 29 Sep 2025 08:49:05 +0000
Received: by outflank-mailman (input) for mailman id 1132646;
 Mon, 29 Sep 2025 08:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbRY=4I=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v39Z9-0006Tl-N2
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 08:49:03 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25aa50ae-9d11-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 10:49:02 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PR3PR03MB6668.eurprd03.prod.outlook.com
 (2603:10a6:102:5f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 08:48:59 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 08:48:59 +0000
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
X-Inumbo-ID: 25aa50ae-9d11-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2r36sYkvQpsv/7vK2cd/6Rl7lY7fomd+EC3G1t2W1cnCWWCzp0HHG3em2i7BxRWi33F5aSQtUAy+T9VDOjUHPQiQ1k1Uj445zyGJaQqDQIh0lkG3ACy/4OHCtQzwflVnCySe2HQ00HIn2nMAC0Us/BEkWq5BolisUCiVmhtyqEbWrb52pmtnH6mva5mdpf+k69Xr9LzOhLIzFAo8gm/xqykfZ3P43LCdPIL8S7hyc9IodRvnfoQsV90V0Se/FuCBAam/f9wb7A9sbW6PdyuTXObags+yk7MaZhGHfXscGDnfFMT5NzXkFUNeiZwMbcoidlgpnhLZvNnTpInb2YelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JebzVSnPshn5VcYXnyU+FoIqiAJQJxUQGCyo25WU9U=;
 b=LlCqopJssBTa5DTtQ/grSjBq6jdys3c4UtCtsCOW38KuUAb6ctSUtienKYo/P9iS1QKhddxpOtl8xQ9SiEaDkG3CDJj7KgSRulBWyhYQPMswDb95h0nTe/Trb+XRwXBYzbh3GoCB3/HDHRU9obGRSKM3HWQLjsrThfhGrdijk1NaItw1+Cm372A/mWuscZCCEzsPPiQdcNoyTWD1TuTMOjtmgM/FB/8MNX9afWN52K2ZetE4SjVokhIChs1+xzszSCaLkr/nmjGuOj5Rr+JVXAwrh1WZDMBw+OeJgErArRTGW1eC8OIhn1XpesDPQg1bZImBLefAKN6yoEGY/SEX9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JebzVSnPshn5VcYXnyU+FoIqiAJQJxUQGCyo25WU9U=;
 b=rePkgrTrkRbLZ2xdu2FFIRr8wFB6DzdTeD/Xq3cIZwH86Vi/tNm/1yDAZlHBjaxAi7HdFJ3CRFGl3hWkFEohgs1cdzDl+H0XaOPVdfOnObRXMnc4xC3g3JoIJVTCpXmNOyD91CKln/1U8/MjlNT3ad82qp/e571k0sKrBcROmjQRvpFptX6Jz0yfiwzmErlWYHAJRoUxuq+vOTdjg2HSqyd4DTaiStLkqEc8siavBy5QX/Qt6Gp+VUqM5td6/YwTz6oWcwIYanS5umNYAaovnIw7B/iLirTnU9BHIgG0WPND/43vexkqRV6S1v7MZaSdKocuZIfNx1y1mKouti1vWg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/4] arm/gic: Use static irqaction
Thread-Topic: [PATCH v2 2/4] arm/gic: Use static irqaction
Thread-Index: AQHcMR3luyMo51OjGE+9JG+sKBjsjw==
Date: Mon, 29 Sep 2025 08:48:59 +0000
Message-ID:
 <7ebd435d510c88e2840ee991f8fd75f25ad66f75.1759135193.git.mykyta_poturai@epam.com>
References: <cover.1759135193.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1759135193.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PR3PR03MB6668:EE_
x-ms-office365-filtering-correlation-id: 6c3a6d61-4bd6-4675-f7aa-08ddff35084e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3OQB0cfGPG2Px/wzSKEMhVuLqgtFA3OmDBLIx3CcVN9COL4acWd6FKxXxC?=
 =?iso-8859-1?Q?RjnzM6pG5lIhxArSFcqdSkqkT7luc6IqLM/AeR2gGhpkB106t2QUFdc/T3?=
 =?iso-8859-1?Q?D5JQI96EY5OKphxET3wKhdpPeuJo+HuVlQe/UW5fTbas+Macxn22pEOiNM?=
 =?iso-8859-1?Q?ro/mTtcy7c36Um2jTC5XFwDaFJIcNJp5zz+GOjXREx5QFcqJLM0emxkfWB?=
 =?iso-8859-1?Q?h8bFFyJM4iuz9Fhjb+erxT5oW39BH6OA4yfzNVEPBVpy/olY4tv4/BeOtK?=
 =?iso-8859-1?Q?r2dDfm7gToUoS6N0rctcuA+OTf/7nE5vsGXTXhiGE5GgrUkK5aIO4ULTce?=
 =?iso-8859-1?Q?Eo6u0ZI/iQPjPXvnHlOKmKHJzSieHzLduGGb7l4buExthjE2LWQNwmu0mj?=
 =?iso-8859-1?Q?pBOGnrcXEPYvW6tizIqB1r8RbmsxGQm7HqJne60V9BKKZyRWRGZ2Sz9cTJ?=
 =?iso-8859-1?Q?gsGBcYh4KrSo//OLwDwLjQDamnqjJ8Ky/ZHdvK3U5tgcrRAWEnevOi7zT+?=
 =?iso-8859-1?Q?TZKm/RIOW/hPlJcIeKexjo6jTZ8Pb4M0RceVb7tAgldDdGb1VgYAAkCgH7?=
 =?iso-8859-1?Q?ZpAjfrhkN4sA26H8DGCFk27sGWLzm2I1ucNkeS6V3QuKAV7mK1kVlcIndS?=
 =?iso-8859-1?Q?F5JjcP81hzBjcRchGnH+mwwY9IrCBFmJXgn+Yjt5vsO3LGISV7ddRQ9Pes?=
 =?iso-8859-1?Q?u0bgS8Wp5R2OP4jNwrIminQ3PmTSU68e0koBqOAKR7sJ1FCcBTMPn74bIK?=
 =?iso-8859-1?Q?KiCnXu4tMeN8+ZRZmGnc9TWt7wYfO/Uhc5CNPZDSMlMh4rllm+GjsSup83?=
 =?iso-8859-1?Q?nVl93JwGjcd7t322j6EZXSJIIWWq3hG/op0geN0C6oJAC8uG/g7TMaAjnc?=
 =?iso-8859-1?Q?YkLmUDpyx9Gyf4kVD6CbAtUS4SwE7RYvAti87Fx/RyeF6M3F3Fs/0+fmO4?=
 =?iso-8859-1?Q?OF0BIlVBIbwZ7ArKc5VDqm7Zcg6M6Lhp35mYpr1Y1uRWrMVFH8ix0xtyyL?=
 =?iso-8859-1?Q?hvZ3y63Olu26HI5FhrXZG+iFfk5OKGRMFUjZCnZUeBFvNaRdbhF9yVllFz?=
 =?iso-8859-1?Q?T98zzGUe8xmdhPD8Fty9V+Va5VLphFQkZC5f/lHUXn2JIPzvE0HE2yn/HX?=
 =?iso-8859-1?Q?ZrAm4MqiSdgKZF3PJQkfgdAapM+bpxNQVgH8CAY3JqCBMgDtFdTPPyXk9z?=
 =?iso-8859-1?Q?923Gu4PFuG8C9RysGEiCvburgdUCFNuMaQ7Kk7BH6QuCOmdDkMAYoO2J5q?=
 =?iso-8859-1?Q?rRglYE4C4FQJyM1VE0tS53e7qTQlk2qgbOVeC/lWJdr/WA9lvjwr3kE091?=
 =?iso-8859-1?Q?k+iin09uEuCpFafLesOnEVRq6FrgzbYL2QgyCmSTky/pnQManqEk+zQRLJ?=
 =?iso-8859-1?Q?JmmX5GGW/G0bmRrO+2VSkJq5aJ7yzEU77P/2PYJI1okxU6oJ0hjpljJC9v?=
 =?iso-8859-1?Q?sJ/RP/zYMW3oX+KBqPmET3P6RbmCX68Ym3mZAImITRuGwf2lBYrjzRCjz8?=
 =?iso-8859-1?Q?fV8yfkgusKEipcE1pVcvAK+v43/O50RrF8gxBbHMaIZvz5PVaGXtaoQFTP?=
 =?iso-8859-1?Q?K8T0fpy2yiI/AdbJEFjkrhJgWg/M?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1pTaoNY3c2LtaQtjUqMWpp5WKlfnCev2SaLo+D0i2JBa37MoFHuBBQFZod?=
 =?iso-8859-1?Q?/0UHEevthiW1lr2u1lCCVaJODUO99JyQQnUWka6hfLv4Mj3ImCenjFSfcT?=
 =?iso-8859-1?Q?+dAp2//ohBwJPqkduyCL1RkgFkKI8yZkaFUAeQiQSoh6FwdqwxX5oUoKcd?=
 =?iso-8859-1?Q?XTa80JENPj4RtxbeSlirHUL95vrRORLn5Blc6BR6mgYdilCoNnelzJnsDA?=
 =?iso-8859-1?Q?UNH4cEnTarfhFRXYTARnBR7JaNey4IQ8/3QIwMjNadANrXkVzLQx7A80gJ?=
 =?iso-8859-1?Q?giRNpDlSVpis28gz2a1sx4/8xj3JGLeLb6LCf9DNiCGudfaj2qfvHaYbCf?=
 =?iso-8859-1?Q?T2XaNLKGjl4UGNRYgeCBBupLk6xGRIfaprAvpyzsBR9ZbtyDwXS3f0Rt5m?=
 =?iso-8859-1?Q?KTH4CcRZ7O9+Hm1CqBZSUjifwdaj+6u7b/mxQWI0a9DH9M1Urwu6xPiDIU?=
 =?iso-8859-1?Q?+xrN/Fbu5SdwXOQJ41A2kjczqtClGyx8qQWHP7glfmBMXJVHUeOTTjETyH?=
 =?iso-8859-1?Q?tgVptvR0kiYDKmP9wuFm5jDgqe5cLMfLts28YYktUmpgzcFDZ3r9GU+WOE?=
 =?iso-8859-1?Q?kP2u/3BPIpJfL8zTPhQRob0sNOLnm1H62sDkVq7JQ5iJWSIZ/dI8MomeP2?=
 =?iso-8859-1?Q?P7CZ7alJt0mCOfsPzgy8RpguN3y7YSuY0yf+cdgeMdKjYAOEhFa5UlMy2K?=
 =?iso-8859-1?Q?0P04fI4jj9irzdFYZEoMPkNThMhzIix13vlx4nD08Y5lQve5V/S4rCg5vD?=
 =?iso-8859-1?Q?/TdX9cAJidDN+RXXED/RhJCVc47M9q8Ft1AycdrStvmaKWkn8NTnyR9fRv?=
 =?iso-8859-1?Q?xt8tNumRJtCOQQgjsYJofMHyBD6E+7/+IJSlJz4pYD/IvN6SSCUghgVOzP?=
 =?iso-8859-1?Q?AmFgwhrZAax4Gn0eS5S1ivD/MPFZbIl3gkrsPXf7lWIU3TCYMy/ZsHKYnD?=
 =?iso-8859-1?Q?VEOVbiZmERwQHouAH72CjVNJHiSSzDXOnY/3cld1g7VUEB3ov0MEvOPlpt?=
 =?iso-8859-1?Q?WQeTmq/k//N1w5iAkLyXwsPXGvcl4Sfx8zQtf6KyC6AgA4v8NKu85b/PlX?=
 =?iso-8859-1?Q?gtxnSwGc2SJuxHKERtY8g3uUOLv7QXGZdDqzRn6H9zGS4pLFWn5uVCgMjP?=
 =?iso-8859-1?Q?s14ZnBrF0z7bFitckY3rl5wFzTXZ3UeNKFyxaU1UUPpomFR9KgnPCrBntE?=
 =?iso-8859-1?Q?PGhJA25iuxRVeTlA3OgnDg8qP1uUlHBvbix/qnich10tlDtDfF22HCMBb2?=
 =?iso-8859-1?Q?IeuBZXUD60PQhe0mHcMM4MDSmRDE/DBfWqoKIVlI7piun9gLPRRS5zUsXK?=
 =?iso-8859-1?Q?mtEM/FVRpngfnDHzxtNCFpC6OoacCDfq+G+wB2bz+qWm9Q0fv2YWK5qoLH?=
 =?iso-8859-1?Q?nztLuqDejKyJKH+C//TYjDcNZ9xFWkY1d5RIlkhvSza6XLCTTM2jXRo3bv?=
 =?iso-8859-1?Q?bJbZ/KbkxNs4gM4RVfJ1I63Oo5HPzxezi1QrFn1FW9wvwZncPTYPJSPSzN?=
 =?iso-8859-1?Q?G15xKA8nTNmsAOhwf9VwdaY9ybf/lfOJnEC/hd3M1EXsJWykDbPVAhWjnE?=
 =?iso-8859-1?Q?KVQWxi0wbIqevIrerwXAilgzIReit5J30TuSzUaoMMoTGjHXSUUOGsNk9J?=
 =?iso-8859-1?Q?u7TUoG1Y9u2FlCQaFMcE7nApvr8+H+jLY2uJUl7N6taixHjpTUJqjgMQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3a6d61-4bd6-4675-f7aa-08ddff35084e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 08:48:59.4095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqekYeG9AGuIpfkO9lUs3EZafykq1YJUGlpQpfqKxGtFv/AIszRB0RELZznOhdZpTEQa6483eHBtLDGB+ygAvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6668

When stopping a core cpu_gic_callback is called in non-alloc
context, which causes xfree in release_irq to fail an assert.

To fix this, switch to a statically allocated irqaction that does not
need to be freed in release_irq.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v1->v2:
* use percpu actions
---
 xen/arch/arm/gic.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 260ee64cca..ed6853bb32 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -386,10 +386,17 @@ void gic_dump_info(struct vcpu *v)
     gic_hw_ops->dump_state(v);
 }
=20
+DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_maintenance);
+
 void init_maintenance_interrupt(void)
 {
-    request_irq(gic_hw_ops->info->maintenance_irq, 0, maintenance_interrup=
t,
-                "irq-maintenance", NULL);
+    struct irqaction *maintenance =3D &this_cpu(irq_maintenance);
+
+    maintenance->name =3D "irq-maintenance";
+    maintenance->handler =3D maintenance_interrupt;
+    maintenance->dev_id =3D NULL;
+    maintenance->free_on_release =3D 0;
+    setup_irq(gic_hw_ops->info->maintenance_irq, 0, maintenance);
 }
=20
 int gic_make_hwdom_dt_node(const struct domain *d,
--=20
2.34.1

