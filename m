Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEE11F714B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 02:23:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjXTP-0007TI-Jf; Fri, 12 Jun 2020 00:23:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jjXTO-0007MF-7K
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 00:23:06 +0000
X-Inumbo-ID: d526ac36-ac42-11ea-b594-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.89]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d526ac36-ac42-11ea-b594-12813bfff9fa;
 Fri, 12 Jun 2020 00:22:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpU3T1x/ikoK34ceEilCbGfH4gsXlZpp6QNPIV3SE9eWByAb1I34vf17B/AhSFSSXA5OM0tBb+vReMd+zQh8tPPsugyXfHljQM7CIpm5RCBXMcRRyRSBTq+ret28CB8NdaJaNgu28ebTkBs3kNHSkQUlH2S5cKLfAK+AUZuiDpuibBwRGhADHf4gFmNcJKaNcNt5whe4Ah1L3CRWbEy5yvcoELkmFOt7MTiLyNd1qb/yoLyDG4D2TA3mZD0c1bx6z1rmm8upnoLKt2xQlcGk7WrgYaSFzfKjY5bkCziRA8lr6XrhuG4d0QXAh+I7MaTuxt7oNmsUXJUAfIOhP80nMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhQNqLAduYZF/1BUXnFYEz+JT7fMJefrT4kFPEI56d4=;
 b=E07xBZTxSZ/4SLqRSjiFYywimdCXBo/5kXME1UiL1cBfF/ah3uwYwdCjQRJg4a8nk86va1bfG6SFE9W6DjRey7Np2EiZgzv84iKgfCziPpGFhZzxTufnBXU/5wb+Twd6FYaN5laYc7/ONF9e29PYRTawfdkiTGcJGEZVdS61kduD/a45aeV0PFL0uxb8K0fi6tzbLIlBExTocrIUbgqMjAALxBCQ24gEEO3bPay1C21EajCMkYznTL/QRTCdshkoaNytKYGbPL90pciEF3vtZuqtUf7iplmVcX0KO0CkAkUrzfwnkGuVZm6mv9z24R6lPvPznk5Uf3x3lXFphJ+03w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhQNqLAduYZF/1BUXnFYEz+JT7fMJefrT4kFPEI56d4=;
 b=TjkF86XsEXus/Da+pkq5ScryeKBHnJrCS0a+tTYn9iU139MnP6k68xDpJKjoNQR9YhiGSKEPUJzrvTvLsnHjVVdVp9jAKsCZKuYYMBSqQdDGJRVa3ZyYyW2jiRcKFrz4EQounuEpWSNK3ofelas07HyWcDz3dTHw5AhgtOr0SoLw3ER9kJY0w5TMWUxHV8fR9KK9SeDRB7i8znvLw2Eui6aXb5DxH/oHfVMrWIoqPm0UHsXynstBr9xWvvk/kp2LTgiFVwP5Vigvoz/5yMB5Js9LxUkGSr14s6iUH9Rkqo7tlm1OCFoxoffQYBnoJVvBlDyl3zEgdalX0xRm/M5QCg==
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB2654.eurprd03.prod.outlook.com
 (2603:10a6:800:e0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Fri, 12 Jun
 2020 00:22:38 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3088.018; Fri, 12 Jun 2020
 00:22:38 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [RFC PATCH v1 6/6] trace: add fair scheduling trace events
Thread-Topic: [RFC PATCH v1 6/6] trace: add fair scheduling trace events
Thread-Index: AQHWQE+TrxaSoGuic062xf5W0YJ0vg==
Date: Fri, 12 Jun 2020 00:22:37 +0000
Message-ID: <20200612002205.174295-7-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: 7643c403-423d-4a9a-72d3-08d80e66b67c
x-ms-traffictypediagnostic: VI1PR0302MB2654:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0302MB2654FA2D1081C4B38A917610E6810@VI1PR0302MB2654.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:50;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X2SG3eldEkEDFpLCJXcdAFMMjpk8lZHC+Za0YD37Wt+ErFwmTpX9pLIAKh/KsLfW0woEFoFlTFltG+deHmOGVhvr0LAuvzv0ILCxksln0Kt76E1auC4iJHoYewnK5+l8DaIka9r/rIyo1xgjBoHPsYf56mrPK5c2Eo9phAuGtYQYyakJGLlDIkmnD/6dJGV9bnH0m/PboLRmZa6sJgDjbVpLPy09Xe+7cZ8L+Yc9mKoeaLWfBV14Uv11dkrLlDMug1ZZmUKhTgWhyJp/fDSlnq2QoskJWZlW1yTwFdIxiCYMqXoCXE2Zr7iTH1s5IMOnuvmmyDQ1/vj49DRglUU0cslJbiEmLAV9MoeOAqMSE4o4WGGOg8+owic2u8fWJ3UU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(66446008)(64756008)(478600001)(66946007)(66556008)(76116006)(66476007)(26005)(91956017)(36756003)(8676002)(86362001)(55236004)(186003)(8936002)(4326008)(6506007)(54906003)(6512007)(2906002)(6486002)(316002)(5660300002)(83380400001)(6916009)(71200400001)(1076003)(2616005)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: X276hooWpkKRPXUz48Ksn0UX+Cch9MGZxn89XRWtxFloRBUQKzrKJKgCnj/+TXfvs2c2SoklIrCrDeZE6RZ763ngaHZRPCIa6xeKVFftM8SmnY5CwOGJ6jpLLmhLHId0zrWad4arUmSgurvZg+evmdF8XspqgYWyaLeJByPGD2wV1c2RsHk0g27m/6N56rmRq3NmIGT5g2UmEAEnFtInZVGS9RgjblugkoRFGoDxriAAr/t2BB7/oEG6gkvPL5qZ7b+UBDUSvO7c/cne00Ah248ZSeyj+3YAgfyICAlUwMpSLXUl++XYqfDHXLuapJ8HWtd4KOz9mujkjSRyBnaM0AvECTmF95KGBNO+b+pKK8LIquh2pRekVvjkD1lWn5b2KnK1zHo8Dv7DNtBAFnRYoo/IXMWERA6tZBgsh0M9kIYWL7cKkPeiMpfj33dwuTdC9HfFQxOP+W/kMZk5nrWWvhF6ESYynPpHsT0tCp3d0GY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7643c403-423d-4a9a-72d3-08d80e66b67c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 00:22:37.9310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: urOv9Ezf93ttC7W+llqH8ci9+LtMuiO/8/StYjUvaPWgPcHbA7HVp2tsU+5CqLjNzh+FcPI91eYfTgwDUe8v1GLH5amJpkloQcTV3mIZIgc=
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

We are tracing each IRQ or HYP mode change and the calculated time
adjustment values.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 tools/xentrace/xenalyze.c  | 37 +++++++++++++++++++++++++++++++++++++
 xen/common/sched/core.c    |  9 +++++++++
 xen/include/public/trace.h |  5 +++++
 3 files changed, 51 insertions(+)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index b7f4e2bea8..bcde830f0e 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -7546,6 +7546,43 @@ void sched_process(struct pcpu_info *p)
                 printf("\n");
             }
             break;
