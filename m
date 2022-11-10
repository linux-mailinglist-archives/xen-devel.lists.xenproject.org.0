Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC36247C9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 18:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442030.696082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otAuI-00038Z-SD; Thu, 10 Nov 2022 17:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442030.696082; Thu, 10 Nov 2022 17:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otAuI-00036a-MB; Thu, 10 Nov 2022 17:00:02 +0000
Received: by outflank-mailman (input) for mailman id 442030;
 Thu, 10 Nov 2022 17:00:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqAE=3K=gmail.com=d.vrabel.98@srs-se1.protection.inumbo.net>)
 id 1otAuG-0002uf-MF
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 17:00:00 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c2dcb2e-6119-11ed-8fd2-01056ac49cbb;
 Thu, 10 Nov 2022 17:59:59 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so3896581wmb.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Nov 2022 08:59:59 -0800 (PST)
Received: from pear.davidvrabel.org.uk (pear.davidvrabel.org.uk.
 [82.70.146.41]) by smtp.googlemail.com with ESMTPSA id
 j5-20020a05600c1c0500b003cfbbd54178sm9403666wms.2.2022.11.10.08.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 08:59:56 -0800 (PST)
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
X-Inumbo-ID: 1c2dcb2e-6119-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jR9sL9xZ87Lim2oBNCVC1s9tGbb7OCjb5ynHIotoKw0=;
        b=qWbUXpUaZO2M2dtX+vIvfmPuj/g8QkzNqZBcpZu9CWe3QeQ04ksOAu1srnyERkmOtf
         SwWmFHXm+onT912QNEFJPrLOiWNBoo+Hv5iP8n1AWuXad+ap5XCyggjv3vK32Gjjg97W
         uSE9r3qCFM/2wJuVBamxEK4si+AgfN2k4MiAYE/xs/KdYrrFRw+ECvs69G7BjqnGIE3N
         v2008s552u9U5FsZfnB5aSzIjiQkhODxiWSyRagwjJMbAVJLWXK32ZpDpvtHtiZU7f6a
         9fHSwRpjo4LpKCuEPAySmM4eJIBJSN4JE4ZDdSNGaIe8ScldymXeFqnmAltzNPmsLaZ6
         EMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jR9sL9xZ87Lim2oBNCVC1s9tGbb7OCjb5ynHIotoKw0=;
        b=JkJMtSzCCnj4tauxY6EAjQzawqwLKbVkh3MmPTNES9z90kbnKkQ8rNRiwOJa6muz1y
         VDecGzCjxtR6OB9ybxVYg514PxkAAzVYAWD227GFdBcmq74YMzfP0mDEk4nWufpJYlHZ
         jOsY+IITerkpX1C5N2HNkoRiJC8yWBxmgXO4HOjSsc5iaRJ1kCd9LncLNGKGf7cWUtiK
         NslsDDCRimjX/AvWA61WJnv50w6R00QyQp9BKMPEkcTZIGZUbzFsDOinqijqMHfIZkkM
         6Yjw+FFRDSG++9SkdeLEAHOjdMOkBCDx//zeGWfb8ZV0gTbKWI+IpDguRF1PUBNPzP3b
         fPQQ==
X-Gm-Message-State: ACrzQf2XPicgPpjgLaHH72Xe0vJ4ruGmrERJsEM9i+Zac8LmEuDrkVwD
	qKVN4kcuRrWZhndr6ln/LsVBg/oA+jQ=
X-Google-Smtp-Source: AMsMyM6n1OFHG8Zd8JC3d6UsF+ZjrzWpShMVJmuZY4jAtLsdc3XLhCBK16lMu+nx1LpJfKfi/GEBkQ==
X-Received: by 2002:a7b:c30c:0:b0:3c6:f26a:590f with SMTP id k12-20020a7bc30c000000b003c6f26a590fmr44268221wmj.205.1668099598900;
        Thu, 10 Nov 2022 08:59:58 -0800 (PST)
Sender: David Vrabel <d.vrabel.98@gmail.com>
From: David Vrabel <dvrabel@cantab.net>
X-Google-Original-From: David Vrabel <dvrabel@amazon.co.uk>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	David Vrabel <dvrabel@amazon.co.uk>
Subject: [PATCH 0/3] x86: Fix racy accesses to MSI-X Control register
Date: Thu, 10 Nov 2022 16:59:32 +0000
Message-Id: <20221110165935.106376-1-dvrabel@amazon.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The main patch in this series is 3/3 with some preparatory patches to
simplify the implementation. To summarize:

    Concurrent access the the MSI-X control register are not serialized
    with a suitable lock. For example, in msix_capability_init() access
    use the pcidevs_lock() but some calls to msi_set_mask_bit() use the
    interrupt descriptor lock.
    
    This can lead to MSI-X being incorrectly disabled and subsequent
    failures due to msix_memory_decoded() calls that check for MSI-X being
    enabled.

David



