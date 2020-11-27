Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FD32C691A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 17:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39623.72574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kigHI-0001rP-FQ; Fri, 27 Nov 2020 16:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39623.72574; Fri, 27 Nov 2020 16:07:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kigHI-0001qz-C7; Fri, 27 Nov 2020 16:07:20 +0000
Received: by outflank-mailman (input) for mailman id 39623;
 Fri, 27 Nov 2020 16:07:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3FF1=FB=redhat.com=trix@srs-us1.protection.inumbo.net>)
 id 1kigHG-0001qs-Bp
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 16:07:18 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 85f75f21-a658-4529-8fb8-386dfb0ae8ae;
 Fri, 27 Nov 2020 16:07:16 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-BwW6imh3OGuofZcwe0icgA-1; Fri, 27 Nov 2020 11:07:14 -0500
Received: by mail-qv1-f69.google.com with SMTP id v8so3324981qvq.12
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2020 08:07:14 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id u22sm6252620qkk.51.2020.11.27.08.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 08:07:13 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3FF1=FB=redhat.com=trix@srs-us1.protection.inumbo.net>)
	id 1kigHG-0001qs-Bp
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 16:07:18 +0000
X-Inumbo-ID: 85f75f21-a658-4529-8fb8-386dfb0ae8ae
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 85f75f21-a658-4529-8fb8-386dfb0ae8ae;
	Fri, 27 Nov 2020 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606493236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type;
	bh=TsMD7b3MnWExoEfBuHmM8Gy0J5MPvPWD/mFWcwpBdWg=;
	b=CkShzpfcPmuV2PZI7PvezdHXAMKEvddi22lMdvyp1ZhtJquNWD2zYm8aTUx/BlFL71/m6E
	B+6HLg9ZB7JPw3nVq47ohzpnti5TFcj3FbHNE4//1PInz2VnkCXBnHArZsz8A8tl1BzTFj
	qNBkv4OdnpDJ8B6B6Sl625k5fN7X0Rg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-BwW6imh3OGuofZcwe0icgA-1; Fri, 27 Nov 2020 11:07:14 -0500
X-MC-Unique: BwW6imh3OGuofZcwe0icgA-1
Received: by mail-qv1-f69.google.com with SMTP id v8so3324981qvq.12
        for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2020 08:07:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TsMD7b3MnWExoEfBuHmM8Gy0J5MPvPWD/mFWcwpBdWg=;
        b=F/7np+AnStIztfaA1dPYzlsCEqqYmlhIUnjfOIhaYfPWjecyZjGg2weN7R2h8kV4PC
         iq4Q9rR7hLny54mhHNClRNFZAYnvKjEjWb3ycBZBFUHxhgIGU0hYQ6fTonzN7BHQLdxm
         OVU5LQbhwNIXjI0eXleDfzDUfSkPXS+9W72+l9JOR7EtcesUxTeU3igNuaPB/Ii2GkHK
         d7SAoyhcqG/LNis883TMnNwf4UqcrXL8paQmXgcNUKyijyUvR0JVZHbDamoXn7uP02B4
         bgpFjKm7wSfl1teQzSuiL4PBYMc8Q6n2gsDy3c9YHBpbmAS3Z/t+G1WiC4LZbTn+2Knu
         Y37g==
X-Gm-Message-State: AOAM533nULVoQHKxtUtjdCHikgLPlBZKEk/xvG/+621p02GfwVdU73PI
	g49jMY0+pSLxzcBNHE/2I/byd5wh0Mt2McaX+S8OerMfE+4PVqMZvZi1oZ6TQ+SadyVRopJ6nea
	ADh3Lsk3UqX27/gK7JYBjCt/XbCU=
X-Received: by 2002:ac8:5059:: with SMTP id h25mr8937155qtm.283.1606493234320;
        Fri, 27 Nov 2020 08:07:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+zzViQ6Rqk2DxgBkqfwyhjs9VcRi7Mngdgz9bSSxFH/DfJqKgsYTy1Dp2gQ9sUoRbMvjYaw==
X-Received: by 2002:ac8:5059:: with SMTP id h25mr8937129qtm.283.1606493234096;
        Fri, 27 Nov 2020 08:07:14 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id u22sm6252620qkk.51.2020.11.27.08.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:07:13 -0800 (PST)
From: trix@redhat.com
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com
Cc: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] xen: remove trailing semicolon in macro definition
Date: Fri, 27 Nov 2020 08:07:07 -0800
Message-Id: <20201127160707.2622061-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 arch/x86/include/asm/xen/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
index 5941e18edd5a..1a162e559753 100644
--- a/arch/x86/include/asm/xen/page.h
+++ b/arch/x86/include/asm/xen/page.h
@@ -355,7 +355,7 @@ unsigned long arbitrary_virt_to_mfn(void *vaddr);
 void make_lowmem_page_readonly(void *vaddr);
 void make_lowmem_page_readwrite(void *vaddr);
 
-#define xen_remap(cookie, size) ioremap((cookie), (size));
+#define xen_remap(cookie, size) ioremap((cookie), (size))
 #define xen_unmap(cookie) iounmap((cookie))
 
 static inline bool xen_arch_need_swiotlb(struct device *dev,
-- 
2.18.4


