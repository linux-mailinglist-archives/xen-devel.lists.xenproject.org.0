Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3451BC51C59
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:52:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159696.1488011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8S8-0006w2-A2; Wed, 12 Nov 2025 10:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159696.1488011; Wed, 12 Nov 2025 10:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8S8-0006tY-6b; Wed, 12 Nov 2025 10:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1159696;
 Wed, 12 Nov 2025 10:51:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulhw=5U=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vJ8S6-0006fP-T6
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:51:50 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97583643-bfb5-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 11:51:49 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9786.eurprd03.prod.outlook.com
 (2603:10a6:102:2e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Wed, 12 Nov
 2025 10:51:47 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 10:51:47 +0000
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
X-Inumbo-ID: 97583643-bfb5-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJbt7y3Nj7fFfrTfMVzz11x2RXLJBobBsNjV4lxrmAmG9DSIw7eLU0s5FAhlLS2zUqunVBtDNZEydKYPa2ynVvmZEEuipIkFQJ7TtXFHI3tRPe7hEhyl0jYTMQG5SvCXSXAN1y8JQIA06SNbBtHKzU0zVMZmE60+bqhs1YHSdnJH55DLa/LLGx3ZDUTzf+2yEcB4hF+qKbktTaHw0tCqwvcGf65A7WjbocFqoMJEGqud66JLpSQ4HXBX74QUpHJW1B1fw4eLQkXCsbX5E3z/ThXHITg8eYB95zlKLUYHCiqXYzh/wdfZlSuFQHG65R6YQOM8Os8+FfaFl0oFQoqZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKewhMtfhm9oAfuSqQfQEZ2zvUqEq/hkfVu6gP/SC5Q=;
 b=AdzSjm+NQeZso/vxbkXmWRbnI6OqZFWjxH4x8oZQjD4cDmhEmRYpfboe/WK2QKfNNQH+VYlZ36MMj57OLH3BoaRN4WHsCUzK73bX/FKnASHKU3p93FvD/VCLjhaF5IOOPM4c7GozJgJ1/pJ1CKTI8u1cgEergZkocJFPTd4xoAI7p5QaMnkb01aq4lOlLV4YEImLMTB3gQRmcqpBkabt6GKKTI6IYe2jM0XcOy4tpbWXhlJyogFihfbWQaoX5HTRLPNxENfEVTM1BMX4YlqKGLwjZtlHeADr6eK5rr5wo/AjvJR3kTRBvhGw/wBT+dvZNsup0uxodhc1+GyTnr/IHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKewhMtfhm9oAfuSqQfQEZ2zvUqEq/hkfVu6gP/SC5Q=;
 b=QsnEbBt2KgH0WzUQAL11gsm379H82xjpmXM5dOZ+63KlbAuBUBGyD4DJtaHDJZGpXia3ZXM5kxlvyrlPXUh7N+wRtNkz8IHKkpIxtMMAn+pwUuad4LZlzfCzwKLjZgrhKwe8/4aL8qhG2FA69XqLzQPcF5gMQTB1MJUFLvTC8xyU3ytNuhx4SS4Q4M3XGVmyupaNXSttL9NZ3ut2/yphbkPlB0uEqJkUbJNfhKsK10YhRnj/ynIxKQosND34f0RGoI0qmg7HcuHd/d71JqitZzgxig4ubddkSoTH+D/MYPdJru4anwX0rD4AtxHtYsyIJlcXiU+lwjYpAVbITMS8Vw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykola Kvach <Mykola_Kvach@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 1/8] arm/time: Use static irqaction
Thread-Topic: [PATCH v4 1/8] arm/time: Use static irqaction
Thread-Index: AQHcU8JXZqRbcquv2ku6ajz5kDSmTA==
Date: Wed, 12 Nov 2025 10:51:46 +0000
Message-ID:
 <8b5ea60e3224b9272c8047af42b3b20c23aef379.1762939773.git.mykyta_poturai@epam.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1762939773.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9786:EE_
