Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIOEGk9XzGn/SQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:22:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 899A2372B3A
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269362.1558449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPe-0001Yw-AU; Tue, 31 Mar 2026 23:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269362.1558449; Tue, 31 Mar 2026 23:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPe-0001X4-6w; Tue, 31 Mar 2026 23:22:22 +0000
Received: by outflank-mailman (input) for mailman id 1269362;
 Tue, 31 Mar 2026 23:22:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iPc-0001HH-Jz
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:22:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iPc-000kEs-0S
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:22:20 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc56f4-e002-0a2a0a5209dd-0a2a4501db78-40
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:19 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc572a-6fc9-0a2a45010019-67a8ac95bb2b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:19 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id CFD43EC00F3;
 Tue, 31 Mar 2026 19:22:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 31 Mar 2026 19:22:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:22:17 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1774999338; x=1775085738; bh=Iur8dqEwLB
	3gQVTSs5uuTrVNFXqKE6PkAoIahlipWVk=; b=MCaXuT3JE+a0+xnvEPjt02GJks
	k58KMdbnybHhCCE08uNCDREzE9cA2zzUB0cZ7kOjMRnHbgZhODis9fuQ29kWeU8w
	euuMrMOrSaxVmVRDEIdy0ffQWqlXT+CpeB7cridq5QT17UiLflJlomdNVfhPMB7q
	Owwo/BO1wjbx724TjThqeDFnxl7GCclcrJp6gzL+R1K7HI5oyX0vdYJDAXmu19jM
	Pq2UKS4CsUIw6rWTNWMhFe4ZFkJLTa5S85M/Qi/rAzJyl0lJocqBK3Co5j0in+KK
	OCRxFd8AGvm0xh/uRFlRl72OctET52CiZSV6SXylbXPFeSNmEJCC7bJ1yfrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999338; x=
	1775085738; bh=Iur8dqEwLB3gQVTSs5uuTrVNFXqKE6PkAoIahlipWVk=; b=a
	sxJ1mo5zGRsd1zx0AjSjPou7HUJLjhlA83Z5oLPzLQJ/HJhxbrjHYgaZGcBi/C3E
	fIs5GU7riLquP0oGSKgSBqThQDX5O97/CNUW+/v6Vtz3/wuXC3FZPaD88E53M2K6
	ygJr7T8oXc5elChYeVH2kpPzCm3X9mCMZwuqJlZB3+R7QI5BUNKrg54ZFkWMlIGh
	uh0A3bCOcRAUQMvmLCkFwqaRWztforhg7spxSxUdUtCUXCUpBI+5A5tsmsKU29i5
	2txLBf4X9mJuNqk0auDFMQDg+/PEXE1X54/xPkOHw7CaL3RwTMOocCJF8njrKGRi
	XKFV7gq9wQn+xL5wPFHSA==
X-ME-Sender: <xms:KlfMaYl9eV-bfg1vrhAQfs8mIGVyDODzmeoD3B7gFuoJ8bMgj_XphQ>
    <xme:KlfMaetv_HAinPj4S675_wDkuLCwca3BCe6vaDzruxDp-6ud32qfLtm5lHe34S7uI
    n3USzxC0gS_iqmCM1z2dolOCDjH0G6QMVFeh1HJdy9r4DeD2A>
X-ME-Received: <xmr:KlfMae9bv4FOkaPgvb8eNwiMbWNvNvdrbHDmLS60WET1_ZYAfi8xbEWxxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfe
    estghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpd
    hrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:KlfMaQMJCLNt9aK8Mpf_k6AAkesjqxkCRHdJ8X2FoTBx6arJHwY9Xg>
    <xmx:KlfMaUFFXpBQA2f1SaKqgSOuGa2mXZEHFQnNOavD_00F_RGQSVz-0Q>
    <xmx:KlfMaWQ8RGS5yYfVzSQzlohZFAxZthHhLlkt5Am7qEa_jV-Nnh0ShQ>
    <xmx:KlfMaZvWuLlmmirC94hS4_mMXii-qMei_WaYQb0E9PEk-9v27nNegg>
    <xmx:KlfMaXilmBxO4FwL5zZ8H73e-E2MqpEx6LRdE0tCp6_kRHvSiF96lO_z>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v3 06/13] Include git in the ARM64 build container too
Date: Wed,  1 Apr 2026 01:21:56 +0200
Message-ID: <09eed5bb65e603e9b0a614ef315635d406b519b2.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774999339-B76FF185-CB5B4063/0/0
X-purgate-type: clean
X-purgate-size: 771
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,citrix.com:email,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 899A2372B3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It will be used for fetching some Linux versions.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 images/alpine/3.18-arm64-build.dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/images/alpine/3.18-arm64-build.dockerfile b/images/alpine/3.18-arm64-build.dockerfile
index 25a8dbd1090b..38464c950eae 100644
--- a/images/alpine/3.18-arm64-build.dockerfile
+++ b/images/alpine/3.18-arm64-build.dockerfile
@@ -14,6 +14,7 @@ RUN <<EOF
       DEPS=(# Base environment
             build-base
             curl
+            git
 
             # Linux build deps
             bison
-- 
git-series 0.9.1

