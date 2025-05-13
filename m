Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCC8AB5724
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 16:29:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982929.1369296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqdS-0003tf-Ka; Tue, 13 May 2025 14:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982929.1369296; Tue, 13 May 2025 14:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqdS-0003s9-Gu; Tue, 13 May 2025 14:29:34 +0000
Received: by outflank-mailman (input) for mailman id 982929;
 Tue, 13 May 2025 14:29:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sqXq=X5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uEqdR-0003s1-3O
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 14:29:33 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af886120-3006-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 16:29:32 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so1055804666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 07:29:32 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197ca2b4sm778952466b.160.2025.05.13.07.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 07:29:30 -0700 (PDT)
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
X-Inumbo-ID: af886120-3006-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747146571; x=1747751371; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eR4UCFvdNW2Jmn1DjKvfq3Y5QyXctLHc7HhrMpab29k=;
        b=Fm5Il8dgxqzsX2nBozaB3ibeV8pUzGObKSGv4N+BPc/GhGi9i6RlPwWTxjwrkqRPug
         mPRRV1d88k5rjMRCOY2KNRVVJ9uQlvWnuTiZPBbartW8Lby6F/SfKFlY/Y+8RJIllIAa
         mSBLcRJhvM2BpDxPA99H+3XmprrBAX24TSGLgsGpNIFq7ly0HAiDZyzzAWunj0dIE0GI
         vrp/fPTSNVcUdL4h6yHMp2CGC1nXCth1ijmth1UhwxmbOYuzptKtGnQpYNqysIFL5tyq
         g7pB9RFIq96wdPXrm3Wrv5p1cTxtQU+nRoAKL07XUQ8zOzZZ9P8333pI/4P4Nti4UdCH
         C3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146571; x=1747751371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eR4UCFvdNW2Jmn1DjKvfq3Y5QyXctLHc7HhrMpab29k=;
        b=Jeplp1LCLrW4qMZ+q93XdPfQUc0fy8EGNBOWv5vE7znKMtVQCE5CCrAats2yaSEBgT
         oDV2aV40BdFpoVlXYF32wLu7BfOuqiqE12pgH+jqDyuUvqOD5f1hBrwZs1Ztpq62OeOz
         2x1E/LehFno72sx9XrP3Q65mzAPRQpHqsj9Vahuty0DnKXABfaknplfeLQWnaxZb0H6R
         oUajJCOnl1k6ChKd/ij//4wiwgcXbMov1V1XcruV2NRRbqOpFD4EP10qSj18vDRst912
         HkbBKNg2O+CsyCVCmXu+NgKlI+xFyuA7/JHUGFpRNpfJct3iic9jWrO/x0YV4xjEnIqK
         RHag==
X-Gm-Message-State: AOJu0YyEFuYcKQGsxRYXGvWk8iDckvULMODjZ3VGHryHWE+j0AvGTUiC
	Fdhez2rgTmel1W5qeC7Tqjlu7GMRJ27DEa79UUIsuakPmXwTDA1b0mGlog==
X-Gm-Gg: ASbGncv0spEyJg5SCmZX3QPyvZeQd4LBqT4+fd6eSWYBWnRQgYEQ/AN6kDQ1RFWINv3
	0nnFHwfrLPihiNWlL5qafiSTQzXCHpk9r8cj4ZYzgkeymLrYrsuoLjXis2HPk9DLFxvgxo7XPTm
	VXP4bLYOFFwKaioEL1U6/HtUEyulnh5XPLg+vdZtyqqHBV5TY4KEJiyI+cqoy6TSahUwiGtkl2W
	v71DVSkh9aUxlTwO3pmkh9dCtm5bC2fOh2JPYzPDdgp5fZJLSiczNhBwvxyT35A31ApExf1IG/l
	fc5LCdtU2MZ10qeBaplCMExp8WekEx0kqacGJoU5by51kqUIIp59+u8x/PY8Ch84hrhBLvNv942
	yW1RcmhKMGKuSfMWrCGLXcLgwRvZr
X-Google-Smtp-Source: AGHT+IGLBwdYxZLtNSw/v4Tw1/xxsG+WCT6uU5+IaaxLBsTLENg0zH/5kO2UWTYgz1RN3UiFoB9/bw==
X-Received: by 2002:a17:907:9447:b0:ad4:c55e:ef9b with SMTP id a640c23a62f3a-ad4c55ef21emr651300866b.58.1747146571069;
        Tue, 13 May 2025 07:29:31 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 0/3] common dom0less updates
Date: Tue, 13 May 2025 16:29:25 +0200
Message-ID: <cover.1747145897.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series refactor construct_domU() by moving back some Arm-specific
changes to Arm code as they aren't used now by other architectures.

Introduce arch_contruct_domU() to cover arch specific steps of a guest
domain construction.

Add ARM dependency for CONFIG_STATIC_MEMORY as, at the moment, it it supported
only for Arm.

Move make_chosen_node() to common code as nothing Arm specific is in the
current implementation of Arm's make_chosen_node().

Xen CI testing: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1815213130

Oleksii Kurochko (3):
  xen: restrict CONFIG_STATIC_MEMORY to ARM
  xen/dom0less: refactor architecture-specific DomU construction
  xen/dom0less: move make_chosen_node() to common code

 xen/arch/arm/dom0less-build.c            | 42 +++++++++----
 xen/arch/arm/domain_build.c              | 46 --------------
 xen/common/Kconfig                       |  2 +-
 xen/common/device-tree/dom0less-build.c  | 76 +++++++++++++++---------
 xen/include/asm-generic/dom0less-build.h |  3 +-
 5 files changed, 83 insertions(+), 86 deletions(-)

-- 
2.49.0


