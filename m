Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8E5BCC51D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 11:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141093.1475706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v79K1-0006jX-PG; Fri, 10 Oct 2025 09:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141093.1475706; Fri, 10 Oct 2025 09:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v79K1-0006eE-Ks; Fri, 10 Oct 2025 09:21:57 +0000
Received: by outflank-mailman (input) for mailman id 1141093;
 Fri, 10 Oct 2025 09:21:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uR8D=4T=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v79K0-0006bm-Sv
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 09:21:56 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 907aab78-a5ba-11f0-9d15-b5c5bf9af7f9;
 Fri, 10 Oct 2025 11:21:55 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU2PR03MB10161.eurprd03.prod.outlook.com
 (2603:10a6:10:49a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 09:21:52 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 09:21:52 +0000
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
X-Inumbo-ID: 907aab78-a5ba-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiglB5F7WpdDlAIBQzlyDzWFdctryvHsrboYKbH+8y8KqGD01zVl7LgmN+BNLpHTQeoslVeuOAwKbPnE48lr7klhVoIJyZdNoxF5mA5wj1R7r7/kVa3VAJlllf9WnpwEvkegYz7jGk4XM0br0qc+OO7oNfc13IEpe9yEjUTOH9irXzOVyqmPCIJ+8YAKcyLzFO5CzmDia0XR0eO4RdpS0gN7CPucDh6KUfIzOgoeLKrCurbc3clJOFAXjtPsqpiXKFWWI348HeY2Hwa7UrtXMkTwnX+s+dg9q9MNXW0o9PMMzpfN+LmEhpUGZWb+5de+GLoXaJFKKhVtOHd5PdL0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVJ5xFDRkoFtusd3udECwi8qMy9c7ssC45niNPa1qig=;
 b=NTZ3hOf8gTkEoqMY2zSQGavPy6F0tPUvOA2mEWRfdgvey1ZEpmNyW5TGzpQo4V5TF3uvGSafe4CbjT0wWuWbF+tlRvtC26P742PcKuYWNAAfYKY33c7l1WuEMp3jWoYoGorAraMmYQxqBAL8M+uxNKtPK+PWtYwzFf9Dk31/7WndjoxYa2La58jw/1juO+JdfWC5vQjvOT3rLp6s0wd6eZ48CWASp44b20w/9EWwPOeTrHYlnCrIOn5ZH3miivkzXA6wUj61OgTO7lozoN5ZFNQBG7LzN26QEIOHovzSK9A11deD8IREL0N35Xmnj/yWL13pSizhFWTt1gp7gDQMPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVJ5xFDRkoFtusd3udECwi8qMy9c7ssC45niNPa1qig=;
 b=Wk+vYuTfY+HqIyJxAY9hYDUdLLNPujRiFReRMoWokxxW8WFWOCHePsTcgKKllN3zZ8KpHVerVnmys7tKp1cOBqP5L/gFRIKU+xxb4gc0yelo8aOpjGncfODkh3pqNQ7tgBoJgDQRYkrpPl0TMvj4qwraAVg5uYhtZFHHkEjiL/kTXfivgZgwYpH3cRKnP8g/7rxZM+4mODW7JZEC8vm8XuYJPCQv4wsM+D+J2JIfezqkCxKZfSXvI+pQfij1QUGERQnBBXHhBLaKQZ4x0YdUd2HKrroxxgFQyzYdYMqft5iZEXsFMpQjYR3ZHTePiyjZ9ZVPeC5uWYaxAWbI8FWIvw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 1/5] arm/time: Use static irqaction
