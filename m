Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA75BD0BD5D
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 19:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199112.1515817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veHDs-0003HL-8v; Fri, 09 Jan 2026 18:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199112.1515817; Fri, 09 Jan 2026 18:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veHDs-0003Fu-5t; Fri, 09 Jan 2026 18:28:32 +0000
Received: by outflank-mailman (input) for mailman id 1199112;
 Fri, 09 Jan 2026 18:28:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DueL=7O=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1veHDp-0003Fi-WE
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 18:28:30 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd73ae4e-ed88-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 19:28:27 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4308d87782dso386846f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 10:28:27 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e16f4sm24411728f8f.11.2026.01.09.10.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 10:28:25 -0800 (PST)
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
X-Inumbo-ID: fd73ae4e-ed88-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767983306; x=1768588106; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qCiBUHR9GUmV1iDaApd4GQnbRtt5KA9W3cMN2DSAagc=;
        b=YTG+PIcM2cBhYEZuJATxOPxrR1xUYZQjv4Q2FIuVuabXIQ8qCo1cm6Ob7JTT3SRNgM
         6NieO7x98epP9FViAJ7WhpFvuoHfzGqNk1/lzuF1Z0bjkX2LlRjtBoeW6ZlAIRV5MYQw
         dsVCz/lBkX2nooXeBf4aAIPv+En02FL91BWhy6ciX9KQaIvdHpYQ9ArDTEhiUbHwUgzW
         jy8dbSefF3KArk/gOyjbgqhWJSzMC439k3ldr2qohZBf+rRyxbA/GnMftFVce7WZZP70
         RT62N6IzKz+9Xn/GsmJme7ag+GooCDBIRHw+lqR3Gyg6QARBQsrlnTNFcwJuK7EJc1ON
         G1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767983306; x=1768588106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCiBUHR9GUmV1iDaApd4GQnbRtt5KA9W3cMN2DSAagc=;
        b=KcVcvOIqPP02PnAj7miYB83agpaeEtt9zK9UTbS41wG++EN8Jjt6Wh3nkKEq6z46Ve
         w3/fdcA2CNInHmbY3+Khi4O4VwEPuO2ImZvUMFU6dJEV+kc0W8IELk2x16IxwpsVutPP
         uefjDtKsQmP1SPjog9zIJIz9zbn+gZKSsNJSjRVNVBCx4y73EZky8Hu/HJFgdbubo5Cj
         6BebD470/u7AbVvH26+FZnT0BvH2tks3k+cpDTMcJDMakDPAiNSeX2DjXlBo7VUtE9my
         VwpfIlX220CzihXuf7WG9mwveHdfCd0TUR2oIIQIDe2LImSuKOy7hVcBb5zsxlYucQL1
         0Ejw==
X-Gm-Message-State: AOJu0YzmjBqrGtnk/lwRgfF2qZxhQTYFUg78qhquTld1+m8Ym0RdLPB8
	ooB/wHUFCfPPthNnK0RLiQThJPMTKi18YQZda21bEAffn2mJJ2NlzulrK5AHaQ==
X-Gm-Gg: AY/fxX748T6Sa6IiWIqESlENGdlNbjbzobd1jfT6zbJHnF8baiOjk1Zg6XSlAkFkS27
	WDe3dDtD6+Axi9gNptH28gU9uJRNEStG85n39OhOVJX0xniEk7QcpFLiF0npkqrGmByCG6Qa2Td
	+p19/bOhgJwGHPxtaQ4CpaFurpm3dXLdV0WBiCKZ4gJE+D2yuhJa503L25s5835P2BxrxYilalg
	kEal2huxc2DmEuROKlTfpi22J7i2rJjV/+L/TTdvRdYD8ja9ThHazxs7A0Y8YsDRtZhhMQQDz3n
	qrPW8CWx4iqQ1Jaf2c0vEuNN+d9Mi0lhN8bg6g5SCCdSJb+7fwkY0dGTXzOxmxiLRrrM68at9TT
	AkanPXZl4wcxQhtcgxyh7uPaXvYiv/O57T2F39ac9pEls+vObE9//mS+xrKFc6Hj3Y3KWRm8YRm
	4/UXyaiwAGHy3I3Xp2ZgBVSCm2tcVrKBRrFz08elOOG/ulPuHr577TsWKnzy8gMYh14Jh1c0imF
	u1+2QSbP3Ixd7s=
X-Google-Smtp-Source: AGHT+IHjAjG9+x8tuHWmGR6vgWBaQIRYyWhXNF6DWbFscEYVN6wqkZllXh0KlYAv/GA/YZSiKbZagQ==
X-Received: by 2002:a05:6000:180f:b0:432:c37c:ec04 with SMTP id ffacd0b85a97d-432c37cec1bmr6149656f8f.0.1767983306096;
        Fri, 09 Jan 2026 10:28:26 -0800 (PST)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/altp2m: altp2m_get_effective_entry() should honor ap2m->default_access
Date: Fri,  9 Jan 2026 18:28:22 +0000
Message-Id: <dbab519006501b3971fa913310a06755a14c4548.1767982955.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Commit 7e5b662 fixed p2m_altp2m_get_or_propagate() to use the altp2m's
default_access when propagating entries from the host p2m. However, the same
fix was not applied to altp2m_get_effective_entry(), which has the same issue.

When altp2m_get_effective_entry() prepopulates a superpage from the host
p2m, it incorrectly uses the host p2m's access permissions instead of
the altp2m's default_access. This causes problems when the superpage is
later split (e.g., when setting mem_access on a specific 4K page): all
512 entries inherit the host p2m's access rights instead of the altp2m's
default_access.

This issue became apparent after commit 50baf2d, which causes the host p2m
to use superpages more frequently. Before that commit, the host p2m
typically had 4K entries after VM restore, so the prepopulate branch was
rarely taken.

Symptoms include memory-access events firing for unexpected pages when
using VMI tools with altp2m, particularly after VM resume.
The issue can be worked around by booting with "hap_1gb=0 hap_2mb=0".

Fixes: 7e5b662 ("x86/altp2m: p2m_altp2m_get_or_propagate() should honor ap2m->default_access")
Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 xen/arch/x86/mm/altp2m.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 0261360aae..0bc9b9ad2f 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -194,6 +194,9 @@ int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
             gfn_t gfn_aligned = _gfn(gfn_x(gfn) & mask);
             mfn_t mfn_aligned = _mfn(mfn_x(*mfn) & mask);
 
+            /* Override the altp2m entry with its default access. */
+            *a = ap2m->default_access;
+
             rc = ap2m->set_entry(ap2m, gfn_aligned, mfn_aligned, page_order, *t, *a, 1);
             if ( rc )
                 return rc;
-- 
2.34.1


