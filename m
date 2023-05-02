Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E406F3D1D
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 07:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528335.821338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptiml-0004zY-2Q; Tue, 02 May 2023 05:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528335.821338; Tue, 02 May 2023 05:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptimk-0004wD-VD; Tue, 02 May 2023 05:42:46 +0000
Received: by outflank-mailman (input) for mailman id 528335;
 Tue, 02 May 2023 05:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5QU=AX=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1ptimi-0004w6-DA
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 05:42:44 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.163]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27b03e94-e8ac-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 07:42:42 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz425gTaRK
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 2 May 2023 07:42:29 +0200 (CEST)
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
X-Inumbo-ID: 27b03e94-e8ac-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683006149; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=hz4P2fYHoTAGVQJxiYF1+wg1eGX4s1T6oLiKnz3J9ijpYzkt+pHRrYGLY9KNIi5wSc
    vwk/W94SFCc5885n0F3vIjEqHm4jdMyEIuOjtwJ+Q2OzZMvSkhkaBQVZ3PZfoFFfnvj9
    yVglKOzNQ1C3ZTIrTqiU9/kQCfkwQxLqKirs/13YydPRb/4Prq4LQMCfKMZJOkzqX9cs
    vhQCqLLL4j6Ja2EtuiQ4kGvrWcd79kVJ38awktFQ68ZExXFNvhIZYzPETIXNvrYVSK6v
    FMxBeC55j1VchQhPXE5KspldBUVi/fpvbjx9Eg7HqWG6EVgkhqEltyoP6ti3RtH9qCHw
    Yw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683006149;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=GhE5fBfcNwMLwxUGqEDocKD//uK7BAVcWCZfFlhjFms=;
    b=Gde1FB+GfQETrwt+XkxjfOrvcybPN0VAQeR9m+K2cd4mfnDYlxtOnOSquEVUbYxevI
    Dds1Z3Oy2vNgHTeUIyGnMRvxyHDDMYN6mYqmPISUsSWnjeZPE2HZQJHJQumZU47MW4G4
    grW5N/u6w44/Z88lRmrldU4FBErCS1InX/4tTtthsj0ByTWjPvc3908biRdZ2T9Jo3RN
    B88jXkKE0L97zI+vkLcaK/Yh3HhdWw4v9a/NKsxidkF+oVhMHe09wRrYEa3pxrOCuyxW
    t65iRbILnc09mZfd2a6CAEONc+UWobZvMO2OFGn74iAZzPB1bqrw8v1MSEGX6biEw07Y
    cU3A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683006149;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=GhE5fBfcNwMLwxUGqEDocKD//uK7BAVcWCZfFlhjFms=;
    b=PS3ttY3jAhpm4VF4UrTquU3/BxHgUGsP9e4yt/292Jn9arpNz90rNGgsDIq0qG6hIj
    xVb0cdSgiY3CvTSmatDIM9U6dqOAOrYxLxMaq+t9dGgrkb4Rc68DpVamAt9JpVRtJ4pw
    qaoaDOh6cozDCLuhDVzIxtGV+V/y+jMeupUw8sTqtzWz8mDnNG2ayw8gzIf3nXf4dqfr
    4wUZCT6JXwl1/1av7ceNyPfmRRQVP24LQV2dI6oKGWpetZ3IXJb3bheITpjIQ8wgRRYT
    a22FzeGFw3Z23t1Ty6w5LzK04dxDFwCXMi8IvwnEur7/zjUKgamIoea5Heoz8e1hElKN
    hxPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683006149;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=GhE5fBfcNwMLwxUGqEDocKD//uK7BAVcWCZfFlhjFms=;
    b=jce+kKB9N9Yw3D4ke3LWxnftnI7FNN8KoVsLRzyBG4JD1+RhZ4FP33vzSxtCde+Uap
    VdFO+886OfHYvfQLSEDA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4wqVv7FZ8tH5EUSbMVU80kUr7f4QlYaI60OjHt/Q=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: provide diffutils and ghostscript in opensuse images
Date: Tue,  2 May 2023 05:42:18 +0000
Message-Id: <20230502054218.15303-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The diffutils package is a hard requirement for building xen.
It was dropped from the Tumbleweed base image in the past 12 months.

Building with --enable-docs does now require the gs tool.

Add both packages to the suse dockerfiles.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/suse/opensuse-leap.dockerfile       | 2 ++
 automation/build/suse/opensuse-tumbleweed.dockerfile | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index bac9385412..c7973dd6ab 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -18,11 +18,13 @@ RUN zypper install -y --no-recommends \
         clang \
         cmake \
         dev86 \
+        diffutils \
         discount \
         flex \
         gcc \
         gcc-c++ \
         git \
+        ghostscript \
         glib2-devel \
         glibc-devel \
         # glibc-devel-32bit for Xen < 4.15
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 3e5771fccd..7e5f22acef 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -18,11 +18,13 @@ RUN zypper install -y --no-recommends \
         clang \
         cmake \
         dev86 \
+        diffutils \
         discount \
         flex \
         gcc \
         gcc-c++ \
         git \
+        ghostscript \
         glib2-devel \
         glibc-devel \
         # glibc-devel-32bit for Xen < 4.15

