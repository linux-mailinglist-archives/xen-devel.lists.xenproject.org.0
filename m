Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECMcMysVxGmfwAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 18:02:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA69329879
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 18:02:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262813.1555181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5RcV-0000pm-49; Wed, 25 Mar 2026 17:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262813.1555181; Wed, 25 Mar 2026 17:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5RcU-0000oK-Ue; Wed, 25 Mar 2026 17:02:14 +0000
Received: by outflank-mailman (input) for mailman id 1262813;
 Wed, 25 Mar 2026 17:02:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1w5RcT-0000o8-O4
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 17:02:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5RcT-005jek-0l
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 18:02:13 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c41509-bab6-0a2a0a5309dd-0a2a45038590-26
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 18:02:12 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c41514-1947-0a2a45030019-d155802ee4b5-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 18:02:12 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-487012ce896so524955e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 10:02:12 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487117077cbsm138217235e9.6.2026.03.25.10.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 10:02:10 -0700 (PDT)
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
        d=citrix.com; s=google; t=1774458132; x=1775062932; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGQRrkza3v1ao6NU9ioINrAMRJgBHyTENcqPj/bFcHQ=;
        b=vx5RliqRoieb5FYjyg4NhO1dwXnVhYXF+ZpJGfo23qH2N+oZKY2PqmMeem1IH39KOi
         SxHAXmJWmhDRlAtWU5ndyikh3p1UMoF75ZMJ3RpGMltc1SLQvQa+3nEhZ3c+3q6MxqNN
         WCtRobjiCxNPF7DA2ixyif2sszq6NoyTByd8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774458132; x=1775062932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGQRrkza3v1ao6NU9ioINrAMRJgBHyTENcqPj/bFcHQ=;
        b=jgqoYnmBcxHYwjrAco2efHZbBRT2VmzXuPjWJX8+xbQL81B9/0+SHEgYXgNenxT48/
         YqSwr7CEAj8/SzPKfLtSvk05gkAJRiour5yarkA9oc9tZjTa3oZ2xeycrNAhGCHBL3Ks
         Zn/+2de/R0Chwm9Ib9HSq/LxDJxxgfkdn10NIZZiLJHdhxsDaumEhBUu1tRcICnDmUqX
         ijUAWyf+Naz21S5sjT+ZTmR9m3szbfne4CE0rwvVtzLH6K63i4TxcSMInQCVkpRSgZOS
         7AxL/RdUQAwoTHPZ6s+0UaG3zzcMzjbpRukDPswAI6tMrTG/BZNkq+kgJizvleOqzEpA
         +xrw==
X-Gm-Message-State: AOJu0Yw96TKm4tnT1X7LzSbt81pNS+D1RgN6RXhEGcKEwqmsioov21HU
	11nJoIz+ZP8WLZEpdUD1jvSVzScKjXnQRVN+AOmWbceO0Y/LU/W5FJJssG6SP0kVNFxfKqw5kge
	KZwq8
X-Gm-Gg: ATEYQzzcl4+Mer42Q2miDmQKbodgGMZssOhfBtR2TsrHRb2Xy6F9IajytttQer4rYqT
	m5Po4xYhylH5CXZD8+fVGyhCn8a6IRrLg8a1G/LqcqdiGHL+nEF9FJUvmMwpBdfnzz4pgbg1jAU
	wZ3oU/Cn0ImI75Qp96mNpdNkjRyCAwE7JI8CylVUf1sDYzTFmGdSWx/BYjFbE9hJlphQ6kY48R4
	EdwQu0qYblAM/3XqfPpke+QhUvMj+OxdC7j5F+gBB00AoGgGRaVjMFCNOQybTPIataZURqus+m0
	J5GlhYB8LkabZ5kUw9ky5JRFQSN4DSC81y19ETzmoGIeVdQ5zxA1JopBaWko9LByyhZqhlyX84w
	JH5QWH+6E1LUB7DqB4U5eBbdadrNqDmsGksZ0ySJpQJrVRFpdKAZkhNT4M7BJP/94+uZwG+BtEB
	FtEwDzBMsYAVz8cmQ+DKksbwHlKZzV32bsShDtjJF+xm+NEpGQhGFh7Wnfyqa7R3f1tlM7uXZP5
	8Hq
X-Received: by 2002:a05:600c:5296:b0:485:364e:934e with SMTP id 5b1f17b1804b1-4871605cec5mr67256235e9.21.1774458131150;
        Wed, 25 Mar 2026 10:02:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] x86/fred: Fix SYSCALL handling
Date: Wed, 25 Mar 2026 17:02:06 +0000
Message-Id: <20260325170208.1115832-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1774458132-EB08672C-D0771D19/0/0
X-purgate-type: clean
X-purgate-size: 427
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 1CA69329879
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Andrew Cooper (2):
  x86/fred: Fix FRED name in comments
  x86/pv: Provide better SYSCALL backwards compatibility in FRED mode

 xen/arch/x86/include/asm/x86-defns.h        |  2 +-
 xen/arch/x86/traps.c                        |  2 ++
 xen/arch/x86/x86_64/entry-fred.S            | 12 +++++++++++-
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 4 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.39.5


