Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB3D380295
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 05:42:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127164.238929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhOhl-0005Aa-E0; Fri, 14 May 2021 03:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127164.238929; Fri, 14 May 2021 03:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhOhl-00057O-9q; Fri, 14 May 2021 03:41:37 +0000
Received: by outflank-mailman (input) for mailman id 127164;
 Fri, 14 May 2021 03:41:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QDWZ=KJ=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1lhOhj-00057G-Qe
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 03:41:35 +0000
Received: from mail-qt1-x829.google.com (unknown [2607:f8b0:4864:20::829])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7900ed3-785a-45cb-8455-275a0609307d;
 Fri, 14 May 2021 03:41:35 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id c10so11586905qtx.10
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 20:41:35 -0700 (PDT)
Received: from walnut.ice.pyrology.org (mobile-166-176-184-32.mycingular.net.
 [166.176.184.32])
 by smtp.gmail.com with ESMTPSA id g15sm3873432qka.49.2021.05.13.20.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 20:41:34 -0700 (PDT)
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
X-Inumbo-ID: f7900ed3-785a-45cb-8455-275a0609307d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A/v1QITXYqG1suB6tX0Jl2pKcl1d0G85XYf1su05dpo=;
        b=Lyuv6a0BPDqNJ/edx+Zud4iNbYYNiU1CMAJ6cmpcG2PHWt476Gjb7a1ASQXO42e2J/
         DGSjcGXeje45z+Yu3YzbZajs8nNiE7VT8xHi0fRz5KpVH0nu5K27Q60cmXxASPcOKFJu
         QsngTOvH2uQuqOcMXFZk+rVVaXz91VwvkxUSxAJmUR9i94pcNTWFT43pXRR3VBnQQyx0
         SCSERhCVNEtc3VGV/NL34VqZPJNWxj5DDUNxI4x120HYH2KEMkYt73wZ/NEdhEd8falV
         HlxPxpQYd6f7Eaj9hZ3J1WfhOjXGGxbMvdnvx077kJ5uBbELpZ/gKsi8BAVv5WNdPQH0
         kEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A/v1QITXYqG1suB6tX0Jl2pKcl1d0G85XYf1su05dpo=;
        b=Q3zx9CEMz0ZTjpmIoqSxFOOezFY8ZO9mfqzVspS7OULIJCeZ2YDm5OR0ckZIMgZ7eK
         WzthWm+68AXk/2/nIay2ku8yzUsFGcxnR8iRHCCobI+X38SjR7IXQ6F5GGJh8VFpcEZV
         F6RaJzWzAjUiMhTCu18UT9VTTUXk+3jrJMfvy8I8XGKrLeANlPLV+6/3Mo/4Ep3TSrf6
         3QCIVtNsxJMCEMEQ4hyFoOVO0DfkmtvkDv2mB5axe8PCAg6EVsFL9+sTpqqIYFwVWmBE
         VtKjW5etHr4TzwPAXBJkrRrpReqFZToJjEKGQmt7aupox9XWYo0SYdtlXn9qodNiannQ
         DVTQ==
X-Gm-Message-State: AOAM532WtKQLuVJh5aEFVXf9L0GN5oVLYK1OiCnVy2Kao05bAc2iQT1T
	gNnUTp5DDHt+S7Y+wKiFYaJu0MD2YvTp4w==
X-Google-Smtp-Source: ABdhPJwX5AYTyjg6nGHF/DXpwwDwO9nYNQY2nIOn5uj0jbRKXhGNHG9fGOpLTKEyYv1Xya7FizR8TQ==
X-Received: by 2002:a05:622a:15c9:: with SMTP id d9mr24643186qty.103.1620963694737;
        Thu, 13 May 2021 20:41:34 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: dpsmith@apertussolutions.com,
	andrew.cooper3@citrix.com,
	stefano.stabellini@xilinx.com,
	jgrall@amazon.com,
	Julien.grall.oss@gmail.com,
	iwj@xenproject.org,
	wl@xen.org,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	persaur@gmail.com,
	Bertrand.Marquis@arm.com,
	roger.pau@citrix.com,
	luca.fancellu@arm.com,
	paul@xen.org,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io,
	Christopher Clark <christopher.clark@starlab.io>
Subject: [PATCH v4 0/2] Introducing Hyperlaunch capability design (formerly: DomB mode of dom0less)
Date: Thu, 13 May 2021 20:40:59 -0700
Message-Id: <20210514034101.3683-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are submitting for inclusion in the Xen documentation:

- the Hyperlaunch design document, and
- the Hyperlaunch device tree design document

to describe a new method for launching the Xen hypervisor.

The Hyperlaunch feature builds upon prior dom0less work,
to bring a flexible and security-minded means to launch a
variety of VM configurations as part of the startup of Xen.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
Signed-off by: Daniel P. Smith <dpsmith@apertussolutions.com>


Daniel P. Smith (2):
  docs/designs/launch: hyperlaunch design document
  docs/designs/launch: hyperlaunch device tree

 .../designs/launch/hyperlaunch-devicetree.rst |  343 ++++++
 docs/designs/launch/hyperlaunch.rst           | 1004 +++++++++++++++++
 2 files changed, 1347 insertions(+)
 create mode 100644 docs/designs/launch/hyperlaunch-devicetree.rst
 create mode 100644 docs/designs/launch/hyperlaunch.rst

-- 
2.25.1


