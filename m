Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EB6AC351F
	for <lists+xen-devel@lfdr.de>; Sun, 25 May 2025 16:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997156.1378162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJCD7-0006iu-TI; Sun, 25 May 2025 14:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997156.1378162; Sun, 25 May 2025 14:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJCD7-0006fr-Px; Sun, 25 May 2025 14:20:21 +0000
Received: by outflank-mailman (input) for mailman id 997156;
 Sun, 25 May 2025 14:20:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gIk=YJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uJCD6-0005ip-7J
 for xen-devel@lists.xenproject.org; Sun, 25 May 2025 14:20:20 +0000
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6231fc7c-3973-11f0-a2fb-13f23c93f187;
 Sun, 25 May 2025 16:20:19 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id 863F611400ED;
 Sun, 25 May 2025 10:20:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Sun, 25 May 2025 10:20:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 May 2025 10:20:15 -0400 (EDT)
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
X-Inumbo-ID: 6231fc7c-3973-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1748182817; x=1748269217; bh=mL74JBhQ+2
	8XfBxZeuQdBPRzlrPHx/K6JFX3Qfsm+Mw=; b=mZuX5yyLOH1As6zDQ0bvZXIkZr
	x8RcEnx3vLGN05OtAp+wE0D7ZyCoyFVq95tvks9N7C5fOhBI78ZGcJZXyXVw9Zag
	n/dZLeoMtd+5syfcHE1M5edt4/QrQErQlWom0S2YqyxLADzqwzSPaVBRQsqQ1TtS
	iDaIplHtE1EBQ/nwu38Dn3zIyghjJZQCTtvUik4PqQFqNfuxyzZcb/SpctY21MEM
	BS5dxzslSHmlPY2nXanrQbkgW9IkJcNOxj1MbL4zLHuomRZmxu+TFiJTO7CydwN1
	s69MBrID0YrKqh5rn/xiK1aLOlTipE/DYX52JubYcAcrkO46OMV+IueDPW9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748182817; x=
	1748269217; bh=mL74JBhQ+28XfBxZeuQdBPRzlrPHx/K6JFX3Qfsm+Mw=; b=n
	GKnhgb+GwXDV0n1D9jjRkF3m6YHQIMUbFmAeD14kCSxjme86uJrdCRblS07Bpr76
	OOGXiyZoJaXbW3YFOZ/4V0gcL983+QWpokrklGNShWSKEzkEFS1Owiz2lGOJUy/F
	vqkoayyuHznvd3+HecxsgkiO3NmAWW5Mit9hHH6nHp1b6IumGcDL6eKSJn05uFv0
	W2/7qtx+QJ9P6MsWqjqtf16bC39ztVmkX6VXkiY7bH0fxjVzveCc9/y01n0Y1vIE
	egLxDPNpqzOto/eiQAkVeaeAlk2bXwMTAaPVO1h9525iUkUW6BRsMkwACeQD6tkr
	aBCL6VbAAIvbpbVeLKRUw==
X-ME-Sender: <xms:ISczaKh654OdeTQckyySAUA4N1o4jjeVVRgBJk7gPxg8cZ2cW8er9A>
    <xme:ISczaLBFmCwikPReWrtlqPp7vMjNRZvjwKgcIZ8OvPNm2uzru-rKoBxJkRgzD-iRG
    WnSvU0LG2rDRg>
X-ME-Received: <xmr:ISczaCEkEqFIctWY7J4sxbYWIvlUb6Dv8bTJraU5P_FQwEgrZC9gHaQkquqQ6dl6O4PUieZGXEbQaWGOzDw_eonub2K81H-Ou_66vq0Grun9LOPxpqAf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddugeekfeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffo
    jghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofi
    hskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhn
    ghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudehgfdvfeehhedujeehfe
    duveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtg
    htrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhn
    ghhslhgrsgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghith
    hrihigrdgtohhmpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghs
    rdhtvggthhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprh
    gtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepjhhulhhi
    vghnseigvghnrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrd
    gtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ISczaDR0fhI4PcQIzu35kpc_O-NNMw4HYKZTR2I3dQ2OGwostvOjdw>
    <xmx:ISczaHz2cfB-IzpezCaucsbzat0HX28T3eQ4Y4rPf0qx3qwImUDkGA>
    <xmx:ISczaB73LwdSY-YVQOo6GEtmPlCkFF2A59IX5-DI4bThDO4n35Q_cg>
    <xmx:ISczaEy9tm2va0VxATBCHzXeAKe5aGbQQSGUG2GfRuqVqPrcCqs43Q>
    <xmx:ISczaJAQw5u8XbpZ4chxHLMr_YP0XlXJhpPXxuzk0Qb1fPvhrgGe7zny>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 4/5] drivers/char: remove outdated comment in xhci driver
Date: Sun, 25 May 2025 16:15:45 +0200
Message-ID: <6abaf3a05c8ea7204bea2046a799bc577e0b77e8.1748182535.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The input handling is already implemented, and that limitation is not
there anymore.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/xhci-dbc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index ced28cae0a29..3692776cec11 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -672,10 +672,6 @@ static void dbc_rx_trb(struct dbc *dbc, struct xhci_trb *trb,
         cache_flush(&ring->buf[start], end - start);
 }
 
-/*
- * Note that if IN transfer support is added, then this
- * will need to be changed; it assumes an OUT transfer ring only
- */
 static void dbc_pop_events(struct dbc *dbc)
 {
     struct dbc_reg *reg = dbc->dbc_reg;
-- 
git-series 0.9.1

