Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3598A9C6BA9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 10:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835199.1251041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9ua-00045t-RR; Wed, 13 Nov 2024 09:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835199.1251041; Wed, 13 Nov 2024 09:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9ua-00044P-OZ; Wed, 13 Nov 2024 09:43:44 +0000
Received: by outflank-mailman (input) for mailman id 835199;
 Wed, 13 Nov 2024 09:43:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LXmd=SI=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1tB9uZ-00044J-Iv
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 09:43:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c33df437-a1a3-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 10:43:40 +0100 (CET)
Received: from delta.homenet.telecomitalia.it
 (host-82-59-161-229.retail.telecomitalia.it [82.59.161.229])
 by support.bugseng.com (Postfix) with ESMTPSA id B92A04EE073E;
 Wed, 13 Nov 2024 10:43:37 +0100 (CET)
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
X-Inumbo-ID: c33df437-a1a3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImMzM2RmNDM3LWExYTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDkxMDIwLjEyNzU3Miwic2VuZGVyIjoiYWxlc3NhbmRyby56dWNjaGVsbGlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731491019; bh=D2lUjQA6Cci/787OyZWCf2orNu5BvQkS25p3Ut2CAOY=;
	h=From:To:Cc:Subject:Date:From;
	b=AbV+23zpq6AWRvwC5LpvoiGZb/MiDQuiCdtXOeFfYM5OQgWfo8jmV5Hhvtto+nhxk
	 0y+UTgyYhy1lJ3sIrngvbyJ8S1arLfQztpfyp/syTDkJ3KWB6TQkyK6efJKYWtzCLM
	 mf95bZao7I4LwJv7k1R/k4dPeGQoxYomnwXARFRq/eK9+Iv+/Jky7n7/Z7CoINR9FJ
	 tYkhF7ggkWla2ARUDiqdY/OLqXYW5U0FwmxJMAUDjgdIa9aoxhGQ7wj0DVO4NiT+4M
	 /7FtJJLkOqE0iwweYOY4m+/gNo1R3WoMAWyFEER5S8s8HejxxtVqosHTVUUWYyu/7C
	 tmmArL8WlA8ng==
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] docs/misra: specify behaviour of checker for Directive 4.10
Date: Wed, 13 Nov 2024 10:43:29 +0100
Message-ID: <5939b15ad764674b7d8cece654f891e880086d54.1731490924.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C:2012 Directive 4.10 states as following: Precautions shall be
taken in order to prevent the contents of a header file being included
more than once.

This commit updates the documentation to describe the behavior defined
for the checker.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 docs/misra/rules.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 80e5e972ad..f5858b00bb 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -68,6 +68,8 @@ maintainers if you want to suggest a change.
        header file being included more than once
      - Files that are intended to be included more than once do not need to
        conform to the directive
+     - A guard identifier is reported if the same guard identifier is redefined
+       or undefined anywhere in the project
 
    * - `Dir 4.11 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_11.c>`_
      - Required
-- 
2.43.0


