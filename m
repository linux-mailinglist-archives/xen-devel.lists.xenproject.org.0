Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN3uKTdHFmofkQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 03:21:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C575DE363
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 03:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320276.1587631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS2xQ-0001i5-KF; Wed, 27 May 2026 01:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320276.1587631; Wed, 27 May 2026 01:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS2xQ-0001gZ-Fl; Wed, 27 May 2026 01:21:16 +0000
Received: by outflank-mailman (input) for mailman id 1320276;
 Wed, 27 May 2026 01:21:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wS2xO-0001gG-Db
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 01:21:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wS2xN-00B6JG-Bv
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 03:21:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1646ea-e002-0a2a0a5209dd-0a2a45078a68-22
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 03:21:13 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a164709-229c-0a2a45070019-d155da2de053-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 03:21:13 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-bd01481e592so1555400566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 18:21:13 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.69]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc5ece286sm550541266b.40.2026.05.26.18.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 18:21:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779844873; x=1780449673; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rZBAxVK5rUdy7lBSH0quiPGXRXut68rQ9vHGC1gb/6Y=;
        b=OQY0j1WXAaxilTEglP2AC8y1IMCMVA1GgsFnlC5bdGwNqD8zZw0m0jJBQfts0jFee2
         /SP3lf41FK0tvLuZDVx81TDcL+vly3iWagz9zuVnRvhSb6YsbEp7TJph4stPfvt953IC
         HljfZdd0gUqTVchK335BUBolFQUrAdOQuSQ1U6SEc07VwHQtiQvulDIRjhzTQWpJT4Cd
         UlMMr1ip/PIRykJGfVWv21DPX4UhUorZr8+ji+pfCSegLmIK2IN0OweIaMVz5I38dSfg
         b5BEWMCzh2KMgVOCnxZFmrju6Lz+cj+XZPf0u6m766rKhh20nRSJpbl9sbOUEDkFsSHZ
         +QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779844873; x=1780449673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZBAxVK5rUdy7lBSH0quiPGXRXut68rQ9vHGC1gb/6Y=;
        b=BBg45ofLUWENMhqi7w3xm0Mh0NC/uGIQKFEYczBGq5q6ObdonGql9u90uWpqIWHcF7
         Sarvgn+DV64goy+6cK/vG2h6nEsKpt4fvvMTD1SZIPuUEYQEXSx1C5WmhQ1rFSBYFiqg
         IqUi2m/am9FaOzD82Z/735s4oeL+jO9lHvxY+rhL6EULdclG/5XrOlnaWIOn5jCgCtB0
         a4A+3/fYnFB0SF9vZE2kxxEDoVJs/qOcNiPhbF2DGOoELAuFD8W1zHAj1GVagDSRqhvM
         NLq8tAnucWCBGRHlpHSf1FuoJ43mNv6BH1UDPjA2SSNpr1PCAm839Rd969b0B1faTBnj
         qTGw==
X-Gm-Message-State: AOJu0YzHN6HIfpJMjuHCBjPGYHnrqkxDVIUJbhhU9RLZzptUpcd2g7El
	Hb7kS8SR4+rVq3hiVXpgkPfU4vCV0t1FtQdcnZ4ehx5goIFZcJJeBVnSvvz8Kg==
X-Gm-Gg: Acq92OFaY8OGqVJrxgjdLrdszEtJ7UScsu3NYqaTQO0yf2XCWK9ZGUz1DoW3VpPcJZh
	Ov/2c+JmjEQSfCWhsn9e3Fjjur34J4tR+alzVvNmxwGV9+au+Z1iDIe/ygQPUliK7V4qbIfrO+h
	K2wcxvAwKyubwZ7Yx9v0F6CCzeJDEssxkRDDNXh1SzoY74arK3mmh2u+QMuM9upgiWjfAK1Dms8
	nTNzZR5tM+rXGa47LoHTn6o+BybS41BOkUGTRmw5YRP5nhGASRKXonHTcmBJPV9OlkIbBT3UNNf
	kRxcm7FmNoPuRONg5Z9iqEklSb+F/IhgjPNh9wuamwEvbgBBqpDMGbjTaczHBT4JEapQOmPOK8W
	0BAmTuY+a3LuCjYJgAxTayWVJDZBoi9RC9FLADdT/dT2nfr7kqBOi01HQy8pLdAaDnqeq4wrFK3
	PALOi4JhfVM2BAgHWst8wGRdTt6FkWgCFQmU0wda0D+PdGJOg=
X-Received: by 2002:a17:907:3e03:b0:bd8:6ac6:d722 with SMTP id a640c23a62f3a-bdd25cecef9mr1216612266b.24.1779844872631;
        Tue, 26 May 2026 18:21:12 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 v2 0/2] xen/arm: handle vGIC vCPU init failures
Date: Wed, 27 May 2026 04:18:49 +0300
Message-ID: <cover.1779840898.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1779844873-0A971C48-801E5C30/0/0
X-purgate-type: clean
X-purgate-size: 2343
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com,gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.957];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 11C575DE363
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

This series fixes two related GICv3 host-layout issues exposed when a
boot-time domain requests more vCPUs than the guest-visible
redistributor MMIO regions can cover.

For domains using the host memory layout, Xen exposes GICv3
redistributor MMIO regions based on the host layout. Each vCPU needs a
virtual redistributor frame covered by one of those regions. On FVP with
a 2 MiB redistributor region, only 16 128 KiB guest redistributor frames
are covered; a request for 64 vCPUs leaves vCPU16 and above without a
corresponding redistributor frame.

The vGICv3 per-vCPU init path detects this and rejects the first
uncovered vCPU, but the generic vGIC init path ignored that error. As a
result, vcpu_create() could succeed with invalid per-vCPU vGIC state, and
the guest could observe more possible CPUs than Xen can back with
emulated redistributors.

There was also an off-by-one in the host-layout redistributor region
count when all hardware regions had been consumed. That could make Xen
describe a guest-visible GICR MMIO region beyond the populated
redistributor region list. A guest access to that exposed window would
then fail to match any emulated redistributor frame.

Patch 1 fixes the vCPU creation path by propagating per-vCPU vGIC init
failures, and also fixes the related host-layout redistributor region
count so Xen does not expose an unbacked GICR window.

Patch 2 documents the resulting Arm GICv3 host-layout constraint for
boot-time domains and keeps dom0_max_vcpus documentation generic.

Changes in v2:
- use min(i + 1U, vgic_v3_hw.nr_rdist_regions) for the host-layout
  redistributor region count.
- keep the trailing blank line at the end of xen/arch/arm/vgic.c.
- move the detailed GICv3 host-layout documentation from dom0_max_vcpus
  to the Arm device-tree booting documentation.
- add Michal's Reviewed-by tag to patch 1.

Mykola Kvach (2):
  xen/arm: propagate vGIC vCPU init failures
  docs/arm: Document GICv3 vCPU limit for host-layout domains

 docs/misc/arm/device-tree/booting.txt | 9 +++++++++
 docs/misc/xen-command-line.pandoc     | 3 +++
 xen/arch/arm/vgic-v3.c                | 2 +-
 xen/arch/arm/vgic.c                   | 9 +++++++--
 4 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.43.0


