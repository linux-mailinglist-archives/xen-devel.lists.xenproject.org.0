Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA5AACEE5D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 13:16:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006652.1385869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8aU-0001h1-2y; Thu, 05 Jun 2025 11:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006652.1385869; Thu, 05 Jun 2025 11:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8aT-0001eC-W5; Thu, 05 Jun 2025 11:16:45 +0000
Received: by outflank-mailman (input) for mailman id 1006652;
 Thu, 05 Jun 2025 11:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fE9Y=YU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uN8aS-0001e1-RC
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 11:16:44 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ec92b90-41fe-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 13:16:42 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a5096158dcso708315f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 04:16:42 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a526f4c808sm2043887f8f.28.2025.06.05.04.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 04:16:41 -0700 (PDT)
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
X-Inumbo-ID: 8ec92b90-41fe-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749122201; x=1749727001; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+yTB1/fvMVCTDxVNoJBahxAhkJNiv9OGan5nCvCNr0Q=;
        b=H38wIFI7ivo4vYUeLUnnp2kizRHhvAaIlngd8rZs0s+5j+ycjau5lVybsyaxDmL6LL
         SPnoLUprROO/QudUbyABr3IlZ68/gkFiiZM6gvKVIUnivSyVyuTbtBElr3n1May8kD09
         n+q+A7gCcMQAM5I+25/W+26RRUTf/I+OGC38g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749122201; x=1749727001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yTB1/fvMVCTDxVNoJBahxAhkJNiv9OGan5nCvCNr0Q=;
        b=cY/cJZy/uz8fvoUUNR4nyQR8RVTfE+aDD/x/7uW2Y8A6qvbfHFY1Zbr0wUNFAuWekA
         63IkTghvPkY8qsUfkxe3Z7zMl5WUIgVZ1divbg/DGkaloPHqHoUNHQgY8lBGhW7DYCXB
         RDn4YNI57WFUwmNpll/nYCTcoBUz53Wu1SUi2EjGGtOieYaoutFkKiAwKmY59ozRMiEd
         fFhQNqV3smW7ttg4US8G6Wz6cUxPD7GTQW4EMww0Da+9BkvflNHMQz0LMhqLjkNGsYse
         2qw6SAGAfhKFdSnZNR+h0pV44XesXvvR8XwnDLRw0IAshOcRSQB8HH1UkVbSSpDmUfS/
         yu9g==
X-Gm-Message-State: AOJu0Yz/gAtpSmepV49vsSM9ZMhyjQLMdshWuPaFI9ToUG21pVYNbIUy
	rOLnsjfXcOwxp+rhi9SZ6pmWTCI4iep1g7i8F06kNlODtTzbQ/ygcI7R0AfqajQcdo2UHoP1Dit
	+bUPr
X-Gm-Gg: ASbGncsPzqKSheifkpGJxodUyxgxUtN4P2RR0rzZWz0OPLVPSMqAC+mwedGqeW6acAM
	U0TBZIoRs1NSrjhSrMmDbVWiBf37WawizE22S6R+yVlFkwtsJJxVa27fs2OdrKnEBadcAiqmw16
	nHPMyKJl+Ro6HzZCM/JrYKf/aUA5lUO1X9vScpwDKSNyCy4YW8BNSfLdO9iANmFoa7rao+EykoO
	UGyJC4SVu9V5WojfdSd8WKv7Nfb5Pf4yzs/h2i9Z7szpPGB4cLa0ghbtu9w495a/wJb9N61k5qr
	QgEvN7CBmBrFSm8Ricd9+ON8FNRcGMJdZ02edM5XDIuoUQXFKA/uufDkYWA2TFlU+ZeHwkPck7Z
	bP3CO3QHacJbmAn44j0xBv3FM5Ox5Pm4sibw=
X-Google-Smtp-Source: AGHT+IExmauxR8dRM92tLzKx7a+12D9g9GI/WV13HI+84A8h/PRzpeMh/5wMZUrSZtyTYrM7KKXynQ==
X-Received: by 2002:adf:f68c:0:b0:3a5:24a9:a5d3 with SMTP id ffacd0b85a97d-3a524a9a7c5mr3309459f8f.17.1749122201460;
        Thu, 05 Jun 2025 04:16:41 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 0/3] x86/EFI: Fix detection of buildid
Date: Thu,  5 Jun 2025 12:16:35 +0100
Message-Id: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bugfix in patch 1.  Minor cleanup in the rest.

Andrew Cooper (3):
  x86/EFI: Fix detection of buildid
  x86/EFI: Explain buildid.ihex
  xen/EFI: Drop __ASSEMBLY__ ifdefary in efi.h

 xen/arch/x86/efi/Makefile | 2 ++
 xen/common/version.c      | 7 +++++--
 xen/include/xen/efi.h     | 6 ------
 3 files changed, 7 insertions(+), 8 deletions(-)


base-commit: eb57fe072232c9836d085020450ce1434b21a819
-- 
2.39.5


