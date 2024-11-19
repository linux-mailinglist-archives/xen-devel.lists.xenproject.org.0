Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 502919D2333
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 11:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839867.1255649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLGg-0002I8-8r; Tue, 19 Nov 2024 10:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839867.1255649; Tue, 19 Nov 2024 10:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLGg-0002G7-6I; Tue, 19 Nov 2024 10:15:34 +0000
Received: by outflank-mailman (input) for mailman id 839867;
 Tue, 19 Nov 2024 10:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3AKc=SO=bounce.vates.tech=bounce-md_30504962.673c653f.v1-ef929aefa4224d2d90be6618ac4f5e6d@srs-se1.protection.inumbo.net>)
 id 1tDLGf-0002Fv-8z
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 10:15:33 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 333df21e-a65f-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 11:15:29 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4Xt0k757nGz3sPRrF
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 10:15:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ef929aefa4224d2d90be6618ac4f5e6d; Tue, 19 Nov 2024 10:15:27 +0000
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
X-Inumbo-ID: 333df21e-a65f-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjMzM2RmMjFlLWE2NWYtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDExMzI5LjQxODczNSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2M2NTNmLnYxLWVmOTI5YWVmYTQyMjRkMmQ5MGJlNjYxOGFjNGY1ZTZkQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732011327; x=1732271827;
	bh=RIWpJ0A3VZ4bOVwkV3aBkXgnRBJhre0EC0Obc/Sc5m4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=c4ubLgvBc6kOozdSnOrwV07z33h0cuWIzwD9WKO8I8R9zw2ivje8XocrtTLPhOMua
	 OKle6DW7nUpffV3w/TKDJ6ETpCOOJFwPvi78A1zbr+a7/k6B6KQGu58kw+pbyOH2XO
	 WWpEw/iPjtZx8Zl3eJe+XHhdWuQOpfimFhPw4HY80wkQ8JF1/xn7ZIv1qGBdxnW6te
	 Dsu5rANJWXjWT/AeKV5uWbDhsKxUTLTWmPwtqa8ihRJMHa6EHE+0zJuv9Uixo+UAd8
	 CysuLKiAh9HWL0F5i+cdXt5OHXL3fMaTADmRuuenFOSsYNukcmdplPt9I9SwTZCE7p
	 z3iRSaPEICXww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732011327; x=1732271827; i=anthony.perard@vates.tech;
	bh=RIWpJ0A3VZ4bOVwkV3aBkXgnRBJhre0EC0Obc/Sc5m4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=v4TfUeSewpovWRJY9AkRjbvM+LJKx4gZEzVUakhkA244T/hIRlaNDjX4fcy5kQbW9
	 GqYAwpunwwbCpfFZ5hBaCIpmLd5OAWKqsDIMFArutX1o8dY7XdXK9A2/QV0ZYixDZJ
	 JhXXWfFI8QcUsf68xmrEWvrsPRZ7ImJ0Xis20zbWcU4wB7/VSw5lj2XD6ywPjugeMD
	 HpSAC406rhLP9ZgUzaJCQl8Qe1TI2gHhN7W7lMkKQPOyCmGbGVx9nDliv9txKAP9mX
	 IgQSy7WBMZu25iCq2KzBQkWd6lu876278v+LuwQ4MNKzgcNzJItjj5ok139S/dwGdt
	 M4VByl8HgwAww==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=201/3]=20CI:=20Remove=20deprecated=20"only:variables"=20in=20favor=20of=20"rules:if"?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732011326475
To: xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Stefano Stabellini" <sstabellini@kernel.org>, "Doug Goldstein" <cardoe@cardoe.com>
Message-Id: <20241119101449.49747-2-anthony.perard@vates.tech>
In-Reply-To: <20241119101449.49747-1-anthony.perard@vates.tech>
References: <20241119101449.49747-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ef929aefa4224d2d90be6618ac4f5e6d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241119:md
Date: Tue, 19 Nov 2024 10:15:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Also, this prevent using "rules", like in the ".test-jobs-common"
template.

https://docs.gitlab.com/ee/ci/yaml/#only--except

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/gitlab-ci/test.yaml | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index f5dd4de757..ab5c8be0cd 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -98,9 +98,8 @@
       - '*.log'
       - '*.dtb'
     when: always
-  only:
-    variables:
-      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+  rules:
+    - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
   tags:
     - xilinx
 
@@ -117,9 +116,8 @@
       - smoke.serial
       - '*.log'
     when: always
-  only:
-    variables:
-      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+  rules:
+    - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
   tags:
     - xilinx
 
@@ -137,9 +135,8 @@
       - smoke.serial
       - '*.log'
     when: always
-  only:
-    variables:
-      - $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+  rules:
+    - if: $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
   tags:
     - qubes-hw2
 
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

