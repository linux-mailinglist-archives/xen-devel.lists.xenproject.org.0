Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPBICeJMFGqnMQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 15:21:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDD95CB074
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 15:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319264.1586966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRVEr-0000dw-UP; Mon, 25 May 2026 13:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319264.1586966; Mon, 25 May 2026 13:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRVEr-0000bM-Qr; Mon, 25 May 2026 13:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1319264;
 Mon, 25 May 2026 13:21:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wRVEq-0000ON-IX
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 13:21:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRVEp-00DYzL-Uo
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 15:20:59 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a144ca0-bab6-0a2a0a5309dd-0a2a4504bc44-26
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 15:20:59 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a144cbb-1dec-0a2a45040019-d1558036b511-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 15:20:59 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4906869f0cbso6852675e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 06:20:59 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904526ca21sm247101985e9.3.2026.05.25.06.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 06:20:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779715259; x=1780320059; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y01U/cIdeBHcv5iWEI8HdRJZlY3tdB5kvE1STP1YdwU=;
        b=lXidjKzQ9FDcmeQfJHsotFVw6fopOjayFqcLzGrZVxk90XRsQBUrwuInxdCm00ITmC
         h6yvCfIR74XV0uE+Zcw8+OaR+A4My2SQQaHL+8P2HQzJCMTTckpZ/OCUTSZ55dexowu6
         OKVsXmLerkgjLvIpG2AEd9F2hVg++fc9FBDOpKKXtv6OWjH2R9hIZggI2hffWtOZxRDD
         lH9GMcZ9cNMUQLM9kgWTlKzrAUN6fqDD+5TFcUsh05Kj2MZEm9KtgcEqj225EjaovPq4
         vj+I+ve8K8o/oqTrwEkCdlRgGdI/qwo+ooDQBl1MsxnrmpyS8n/lykTTkoH0xn85ih55
         XYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715259; x=1780320059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y01U/cIdeBHcv5iWEI8HdRJZlY3tdB5kvE1STP1YdwU=;
        b=QFMbJTzJCXzh9LDcxcZo1fSjqq/3I+O2CCtIqKFw83cKeOBdqiNMFmPujI78ZprE2g
         tfzcnScsZDm0r/TAAUz2J9HbLJeV6v6t6A5E2oXIxqtXYvJG/2BlxMxQurzigXcqKD9U
         n1g+Rj1diLlZ/3fKRxiDtmxkWFau4qAM0/apACQ4jWgxwYH+xVRNrJNfYDnyjCHA2Y6F
         Kw/+QegPnd71Bd6REKqvHnRDEJ3Ryx6Wl5t9cAGqDBgLLziQaxWRRHWbxHxC+btFyXyN
         MRhW3uOwYYWQWwHnDJ8vdbf3pRDuxIMEoAMPzT/0Ak40sNko8xbLo20FHIMZCwccpatW
         qvkw==
X-Gm-Message-State: AOJu0Yz1kwA8UVtt0xh995QW363H4952h7cAXQ9rTecjsgcusLtHNWe1
	OJ8zti6fioGz0j73vJTTCXJxqMwmThZeh44vsvXO1HGCVLpklkXao7vECfTiv45a
X-Gm-Gg: Acq92OFArsnl9RVpN7oMIG6yEPia1OWFchmW3ezrYPctbVsogcTnPAxXpJL+PEeibt8
	ac7giFR/giZAnM0qTj/JWFHel0yYe26oFMUntSASYxjwq6qHfi2Z31Z5EbfWHCDohKyPfHvwJ6s
	uEM4/kbjfJ+hb04RF5o/YRtyhIjBlJUBGu03YcUcVzi9Swqbm02HJcVb+CxjVDYfX+yCEQ1GM7V
	mc5MHB6HdpjTQK+FoxWvjs7TBIMznOUtnU9MbCqQPNOCikfM711f4WCJjaSf/3H1FJxlxPEtb2W
	ji89dcWYDKOAcZtcontrq0XYZGGHWiQzchRulEJD/WAMEfWbWcBF4BZmbocg880FVkgcRu0iAdu
	eckYr6m6bc93Si+eMHL+9+Em6xorgTzUwE7udvPS/7QGhsICTSSCebG3y258gMRaGjSk4TTM0Ds
	+kRAn1BrDsw87lIGB3qARXBVyT4/yYS7jtN4214POZOY5djzdpadm/PrETsbuURlF+3A==
