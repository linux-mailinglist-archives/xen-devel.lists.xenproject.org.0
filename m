Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D911F714E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 02:23:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjXTA-0007NN-KW; Fri, 12 Jun 2020 00:22:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jjXT9-0007MF-76
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 00:22:51 +0000
X-Inumbo-ID: d38d35c0-ac42-11ea-b594-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.49]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d38d35c0-ac42-11ea-b594-12813bfff9fa;
 Fri, 12 Jun 2020 00:22:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcP4sA+hEQVJF1W6Y9DzG8r+tQez69RJY1B1fyJTUs1IR9R2OfAYVgzYUypwYlA0WXhY3ki533i7dVFvQ90dXMaI80uXA4iqxcffQjqyIx3SXgifMdK3g8XuZYY52ysdd7dqNYLzEebBIJFdjO5YBAyOQxG7ClFDs542XaglFfB4GA5Q7hE2r8VNgB8thitHmGBWgIyifPKt3HviXB9WbJwxvhwuS3j4vM+74eXlR1xTlxUEX1lnxFbeXz9OOrqysrA3FrvgVTRxBVSuqLaKi6Xmga8++eXhGI1Xw9rg3IlFFpMwcP/P1KUHTLDdU9hwrrBBLxhoRFZAeL7kr7gFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8n6iL6VdFsc8wy50qekTiQl7oB+xdogsCttW9HtWe3c=;
 b=hRYEygeO19t/RydII5dQd+S0i0PuJpDBo14j8oy6PcG7Du4EgmTEiaa4TiW6iv0JIF5A5stYPsrhVFiA1cl0XBIkm9Ji9+7YvHzmAUBURu9d1uWgqOPuY/U6/Rl9wLPSUhwNT7OBiExEcvm0/DJNG5a1aKNWvnNPjP24U3iaGXt2Hs74Hrnv5teGDW9CWve4S5I3YC/SWqx3hZUXU3oSZr6+C174kPkdMN1qHPsSPDImeiw+f5FTHhCxuxMd1vgQigNg0WLeI2SBHIvCZN/aIWKZO4VEshx5AtKKxwCmTc5TyZ82vrCjBGX1XoK23AxZ24prkaqODbICHKQJWvWL5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8n6iL6VdFsc8wy50qekTiQl7oB+xdogsCttW9HtWe3c=;
 b=xjEHcBSjLKdQGJ45QJ4OUNfVtLN+yE1e1FP+/fZadJc0msL9J+csATfp++5vWmFyfpuEXiK8jfGOxx1/Iki9lNDw9ox7owlOosy3HJLrCyoi5uDRTvEMwYVb823RZpewYSXHU1m5UBBmZpEOnuFNPlNQPOUWNR0TmVuDHS2QrIVMvgScIRTpsw8/tZjk+5Q2HdDK/rd1lXlQk0ljb58ant3aXTtXxsHtBjyiv1pAtaMGsTZoyKo5Mhg9twgBKJkpkbHOn8nXzy/iUcBRkMlaR7sHM3lk7kYhxCKtNf0R05hEthxf+u+GmKM3F6HjS9RBEVpwN2tc5UEI9sTp1gOw+w==
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB2654.eurprd03.prod.outlook.com
 (2603:10a6:800:e0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Fri, 12 Jun
 2020 00:22:36 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3088.018; Fri, 12 Jun 2020
 00:22:36 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [RFC PATCH v1 1/6] sched: track time spent in IRQ handler
Thread-Topic: [RFC PATCH v1 1/6] sched: track time spent in IRQ handler
Thread-Index: AQHWQE+STyWApsQdk0CG54zgwiPygA==
Date: Fri, 12 Jun 2020 00:22:36 +0000
Message-ID: <20200612002205.174295-2-volodymyr_babchuk@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d142841-7f32-43ca-1742-08d80e66b585
x-ms-traffictypediagnostic: VI1PR0302MB2654:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0302MB26543FADC5DE10830909E3A5E6810@VI1PR0302MB2654.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A3DHQlteC/uRdv11c01jNEar4XsYAKwmOfpvHOPK2ntTM4kd6C8WD67kIQATvoBx9L2LWqa7SIc3PxwJIYftMuSja+IskTrPzBtrL610WK1UyK3+pZTYyAJ6SbOAEI+kfptfw2u4PG+XLDMIRZJMMDQfXEkuPa3Vcsipw4ptdvBhXlMYPIwSZJ7P3AyEzvreHxWajKwGYEVIkx7sFTnZTIG22x1ZQcH6ZobiWvNteBlr9yiTOIox6aHYAVwN2MDQGS+pz/hZbNTEiZ0X3hfh5rUoOstFT3YHClw3Mf2AO3rYOKqalIylQErnKCdbrflyTPcaUMUxILTgGKMa8M3gSDE1kqvhBdczvTjVgMndQ4oXJAg7CE2qlC78UcIT9MjH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(66446008)(64756008)(478600001)(66946007)(66556008)(76116006)(66476007)(26005)(91956017)(36756003)(8676002)(86362001)(55236004)(186003)(8936002)(4326008)(6506007)(7416002)(54906003)(6512007)(2906002)(6486002)(316002)(5660300002)(83380400001)(6916009)(71200400001)(1076003)(2616005)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: moyzJTyMdelEEhrkI8khnrHuQvBY3ENfYyyw2lctvcOpCNPjPehzM0cstOKmAyOycpxvDut0/jJjQvx51DOh5PMFOcrJI4JLb3J5p1dxogGKHfScfDkA5fXANDIKa9bEsJqhIBtY8nq3aw0Cx4PLjPLKTRVvA++3UeCcs6j8FhMlAdJQH+TvDVF57sm1s4XTsUZoB2NgO6Z0OIFTZXppsxcVbNg2dRNhbrL+7I0zBCaYJadSN2Tp50ChC/78LCNJShrUwVjmTMDK8rxLcpu7rZydfF4i/wKX6Mc+zQong7MykOO81TI5XIPxEOUFtaWSgJmpFwZ4jWkkUwrUCwioqPR9dAKuEuWBsEktpo9FL4NRM+DMOOM1XnIdvNb0Nic8ZXaSkhTl4xAdIiZ6ZEJo61JGRK2hTagacS7MeaqmeTk/85qjBkzW0yYLwdMX5C0K5m4YlL3clH1DhcNr+mefjgexuIqSdqErB8iBd9QfNrA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d142841-7f32-43ca-1742-08d80e66b585
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 00:22:36.3359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BYPRm6ZMprkAWgcLBms6TtzX9LlRvESjFYyChLURXmpabqyq5woLdP1h2tGSVp2ih7mSTYD3VjEyl3V2GfveVg/nzkwHoRu9YNUGInmdDJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2654
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add code that saves time spent in IRQ handler, so later we can make
adjustments to schedule unit run time.

This and following changes are called upon to provide fair
scheduling. Problem is that any running vCPU can be interrupted by to
handle IRQ which is bound to some other vCPU. Thus, current vCPU can
be charged for a time, it actually didn't used.

TODO: move vcpu_{begin|end}_irq_handler() calls to entry.S for even
more fair time tracking.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/irq.c      |  2 ++
 xen/arch/x86/irq.c      |  2 ++
 xen/common/sched/core.c | 29 +++++++++++++++++++++++++++++
 xen/include/xen/sched.h | 13 +++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 3877657a52..51b517c0cd 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -201,6 +201,7 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int ir=
q, int is_fiq)
     struct irq_desc *desc =3D irq_to_desc(irq);
     struct irqaction *action;
