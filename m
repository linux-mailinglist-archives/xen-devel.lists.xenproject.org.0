Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B05EA123BB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:28:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872439.1283405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2V6-0006gr-Ua; Wed, 15 Jan 2025 12:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872439.1283405; Wed, 15 Jan 2025 12:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2V6-0006fM-OQ; Wed, 15 Jan 2025 12:28:00 +0000
Received: by outflank-mailman (input) for mailman id 872439;
 Wed, 15 Jan 2025 12:27:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qL8v=UH=bounce.vates.tech=bounce-md_30504962.6787a9cc.v1-b10fa3bdf01f49df8ad680db5b8dd259@srs-se1.protection.inumbo.net>)
 id 1tY2V5-0006fA-4n
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:27:59 +0000
Received: from mail178-22.suw51.mandrillapp.com
 (mail178-22.suw51.mandrillapp.com [198.2.178.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2662181e-d33c-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 13:27:57 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-22.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YY4yh3JxmzGlswDS
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 12:27:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b10fa3bdf01f49df8ad680db5b8dd259; Wed, 15 Jan 2025 12:27:56 +0000
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
X-Inumbo-ID: 2662181e-d33c-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736944076; x=1737204576;
	bh=dOOsXTP8OwZy3WWvkB1+qNS07astUnM7jHkXX3lf6hk=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HeliYDg3NKwqCdzz1gIh6RgY8SydW43TLhRFuYsGP6k/77zcfo95NQtYXoFlYOzH4
	 VEWVCr+WI6daDUOna7IgX2ZJdMUlx5+JRFKGYbfyjEVHDBpdFBCypc6VOFvT8LLLC3
	 koTzePMWy9XhIYg3HrIoftf0Ol2D9ltQRQHPwaaL/Qe6TL7G2pmUroRng+XZhBMrwD
	 i3W9uATmYauecK8pTeTYJOM8KhNbItC9x5Gf/H9wIA7gyI6EFNJJB5kNOzy3JENEOi
	 s/bi5NO2ezPfuIwvq9ap35zGyEvtj0KDPSIuLX86VhJ0kqqzT7Y5DKry9LEZ9AtLdz
	 MF4b82P0AD4jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736944076; x=1737204576; i=yann.dirson@vates.tech;
	bh=dOOsXTP8OwZy3WWvkB1+qNS07astUnM7jHkXX3lf6hk=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hqIDJuSrCTWIB8JKlo/i6oWbtFi7+3uodcHqhEpIvjvXoU4FFbPtRGwJBYVm35w4y
	 3LpFGF8XkdkTj0GDLYHvfw0IQe7O+nFzum1s5H+F9ldfpDcaLVTkMmkidl4p/lY0kd
	 1zX3mAEpidmgvCQZOq5eo1SJpIaXCrDuT8GVRZ7LffmLTd4TE3fk1Xa31uTJXXPYdR
	 CbrzUNLA/jSBVFl7fBteMCZyYnjvsuKye+R6b0KMLG05hxivnug8u4wDsY6MUx7qx5
	 YFx7bbkvSpzeL5sZgXgIy9xm9br7viaH0/uFZA0BhX+p9/LEuQzRBvSb2D+5FQfV68
	 LD7XurmtXo/Nw==
From: "Yann Dirson" <yann.dirson@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=201/3]=20docs/sphinx:=20import=20sys=20for=20error=20reporting?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736944075175
To: xen-devel@lists.xenproject.org
Cc: "Yann Dirson" <yann.dirson@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <8f3a1914d135657e5d98ac5fad6c7b0e13974bf6.1736943927.git.yann.dirson@vates.tech>
In-Reply-To: <cover.1736943927.git.yann.dirson@vates.tech>
References: <cover.1736943927.git.yann.dirson@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b10fa3bdf01f49df8ad680db5b8dd259?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250115:md
Date: Wed, 15 Jan 2025 12:27:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Yann Dirson <yann.dirson@vates.tech>
---
 docs/conf.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/conf.py b/docs/conf.py
index 5d2e979449..2fb8bafe65 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -6,6 +6,8 @@
 # For the full list of built-in configuration values, see the documentation:
 # https://www.sphinx-doc.org/en/master/usage/configuration.html
 
+import sys
+
 # -- Path setup --------------------------------------------------------------
 
 # If extensions (or modules to document with autodoc) are in another directory,
@@ -13,7 +15,6 @@
 # documentation root, use os.path.abspath to make it absolute, like shown here.
 #
 # import os
-# import sys
 # sys.path.insert(0, os.path.abspath('.'))
 
 
-- 
2.39.5



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

