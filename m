Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8F325D73
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 07:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90073.170338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFWPr-0004ot-D2; Fri, 26 Feb 2021 06:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90073.170338; Fri, 26 Feb 2021 06:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFWPr-0004oU-93; Fri, 26 Feb 2021 06:15:55 +0000
Received: by outflank-mailman (input) for mailman id 90073;
 Fri, 26 Feb 2021 06:15:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwhq=H4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFWPo-0004oP-V2
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 06:15:53 +0000
Received: from mail-oo1-xc32.google.com (unknown [2607:f8b0:4864:20::c32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfdbb505-eb10-486d-a58a-ffdeda7d05b6;
 Fri, 26 Feb 2021 06:15:51 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id x19so1964892ooj.10
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 22:15:51 -0800 (PST)
Received: from thewall (142-79-211-230.starry-inc.net. [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id w22sm1588812otm.73.2021.02.25.22.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 22:15:50 -0800 (PST)
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
X-Inumbo-ID: dfdbb505-eb10-486d-a58a-ffdeda7d05b6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WXwFjyd+hV8iKbRjbKd2BJP8+p5hoDnRVTsshNgLObs=;
        b=PbV2OOVCRtDgN5eys1UpbeBoNmICjGn+EMWpq0uoFlULCi/a3wKdbnUtsZ/ygKtqGZ
         FIshySVFsH0gBGd+DPnkjH1XnEl+mIIZM42TSou9zcmEMNjFCXqp2YItkc08PbmS9vcx
         AUFy8G4I5rkhc4EWhnwb1e/MAMiC7r4XtS2IoSkdAKesbvpzDmJES/6QNIrVKSVBFn+d
         VfeICMtYHjKFYGA3xHVv4J6upnv0Vlb9dy9A47/YZQXgE57X9WiLV1CAfzVSKJJ9emDZ
         4da06aTUj2p1M8pm0zCrjfWm6i11rRV7XNwsGBbxzkIN36v9GcGQOzpXJ/O5gNK6d3PT
         PChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WXwFjyd+hV8iKbRjbKd2BJP8+p5hoDnRVTsshNgLObs=;
        b=DhXDtnfmtIfeWXgcuTyCoHuBJdL3UZEnGNWK2opfOad2tGu7p3aVNjVVe4GFwpD8aR
         RyFHv64i2proeIBSb7EZ7nW7eVu7IdJUos7nJvh4HkN7cXdrSxFFbi/RqS9OR7W4bMLY
         lDARu+IQ3XMv9EJltWd3F+1ULoLH7y7T60L2OZHcnBthDH4l/jbKN4M+t4+9dniXqTRA
         LL0gJvSkn7GH077kwIPfTPb9385i5yudRrRmUm/XXfwjrdCgv4mf9VCNyUycRoB0nx1i
         3KxaSyZGxU7Gm7rZPRZMHesZix1h8Lga8tYMqughJZqlYX0jIQuBZcx7XzZVAuAJ7nmr
         xKYQ==
X-Gm-Message-State: AOAM530I7n85IvXA5ueL+1lU0ffqLtHj1ywSyEYog+O+TCTyMvtx5uHl
	izbaYyCxL3K+qAC3gjwOPKY=
X-Google-Smtp-Source: ABdhPJx1ewpkQitZcrkIRSQQ8SYaMHDnbn+waiWgKJCq/pAzliJftdP9g6FTAUwG9vSlQ1nJhf/wuQ==
X-Received: by 2002:a4a:e093:: with SMTP id w19mr1242946oos.53.1614320151379;
        Thu, 25 Feb 2021 22:15:51 -0800 (PST)
Date: Thu, 25 Feb 2021 23:15:49 -0700
From: Connor Davis <connojdavis@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH for-next 6/6] automation: add container for riscv64 builds
Message-ID: <20210226061548.4dbvv772icl6pwmo@thewall>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <a7829e62734a73993cd41cdbc18e1d16e4bb06d9.1614265718.git.connojdavis@gmail.com>
 <alpine.DEB.2.21.2102251630382.3234@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="givbyxahiezow33j"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102251630382.3234@sstabellini-ThinkPad-T480s>


--givbyxahiezow33j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 25, 2021 at 04:31:13PM -0800, Stefano Stabellini wrote:
> On Thu, 25 Feb 2021, Connor Davis wrote:
> > Add a container for cross-compiling xen to riscv64.
> > This just includes the cross-compiler and necessary packages for
> > building xen itself (packages for tools, stubdoms, etc., can be
> > added later).
> > 
> > To build xen in the container run the following:
> > 
> > $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen
> 
> The container build failed for me with:
> 
> error: failed to initialize alpm library
> (could not find or read directory: /var/lib/pacman/)
> The command '/bin/sh -c pacman --noconfirm -Syu     pixman     python     sh' returned a non-zero code: 255
> 

Ooof, apparently archlinux/base has been broken for a
few weeks now due to interactions between faccessat2 and the
host's libseccomp version [0]. This thread [1] suggests the next
docker release will have a fix.

As a temporary workaround I got the attached patch to work
(based on this one[2]) if you want to give that a go.

    Connor

[0] https://bugs.archlinux.org/task/69563
[1] https://github.com/actions/virtual-environments/issues/2658
[2] https://github.com/MiguelNdeCarvalho/docker-baseimage-archlinux/pull/8/files

--givbyxahiezow33j
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="docker-glibc.patch"

diff --git a/automation/build/archlinux/riscv64.dockerfile b/automation/build/archlinux/riscv64.dockerfile
index d94048b6c3..5b3c3b9e3b 100644
--- a/automation/build/archlinux/riscv64.dockerfile
+++ b/automation/build/archlinux/riscv64.dockerfile
@@ -2,6 +2,11 @@ FROM archlinux/base
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
+RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
+    curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
+    bsdtar -C / -xvf "$patched_glibc" && \
+    sed -i 's/#IgnorePkg   =/IgnorePkg   = glibc/' /etc/pacman.conf
+
 # Packages needed for the build
 RUN pacman --noconfirm -Syu \
     base-devel \
@@ -26,6 +31,9 @@ RUN git clone --recursive -j$(nproc) --progress https://github.com/riscv/riscv-g
 
 # Add compiler path
 ENV PATH=/opt/riscv/bin/:${PATH}
+ENV CROSS_COMPILE=riscv64-unknown-linux-gnu-
+ENV XEN_TARGET_ARCH=riscv64
+ENV SUBSYSTEMS=xen
 
 RUN useradd --create-home user
 USER user

--givbyxahiezow33j--