=20
+    vcpu_begin_irq_handler();
     perfc_incr(irqs);
=20
     ASSERT(irq >=3D 16); /* SGIs do not come down this path */
@@ -267,6 +268,7 @@ out:
 out_no_end:
     spin_unlock(&desc->lock);
     irq_exit();
+    vcpu_end_irq_handler();
 }
=20
 void release_irq(unsigned int irq, const void *dev_id)
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index a69937c840..3ef4221b64 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1895,6 +1895,7 @@ void do_IRQ(struct cpu_user_regs *regs)
     int               irq =3D this_cpu(vector_irq)[vector];
     struct cpu_user_regs *old_regs =3D set_irq_regs(regs);
=20
+    vcpu_begin_irq_handler();
     perfc_incr(irqs);
     this_cpu(irq_count)++;
     irq_enter();
@@ -2024,6 +2025,7 @@ void do_IRQ(struct cpu_user_regs *regs)
  out_no_unlock:
     irq_exit();
     set_irq_regs(old_regs);
+    vcpu_end_irq_handler();
 }
=20
 static inline bool is_free_pirq(const struct domain *d,
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index cb49a8bc02..8f642ada05 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -916,6 +916,35 @@ void vcpu_unblock(struct vcpu *v)
     vcpu_wake(v);
 }
=20
+void vcpu_begin_irq_handler(void)
+{
+    if (is_idle_vcpu(current))
+        return;
+
+    /* XXX: Looks like ASSERT_INTERRUPTS_DISABLED() is available only for =
x86 */
+    if ( current->irq_nesting++ )
+        return;
+
+    current->irq_entry_time =3D NOW();
+}
+
+void vcpu_end_irq_handler(void)
+{
+    int delta;
+
+    if (is_idle_vcpu(current))
+        return;
+
+    ASSERT(current->irq_nesting);
+
+    if ( --current->irq_nesting )
+        return;
+
+    /* We assume that irq handling time will not overflow int */
+    delta =3D NOW() - current->irq_entry_time;
+    atomic_add(delta, &current->sched_unit->irq_time);
+}
+
 /*
  * Do the actual movement of an unit from old to new CPU. Locks for *both*
  * CPUs needs to have been taken already when calling this!
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ac53519d7f..ceed53364b 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -237,6 +237,9 @@ struct vcpu
     evtchn_port_t    virq_to_evtchn[NR_VIRQS];
     spinlock_t       virq_lock;
=20
+    /* Fair scheduling state */
+    uint64_t         irq_entry_time;
+    unsigned int     irq_nesting;
     /* Tasklet for continue_hypercall_on_cpu(). */
     struct tasklet   continue_hypercall_tasklet;
=20
@@ -276,6 +279,9 @@ struct sched_unit {
     /* Vcpu state summary. */
     unsigned int           runstate_cnt[4];
=20
+    /* Fair scheduling correction value */
+    atomic_t               irq_time;
+
     /* Bitmask of CPUs on which this VCPU may run. */
     cpumask_var_t          cpu_hard_affinity;
     /* Used to save affinity during temporary pinning. */
@@ -690,6 +696,13 @@ long vcpu_yield(void);
 void vcpu_sleep_nosync(struct vcpu *v);
 void vcpu_sleep_sync(struct vcpu *v);
=20
+/*
+ * Report IRQ handling time to scheduler. As IRQs can be nested,
+ * next two functions are re-enterable.
+ */
+void vcpu_begin_irq_handler(void);
+void vcpu_end_irq_handler(void);
+
 /*
  * Force synchronisation of given VCPU's state. If it is currently desched=
uled,
  * this call will ensure that all its state is committed to memory and tha=
t
--=20
2.27.0

