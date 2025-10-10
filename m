Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F02BCC521
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 11:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141094.1475720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v79K3-00075k-4b; Fri, 10 Oct 2025 09:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141094.1475720; Fri, 10 Oct 2025 09:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v79K3-000739-1D; Fri, 10 Oct 2025 09:21:59 +0000
Received: by outflank-mailman (input) for mailman id 1141094;
 Fri, 10 Oct 2025 09:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uR8D=4T=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v79K1-0006bm-IJ
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 09:21:57 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 910af740-a5ba-11f0-9d15-b5c5bf9af7f9;
 Fri, 10 Oct 2025 11:21:56 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU2PR03MB10161.eurprd03.prod.outlook.com
 (2603:10a6:10:49a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 09:21:53 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 09:21:53 +0000
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
X-Inumbo-ID: 910af740-a5ba-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lY4MWScfae81zsxZz9Tpb+N5Sb+okoScGzo3tJYbgB7fwDiWgWOK/AQjopFzykROGwvaM7C0iUg55Dzhqhk0NRAdLnUQSUS7OIZG/TRprF3t0eirVBD9j9FOVGnGUxbQaVSX764xSQvjvXyyX/rjRcDOkzlJtHRDKDxSnbpbTDDt954cg7MoWdij3FO3Z7FJpXYe5f7tdz90hwFOJYHj4MbYq0oLIotSO8tYSQAu/zaEp8DSUj1ejBb9gY8elBDvImAQiH3S49N1JIvmXrqNiliXtZvrWx8fZRLk2cCb4WjbR/xXMHitS0JrhtRupju4rchDlEEakRxCH+D1a44bkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlXSCVZNOtMQP9ErfahZxj1Ps5OJW5O34DJ583T2U3A=;
 b=hK9sZP6gGXh+r5aZ1+QM+p9ToVz9QEpv1kU5Gm1R4gG1PufsKhelzyVA/oTcN8HvV4m9nShmvwTZaaLhe3ArVcgD8wI+Fh7mzrq1BlonODxyjZwOBq8zCe2N+cLziUmt+mOfbY6l4h5wFcdSqHbglLjdxW6tv5gH1mMWqwexQSRI56v1hqlU/A7Qzlc+f/8k8ibWjP5KMcQ47aoUy8t8pAkd0SdUfyvpjqX1VupzD/Fsaa/JysLU2n/B3/UG6sqraxEf+t45HML0zBYkn0LP6YfyShx0GrsGfj8pyhpO+WgutXcVJ3O/0BN69TT1Upt0e71HnHtGAmx59pjVhtOCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlXSCVZNOtMQP9ErfahZxj1Ps5OJW5O34DJ583T2U3A=;
 b=UEWR6YGZQIHF5zbqsCXFeb/USOqCV4qGY/SQqleaFrNhyfdA4fZG7j6leRo8OUNWbzhzt1juh6iWi3EA682k9aFqJyaFZ4M3rdVMfdlssYFCD75ZNxxg1J2xhirtIw2QFOGrboJRGxtG9IfJEs0yu44hxWFEDf9xHUumIeO/TRWu6Uk5Qph0VssPd39wQf1/8r2AtFvSeuqqj5LTHEsjA/nKqonQ1UTKI0k9AIVgLhOa1Ywkmez0A8fQxU+D7H3aNSCSgYZPNUXhdBg0fabKR0sXxnfxEVzLmNhhRjuTSHFgTT0kdypQ6ylk3NdHvOEV6iziTdlbJCZfpWLZHtsUPw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/5] arm/gic: Use static irqaction
Thread-Topic: [PATCH v3 2/5] arm/gic: Use static irqaction
Thread-Index: AQHcOcdQEP4hwhLsJ0CWMbVHN1hrFw==
Date: Fri, 10 Oct 2025 09:21:52 +0000
Message-ID:
 <7ebd435d510c88e2840ee991f8fd75f25ad66f75.1760083684.git.mykyta_poturai@epam.com>
