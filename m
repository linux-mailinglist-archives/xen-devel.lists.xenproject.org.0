Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AE122926F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 09:43:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jy9ON-0003ng-NF; Wed, 22 Jul 2020 07:42:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G4i8=BA=vmm.dev=o8@srs-us1.protection.inumbo.net>)
 id 1jxut4-0005hS-B8
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 16:13:02 +0000
X-Inumbo-ID: 0cac372c-cb6d-11ea-856d-bc764e2007e4
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cac372c-cb6d-11ea-856d-bc764e2007e4;
 Tue, 21 Jul 2020 16:13:01 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id l6so10454565plt.7
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 09:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmm.dev; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wDitsdDHDoETDTxDKluPrWhU2D8DE6u8BnPSmRmrGh4=;
 b=fy7L/4Re2TIFmm12k2i3bXju6ZZlkbEA1354CbMIGv3i6xktgqXThaI1n9+yLvVeEO
 C6XotX0xy43lCHKadVKvJu6as164ENvY1aZYC+Yyk6hrIbMWtMK5qbbY/oAzlC1QJc/Q
 8TrLwbEZwu3d5Il0QNTGzHqDr1Wi7ruxTjCJbyOBHnxKClmMl1qVy2GQASFp3s9u8YP4
 VSo4vbTiSmKkp48DBE9pCIvmYDvC2JPmk5mrF9XSkbyYnR9veMcyfz8PlL4ZXKXSqov7
 yfHhV8BL0GsYeU64KxJy8smQviZ1pKkO7sM+BGXTVcqsJVnmyRO6wSLGb235TJ1J3hxc
 UCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wDitsdDHDoETDTxDKluPrWhU2D8DE6u8BnPSmRmrGh4=;
 b=mgAoC4zhQtSLjy6vq3PzpF4LEO7OHGbCH4dHDffbiBlRKB9U6/WCuESxKDtcz6axVX
 b2C9twM0aN/sdrF/qGANdX/5Myoo9S8cCN7XyvunGMcLLONdcP/QUaEk6pcJSP39P4Vd
 tQ6qgM23kUdS0iu0qdFqRjtzamg7VnoaS+t9HUZ+yOoaPOAtP8iQkqU0iazzKNLQ9YST
 lBW/cRyhAaxvQ9/bgOqjsqp3JUTPht8Z8hHlQTBOlafrff0pJNoP6MELRm+VpGDhNj0N
 5+RsdSj5BeE1vrepo8fvuJkjhi+j/vU6jQHQdS9WxYUvTfczcoG445Gt+CEfijoJmm7X
 gVjw==
X-Gm-Message-State: AOAM530y+GIBAsdjEsDQmBJso0/6e16hnk1G0xFbTq/MH06OO3Os8vgE
 eLw3RP+Fu9TbuxtzlfARG1qagw==
X-Google-Smtp-Source: ABdhPJz/4Rls+u9+PMZSs3OFi3HIkImvb038W2RxX4ZvHHXgVr6fOs32UJtvHWbBcLF6bDLtkM4tvg==
X-Received: by 2002:a17:902:8ecb:: with SMTP id
 x11mr17341190plo.123.1595347980879; 
 Tue, 21 Jul 2020 09:13:00 -0700 (PDT)
Received: from ip-172-31-28-103.ap-northeast-1.compute.internal
 (ec2-18-183-109-148.ap-northeast-1.compute.amazonaws.com. [18.183.109.148])
 by smtp.gmail.com with ESMTPSA id y80sm20467763pfb.165.2020.07.21.09.12.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 09:13:00 -0700 (PDT)
From: Hayato Ohhashi <o8@vmm.dev>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org
Subject: [PATCH] x86/xen/time: set the X86_FEATURE_TSC_KNOWN_FREQ flag in
 xen_tsc_khz()
Date: Tue, 21 Jul 2020 16:12:31 +0000
Message-Id: <20200721161231.6019-1-o8@vmm.dev>
X-Mailer: git-send-email 2.23.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jul 2020 07:42:17 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, Hayato Ohhashi <o8@vmm.dev>, sstabellini@kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

If the TSC frequency is known from the pvclock page,
the TSC frequency does not need to be recalibrated.
We can avoid recalibration by setting X86_FEATURE_TSC_KNOWN_FREQ.

Signed-off-by: Hayato Ohhashi <o8@vmm.dev>
---
 arch/x86/xen/time.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index c8897aad13cd..91f5b330dcc6 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -39,6 +39,7 @@ static unsigned long xen_tsc_khz(void)
 	struct pvclock_vcpu_time_info *info =
 		&HYPERVISOR_shared_info->vcpu_info[0].time;
 
+	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	return pvclock_tsc_khz(info);
 }
 
-- 
2.23.3


