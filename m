Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3308BE276
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 14:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718066.1120595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBo-0003sE-Cz; Tue, 07 May 2024 12:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718066.1120595; Tue, 07 May 2024 12:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBo-0003qS-9m; Tue, 07 May 2024 12:45:00 +0000
Received: by outflank-mailman (input) for mailman id 718066;
 Tue, 07 May 2024 12:44:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3sU=MK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s4KBm-00037i-CO
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 12:44:58 +0000
Received: from wfout4-smtp.messagingengine.com
 (wfout4-smtp.messagingengine.com [64.147.123.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b1d384d-0c6f-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 14:44:56 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.west.internal (Postfix) with ESMTP id CE04A1C000B3;
 Tue,  7 May 2024 08:44:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 07 May 2024 08:44:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 08:44:53 -0400 (EDT)
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
X-Inumbo-ID: 9b1d384d-0c6f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715085894; x=1715172294; bh=hZ6VYL08E0
	Yxr0n/W2twXlHVhmqK+fKxAH0QY/uH+Wo=; b=E7AzwpSCa7RJFAipYDZ3jCQw8U
	jjxqm4GQB2I/bfs42ihOCBTLat9qrYlxXOMjR8bQlWdnKseCAhsSadphICOrCrdN
	BjHUbzEMXOzMlpymCmT/n6Lwc3+Q90JK8n8zBqcMgJKDdLv/haysg/er7n+Go+Ya
	wLr/ZQVRHGFOoFa0E04VOEN3GLu003xNOq//1iZio/KXnk9jIkQ5oZ+xxSoWrpRm
	kXGgYPJaYHENFt1F+sVtEzhRDyJdmln5DZvNxOnFUG7FsBUBHZda7gS/99nFB2yJ
	wRiIl7Im7o3GKVVMMNcRwI/00ZZa30h8Agf/P49lSmV+JbKVqAIRw695vDhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715085894; x=
	1715172294; bh=hZ6VYL08E0Yxr0n/W2twXlHVhmqK+fKxAH0QY/uH+Wo=; b=R
	6Kgq3hm3cCwJhJ/y8diYXiEPrwDuROJuZo0xnozeKI5rqLeIS9tDH7bsgWvv3fIW
	8cVSDVAD/d57rUYl24DXXaS19oOHirqhSPdIy9nTvoQwT3oaIxh9a5NVLyWvmvl7
	OFHWlO2j4EarZasWgk20o6E3s1aBmuIzz6vS70jeFBOkWH9DEKeZmIW6BKhilXv8
	DOtjU/wb3et5DstvmN6uavRFvu6An3DIyk47MrCSoSAP3J9KfvZLSBb5IInzJGK3
	09lHBlfSnjNZqSVggqiwdgSC8zaSB56eRghNdKxdCVLDFAT+K2LYRw7FGx6wDLRo
	mO7dLDT/QSp9QuzIY0YsQ==
X-ME-Sender: <xms:RiI6ZvFk4IHbNcRDXRa6C6kDZ4Ds_8yuPoJegUEk5VsxhUQos6AFnw>
    <xme:RiI6ZsWcXTuynUD8jxqSVZap9zX-KPM30j4mv94JlpoowMafwh6Ffw4zkveCGKLXq
    IVBBlGK9eL64Q>
X-ME-Received: <xmr:RiI6ZhIWsbQusce-zgzxgrc29SlCquYFZ5vDm4LagfLWy3-WT6192UTHO-p5_BpH853oiYAAcYNI810mEzEtKhQmWi2mmlfpmxyLxnvVPxQAqDUX5Qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:RiI6ZtH9tUIWHwFUjhLJtXHQa3lApTfNYTyq5MxHlnuN7yMW9sSx6Q>
    <xmx:RiI6ZlWcdmBRSeuV5_6RAty83r1TJgy2Bfxhj4lSgOVlTe0lKJCIyQ>
    <xmx:RiI6ZoOKN_jcBfDrlZg8ba_i0sgqlisdBHKcvmUWhrlV7nlPWjM87Q>
    <xmx:RiI6Zk09eVNfedsrKu7ENldn3xQt8RnNxH2_-prJU1Eqmfb8NBmdAw>
    <xmx:RiI6ZoSdx8UiGg8Mv0SzBmankFhc6clJH7lBWq5DwPbOghMUIdGr4paf>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v7 3/6] automation: prevent QEMU access to /dev/mem in PCI passthrough tests
Date: Tue,  7 May 2024 14:44:03 +0200
Message-ID: <2b6ed802c83f7e6d7d03437b8ecc693628f85651.1715085837.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
References: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

/dev/mem access doesn't work in dom0 in lockdown and in stubdomain.
Simulate this environment with removing /dev/mem device node. Full test
for lockdown and stubdomain will come later, when all requirements will
be in place.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
This can be applied only after QEMU change is committed. Otherwise the
test will fail.
---
 automation/scripts/qubes-x86-64.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index d81ed7b931cf..7eabc1bd6ad4 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -163,6 +163,8 @@ ifconfig eth0 up
 ifconfig xenbr0 up
 ifconfig xenbr0 192.168.0.1
 
+# ensure QEMU wont have access /dev/mem
+rm -f /dev/mem
 # get domU console content into test log
 tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
 xl create /etc/xen/domU.cfg
-- 
git-series 0.9.1