X-Received: by 2002:a05:600c:4510:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490428e03b8mr229165155e9.28.1779715259120;
        Mon, 25 May 2026 06:20:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of d->shared_info
Date: Mon, 25 May 2026 15:20:43 +0200
Message-ID: <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1779712171.git.oleksii.kurochko@gmail.com>
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1779715259-40B733FF-A7992848/10/73395122804
X-purgate-type: spam
X-purgate-size: 3702
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.962];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CFDD95CB074
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It is legal to have d->shared_info equal to NULL for architectures which
support only the FIFO ABI for event channel management.

Having d->shared_info == NULL leads to a UBSAN issue on such architectures:
  UBSAN: Undefined behaviour in common/domain.c:325:10
         member access within null pointer of type 'struct shared_info_t'

vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
and falls back to dummy_vcpu_info for vcpus beyond that limit.
Extend the existing fallback condition to also cover the case where no
shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
instead. This is the correct behaviour: dummy_vcpu_info already serves
as the safe stand-in for vcpus that have no usable shared_info slot.

Additionally, if an architecture supports only the FIFO ABI, setup_ports()
should be updated to avoid a NULL pointer dereference of d->shared_info,
since in that case there will be no pending events in
shared_info->evtchn_pending and the pending flag of the FIFO event channel
does not need to be set to true.
update_domain_wallclock_time() accesses d->shared_info via shared_info()
macro. On architectures that do not allocate a shared_info page (currently
RISC-V, which runs guests in dom0less mode without the PV ABI), this causes
a NULL dereference. The early return is safe: if there is no shared_info
page, there is nothing to update. For all existing architectures (x86, ARM)
that do allocate it, the guard is never taken and behavior is unchanged.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Update commit message + subject.
 - Drop Fixes tag.
 - Handle migration of pending events from 2L and FIFO ABIs when arch
   support only FIFO ABI.
 - Update the commit message.
 - Protect some other places in common code from NULL pointer deref of
   d->shared_info.
 - Drop R-by: Baptiste ... as some extra checks are added.
---
 xen/common/domain.c     | 2 +-
 xen/common/event_fifo.c | 3 ++-
 xen/common/time.c       | 3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index bb9e210c2895..e64b7df9b704 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -320,7 +320,7 @@ void vcpu_info_reset(struct vcpu *v)
     struct domain *d = v->domain;
 
     v->vcpu_info_area.map =
-        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
+        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
          ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
          : &dummy_vcpu_info);
 }
diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index 37cba9bc4564..59d9bf4c7ec0 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -562,7 +562,8 @@ static void setup_ports(struct domain *d, unsigned int prev_evtchns)
 
         evtchn = evtchn_from_port(d, port);
 
-        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
+        if ( d->shared_info &&
+             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
             evtchn->pending = true;
 
         evtchn_fifo_set_priority(d, evtchn, EVTCHN_FIFO_PRIORITY_DEFAULT);
diff --git a/xen/common/time.c b/xen/common/time.c
index 04a65f00b35c..1ee49a8b0d13 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -94,6 +94,9 @@ void update_domain_wallclock_time(struct domain *d)
     uint32_t *wc_version;
     uint64_t sec;
 
+    if ( !d->shared_info )
+        return;
+
     spin_lock(&wc_lock);
 
     wc_version = &shared_info(d, wc_version);
-- 
2.54.0


