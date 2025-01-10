Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB4CA092D2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 15:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869650.1281096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFaJ-0008AA-2e; Fri, 10 Jan 2025 14:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869650.1281096; Fri, 10 Jan 2025 14:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFaI-00087p-VX; Fri, 10 Jan 2025 14:01:58 +0000
Received: by outflank-mailman (input) for mailman id 869650;
 Fri, 10 Jan 2025 14:01:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWFaI-00087j-Gi
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 14:01:58 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73e8d95d-cf5b-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 15:01:56 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa6c0d1833eso440401766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 06:01:56 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b1d5esm170012066b.150.2025.01.10.06.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 06:01:55 -0800 (PST)
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
X-Inumbo-ID: 73e8d95d-cf5b-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736517716; x=1737122516; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg/OeKC7JOP+lwGkLt7//94jc+2XfyOiIRB1LLufRSc=;
        b=qOzPR2jrQzJH+BmeetHpWN+LsuhdeHU3Ukcy1QWRn0r9k3NOR+B98jhnzuKhqQD0so
         +mOBCONUzlzNGeY6CVRTJPCtRyoOJ5t+dlHniBMdaRYVJC+S400pyVEBgUDMYVRICcMW
         2+knIscJ6slnMFw4cPo4wptBcVIJTWusm/ZKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736517716; x=1737122516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wg/OeKC7JOP+lwGkLt7//94jc+2XfyOiIRB1LLufRSc=;
        b=rEEosbHuM+nkLQ1b7VTCyztuUx9rtVNbnaWNUBpxbZ0+785o0O6fl4hQRqUe6eNgKd
         GaJTrFg86Z5N8eD+tr3PBZmnXXW7cDTkLKXkfQXRVVUILKjt1Vy2KtvwiZtVLANKZjyu
         3xQwYSq9PmisnXWIY64JT/tw6LrKyDNJso9nr27hT3pMMdjtkpB+tQsEXywxpuqcTnlS
         9hslSrCmu0ptfNyDh+cdxcWw20FbUQIyugJXRBhV/QlKJeeAAo49XhA3jZookZb4VfTA
         0q0mo0a9wNjw51X537VLVVCe2PGjHwE+5Zb1ZPxFg4Q5N+ejircCtsOiadArt1W4mwM/
         go4g==
X-Forwarded-Encrypted: i=1; AJvYcCU1/mAOA9br+Ep75GgCsvJHuv458dtAOlNpbOjU2W9to4LyWuM+X2Yp+7+giwxRlww080GfqdhjJDA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJuvOHGKGu8fCSSGPfGasmDjhq04u0Wm4684RRlECnhXSViD9G
	KEo8uRrJx2pda6IUjrZbdKNoe0OqYM5MNVpKxOZbT6MndFkyKU2SbGQXfHrs8AU=
X-Gm-Gg: ASbGncsbNtcHs5X+E3b8kxOyAq2/Sw9+ww0ITtSBaDoaC1X+VyvJ4xe5P/IFcx+ANvO
	+wBm7aLFo3IH0h/cu/03WQXECRABsimco31MdiXM4QyvcvgT/2DsPrgpIP4izPnyWGhWX5lKTLf
	02wji0y3vCgwDWqRD1qnw6KRhuGvA9CRfTpJ8f5BgVYRtR56ZD61ZE7+OIm6jyKF2xka7BqsWc2
	Aswo3AUv//Uw724X/Q/VHi9nAuyzo2Q9WKRNF3idzltSYenc1CQTlOBLMQSfjPNtRs=
X-Google-Smtp-Source: AGHT+IF6zKX/JETAEN1y5chRI/4N29iRAkR+x2KPiI4g6LnWuOntCCHsIZUKA7ISZFit2XhqqCxJnA==
X-Received: by 2002:a17:907:980f:b0:aa6:993a:259f with SMTP id a640c23a62f3a-ab2abcac230mr976852166b.40.1736517715855;
        Fri, 10 Jan 2025 06:01:55 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/3] xen: fix usage of devices behind a VMD bridge
Date: Fri, 10 Jan 2025 15:01:47 +0100
Message-ID: <20250110140152.27624-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series should fix the usage of devices behind a VMD bridge
when running Linux as a Xen PV hardware domain (dom0).  I've only been
able to test PV. I think PVH should also work but I don't have hardware
capable of testing it right now.

I don't expect the first two patches to be problematic, the last patch
is likely to be more controversial.  I've tested it internally and
didn't see any issues, but my testing of PV mode is mostly limited to
dom0.

Thanks, Roger.

Roger Pau Monne (3):
  xen/pci: do not register devices outside of PCI segment scope
  vmd: disable MSI remapping bypass under Xen
  pci/msi: remove pci_msi_ignore_mask

 arch/x86/pci/xen.c           |  8 ++------
 drivers/pci/controller/vmd.c |  9 +++++++++
 drivers/pci/msi/msi.c        | 36 ++++++++++++++++++++----------------
 drivers/xen/pci.c            | 19 +++++++++++++++++++
 include/linux/msi.h          |  3 ++-
 kernel/irq/msi.c             |  2 +-
 6 files changed, 53 insertions(+), 24 deletions(-)

-- 
2.46.0