References: <cover.1760083684.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1760083684.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU2PR03MB10161:EE_
x-ms-office365-filtering-correlation-id: b96e2a30-07ac-4043-a2e0-08de07de7338
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jgfAZ0Ffx2jznCylQtYzAvfN3tOV644YFj6zYOW9GjzfuzMTIdgDmV3HQn?=
 =?iso-8859-1?Q?x5PpRkIeE6DRpdM4SjyoFlHP4a2BvR4a4F+dDGk1mE+MBTtKAeAVEMEFAA?=
 =?iso-8859-1?Q?wwk/cCsIjuEysN0V15XwaEX984zIatxnZ642xjeOHSaXPoKNPT1QrJ3j6V?=
 =?iso-8859-1?Q?GdVJ7Kf8m2ZutD0AYHj0Ys/UTRiN3FETrMtm58yWM1ZE1CcYanutNYemMK?=
 =?iso-8859-1?Q?jrjpfdStBP9BbWgrZNoEm3/+RczRl08Cigo2apw/WvfSpdi0i4y226P+42?=
 =?iso-8859-1?Q?VVfu4xWBHOLipFygU7JFH96Se/ZmOLjJ6NrkhrDQt1pn5ErAsrWYhsI3h7?=
 =?iso-8859-1?Q?JRjvQjBRGE7l5DdPYEeE3CduxGzi1Edwd17SaUXhbTGsmj0hKtTO9zxmeN?=
 =?iso-8859-1?Q?tC92Vk+x6J1FeNk5T38iShq+caqfqCAFgMxdLClNMS4siiVrOvg09CaY1T?=
 =?iso-8859-1?Q?722YTpdnRmvskgxmmDjPREqZVPHOtMZrkBRZmdRH8qDM6LPFpvsKSDE85Y?=
 =?iso-8859-1?Q?mLWdGi0DsoInuUKRWrP5XqX9Ryt8jsprzXC/tvBKupLqoLGVlNCXdmJWYn?=
 =?iso-8859-1?Q?jW3babqBEbECL611CjdK9Yesqx6dqP9F0CiSJqM5bnDo79SvnWT2pl4/1l?=
 =?iso-8859-1?Q?QU+M9rew9cy9puNcEI20Eby1m5sp6371tYif/VEjTyGMfR4isQH5EDkxla?=
 =?iso-8859-1?Q?SLZMHq6ok5Cd9MvarFCjE+xDJIOsFA9uZmxkf4ANLX/Hup40pDXyElpRB8?=
 =?iso-8859-1?Q?+E4LnFc1ijm1j0CZW8M8oDWoBjZcc4DZBskMEeUnIz6yOI4hTyCRkeVoPA?=
 =?iso-8859-1?Q?DSRyg/R5m8zQL0bmmwziwiXOkdaDOs0fpcL/ApMwGVRT2I59LfbEGhpR0k?=
 =?iso-8859-1?Q?YMFaveUDRIBJUj4DFYQHNqhkeU6+Xi3vEATSGffMEsjz1GyPmCUCEI2fdp?=
 =?iso-8859-1?Q?h3PIF9fJpsOiMc59WJtUsWECCLZ0T9KG7nWKjd2fNI07nDkjZOQ9GwVZY7?=
 =?iso-8859-1?Q?bxWbsUmZoY1VlQUlnP8DXc9+ZhmnonIdBanPrS1Tvotc/iFUW49IGxaybe?=
 =?iso-8859-1?Q?XFrJn60IBb6vMIAKpXPRN7Q0XP3dT6aa55GoA6XtqR2gnhUdo7CNIPYieQ?=
 =?iso-8859-1?Q?gfdTENp1O4PXiYm4oaMxcmR3UkQ+RCTn+agUGBjR4DCwSUifFqjLtpFfKt?=
 =?iso-8859-1?Q?GDw8vnN1kpE6YKOTU7KX1vxeth/kBs4pCmtvI7LsGCxGfiZLVE7CBnKSEy?=
 =?iso-8859-1?Q?JbGdaKw3zskL5QRRpjiS0aBL2ArD8BO1b+ccyJw0mJbKgN8q/UjeHceJF5?=
 =?iso-8859-1?Q?4r7MyDrTdqQJUU+wCCJf/luqhBvtvgQ8GIwWqz+/2VB75cVglJRmmCrrLX?=
 =?iso-8859-1?Q?xBRZ8Y8yb+A3qhGQTnq4DkgShkqJWhLIF7b9pg1Z3h/l9of7Atcg0nz1tw?=
 =?iso-8859-1?Q?G2NC7ZL9fKLQOeb79rxn8W6D7mgnk65VBm0eXVX7otl//JxqTzdBM3VoXu?=
 =?iso-8859-1?Q?kavNA3PWgRU9rpofy2COPWW3cjwKiW1Z1WmOE1dL5fOvvFYoGQ7QSWJrep?=
 =?iso-8859-1?Q?Qzo+DpiEkwz8VGNO52Q1Zpy/98zN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jWv/D24tG0+e+M+9cuYIB9/yJ+pXEdD/zrtiT5oRexnz2DoCYZ+jFAvD5P?=
 =?iso-8859-1?Q?BtSWloNmowCI6/o8ETUn0On2wVEQXzNGbeAYL3Ei7N3WE4qNmTqzWTykJk?=
 =?iso-8859-1?Q?ITz3/lEwOiDQnP2UslgFOdrb9X9M059riT8EeoxVCKKYbZw3Cdjstaa7us?=
 =?iso-8859-1?Q?4A7xT+c+jPTagznjmvsbJ3DGIptFbXrVha4YpWHNeBVFbeh2mqvo3lSL+Z?=
 =?iso-8859-1?Q?FQTOsG/tYvEum9kYb31jVAFCKJ1Nw4lvKBqABkzuaW5n4BYV/RH+OA84n8?=
 =?iso-8859-1?Q?vOfqnD9fW9EmRdngPttDikyUail4si7jws2ypQ7///3GdNhFL36cM6URNQ?=
 =?iso-8859-1?Q?kU94KFfhoo7tGuyAjrMtZucGLEutCjnmE9y177kyF3xHA6ejxN3pI+ZfeP?=
 =?iso-8859-1?Q?K7RFrmlNvAyvJOzwgGjunFq5U/bG1TVjMXaPKgCnekPSfdEKORsczD1Jox?=
 =?iso-8859-1?Q?kvPdFf66L/oFtOb+FRHG1BD8sNL9pOTzUADRFltIiY9a1d3UPrBsYp0ng0?=
 =?iso-8859-1?Q?djhrm1mHhXzTzyu6qwqkdwfDflArXtrN1fWvmpSGGI088AHXeBgKt9l3cd?=
 =?iso-8859-1?Q?4uYUDbR13R2pKAB/+WTwAVoN3vKejSc7cY6SjcOpbdWdtoX0+c6pNpv17p?=
 =?iso-8859-1?Q?w2wzB5rPWOdblKx8E8mbwJL0kcGQoGpNm7pJs1W+8R6ktygwYVAnqK+Srs?=
 =?iso-8859-1?Q?e3wFbdfQtuhEgpHqmq0aslu373qDimAI91kRZfWpA/+Y8JHBJ0jG2AZQIt?=
 =?iso-8859-1?Q?FRGfA+ewHi700ADnDDcOQFCt18sQmSV0jAIO6IxWiSQUvOHBHCFlaatq72?=
 =?iso-8859-1?Q?YJ38NGhUAkvgiYNBBqtQq9OeyMl2VIobuPqHd8KMSEjYqUn0butIZuiqZ1?=
 =?iso-8859-1?Q?l/8XBNt7T6Vf1LCu/Hw4uyrNCJYGT+0NqR5zquL96yYRlTamjDgRveCtVy?=
 =?iso-8859-1?Q?AdyYDtPDDswS+PEIITF2kp9BFsCcyY4ZsOM4BCYO7kkMF5n8ngynOoBBAZ?=
 =?iso-8859-1?Q?zKdcEqcPK9u0oPjgSlPnYN390mh1K36/HsxZFbCN/CNzyGR+S21cjyIpZO?=
 =?iso-8859-1?Q?ZmcsmXTxOQKAsd3Z9LN+hgH9UcIZGTNnwb8ZTZcw6P76e/z1NsGGpMOQMO?=
 =?iso-8859-1?Q?6Ch6bf1SxulxT2+oafAHkmbagEMWl5YP0GjlTh0HanX3vEoV6CeoEgs4LL?=
 =?iso-8859-1?Q?vToeh7ykGBpWNvpCiy6tZICkX+3nE+c0rrmzC1QPjJuda6K2nUun3he5Kg?=
 =?iso-8859-1?Q?cfXJekDMDmDu0Gsrhi0qXMhtzo97CCHsbcrJycEBYWzrHshV9AwL3TQkqP?=
 =?iso-8859-1?Q?WZ5EoaCD3ILiJ4sqwj2xm5RP0rOQeyIiDpLyOwM3fb0ucxF8gAJ1GvOz+b?=
 =?iso-8859-1?Q?2lPkTNIeZR9ztC14G4PLevrbPAQKKdnAAppzzAmHu3GdVOXY3IzupPn3dS?=
 =?iso-8859-1?Q?aBAc+ebdtMBfOUxo3eq91f2rme16k3S6EgdBrU3YzDYK6mEKyC/mll1X+G?=
 =?iso-8859-1?Q?i74mpg9DaIux/nUsciTzUmCK95EiHILNAZwNOxftUBPp+CJJKLd91n+D1t?=
 =?iso-8859-1?Q?b9JO9wM+J2RWNzQZUw7w1F77uMBY1lRSFZfekl53TbtGwxia9fzCNozUds?=
 =?iso-8859-1?Q?RqNkMt3BJoBcMtYpr8+BATuAWuBcMYyLv6VrCh8EUOmHYwaotPRR2XHA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b96e2a30-07ac-4043-a2e0-08de07de7338
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 09:21:52.1697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qDriBg293LrlDecHHfxhtmAI9JEMBUaCxbZKLpAxgoY0ruqef/sAMBwB6Z3yu4Q18ZYRlnKLHOmftMLcGjC4ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB10161

When stopping a core cpu_gic_callback is called in non-alloc
context, which causes xfree in release_irq to fail an assert.

To fix this, switch to a statically allocated irqaction that does not
need to be freed in release_irq.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v2->v3:
* no changes

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

