Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P951OO+qKmrFugMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 14:32:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340FE671DD7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 14:32:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cufL1e0I;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1335445.1597675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXea5-000795-4O; Thu, 11 Jun 2026 12:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335445.1597675; Thu, 11 Jun 2026 12:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXea5-000773-1m; Thu, 11 Jun 2026 12:32:21 +0000
Received: by outflank-mailman (input) for mailman id 1335445;
 Thu, 11 Jun 2026 12:32:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <michael.bommarito@gmail.com>) id 1wXea3-0006uI-0P
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 12:32:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXea2-002Uok-D9
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:32:18 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a2aaad2-bab6-0a2a0a5309dd-0a2a4503808c-0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 14:32:18 +0200
Received: from [209.85.222.170] (helo=mail-qk1-f170.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a2aaad1-672d-0a2a45030019-d155deaaa823-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 14:32:18 +0200
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-915d64fead9so104059985a.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 05:32:17 -0700 (PDT)
Received: from server0 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9160b02f758sm171220685a.36.2026.06.11.05.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 05:32:15 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781181137; x=1781785937; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLymrEZazNmQKknDX1QeqtCgPzdIbUvDepEeTIb67zo=;
        b=cufL1e0IaEr6ZzGH8Q18AIdilotUMvlN3U5swlRHZHTkXTOuMFjd1ZizV09Re5jKNp
         ki1LgeHx8SRr+9i+P3Caka7IQqwki4yeR1zwD6/7Dh3jb1CxrJf81jwW/zr737j4BwWL
         owtRGDJR32oCiucMJXwFQ5i4NuWP/PHtRht3FAIX0PVIQwFj4bo1r5NxMnHITqJ8YPoM
         mvPuieNPQEEHBW/mHuSGKjJZ8m1/h1hrMN/a6AyNgp1vDCQ6RVdMT27+lH4Kd05GyVvp
         j3oplICphnJiOv6c2a3sxZ8c/43Xf6J13pi6ly6vAqOTqvz03PAJb4Vn7JKTiHI682he
         auLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781181137; x=1781785937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mLymrEZazNmQKknDX1QeqtCgPzdIbUvDepEeTIb67zo=;
        b=NANzepFsJxgaPEZgrPGDY4XAjIE3tlqEcGt48WTa3Z9xF2JHrGYoZTYkbkydSmKkhB
         lCko/QKfFu3FyquFIkPM6b/RukpDEIqG6kj93OZezrexax3gVY7wc/7DQLZeNgUsDcpf
         /YUKK5EwUp/zdEUc6YHWZOVOzQZtf2x8LqEV4zxpaDC9xiIeVpTuRq+flUFxFYxKTmYz
         5KhImEn3gfvoa35Db9zJK1ZdRoSC8BYiVftPw/u4EI19qNBeTZw9JWC63Ms8iTOIaGEm
         ZKmg7y1ZxZ8rn6/rUpmWEQPs+c79wGU65V+ax71LrtYmSzfNNJ8nLmSlTdAW/JWp2oQv
         KxMQ==
X-Gm-Message-State: AOJu0YydcvXs3GleSiBLj3iwoRndLXNK4JBX7bf83zCcj+jEdOaeRCIx
	PGpY9xlLeOUm+5UvsIgwsYTsrnuWCln5/ankQN01i05LZvrpSQimXGcr
X-Gm-Gg: Acq92OFEzBNox4jvCyACz9szgr/Q7XXcePs39cljiYBG3XbecaXlVRr2DQs/xDTlEcB
	9dUbFzsisoETg2zUxWFDQnmFtnEBzZmJ7SOm58JCrJEDEGPM71wDj4NmSZpY+Taswt/ymkb8p9H
	oUwRlShyW6UhidxRaDDtsY6mOszyiQ685ruBOu+CO19aj/IRtpwQDv6zv6RRJ7EuoAnGqTgAHuQ
	0Uzabh/dKCfW6Uug2RV10r8WAXBi9mNZJe9hnS+7QeFzK46xPpucDM/lzQjhb7vhHFbioduDQ61
	U8Wyu65rE54IB9FiHXW0jLtOoyPc975vPJa3F2uLXfT4qKK6AsYPZ5u6K2zWXB0ZAa0Gr8b3YlY
	SSR8nu9132qWkyI2I9cqpv2b2Ojjg+nbIWhwss7/4xrYeEOICCpjtjNX+p11bxca5lpQyw50XMI
	0d3OikfF3Tb2leqBH3EHQKJI1ETzwFJVf2QZnRsTiSwoXbm+JE7acSBsWeFVDr/zM47dUhcgksu
	QtwZhYuM7Y0v01ZjOuBcxzYilnFX5c=
X-Received: by 2002:a05:620a:440c:b0:910:c1ba:91d3 with SMTP id af79cd13be357-9160a841f7fmr283346285a.45.1781181136610;
        Thu, 11 Jun 2026 05:32:16 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] xen/scsiback: free unsubmitted command instead of double-putting it
