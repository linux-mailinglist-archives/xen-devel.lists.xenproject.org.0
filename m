Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB6169E536
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 17:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499024.770058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVwB-0007Q9-Rn; Tue, 21 Feb 2023 16:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499024.770058; Tue, 21 Feb 2023 16:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVwB-0007Fh-JF; Tue, 21 Feb 2023 16:56:19 +0000
Received: by outflank-mailman (input) for mailman id 499024;
 Tue, 21 Feb 2023 16:56:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJL1=6R=citrix.com=prvs=409c08766=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pUVw8-0006DG-Q5
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 16:56:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5c8ca27-b208-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 17:56:14 +0100 (CET)
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
X-Inumbo-ID: a5c8ca27-b208-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676998574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E1BA4ZDwCy7hT4Mgu12M5f6GV+oxRNyGgRa7eiPzv24=;
  b=ZG+djzhKWkfs4C3dnpDFnk5a5NdPJtD/jepue5JSn+gxtPw5CGiyXvR0
   miBJ5iHzkgrWdCpwXrZjWJAh82RPDaQyJoiyfNNHqtBYL6sYMG9rpwTKe
   rk7/9gFNh0jltgAMu9Br0/ExE6mIDDQKw4Q2ngvsotqQwWU7rPd1gexyU
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96765392
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ykBzhaJlWeTFwJazFE+Ry5UlxSXFcZb7ZxGr2PjKsXjdYENSgmdSy
 2QcCDrSaP3bYTSgf4wnPo219E8OvMSDz4dhSlRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AZnPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5lOUpv0
 No6FwozQSmBjKGcka2lTfJz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbG5oLwx3J/
 Aoq+Uy+Phw8LNem+QasrHz0nvDRuHLVX4ANQejQGvlC3wTImz175ActfVCyu/W+h2a1UshTL
 EFS8S0rxYAp71CiRNT5Wxy+oVaHswQaVt4WFPc1gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHjVGOYSvDrPHO92r0YHVLazZYPkfoUDfp/fHxmKoSqzTtcexdP5e3hZ7fSC7ux
 CuV+X1Wa6ooseYH0KCy/Fbiij2qp4TUQgNd2jg7Tl5J/SsiOtf7OtXABUzzqK8Zcd3HFgXpU
 G0swZD20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKVBaJtsldzBO
 hW7VeZtCHh7ZSLCUEOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj6yzhl1wflvZ
 s7AKa5A6Er27ow9kVKLqxo1i+d3lkjSO0uOLXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5TPb9q
 r5i2z+x40wHCoXWO3CHmbP/2HhWdRDX87iq8Z0IHgNCSyI6cFwc5wj5m+1/JdY+xPwMzo8lP
 BiVAydl9bY2vlWfQS3iV5ypQOiHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:P2Z/Ra+Wh5AghNS1aJJuk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="96765392"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v2 1/7] automation: Remove CentOS 7.2 containers and builds
Date: Tue, 21 Feb 2023 16:55:36 +0000
Message-ID: <20230221165542.7642-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221165542.7642-1-anthony.perard@citrix.com>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We already have a container which track the latest CentOS 7, no need
for this one as well.

Also, 7.2 have outdated root certificate which prevent connection to
website which use Let's Encrypt.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - new patch

 automation/build/centos/7.2.dockerfile  | 52 -------------------------
 automation/build/centos/CentOS-7.2.repo | 35 -----------------
 automation/gitlab-ci/build.yaml         | 10 -----
 3 files changed, 97 deletions(-)
 delete mode 100644 automation/build/centos/7.2.dockerfile
 delete mode 100644 automation/build/centos/CentOS-7.2.repo

diff --git a/automation/build/centos/7.2.dockerfile b/automation/build/centos/7.2.dockerfile
deleted file mode 100644
index 4baa097e31..0000000000
--- a/automation/build/centos/7.2.dockerfile
+++ /dev/null
@@ -1,52 +0,0 @@
-FROM centos:7.2.1511
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-# ensure we only get bits from the vault for
-# the version we want
-COPY CentOS-7.2.repo /etc/yum.repos.d/CentOS-Base.repo
-
-# install EPEL for dev86, xz-devel and possibly other packages
-RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
-        yum clean all
-
-RUN mkdir /build
-WORKDIR /build
-
-# work around https://github.com/moby/moby/issues/10180
-# and install Xen depends
-RUN rpm --rebuilddb && \
-    yum -y install \
-        yum-plugin-ovl \
-        gcc \
-        gcc-c++ \
-        ncurses-devel \
-        zlib-devel \
-        openssl-devel \
-        python-devel \
-        libuuid-devel \
-        pkgconfig \
-        # gettext for Xen < 4.13
-        gettext \
-        flex \
-        bison \
-        libaio-devel \
-        glib2-devel \
-        yajl-devel \
-        pixman-devel \
-        glibc-devel \
-        # glibc-devel.i686 for Xen < 4.15
-        glibc-devel.i686 \
-        make \
-        binutils \
-        git \
-        wget \
-        acpica-tools \
-        python-markdown \
-        patch \
-        checkpolicy \
-        dev86 \
-        xz-devel \
-        bzip2 \
-        nasm \
-    && yum clean all
diff --git a/automation/build/centos/CentOS-7.2.repo b/automation/build/centos/CentOS-7.2.repo
deleted file mode 100644
index 4da27faeb5..0000000000
--- a/automation/build/centos/CentOS-7.2.repo
+++ /dev/null
@@ -1,35 +0,0 @@
-# CentOS-Base.repo
-#
-# This is a replacement file that pins things to just use CentOS 7.2
-# from the CentOS Vault.
-#
-
-[base]
-name=CentOS-7.2.1511 - Base
-baseurl=http://vault.centos.org/7.2.1511/os/$basearch/
-gpgcheck=1
-gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
-
-#released updates 
-[updates]
-name=CentOS-7.2.1511 - Updates
-baseurl=http://vault.centos.org/7.2.1511/updates/$basearch/
-gpgcheck=1
-gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
-
-#additional packages that may be useful
-[extras]
-name=CentOS-7.2.1511 - Extras
-baseurl=http://vault.centos.org/7.2.1511/extras/$basearch/
-gpgcheck=1
-gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
-
-#additional packages that extend functionality of existing packages
-[centosplus]
-name=CentOS-7.2.1511 - Plus
-baseurl=http://vault.centos.org/7.2.1511/centosplus/$basearch/
-gpgcheck=1
-gpgcheck=1
-enabled=0
-gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
-
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 079e9b73f6..aed8fc0240 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -211,16 +211,6 @@ archlinux-gcc-debug:
   variables:
     CONTAINER: archlinux:current
 
-centos-7-2-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: centos:7.2
-
-centos-7-2-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: centos:7.2
-
 centos-7-gcc:
   extends: .gcc-x86-64-build
   variables:
-- 
Anthony PERARD


