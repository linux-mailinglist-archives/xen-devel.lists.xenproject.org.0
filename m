Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74138A38CA5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 20:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890814.1299964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk72f-00062D-PQ; Mon, 17 Feb 2025 19:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890814.1299964; Mon, 17 Feb 2025 19:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk72f-00060E-MD; Mon, 17 Feb 2025 19:44:33 +0000
Received: by outflank-mailman (input) for mailman id 890814;
 Mon, 17 Feb 2025 19:44:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk72e-0005w6-Dx
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 19:44:32 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98443ff2-ed67-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 20:44:26 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-439846bc7eeso8187955e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 11:44:26 -0800 (PST)
Received: from andrewcoop.. (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a06d22csm161547025e9.22.2025.02.17.11.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:44:23 -0800 (PST)
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
X-Inumbo-ID: 98443ff2-ed67-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739821465; x=1740426265; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yP1wxryyhWPR0UYVLI882uiLGQethpi+m5a0U1C5NfY=;
        b=bZ+H/nBRgebZWBkp/35U4x8kL+rIySk/T7ZUq+1jn6vd01eV6pFMEYWPOxPkmkaagC
         9BVtg2litSr91Lsi497+J7xOEXoyqkaiLjzpbTq2nyLRmoeggekn/zIgEx/7EDtIvl6f
         nVBp9l4WyJ86BJChTVSwF2fEY8T2L8nwWS8OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739821465; x=1740426265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yP1wxryyhWPR0UYVLI882uiLGQethpi+m5a0U1C5NfY=;
        b=Vm2zBStwvntjVN6BH15I9tLv4dJBTrBDBEK/YME/Q0/nfTUvVuYrTWNNUE057dN4PO
         84FHsVlsPZITSBfnqyGF+AfPAQHj1lA+LwwrBhQ7zUdXGoJecIhhhUpD8TVhnCWbS1fS
         WUDVYbzzCsw/Zqb0ua9BW7j3WmRuIOEo0SSLgXUm1hxW5gBjUNQfpVP7/RJM36HdSjvJ
         gsg0Hv5nE9Pt49y28kuIoY5dhfKh7SPZOaofk46Y4AMfo21Y3uAm7E6I3vT+vbfnzxXv
         8ogYXRHBM3wSmDgByoVii+xzW/kXJVtbPKKKSUVCDLwOY6J55oA5ZdHZnhu4zyUZp7rC
         XIyg==
X-Gm-Message-State: AOJu0Yx3XNG0eXUWzBnqpjNMEIGhdJxdUye5/DcH0n7VnrM43PCVaiBd
	eSs6fH7qtpMg3mhKvI/EXxMAVkn6PJJH+mNoGMC04MbZ7iAmTLhIh8abDaIjHPa3huJMx6yzXj8
	H
X-Gm-Gg: ASbGncvrZaCyrJKd3KG68wa7SErOgMoNdyc5kgWwLZ17VOvwjpY3jdfAMQA2VSJlSpH
	clF1qp3Th6RMF4aLiPZE+lLJaZuyyHHJE2nxhUrVsoMLjHBXEKPJJZRdDargDGcpcPSx+xHMBA/
	xvqpzqk0oEjrTWdjwUnngPka9vg6jTdF0UulNSxe85OjdJABFnkJpqGdMaY61+8UzeZ7KFGoJRP
	LM44w6AM74UjYNfYN8WedGAPaQ9lb96hYVBbvKHZQR+MX6q731WyyxkZ8qVPn3gXOwo8A272/AE
	3B3pDXREq8oQ7V8oRD3BXjNchbR721epoINgQiIfIoStewoQgGzW
X-Google-Smtp-Source: AGHT+IHuRZFJATWSuRE87A/eaWd+iKKB4lC84am6eo0jKyx/jhpZVrwQOGwR1nCubhkt/V7pLWgMbA==
X-Received: by 2002:a05:600c:4e45:b0:439:8346:505f with SMTP id 5b1f17b1804b1-4398346524amr42691355e9.20.1739821464832;
        Mon, 17 Feb 2025 11:44:24 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/3] xen/console: Fix truncation of panic() messages
Date: Mon, 17 Feb 2025 19:44:18 +0000
Message-Id: <20250217194421.601813-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This taken from a security series (hence partially reviewed already), and
thought it only applied to a forthcoming selftest, but then Ayan posted a
truncated example to Matrix.

Patch 1 should be considered for 4.20 at this point.  Patches 2 and 3 can
definitely wait until 4.21 opens.

Andrew Cooper (3):
  xen/console: Fix truncation of panic() messages
  xen/console: Optimise parameter order of vprintk_common()
  xen/ACPI: Drop local acpi_os_{v,}printf() and use plain {v,}printk()

 xen/drivers/acpi/osl.c      | 17 -----------------
 xen/drivers/char/console.c  | 25 +++++++++++++++----------
 xen/include/acpi/acpiosxf.h |  5 ++---
 xen/include/xen/lib.h       |  2 ++
 4 files changed, 19 insertions(+), 30 deletions(-)


base-commit: 414dde38b0cf8a38230c8c3f9e8564da9762e743
-- 
2.39.5