Date: Thu, 11 Jun 2026 08:30:45 -0400
Message-ID: <20260611123046.2323342-2-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260611123046.2323342-1-michael.bommarito@gmail.com>
References: <20260611123046.2323342-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1781181138-4259D938-C8929943/0/0
X-purgate-type: clean
X-purgate-size: 4396
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-scsi@vger.kernel.org,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 340FE671DD7

scsiback_get_pend_req() obtains a command tag and returns a
vscsibk_pend whose embedded se_cmd has only been memset to 0, so
its cmd_kref is 0; the se_cmd is initialised (kref_init() via
target_init_cmd()) only later, in scsiback_cmd_exec(), on the
successful VSCSIIF_ACT_SCSI_CDB path. The two error paths in
scsiback_do_cmd_fn() taken before the command is submitted -- a
failed scsiback_gnttab_data_map() and an unknown ring_req.act --
call transport_generic_free_cmd(&pending_req->se_cmd, 0), which
kref_put()s a refcount of 0. That underflows it ("refcount_t:
underflow; use-after-free") and, as the release function is not
run, leaks the command tag.

Impact: a pvSCSI guest can leak every command tag of a LUN's
session, stopping the LUN, by submitting requests with a bad
grant reference or an unknown request type; under panic_on_warn
the refcount underflow panics the host.

Add a helper that just returns the tag with target_free_tag() and
sends the error response. It frees the tag while the v2p reference
still pins the session, and snapshots the response fields
beforehand because freeing the tag can let another ring reuse the
pending_req slot.

Fixes: 2dbcdf33dbf6 ("xen-scsiback: Convert to percpu_ida tag allocation")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
Reproduced on a Xen dom0 (Linux 6.1.y) exporting a pvSCSI LUN to a guest.
A frontend that sends a single ring request with an unknown action type
drives scsiback_do_cmd_fn() into transport_generic_free_cmd() on the
never-initialised command and logs

  refcount_t: underflow; use-after-free
  WARNING: ... refcount_warn_saturate
   transport_generic_free_cmd+0x... [target_core_mod]
   scsiback_do_cmd_fn+0x... [xen_scsiback]
   scsiback_irq_fn+0x... [xen_scsiback]

from the vscsiif IRQ thread, and panics the dom0 under panic_on_warn.  The
failed grant-map path reaches the same free.  With this patch the same
request is answered with DID_ERROR and the tag is returned, with no
underflow.  These error paths are unchanged since 2dbcdf33dbf6, so mainline
is affected identically.

 drivers/xen/xen-scsiback.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/xen-scsiback.c b/drivers/xen/xen-scsiback.c
index e33f95c91b096..f324732eba7f8 100644
--- a/drivers/xen/xen-scsiback.c
+++ b/drivers/xen/xen-scsiback.c
@@ -611,6 +611,25 @@ static void scsiback_disconnect(struct vscsibk_info *info)
 	xenbus_unmap_ring_vfree(info->dev, info->ring.sring);
 }
 
+/*
+ * Send the error response for a request that did not reach the target core
+ * and return its tag.  Free the tag before the response drops the v2p
+ * reference that keeps the session alive, and snapshot what the response
+ * needs since returning the tag can let the slot be reused.
+ */
+static void scsiback_resp_and_free(struct vscsibk_pend *pending_req,
+				   int32_t result)
+{
+	struct vscsibk_info *info = pending_req->info;
+	struct v2p_entry *v2p = pending_req->v2p;
+	struct se_session *se_sess = v2p->tpg->tpg_nexus->tvn_se_sess;
+	u16 rqid = pending_req->rqid;
+
+	target_free_tag(se_sess, &pending_req->se_cmd);
+	scsiback_send_response(info, NULL, result, 0, rqid);
+	kref_put(&v2p->kref, scsiback_free_translation_entry);
+}
+
 static void scsiback_device_action(struct vscsibk_pend *pending_req,
 	enum tcm_tmreq_table act, int tag)
 {
@@ -792,9 +811,8 @@ static int scsiback_do_cmd_fn(struct vscsibk_info *info,
 		case VSCSIIF_ACT_SCSI_CDB:
 			if (scsiback_gnttab_data_map(&ring_req, pending_req)) {
 				scsiback_fast_flush_area(pending_req);
-				scsiback_do_resp_with_sense(NULL,
-						DID_ERROR << 16, 0, pending_req);
-				transport_generic_free_cmd(&pending_req->se_cmd, 0);
+				scsiback_resp_and_free(pending_req,
+						       DID_ERROR << 16);
 			} else {
 				scsiback_cmd_exec(pending_req);
 			}
@@ -808,9 +826,7 @@ static int scsiback_do_cmd_fn(struct vscsibk_info *info,
 			break;
 		default:
 			pr_err_ratelimited("invalid request\n");
-			scsiback_do_resp_with_sense(NULL, DID_ERROR << 16, 0,
-						    pending_req);
-			transport_generic_free_cmd(&pending_req->se_cmd, 0);
+			scsiback_resp_and_free(pending_req, DID_ERROR << 16);
 			break;
 		}
 
-- 
2.53.0