+        case TRC_SCHED_IRQ_ENTRY:
+        case TRC_SCHED_IRQ_LEAVE:
+            if(opt.dump_all)
+            {
+                struct {
+                    unsigned int nesting;
+                } *r =3D (typeof(r))ri->d;
+
+                printf(" %s sched_irq_%s nesting =3D %u\n", ri->dump_heade=
r,
+                       ri->event =3D=3D TRC_SCHED_IRQ_ENTRY ? "entry":"lea=
ve",
+                       r->nesting);
+            }
+            break;
+        case TRC_SCHED_HYP_ENTRY:
+        case TRC_SCHED_HYP_LEAVE:
+            if(opt.dump_all)
+            {
+                struct {
+                    unsigned int domid, vcpuid;
+                } *r =3D (typeof(r))ri->d;
+
+                printf(" %s sched_hyp_%s d%uv%u\n", ri->dump_header,
+                       ri->event =3D=3D TRC_SCHED_HYP_ENTRY ? "entry":"lea=
ve",
+                       r->domid, r->vcpuid);
+            }
+            break;
+        case TRC_SCHED_TIME_ADJ:
+            if(opt.dump_all)
+            {
+                struct {
+                    unsigned int irq, hyp;
+                } *r =3D (typeof(r))ri->d;
+
+                printf(" %s sched time adjust IRQ %uns HYP %uns Total %uns=
\n", ri->dump_header,
+                       r->irq, r->hyp, r->irq + r->hyp);
+            }
+            break;
         case TRC_SCHED_CTL:
         case TRC_SCHED_S_TIMER_FN:
         case TRC_SCHED_T_TIMER_FN:
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index ee6b1d9161..9e82a6a22b 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -925,6 +925,8 @@ void vcpu_begin_irq_handler(void)
     if (is_idle_vcpu(current))
         return;
