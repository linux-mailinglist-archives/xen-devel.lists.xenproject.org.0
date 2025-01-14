Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC6FA1044D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 11:35:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871107.1282144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXeG2-0006UU-8L; Tue, 14 Jan 2025 10:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871107.1282144; Tue, 14 Jan 2025 10:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXeG2-0006St-45; Tue, 14 Jan 2025 10:34:50 +0000
Received: by outflank-mailman (input) for mailman id 871107;
 Tue, 14 Jan 2025 10:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLru=UG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXeG1-0006Sh-8o
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 10:34:49 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bc6535e-d263-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 11:34:45 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aab925654d9so298300866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 02:34:45 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c956479asm611975466b.116.2025.01.14.02.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 02:34:44 -0800 (PST)
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
X-Inumbo-ID: 2bc6535e-d263-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736850885; x=1737455685; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQwSjXI241hYCdXgNAwQNCsum6/0WR1kpNNnkcYE330=;
        b=sCrjstGYfihAhzrp2wvEczUzvmmvwOHwHwSSgja7L94SUTNiYQaGULrXTz0ZK0GIPN
         y+n8v0SPd4jv7WCPEuYcj0oxtb73o0EO81KiBKLjB7pYv9rnCV1wh0Sz9NEU27LqENN/
         fy/UEpm4pDn/mmUGfI50aD5U6zp4rQAO7ppbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736850885; x=1737455685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQwSjXI241hYCdXgNAwQNCsum6/0WR1kpNNnkcYE330=;
        b=Gfn/WGESkCTKGvcKHR8OWSxqp10wh+grrM2Nwvbx1DdJex3vEekNwOGIwD2f38HJAv
         nzMGdv9WRKw1Pz8cpMUzD5/XxWzs2oP3Vmzvqo5u1xNF1AfNhGAq2HsQNjhtV1TAkg6d
         38eHe6oeZXpv3h7vP3R85tXYtm6jNTCdenOSmT7JX9gl6mv6Yklm33k0AnDO7gvM/OAZ
         PSCuPme/ddyy42wsrafiE0WwDJm3kMQBsRoSswBuMMUWqCuxJf3iWR/eaVfdvKK0PeYh
         KbYo6pK1sFAybu5xv3naS87/j4OIC8zetZR2Sb0MIiF1aZExbQhzX+O/FqqqDugwJFVd
         DvQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeIKSaY+e5zfqBsAwSSICAjPZHohErvSDtBlw1pGSbQgEb5ZPymNkaZPSBIZiFIZND0pxFR9MEvlQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1ww9YanU5FFynDjXVSNyWxqe8ATRZxGsmMMsv0bqpZP2wHnaB
	Leuf/IBWEzEpMTCloEFlfbK9h6KBSddhxJnkZB5CfdS29IMVkMtkjBQ1Sbg+XQs=
X-Gm-Gg: ASbGncucP59tEC+sGG5lENQJIdA05Dx5BiQWZqFeqB48oOn7Xh6bQLq1hjbnK5WEuQI
	A/9mgEgtCPTmK5pPV/cpMTod4X/MRQ75tvcLGTNWmsu1Xcbpt1wdt5NR+XfXfzhf8Z+FY3JizMV
	4Q0mHrhX8fOkOykzyhdObB10hL4NmCnMTVOHuTN8FUyM8FaJqos3CRtJ/k/vayu4szUfTOEyykP
	WKjKLkrhCYRSIBwVZXfpaVlEYLbovGF2u3I9LVa9FNU8Fvzb4qmNRLSD60Z7MtGRBw=
X-Google-Smtp-Source: AGHT+IGj7ARHxTxMk2ZMpt+SBomtNarwYt9nXspoozduRWM9XmoJhTSEuJ+ewJ9qdrVRqwpHP4I48w==
X-Received: by 2002:a17:907:704:b0:aae:bd36:b198 with SMTP id a640c23a62f3a-ab2abcab421mr2297280466b.47.1736850884836;
        Tue, 14 Jan 2025 02:34:44 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 0/3] xen: fix usage of devices behind a VMD bridge
Date: Tue, 14 Jan 2025 11:33:10 +0100
Message-ID: <20250114103315.51328-1-roger.pau@citrix.com>
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
  xen/pci: do not register devices with segments >= 0x10000
  vmd: disable MSI remapping bypass under Xen
  pci/msi: remove pci_msi_ignore_mask

 arch/x86/pci/xen.c           |  8 ++------
 drivers/pci/controller/vmd.c | 19 ++++++++++++++++++
 drivers/pci/msi/msi.c        | 37 ++++++++++++++++++++----------------
 drivers/xen/pci.c            | 19 ++++++++++++++++++
 include/linux/msi.h          |  3 ++-
 kernel/irq/msi.c             |  2 +-
 6 files changed, 64 insertions(+), 24 deletions(-)

-- 
2.46.0


