Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B82A12362
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:02:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872360.1283326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY25i-00077F-CO; Wed, 15 Jan 2025 12:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872360.1283326; Wed, 15 Jan 2025 12:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY25i-00072L-8n; Wed, 15 Jan 2025 12:01:46 +0000
Received: by outflank-mailman (input) for mailman id 872360;
 Wed, 15 Jan 2025 12:01:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dV/=UH=bounce.vates.tech=bounce-md_30504962.6787a3a6.v1-459e1497e09c44cfaf7939bcbed7c19c@srs-se1.protection.inumbo.net>)
 id 1tY25g-0006sC-VV
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:01:44 +0000
Received: from mail178-22.suw51.mandrillapp.com
 (mail178-22.suw51.mandrillapp.com [198.2.178.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cad6df2-d338-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 13:01:44 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-22.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YY4NR08QSzGlswbx
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 12:01:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 459e1497e09c44cfaf7939bcbed7c19c; Wed, 15 Jan 2025 12:01:42 +0000
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
X-Inumbo-ID: 7cad6df2-d338-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736942503; x=1737203003;
	bh=SJZqpLVK5lRKoNHTtQYPQ46S9ECIypf9UDo76kpZLus=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mw6kFFBnMGCWsg0ygL6EDAnUpoS911v5IahgLuoMyUiHeN8KU2YWbeBWQku4vahgq
	 +wUNpDznywc5LD66Eyax1m5mL7zuygjBbquttnG5T5grCXldAQCektd462M0r1YWob
	 NUYS7RyXvEHXEtFAqezYTsSKkv6TFkaBt1mAseT2SE6qP1dG4v1AfX+M1thZgNN4EG
	 UMkTwpKUE/uHP02XHIE4+2tzuyULcSWMJXkcN5T9WIUAFmMoB/eQIMFxLQ1DKbO3IU
	 59Etup7c+Hthgmrb4tfYcmap6xdarLLVpabntXEN5AK1kSXonCI10vBhPP9+YYk24s
	 Mo2/902lBieSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736942503; x=1737203003; i=yann.dirson@vates.tech;
	bh=SJZqpLVK5lRKoNHTtQYPQ46S9ECIypf9UDo76kpZLus=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fWzAbwF+vGT9aomHUOP1oRKcYAKKs4I+z3L/ISfVQm5wnW7ndrOdKI2E6NKZsWwSh
	 qM6ZG+Qernbb8/npQmlSkqqm4gLKljPEEJcsNjIgtjFbTp9WNbGqjHI8USzeb3hbCH
	 2EZlxB+maCOtv3j8Ewwc0WdiWlhNSigCsoGTPqhfviQRAMuiCepHAGt+c2Mn3xtdyY
	 kNSDsssINdKTbKRuSEq3CnIvJgA9YUfLvndICVItetpW2U9Xoh+Uz2Iis2P13IWOk4
	 KrBK1tJee/P0y6ey22Dt+ngXLJZMRfx/JbDaNHRRqEw+1WFwW5uiEgHswnV5O32j6K
	 FjClJgDbzLpvw==
From: "Yann Dirson" <yann.dirson@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=202/2]=20docs/sphinx:=20gitignore=20generated=20files?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736942499879
To: xen-devel@lists.xenproject.org
Cc: "Yann Dirson" <yann.dirson@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <cc6e4e8e5fe08c7b4bb183535b7e302bfba41058.1736941628.git.yann.dirson@vates.tech>
In-Reply-To: <cover.1736941628.git.yann.dirson@vates.tech>
References: <cover.1736941628.git.yann.dirson@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.459e1497e09c44cfaf7939bcbed7c19c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250115:md
Date: Wed, 15 Jan 2025 12:01:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Yann Dirson <yann.dirson@vates.tech>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 25484a8fd8..404590c36a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -62,6 +62,7 @@ docs/man5/
 docs/man7/
 docs/man8/
 docs/pdf/
+docs/sphinx/
 docs/txt/
 extras/
 install/*
-- 
2.39.5



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