x-ms-office365-filtering-correlation-id: 1f59f719-8a77-4859-4e07-08de21d979e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?w9sotDtQbCiwRDvsaa2lmwZ27YaW2y9BurIM/KQcjjhWl74x5zzBC2+Lkx?=
 =?iso-8859-1?Q?ydvwwLqrOIVbskjCOZEfIFGj5xkVEhTAhCVD8PKIhJc0Yp74ndj9+830n+?=
 =?iso-8859-1?Q?ynJkgZ0ZYp6gQvfLNXQahMh9Q51qiXnRXjlL5jEarwNliBJ2cUdDBREqQJ?=
 =?iso-8859-1?Q?9+fzr85fq10lpwoRbwlxj8YDWGRJECwRVN8sqYhhYyDDRhLBrWO4ad1ia+?=
 =?iso-8859-1?Q?NUNJWHxAkJuMlOptMemtbSsJCVRmCWO0YANLG/niaLAgXKGxfeP/YyCqGi?=
 =?iso-8859-1?Q?XaabRw5ldujN8mCS5tyj79WXY8rq7dN5TBoWy8UpspG0JreVqHj/p1LE0F?=
 =?iso-8859-1?Q?j5pz+HlXI3CC7ZfIfWeffVTvMlr+UbiVq7YBP6QYECJi87KHHI7Nns4Px4?=
 =?iso-8859-1?Q?nyaofivRKYWzJIrgvk7UD+HDJ9/L0/8Y0KTDkLUm9yGUZmEo/XiB/yVacr?=
 =?iso-8859-1?Q?YF+7S8dyOfitFXbQlleofAlhb/O3+Von5sEgrl1AKTUBB6ZLE9xgSgAn5m?=
 =?iso-8859-1?Q?1fi0z+JadiqpVWpDIpHG4V47MqWl1AhVhdK+vpzVtXkLBmRzQAsw40Ej7D?=
 =?iso-8859-1?Q?G6cRbRfv7yzBCMsoQgJm8WeboSowEU7fKxzXwtXccQxCk9U3bBr+ahsrFN?=
 =?iso-8859-1?Q?ZoV8Fdy9+MC5xUsRKMe7gotg6OPpqNq1ixxobwRRvbdcBc+l7oKV1E9Hnk?=
 =?iso-8859-1?Q?67EsgunzxDwm49GUjJ0MfQVqwGo0BwSJoGBchTf/BgnWT253qw61Z/jIkp?=
 =?iso-8859-1?Q?eHO4OiLwvDdHT9n/E6uFcaS1M6UZZGpEx4y08phe4wtpabYOgQXRu8HFXS?=
 =?iso-8859-1?Q?aXJcdWrJ4NJn963u1ehNI1ZDi/4gQHfWpITgXKl8JAIqU8GdovICYk9t+r?=
 =?iso-8859-1?Q?PYQwgVckxCFXcmBpD5gq7hN4KXoIviSSKwAqv1BzCGtuwZGrCw//DkZCG7?=
 =?iso-8859-1?Q?q2v2X5YLsqlNzIav0bCC6dWAOpYN3a8E66M/GsWlGqguOcAB5sIRKCE1Qv?=
 =?iso-8859-1?Q?AW7JZQT/FR3LbZxX0kpYvZ2BEQ5Pz8JPoKZ9swkdNLArT2jqg19czMR7T1?=
 =?iso-8859-1?Q?6B5Y4+lx6IoMw0Wfm4XRvTY43AFHsfGoj0CizKHmXdfrU7HwLW5uGhwjeF?=
 =?iso-8859-1?Q?195DWFlS5HsfBs8+P6Q3vIJe/gcrKeXQewOstbymWuEKUPsWF9mcciYz+n?=
 =?iso-8859-1?Q?7PpBisFQjUTQJ5ScIuPh6v1ia/k8rRqUwSFghQG74XFgXbCvMCM+LRaL4O?=
 =?iso-8859-1?Q?B3aAp1BdbDd5ky+NUA4d6lwH1W1GKEIhIDm+FefqBpRXtEo7gzWkZUEncW?=
 =?iso-8859-1?Q?WqjEFWRMaGSZj7R77MDgZ8mrOQTFA7NrQ0n7n6krfNG966tLwmKesfimLW?=
 =?iso-8859-1?Q?vP4XNGBUDkkNPDVl9Va6AXwAyunE5w4R+ewdigoJUu40yQ/3VNEYnal9rD?=
 =?iso-8859-1?Q?zmtOauRuGZ56m8KVcpbflBbHREhSxisRldG80krnc3dsKNMlZCH5gpboPK?=
 =?iso-8859-1?Q?Dq5s89rpedStgU//FvWE6D9cD2IfIe/1TxlNLyVojlwSdZU9Qx7P/xOzEX?=
 =?iso-8859-1?Q?a8XVPCa/lqxlSiVzJuLcGBMi3ln8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jwNuDaDqI/WB3WX75c10T6fF5PRLO2O6MvWgPbhugxk2iYj8YH+t/XIpPr?=
 =?iso-8859-1?Q?dLJ3fiN5D4pq7ttPK+BQUvgonEai/vN1rTbz9+VETpRpMrLsdaLWbwqcQb?=
 =?iso-8859-1?Q?8zdM4m8ymtFfk1dRg16U2SzsGG0+qNX21ln2Z+u7MgUJKELthX52hyDunu?=
 =?iso-8859-1?Q?IfE8TNOdK7ztyVXCaa6l85OCCfO9PRrx0INFNW6IMdbDnnc52yfNDj+3BQ?=
 =?iso-8859-1?Q?q+67UVEEuBdHiSWSJ3aJm8k+rqSPNE+gswhSnD6KqyJx3X4nvmh9L255Bq?=
 =?iso-8859-1?Q?c5NLdRaqAb5IPKCa8COYL7+2WjMkczBvkfJroy6kv/fADpbRHk0fWvADo3?=
 =?iso-8859-1?Q?H2yVp1ByrdZfi9InPhtIE5nSXPPq2OeBYdo4tOih1xYoBm8vy8uwvPVouO?=
 =?iso-8859-1?Q?DVoOm4da2C4yz1qnBzJqh305YocuSWhFQKId3PljJ0ehLibIQ5D4I8j4H4?=
 =?iso-8859-1?Q?wT+yXj0eUniJTIREAPr0EtW78V4liEoh7kETS1Ajhm4To770kg5XKSdIyf?=
 =?iso-8859-1?Q?i/ZNdREN2rV9UKFJ87U1MDMc0705JbxMMRoIxImcn+1pcpepxXxVtX+M6G?=
 =?iso-8859-1?Q?JmFSKA2pWBNvbVc7/8LDzwsPvcdLtJ3+6BczQ97MhAPsnNSW2y7zhuGBcp?=
 =?iso-8859-1?Q?eXFzZPbv7v7zIH2lK7mAKv5YmOMpIVXJWxm4wnf1bjhLCZTmdq5uDxliIu?=
 =?iso-8859-1?Q?HFnusaBk42u9m+PVjdW+myd4Mp2O3aeOPLHsz0VBi/GHL3TvGFpIvQruqw?=
 =?iso-8859-1?Q?d6XMgBU/nhPxVBjK7ZRpj+KryjIU70tTbgbdAI/U9XdrQE6n9arU7Kp5GO?=
 =?iso-8859-1?Q?/MzcQlCojw5GaVku1uxayKjS7UxDEkurNkEKR/8GHcLvAxvZd6/Y7sjw0r?=
 =?iso-8859-1?Q?hiaqMFLmY5OtL0hMTtH2Wzexk8PGHmk6LGOHCWFYBw5LVYpa5HSeQ14otK?=
 =?iso-8859-1?Q?mX3LK/ldTadCJ2Gw1IiZdmMGKYfl1RXU7lqQ/AUIkFEBRB72LcVKfHe5Rp?=
 =?iso-8859-1?Q?pkJf5GTBtFqj+6Y2W8f7yxVDh1nvC1rCw2Qf6QLBQV+9Gf8kqExxO8O6Ne?=
 =?iso-8859-1?Q?65JdcPscMco/THH6x51swuH3UDkico+vKLJC74TMN3qh329y9yYCUpzVFT?=
 =?iso-8859-1?Q?+fN7EdXUyXb112CgYI+/5zeoFIuUbD7+1s8SVL9Ofus+XKBGfCLAvTjpBp?=
 =?iso-8859-1?Q?3MdsrkPd8vsQtelsw+W2ig+/ZI0O8FzQrPaZOpLN629kQ9YbjBSDxRVEKq?=
 =?iso-8859-1?Q?TMFy/b8HVllV5P9GstAbO69OszW51U7gNDZnbtQGfJ2kSJHzIMxxvVEPQr?=
 =?iso-8859-1?Q?nlMIEiUjBBfq5MSvZfINMaZCXmAlNFR8sp5X3dvZ+TCS/VcIdAqmFI0bUt?=
 =?iso-8859-1?Q?gyN1GnukaZ8GwAmb/L/hhXqnJrCjaIRwRuvEXHybv8lHozJQuGGC0E2sO4?=
 =?iso-8859-1?Q?EyFxT5F4AKf6xAF/ujGONyakEjqbf1EWzqMsGUy4YV390Hqs1uF2EIQL7A?=
 =?iso-8859-1?Q?F+RlHu7KNzw48gJl9/JADHOfXbr69UOafPoLFUgk5jnLZFBwzYkNFzE+tP?=
 =?iso-8859-1?Q?2wKdnTX7AGjZTJ7RtooBDJWCzPbCcTONtRG4TIbtbb9uJIuF9F+Eeac57A?=
 =?iso-8859-1?Q?AM52GzDUOVNnoBCfv85DcpimiX9GIV8gw6lznSRx5Z75gKvujMqb03dw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f59f719-8a77-4859-4e07-08de21d979e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 10:51:46.9532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QX2OXb2S1M0kltWTmajWDXjBVFkmoRdbfvncz70luuToK1w0xCwvLhvRfn4t3Z8rM0q5uWYsE/MSBDzIgmKqVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9786

When stopping a core deinit_timer_interrupt is called in non-alloc
context, which causes xfree in release_irq to fail an assert.

To fix this, switch to a statically allocated irqaction that does not
need to be freed in release_irq.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>

v3->v4:
* make irqactions static
* collect RBs

v2->v3:
* no changes

v1->v2:
* use percpu actions
---
 xen/arch/arm/time.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index e74d30d258..3710eab109 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -303,9 +303,15 @@ static void check_timer_irq_cfg(unsigned int irq, cons=
t char *which)
            "WARNING: %s-timer IRQ%u is not level triggered.\n", which, irq=
);
 }
=20
+static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_hyp);
+static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_virt);
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
2.51.2

