Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDEE1F714A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 02:23:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjXT5-0007Mu-BD; Fri, 12 Jun 2020 00:22:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jjXT4-0007MF-6t
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 00:22:46 +0000
X-Inumbo-ID: d401da06-ac42-11ea-b594-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.89]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d401da06-ac42-11ea-b594-12813bfff9fa;
 Fri, 12 Jun 2020 00:22:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jo9NyPPpKEn+J8Voeiv3iGJVohkKdj4IWKAB+DnRIkFLM0GTps00q98t8AbRURO1mbF77azVaagcAoklvK1sSy5VuGl4X8qO7nju8QHFRqpxMLgLymcIZGLmCntv9oU5aj94EXaNniT296MpT5eFK0T1A8xVkwKjtRvqhMBgJWdaZwmP0HgMh+6iePT1e/tdim0ESe3D3bu4qIRdx/7xEzM+YL516PDMds3mI/fuX4PyXi8fdjqKdnldzTsWIlAPLbGX4pPAu4meZYTTF3hobGtOlXjYVak7puwtRGLiLHBF6nRcr4hMZNYxRmNCR361efJkqqVJmQ4ZuJcz/ZLn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kLqXND8iIZTqE5y3gEpFrrEeZngnuQJdxwT84/FVNk=;
 b=hYtBRad60UC73911tFjnOdEa+2150Fg3x9OMkfBzc3IV7D0WcGNSYraIHbYQCnMLW04Cnt+2kx62ibjurpFL2v9KtuZnDkCHkruS1mQ6E0KZAmAbH/Gr5neKRlpiO7YqYd1JI2wX5kzuUMQVnEd9o/8xOLCtCao6CqcxsKpGwOowNlu2vHlwcgUZkj6UfjlAWTu4mitAFPp5Y3YgE9dTVBh+Z4GEi4PyYRYkR7Z4uC+NOKEWLaKnPoEEN2IZZsJZhZKSxTxEMAEv8d9WvzR7GvQYKH9f+z0N92cuO2dLp2NNLWmy9zyuNToZFa9wCe4FHU3dlOPnCfT8nHkX4RUS2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kLqXND8iIZTqE5y3gEpFrrEeZngnuQJdxwT84/FVNk=;
 b=3aroGyhRoiUXnrA8zoEiBjScWWCWvDFx7r+MhI1yPCFfzTgZ4zKc1bSEEaW5nZMYwLvFx9vCvz7TXBDokwai/xwQBPB0zp+I5ZI2lOsF2VcJrRqvTqUty5+yNe8hr06tFHOuhzjxS5v26m7bhQiTCWML6A2JF8x0PfCWLTJt5/bGKivAixFzj0Mx5VYMKHkGU7bblgZYcRgwbLrHus2h0vdbl3xVcAf0W6a4B8z4b6mfRvSuq72b1AUcS2e1O0hktYaTl1sAdRbkVBrhmzsL1TrjQEgSnOovbQe72h7uSZ/9Ss2PkDYvYzj0WyKFmwgoL5PP6I/lMfmP66JRTRk3wA==
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB2654.eurprd03.prod.outlook.com
 (2603:10a6:800:e0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Fri, 12 Jun
 2020 00:22:37 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3088.018; Fri, 12 Jun 2020
 00:22:37 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
Thread-Topic: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
Thread-Index: AQHWQE+SUtF98x/3akmRxwBff1s+mw==
Date: Fri, 12 Jun 2020 00:22:36 +0000
Message-ID: <20200612002205.174295-3-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: 6defc929-7bcc-49ef-5dcb-08d80e66b5b4
x-ms-traffictypediagnostic: VI1PR0302MB2654:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0302MB26542F7F6DB9FD82EAF71A21E6810@VI1PR0302MB2654.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x1+xAcMfAXSvFiQX8tqHfR67YXzSp0qQY+JrI8vrE1QDS8ZmLsi+zvyOY4QuEqWslt3TbnoI74whZN7vZsoM3SCQWnKauFoIs6q5VB1Ob2Z1DyXhb/Ivi2nPR+9pEiOADj1FUULp/g1XZEgAgkd8ME9f8ZGeYEIgYjmF9wcGqyTqtDeOghHA4RuOyh73HW4j/4rVNRe/swfpAUhyrIsaBHvSBp4OBGDt4hvNsOmCU7ItIQYMu+ly6MUezan6JAgvp8APxk+isDAlfd5dw4PkMIJ/o6KB4h+xFbRr8psuvr49sFL3uG8MWY1jol/3ocdXb952rWTYdBOFyLMnZkJT6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(66446008)(64756008)(478600001)(66946007)(66556008)(76116006)(66476007)(26005)(91956017)(36756003)(8676002)(86362001)(55236004)(186003)(8936002)(4326008)(6506007)(54906003)(6512007)(2906002)(6486002)(316002)(5660300002)(83380400001)(6916009)(71200400001)(1076003)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: fazK2nhL2+zYI8zNGHh+oRHoCK01Nb1SRwRu6hAp1gbhcvKwv6DvzmKuuEY29l70yE/jwh6j4NmuomG8mpwX0oH+5fMWMj5PKyi/K7pawWmOmpiE0173QUkPuYAyWrK4+FoG8pxTCu2tSrIFqDn5h75WcZyHdHT+BmHklivHKvQkNMKWwEJVQ4249MPGoqZYjPEBXolnOAi6f8t5feCUctNiamkV8sqRaTTX9VQPCAwyAjtxeRmmTAIWGrYXP3+dIRFLEsgpYMSzll4WTcBm7eeUfHhbSc0M5pzk7fNUAiunCnCItaTqNjvp4O8qJnvwcarbd3e8ol4ZqUmpSg7PkGL8duw+6sZZZCp8mKeLV9GTosbXQqwZ0Obsvwp63RS9/8hYVArm3hcq4qAgLNqFnXyrFYiLJOV5wzPVrj5YHArf8OZ/C6/E+yN6Iv+OOW1ngBiqAKGE0DSHXWAsfp8mkwdSNYu47illWy6PxrWxUZ0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6defc929-7bcc-49ef-5dcb-08d80e66b5b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 00:22:36.6637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oF7wcJr5jLlKnmkhhLRDCZY73ubGoERNa5aD1tl/ppUX00kRfiFW8opx13jBOm8zZBmGlDIIzIZQD6vv31vkLy0JxW8us1g56LZZa037mS8=
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In most cases hypervisor code performs guest-related jobs. Tasks like
hypercall handling or MMIO access emulation are done for calling vCPU
so it is okay to charge time spent in hypervisor to the current vCPU.

But, there are also tasks that are not originated from guests. This
includes things like TLB flushing or running tasklets. We don't want
to track time spent in this tasks to a total scheduling unit run
time. So we need to track time spent in such housekeeping tasks
separately.

Those hypervisor tasks are run in do_softirq() function, so we'll
install our hooks there.

TODO: This change is not tested on ARM, and probably we'll get a
failing assertion there. This is because ARM code exits from
schedule() and have chance to get to end of do_softirq().

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/common/sched/core.c | 32 ++++++++++++++++++++++++++++++++
 xen/common/softirq.c    |  2 ++
 xen/include/xen/sched.h | 16 +++++++++++++++-
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8f642ada05..d597811fef 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -945,6 +945,37 @@ void vcpu_end_irq_handler(void)
     atomic_add(delta, &current->sched_unit->irq_time);
 }