Thread-Topic: [PATCH v3 1/5] arm/time: Use static irqaction
Thread-Index: AQHcOcdPA63dhQOrA0alziunhEWP9g==
Date: Fri, 10 Oct 2025 09:21:51 +0000
Message-ID:
 <af333b9ef3b79f4b0cfafb1f09da5b7bea04cfaa.1760083684.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 44b5eb42-1df8-4e71-6ad8-08de07de72c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jNPlxIgSG5/oXvwx/b/3vYzq5B2eensMecmCjFlTOhZkBjqRJCk7WgSMZK?=
 =?iso-8859-1?Q?+6q+PuxJiwyIYYJ80hcjVd+YlOFYUL2Tn5+D6bz6j5quaUWMBwCXS4gFO5?=
 =?iso-8859-1?Q?k7EdaBAstnQnwNe6IbVRstqv+RTkd8RxP3yjA3zOYOTzl6LDXwKPW32hD6?=
 =?iso-8859-1?Q?O4QzlOypGUzqlfJB/uZZ9KguuZkMIID9L/h/abEsYyqjO8otig8AVi46rv?=
 =?iso-8859-1?Q?XkKdqptQ2CaFzZ/t9ejtmnYxBFSIxc/68uxCcRTUj7IMGxFWWzqhKygxnm?=
 =?iso-8859-1?Q?T2rh+csyfWriRcScwQ+Vyp1haTZ1caKqLS2wY6i00UZhdeBPI3pIVHIt0f?=
 =?iso-8859-1?Q?iGou4iubqtDB7BZq3QaXI5tKzFmFktoLaJnQ50bktfuOwMt1OyJfQtfajP?=
 =?iso-8859-1?Q?RY+mMvmJ3YXsBGG60hZzRm4x6XQm207CKIzEspJgbNgSrFjO7o5moY9G8L?=
 =?iso-8859-1?Q?LDAU/F0TFqvjumsvXB7PpDhAvPqi6/5N3gr+VBb9j0Pzu/BjPBddkq+2wQ?=
 =?iso-8859-1?Q?aNjm++b/f1av2SdMvjkctZW3LIXGXk/yypXI+FCrQ29BNggj2GUKIbZqME?=
 =?iso-8859-1?Q?r83Z0LVWsqRXO2M1QySXq4Et26UgtjQL+rePgSlRhuDQg8iXq6iUDF5PxX?=
 =?iso-8859-1?Q?zZf22X7QV05++lKyqO2nH0VLgwjCTStQrcWMZour8vzI4+7I0TUb+fBl6O?=
 =?iso-8859-1?Q?fCujeMTv0keK4bWcs32ySOH4Ao0SePo1MiLEQb+D5hEOsQuhLM1gSyj4v7?=
 =?iso-8859-1?Q?ROz0Pb8I1lCuyxCfaSift9BYTVr2/6Ovk0t6wtwLXo6oDKE+BIE+FqADxC?=
 =?iso-8859-1?Q?cv0QqWKOkO55eaO8Hr4mv1sxIAIipgcZmT50D9mdu+svXXbyEXet3rEJXH?=
 =?iso-8859-1?Q?ujKb264ceK1QPIM5YJULWrMl9B526E2o+uoOhrsmbiN6/lyVv0WM3v0cR+?=
 =?iso-8859-1?Q?dUv+7xcb3xrFevAAO5K55IG7iJPMn0JNnW2rnGJs9FPeVkdbagezpQUpEO?=
 =?iso-8859-1?Q?scIDBHz1y3n3gi3Of43yMZuysVLILsBebt6PrHKggtHOuTYjreaHYm6uGz?=
 =?iso-8859-1?Q?qfAhhwBKyeetGlro2nN/YalFG9D5Sni35izllGxbQJMF0Af0nzXrC5PNvd?=
 =?iso-8859-1?Q?2WPtcCXruYwGdtrKdzfXcQmyHt+czL1FDkFSIUFGXLmAK8lcw4nlHzLY3e?=
 =?iso-8859-1?Q?Q0rFaGLr+9a/KpNKsRJMLoiqafvPAT1f9f2KkZBnstCHNzATydU3gZORmu?=
 =?iso-8859-1?Q?LQvG9bAGZac57/rqHcy72vUD326HBf9q9wdgNFC67UWdP1b5nnTAIpUZeS?=
 =?iso-8859-1?Q?6aIB5ft2K0UtOeevy/wSDYAl8XE9rWJiYfTN/mqEHY8MvQg+83vPaO6M5N?=
 =?iso-8859-1?Q?O6eFv9AwRXRTv6TvY4fZxVGUIc4GSC8w978FfQtBV+snWWWdJkJnV4H3WJ?=
 =?iso-8859-1?Q?BtASCygHsL4f3JEzIVq19SWycEUcOGWX/hP+4Cy2O2Y5VFqFDzbiEsfeHr?=
 =?iso-8859-1?Q?IUUJA9RkdCrEUZjnCvTdNwbDvdHXHjO0AZ2H9WaztvwdebNkzj0E9sZjuB?=
 =?iso-8859-1?Q?HQfgr3ZG6E8H8nU6Yoa6ReRo2soJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?63EAMebHi7uii8QweDASedg775ZT9b/MwLMqO6gZVipNDHaAOIuDUedrvx?=
 =?iso-8859-1?Q?hIkEZzUJ700A1DYAPEZ0KuRBooMHgmsiaG4AsdmYY6FegTPHwTFNeLJBnA?=
 =?iso-8859-1?Q?LgMl4X+TUWFtz2ZAK5syWfwgmF6gVxad7PEVncd7TXV2Pj+sdqtZUSjXF2?=
 =?iso-8859-1?Q?ZN1E2+5Emp+1A38uxAODfg+esueYHKL2CqRBnFZW6OPZ595PdCquFRVMoo?=
 =?iso-8859-1?Q?nftORjygXwH4ThwJmPnD+NNrko8WCTSGO+wnHqfM6mkinpp2BeLb7egD9R?=
 =?iso-8859-1?Q?EQ4JBh4gmrHT/anIKXFcgFCjzJFUy8jrZ+02e3vpF6VWMwbQAxQ/9S1++W?=
 =?iso-8859-1?Q?057sq8ABP8/XN7KKnYSFV5PsazgPnKHXBMr49ZGFFefLKDG46MxJzASaaJ?=
 =?iso-8859-1?Q?nVo7JFLosm0JKUioV4x/brO2R3XTJfNXWqo39pcR+BcOtwJkfADoKWiItQ?=
 =?iso-8859-1?Q?ixeB2cejyXOeQSPiaEcDZXuXVjYMtCoYgY7+/8ABUtofek/GrBjwJrRB0n?=
 =?iso-8859-1?Q?s9O2wNDEGYA5GuQSfS7GD+M6/Fn9mmBqkCYvyuuwxEDUeEJraeNfqkjb35?=
 =?iso-8859-1?Q?/mzuYvB3G40d5jrJP5SsU0GHwrRUH63aiH7c1v2H27JW/VhCOX88G1srfP?=
 =?iso-8859-1?Q?zxNaYey3Upo/W9Dok75AZZicgP/CrJoM7iQXZNb/5i+HKFHMNUMT71ltdK?=
 =?iso-8859-1?Q?ywzmAlrj1MtdazprAcA8sSLpZfDJZmQ+X345BH+f0SF2YapIkWEtKQphYl?=
 =?iso-8859-1?Q?0tTK/BPoCSX6fUYAEnVnkyeaW5QanyOmtWxtIQVpsPu8SYz4pVszVtCchp?=
 =?iso-8859-1?Q?AEBkMFBc7ODmOowr6FJjX61kCeVJvzoYNVyF75AIWnc0KUEA7DJ0UL0meW?=
 =?iso-8859-1?Q?0ukE0Jbte6y8E3p8mxdfN7t0tCEjHD/FVexD1KQfNiLEOy+2suE4oiWygT?=
 =?iso-8859-1?Q?w2MuvUGL+pJ37G3nEYOyPK7S8YfSVv/EotiANhr6C0+ncNUWPNH7LXgdMr?=
 =?iso-8859-1?Q?oClCZfmEHJ5vD2P2Nz/tMx6sZwrD016WC2YUY858OqbM7jhloTIO8Nwfcn?=
 =?iso-8859-1?Q?cS0DDvUYYeQKKrtjSdV0YrX70LKoNRPGufxEiwitP8xJvBW9r82DDIXjEM?=
 =?iso-8859-1?Q?/BdeDbEzcPIiD1PCR7DM8ekLDxUp6CqF9+q1+wyAYtyn2jLZfMtBhVx9Vb?=
 =?iso-8859-1?Q?+KqUJQMtQeB8lIAG52kfWRhZCKniVSsgI4RaZrgjAlGas4IM8WHoMcXIxn?=
 =?iso-8859-1?Q?1RemnVFk8e9Fc4sZs1yvwzuVs1kQCcT+1vo3zepm8CXtg9lPXKLQnEfQus?=
 =?iso-8859-1?Q?2V7jNMp/Kvg58x14u07kjBvm2pB4hkokPE293rHbqbNzLzkaPt6h4aN50w?=
 =?iso-8859-1?Q?3H63cMZePY0DyUqSpbG8hQK4P7d2GHv9tm8uFgWyXaxGt5JJTeT9n1qwoZ?=
 =?iso-8859-1?Q?YMwPseFhV8eppPHD7GxG7JAsd1Vr/nBSCYuaitYP7n1FcNMTW83/n4HjYx?=
 =?iso-8859-1?Q?Lxtrdd+PX1hGbBnfdQY/AHlb9mgKtrx3c2NOYCNd/acyxq2xITzbaf4UD4?=
 =?iso-8859-1?Q?1tZtOm2d+2N+mHCPb709Ox655W+sqSTfFBNQVU4/2gGGvL15qcwXUpqSxA?=
 =?iso-8859-1?Q?UzNFu2RuaZZZiheRxjQqoT+v9qpYgh3Lbwl/ZHCtjXMyoaFlJRXTQNPw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b5eb42-1df8-4e71-6ad8-08de07de72c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 09:21:51.7493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nh+AwQiY2b/e4skIPSZU67z1pZAb4AZwtvPREQwIH5TE6uQoGQFL8de3mVN2R717GlDUQlM6BBjZkUDDAsdRGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB10161

