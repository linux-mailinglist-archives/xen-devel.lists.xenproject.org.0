Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sd/DNW3gImrOegEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 16:42:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AC9648EFC
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 16:42:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=lEbEqnhH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1329553.1593607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVka-0000OS-BA; Fri, 05 Jun 2026 14:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329553.1593607; Fri, 05 Jun 2026 14:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVka-0000LN-88; Fri, 05 Jun 2026 14:42:20 +0000
Received: by outflank-mailman (input) for mailman id 1329553;
 Fri, 05 Jun 2026 14:42:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wVVkZ-0000LD-15
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 14:42:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVVkY-007rPg-11
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 16:42:18 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e03a-5cb7-0a2a0a5109dd-0a2a4505b646-28
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:17 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e049-aaa8-0a2a45050019-d155dd2eede9-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:17 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45eeba68948so1318226f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 07:42:17 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm27983183f8f.20.2026.06.05.07.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 07:42:15 -0700 (PDT)
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
        d=citrix.com; s=google; t=1780670537; x=1781275337; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h5vYZ/rkpgKfFpxFCKmaZZBwe24StYh9tUaWXPqFAVM=;
        b=lEbEqnhHhFFb+jWS1E09Q8U3bvIYkbGM0JGdIjNrkv7vl0fWiAztI/dLhKyv22CkT4
         J0UbZEArfyl+rAgXcskgtWayzaco2E2Knxqy5wz01AdzWruNSM6RnwKy8uxvWEmI4oYP
         uVQ2hTiWnNeUTF9pSXRi9v3SNY8zVAV2uea4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670537; x=1781275337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5vYZ/rkpgKfFpxFCKmaZZBwe24StYh9tUaWXPqFAVM=;
        b=FP9ev5zjNL8DjuXD8OeJKWNd4nv1zEYypMwtkK39QJ/1ucunkPo2ctweqCCX5r6cbN
         UnFTAK/g2AZzf6NR+4O3CY35ZCcbSH5PGPepBtDYf08Hs3YN+4vCbZC4Iqj7VUcbghfb
         BfNOXoBguALGXWglu294QS3F/IXmcWVlN0XYckvTJbsiDWcOPO478B2oAdoN08czGRlq
         Axtq65/lsibkBeFNaDbp/KJ3B4J8nOCeox8PnyLYfrJXBbB7DJXzpKkdZ9xETgieknm3
         E44mGi48eq0MJ3KCxVr5A1A74WSYkCW4nDWNWfDn7Ln/aJZjnrJLGMLg25VhXLEbEkOv
         oXhg==
X-Gm-Message-State: AOJu0YzDOpdfx2n71oMc0+9YxFyXDzZG0zBjWxWhDgQW3yUT1HESIOti
	lU2ZEl6ZRnunuct8mnqcZ+kwCSGCV8K/+mj3/iQXl+JlcAdFwbUHtc0pUSDkCvDz2jDl/ZCxGdn
	JuN5k
X-Gm-Gg: Acq92OHLqEtDBR7a2jEjRUIpjaHEU2qY7SIk4f6Hvmvql2RbetxEgL7AXBf0Oe/QkpT
	yt4ChQJzG7Yfr4tyZH3qw/hf4CE0WR9XlgYAG1yk5LKMQcNaVjoBg9Gif9kzpNcHTceXFnVT/QW
	qo2cyrgd9kcTSHVk+dnP0qCjZu1i+Wx1R1oOVaCOL6K8y0na9Q/PhbMhJBrJ3XIVeio+x/gLbXu
	vTdGf7EnXOuQVjx9V28msfSmFp/MmITj65IoRwz8bKcB0eMjVtSOfr6jMJgpvMs9tIqwVsnvz2q
	Ft5sqHqHcdcc3mjNz+1KKxohSanSpgN3HZ+UDC3bVE6SPpwPS1L8EuOm8Hrn66rPXm1t8RCMN+u
	Ac1yrxnHTVOz3XajCxpVdzlcZtS40nTkY+PnZK5f+EfNr5J5z/YI1IzPWYJhDBpq4+PmM7Dk4qQ
	sb3drde6ZaGGXM9qDZtCijLQ9CxuX+opw+J52TaURmEjZm5lgwYS08D6A9PA1Q2k0nsaeYilKEh
	W2OUgBlYJznAjY=
X-Received: by 2002:a05:6000:468e:b0:460:2477:2284 with SMTP id ffacd0b85a97d-46030630b07mr4204560f8f.39.1780670536811;
        Fri, 05 Jun 2026 07:42:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 0/6] CI: Update distros for build tests
Date: Fri,  5 Jun 2026 15:42:07 +0100
Message-Id: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780670537-D9772443-3F6BB843/0/0
X-purgate-type: clean
X-purgate-size: 1518
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,amd.com,cardoe.com,suse.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1AC9648EFC

Refresh which distros we do build testing with

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2579549654

Andrew Cooper (6):
  CI: Drop test-artefacts/Makefile
  CI: Swap ocaml-nox for ocaml in newer Debian/Ubuntu
  CI: Drop Ubuntu 16.04
  CI: Add Ubuntu 26.04
  CI: Update Fedora to 43
  CI: Update Opensuse 15.6 to 16.0

 automation/build/debian/12-arm64v8.dockerfile |  2 +-
 automation/build/debian/12-x86_32.dockerfile  |  2 +-
 automation/build/debian/12-x86_64.dockerfile  |  2 +-
 automation/build/debian/13-arm64v8.dockerfile |  2 +-
 automation/build/debian/13-x86_32.dockerfile  |  2 +-
 automation/build/debian/13-x86_64.dockerfile  |  2 +-
 ...x86_64.dockerfile => 43-x86_64.dockerfile} |  4 +-
 ...dockerfile => leap-16.0-x86_64.dockerfile} | 16 ++----
 .../build/ubuntu/22.04-x86_64.dockerfile      |  2 +-
 .../build/ubuntu/24.04-x86_64.dockerfile      |  2 +-
 ..._64.dockerfile => 26.04-x86_64.dockerfile} | 15 ++++-
 automation/gitlab-ci/build.yaml               | 57 ++++++++++---------
 automation/tests-artifacts/Makefile           | 19 -------
 13 files changed, 59 insertions(+), 68 deletions(-)
 rename automation/build/fedora/{41-x86_64.dockerfile => 43-x86_64.dockerfile} (95%)
 rename automation/build/opensuse/{leap-15.6-x86_64.dockerfile => leap-16.0-x86_64.dockerfile} (84%)
 rename automation/build/ubuntu/{16.04-x86_64.dockerfile => 26.04-x86_64.dockerfile} (81%)
 delete mode 100644 automation/tests-artifacts/Makefile

-- 
2.39.5


