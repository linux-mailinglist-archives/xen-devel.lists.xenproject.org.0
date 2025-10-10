Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D23BCC52A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 11:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141095.1475730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v79K4-0007KA-HB; Fri, 10 Oct 2025 09:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141095.1475730; Fri, 10 Oct 2025 09:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v79K4-0007HG-Ap; Fri, 10 Oct 2025 09:22:00 +0000
Received: by outflank-mailman (input) for mailman id 1141095;
 Fri, 10 Oct 2025 09:21:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uR8D=4T=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v79K2-0006bm-Id
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 09:21:58 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91436454-a5ba-11f0-9d15-b5c5bf9af7f9;
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
X-Inumbo-ID: 91436454-a5ba-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUZr/KkhrZErvd8G6tpqntmdU0n7NVIeowuMoyGxS3ymNY4gVELVPkTlVsr4vnamUCGnr2qugOFZh+vuFou0SnPup65uvmz0d79HGIZnnMcLYBdbJh0p8aj2M3WT9JtYmhdpS84oDugEP4FLla/rIpNqoSCcQs3b9fZFsHwm3azMPkCDGvnHWb8GMfHQ0bHVXInhUPu8PWbI4c2y1uCxOEajou2fFL1UeVh8w2X3Pwso0ssMcdHa+GuLfMWF+ar+oYpkhSsVjLY/wxPJ5IP5Q7Uoek//7k46GUdrnmBX7os+e2vzkcHNH7LGJcwC4gIfsQXe5Q+o2g6n6DH67++jJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ap3AYvhm09sY85C0gCKMDjpM3lvCcFWVzPPdQn3ZnmY=;
 b=li5QIgJGB+lGHQSx12CLC2Qk8ZZOlRRTz+9XBW1IlPSSXyE8hsdIaX5HX8rwoOkmA/TYL2OLK7DM0mpxENYcDGA5wGoYvyKaC43oRo6HuCAO9aNC5RomdP8qVKFape2qT57CqsyiY4Gl834vGzLWHbSM2w+v+7OXobTs9CSuApDwYb81panENZ+Jz43xClMx1KWFvpdPJFH5zy5/Bsr8QRMpj8SV+ocL94cA4iYgQjxCvZo470gPYrrHmm3iaUKl7UXsus2Wg38uzTGnj/7MBUjaSIEstLF9VC/qjcKrWq8CBgU4qsJFeMblaw2hZSJm5G4FMBDNxsx9SYX61MYKqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ap3AYvhm09sY85C0gCKMDjpM3lvCcFWVzPPdQn3ZnmY=;
 b=U3MsgYGSokYkKzCL2kiwtc5sskle/PRPteJwo48Mm/SNOvC2WBUHFF19W7TDsBLGs1dGvn3lvurvAc7RTXWXgmDoEwUfAscJXQtSt66xT8IerDIEDV1W9+RIxqXHceo6GHbFJhhu7fvDWc/sNeZowLGbH47JQikdoAX2PbWKXJGRaO02re31rESIXvnLHqW12XJPxEbqbmZDQyB1GWFFLTy7Ze4dCvL8tO+s+1knCwoiaQuWAqH1vtWTovayXRecrB8dIgpLJgjOzjZnsjTvfnqwDwD2TIpqciupbmo7xJVHvMuCTNdXHm/0z1cZUhFkqOgTShbHTkR9jjrWgCzQlw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v3 3/5] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v3 3/5] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHcOcdQw+K7ttgNKka1vBPVCSBVHw==
