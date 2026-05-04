Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id o4+WKQ6V+GkQwwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D004BD28F
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299778.1574388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgQ-0003ZD-9J; Mon, 04 May 2026 12:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299778.1574388; Mon, 04 May 2026 12:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgQ-0003W4-4t; Mon, 04 May 2026 12:45:58 +0000
Received: by outflank-mailman (input) for mailman id 1299778;
 Mon, 04 May 2026 12:45:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wJsgO-0003FQ-QZ
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:45:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgO-001PY4-5k
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:45:56 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894f8-e002-0a2a0a5209dd-0a2a4504ca26-38
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:56 +0200
Received: from [202.12.124.154] (helo=fhigh-b3-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f89503-1dec-0a2a45040019-ca0c7c9ac5bd-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:56 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id B0DA17A0095;
 Mon,  4 May 2026 08:45:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Mon, 04 May 2026 08:45:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:45:53 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1777898754; x=1777985154; bh=/PEOatfv3G
	Fp83oMsDqhOsTKAuwjohfiS/0nM0aij44=; b=cKJvQnkojqRgJoBdKX6ORGdlpt
	oIKjuMHKfvbFptqOuSVmBkXcHd3MNQqFcjJf7jcQ0eG6CM6VgKjpc/EoBdrwzbeJ
	EYg+JZK0o+5ibffSvz94GZvx+MXGd4tMz95lxNIyTW+EANqjGL33FJkaqmymfnoC
	QDxK6N9iZyepj/pl4UvMFaHpjBT5PQKjaDrBowmWI7zTycm4s0xPmMH7JrFV7Mtt
	5D4Gp9bVa4NEpDz7RKBb4pCQcRMZjgR7KfxkA6RvKT6prdB6CbHGJAi15GqoVYWz
	LdoLlp44lRzELoEzX3bPSpLREq28/3Mz3gNrhajQbj8QNUqx5SBIhqGG46tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777898754; x=
	1777985154; bh=/PEOatfv3GFp83oMsDqhOsTKAuwjohfiS/0nM0aij44=; b=u
	ieaaRiy6TEb43kCPF5ZKSrJ/40aZLjhT4ceCr789z33JHEel1Oo2gG0VCBvHD4Mv
	Kdd3oUH8gNfQJIP1q/0/EVKLuWwQngZb+t/OqwUybLjfgTYgR2+aY+KDPBlXpATH
	rtTNtXOPSEK6ofy1URDa+cuGB6YeiJeIeFhLHjjTK/pDiHI1k8NNDraL0qY0nfIt
	m5+x/SOsJWIJ8hiGM6qXqlvgQ93a1V0sv7CLpxarOB9OVIR+Jf3S2AjuZHfVHcvb
	yu1fVdyuOP2s7uah5vtYD4Lauirevj0EjvarRwziansTzK2eY0AlRUBRgbkCexlT
	4vJJnJJNIuZZceshaLolQ==
X-ME-Sender: <xms:ApX4aZpBoKqdwzGgm_jBOiuCR4eKh07VxQH7kqzKaUILedD43NFm7Q>
    <xme:ApX4aSgxUcIoa0Kfnxjh2BpIqoCemfG6Upp5w38TaS5t2aQ8_HgDKU2-uu8-REQ47
    MAAjCbfFw-G4_8xJ1i7Uy4lS0Q8uuakfxefTEdxWTzTuSHS70Y>
X-ME-Received: <xmr:ApX4aehwrlIYZCQq7hKbJ_8hK5dfRseqImAy7xzLE_i5MY99qV4nVt0_9DjNnmpy7XHUvFh_M4uyGo91uCSJthFDYnN3eH3L_1jVwY6nz40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudeh
    gfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
    dprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:ApX4aQitN7l_HC0t2w_BeLjK90Nz6yozBKY8KwanstSaMpuk2CZZKQ>
    <xmx:ApX4aWKZn4oj7SWRGj0V_7gtKYMkjF3KBSNZl_W-gSnn1XFlweckXg>
    <xmx:ApX4aXG0FtAAryU64ySFFhoieBem9HYDkeXR6HUmUV_KzYpgqhBOmA>
    <xmx:ApX4aSSiLaz_dvz87yxKQF28UWmrWkr32bj82dPvkWQoFAAQDvTf-A>
    <xmx:ApX4aeUxpEEfR3bTzf9bz3NXIvPTCIARE8SBHjCJ210PYy7bXGc9XIZg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 08/13] Save Linux config to artifacts too
Date: Mon,  4 May 2026 14:35:47 +0200
Message-ID: <678529fd15fbe1f863bbdcd89e28ff2af0a8dae5.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1777898756-43D6C3FF-29F885DB/0/0
X-purgate-type: clean
X-purgate-size: 542
X-Rspamd-Queue-Id: 90D004BD28F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email,invisiblethingslab.com:dkim,invisiblethingslab.com:mid,messagingengine.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 scripts/build-linux.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
index e01b517..c51e45d 100755
--- a/scripts/build-linux.sh
+++ b/scripts/build-linux.sh
@@ -53,6 +53,8 @@ esac
 
 make olddefconfig
 
+cp .config "${COPYDIR}/linux.config"
+
 case $UNAME in
     x86_64)
         make -j$(nproc) bzImage
-- 
git-series 0.9.1

