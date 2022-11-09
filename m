Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F61622822
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 11:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440811.695012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osi3d-0003PK-Es; Wed, 09 Nov 2022 10:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440811.695012; Wed, 09 Nov 2022 10:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osi3d-0003Ms-C2; Wed, 09 Nov 2022 10:11:45 +0000
Received: by outflank-mailman (input) for mailman id 440811;
 Wed, 09 Nov 2022 10:11:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opqx=3J=citrix.com=prvs=305fc5d8a=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osi3c-0003Mj-2J
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 10:11:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5cc7891-6016-11ed-8fd2-01056ac49cbb;
 Wed, 09 Nov 2022 11:10:45 +0100 (CET)
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
X-Inumbo-ID: c5cc7891-6016-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667988702;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3MZ1/1SwF++hAOysPOIQibF28l1BFKEwuznY42N84NU=;
  b=El/tO3p1/vUHW7Lfz1cDcgC2V0tzRC5fDxHut6E0WYEOJJhow/bID02W
   FspG0+nCX2csSzfe/uySGupftLiHJlP/gbJ7un4nx8ArhwD4ieevIlmKT
   6r87IDEWs4hegHvyJV1VQyvrJ1UPZKw1xOKl6MEMJnfRbBiASrS4BPgjt
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84459890
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N2li56KJt9msVDFsFE+Ry5UlxSXFcZb7ZxGr2PjKsXjdYENS3j0Gy
 GAXDG2Fb6qLajbyfYokPNi/8UgA6JTTn98yTwFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wRvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4tHG1Rz
 +MaCAkuRTPa2+G23oDiTNlz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLozkPmpgD/jdCdfq3qepLYt4niVxwt0uFToGIqJJoHbFZQN9qqej
 kLYz33eDBhECOKG8wCg8X6Go/HCnCyuDer+E5Xnr6U30TV/3Fc7CgASVFa9iem0jAi5Qd03A
 1MQ0jojq+417kPDZsLmQxSyrXqAvxgdc9ldCes37EeK0KW8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19L2ZsDezMig9NnIZaGkPSg5t3jX4iNht1FSVFI8lSfPryI2ucd3t/
 9yUhHIji6opkswr7oaQ3gmbgDKylMHPfhFgs207QVmZxg9+YYekYamh5l7a8etMIe6lc7WRg
 JQXs5PAtb5TVPlhgATIGbxQR+/xu55pJRWG2TZS848dGyNBEpJJVaRZ+3lAKUhgKa7okhe5M
 RaI6Wu9CHK+VUZGjJObgarrVazGLoC6T7wJs8w4ifIfCqWdjCfdoElTibe4hggAUCEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1mH9vnjmOHcGik0zPPV+iiJm9EOltDbdzRrphsPPsTPv9r
 76zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5U/SwNCSyI4cFwc5wj5m+x8KtI+xPkMyo8lP
 BiVAydl9bY2vlWfQS3iV5ypQOqHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:kCvC9aiTNVT7lMhxvd7eR8eryXBQXtQji2hC6mlwRA09TySZ//
 rOoB19726TtN9xYgBGpTnuAtjifZqxz/FICOoqTNOftWvdyQmVxehZhOOIqVCNJ8SXzJ8l6U
 4KSchD4bPLY2SS9fyKhTWFLw==
X-IronPort-AV: E=Sophos;i="5.96,150,1665460800"; 
   d="scan'208";a="84459890"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] docs/process/sending-patches.pandoc: add a tip about using --trailer to collect Acked-by tags
Date: Wed, 9 Nov 2022 10:11:14 +0000
Message-ID: <44a0555f37251e57f0943ed4416013f047da40fb.1667988674.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This can be useful when preparing a series for resend and want to
collect any Acked-by/etc. tags from the mailing list.
It avoids duplicate entries, and puts the tag in the correct place
(even if the commit has a --- line), and you get to see the result
before committing (unless you use --no-edit).

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 docs/process/sending-patches.pandoc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
index 2e74c3b57e..90ac7b6cf1 100644
--- a/docs/process/sending-patches.pandoc
+++ b/docs/process/sending-patches.pandoc
@@ -72,6 +72,12 @@ after the patch was written.
 Do not split a tag across multiple lines, tags are exempt from the
 "wrap at 75 columns" rule in order to simplify parsing scripts.
 
+Tags can be added on the command-line in the appropriate place by using
+the `--trailer` flag (on a recent enough version of git), e.g.:
+```
+git commit --amend --trailer 'Acked-by: Maintainer <maintainer@example.com>'
+```
+
 ### Origin:
 
 Xen has inherited some source files from other open source projects. In case
-- 
2.34.1


