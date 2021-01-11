Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055712F1CC2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65106.115270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DK-0002ii-3h; Mon, 11 Jan 2021 17:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65106.115270; Mon, 11 Jan 2021 17:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DJ-0002i4-WC; Mon, 11 Jan 2021 17:42:45 +0000
Received: by outflank-mailman (input) for mailman id 65106;
 Mon, 11 Jan 2021 17:42:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1DI-0002a6-Vz
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:42:45 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42e1ab8f-a3ed-410c-8bef-42c6a6e81da8;
 Mon, 11 Jan 2021 17:42:36 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgTM3I
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:29 +0100 (CET)
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
X-Inumbo-ID: 42e1ab8f-a3ed-410c-8bef-42c6a6e81da8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386955;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=QiPerdOU9xygk7E7MXkq1VASHZU9W0Hszj+BzxbqjQo=;
	b=A2uds57lki+sBKIERoJZ5uOmdj5dKjFGtI7lXHGcYdAWF0oli6yuz+m+bJTjF7Rs8Y
	PcfSMc46w6/4geQCrKF2kFPQIn/XtvCZirKHoamr4BaR8RuakEholQbczxgsPSF8CR1u
	zKA42t4ZraVAS3AzWdKzu6rrk2+TBmIuSXKSJqfgdD1yT2zZ4fppw/LDgxVxyPs52s+M
	zxTv/YreOEaFjOgK6fvsMtpMZ/jq3F1faA22uqKOaYIGIh1gQPssXeqKYviynkW24ZtR
	DyyVteCo+TJRwyW8+0CH65lrbICqvwZX6igydKq9Oi7pfEIcuAsftXgzjR9ZWrUyYvGG
	qWuA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210111 04/39] docs: substitute XEN_CONFIG_DIR in xl.conf.5
Date: Mon, 11 Jan 2021 18:41:49 +0100
Message-Id: <20210111174224.24714-5-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xl(1) opens xl.conf in XEN_CONFIG_DIR.
Substitute this variable also in the man page.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
 docs/man/xl.1.pod.in   | 2 +-
 docs/man/xl.conf.5.pod | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index c7b2fcc927..765c169ed2 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -50,7 +50,7 @@ setup the bridge.
 
 If you specify the amount of memory dom0 has, passing B<dom0_mem> to
 Xen, it is highly recommended to disable B<autoballoon>. Edit
-B</etc/xen/xl.conf> and set it to 0.
+B<@XEN_CONFIG_DIR@/xl.conf> and set it to 0.
 
 =item run xl as B<root>
 
diff --git a/docs/man/xl.conf.5.pod b/docs/man/xl.conf.5.pod
index 41ee428744..dfea9d64ba 100644
--- a/docs/man/xl.conf.5.pod
+++ b/docs/man/xl.conf.5.pod
@@ -1,6 +1,6 @@
 =head1 NAME
 
-/etc/xen/xl.conf - XL Global/Host Configuration 
+@XEN_CONFIG_DIR@/xl.conf - XL Global/Host Configuration
 
 =head1 DESCRIPTION
 