Date: Fri, 10 Oct 2025 09:21:52 +0000
Message-ID:
 <bbd7ebd07d80ead78106c160e4368116dae1e548.1760083684.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: a0ced386-710c-4be7-9895-08de07de7371
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NED1ohATTqPnz+VsJLcEhvv2/itS6cuXjaSHtNEbKxNQSVRR5qRoX6EEWg?=
 =?iso-8859-1?Q?BhG1BbhmXR3MqExu9nCNakmSk3z//5u1vqNKgsGNmgNcfPvu+lcVtLprYW?=
 =?iso-8859-1?Q?1AUdbsGCFTnpdDzY4S4c3nmzK8aApKsDMtqeO5RnIsihywmVKxtfhZ6jvo?=
 =?iso-8859-1?Q?Xv8Fw17kXjyXRR8FwnEgSaobk2LjQvq6yUA+/m8s4cm9gMIPtjSieexdxQ?=
 =?iso-8859-1?Q?hKTpW+ClMgNGYhDab+LcYtgpckEIgK2DmjIWIdgvNhBp7vsFif9Zt9JuBG?=
 =?iso-8859-1?Q?+Wp2mmv2dAEt5Q9N2/blkN2rX9UMU0Zd7QEtGEQQ1NqvMAd3q4y6apK4N5?=
 =?iso-8859-1?Q?IPOMiqjiSKpvp8Ukp2ZcKpNA2yuYHIiNfzXwvkM2OUbObznyZS4D89QvVd?=
 =?iso-8859-1?Q?IZ0d2epKWwKHrz7oehs46P0+TPGIBru2CJXqc16MdhB1QLNbyCFjQ66Pjg?=
 =?iso-8859-1?Q?0SCMlwOZw1lfEwi5QZxwAVRkn3cq2zT0BMmBCYzjcUz9BD+ifcye21+bGr?=
 =?iso-8859-1?Q?5XDTuMBZsiJttR9aqU2sTf/jBzhE/7P+OcbFaLUFkL7i/jHa0TGoD9Kq2K?=
 =?iso-8859-1?Q?ZgtYkh+vAXj9lqNGKYbaNicKQVcp1YBsWLvyZVueeass492D6gsAEQQb0Z?=
 =?iso-8859-1?Q?mdZOmm2nXuBFqDHH9Kz9Q4dB/NVcOoDjukzMS4MIwfeBsvz5PqKLmXoetu?=
 =?iso-8859-1?Q?sK8HQnoLLKV7PQa4YNySMMsJGzE82aUK4yctC4AB7PK5QeRKtfDKgXh3FU?=
 =?iso-8859-1?Q?VcbyGj4tWjicv16pPhTy1lzWgmekyMCLtj1A1e6NLzqleKYzf2Z+IRmefX?=
 =?iso-8859-1?Q?2lMjJMgo/Yl+RUCwR7WxUgr7JbHdsID6Gg7F2iRXJI0X4eCDx7AaM9mIu0?=
 =?iso-8859-1?Q?DGsOEVBo+/fmrSbZ1qeJZopa09JjPii+ORo7IhMYxfSzUiMgTZziGvUc8S?=
 =?iso-8859-1?Q?s1W7n1iy24ND1mPZEsE9ruKbKUpdEgY0O9tIDAEjdqoQb1ueEl+v4G+ekJ?=
 =?iso-8859-1?Q?DCIgQSubGnrvdm1zzNQRX2uiiFyZZ+rbjM20w2R1BHp2HX8kT+B4DsIiGF?=
 =?iso-8859-1?Q?LDRwI0Ub0RrJyQ8W/peb5odJBw2EQBlbPqFzulPIqkMi9vyqt+5u4XuxUG?=
 =?iso-8859-1?Q?nL5JIckcvHhAPAT6mq2PMXHv5D1W+AcfywNwJ/5UF07XSR6wR6YF4BybSo?=
 =?iso-8859-1?Q?/4M68TtmX51LonY2Ps0QrqQdA31HvfpEY1EA2Laj5RJfFdT7ku5On5DkW1?=
 =?iso-8859-1?Q?zXPrzJM4dWP+fmiBt8g80rhgN91e9SHC9HR8esCmnoUIjNoF5Cvc1LSdes?=
 =?iso-8859-1?Q?0KzsdbLkN8vs8PY18Hmp0zvUzcFC7BgxSNZjclKHZNna1RqXWbi8AgaLoN?=
 =?iso-8859-1?Q?mnDQtHrGM2Xpb5iXAvPN0JlS0p7fthkY0qWKOfM/Gn/o5BrInA5NBt5Sch?=
 =?iso-8859-1?Q?q8SJQi9LJuqEebxw3rWd02X/saiqNszrzBOcr+LfwU1yx6aYq9ZyYk98Gv?=
 =?iso-8859-1?Q?8HvWwNNWmeA6Ei+sWLLqfJslBwKLbB3tflUfLmHKQR0JYm+YY/xK2w1gbm?=
 =?iso-8859-1?Q?vTXftCoN5xeWbp/u1eImRk14q4m3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FcfGlU234aMxjeTXIT4tBTq1ZL3OMTwZIwnapCifyFvr9ttkl3ysz1Q5QJ?=
 =?iso-8859-1?Q?JkuxqGwpMajkwts1wJ0YA1CmM41hOCWyWxBfiFgymBmv1SOo2cX5It6soJ?=
 =?iso-8859-1?Q?v2dWnIVNtmjgSdngg8NNRI/sjBP9LWVxvASVFXwyQKRXjXMTtn9gz/onWD?=
 =?iso-8859-1?Q?xqClsAQ89BtibfDVk1GlUlJJdSnA4dnudhjiMJAKr5PSv2CwK/qvetoUvZ?=
 =?iso-8859-1?Q?NbDhgxDkjFV/lj2F3rB+1FRiuSIWwExXkWNRBrp2PZtTer9QD9YchAmGFa?=
 =?iso-8859-1?Q?KMhmq46VYoHq8erk0IQDzm6p60KEizm6UBzdMQpnQuikLG3rHcxRT/tj3i?=
 =?iso-8859-1?Q?EuFgGzmfHF/CFfoeyRKADtfaGbK0UUtmtxMtbkdrSHLkOgDPdJfNhmRjQo?=
 =?iso-8859-1?Q?kNJ2pwiK0UtkQlz3YNz2kJ664TPvxQA84D6dyUt5KBaUFoZw7QNx2kZ7Du?=
 =?iso-8859-1?Q?k6olRslHY6DJwlLXd+T1FIvvmUr154LqSY3eg6oe5NACkyFqk+eT40ccsr?=
 =?iso-8859-1?Q?zYjaye38P/Sc1GuiGWPrjAoZhGCQn3KklYdskCAzwpLACBSPtvJtOstbSW?=
 =?iso-8859-1?Q?Ml14vs5YgfcpQVKRMaKkauxmLKBY2GGIk08e7La0wF2Ig1vY1OMbi0cjlu?=
 =?iso-8859-1?Q?2s/po2eZPfSqwOg/6vUPPRKdbndYpje9IFQ/g73y6A20RWPUOvbz2NKeD6?=
 =?iso-8859-1?Q?1ihfSKSC6S7e2seVmUsU9FAwx24Abn3V/Dsj9pQySpgsJjRJL53C0o/Twu?=
 =?iso-8859-1?Q?U+YUXNQk5AqlO570g+kZKgZkKVbyiscBmNY4oY15az2XYq9dm/Hn+vKVM3?=
 =?iso-8859-1?Q?PkCJuqSngLEhRekiPIdmYuz89lTplgfLXxp+PF+dGNfg6ypweFvXoMlIvx?=
 =?iso-8859-1?Q?xBTyhuHCDdPKsYVHPYa6vF/xnpDscJsZ05wPoLJKzbVAc1dVlftIf2UoAE?=
 =?iso-8859-1?Q?1ZYdoHklKRkxH4+84BslvUWdgr1f4xJuQKBeHp6Co1ifqF6FJrCDHxes95?=
 =?iso-8859-1?Q?A6TI5YPyy4NePsYJYruHJF1Y++I5pVvQxZBySCORkJ4rsFy4mejBbD3dT+?=
 =?iso-8859-1?Q?6u4C0PYtTAxzlxE4lUvet4tEVJ3HvpOC7Yo3Ualm2hrYaQiEO63HRYP4IM?=
 =?iso-8859-1?Q?tgVE6kKgix+dfEkMRsePVxxMnK4NZ2a9eoLCHxQ231U20UkBrRuSCXgw/6?=
 =?iso-8859-1?Q?Z98NHi6PzdAE7XltqhCMdYKVrAmuODzrwZsoWGuECOfRe56los1ye92sXr?=
 =?iso-8859-1?Q?04MOQtSDQdg7wF7M8nkA6jJwsIwtTDGaWFpUNXroSdD5XGnq0/iniKg0yr?=
 =?iso-8859-1?Q?9mfPwfCQvFGdsf0S/8T8hVEwJL6/YBKjDXAN5pXFdrNURyTLoQLe8+cOyr?=
 =?iso-8859-1?Q?WprxYbsDBSQTudmWYZBWYYtWAoqrCl0i0SIESYOFX+dDmZg6WDSW948IXF?=
 =?iso-8859-1?Q?XcJgG6tkjsyurZiBQ7wAs9rARfHfTxsEtMAC6NIuCqkAjZucZAvjp2DMNR?=
 =?iso-8859-1?Q?Yl565dh19SIhX3R75ESKk5ICZSRafT7l1ivcG1YELkH9+O1VsvGQerPXoM?=
 =?iso-8859-1?Q?BwzoyF8fx3Hea7LIexcd9o197AfYxRelRKwHHDmKrKP9ycbdXg22vVf6jl?=
 =?iso-8859-1?Q?wMd32O3YT8esR9ABDwJkuwbL9D73JsU1GfrbRQ4h+fXgr+A736Gg/BOA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ced386-710c-4be7-9895-08de07de7371
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 09:21:52.7830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wob6mim3Zj4M/dW/6k1o6uerbFHr16OezCt6icFxMkSfKXkCQrNCCRiEzVHde4GlIyFWZPBU/By61PR2vVvXvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB10161

