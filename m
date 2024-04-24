Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E85A8B0429
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 10:21:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711239.1111044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXrh-0002OI-HN; Wed, 24 Apr 2024 08:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711239.1111044; Wed, 24 Apr 2024 08:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXrh-0002NN-D8; Wed, 24 Apr 2024 08:20:29 +0000
Received: by outflank-mailman (input) for mailman id 711239;
 Wed, 24 Apr 2024 08:20:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RmhA=L5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzXrf-0002NH-OZ
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 08:20:27 +0000
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 808d5b86-0213-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 10:20:26 +0200 (CEST)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5ad2da2196aso2829604eaf.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 01:20:26 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 t9-20020ac86a09000000b00436e5e47969sm5885155qtr.54.2024.04.24.01.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 01:20:24 -0700 (PDT)
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
X-Inumbo-ID: 808d5b86-0213-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713946825; x=1714551625; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11bPMkgY4YKA9J4fnUAiPwFi1PyXc6CIsD7wkYqKGGY=;
        b=aTBVgcLV05Og7/CP+eW2I5WSMX/b1jz+oeRIILHnwSlkipDsarWtXbNfdtuFC0kIPM
         5UUO9iBsUNintqFW1zSmCE4SxEX62kgT5Ig5j5+frrTJn65tG/9/L0orRC1Bv61kAOs8
         /ao2WrVuW+XqN9dZFdvTu4kpDx0G45oK1SJOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713946825; x=1714551625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11bPMkgY4YKA9J4fnUAiPwFi1PyXc6CIsD7wkYqKGGY=;
        b=ehP+ZB9Oh272lVrKhYd8yURy8l1mKNZycbEtRNYmpoQaUg1co6vFIZXGreTtIMLjBS
         BvZPqXPAGNpQGsJ+eWoP6y6zowjPse0fiFKFKVILOpMef+zr0bIoI7f1lCICf4TWJixh
         O5eYZCkfhhVdqoLpwHFaIQ4/n5njNbSbg+a9KYfdCgRZ0SAhT/CKeJbztQWXamnLFsEj
         8RYhczCuZRsJXhQraDsCN7AExis4TGGmJupdK2mKKEQkvQgZvmibDM4vnO+QV400oZNA
         5Lnx9YbhkLc654udrvXPSMleTed9WLNzRv93c/e/TkqsGc3tPB06B/juVgDWYOZs2qj2
         VjOg==
X-Gm-Message-State: AOJu0YxezB1+D54bn6Lc1rXXRe3igfTjCZPUsKVk1bY9xcjwCRGh4Huo
	+q+sXShxnPmuHen/z9GHZX1wNPvRISRETRACgQShTPFHq2+6B5917ndOCqdBuIvOsS2A26otG2S
	w
X-Google-Smtp-Source: AGHT+IFEaMgEiWWurp4CsP1yRWUiimlCEGJbWgKqE5+Kl1NNBN50bFEFLNxCE9q3wMP3pWa+P1Z0CA==
X-Received: by 2002:a05:6358:b581:b0:17e:a9b7:2636 with SMTP id wa1-20020a056358b58100b0017ea9b72636mr1690809rwc.22.1713946824683;
        Wed, 24 Apr 2024 01:20:24 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 0/4] livepatch: minor bug fixes and improvements
Date: Wed, 24 Apr 2024 10:19:53 +0200
Message-ID: <20240424081957.34326-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following series contain some minor bugfixes and improvements for
livepatch logic, both inside the hypervisor and on the command line
tool.

Thanks, Roger.

Roger Pau Monne (4):
  xen-livepatch: fix parameter name parsing
  livepatch: introduce --force option
  livepatch: refuse to resolve symbols that belong to init sections
  x86/livepatch: perform sanity checks on the payload exception table
    contents

 tools/include/xenctrl.h            |  3 ++-
 tools/libs/ctrl/xc_misc.c          |  7 +++----
 tools/misc/xen-livepatch.c         | 25 +++++++++++++++++++++----
 xen/arch/x86/extable.c             | 18 ++++++++++++++++++
 xen/arch/x86/include/asm/uaccess.h |  3 +++
 xen/common/livepatch.c             | 25 +++++++++++++++++++------
 xen/common/livepatch_elf.c         | 22 +++++++++++++++++++++-
 xen/include/public/sysctl.h        |  4 +++-
 xen/include/xen/livepatch_elf.h    |  2 +-
 9 files changed, 91 insertions(+), 18 deletions(-)

-- 
2.44.0


