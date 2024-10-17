Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F439A286F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 18:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820761.1234355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TEu-0004wr-Iw; Thu, 17 Oct 2024 16:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820761.1234355; Thu, 17 Oct 2024 16:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TEu-0004vI-Fz; Thu, 17 Oct 2024 16:20:40 +0000
Received: by outflank-mailman (input) for mailman id 820761;
 Thu, 17 Oct 2024 16:20:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZFta=RN=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t1TEs-0004vC-Ll
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 16:20:38 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be869c86-8ca3-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 18:20:37 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c9454f3bfaso1405297a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 09:20:37 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d77995esm2922739a12.65.2024.10.17.09.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 09:20:36 -0700 (PDT)
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
X-Inumbo-ID: be869c86-8ca3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729182037; x=1729786837; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U+mTJfy0n5PIKLSVcCNTFOuwd2xc+l1lEtM8PXgXmcU=;
        b=dZlXXTglyzXDu2BDDbmHrgaaJiLnW2mkiEdFZuH8wH6srCqaKAh6+nNxZXgEmf1MdZ
         lBEQbMdbSpiVi7mxmVlt4575Yt84kM/gIb6CybNxxqUXKMWSsgTwAWr34Ea7QqQhwjul
         RdMXsS6e+k5XbD0bkKZaYjzv0/QSeSyWK4HB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729182037; x=1729786837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+mTJfy0n5PIKLSVcCNTFOuwd2xc+l1lEtM8PXgXmcU=;
        b=kc7E2/aRFVeZN0qQgZoUiW28UtsWhC6cP2TmwEA9eaifzqlv1YfW00/2EHg73hAHlw
         p1B32OqVDDbEkvF2XrYEjXbqNfOxjTK5ipQx3ahjNNzNeB8DhMF9PSrOiObfF80x9w6z
         7ddJmW27QSpZx5kGyFSVCCF4LGDwAFueCOZuDUeVc2348xPOK6+jY9QWpOdgYMW0hWTM
         6mD9hzcoL+pBNqjpPT2iaq2LQSvwP6mI/P/NwUrdzs8zzAkanbojYwwD2nlM8qLezFrR
         b+6dNcvYaec8LGVMVYg0BnWw1uRlkvdoNKitFLUwrbsUyC0khlmu+deZbmIorcC0Gyme
         LkDw==
X-Gm-Message-State: AOJu0YxLyRptnSyyUF7bDpZEWR+RyGTmaIbV7A6E3hP8SryhqTl0saX1
	tm+eHv/Q0btEFEvqyw7TQcFbQuH94+OV3IpFGukiV+cjTXKo5Mxd7FaOD4wxeZvDV07S7flRfw6
	PWkI=
X-Google-Smtp-Source: AGHT+IFiKnYxnAR6geUAwfqTvZ+lIASvuwjtE5j8OiErv9ABiA1EkY8G+CuRgbMRA/pxH0xyzT6Csg==
X-Received: by 2002:a05:6402:909:b0:5c9:1d7f:4fd9 with SMTP id 4fb4d7f45d1cf-5c95ac15476mr17135550a12.8.1729182036915;
        Thu, 17 Oct 2024 09:20:36 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [XEN PATCH v1 0/3] CI: Upgrade the Fedora container and fix build failure
Date: Thu, 17 Oct 2024 17:20:18 +0100
Message-ID: <cover.1729170005.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Continuing Andrew's work on refreshing containers in GitLab CI.  With
Fedora 40, there was a build failure in the ocaml builds.  It is due
to an unused variable in an ocaml macro when building with "-Werror" .
Patch 2 solves the build failure, but I'm unsure if it is the best
approach.  Ideas welcome.

Andrew Cooper (1):
  CI: Refresh and upgrade the Fedora container

Javi Merino (2):
  automation: Fix URL to the gitlab container registry documentation
  ocaml/libs: Fill build failure due to unused variable in ocaml macro

 automation/build/README.md                    |  2 +-
 automation/build/fedora/29.dockerfile         | 46 -----------
 automation/build/fedora/40-x86_64.dockerfile  | 77 +++++++++++++++++++
 automation/gitlab-ci/build.yaml               |  8 +-
 automation/scripts/containerize               |  2 +-
 .../domain_getinfo_stubs_v1.c                 |  3 +
 6 files changed, 86 insertions(+), 52 deletions(-)
 delete mode 100644 automation/build/fedora/29.dockerfile
 create mode 100644 automation/build/fedora/40-x86_64.dockerfile

-- 
2.46.1


