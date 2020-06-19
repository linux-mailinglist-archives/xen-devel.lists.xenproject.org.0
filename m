Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F02201DB2
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2020 00:01:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmP3l-0004kY-SU; Fri, 19 Jun 2020 22:00:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhgK=AA=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jmP3k-0004kT-Im
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 22:00:28 +0000
X-Inumbo-ID: 48b94da8-b278-11ea-b7bb-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48b94da8-b278-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 22:00:27 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id gl26so11757970ejb.11
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2020 15:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D3c6isltU9wDsjvWe1FRxWQI8iE4xtXifjJQA9egUR8=;
 b=Etv4sm9AEDdjRMs/DjtAua8wlLcuwzn/HaH5fhUku7iwUOFQk+aVjLvX3WIqH5skMU
 h64cMB9hZCdYu4HXPdxiG47sipua7TKM4oTe22YVQUI8e0zX1YJIWlpxcQ3JJWPETMVn
 NHg5ZPXqYPXyd3QwH+EywidsVCxYrgLbL+GPmixOJ/ktL6bzGiS1WguUPl62TZkbsYFW
 vjhE82uiD7/QuhRtZqImHqsiYmZx8dWGpFC7pX0qeC4O9+sNKRgRA9vrIWg2uIkxT2Ht
 TAQs+F37XOy80HcXIOGjbR8EtelW7DenTRSocPdQO5+OddsI1RtJAL7DM70h79uhA4QB
 L1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D3c6isltU9wDsjvWe1FRxWQI8iE4xtXifjJQA9egUR8=;
 b=SQBh3+xmCttjIll8bvxOOuLZOyreuEtbsV7igBhcMXHETuSQBRY36rRv2vSQ39qn+V
 6Sn0iCUkHHSjBVrlKDudZHxgbhWB2+0bMvJpoY6h/ZJT4UVVBZlnezcsisphEz9o8o4x
 T7LEPYO1J4iw4fqfrEpZVB3qUzAHp9RxLDsP+PifA0XQTZzweXVJkbC1h/p+2EWdRrD5
 AFOCKc1rfxQAt9MUvffvescv8tUjChEBfIm5jbqJ1Orq4MdFpWVZLrEpKPCV0f+s7gYZ
 /Vvbq5nwfxtoKOgVQwlMCvodK16fdEzu2kYnieS2wXfxJV8V9PuMnfkWI09dgsxEVplq
 6sUg==
X-Gm-Message-State: AOAM532YRDgOqUSsEc6XRw8/RJmiT8hZzNYHtGkWTM+pSQkkLORw2AjG
 fLPZ3v/3StVoyrYf+LJDNkmMDPctqcaf4A==
X-Google-Smtp-Source: ABdhPJxFsCMAmvhnsDSAU7sNWxW+E/M2QT2vmjkYo1vZ7iuaFJ6FlFTAKDFNhSn5SsSHzMaHxd0MqA==
X-Received: by 2002:a17:906:c952:: with SMTP id
 fw18mr5167804ejb.505.1592604026800; 
 Fri, 19 Jun 2020 15:00:26 -0700 (PDT)
Received: from localhost.localdomain (public-gprs354184.centertel.pl.
 [37.47.14.201])
 by smtp.gmail.com with ESMTPSA id b4sm5261360ejp.40.2020.06.19.15.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 15:00:26 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 0/1] Fix broken suspend on some machines
Date: Fri, 19 Jun 2020 22:00:15 +0000
Message-Id: <cover.1592603468.git.gorbak25@gmail.com>
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
Cc: Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 j.nowak26@student.uw.edu.pl, contact@puzio.waw.pl,
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

Changes in v3:
- Check pm timer bit offset
- Warn about acpi firmware bugs
- Drop int cast in init_pmtimer
- Merge if's in init_pmtimer

Grzegorz Uriasz (1):
  x86/acpi: Use FADT flags to determine the PMTMR width

 xen/arch/x86/acpi/boot.c    | 19 +++++++++++++++----
 xen/arch/x86/time.c         | 12 ++++--------
 xen/include/acpi/acmacros.h |  8 ++++++++
 3 files changed, 27 insertions(+), 12 deletions(-)

-- 
2.27.0


