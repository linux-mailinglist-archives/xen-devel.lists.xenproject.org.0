Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAjUGFKDxWlc+wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 20:04:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBA333AAAA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 20:04:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264706.1556103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5q0W-0003Dl-8R; Thu, 26 Mar 2026 19:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264706.1556103; Thu, 26 Mar 2026 19:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5q0W-0003AW-5Q; Thu, 26 Mar 2026 19:04:40 +0000
Received: by outflank-mailman (input) for mailman id 1264706;
 Thu, 26 Mar 2026 19:04:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1w5q0U-0003AD-Gx
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 19:04:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5q0T-00EqAi-TJ
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 20:04:37 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c58324-5cb7-0a2a0a5109dd-0a2a450395bc-42
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:04:37 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c58345-1947-0a2a45030019-d1558035c026-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:04:37 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-486ff3a0fc1so13386215e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:04:37 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48725eb1ca0sm2176755e9.6.2026.03.26.12.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 12:04:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1774551877; x=1775156677; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6y6WWaL0iQNCXHUAe5+30mnNmp1Rpaojczrt0DLvOSc=;
        b=DQaRMuVxu8z75MiyScgyANIDWsRSpuJmCA3aeE4KtMxruP1pWyZW9gaoKh7WXbDWct
         DiszVrreCcT8gS1JkQ6Co1he8SCbYQTUnU5YdJtnroMN7nMbyCfVEFMOzrbXePaPq/S5
         sHHrQAL97WLZHshfOr/yO7Lr/yd+WQujim/YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774551877; x=1775156677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6y6WWaL0iQNCXHUAe5+30mnNmp1Rpaojczrt0DLvOSc=;
        b=dW1vI/P67iwI5ybgD23qS7Iu1la1OjzLULz7qAKxm5CsP1BnpXHzGfcRy+O2QsDMlD
         b6Gd+zKvXJVSTmrIn/vJZ6q1GRq+Eodg9RWBD1kJIxEr5lWG/fgTCaIEPhEiLWa619OU
         3gOnPAaGOnqS80Q/Kzg631FmjLrB5uv/49U5gRjLsQzfRV7a8LdOwqvwfF9QZxSbh4oO
         Tgl9VoOXMIcSd2nRejM+2H/oeVTsHlWQl5pxs8OmMjTdniLsA+ORUxFObMgw6E7q4AEN
         6bSet9jfjrS10K5ZjP4NjRGFly6hJ5Wk7BHw39ebWzZ28mYR2ljfUg2vKZRZkY4AWlSG
         7Jpg==
X-Gm-Message-State: AOJu0Yz02HaAD91mMmB6K/hTUSKn2q8BcD2qKUojgKEKuHRz2azEI7Zx
	zarCWMuogdY1j+oapf1oE5qvmR1lDKfMYZUgiSPCBdeVgZlvjyb9nJ2FTiW0xSvJEtBTcBzn8/U
	s4rkl
X-Gm-Gg: ATEYQzxrdAwiN/a++SU+GPfoxXhpr5dJUuYH4herrZu+lYNr3VSEIxT9fhQH4yXQsO2
	73LZwmHnB1JVRBV3LjtLU8nQAuqvV+GywE0CnPJ7T26x7D1Rn6HULEXUw47eK5n9etgKIL8+J5w
	aNmwFYKnr52y0RAJKoylnH4HouvJO/t2PnETxUxK1l5YaiOFR3AFRaVFh0UUptlnE7AM3Mzz8zB
	J5K7KVqtdgTNYhzCqoDHSP11w5LyqQmd8JQbszBe4iT5AgJTtNqqDeQLlLDCXAQFd8u0JwimwUD
	a27H90xbutFDk7R6t++nh4dYjSw1itkmqeMIRyAkedyXEcN3MaPc/mQQPjfgqtXYzmzTeVj3YT7
	HE3cbTf3ukLuSsMdymJyPS8PjHiva/DDLkc8FWQ8J+jzafHxY4ZV2I7u0KyI5MyQLo0tWJB2ryr
	o3nETPj6jeh8zVtW0P7mgn/d6qplUK4h9vdZOqS1LNxB3dAdM09ODXO/OQMnhIPSCXNrKJrMmi4
	Xz+
X-Received: by 2002:a05:600c:3b12:b0:485:419c:4eba with SMTP id 5b1f17b1804b1-48715fc3286mr134173975e9.1.1774551876282;
        Thu, 26 Mar 2026 12:04:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] x86/fpu: Lazy FPU removal prep
Date: Thu, 26 Mar 2026 19:04:27 +0000
Message-Id: <20260326190429.1156367-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1774551877-E949872C-0E9B8E07/0/0
X-purgate-type: clean
X-purgate-size: 399
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:ross.lagerwall@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0BBA333AAAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Two patches to go ahead of Ross's removal series to simplify things a bit.

Andrew Cooper (2):
  docs/hypfs: Adjust the hypfs layout example
  x86/fpu: Initialise FTW as well as FCW in xstate_alloc_save_area()

 docs/misc/hypfs-paths.pandoc | 37 +++++++-----------------------------
 xen/arch/x86/xstate.c        |  3 ++-
 2 files changed, 9 insertions(+), 31 deletions(-)

-- 
2.39.5


