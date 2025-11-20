Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 523ACC7616B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 20:33:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167943.1494130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMAPG-0002CS-Az; Thu, 20 Nov 2025 19:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167943.1494130; Thu, 20 Nov 2025 19:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMAPG-0002Ad-72; Thu, 20 Nov 2025 19:33:26 +0000
Received: by outflank-mailman (input) for mailman id 1167943;
 Thu, 20 Nov 2025 19:33:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zJ8u=54=gmail.com=nicola.vetrini@bugseng.com>)
 id 1vMAPE-0001hr-4p
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 19:33:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c726cf6b-c647-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 20:33:23 +0100 (CET)
Received: from nico-ideapad (93-44-185-120.ip98.fastwebnet.it [93.44.185.120])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 50B454EEBF06;
 Thu, 20 Nov 2025 20:33:22 +0100 (CET)
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
X-Inumbo-ID: c726cf6b-c647-11f0-9d18-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.44.185.120
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1763667203;
	b=GrDXwHjA3XSgMz0xYcqYjAuYcdFmjFi+pkddUjx+bblxNBA5qPsyeUq5fkRStd6/a0oL
	 lgpXoNA2HCyWMlTacHLDNMDmSDU4pGrpPkNk78DFYspd7sqrNjS/jydy5Zkpyf/TErwW3
	 sOSXU24rpTK3s7jykz1+U9QJ8PiFJysElb/h/Lz6YkNQjzXLBEBGAjwxI+7/ioBQM0qly
	 RzmxNI9Ecgywl4Tm431GnM8l3PzRfs2OLm/RUB2HzGP4lr+1UKLGouGIIth8wYFp9/QC3
	 b+iCbIxsUmJIF3uMCfOTl0l9E4YjFwxSTNJ/4Q3RXZIBdyTI8Sybg1NMJ28yiPSstFcIq
	 InbOhk1kdC0f1I/eAAe0G4sssikXU/CVQvHTSWbUd/g0RzB50FkTZKM42iR+ir7cZ4jLh
	 nIMkoiBeZ8DTRUAA1cGuqqpQyZ9z+o03igm/Iaq1kbX4/PbTaGeQ44/JdEjv4bR/+6Qka
	 iiFpQpw93QTdCZXaVOW9Dc+djqdULba2/ob7LLsEsdNU1hyGKQD0cRv3U/tbJluOnzqIi
	 TU9XITGu0sKI7cL5pQ5EUN8LoQdU9OtYaNue3mqgycRVTBGZmPnCbo99rNMZxRSkvN8Ih
	 oiqP9VeOtXNIibPC2EEjEn2kczNmroXwdS1OnCC9yg5sex0jF+RjeorcrTSlWX0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1763667203;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p+U0aUwybu1dMebZr+nA1KTxVn7l5e18ZGuPyuhBnFA=;
	b=pPECHZBWjbPJigRcydEutV7RYj4MEDnh2ERiWqzWS0w0R4l9TreD8y2/2iVddA6Mphs9
	 DsV5cLk+JL7r7Eny5jT2IgmMGZuxnOx7cAplIjyolFYf7xCvKda5JBWc68hRhcjqJ4xwe
	 vL4EDdzTRuphnDSBYfoMOjooaumNQ/jaKx/sC/rG6b85qmTzWaDciKLONGd8wmMpc8X95
	 JT3XFxcGzGDYT7/0FMp+l1Cy+uDCrMdNWLpOHwwpwNRpwy0tVN7H/OttCx2gpVrsCbw9w
	 9ANAKRrBF+YIe/bIdeWbmm07XL3913iGOiQVzUrg9KYShBVh0iX/B3W90VQGML29nBvhy
	 xLBnGpw05wVBcz89WdheVPUvgiNJxPSQ8N/1rXY1EgCF3n6dftPpGImwZ/vXYx2/Q/CRq
	 tiap80D93zrVinPOr8TfUuV4gIExh2Y7T7WavwA36v7g5QUDfIY/qHaRD1K08ShhuBzyQ
	 UhpJX4H4USCA6C74Qs1Eez7nhwPNQ7dj8rIk7pkxZMmN4qBOFhCsqovcHKSBQ8wpdGzej
	 dyt/I+EaHW5qSDS1sS2CqAhlzRxSvcQDt1v7vN5Ing5d4/Jb5U4WmgrTaxwk5yOKcMCyn
	 /PyYGFNuBTHZN0Fljh+UV0kdv6R2gnh68LsKrnvvKATCcirY+Jx4G8Ag7/mu1/Y=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.44.185.120
From: Nicola Vetrini <nicola.vetrini@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	sstabellini@kernel.org,
	Nicola Vetrini <nicola.vetrini@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/4] xen/param: address violation of MISRA C Rule 20.7
Date: Thu, 20 Nov 2025 20:32:55 +0100
Message-ID: <bbbe135e699e8589c36555f02e208edff64ef76c.1763642993.git.nicola.vetrini@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1763642993.git.nicola.vetrini@gmail.com>
References: <cover.1763642993.git.nicola.vetrini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rule states: Expressions resulting from the expansion of
macro parameters shall be enclosed in parentheses.

Add parentheses in the defition of `custom_runtime_var_sz' to
address the violations.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
---
 xen/include/xen/param.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index 1bdbab34ab..f5a2189400 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -102,8 +102,8 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
 
 #define custom_runtime_set_var_sz(parfs, var, sz) \
     { \
-        (parfs)->hypfs.u.content = var; \
-        (parfs)->hypfs.e.max_size = sz; \
+        (parfs)->hypfs.u.content = (var); \
+        (parfs)->hypfs.e.max_size = (sz); \
         (parfs)->hypfs.e.size = strlen(var) + 1; \
     }
 #define custom_runtime_set_var(parfs, var) \
-- 
2.51.2


