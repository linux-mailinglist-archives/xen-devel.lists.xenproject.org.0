Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHaLOOFMFGpeMQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 15:21:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFFD5CB073
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 15:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319262.1586948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRVEp-0000Cr-CW; Mon, 25 May 2026 13:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319262.1586948; Mon, 25 May 2026 13:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRVEp-0000An-96; Mon, 25 May 2026 13:20:59 +0000
Received: by outflank-mailman (input) for mailman id 1319262;
 Mon, 25 May 2026 13:20:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wRVEo-0000Ag-5F
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 13:20:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRVEm-00HD0O-4H
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 15:20:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a144ca3-e002-0a2a0a5209dd-0a2a4507d8d2-18
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 15:20:55 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a144cb7-229c-0a2a45070019-d1558031c98b-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 15:20:55 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4903974854dso34799285e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 06:20:55 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904526ca21sm247101985e9.3.2026.05.25.06.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 06:20:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779715255; x=1780320055; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XMUQgueOvck0avhmAwj6liffR1ga2OajXM2qCf6dYKk=;
        b=RyDB1+ZDdKMQOqUZIaGLy3yCp5dpOtVlf4xHrAg9Z0D0mdxNjTza0oa/HMYFJewVq1
         OeloX3iZ0YUvvSu3chYds4IylYWZTnLQEcjAFzpX3t/wmEgKM6g1gP8rKtDDPIbjHQgL
         i4LmOUbpJi/8v8y9b/qW/D2b7ZETPycK6LucuM6EnGiLlNBD+TFUm7wdBwGyMwLqhCkD
         ue2zkZWw7zGLbHKYwzf6Hm/q0gePgFmJ2TX8xxQcRa9XgiiCO17Uvp8ITcUSqbeH56rj
         uSri3vy9nvMyj8Kvd+tOjE5ym7R6/2Dgipw6/iHiqNCOoQSADF9yf4Q42kdMcxEipQBJ
         A7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715255; x=1780320055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMUQgueOvck0avhmAwj6liffR1ga2OajXM2qCf6dYKk=;
        b=P5qcslFnk3FOxmWuOb3V5sq8Tgrbn4mcWh5ULtI9fPrmGV2nkIbaeEEfwsW/orOCKt
         t1AbhR9+9FyOWVDgU674LZHbOGZtTxSSeYB3KOQXWXdPiNeDgKBT5EB2tizXcukrZzW2
         Tn0MyiDdUkKxIb7WWFVM7KoKkvr/zZE76XlZBSTT8kFLIAGvpbsviVycZvwZTaqPF201
         eqDytS+E7dSuCjpGIWkkhR8HLYxSYkU+rbF3UxHvPUZ0+DzWBOGYqb13DXH1GmUHXvxP
         rtPKPYkUc8FmIT6sGg0nyapj8OtFxwJ9Ix3yc4UmtMuqXSqVu8WO+Wv7w2o89tb4QKwu
         20bA==
X-Gm-Message-State: AOJu0Yy3PUKCr3pWEjor4mRS0TO0NLhtMYrcQHVh03B6Ab1ObvhH4twP
	W4OjGL5XlCW7r5VIVaPQ71ApJ1IhApaU0TBHtkNJZHTRasrhCLiAu+l/Q5IaauPi
X-Gm-Gg: Acq92OHHVQT6T0h9epz4dEKEcjqlQCaqOndFR+q5GHMr1QqLpy9FeteIY8o4U6YIL5m
	mjqzkDPa9oUPl9nyfR6CsAlaoxG+wcmfF1zk3XIXUSwsih93mRmGhCq0LIW4/qxvKeIjua4n3rB
	TpYOaX0lwa2uShNPvQZu9jLf/aC/TMpiXal4zaYisiecRzxY+tn5py2h0IzRM0LF3qLKiE3m0J+
	Hz2e6ToSGntmwTpV615UwAdMRmToLX3/331zoGhf/+qAovZKGrX0hOHeAOKcGD1ITgdlkxiY6sq
	ea4pB5bgzZwq0a+fXIZfALR+/CThFd1RXRnTDD1ti6Cjx6oVqwHFjdoH+BxTzodwWYsqWYue543
	YP52s5QQa38I4GRakyc3I5BMED3Nj83GNTIMe4dd3VaeKWZnMBk3kzIb+xVzlspwH2q7G7SfYnU
	KWvSW9tru1mqfSAJLxDZHksi+/xTUK30PfdUryxl6iUEzuyBd14sU24CHYa8K4kgM4Yg==
X-Received: by 2002:a05:600c:3593:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-4904225ae0emr271143925e9.0.1779715255244;
        Mon, 25 May 2026 06:20:55 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 0/3] UBSAN fixes
Date: Mon, 25 May 2026 15:20:41 +0200
Message-ID: <cover.1779712171.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1779715255-21969C48-F752855C/10/73395122804
X-purgate-type: spam
X-purgate-size: 809
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,arm.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8EFFD5CB073
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During Baptiste Le Duc's work on adding CI stuff for RISC-V several UBSAN
issues were found.

This patch series resolves the found issues.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2551001500

---
Changes in v2:
 - Address comments from ML.
---

Oleksii Kurochko (3):
  xen/riscv: fix switch_stack_and_jump() for range beyond 1M
  xen/domain: fix UBSAN null pointer dereference of d->shared_info
  libfdt: fix UBSAN null pointer in fdt_property()

 xen/arch/riscv/include/asm/current.h | 10 +++++-----
 xen/common/domain.c                  |  2 +-
 xen/common/event_fifo.c              |  3 ++-
 xen/common/libfdt/fdt_sw.c           |  3 ++-
 xen/common/time.c                    |  3 +++
 5 files changed, 13 insertions(+), 8 deletions(-)

-- 
2.54.0


