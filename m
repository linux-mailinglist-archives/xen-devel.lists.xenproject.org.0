Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AADD1F8947
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jun 2020 16:37:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkTl1-0004YG-TC; Sun, 14 Jun 2020 14:37:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UtKD=73=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jkTl0-0004YB-SF
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2020 14:37:10 +0000
X-Inumbo-ID: 874c264c-ae4c-11ea-b7bb-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 874c264c-ae4c-11ea-b7bb-bc764e2007e4;
 Sun, 14 Jun 2020 14:37:10 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id l27so14724108ejc.1
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2020 07:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F6On6rf2nicxLWMEIcW1TLcL1Hrgjpywh0LpJEepZ+k=;
 b=oxPWLN2RwlVG6htFCyTgxZKsxUBq7DbHG2EtNWJHb3TseGAKq4i8qIVWF7B4jWv1Pp
 5j62QlNPBifHdsNk4uFFi7DTWyyvAMSG7Jgzo/tacn45UddqAyK3tHGG5chf5hna3Nmp
 HodrGPRIca6y1EvLsrCmFa7m5yjcy9sJurLbXswQBfn6OqGLcKKql4jRIkwMatorKFRt
 zF1OTrHnVUPNAzHOFAJ1oWSl6w/TP1XY5ZVOuUMMOr00Ni9hRB1KrcBs4VCJxUROEQ1o
 AAo2xQGEzKZ7nhza8lhTPMnFLnvA4cjXEF7ihZRKX/DsG/iQKMefYATaVrwdyAO8VUDm
 L/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F6On6rf2nicxLWMEIcW1TLcL1Hrgjpywh0LpJEepZ+k=;
 b=gxlsF2j/H0+hzXpZLww8DCTtmcCJX1sDL+6bOvSBuV5Fx6AIfVbTSDXO/EqWs1mDYO
 6sXOZhhSfRNvNHjltsrs20bLNyQv7O1pJ5pP9xpqziwB8S7E5AQXBKbFBknG7dR+NW+h
 rLN81C1uybVXcB1sdknULVQmS5rJ2QJZKhtAAZ6sa5HzfERrHrUyhAE57J1RL8gqvqHe
 OVMDItEstp0nNccRgB+J0AFeo34dHIBUYB7glK2L67wqW4ySCqZn9/JIXjuYa2GFDqcK
 Yj5nAHbLpIfVXKmyuteL53JBSDyvojPwfLjmtnbTF5VCmRU83u5SHfI6qh3xxljrvMgc
 nEVg==
X-Gm-Message-State: AOAM530q/qdESSR5gvqQZOKWPGnDK/VmDpyjhjeokMH7Sci/uvNzLxLL
 QTh0xfIeFyoCfn5n8yExpaqaTXDEiAX5hA==
X-Google-Smtp-Source: ABdhPJy2itoXi9nScreiQpUBnRAYugeC2fwZnD4WdPcs4gx2OBKLUy8Nsba+6yJV2mYuNx5COFgW2A==
X-Received: by 2002:a17:906:784c:: with SMTP id
 p12mr21434137ejm.123.1592145429358; 
 Sun, 14 Jun 2020 07:37:09 -0700 (PDT)
Received: from localhost.localdomain (public-gprs354212.centertel.pl.
 [37.47.14.229])
 by smtp.gmail.com with ESMTPSA id l18sm6753823eds.46.2020.06.14.07.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 07:37:08 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/1] Fix broken suspend on some machines
Date: Sun, 14 Jun 2020 14:36:27 +0000
Message-Id: <cover.1592142369.git.gorbak25@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: artur@puzio.waw.pl, Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 j.nowak26@student.uw.edu.pl,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

The included patch is a small subset of a bigger patch set spanning few 
projects aiming to isolate the GPU in Qubes OS to a dedicated security domain.
I'm doing this together with 3 colleagues as part of our Bachelors thesis.
While working on the project we came across 2 machines - newer gaming
laptops on which the suspend functionality on unmodified xen is completely broken.

The affected machines were able to suspend but not always resume. Even
if the resume succeeded then the kernel time was trashed in the dmesg log
and the machine never managed to suspend another time. After changing
the xen clock to hpet, suspend started working again both on stock
xen and Qubes OS - this indicates a bug in the ACPI PM Timer. After
disassembling the FADT ACPI table on the ASUS FX504GM I understood that the
reported bit width is 32 bits but the flags indicate a 24 bit PM timer.

The included patch fixes the suspend feature on ASUS FX504GM and hopefully
other laptops - Probably next week I will test this patch on my
friend's laptop where this issue also occurs(suspend is broken, trashed kernel
time after resume).

Grzegorz Uriasz (1):
  x86/acpi: Use FADT flags to determine the PMTMR width

 xen/arch/x86/acpi/boot.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.27.0