=20
+void vcpu_begin_hyp_task(struct vcpu *v)
+{
+    if ( is_idle_vcpu(v) )
+        return;
+
+    ASSERT(!v->in_hyp_task);
+
+    v->hyp_entry_time =3D NOW();
+#ifndef NDEBUG
+    v->in_hyp_task =3D true;
+#endif
+}
+
+void vcpu_end_hyp_task(struct vcpu *v)
+{
+    int delta;
+
+    if ( is_idle_vcpu(v) )
+        return;
+
+    ASSERT(v->in_hyp_task);
+
+    /* We assume that hypervisor task time will not overflow int */
+    delta =3D NOW() - v->hyp_entry_time;
+    atomic_add(delta, &v->sched_unit->hyp_time);
+
+#ifndef NDEBUG
+    v->in_hyp_task =3D false;
+#endif
+}
+
 /*
  * Do the actual movement of an unit from old to new CPU. Locks for *both*
  * CPUs needs to have been taken already when calling this!
@@ -2615,6 +2646,7 @@ static void schedule(void)
=20
     SCHED_STAT_CRANK(sched_run);
=20
+    vcpu_end_hyp_task(current);
     rcu_read_lock(&sched_res_rculock);
=20
     lock =3D pcpu_schedule_lock_irq(cpu);
diff --git a/xen/common/softirq.c b/xen/common/softirq.c
index 063e93cbe3..03a29384d1 100644
--- a/xen/common/softirq.c
+++ b/xen/common/softirq.c
@@ -71,7 +71,9 @@ void process_pending_softirqs(void)
 void do_softirq(void)
 {
     ASSERT_NOT_IN_ATOMIC();
+    vcpu_begin_hyp_task(current);
     __do_softirq(0);
+    vcpu_end_hyp_task(current);
 }
=20
 void open_softirq(int nr, softirq_handler handler)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ceed53364b..51dc7c4551 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -239,7 +239,12 @@ struct vcpu
=20
     /* Fair scheduling state */
     uint64_t         irq_entry_time;
+    uint64_t         hyp_entry_time;
     unsigned int     irq_nesting;
+#ifndef NDEBUG
+    bool             in_hyp_task;
+#endif
+
     /* Tasklet for continue_hypercall_on_cpu(). */
     struct tasklet   continue_hypercall_tasklet;
=20
@@ -279,8 +284,9 @@ struct sched_unit {
     /* Vcpu state summary. */
     unsigned int           runstate_cnt[4];
=20
-    /* Fair scheduling correction value */
+    /* Fair scheduling correction values */
     atomic_t               irq_time;
+    atomic_t               hyp_time;
=20
     /* Bitmask of CPUs on which this VCPU may run. */
     cpumask_var_t          cpu_hard_affinity;
@@ -703,6 +709,14 @@ void vcpu_sleep_sync(struct vcpu *v);
 void vcpu_begin_irq_handler(void);
 void vcpu_end_irq_handler(void);
=20
+/*
+ * Report to scheduler when we are doing housekeeping tasks on the
+ * current vcpu. This is called during do_softirq() but can be called
+ * anywhere else.
+ */
+void vcpu_begin_hyp_task(struct vcpu *v);
+void vcpu_end_hyp_task(struct vcpu *v);
+
 /*
  * Force synchronisation of given VCPU's state. If it is currently desched=
uled,
  * this call will ensure that all its state is committed to memory and tha=
t
--=20
2.27.0

