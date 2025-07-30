Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F42B15FA0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 13:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063832.1429546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5GW-0006kN-NI; Wed, 30 Jul 2025 11:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063832.1429546; Wed, 30 Jul 2025 11:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5GW-0006hn-KH; Wed, 30 Jul 2025 11:46:36 +0000
Received: by outflank-mailman (input) for mailman id 1063832;
 Wed, 30 Jul 2025 11:46:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UEsG=2L=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uh5GV-0006hh-6i
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 11:46:35 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d65c59f7-6d3a-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 13:46:33 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 69428EC001A;
 Wed, 30 Jul 2025 07:46:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Wed, 30 Jul 2025 07:46:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Jul 2025 07:46:30 -0400 (EDT)
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
X-Inumbo-ID: d65c59f7-6d3a-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1753875991; x=1753962391; bh=iw9KCBpYMjDcqlc2KEJngT3+FAtEByRQ
	hDMxvf/pKSw=; b=BaDlfv6BMXk3UBRViH5ikclHvhXrYxKR8drIouZUtpDVVTnF
	Ip9I9i2IMa5At68ofcCmw6KnF422oNE2Xz7BKcriwibKdBQS29rvwUtcHZGfJNXp
	h1B2JMdgdSx7jRGkuckIPai4yLQsL7XwwSB8Ql7e5KOEyuLDQ9J6jB8ZrmbHJpIE
	z+CMqGuxri1cCR0On6NNwBDK56rUlFyVuEc503EFHmAM736aZSTsuqFEuuUcH0Gr
	Z7JYzJA4n+eTuJjhJbA/nMWycQsIN6+neqeWBoKx3lT1QGPpEHMbJDW55QQLjkdY
	j/TiLxuML9ZYBVaj6nR0v67xFfn/AXkrdnnljA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1753875991; x=1753962391; bh=iw9KCBpYMjDcqlc2KEJngT3+FAtE
	ByRQhDMxvf/pKSw=; b=l9T0JPc1g7VKA7yEW1DoGp82FIJ/yHINf7vXg85Pm8GK
	DPu7glqSTd7VyFrtaZ1Hw63f2JlSJ0+cONTDrO0wNfCzWnH2p7yvr+YElN7maH8Q
	empp9ATzwR2cWUf9v/qe6qKT36NBeTAokXFqM2oD0ZnHGTnyOc4uiwJ4DTJAV8dT
	y0SsAdguWsLIlMcBwCcaR0Hk4B2SLoRFeGIOszSDCUi4z8GCf0DnmEV+Botdr+PY
	Sxz6fOBqxwiKiJRbpQX5xEt4zkH8xRL8oX0nqI+yxd91Y6qZnGdY5rUr0f8zHpHn
	VVw5GqLw/H1utZGbwLb+A9/mv1fyzfUaGjU647e1kw==
X-ME-Sender: <xms:FwaKaEdkWcn16arioz3JLXol4tt6A4kGX-wqdjis2Aov15NQd-EBtg>
    <xme:FwaKaAyKhXzvHu1FoDBUFS7Eyls99QNvEP_CNtUZgurj5HGeBAqGc5fZEk5AF7Rid
    G8OxqMiAkeL0A>
X-ME-Received: <xmr:FwaKaCGdEoNvzYUeUxBQ2AHhiqLN79Peh85SeIxYDJvNwm8LSrf4gk-dWKAkh1tKGcMnbO2C6xykmaIk9YOjMF6cTcw_cAyAzVrEarfp2Qhqvg1urEeR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfduleet
    leelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigv
    nhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrughovgestggrrhgu
    ohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:FwaKaMzCxa3H2hvpL91-3omwquZDlRbtmgFNpTXx2Y8NYRdppLCRGw>
    <xmx:FwaKaLuG3XSQnI9GmpZdzTuMI8QHN0H1L8RLNpBo3e2YUvN-f4OWMg>
    <xmx:FwaKaB1zra9T1sk-lTTfjtfAWtII84UDiZqWSY4uT5PluRpEwsyGJA>
    <xmx:FwaKaO_3LgKH8UfrmQYpSBXQNhhPVOor4w7zud_mWjrBj7IPgmTlnw>
    <xmx:FwaKaKYJ-MGkDZV4fyoi8-b8ifm-rooKa29stZt3YXlKnTbqhyInFRKs>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] CI: list failed tests at the end of tools job
Date: Wed, 30 Jul 2025 13:46:18 +0200
Message-ID: <20250730114624.2260010-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, if any unit test fails, the final line says only result of
the last test - one need to scroll through the whole log to find which
test failed (or whether was it some infra issue).
Do the simple thing for now and repeate the failed tests list and the
end.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/run-tools-tests | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
index 15766ca0f0ab..86f305c4c322 100755
--- a/automation/scripts/run-tools-tests
+++ b/automation/scripts/run-tools-tests
@@ -42,5 +42,6 @@ printf ' </testsuite>\n' >> "$xml_out"
 printf '</testsuites>\n' >> "$xml_out"
 
 if [ -n "$failed" ]; then
+    echo "FAILED tests: $failed"
     exit 1
 fi
-- 
2.49.0


