Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n2ArORgXH2p8fQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 19:47:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B38630D12
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 19:47:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=hfFWzRBa;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1325330.1590832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUTCE-0003ws-VK; Tue, 02 Jun 2026 17:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325330.1590832; Tue, 02 Jun 2026 17:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUTCE-0003uE-QV; Tue, 02 Jun 2026 17:46:34 +0000
Received: by outflank-mailman (input) for mailman id 1325330;
 Tue, 02 Jun 2026 17:46:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wUTCD-0003sA-Lw
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 17:46:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUTCC-000Wkd-GL
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 19:46:32 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1f16e4-e002-0a2a0a5209dd-0a2a4505893a-24
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 19:46:32 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1f16f8-aaa8-0a2a45050019-d155802fd542-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 19:46:32 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49068493267so68071765e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 10:46:32 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e19b0bsm88089975e9.6.2026.06.02.10.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 10:46:31 -0700 (PDT)
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
        d=citrix.com; s=google; t=1780422392; x=1781027192; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1vQU8SMDliXCdanFS8zXxLohLWQBLw69EX+A7rkuK70=;
        b=hfFWzRBa2FA+343c0hE9hi0VRCm+p9SpEr4c00svy/6m3Mz7XuTXV77+C4Ifpzbc3i
         vdWk1fUJ3v8JNAF8vr7zIE7eaT6pA++wuVDhqfwPOrUKjlIPvsPs8zmp5Cbt0OZogx3X
         zKAVAl1cMlu3ksjC8XL09TbQ7oiPPVG2NAWac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780422392; x=1781027192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vQU8SMDliXCdanFS8zXxLohLWQBLw69EX+A7rkuK70=;
        b=rI8leDvV9Kh4a47XAJGXbJQiAI8mJorAMtfy/h6myYJwbt4YBU8nEsTy94h4ib37zX
         m5teMa/ehPLWkfFufFn5PtMW2PadLj3S/NIB83Gp41whv9Tj17r/unlNGeHRdmMgKVWE
         lMG8vssEoJCbBp2aVGOEqWwdcHbbVYc+MMhlo3M1HH2X4zkdW18Eq8QTXMlgKsoU5bhN
         dO5Vi0bbVvsqpOF09oIItbU9AhqdTW10d/2E0nN71GxG+xFr1YbugHRcRbHGX5RAUNes
         pFlZ9RUn+n9Bt8NhEdXRsfFHZPsCLBTcLfHInBzHqB/wfjoYR69qVz9xybXHx9bnx8d9
         Vm6w==
X-Gm-Message-State: AOJu0YwEIMxlaPZQOZVSfMs2dd4zRA/rDUca0bpWV7ezvk7EGjxrDgsc
	lmI33axwGZq/dacgbdtEOcOW3UtJY5CREn7zI1h9Iew2jODyT3E57xLh1RoCruBIOWsNzQaGfs2
	OYn6z
X-Gm-Gg: Acq92OGpq7bY+JHYHsP7R2ayPImoDTnmR+Y6anzPmVBnwcjJS7ERC4OOZt0JhvKuKmW
	hObWQ7TYExZTPrefxRxfYQRUZBChoAxQOcp/UAqDzXSMzmRU5NduQrxHDdgh/951awRnaNU/t0D
	Ugp9nGLgyTHJ0s97soCYd+IBeZVOtkpCRckwal8KDNYC76wU83q1/V8RWlvFzA3xitLh6AcdhXg
	Cz+331kGeCzJjt/GM/z+8gKwyEhTZUKjc/Wwf1MOuUOIF/15Qips0ha96MYZFwUv/5DbSyD0APw
	eiWQL6XMdWOPjuVwEiwJMUsigI83ISF8vuFWe/5NvPj7lznbB3EQkrdgjAae3Esa7UWqjRLlCCU
	Zt150EaHcBk7FhmLTFnlAdNlu0+8qIsNe1kcm8MQRcxlSu/juCwiv5imSpEqeriJuOwojug65xy
	+GNpRRDec8Y6AHANGcT/iYTds+iBv1Qh6GadJch20DGtNAVAz/rtpFHwMKlaGNsZ9khqiLMpOvI
	H/QqzL89TAWe6lLlGhvaJq/Aw==
X-Received: by 2002:a05:600c:6304:b0:490:9804:afdc with SMTP id 5b1f17b1804b1-490b50a669amr10176205e9.23.1780422391440;
        Tue, 02 Jun 2026 10:46:31 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH for-4.22 0/2] Finish fixes for eclair-x86_64-allcode
Date: Tue,  2 Jun 2026 18:46:27 +0100
Message-Id: <20260602174629.2649448-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780422392-DBD67443-7FEDD0E2/0/0
X-purgate-type: clean
X-purgate-size: 439
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:from_mime,citrix.com:dkim];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7B38630D12

Depends on Jan's "[PATCH v3] x86/PV: drop a local variable from
pv_emulate_gate_op()" which is ready to go in but not committed yet.

Andrew Cooper (2):
  x86/shadow: Deviate multi.h as being included multiple times
  CI: Mark eclair-x86_64-allcode as blocking now that it's clean

 automation/gitlab-ci/analyze.yaml | 1 -
 xen/arch/x86/mm/shadow/multi.h    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

-- 
2.39.5


