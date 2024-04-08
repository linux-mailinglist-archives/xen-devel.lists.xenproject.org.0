Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9789C97F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 18:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702023.1096739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtrmQ-000548-DN; Mon, 08 Apr 2024 16:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702023.1096739; Mon, 08 Apr 2024 16:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtrmQ-00051l-AM; Mon, 08 Apr 2024 16:23:34 +0000
Received: by outflank-mailman (input) for mailman id 702023;
 Mon, 08 Apr 2024 16:23:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zErk=LN=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rtrmO-0004wR-Fk
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 16:23:32 +0000
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 567a7749-f5c4-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 18:23:31 +0200 (CEST)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-696719f8dfcso26743096d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 09:23:31 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 q8-20020ad44348000000b0069b14ff208bsm1515536qvs.79.2024.04.08.09.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 09:23:28 -0700 (PDT)
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
X-Inumbo-ID: 567a7749-f5c4-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712593410; x=1713198210; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H5x+YaR09ZTu1jMXSzWW/50S2FlPaWtNu+wmw+3STVI=;
        b=o82H6dSv2xomsoYqe7C7+/TNAzWPUzVE74v8vwVYcIM/c1al9gbNuyhd/pHgKx+5JN
         LHAmCA6keadTniDvGNlRwXaPKAXrZdRZomwfxr2L+Rw7TQ8kWU9VOYMnjNe9mPvB/LLE
         cr1VvVR4Dj7HXyuuopxx2wiExeI+9upa/QH1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712593410; x=1713198210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5x+YaR09ZTu1jMXSzWW/50S2FlPaWtNu+wmw+3STVI=;
        b=OOt6jazhi+fQUgQhd1ITiF/YgrMUJtjasb+xd1Busua9x6AqI5rLD3TT5g1L/Ayjy+
         OMG2zitBWrTGKLaHD1DGiIRwObKi41XeMXL6Oex37MoqTGHCDMHD+fFQOm/v8aN7v+sV
         5mvXWdiTXTzy9TM5d3BWOYHBNplLtqrUXhJCVbcNGSFSNLo1dUTgWm9cEl0pgZHIlQTi
         8YRI6OJtZhhKpKN/NmoGTNnf3CkgHqxY36aBU9CdhqBUJuhovYCPBfCTQB+Fy3y7ljer
         ndiiC57tmZgo6zf1oASash29ebeZGdLMYdprMIlVYKPN6G+j6+GQkmLSGh/iI33e4uaA
         EJUw==
X-Gm-Message-State: AOJu0YzttBg3Ppje0Zq78UzFpnDCDtdqFICbbQeg/R8Q+NWzIRuiQE7T
	FXJjLOkxVArzEMzFA0GKpdbdyVFnLHNMld1ele3W6GlKs7IrRZVtpWMCKEE/aQJ/3HGXlAWanuk
	=
X-Google-Smtp-Source: AGHT+IHNIxXp5tnZapf03sBF+9VMqkABIFTS8/Tmwrw/svZmCKuzi1+h3BKtwmRhGS33jo51GDZSTA==
X-Received: by 2002:ad4:5be7:0:b0:696:7ed9:9d8b with SMTP id k7-20020ad45be7000000b006967ed99d8bmr11936531qvc.2.1712593409777;
        Mon, 08 Apr 2024 09:23:29 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] x86/rtc: Avoid UIP flag being set for longer than expected
Date: Mon,  8 Apr 2024 17:26:20 +0100
Message-ID: <20240408162620.1633551-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a test, OVMF reported an error initializing the RTC without
indicating the precise nature of the error. The only plausible
explanation I can find is as follows:

As part of the initialization, OVMF reads register C and then reads
register A repatedly until the UIP flag is not set. If this takes longer
than 100 ms, OVMF fails and reports an error. This may happen with the
following sequence of events:

At guest time=0s, rtc_init() calls check_update_timer() which schedules
update_timer for t=(1 - 244us).

At t=1s, the update_timer function happens to have been called >= 244us
late. In the timer callback, it sets the UIP flag and schedules
update_timer2 for t=1s.

Before update_timer2 runs, the guest reads register C which calls
check_update_timer(). check_update_timer() stops the scheduled
update_timer2 and since the guest time is now outside of the update
cycle, it schedules update_timer for t=(2 - 244us).

The UIP flag will therefore be set for a whole second from t=1 to t=2
while the guest repeatedly reads register A waiting for the UIP flag to
clear. Fix it by clearing the UIP flag when scheduling update_timer.

I was able to reproduce this issue with a synthetic test and this
resolves the issue.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/rtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 4b31382619f4..4bb1c7505534 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -202,6 +202,7 @@ static void check_update_timer(RTCState *s)
         }
         else
         {
+            s->hw.cmos_data[RTC_REG_A] &= ~RTC_UIP;
             next_update_time = (USEC_PER_SEC - guest_usec - 244) * NS_PER_USEC;
             expire_time = NOW() + next_update_time;
             s->next_update_time = expire_time;
-- 
2.43.0


