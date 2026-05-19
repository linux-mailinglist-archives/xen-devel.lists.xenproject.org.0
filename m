Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMYaMO4hDGrjWwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 10:40:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689AD57A4EC
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 10:40:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312576.1582653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFzK-0001oR-Sp; Tue, 19 May 2026 08:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312576.1582653; Tue, 19 May 2026 08:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFzK-0001la-Pz; Tue, 19 May 2026 08:39:42 +0000
Received: by outflank-mailman (input) for mailman id 1312576;
 Tue, 19 May 2026 08:39:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPFzI-0001lI-R8
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 08:39:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPFzI-008Zic-6v
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 10:39:40 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c21c8-2eae-0a2a0a5409dd-0a2a45039dac-8
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 10:39:40 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c21ca-672d-0a2a45030019-d155da31b5d0-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 10:39:38 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-bd8f9889a8cso192657366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 01:39:38 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4c2a0dasm689854066b.19.2026.05.19.01.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 01:39:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779179978; x=1779784778; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0TrdfNJKE3xZqRmv8gW2AE5VRPd+5p3zwBthlgsmjoE=;
        b=qjmgORKaL3AUSq9MWhWRXUsAvQ0FIbUrYREL9th9BqC0IAtWaWqkOC3Pu6pstsq5Nz
         hWlqWm+MZJLqrYO9sRHOFauBGJvuHxnyp6U4GZ7jukf5eXGe+DbZh8yDuiamwI13nOk7
         iqqW98GQ0PiHWV6HRr9thYOOrQKJN2JKuQ+FI3jmsPVgCKvStUbwYln7wxWfRGWCGv5+
         L16W2bxaxlzsEYoNmcUjpwUhu9WSsJKKhjjMCw+IYu/NTG43anQZ9G8TiB/x/ZuahpZ2
         uiDnszQs2+kVxVg0Nkg94VMWU7dxiLHvbJjPkqW1fyP2v7Cx5F/MU5pzzfw0p2OK4Oeh
         +btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179978; x=1779784778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TrdfNJKE3xZqRmv8gW2AE5VRPd+5p3zwBthlgsmjoE=;
        b=bWnj0OPehFHUnUfWUw2HnBaO/flJEuf/8yjJVLkxrncd/yX0b9aIoA5vA7rZZumJpG
         RuhV9dNaWyetFIm4SXyi7oIe1ay5GXdijKd0aOHx6VIUAXeSyEBh56820AllJ2kK596q
         kad1KuEcz8LFmP1TJZPHrE95OWsm5dG+pvR/HKSB9gzmOVh7/nw6FsQaRWv+iHMmMwnE
         4Igz1Ixuv99STadcjdCYkqh74Iaic/neMuPP8Pwi3MYPlHIeXmMSB8W0K8q6RSOsxrEh
         EgcEjsHlvnkQeTBIoUq+Tdfb8ro2IPIe12JWCaP/CRLNTNg9hU48RTsvKOs1cZWkRSP5
         sBqQ==
X-Gm-Message-State: AOJu0YyBEAaKS9SRy3Cl0xtAxF8ONMQH7fBjtxMXVS1AUNCcwAinNESn
	/2FKMaRn2DBENVhDPvks65P0/ODGdfyvntHbAzP6RkyiOFhh95vhgzHX9A9xaw==
X-Gm-Gg: Acq92OFFl6cXQ/HzcQyz/KgNFKzcGySCpn+4GI+JLB8QGHCk01vMCEzrhijq32Esw1Y
	t+U+caa6+OcEU87tbzhDKgp3DDW3P5Mjt2w/4BYksKqlUKE1PwodUZhNRhGPKnWugbmibFzhsFW
	xst0OqgofZlV4Z+IConAfDoJHgLrlA2iP4W6CLr+1Jej5MlvrXIc57pok6lXdnGFcrnBtLAIPW6
	dYrQsrzey2AUOPkJrIgCe46ySjT1fMOcHwOGRlHl48r0nFQScNIavULoFBzCR5GdFBhsJ+bjwXh
	7pHb3PiWsUE2h7JfbvEoTJq20fyns/seYUeAguwyvzpfOhhZMFM5rGLvhz6rEzpw29fxyGqbVx5
	mgUvs5fQ4Gp0vHK19rXbvmHCHNZozXtlJ4cnMyYuMljTycWX301eKEskyb4DT/eNFPawZ2okkKl
	b/tNEdoSGcdslzJianLMQ04IemyMA+DYxlO4k4h1vSm+bgCfkrZblzbiWHPohxdf94UA==
X-Received: by 2002:a17:906:6185:b0:bd0:6dbe:22b1 with SMTP id a640c23a62f3a-bd5177ec5dfmr1026177166b.12.1779179978104;
        Tue, 19 May 2026 01:39:38 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
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
Subject: [PATCH v1 0/3] UBSAN fixes
Date: Tue, 19 May 2026 10:39:25 +0200
Message-ID: <cover.1779179301.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779179978-3B56F938-ACE7CE3D/10/73395122804
X-purgate-type: spam
X-purgate-size: 641
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org,arm.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 689AD57A4EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During Baptiste Le Duc's work on adding CI stuff for RISC-V several UBSAN
issues were found.

This patch series resolves the found issues.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2536470604

Oleksii Kurochko (3):
  xen/riscv: fix switch_stack_and_jump()
  xen/domain: fix UBSAN null pointer dereference in vcpu_info_reset()
  xen/libfdt: fix UBSAN null pointer in fdt_property()

 xen/arch/riscv/include/asm/current.h | 10 +++++-----
 xen/common/domain.c                  |  2 +-
 xen/common/libfdt/fdt_sw.c           |  3 ++-
 3 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.54.0