When stopping a core deinit_timer_interrupt is called in non-alloc
context, which causes xfree in release_irq to fail an assert.

To fix this, switch to a statically allocated irqaction that does not
need to be freed in release_irq.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v2->v3:
* no changes

v1->v2:
* Use percpu actions
---
 xen/arch/arm/time.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index e74d30d258..59349467de 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -303,9 +303,15 @@ static void check_timer_irq_cfg(unsigned int irq, cons=
t char *which)
            "WARNING: %s-timer IRQ%u is not level triggered.\n", which, irq=
);
 }
=20
+DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_hyp);
+DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_virt);
+
 /* Set up the timer interrupt on this CPU */
 void init_timer_interrupt(void)
 {
+    struct irqaction *hyp_action =3D &this_cpu(irq_hyp);
+    struct irqaction *virt_action =3D &this_cpu(irq_virt);
+
     /* Sensible defaults */
     WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
     /* Do not let the VMs program the physical timer, only read the physic=
al counter */
@@ -314,10 +320,17 @@ void init_timer_interrupt(void)
     WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
     isb();
=20
-    request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
-                "hyptimer", NULL);
-    request_irq(timer_irq[TIMER_VIRT_PPI], 0, vtimer_interrupt,
-                   "virtimer", NULL);
+    hyp_action->name =3D "hyptimer";
+    hyp_action->handler =3D htimer_interrupt;
+    hyp_action->dev_id =3D NULL;
+    hyp_action->free_on_release =3D 0;
+    setup_irq(timer_irq[TIMER_HYP_PPI], 0, hyp_action);
+
+    virt_action->name =3D "virtimer";
+    virt_action->handler =3D vtimer_interrupt;
+    virt_action->dev_id =3D NULL;
+    virt_action->free_on_release =3D 0;
+    setup_irq(timer_irq[TIMER_VIRT_PPI], 0, virt_action);
=20
     check_timer_irq_cfg(timer_irq[TIMER_HYP_PPI], "hypervisor");
     check_timer_irq_cfg(timer_irq[TIMER_VIRT_PPI], "virtual");
--=20
2.34.1

