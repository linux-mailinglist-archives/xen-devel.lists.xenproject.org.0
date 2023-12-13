Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39D9811FE7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 21:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654235.1020918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDVnT-0005R2-Pu; Wed, 13 Dec 2023 20:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654235.1020918; Wed, 13 Dec 2023 20:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDVnT-0005PM-NC; Wed, 13 Dec 2023 20:25:35 +0000
Received: by outflank-mailman (input) for mailman id 654235;
 Wed, 13 Dec 2023 20:25:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xXqT=HY=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1rDVnS-0005PG-TV
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 20:25:35 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.217]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c20cdb9f-99f5-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 21:25:30 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 49.10.0 AUTH)
 with ESMTPSA id Lf46f5zBDKPIVoW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 13 Dec 2023 21:25:18 +0100 (CET)
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
X-Inumbo-ID: c20cdb9f-99f5-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1702499118; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=eJYSoEyEYPGFEQk5Hfn+Jt/Bj38n6y4/XuC2xi4mE2EwV1CPuBGwQi97LnC63og2xP
    VgG4UGfB3iM3QTbSstku+aRGpn64X6HL6kyuaazhQVn9CyRgFQNDCxvVPY3H1H0zWtvk
    piScUzyZfcQZ27+BwgRvup6kMK4T57LUmx3ZbA5K24ZRHlW9ey+/gDb10N3IiBtIzFG9
    G9MfDw0nxhmaYA6+l7h9QcMCYrbXH8oNVir/wVySEnjhgw7TUZ7ZbLWpPUhbArkSIzJW
    6gZOxXm5qGa+VRj/REXwW0AIC+zl5lhx9zDSDL4PLW6N2taZfhRgmxJ/Ic0pEDGrnNl4
    JHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1702499118;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=aihsKihu5+hUBwS9eykBjqgunbBXjHfCPCWVjd/6nIQ=;
    b=i0uGQHvOs98QX+iL8GLliFTQpjZioi0T9t+/khPvmaZi841xxl8J9r+/cTF/rStRLy
    FAw56ZFdE0K+gWcvXUp3F4Kj28UkmLQXaKIozCRiVLmVd7nGMqK3HDH3LEZm+Cyi+eEz
    pzjqubgD0cKrdW0ggga78dxn06swBh1J8JAR4BwWFGHD+UVmyRBzqw6b07Ciz95kY5U7
    1mVPkOUCf3xPLBCWe5kfB3czrKQYGyZMNJG62rFw2auQ3UtvtJ7WHRJN6B9UuNPxfPrA
    zFq8snZ3mKQhq1C0fS3/M1uZ/whqH4j0oI9G9/9FY5GuqA9CGCweiAvWx7N3eiNoVACe
    yhnA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1702499118;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=aihsKihu5+hUBwS9eykBjqgunbBXjHfCPCWVjd/6nIQ=;
    b=CjuKaisyMywOYl+F4zLbtYleS2MPHzXIyQgcZ8+cCsw6wfnTugILKW5Q8lqQ1Y/sQj
    pGHJ7tbIz91rlERYx81zBQOr4MTh1wt3EXBSzAJuFs1UcOTC300QRHh+B/pGhuLbsdbN
    9f/3W3i8yue6cKf8YSg0sRXHbB26r6QQLpibSGrVU3kgf5dMvmdgUNTndi2V3KspYNW/
    I6HdaIvqcvMNKP803DZhzjVk1pB4iwThiczmsEEiS9If3NsQdfXhuKeVZ+I4Lpu0iAvm
    /Un8IWNaCXNsFDo+et1qm6V68bCbtEc2YScxnuMjrGgea/BRWzAeKVNEjTDhWqdd/jXR
    PNhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1702499118;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=aihsKihu5+hUBwS9eykBjqgunbBXjHfCPCWVjd/6nIQ=;
    b=xvC8gT01p7HxNVuEwipIdylYiiIYGU7kAJxIvJeA3DklzoUqGqTNOLS3+Yiz3Uraaq
    zx/GrXq4GicOx8EheVCQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4x+Vn7GsstksPvyZyXfN0fdx3Mvj7f2syT56WA"
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: remove bin86/dev86 from tumbleweed image
Date: Wed, 13 Dec 2023 21:25:15 +0100
Message-Id: <20231213202515.30587-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

https://build.opensuse.org/request/show/1126240

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/suse/opensuse-tumbleweed.dockerfile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 38f6fda2ff..f00e03eda7 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -11,13 +11,11 @@ RUN zypper ref && zypper dup -y --no-recommends
 RUN zypper install -y --no-recommends \
         acpica \
         bc \
-        bin86 \
         bison \
         bzip2 \
         checkpolicy \
         clang \
         cmake \
-        dev86 \
         diffutils \
         discount \
         flex \

