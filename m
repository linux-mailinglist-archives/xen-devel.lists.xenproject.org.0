Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JqZgFvCqKmrJugMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 14:32:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B580671DDF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 14:32:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rydqUrDo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1335444.1597667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXea3-0006xA-Uy; Thu, 11 Jun 2026 12:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335444.1597667; Thu, 11 Jun 2026 12:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXea3-0006uO-S7; Thu, 11 Jun 2026 12:32:19 +0000
Received: by outflank-mailman (input) for mailman id 1335444;
 Thu, 11 Jun 2026 12:32:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <michael.bommarito@gmail.com>) id 1wXea1-0006uC-Rw
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 12:32:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXea1-002Uok-1n
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:32:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a2aaacd-bab6-0a2a0a5309dd-0a2a4504c934-10
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 14:32:17 +0200
Received: from [209.85.222.52] (helo=mail-ua1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a2aaad0-1dec-0a2a45040019-d155de34e958-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 14:32:16 +0200
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-961556c15ceso2514169241.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 05:32:16 -0700 (PDT)
Received: from server0 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9160b02f758sm171220685a.36.2026.06.11.05.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 05:32:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781181135; x=1781785935; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hGPUMpfdaDQCNkNjTMnCmLU/jdnRUY0BJXqb4atgwFI=;
        b=rydqUrDoo15CSfiGUIdjxR+2fWJ/4cuq/oP52v6Upu9/6wRrdpZUaZQjehS6gyPd8i
         7buV73GpBPdXsrGgGZ/43WGiktQkQbcFNpIgAqmPFEm6G04DUCtz2tfmnmndP7X1cV0E
         wLPYQ+7DV/3AJ3UxOsO2VSAGbgzbcidAJ1UjVAgPQ6J6nQVdoRunOfKOaWx5vPCR0IzX
         9Fvad/dM6tPUrk8Q0g85lPwxKxsvnb4hB4itHLZZPVEwdRX8yKw8qMYtYpvBYhQ2UbnC
         FzsZFLPeC/CNTPl1dDs3h+T6xBGJqOL/VXvBw/JWbmh4o7nc+yBoCgGRHODrboNaQtnb
         NClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781181135; x=1781785935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGPUMpfdaDQCNkNjTMnCmLU/jdnRUY0BJXqb4atgwFI=;
        b=NzAgOZtOj3NAsvxkkoyQsUmmNO385oC4G8QRBA0AJOP6E/h6u5jxJOSZHj4XpPiZ2Y
         c5VoEtw8+o+XVQnPD+HfjB2BFc5TxkizltDufsPekMw9KV7ivwi147x+maTMEp58D3q5
         XoTho14tw+y8fNQcea7zTvNKcxV+LbxFaxNDgGC/xnY7eJkpy0yp03XxxZuis+n8z4vx
         z3vmg2EJqQhV2af0rKgCFnkfCmlC1oSra1sFXdbgk6ywKBlZo8xTRCNrpgPGE6l/Ij32
         tSosQv8pomL+u9jn6qTp0Qt/JwqjS8WCP+WlY2refutcV+URq3Y20hp681YumXbtOgNG
         HG4w==
X-Gm-Message-State: AOJu0YzDFIxmzN2TB+lc7A1PKm4pxBKVlx7Ytiysw/xqKOfj6ago1DY8
	ghkcelUxeoZTIKsnBZ0RHlpeK5zhORfBWikjqCQLXYjvOYvbh+WvLZF/
X-Gm-Gg: Acq92OG3jdQIYpFuwUFnWD2QvuqIq7bvzfUZh0Jr5j1qIzkwJWkbNl98QxBhFtp8HVP
	Xp7XkMHtK4aG8APBzd8BvWhG0UQEwNY9eS8Kn+kYmL3d0StaeXWcOyzyrMQqws3ycBmkQFH7YDL
	XYaGCvf923PfwPQY3V+GCk1o5/3HS9/CRVcyZa9KX+k/O++A2CUYkE5oTEBrDsKZda7TgRu/cvS
	XbFLxqsa28zCqFBGNGsSnYJI1Kx3PwajmyADhiqHcGp7VMkIkSOW6IdKafZjjqDk9+x5pddm1Bi
	sdZKnWAa3LZVWeAn/ug44jv1abFhUpLBblitOL/jV+PNRqYSffjEM93b7o7RKnePFCQ3G0Os5pt
	0Is23I/KTIP4b6Adp7x+b4+6f+t9vojRB+ZoknV9aUnYGuUEYjng4VsH790V3nc/TFMQ1fXkmwR
	Scr+2ldhBNTsPZDOLwBBzJhA14fEeRCjZNR/dfeXvynQS4F2pXsxwjIi742f6jp+709o+xvoU7g
	LLlOmKaunCbOLnpYS+G85RmW0kIGTlQ9hsD1DjtQg==
X-Received: by 2002:a05:6102:442c:b0:6c2:e290:cc75 with SMTP id ada2fe7eead31-71d5989b9demr795299137.4.1781181135386;
        Thu, 11 Jun 2026 05:32:15 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] xen/scsiback: fix command-tag handling on pre-completion error paths
Date: Thu, 11 Jun 2026 08:30:44 -0400
Message-ID: <20260611123046.2323342-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1781181137-289723FF-F64FD054/0/0
X-purgate-type: clean
X-purgate-size: 1553
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-scsi@vger.kernel.org,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 4B580671DDF

scsiback_get_pend_req() hands a pvSCSI frontend request a session tag and
a zeroed se_cmd.  Two error paths that run before the command completes
through the target core mishandle that command and leak (or, in one case,
underflow) the tag.

Impact: a pvSCSI guest can exhaust a LUN's per-session command tag pool,
stopping the LUN, via crafted ring requests; for the first case the
refcount underflow also panics the host under panic_on_warn.

Patch 1 fixes scsiback_do_cmd_fn(): on a failed grant map and on an
unknown request type the never-initialised command (cmd_kref == 0) is
freed with transport_generic_free_cmd(), which underflows the zero
refcount and leaks the tag.

Patch 2 fixes scsiback_device_action(): when target_submit_tmr() fails the
err: path frees nothing.  transport_generic_free_cmd() cannot be used there
either, since the command is initialised by then and se_tmr_req has already
been freed on one error sub-path.

Both paths go through one helper that returns just the tag.

Patch 1's underflow was reproduced on a Xen dom0 (guest to host, with a
panic_on_warn host panic); with the series applied the same request is
handled with no underflow.

Michael Bommarito (2):
  xen/scsiback: free unsubmitted command instead of double-putting it
  xen/scsiback: free the command tag on the TMR submit-failure path

 drivers/xen/xen-scsiback.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)


base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.53.0


