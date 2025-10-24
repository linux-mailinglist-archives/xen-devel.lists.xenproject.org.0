Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4450C06E5A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 17:14:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150494.1481631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCJUd-0007gw-FM; Fri, 24 Oct 2025 15:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150494.1481631; Fri, 24 Oct 2025 15:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCJUd-0007dZ-Bs; Fri, 24 Oct 2025 15:14:15 +0000
Received: by outflank-mailman (input) for mailman id 1150494;
 Fri, 24 Oct 2025 15:14:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Pi=5B=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vCJUb-0007d7-LC
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 15:14:13 +0000
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [2607:f8b0:4864:20::112a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 185e386a-b0ec-11f0-9d16-b5c5bf9af7f9;
 Fri, 24 Oct 2025 17:14:12 +0200 (CEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-783fa3aa122so28300627b3.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Oct 2025 08:14:12 -0700 (PDT)
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
X-Inumbo-ID: 185e386a-b0ec-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761318851; x=1761923651; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WJ0DlXsWB3lXn6qzkmhT6yfFmHsMvuMvv+LUU+rxDZ4=;
        b=LEmTn1R+huN2Um+Xk7Pvxc/UhCouDv9DJEIWfhaK2MiJUv2x/X0b9VhLgmebsDnFDI
         Qxp5AguOkIMze/cVXZ+LC3h2HfRHWlUnzH9i7jmt1uQbedpdCYmpUs9FoOUJe8Lo2Elq
         +oMhYzH0HqcR7+GCegHe4QfdQiYFzkfwny5bvNVZ9QofCQ0l+r5fFJS9NpcekUlXGewJ
         HLxyHiSB1YXlccq/UkFcgpHGy7JoPM5CUujFMVV4aITnEFG4kSDj4FHE7WJO3rWvXrN0
         b7j2eNMhQNR4DY9rdu+sHGjP81Q1yz66GUWuD1DjlNEWl9eIw8su1cxBifVEtWclCnkJ
         kKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761318851; x=1761923651;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WJ0DlXsWB3lXn6qzkmhT6yfFmHsMvuMvv+LUU+rxDZ4=;
        b=TE/UcroNUVRfNywGxkucn3uyVbacIbJhHRS4u9h9NJJvrxixPoI5cp+DolS5O0l43O
         wI2elaf599OpyPUVgnYTEkUzUM/AlMDG56O4yJqCnCCj6Pa1NlXFk1/3HXV2rMheizC9
         BUQT+7+aE1JL/gJWhF0sTQyiRYrLOfQD6mlPuxrqrSCIjnvHs9uknp5AKfWQxHbKrqsL
         26OFdcE60tscvqc+gQVOrU6AJra9eWP9DZpVRJDWofXI05RxltEOIxP70AFRSuLLAkt9
         9cZqG62dre6UYTJTaXAViiNFccKa9Kp0py5Vwymg3uXlXXxLjFjwAhNC+FrqMjwkEv55
         h8Hw==
X-Gm-Message-State: AOJu0Yye+LewfCDQR6xHUtQjRItcBhshsH3HWhop7GSwJKt6vxA6q5ly
	i8dzpaEoy+tO6QQ7alThs/PNsME00AHkmZObbaNZt8CoOI1jWcuRw2SuKfGsomLoxcdxj2MTGd7
	cPoq0Xo2gg9xPrmMujt4Oqpe3xk5OXmu4Tz2A
X-Gm-Gg: ASbGnctzRteIfLBbQe1xz1men2mqcocKGUVqDj0srwikqwCSo8l750qrlorZR+dIotE
	NDrpCBXWqbp5E2TWZ2jyIuu0s+0ilfElke4Esy5RkeL64JM3wbwA/rgHIdPNVdnEVydGG5iraDf
	MAmhF9dPzPDFm/vJuNUJ8b7bRcpFsUU/3TMlskYiI8CC4+REOjGvaeHSpAUE9zovDK4kbi0Ubyx
	9m6DL65iQntNMcsSR0hD/YfpAa9mqcJKxGjflhEcsiFwDmyc2oSez7XWeqO/Lly5jOm3VU=
X-Google-Smtp-Source: AGHT+IEzJCApxnoXZOIUwZ1yJTXIVESfMYa0RWxpbxL8/5UuCmUAHSGKBNfckZRTx3ylp6Tv+SaFmIr33SWAs66RtMQ=
X-Received: by 2002:a05:690c:4681:b0:784:827c:1cd3 with SMTP id
 00721157ae682-785dd678943mr27358177b3.31.1761318850708; Fri, 24 Oct 2025
 08:14:10 -0700 (PDT)
MIME-Version: 1.0
From: Frediano Ziglio <freddy77@gmail.com>
Date: Fri, 24 Oct 2025 16:13:59 +0100
X-Gm-Features: AS18NWC6kts6ML4PoB1UbSIvaAjyE9HitqE8HXwWlW2I6g-WGKNUixJyq0aeLwU
Message-ID: <CAHt6W4dnM1pLMnDVyywc_2d-6nry7pFCYomSvRjyuH7sRm0J4Q@mail.gmail.com>
Subject: [PATCH] xen/pci: prevent infinite loop for faulty SR-IOV cards
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"

If a SR-IOV card presents an I/O space inside a BAR the
code will continue to loop on the same card.
This is due to the missing increment of the cycle variable.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/drivers/passthrough/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 3edcfa8a04..52c22fa50c 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -746,6 +746,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
                     printk(XENLOG_WARNING
                            "SR-IOV device %pp with vf BAR%u in IO space\n",
                            &pdev->sbdf, i);
+                    ++i;
                     continue;
                 }
                 ret = pci_size_mem_bar(pdev->sbdf, idx, NULL,
-- 
2.43.0

