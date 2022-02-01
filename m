Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5D94A6150
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 17:25:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263634.456459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEvy3-0006BV-9f; Tue, 01 Feb 2022 16:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263634.456459; Tue, 01 Feb 2022 16:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEvy3-00067a-6L; Tue, 01 Feb 2022 16:25:19 +0000
Received: by outflank-mailman (input) for mailman id 263634;
 Tue, 01 Feb 2022 16:25:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=scQ7=SQ=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nEvy0-0005Ky-WE
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 16:25:17 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a11fe43-837b-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 17:25:16 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id x23so35118682lfc.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Feb 2022 08:25:16 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id z20sm2037887ljn.92.2022.02.01.08.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 08:25:15 -0800 (PST)
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
X-Inumbo-ID: 8a11fe43-837b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O5iQETph6W13NDJUtDiBUfFdxzLSUx1dcP7y4KZ0Jn4=;
        b=Knowkl1OOo7PkZEnyXfB0uQdghQi1oSTzc8ntrp5jfpt8BnMjo+t1cybbx3gzhczJ4
         rpQJgV4JPsFS3JSxQwcmmphJEUMBkm4Cx6TpvXhoojeZT+sI+WIO7sKQy9qSi/P5AxRg
         lTqJuLdBeNyBw0CRAGUvZieuUDHv5wIi6Vd2b1ZA89AdxnOSBM7ux5lTuyUCOHRxMp0o
         pQtl7ruyA+uUDJNKpkJ4VLl8snI54POPpIyvvBLQxGuL4dLSCMG1sJL9xdwbCbx8XQdy
         gerT5iPbHu5KxKDJRWETvL3F6KNtzdoe25xHTDeM5RyQ8zB7uUmQB2Jy7ocyrsIepEJY
         0Lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O5iQETph6W13NDJUtDiBUfFdxzLSUx1dcP7y4KZ0Jn4=;
        b=03l+PPFZ++vRDbU3RIwTn2YiDAXQv2//BxI+gPMgWU490PfhlxCMWE9uoCA0MYBmHP
         P0QHX+lYnW9zxOFkiUCQdymcFbBF6hSS0hm4NDZbHpKw0XSnULtiC8S3S/2vmWqRTTFY
         Kb6uHFlZFLPAP77X8cWccMUVUTM/Tz5mY15txuqkO2+GUtCheYPDUCyDOH+YVDse6u0H
         x1PIG04QvFirMBwQyRyGXY1i8aDjoTpsIoXV3ACA/Glo0FvFkCpbCcJxGmqz3TZxkb44
         tzigHOOyhtNSeZiJK/n6ylvCWE/F5LuE8JX0hicipnMGggFAwsrexcEhUZJDF3ShGh/I
         6hjA==
X-Gm-Message-State: AOAM530W8kYBK3ubw2Bfe+3UzawcneeewfQ3T/P0czaLRPgQGA4xP9YF
	G5qlKhrmiJ2KiHqo4ZBpno3nk69QEl8=
X-Google-Smtp-Source: ABdhPJxALpiNGj4uqi5Ow3ML9Pg+P88S0Or/Bob/aFSPygbzA+vBkcO/PeE6dA6LrJe4HTVnHNR8Eg==
X-Received: by 2002:a05:6512:1049:: with SMTP id c9mr16194147lfb.554.1643732715753;
        Tue, 01 Feb 2022 08:25:15 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 3/4] vpci: shrink critical section in vpci_{read/write}
Date: Tue,  1 Feb 2022 18:25:07 +0200
Message-Id: <20220201162508.417008-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201162508.417008-1-andr2000@gmail.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Shrink critical section in vpci_{read/write} as racing calls to
vpci_{read,write}_hw() shouldn't be a problem. Those are just wrappers
around pci_conf_{read,write} functions, and the required locking (in
case of using the IO ports) is already taken care in pci_conf_{read,write}.

Please note, that we anyways split 64bit writes into two 32bit ones
without taking the lock for the whole duration of the access, so it is
possible to see a partially updated state as a result of a 64bit write:
the PCI(e) specification don't seem to specify whether the ECAM is allowed
to split memory transactions into multiple Configuration Requests and
whether those could then interleave with requests from a different CPU.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
New in v6
---
 xen/drivers/vpci/vpci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 657697fe3406..fb0947179b79 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -370,6 +370,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
             break;
         ASSERT(data_offset < size);
     }
+    spin_unlock(&pdev->vpci->lock);
 
     if ( data_offset < size )
     {
@@ -379,7 +380,6 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 
         data = merge_result(data, tmp_data, size - data_offset, data_offset);
     }
-    spin_unlock(&pdev->vpci->lock);
 
     return data & (0xffffffff >> (32 - 8 * size));
 }
@@ -475,13 +475,12 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
             break;
         ASSERT(data_offset < size);
     }
+    spin_unlock(&pdev->vpci->lock);
 
     if ( data_offset < size )
         /* Tailing gap, write the remaining. */
         vpci_write_hw(sbdf, reg + data_offset, size - data_offset,
                       data >> (data_offset * 8));
-
-    spin_unlock(&pdev->vpci->lock);
 }
 
 /* Helper function to check an access size and alignment on vpci space. */
-- 
2.25.1


