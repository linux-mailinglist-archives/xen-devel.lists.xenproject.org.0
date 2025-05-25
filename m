Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF95AC3524
	for <lists+xen-devel@lfdr.de>; Sun, 25 May 2025 16:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997154.1378143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJCD5-0006E1-8F; Sun, 25 May 2025 14:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997154.1378143; Sun, 25 May 2025 14:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJCD5-0006BL-5S; Sun, 25 May 2025 14:20:19 +0000
Received: by outflank-mailman (input) for mailman id 997154;
 Sun, 25 May 2025 14:20:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gIk=YJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uJCD4-0006Ah-Dd
 for xen-devel@lists.xenproject.org; Sun, 25 May 2025 14:20:18 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60c7751d-3973-11f0-b893-0df219b8e170;
 Sun, 25 May 2025 16:20:16 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 2D70C25400CC;
 Sun, 25 May 2025 10:20:15 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Sun, 25 May 2025 10:20:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 May 2025 10:20:13 -0400 (EDT)
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
X-Inumbo-ID: 60c7751d-3973-11f0-b893-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1748182815; x=1748269215; bh=nvcA2fXb3e
	hl89J7/qQltbJE5fahzJ7yWRoiR9gW1UA=; b=N7xmPgvQPZcNs9lOryH9mVo0H2
	C/IMDast8elvfpA7z4GK4FC9KtXik2CKq5cQgep7UrNSlve3fom8gGMCsKtTxTXd
	wKmjdjcW8VQ3104kRF9ldRH63pXNilT4SKDcvj5NuWKVnvtJIEPJiIxpiL6oOuJR
	oSW/xipriiITpzsF/N0GWi7rnC/EwokrVItsP/gkVlAe4zBt9LS3709/iGmRyram
	YTsgO6cKMx3D6obygIQa5p3gBcFftAI5jwyVZ3fl9HohxQyAFD0oK8Qu1iFqvbDm
	BN/wCG/aO2NRCzQdckuB8O3OS9qKwQqQ4ZChLqH1ps2TJg1Z0kQq7DlK1AcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748182815; x=
	1748269215; bh=nvcA2fXb3ehl89J7/qQltbJE5fahzJ7yWRoiR9gW1UA=; b=X
	XtrMxeAK/jPJSKa3qy4t50Q+dIe/AwjbOrOR4Fz7gr1zS+NFoIMoLghJrTW1Loyq
	p38mTYO4/WVQeDjAZ/+iPC5lnXNV39p1OgMVUhOka/Dh4hZ+poign3YXWDGgcJz/
	kl3Nw7cizV05yon97NW4At+j6LfknwoM0V46iJzlfZeAZNAr0KpPakM18AA+psYw
	rhhdZTZkffBbfIp+sKfehKMFC6bX8uQ+piF4ZlFwzIVBX5qrTMq3eaPWhlMPXBwc
	3NK50R6ZazKciR9ocVifr9GdREpp9Kvtk/lmpnx3Ledg2JoePqxUX7wQg3RnvUZj
	VVCyELCWkb3IIRWEEbzVg==
X-ME-Sender: <xms:HiczaOjsD7Z9vLQg7u10jytriuN0Zc1A8vu13SIezza__lPygTbT7w>
    <xme:HiczaPBqdrF8jNxoX-8TxgIRQMt3XfU0BOOCeGM6qA5AwH6TTRFwUlQLRTYN7am4J
    _aEllm5_i7j_A>
X-ME-Received: <xmr:HiczaGGAH6DNZG7dnQ1yywLF_PVmxzccYfTZE7YHZBzTQseBbGzO1FU7cxT8j89HD9LC6nW3DzZFdPgZMgS-u2Zhhyt2DCisch0OWclCNQDT9SwpE4XQ>
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
X-ME-Proxy: <xmx:HiczaHQ7EDeAqs7yVuHkWZd9AMrCSnReIZWnqW_yZjIc7764kdanbg>
    <xmx:HiczaLxMh6qyo6COVPsdSgx4VoTmkazoaBuP99O6OmJakl6E8mHQfg>
    <xmx:HiczaF4ww3CsUtzOF5I3SL3_CbEsVu6jXbwlpapUDhhNb9BwTPtW5Q>
    <xmx:HiczaIyd1e2cMA_5EQOD3dIUTUwnSHtsZmBHSN6Y3BSabB-CYq2c6g>
    <xmx:HyczaBPR0ZENeJ_t_I2rnr2mE8BaVs-KAfqOeX43GgtfJbJGncnMSMgj>
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
Subject: [PATCH v1 3/5] drivers/char: make dbc_uart_dump() a bit more useful
Date: Sun, 25 May 2025 16:15:44 +0200
Message-ID: <faf72a48d11a45de8139c9c1d3904cf7130393cb.1748182535.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make it safe to call also if xhci console is not enabled. And make it
non-static, to require one less modification when actually using it.
When using it, one still needs to add its declaration in some header
(or just next to the call site).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
IIUC Misra would not be happy about a declaration of an usused function.
And I'd rather avoid extending DBC_DEBUG scope beyond that single file.
---
 xen/drivers/char/xhci-dbc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index c4bb371ff78f..ced28cae0a29 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -1498,11 +1498,14 @@ static void dbc_dump(struct dbc *dbc)
               readq(&r->cp) == virt_to_maddr(dbc->dbc_ctx));
 }
 
-static void dbc_uart_dump(void)
+void dbc_uart_dump(void)
 {
     struct dbc_uart *uart = &dbc_uart;
     struct dbc *dbc = &uart->dbc;
 
+    if ( !dbc->enable )
+        return;
+
     dbc_dump(dbc);
 }
 #endif
-- 
git-series 0.9.1

