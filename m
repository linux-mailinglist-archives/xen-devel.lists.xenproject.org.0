Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2B4A59078
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 10:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906357.1313793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZsx-0000vL-RR; Mon, 10 Mar 2025 09:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906357.1313793; Mon, 10 Mar 2025 09:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZsx-0000tU-Or; Mon, 10 Mar 2025 09:57:23 +0000
Received: by outflank-mailman (input) for mailman id 906357;
 Mon, 10 Mar 2025 09:57:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B6N5=V5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1trZsx-0000tO-7i
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 09:57:23 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f1c7064-fd96-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 10:57:22 +0100 (CET)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2feb96064e4so7813704a91.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 02:57:22 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2ff69353383sm7525981a91.14.2025.03.10.02.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 02:57:19 -0700 (PDT)
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
X-Inumbo-ID: 0f1c7064-fd96-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741600640; x=1742205440; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AGw8fZXx26xBVi/9+pP1ytMT9vkyJXCvWgdKggi56pI=;
        b=tYILwqPsVP1Axlu3UQT0sVVj+4ZQBXYsrEn8TYI4zIR94LExrMRcliee2Z/4E+nufu
         zhJv/i+kYInwmnntOGPM70JYzBzZ/8t5p/eojY8NX3cfYhck0KqU/I0u7hPrGuCKGJF2
         9CnR+ucNBendo71EGpUKhPICaEwcKSa0Ba/SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741600640; x=1742205440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGw8fZXx26xBVi/9+pP1ytMT9vkyJXCvWgdKggi56pI=;
        b=JgtwYkRFyK/0oolEZ/sVzxwlaUqA48yaeKe4J1r/8lPgXHh3muZyytKtWkU2NaqjvB
         BKzKr07KXC+wzO8KmfFifl1HI1uk2OCc9WAiDQnOHLoG7ZNsGHjhxwtQ2wzgxFzzDCY4
         7mOHUvZdq46TRSANP5oovBGVBc0VB2tgow4POBFYRvRCnRKLhv0Avg/RVcx5wYl675rZ
         X+mP4hM9xpL20+XTB0ycxNYUH/1IJXNTOoCzQkfqjzSiA3jdmMLiZMr6qeweeFf2/Wsv
         TVr6Bkp4RfUp0B7gRVLgFf9xI8AOBhWP/cRzNPTlEFRktmOyi1tGY89vFFmNU67sRmtS
         ERKQ==
X-Gm-Message-State: AOJu0YyG3ZhMV/EOhVsNevBxUAMWM1yfjbo9jtxLm018uMhRskQxgz2p
	ZKoYmGsFBUQVGbS24EKTV00ebbQ419vvJDtZh2Hj2UYy1u3drW/fINQ0y6XPu6maxC66WAgtW8W
	k
X-Gm-Gg: ASbGnct0/iyVJ0hRVmQXo3BZMU9voIjHJDDNmkfc5HCn3JpndtbOVKOrf1nWUqoC8iC
	PTWSEO4i7rf7zLlBXVovUJgDEjP/C0aaTuIGxCF5ExsPPvHAVM6XS3PR8LKaMdlJ4uIF5Yyu0ml
	AsDNZVO8nyMUEzXi/vVU4WAvmS2RNUfPEbxol8K7YN+H8nb9uLFkwp45k0BYAr5STyhIp0bTev/
	ePc6VHlAq+zrae4QpfFrpqnGbKWr8Uf5K+ecb4IMWPgcImP2acmv31fPCPYQu0Ec3yO+yIL995R
	w/zCpth6IsVNw5b4xf8mVh+ZFnekwhc9lvH1cIyYsckb3JM72VVVUa4=
X-Google-Smtp-Source: AGHT+IGJ0251Brhr4SNq5GbXJLb4Nsc4FP31Eo5YM4zMZ0mMbbz/AnC1ozLMoXit69Jz2/MYw3ndFA==
X-Received: by 2002:a17:90b:1807:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-2ff7ce47de5mr19455947a91.3.1741600640080;
        Mon, 10 Mar 2025 02:57:20 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v3 0/2] x86/pci: reduce PCI accesses
Date: Mon, 10 Mar 2025 10:55:33 +0100
Message-ID: <20250310095535.46033-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

First patch is not really related, but it's some cleanup I've found
while looking at the other fixes.  Patch 2 extends the IOMMU logic to
prevent re-writing the same MSI message.

Thanks, Roger.

Roger Pau Monne (2):
  x86/apic: remove delivery and destination mode fields from drivers
  x86/iommu: avoid MSI address and data writes if IRT index hasn't
    changed

 xen/arch/x86/genapic/bigsmp.c            |  2 --
 xen/arch/x86/genapic/default.c           |  2 --
 xen/arch/x86/genapic/x2apic.c            |  4 ----
 xen/arch/x86/hpet.c                      |  6 +++++-
 xen/arch/x86/hvm/vmx/vmx.c               |  4 +++-
 xen/arch/x86/include/asm/genapic.h       |  5 -----
 xen/arch/x86/io_apic.c                   | 16 ++++++++--------
 xen/arch/x86/msi.c                       | 22 +++++++++-------------
 xen/drivers/passthrough/amd/iommu_intr.c |  4 ++--
 xen/drivers/passthrough/vtd/intremap.c   |  4 +++-
 xen/include/xen/iommu.h                  |  6 ++++++
 11 files changed, 36 insertions(+), 39 deletions(-)

-- 
2.48.1


