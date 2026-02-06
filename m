Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMU+OffohWnCHwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 14:13:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D120FFDEEB
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 14:13:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223200.1530792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voLe3-0000gQ-Ax; Fri, 06 Feb 2026 13:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223200.1530792; Fri, 06 Feb 2026 13:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voLe3-0000e0-7S; Fri, 06 Feb 2026 13:13:11 +0000
Received: by outflank-mailman (input) for mailman id 1223200;
 Fri, 06 Feb 2026 13:13:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R5re=AK=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1voLe2-0000do-47
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 13:13:10 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94e30115-035d-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 14:13:09 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so6887805e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 05:13:09 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296c0f2esm5726244f8f.19.2026.02.06.05.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 05:13:07 -0800 (PST)
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
X-Inumbo-ID: 94e30115-035d-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1770383588; x=1770988388; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFR8lza34CFQ/+zGTVuQRm28nikRCMImKoJ3e0Tnkdc=;
        b=fzAUKOwXJoHSedRfW447g2yfWJPc/BDSORLddqKKcoMsx4pKNO+CJtFpoHQEY3ARda
         mA7v+CWaw/sxQ2yV9Ta+9Rlac4MYFDXffbhEttX3NTr4jq86YTUS3jC9FpbHjxp3pXMj
         FMk81+I8cbVtOvRCtm3njcbPZhnhAPkRxm0NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770383588; x=1770988388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFR8lza34CFQ/+zGTVuQRm28nikRCMImKoJ3e0Tnkdc=;
        b=BZ8ejp/4twd+HfhFQ89SuvE5W8hdGVBmqy1T04wN6qvPEtexo6Un0SUu1TlkgUIEYy
         aqBsPlEdi9YSH7egQn+SutdLtl0oI+ebAX+53Ghbpz/mYMsJ+WChmekTU6sW5gadICuc
         B5O7FJYT1WIAnk4F1g0wMyZIbQoDhpXZfAwSyFHWa5IazANpqs3CJgU/iqij7Lribrcg
         feCrb32n//ZM2jvGy1YptMo1oXa+UCJtkAzwhmM/GsD4TrQNiHs+z8McyqIq8gK2/KyP
         Bc7Jx8T9Ymus28EXBj0HLysuQaxsDDQhRn6G82WZc4sREGtTotCR37AbWydYw1+GcKKD
         RZ8A==
X-Gm-Message-State: AOJu0YwdB53VkvyiiEkiTbQFoPsTRzyc+1apwkWw5Oj60MSS6DzYdyqi
	GMUBmpEFV6JgsN792lrq+bTVcDKE+bClQiheahySxRcEeHHCws5t1WHEmhEBsPReqyPAk4lQcX7
	WmN2s
X-Gm-Gg: AZuq6aJdkEVLospl7okdaURjwCMf5ThuCB0F7gSOzefJ/3ekllZ7q9dSc1bw4EK2RmR
	1f33XFOEmPtCsWZF22SI46Bky7qoEiQE3pTaRx/6Pczlbp/lvofLE49csksPaX1Q1k6BDS95yFr
	jLsxSSh097eWj97az3Kr1/g0p7nrh1XjE3K9ZZgGYXUDANghALiyt3s/ixylCMaEeNfWm3S5w/G
	VM9NYTqAvWR2ck7hLRfBPi7lTBXBI9maMMIIUFaBsbrVWJZLHmc/ADbYQziG1JlLCLC0DAutkD9
	BlEnrmwkx0YKI7ZeObI2tsjykjHXbevBwysNrEntuPTyI6LHlL8pQuXn98/Mib+RE4DEi8mvgLs
	Ckrkg+wCCEPgfG+BfSIBhz2dAthIVyjfJm+vbuQ/lZCE5cFU2+BRlFZQVFFECcm8P7MsKEiazVA
	5b7ZAnlENfk3e/uoXItylhsVHGjp4IKPruVggEBPo+noAsSlqmwYTbis4FqH5dBiw6rBzUPw==
X-Received: by 2002:a05:600c:19c6:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-4832017f99emr37415515e9.0.1770383587554;
        Fri, 06 Feb 2026 05:13:07 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] x86/memtype: Deduplicate
Date: Fri,  6 Feb 2026 13:13:03 +0000
Message-Id: <20260206131305.2675905-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D120FFDEEB
X-Rspamd-Action: no action

Andrew Cooper (2):
  x86: Sort headers
  x86/memtype: Deduplicate rendring of X86_MT_*

 xen/arch/x86/cpu/mtrr/generic.c  | 31 ++++++++--------------
 xen/arch/x86/cpu/mtrr/main.c     | 26 +++++--------------
 xen/arch/x86/include/asm/traps.h |  1 +
 xen/arch/x86/mm/p2m-ept.c        | 44 +++++++++++---------------------
 xen/arch/x86/traps.c             | 16 ++++++++++++
 5 files changed, 48 insertions(+), 70 deletions(-)


base-commit: 381b4ff16f7ff83a2dc44f16b8dd0208f3255ec7
-- 
2.39.5


