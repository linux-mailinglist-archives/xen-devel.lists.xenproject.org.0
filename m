Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0E16F4ADB
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 22:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528806.822418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptwFp-00037B-FZ; Tue, 02 May 2023 20:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528806.822418; Tue, 02 May 2023 20:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptwFp-00034o-Bv; Tue, 02 May 2023 20:05:41 +0000
Received: by outflank-mailman (input) for mailman id 528806;
 Tue, 02 May 2023 20:05:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5QU=AX=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1ptwFo-00034i-E3
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 20:05:40 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.160]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5024652-e924-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 22:05:38 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz42K5TeWg
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 2 May 2023 22:05:29 +0200 (CEST)
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
X-Inumbo-ID: b5024652-e924-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683057929; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=cG8KjmyrRrTYB5GwSRIc8LwpK66j62bJNlj/2huPJn8NfiXUGLJafuQMCWyQry7VpL
    jsiu4rKFyCiqsQhvULmKEPR2drVTwIlcbcfRqc8uJjiWrHxKkLy+iPfyRcUz6pGKoK6x
    LctszF9rh0ZTALpbHTLgLoN52mjhartSdrK+bZKpVVvkxeKzO8eUt25tXc3CVuMKg832
    WSmu26Xq+fzWNI04vHMr1jOj7IgOmDqSrrXbeCDojL5K+nw1Ac0Wijjxy4kJvElFaPSh
    XedWXrpuA/lazArBvSlvfkfxLFY1W5oeVw4rBp7FxLJUQ6mr1p+4AsQav0qv/sfNQzbO
    LTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683057929;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Jcpwk8O1aNbRAScb4kL6cbWNb5fNbiHkZRl03EzEa2Y=;
    b=R9NQNLPDlwFbs06f7FnhVtVR0BGo0RnuNjeRbXLoxYMyQa12noGM2g2p+s73wzLRH+
    Bszkph2/uBTNc/wnIusfmGYuD7cOVSg+S8jA18RNFLXdzYrfdQkESBKlVTW5kYL/BaGS
    Z340NeHgAqYK6R63zabC4PXJknQyJ8iGQKJoWyqaqE/1JPiN8Rr0EbIxQqTbBe3r+BLr
    IDTjw0BWl2SShIWDgLOhn7Jk4ehL7OEXOHY8AYbUc2H0KeKjVP/KSv+sLvJDHgUDrdq1
    J2y8hW2qI1/nyRs3NhPq05RVajCCFZ3xnI2fc/qvJydIQzLb3SwXQ/81uoJDUayR20rx
    hPvQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683057929;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Jcpwk8O1aNbRAScb4kL6cbWNb5fNbiHkZRl03EzEa2Y=;
    b=UKZD/btOkhsmuzrQ2ax97YV/4tJajWTvblfrPjEFQne5BfdY4rKA8Cz6n6xbZ0Gdoc
    yus83LWHbtzPEX8fkj7TQy7YAnlDewoqsMElkcSFBd/aRmUc1A5UFE3HZUST+O+08IU4
    ZGaxLts0aJdg+h8X0Eijk+jo+RVM+W/rZdClZUp+yhJpG5UMbOfcLAmlcimLbJSWS1mf
    7K62KuoHrtJz9TINh3P7UT7/pslAUUfYTCp0i+pZpBGYl0NZPTssnriQva8L0hqe0lvV
    8MAjzkRlWNIlZx/+B9LDNUfIWaDcgM/MXxzwCdB/MA+wPviJFMlRbQJufLfHccx3RvPX
    hzCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683057929;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Jcpwk8O1aNbRAScb4kL6cbWNb5fNbiHkZRl03EzEa2Y=;
    b=bo7z4PjawhUc+CdXTcaWsyybfHs0y1hAbRsIzFKNpPagK/56U2ateLU4sqT2NpKRYu
    WjuNsz/pTOdiJ62akIBw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4wqVv7FZ8tH5EUSbMVU80kUr7f4QlYaI60OjHt/Q=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: remove python2 from opensuse images
Date: Tue,  2 May 2023 20:05:27 +0000
Message-Id: <20230502200527.5365-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The upcoming Leap 15.5 will come without a binary named 'python'.
Prepare the suse images for that change.

Starting with Xen 4.14 python3 can be used for build.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/suse/opensuse-leap.dockerfile       | 2 --
 automation/build/suse/opensuse-tumbleweed.dockerfile | 1 -
 2 files changed, 3 deletions(-)

diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index c7973dd6ab..79de83ac20 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -58,8 +58,6 @@ RUN zypper install -y --no-recommends \
         'pkgconfig(libpci)' \
         'pkgconfig(sdl)' \
         'pkgconfig(sdl2)' \
-        python \
-        python-devel \
         python3-devel \
         systemd-devel \
         tar \
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 7e5f22acef..abb25c8c84 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -61,7 +61,6 @@ RUN zypper install -y --no-recommends \
         'pkgconfig(libpci)' \
         'pkgconfig(sdl)' \
         'pkgconfig(sdl2)' \
-        python-devel \
         python3-devel \
         systemd-devel \
         tar \

