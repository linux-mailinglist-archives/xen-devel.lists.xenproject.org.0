Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35911A35A61
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 10:30:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888661.1297996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tis1E-0004kS-EN; Fri, 14 Feb 2025 09:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888661.1297996; Fri, 14 Feb 2025 09:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tis1E-0004iN-Ba; Fri, 14 Feb 2025 09:29:56 +0000
Received: by outflank-mailman (input) for mailman id 888661;
 Fri, 14 Feb 2025 09:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zro/=VF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tis1D-0004iH-Hm
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 09:29:55 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fb2d732-eab6-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 10:29:54 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ab7c07e8b9bso320309666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 01:29:54 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1d3624sm2674712a12.40.2025.02.14.01.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 01:29:53 -0800 (PST)
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
X-Inumbo-ID: 3fb2d732-eab6-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739525394; x=1740130194; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOFRBVGMnECkLmUYkKT1HCYd2bRsvyL13eaM0SoaRxU=;
        b=nyJsuj3wc7PIMYlm6CP7+JOnKXZj8+QgD1aBs6TJq7/BYKLuKzXOKStl5kzgdW7DYm
         j7doMFifD1trJjjR/MElc8zkbOV4EGZuNvyKx0r9HVG45OmiClNQHApeR5/VZexxhpli
         tAlxhD0RRiZDYry0dP1kc30nsQalzMISj/mps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739525394; x=1740130194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOFRBVGMnECkLmUYkKT1HCYd2bRsvyL13eaM0SoaRxU=;
        b=i4HAnouXFhOqFdhyt80+XHi5OXRNE0vpJUv3ZJzBOvxzM0em9UyYwz7xCT2an+yRph
         k3NU09ZRPKRzcDtOBYMKl3So5lmIiT29QM2AvTpg0O/FMA8+sQ/wjBoDMgU6WteaKsZk
         zZzOEbk8lQn9i7z40W11PEN13qCxQ3BZ80T7KXNVqoGWQPYdZzN3Col/TFRpW71uH0au
         wsde6SnZDKVPuroCh69Gdl3VeSb+kOni5GO2SBlAq3mRU0OZC1knHLo1BALZIHrzyWUi
         MlScEK0dD+3TcHnmk1VpQ9d8t4j6o30/MthhQ7dvlFfLQyTAFni7tq/SZ6t6NdtIB93P
         hxVA==
X-Gm-Message-State: AOJu0YzFR/N1HnDhH5eVsDEQ1nSC8cN3KD+2M00Trg92gms5gb3/qrGD
	Rh339h9GpT+HGrWoL4l97qVKhhpfdej3+36b9kVUR5uHHS/ncYVIU+d+3YEdAJr1Fns64Qhh1vS
	m
X-Gm-Gg: ASbGncu23ey+YQEKja2wUszEJGeHsRWDd+tmZbQwEiijumXUYfF0Y2C+2/dYWjpQurG
	Fz62V+voMj7Kwx1MpMsrwihFlmyloajzN/cevNrriMR0M67NVvhMk6Tty0Da5PJ4lSNPZpCYyt1
	Szz6VbjgrMTB5M5TW4V2hl+nslCbzKHly7+RQe7k/aeNYu61IR9CXgvCo7UaSkb3B9UOhxQaywl
	GzbHNtuCvVLUZeyRfxHopU0fK4zgUPcx1yUabsQK49ZEEFH2OfX4xyFZQuXIuxntR77bZNxwl5A
	/c3HO3mjnOPdH7h1p/dVVnS2tw==
X-Google-Smtp-Source: AGHT+IHvWi5d+8lYedHXNe+Uk+Eem6DHtFsgoU/UJsMlegUcSdG3w7FeIdmTSZ5oQrkWbtZdLkyMIA==
X-Received: by 2002:a17:907:97cd:b0:ab7:b0e4:aa93 with SMTP id a640c23a62f3a-ab7f33bec22mr866782166b.13.1739525393777;
        Fri, 14 Feb 2025 01:29:53 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] x86/pvh: workaround missing MMIO regions in dom0 p2m
Date: Fri, 14 Feb 2025 10:29:26 +0100
Message-ID: <20250214092928.28932-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The aim of this series is to provide a workaround for better handling
missing MMIO regions in a PVH dom0 p2m.  Xen doesn't know the complete
host memory layout, as it's not able to parse any information from
dynamic ACPI tables.  Hence the p2m built for a PVH dom0 might be
missing some MMIO regions only described in ACPI.

Since a PVH dom0 has no way to request the mapping of such regions (and
adding one would also require dom0 kernel modifications) instead provide
an option for Xen to add those MMIO regions as part of handling p2m
page-faults.  The option is currently off by default.

Thanks, Roger.

Roger Pau Monne (2):
  x86/emul: dump unhandled memory accesses for PVH dom0
  x86/dom0: attempt to fixup p2m page-faults for PVH dom0

 CHANGELOG.md                       | 10 +++++++++
 docs/misc/xen-command-line.pandoc  | 16 ++++++++++++++-
 xen/arch/x86/dom0_build.c          |  4 ++++
 xen/arch/x86/hvm/emulate.c         | 33 ++++++++++++++++++++++++++++++
 xen/arch/x86/hvm/hvm.c             | 31 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h |  5 +++++
 6 files changed, 98 insertions(+), 1 deletion(-)

-- 
2.46.0


