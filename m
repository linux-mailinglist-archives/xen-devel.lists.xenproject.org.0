Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661F065C7DC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 21:10:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470708.730328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCnc2-0006Gz-4o; Tue, 03 Jan 2023 20:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470708.730328; Tue, 03 Jan 2023 20:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCnc1-00069t-Th; Tue, 03 Jan 2023 20:10:17 +0000
Received: by outflank-mailman (input) for mailman id 470708;
 Tue, 03 Jan 2023 20:10:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oadl=5A=citrix.com=prvs=36087fe06=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pCnc1-0004E1-0Y
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 20:10:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a33a766e-8ba2-11ed-91b6-6bf2151ebd3b;
 Tue, 03 Jan 2023 21:10:16 +0100 (CET)
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
X-Inumbo-ID: a33a766e-8ba2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672776616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=VaSW3H4jlJ3dv04QHJz+xn4RvXE21Emi7q8vmojUlYQ=;
  b=K1YvjnCQ8K5mZB3i6BUWM59Lo5NSp758Kd+vknByeD0K4ogC4iuu17bL
   upcLJJ5vpZkSGWggLMcQqkBF6fFNiV6fWLcqhqoreGYC/MyHlxTUEhgiJ
   4g2bsSQgyifm0fmPYe02LPTvlPcElLoA4r/mtLQ4gJJ4A5ifNwlKYRPIP
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 89980396
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zISvBajSqRhsWFeCDFxR0A02X161VhAKZh0ujC45NGQN5FlHY01je
 htvCmrXPqyPamD1fIokPdy2pB4AscXQmtFmSFE9/iphRXsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6sT5QeFzyV94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQmGGoANAu8uti4wbvhYddctp56dcj0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthbJ9
 zKepDWnav0cHPPFjhSX0UOMvN3esjP2c6MdOf6etdc/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGr7U29UGtZsnwWVu/unHslgUHR9NaHuk+6QeM4qnZ+QCUAi4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9D0UPeCsFRgst+MT4rcc4iRenczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV/5uLp12dmA2RnJbIR1Qe2DXnBDv87xwsMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hz3oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9/y/DZg4jfIUOPCdkTNrGwkwDXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgmjmMGsirn0z+jer2iJuppVAtaQLmUwzExPnc/FW9H
 yh3baNmNCmzoMWhO3KKoOb/3HgBLGQhBICelvG7gtWre1I8cEl4Uq+5/F/UU9A990ijvruSr
 y7Vt44x4AaXuEAr3i3TNyk7MOq+AMYgxZ/5VAR1VWuVN7EYSd7HxM8im1EfJNHLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:oznK46q+t3YFZKpl/7t2pyQaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.96,297,1665460800"; 
   d="scan'208";a="89980396"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH 1/4] public/version: Change xen_feature_info to have a fixed size
Date: Tue, 3 Jan 2023 20:09:40 +0000
Message-ID: <20230103200943.5801-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230103200943.5801-1-andrew.cooper3@citrix.com>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This is technically an ABI change, but Xen doesn't operate in any environment
where "unsigned int" is differnet to uint32_t, so switch to the explicit form.
This avoids the need to derive (identical) compat logic for handling the
subop.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 xen/include/public/version.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/version.h b/xen/include/public/version.h
index 9c78b4f3b6a4..0ff8bd9077c6 100644
--- a/xen/include/public/version.h
+++ b/xen/include/public/version.h
@@ -50,7 +50,7 @@ typedef struct xen_platform_parameters xen_platform_parameters_t;
 
 #define XENVER_get_features 6
 struct xen_feature_info {
-    unsigned int submap_idx;    /* IN: which 32-bit submap to return */
+    uint32_t     submap_idx;    /* IN: which 32-bit submap to return */
     uint32_t     submap;        /* OUT: 32-bit submap */
 };
 typedef struct xen_feature_info xen_feature_info_t;
-- 
2.11.0


