Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A752AC1D8D
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 09:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995311.1377801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMhx-0002Hs-67; Fri, 23 May 2025 07:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995311.1377801; Fri, 23 May 2025 07:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMhx-0002FD-1s; Fri, 23 May 2025 07:20:45 +0000
Received: by outflank-mailman (input) for mailman id 995311;
 Fri, 23 May 2025 07:20:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jXdV=YH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uIMhv-0000jR-6G
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 07:20:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f517023-37a6-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 09:20:42 +0200 (CEST)
Received: from nico.tail79467d.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 2BDED4EE8F7B;
 Fri, 23 May 2025 09:20:39 +0200 (CEST)
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
X-Inumbo-ID: 6f517023-37a6-11f0-a2fb-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1747984841;
	b=i/sOJpfDGh7JbbQoE74t8J9ZiD5r29g6xwihvWFPFr6MbHETFsRP8qTg4Dyw5EaUXYGq
	 amstJF30T5FNysfRquw9aLicRo4hm2/BSMWyZ5S+4x5BbhByyFVLo1VjBFSnWwhB3vMsp
	 Pgyr4xfQcpi0Bpt8ojLOXChyFB7OD6i8CAzRVNWdOar5bRsWtynSa7ex3Cks1i+5DW31E
	 xfMTVyjhyWLBCZaDjxZnsXFEJheUd6Prne4fkYRzfdjBN08kpTN/CCPgDRWEIjzlGyb4H
	 Bz77YvK+dJ6lINaaqp0PBRJpCtJT5qI5N/cfvjUjlLWcy6IdGwhiBTsmVTDyu0AAZEINp
	 CVyn/JwEDt6kK3TJs8Lrv2QYyO94wQZzh4GzvR4hMmuMDiCrVO1EFRdgtQe1k3HTe9/g2
	 jvVALq1LpTgjaddDx9GOHUkSbz3fSSE7C7ksstN9198dturS4WLMyKDHERbVQiKIJJvnu
	 P1kHSWhKGay0HvGPi9uNS68t+lPArNjv5d+IpL9tEpyMlezRg61Iu5OAi5mt6x26aePag
	 mSvwPBjQlUjjRho2Zupb94sEJx+0EvQGG+ylUAxRHQvt9iV+UNSyBqvzPmi8aUeJBzXdO
	 RHx0QgfV/Kbg8sR8m1II6A9xgxCUKZVQRF3EowfxnoHrJbXPtlzgZBZuqKCSjW0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1747984841;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YPZz2jEAMMC36xD6hgsUyWuFj29BV8c7vMGDII9rtok=;
	b=4zaQy2JYxqeUuZ85eHei8qSQD+2CzNSAHbpQzgi9z//kbnMlPMPIh/NKnfsW8QO7ks0R
	 QHarQaskrY4WW4HihvxsteeAHOQq7/HVJ8NBqoIGeIGk01b4V/aavPnd0hZToxC+rX6Nk
	 +r9M2kcvpg15jSTmiFjYN4TVhrJlgE80BgCnXgq6WxjeBFwzAExj8nawWCHQYDn1W+D0m
	 ecwSwP5MWE9S0xFUWK52z38E7pjvTdT6lBuo9KmxZHQgj1SHrcs+YQS+fNE+tRiCF/Skv
	 wG+qmHmFpIxJskYq4uwunYA156WaSvIr1vEeLG9RO9zi029ZYoeFc0tCSDNU3Ab5YtlSi
	 VuE1GdBFHxntRP/JIhjSDaJM2YmPOcvzm5abDbHO6VCyPSShnsyqOHh4thD3cGfshNTeM
	 FFr/koqqwfA5WWqgsk78RgQEC8sIPCoh00iSH3aj8qirgk/HIKP4zvX3B9Zyz7lInKQ2/
	 pDQtbDo3LTLC4IY5Oj5jsORhn7ySvvsAOg6eZN8AfoJeUVXFENxPZqcMJAyYgejnrEBdu
	 lBeDWZ/E6a/A+lcZZgBagXTkaRVaRyVGFFhstXEIJgFkZKHZXQQ0Guc9ULnD6qX5NXRnd
	 pVpLVBf/YYNeLx7pEFV3x5Mrm7//THBl5Nyq/8YPwqbdZ1NdDDkZ+CUspCJ7PN4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1747984841; bh=76iPtDtJiqJQwHtwd12Grf/gpmigtPd82qm3J8cUx08=;
	h=From:To:Cc:Subject:Date:From;
	b=XtuGPOYm/VFcNoXC6HMoT8WkdbMWi291e3D49h+Yi6F8ASDyCj6yjluzNt3dW04yO
	 3IUvcIQGw0rrke/D1W6Cln/s33cEQrIoeRcLWDbRD1jtXnwVFQUeA3xgrcz4Vft2UK
	 EBDy/zBoApVrhp9UuoFw0B3ujwcBpZVL5yzgIZw5EZTt+AmjmLtALkZyvYkfMoQTSJ
	 xbAMfp8JLACetaZn+BeGwHNY07k6EvBehAzTClOK84fW+8/+hk6YG/FVgvuyj8mmw/
	 wMfZwqKn38EjjdoQyVBKJqvcKc+4cTL3CsBIBStSnr9uV/RLiqyLwacHusZ6K1QcX2
	 WJ9L1w3Tm14Fw==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] eclair: allow and document use of GCC extension for label addresses
Date: Fri, 23 May 2025 09:20:35 +0200
Message-ID: <d9dbce35d6857f79a21b68e4edd45f0febe3d3c9.1747984747.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
This fixes the CI error for R1.1 on this patch that stems from using the label inside asm goto:
https://lore.kernel.org/xen-devel/20250521143658.312514-1-andrew.cooper3@citrix.com/
---
 automation/eclair_analysis/ECLAIR/toolchain.ecl | 5 +++++
 docs/misra/C-language-toolchain.rst             | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
index 8ebf9f132cf2..842f8377e561 100644
--- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
+++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
@@ -108,6 +108,11 @@ volatile"
 -config=STD.funojptr,behavior+={c99,GCC_X86_64,specified}
 -doc_end
 
+-doc_begin="See section \"6.3 Labels as Values\" of "GCC_MANUAL"."
+-config=STD.adrslabl,behavior={c99,GCC_ARM64,specified}
+-config=STD.adrslabl,behavior={c99,GCC_X86_64,specified}
+-doc_end
+
 -doc_begin="
     ext_c_missing_varargs_arg: see Section \"6.21 Macros with a Variable Number of Arguments\" of "GCC_MANUAL".
     ext_enum_value_not_int: non-documented GCC extension.
diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index 3a1ce651d7fd..cb81f5c09872 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -214,6 +214,10 @@ The table columns are as follows:
      - All architectures
      - See Section "4.5 Integers" of GCC_MANUAL.
 
+   * - Taking the address of a label
+     - All architectures
+     - See Section "6.3 Labels as Values" of GCC_MANUAL.
+
 Translation Limits
 __________________
 
-- 
2.43.0


