Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2EC98FC55
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 04:30:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809929.1222497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swY4y-0005UU-CN; Fri, 04 Oct 2024 02:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809929.1222497; Fri, 04 Oct 2024 02:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swY4y-0005RG-5r; Fri, 04 Oct 2024 02:30:04 +0000
Received: by outflank-mailman (input) for mailman id 809929;
 Fri, 04 Oct 2024 02:30:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+dN=RA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1swY4w-0004wg-CI
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 02:30:02 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b559308-81f8-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 04:29:57 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 8C7CB2540098;
 Thu,  3 Oct 2024 22:29:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Thu, 03 Oct 2024 22:29:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Oct 2024 22:29:54 -0400 (EDT)
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
X-Inumbo-ID: 8b559308-81f8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1728008995; x=1728095395; bh=XhyFmXVWtxi/DxrV5BMunrs2I4j9iBSY
	prjI1fqUdXw=; b=ARkSSN3mCI+eevMji7a/sA+4UeqGqbyIhxds6zIE4JbPIx1m
	bIDDwmGvYzghatF+YnPnfUwBVOMgZwZp8rBXbRtUBiVa6NB6jFqcXvNpeI5Yc9VC
	yBgY8i3O41litDVrkleaXT9edhYeKDaQVIS83OPc4V3rGkb85Tn3rpHD2/1N4hSS
	YkNJnTk1SHw3O6DJ454l/oR6pEbOgh3Fn0qaVfxXmUCswxG/BoGdhy4nYgREa/ME
	CkGDhzdHRZriz4tVUhMrg6rNCP1tG8bRYJrjlO8ztOmnLiut0LYoZcb//q5pc0C5
	YiFhy5csnRVx2dYbSXvtLlc1HufeR6siZLuThQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1728008995; x=1728095395; bh=XhyFmXVWtxi/D
	xrV5BMunrs2I4j9iBSYprjI1fqUdXw=; b=i7nY8VZ+JqsCMe1tqQXQvt1o7hlhX
	JS3Tr5JO4OHpO9CW1tcJigCCXIIwOUz262FFYP3hdZpl91BlKyMWK+QvY5KksapW
	FXeS52p0qIDV89sxOwcmAVwIQ+aslDzFTD+dhtvNiqMdXhTHbEMyexsbJu+lSG7m
	zsOaz31wJuXo6bRpBqqENSA50sPLOw916vBvKi5v6D1OZTTxsqhGc/xSyyIWFx2v
	48B2OybtxbJRrdf1uBEruleOTCeqGbGX39fmo2ymcTU+y70jmkcSRMsgQdwtsg5E
	uM25uq6aMw9HncEF7MxeubpiYRMW6FmGIsGZW4tSChSxZvTyBterNivjA==
X-ME-Sender: <xms:I1P_Zo9iJOGcHhTlFVv1xH3CKteofBm_9XvJAUEyKKHki6XnOOGRIw>
    <xme:I1P_ZguN1LJE2Q-1JsDVN4TYtoKe1h-pUhCZqLv17iFtgk11bed_Z2LgU8z5Q6eP6
    8VBmP4cMVYB2g>
X-ME-Received: <xmr:I1P_ZuBHvKK7c6ybUiuS4_R21zp_6w1Vyo0RqGxY_S75XhljVdMCp-B0fa7xm0mAeU8Ox3w4G6_Yt9J477icK44WwDV0v9Y89XWSruhqDrpn-hcTBNc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvvddgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhho
    fihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfduleetleelleetteev
    feefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgv
    thhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgv
    tghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:I1P_ZodGITqV5gZipgk1haIreUjkgaxRLpG1kw3iSo-gvhj6jiUvbA>
    <xmx:I1P_ZtMVQPgp82RFxKfuOl-LtGTu76YmS730jSQeevaEePZNohYY-w>
    <xmx:I1P_Zil5T-C9r0a6fs3AgOsKgkDT-SsbH8DuCzRk9Jk6FFcTEJfvzA>
    <xmx:I1P_Zvv9GpsqqtBvhXA-ZP6nOCdKZywJq8e-kHbUgG_gRUaHeQcSeg>
    <xmx:I1P_Zr378U7Jrwzp66MqbHSL2mYWFIzMwUC3K3_qW8F9UZRyuq0o_5CX>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/3] automation: add smoke test for xen.efi on x86_64
Date: Fri,  4 Oct 2024 04:29:36 +0200
Message-ID: <cover.1bb6f2ab5669356ea3ff954b7c324d2f31c19399.1728008940.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Marek Marczykowski-Górecki (3):
  automation: preserve built xen.efi
  automation: add a smoke test for xen.efi on X86
  automation: shorten the timeout for smoke tests

 automation/build/debian/bookworm.dockerfile |  1 +-
 automation/gitlab-ci/test.yaml              | 20 ++++++++--
 automation/scripts/build                    | 16 ++++++--
 automation/scripts/qemu-smoke-x86-64-efi.sh | 43 ++++++++++++++++++++++-
 4 files changed, 73 insertions(+), 7 deletions(-)
 create mode 100755 automation/scripts/qemu-smoke-x86-64-efi.sh

base-commit: d82e0e094e7a07353ba0fb35732724316c2ec2f6
-- 
git-series 0.9.1

