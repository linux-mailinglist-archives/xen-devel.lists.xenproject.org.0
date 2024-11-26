Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FE29D9F94
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844047.1259605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tm-0000VQ-Iv; Tue, 26 Nov 2024 23:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844047.1259605; Tue, 26 Nov 2024 23:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tm-0000Qp-DN; Tue, 26 Nov 2024 23:23:14 +0000
Received: by outflank-mailman (input) for mailman id 844047;
 Tue, 26 Nov 2024 23:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sc-0000At-3S
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:02 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3abaf4ed-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:21:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BD963A41660;
 Tue, 26 Nov 2024 23:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47EA8C4CED2;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 37680D66B8A;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
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
X-Inumbo-ID: 3abaf4ed-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjNhYmFmNGVkLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzE3Ljg5NTQ0NCwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663315;
	bh=cKINO/Hsop/bfc6jLIz0xl2D+OXz60jGYySFfpDcAlU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q5St0jFa5oFUvjtCcRCeWJmo6nYrhlIHDG52k32aN6SMTRRJ/SPvVvpVGXpn7yJ5C
	 dFdQRzjsTwehBpnCGgLBzkzeOgmKwSRK+TR5NwnZQ0BMxFyUgzADvvckX31MpRHKE4
	 xz48heyE1k5iquEGcUE51LjUw36xlXsaXHEh+UtYPHV2wf7aoXXnb2NxifKhG00N49
	 A55dQF8MPu9VzDAG6cUnEhbKBYRk+AsxkynSiPxMMIK96hvppfssOfNycH3etAiLZi
	 5VvucsQ+xGcrQqXUqotLn1vvutpDF8Z2cpyXJsRMztpKmQa0o6SYDLgYtOWjKokVWW
	 ARdgoCOj25yuQ==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:21:52 -0800
Subject: [PATCH 02/36] xsm/flask: missing breaks, MISRA rule 16.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-2-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=1534;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=Om6cdnbe5fxG+CPjXPUOumzF0XPQ191PKf8s/8GFQ90=;
 b=w8ahloFDu924cxnDNLZ4R1wwM6DWcNf1t2DrnlPft9LzkIetQCU1BI/6U654/5ljvXy08gkyR
 0sUOpQD/agmCgTz6kCaQ8aW0762sTvVUZlawmKG9f0feuH2wHd5/HYB
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

While working on console forwarding for virtual NS8250 I stepped into
  flask_domain_alloc_security()
where break statement was missing in default case which violates MISRA
rule 16.4.

Fixed everywhere in hooks.c.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/xsm/flask/hooks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index dfa23738cd8a9fd91eda23d9c328c3cc55d31418..a79474ffe43af19f602a6c067eab6b40dba0d946 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -198,6 +198,7 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
             else if ( pv_shim )
                 dsec->sid = SECINITSID_DOMU;
         }
+        break;
     }
 
     dsec->self_sid = dsec->sid;
@@ -342,6 +343,7 @@ static int cf_check flask_evtchn_send(struct domain *d, struct evtchn *chn)
         break;
     default:
         rc = avc_unknown_permission("event channel state", chn->state);
+        break;
     }
 
     return rc;
@@ -1310,6 +1312,7 @@ static int cf_check flask_hvm_param(struct domain *d, unsigned long op)
         break;
     default:
         perm = HVM__HVMCTL;
+        break;
     }
 
     return current_has_perm(d, SECCLASS_HVM, perm);
@@ -2013,6 +2016,7 @@ const struct xsm_ops *__init flask_init(
     case FLASK_BOOTPARAM_INVALID:
     default:
         panic("Flask: Invalid value for flask= boot parameter.\n");
+        break;
     }
 
     avc_init();

-- 
2.34.1



