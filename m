Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D6BA7187F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 15:29:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927881.1330631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRk6-0003fT-85; Wed, 26 Mar 2025 14:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927881.1330631; Wed, 26 Mar 2025 14:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRk6-0003dU-4h; Wed, 26 Mar 2025 14:28:30 +0000
Received: by outflank-mailman (input) for mailman id 927881;
 Wed, 26 Mar 2025 14:28:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqsS=WN=bounce.vates.tech=bounce-md_30504962.67e40f09.v1-f857a070052347869b8ebdefd7cbb21f@srs-se1.protection.inumbo.net>)
 id 1txRk4-0003dO-OB
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 14:28:29 +0000
Received: from mail134-16.atl141.mandrillapp.com
 (mail134-16.atl141.mandrillapp.com [198.2.134.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9442196c-0a4e-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 15:28:26 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-16.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4ZN8KP1Q62zB5p4tp
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 14:28:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f857a070052347869b8ebdefd7cbb21f; Wed, 26 Mar 2025 14:28:25 +0000
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
X-Inumbo-ID: 9442196c-0a4e-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1742999305; x=1743269305;
	bh=7dH2wLHLxegE/8xdNPeYL3cu3z4Ww2xvzXDXMPsgyU4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Kbt3lLT2FIVp/CL3u942Fx/7O6NXdEv9qsMbpDL4tGmAn2gXryQutxOKJo0A8D6ZC
	 n2UFNmD11394Ig+AmUKI7I4D6TOUl18Ed8XkYIAqZ3r+p06H/8NWIS3B483NfQZjfL
	 r1qsphq1qijbmYockuLc/a7uhlMN3KfS9yp0VYefEgf/LaGLy0vKqbW2tn74saXrhE
	 jFJAvVkvnf7H0nJTQ7WvLiW6ApO1JfFLA36pRWzfabQWJm8dMKBKwED4zwtWwQRPyM
	 LT9D98rszFCM5JWB8QT35l79tTI9xehtWwcnbXdLEJtAk9fulRzea84p326M3bzw3U
	 lK3/D04N43z1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1742999305; x=1743259805; i=anthony.perard@vates.tech;
	bh=7dH2wLHLxegE/8xdNPeYL3cu3z4Ww2xvzXDXMPsgyU4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=RRY/kxc8Ju2yr8C/5EQEWFbfakp0nQWVFFZKBb0VBSvwUwTPN8eGBwMveOEX4iSgH
	 jbHcS8CNvoWd0ukZwwzMBmYYxeWfu0jBYqh/CD/szyJi1HbIB05FfGtpM1CNQ+clYA
	 mZhZbBHfr2ilfnJDAwr6lxGKQra4VWJd3Gyf18wijOvBGQAw2Vw8Dk2YCScq7bTwgW
	 qbyo51rue/VXm98YioLpjHy/ninqeMBdUNTQFXDUSm5LUkUCvxMo12ic3V4EG7092g
	 9d7d8LsmUuUpIiveYn6HnpMmUkvbRtDJBMl2ktF7Sj7jCb/RrQe7aIae6hEZg7sM6s
	 9P7pJDFZ92WRg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH]=20automation:=20Avoid=20changing=20source=20files=20for=20randconfig=20tests?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1742999304138
To: xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <20250326142754.5441-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f857a070052347869b8ebdefd7cbb21f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250326:md
Date: Wed, 26 Mar 2025 14:28:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

We should avoid changing files from the source tree if we don't intend
to commit the result.

We don't really need to check if $EXTRA_FIXED_RANDCONFIG is empty so
add it to the temporary file in all cases.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/scripts/build | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 522efe774e..8a3b8fb6b2 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -12,12 +12,12 @@ $cc --version
 # random config or default config
 if [[ "${RANDCONFIG}" == "y" ]]; then
 
-    # Append job-specific fixed configuration
-    if [[ -n "${EXTRA_FIXED_RANDCONFIG}" ]]; then
-        echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/tools/kconfig/allrandom.config
-    fi
+    cp -f xen/tools/kconfig/allrandom.config xen/allrandom.config.tmp
 
-    make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
+    # Append job-specific fixed configuration
+    echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/allrandom.config.tmp
+
+    make -j$(nproc) -C xen KCONFIG_ALLCONFIG=allrandom.config.tmp randconfig
 
     # RANDCONFIG implies HYPERVISOR_ONLY
     HYPERVISOR_ONLY="y"
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

