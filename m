Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zPdpGXH9T2pXrgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 21:58:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDE4735398
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 21:58:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm2 header.b=fHCtcn7d;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=qHomPqqV;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358533.1612601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whusk-0007Gb-GM; Thu, 09 Jul 2026 19:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358533.1612601; Thu, 09 Jul 2026 19:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whusk-0007EK-Cy; Thu, 09 Jul 2026 19:58:02 +0000
Received: by outflank-mailman (input) for mailman id 1358533;
 Thu, 09 Jul 2026 19:58:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1whusi-0007E3-94
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 19:58:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whush-003wER-6S
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 21:57:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a4ffce1-bab6-0a2a0a5309dd-0a2a450b9c58-48
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 21:57:59 +0200
Received: from [103.168.172.154] (helo=fhigh-a3-smtp.messagingengine.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a4ffd45-b7da-0a2a450b0019-67a8ac9ab7ab-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 21:57:58 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id AD45614000CF;
 Thu,  9 Jul 2026 15:57:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 09 Jul 2026 15:57:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jul 2026 15:57:56 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1783627077; x=1783713477; bh=EarCEyvX9vi3viPPe/HLi3xofwqUarDW
	AeZtIfvZI5w=; b=fHCtcn7dFhV310acO/V8GIod/1vcPA0yJRh7ULCDXKaabTt8
	rNLtauLqXDJBl/9E2ktVwJZPOUYsnF/iJNSfdB98Q5gwYLcPFOYcGGCW5zuYI2nh
	ptSCWpqzpN7H6v70ud7qmKaRpumoLAmarf86Lh2lnidid+GwqwJVmjtK3h5Nutfm
	QFA/VooFu6pfKCloSXwuEfzXawCpGaZB2WQh07DQaTjE3ufAswteonmlaLuGJYdC
	Wk9a/vbeMTKnGYQw8EmdHeQbD110t67UlX6blulRSMQOkEl07/8jp0enHGMtRwEO
	tBTzJE5i6na+z7QozRYQE11EmCee/tJT0L1hew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1783627077; x=1783713477; bh=EarCEyvX9vi3viPPe/HLi3xofwqU
	arDWAeZtIfvZI5w=; b=qHomPqqVfsKZttyhePjwyOsB+ylSwC+2zpLt1Nf6ssXw
	Q8Q/wUgPu8KulBVJ/5lC9PrNgW7Pq5aNQoH9FgpHUiD3wiU+w+NMYARAjXCk0Sgd
	+1PMjOgahXIvumEZvbo44/9XaWhOfh2hVr5S7oAkthPj3qIF4lIz68aV2xly9CPu
	00BZXz8Fef9xyyJRacXimOOyaEayD3iQVumK9zANV8KLMSxeouuxcKYGExuDPq6+
	d8WvNRk1xdbTtTVp347dhqdPbb4aHFBc2+Ucxyum0jaGZ4M5nalvPYuUWq3+8BMP
	jYAmz8lxCihOi2tZO6ij3LOMOz51bxtku/dg81/I3g==
X-ME-Sender: <xms:Rf1Pat_LrYEAvIxwnw0w8Bo-08YilEoIaHhIq56QJZzJvMQKEICVTw>
    <xme:Rf1Paovo7BLHVdMzUMj5r_Woyujr6TvNzZ6dJSfPFCImsCc8YxuF6W0Ddi0S2X0un
    p13tt1DLM8wxPkvDwqZasPCCB-N0PFkF4eJCZ6Z0Kj2942OQw>
X-ME-Received: <xmr:Rf1PagDz2T9uwc8umrD5UIA7_bGLbAIosJaqoQK7vTYJ6-3y6oFO0Ov2t1rbrseINtizJoAceYmYV2YqRFS4fUnIjhmOZwGl1p5TlSnlPZU>
X-ME-Proxy-Cause: dmFkZTFBeks9wKYCITwToWc7TKQMUrpR905dVAch7xTanG1aLKQBFjER8ANUJbgekYLXmR
    eiIk2QRZkQMhRIrHGo/Oz54FVWTf54LrmQv9HCi+RQV9EXNAPadMHnx91e0bZjB1ZsPCz+
    4E1aFsw+D9am8xj0Fj6uAluVJNEWYm9feIaf+jpZSD5Umid4UtPstZkDIWFCmBYlUcIhNO
    5wx73Ogmw/1m5ViQ7KlDNMC+df6h+PfEUAKH0mZ/JbxcNhCW+kU9wlziPtjzYBqoxEZ/CP
    cotq7lFE/GvcgTXShIipWNWXeMIBVXrpq3LezPzB8xn2z3YfSApl2ji6oBrvt974nxhsIY
    rc7BbCEGJRRvXu5ajqmz4R+VBQ01s/ieQoDuNeOAZfC+hkE+m0DfYQZKCOEHeXbaOJRU4C
    2iXW66vP1ZXTWjM75SpOuvFh1wl97DorGeKyilJxaZNCnj1wl42yoONAeY7zfo57NJY8ZT
    gb9HZH+PnJQCoRFZ8n6ntaxZ6Sui/lE9+40PR4Ba69MVLqtvzBFOqW3PLMsOF8ttV0u3Xy
    6dW6Zb0m/xEh9XWg6vSVL39lveMAFSbOIKLTzKtSDuxexzhd59Iyd/b1htNfFJcn64DtCN
    DlJSrgWvT8S3Eo7D18UAHHpe8AiUo7aRzjuAgsNa6YBlke/6dlGwpK9cTSXg
X-ME-Proxy: <xmx:Rf1PagWFPt2z-bWyE7d4ueoGcXCg5jezqqlEy8WScUvLSi7IsIbPbQ>
    <xmx:Rf1PauBW_gKHJDfaBF-L8-hNN2MET_pZHpuqCgzPZN6DR-mmI0vaNw>
    <xmx:Rf1Paj-Lbm0vQKDljgac7gATXHNuQJNX6yoomAsHr_Wsbdab1TBipQ>
    <xmx:Rf1PalH3KnGw-G_X9Csc8roCgcpaDCF5KgISiRC08xTND7z1LgI_Lw>
    <xmx:Rf1PalKMc_rftVkfgR7hskwx9nwypHwB-CN9_2RTRaOQIKk8qXPcN20N>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/2] CI: new PTL runner
Date: Thu,  9 Jul 2026 21:57:03 +0200
Message-ID: <cover.2e3d53e8679d3686e3f6579df0c7acb781c92701.1783626895.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1783627079-A11D69ED-5C20ECCA/0/0
X-purgate-type: clean
X-purgate-size: 900
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,gitlab.com:url,invisiblethingslab.com:from_mime,invisiblethingslab.com:dkim,invisiblethingslab.com:mid];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CDE4735398

It's a NUC 16 Pro, with Intel Core Ultra 5 325.

As mentioned on the last community call - the hardware is bought by the Xen
Project, and then hosted together with qubes runners.

Xen itself works pretty well here (except suspend, to be investigated later). I
tried also Qubes installer, and there is some issue between Xorg and the
xe display driver (screen remains blank when Xorg starts). Likely an
issue on the Linux side. Also to be investigated later.

Pipeline:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2662549936

Marek Marczykowski-Górecki (2):
  CI: add PTL runner
  CI: enable FRED on PTL runner

 automation/gitlab-ci/test.yaml     | 82 +++++++++++++++++++++++++++++++-
 automation/scripts/qubes-x86_64.sh |  4 +-
 2 files changed, 84 insertions(+), 2 deletions(-)

base-commit: ccde3773c1762d32fb5f6037d6b22780c30895d3
-- 
git-series 0.9.1