Implement XEN_SYSCTL_CPU_HOTPLUG_{ONLINE,OFFLINE} calls to allow for
enabling/disabling CPU cores in runtime.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v2->v3:
* no changes

v1->v2:
* remove SMT ops
* remove cpu =3D=3D 0 checks
* add XSM hooks
* only implement for 64bit Arm
---
 xen/arch/arm/sysctl.c | 45 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index 32cab4feff..fecd649db1 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -12,6 +12,8 @@
 #include <xen/dt-overlay.h>
 #include <xen/errno.h>
 #include <xen/hypercall.h>
+#include <xen/cpu.h>
+#include <xsm/xsm.h>
 #include <asm/arm64/sve.h>
 #include <public/sysctl.h>
=20
@@ -23,6 +25,42 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 }
=20
+#ifdef CONFIG_ARM_64
+static long cpu_up_helper(void *data)
+{
+    unsigned long cpu =3D (unsigned long) data;
+    return cpu_up(cpu);
+}
+
+static long cpu_down_helper(void *data)
+{
+    unsigned long cpu =3D (unsigned long) data;
+    return cpu_down(cpu);
+}
+
+static long cpu_hotplug_sysctl(struct xen_sysctl_cpu_hotplug *hotplug)
+{
+    int ret;
+
+    switch (hotplug->op) {
+        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
+            ret =3D xsm_resource_plug_core(XSM_HOOK);
+            if ( ret )
+                return ret;
+            return continue_hypercall_on_cpu(0, cpu_up_helper, _p(hotplug-=
>cpu));
+
+        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
+            ret =3D xsm_resource_unplug_core(XSM_HOOK);
+            if ( ret )
+                return ret;
+            return continue_hypercall_on_cpu(0, cpu_down_helper, _p(hotplu=
g->cpu));
+
+        default:
+            return -EOPNOTSUPP;
+    }
+}
+#endif
+
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
@@ -34,6 +72,13 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
         ret =3D dt_overlay_sysctl(&sysctl->u.dt_overlay);
         break;
=20
+/* CPU Hotplug only implemented for 64-bit Arm */
+#ifdef CONFIG_ARM_64
+    case XEN_SYSCTL_cpu_hotplug:
+        ret =3D cpu_hotplug_sysctl(&sysctl->u.cpu_hotplug);
+        break;
+#endif
+
     default:
         ret =3D -ENOSYS;
         break;
--=20
2.34.1

