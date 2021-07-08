Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275473C14BE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 15:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153144.282933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1UWc-0002JP-Ck; Thu, 08 Jul 2021 13:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153144.282933; Thu, 08 Jul 2021 13:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1UWc-0002Gl-9E; Thu, 08 Jul 2021 13:57:10 +0000
Received: by outflank-mailman (input) for mailman id 153144;
 Thu, 08 Jul 2021 13:57:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Di/c=MA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1UWb-0002Gd-2h
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 13:57:09 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.221])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 490ca520-40da-4b9f-9c72-899f7228d3d8;
 Thu, 08 Jul 2021 13:57:07 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx68Dv5aiP
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 15:57:05 +0200 (CEST)
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
X-Inumbo-ID: 490ca520-40da-4b9f-9c72-899f7228d3d8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625752626;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=GIxhBhKx+asUMGqMeQnvVvWl5d6HJxeGX4Nv35+DEH8=;
    b=gucMe4OjTK3n4Dgw8QfoCDi96ZiLqjrsdwwy4+A5QHUnrFD65lglpJiJbRF0Aapf5r
    f11n9EHVnpbSScwRC+hlGdzt0zmAu8Cmq7fivq582rD1QzAxzCrXrpQ9KF0jPyASv/py
    vVYuESIp3bF550h3e4W2bX7I6IxfD9gN8tt5cqpckf+ElPDX8VI4e7ZFDPrknOrRWmU3
    JhGwAbLWvtESipHOOKaY+DpYibh7VctJwx8mlnF1z+sS4h6dEwjUP8/vhX1cka+z9tyr
    PNfQck39agsj9LY0Ucsaxel8Xq17N8ex3Ybz1Tq9e6Popet/ibyVa5K13CqogXadgIO2
    hVGg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs3rVb2Qcstn6hLmi/A5ONQi+eEunNNoWD5g0T8"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1] automation: use zypper dup in tumbleweed dockerfile
Date: Thu,  8 Jul 2021 15:57:04 +0200
Message-Id: <20210708135704.25626-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'dup' command aligns the installed packages with the packages
found in the enabled repositories, taking the repository priorities
into account. Using this command is generally a safe thing to do.

In the context of Tumbleweed using 'dup' is essential, because package
versions might be downgraded, and package names occasionally change.
Only 'dup' will do the correct thing in such cases.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/suse/opensuse-tumbleweed.dockerfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index a33ab0d870..3965e7f9cd 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -7,7 +7,7 @@ ENV USER root
 RUN mkdir /build
 WORKDIR /build
 
-RUN zypper ref && zypper up -y --no-recommends
+RUN zypper ref && zypper dup -y --no-recommends
 RUN zypper install -y --no-recommends \
         acpica \
         bc \

