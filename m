Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D2B20013E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 06:30:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm8eR-0001js-O7; Fri, 19 Jun 2020 04:29:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhgK=AA=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jm8eP-0001jn-SF
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 04:29:13 +0000
X-Inumbo-ID: 6d49d798-b1e5-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d49d798-b1e5-11ea-bb8b-bc764e2007e4;
 Fri, 19 Jun 2020 04:29:13 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id y13so8747089eju.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 21:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J1oXoX9ewxOq7myqcx3lKm9apt/L2OmhEwobt1usPiA=;
 b=YXRBmOdUgzI1e0Q4ZWUMo+3KiWPwpAh2NSEptI+c69rNOl8CiuXqalLAdAVBF78v2K
 8a2VGvOsQY8TO6q7x6HNofQjZd8QpN5ehJen4yGTeEYwNf+GMvZiur7ricjnF5p/GinR
 MUb/BS2TmXue5VRhYYpAVh2RK63Zq0oGFEspqIUUEQqOSSkNLQO6lq0kSoHskmKk3omX
 AhgrKZEbDK8WrCtrQfjR69ivYm1CRqHqFWVkrxf30EYXdypqTW5rwmcgBEurN8MR8gQE
 YOVv9hOxPd9fs16aS8idENPVIM+aLFGu7ab4h5SREHaw3uSB/CM4tGMzE79ZZPInKg0/
 cOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J1oXoX9ewxOq7myqcx3lKm9apt/L2OmhEwobt1usPiA=;
 b=b/9dAnIAa7MNFuKiJU002Eyfg1LDt3A4t07oKYvTzAdABaPJcHbtPwmgAcI9vqJaxK
 UPy+xFZaErkFswG4fR/jXgY9bn49PitGSjv4T9KxNDvnci6mFsYeKpHifvK4FDiI7sIn
 fGGaCjjiy+DbSQx7H0q/mm0gBrTOo6erWQPAUKl0XilnikUIKEtYQ4Z2BP0ILg3rIc8r
 +qoK1mRlITqsAENhkrLASd/BRqp6o+eqF1y3zEsGAosHNTCvyXpa9LWON7Q4BsKmzqdV
 49le5dnHbC9M6+gJOQGLav68yRp83lzE7BsOqu1L4f7Avo1Y6W0hSS6/H3SLXZkhDjhj
 3SPA==
X-Gm-Message-State: AOAM530CPm0ZvHFJPKL1c0qEQL7oras5/lm+i0Pbul0Y3VqeMIeXgQVM
 zZiPZQt2A4V9gKHinfQk8DLaB124J9hLwQ==
X-Google-Smtp-Source: ABdhPJwSnPCly9HxviAX/OQ3Eiyxlq43RvAviRySQBWLEBituau3Pq0meh5lepTaw2alQ8TWpYXSpg==
X-Received: by 2002:a17:906:35ca:: with SMTP id
 p10mr1838817ejb.392.1592540952126; 
 Thu, 18 Jun 2020 21:29:12 -0700 (PDT)
Received: from localhost.localdomain (public-gprs354184.centertel.pl.
 [37.47.14.201])
 by smtp.gmail.com with ESMTPSA id r6sm3850340edq.44.2020.06.18.21.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 21:29:11 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/1] Fix broken suspend on some machines
Date: Fri, 19 Jun 2020 04:28:46 +0000
Message-Id: <cover.1592539868.git.gorbak25@gmail.com>
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

Changes in v2:
- Check pm timer access width
- Proper timer width is set when xpm block is not present
- Cleanup timer initialization

Grzegorz Uriasz (1):
  x86/acpi: Use FADT flags to determine the PMTMR width

 xen/arch/x86/acpi/boot.c    |  8 ++++++--
 xen/arch/x86/time.c         | 15 +++++++--------
 xen/include/acpi/acmacros.h |  8 ++++++++
 3 files changed, 21 insertions(+), 10 deletions(-)

-- 
2.27.0