=20
+    TRACE_1D(TRC_SCHED_IRQ_ENTRY, current->irq_nesting);
+
     /* XXX: Looks like ASSERT_INTERRUPTS_DISABLED() is available only for =
x86 */
     if ( current->irq_nesting++ )
         return;
@@ -941,6 +943,8 @@ void vcpu_end_irq_handler(void)
=20
     ASSERT(current->irq_nesting);
=20
+    TRACE_1D(TRC_SCHED_IRQ_LEAVE, current->irq_nesting - 1);
+
     if ( --current->irq_nesting )
         return;
=20
@@ -960,6 +964,7 @@ void vcpu_begin_hyp_task(struct vcpu *v)
 #ifndef NDEBUG
     v->in_hyp_task =3D true;
 #endif
+    TRACE_2D(TRC_SCHED_HYP_ENTRY, v->domain->domain_id, v->vcpu_id);
 }
=20
 void vcpu_end_hyp_task(struct vcpu *v)
@@ -978,6 +983,8 @@ void vcpu_end_hyp_task(struct vcpu *v)
 #ifndef NDEBUG
     v->in_hyp_task =3D false;
 #endif
+    TRACE_2D(TRC_SCHED_HYP_LEAVE, v->domain->domain_id, v->vcpu_id);
+}
=20
 s_time_t sched_get_time_correction(struct sched_unit *u)
 {
@@ -1003,6 +1010,8 @@ s_time_t sched_get_time_correction(struct sched_unit =
*u)
     sched_stat_hyp_time +=3D hyp;
     spin_unlock_irqrestore(&sched_stat_lock, flags);
=20
+    TRACE_2D(TRC_SCHED_TIME_ADJ, irq, hyp);
+
     return irq + hyp;
 }
=20
diff --git a/xen/include/public/trace.h b/xen/include/public/trace.h
index d5fa4aea8d..6161980095 100644
--- a/xen/include/public/trace.h
+++ b/xen/include/public/trace.h
@@ -117,6 +117,11 @@
 #define TRC_SCHED_SWITCH_INFNEXT (TRC_SCHED_VERBOSE + 15)
 #define TRC_SCHED_SHUTDOWN_CODE  (TRC_SCHED_VERBOSE + 16)
 #define TRC_SCHED_SWITCH_INFCONT (TRC_SCHED_VERBOSE + 17)
+#define TRC_SCHED_IRQ_ENTRY      (TRC_SCHED_VERBOSE + 18)
+#define TRC_SCHED_IRQ_LEAVE      (TRC_SCHED_VERBOSE + 19)
+#define TRC_SCHED_HYP_ENTRY      (TRC_SCHED_VERBOSE + 20)
+#define TRC_SCHED_HYP_LEAVE      (TRC_SCHED_VERBOSE + 21)
+#define TRC_SCHED_TIME_ADJ       (TRC_SCHED_VERBOSE + 22)
=20
 #define TRC_DOM0_DOM_ADD         (TRC_DOM0_DOMOPS + 1)
 #define TRC_DOM0_DOM_REM         (TRC_DOM0_DOMOPS + 2)
--=20
2.27.0

