Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF35DC402F5
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 14:48:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157572.1486301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHMoS-0003lb-OL; Fri, 07 Nov 2025 13:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157572.1486301; Fri, 07 Nov 2025 13:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHMoS-0003jY-Ln; Fri, 07 Nov 2025 13:47:36 +0000
Received: by outflank-mailman (input) for mailman id 1157572;
 Fri, 07 Nov 2025 13:47:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHnz=5P=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vHMoQ-0003jP-Ot
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 13:47:34 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f418647-bbe0-11f0-980a-7dc792cee155;
 Fri, 07 Nov 2025 14:47:32 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so3647235e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Nov 2025 05:47:32 -0800 (PST)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42abe62bf26sm5287736f8f.3.2025.11.07.05.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 05:47:31 -0800 (PST)
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
X-Inumbo-ID: 4f418647-bbe0-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1762523252; x=1763128052; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8iLr/ZaHG5FmVn2MkOXtiI2QwHs3zVj6Ne7RvjbIEk=;
        b=K5jYHRQeJDPe9GUNaDkVpHCgzgTtFo7bZsI8H+QTPMZpa+1hAr25N5XlX4/2t8Li5G
         EoGrxbQCdEg6TJkJB0WpDDtFqiNmrZl3FjhgNCmOd5uI8F7nmzB+2bE8zK+JRifnxoYZ
         eYZQTexg7Hi2zv+rBMlz6mtUc7mtQvza3mQdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762523252; x=1763128052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8iLr/ZaHG5FmVn2MkOXtiI2QwHs3zVj6Ne7RvjbIEk=;
        b=tYDn/nJWNsjbjw/KSWZpTneE/0m9hIU03WFyfIBd2Tiq4qmwuVuzYn0Tj7SKcup144
         SWabJr4Khn0MSDqsmSyrMpuxsa579LVDf29WkkG02nGcU1iaYnuCnpBDJLsuLKJCzPNf
         CQkA2X2MQuVE8QZDdRO81bXHw9aBVVGhhxT5zQSEcueDP2qbtUZPbmm2KSolfwckFxxr
         DymjGxDDDuNjvSK+Rzu8Jj73GQPGkkKak4I8aGW2nD/LrynilobsYxSbgVJ8ocOM3tTN
         Vso//kGAxl3LuiWYYzVjBIdKp1hq8EDhIfRmBq68VXe/lkVoB7Brd3/XgWOSE7hOLDTc
         SmHg==
X-Gm-Message-State: AOJu0YwLIYDRvP3kEo0cTNNRRIgtgKfZzpNCLg5G3xCa9BoMAk2xNvOu
	TrQC4zNcoqrBguirZ3BagYjpPg3VBl4sFuW660e38XLQ5AanYCnBtJdI5+6OFMyFK6d+x9+UdAE
	Gn78LAFM=
X-Gm-Gg: ASbGncsg0rpwv2fwRb/kUjYbJyUREGzR7gnJdQjxO9xpQ2aSicqCAhivprYao9y1lSC
	1MAwSr63bzoKE0d7w3lOt0dqYjkK8Xt9PFYTnlbUvs1aO8q0KD9bd75X5JbvrUXzb3Wta30q9uZ
	yUGKN0x/lqIZlzapb2zWsQ5f893l5yfSgRwbiEM3vtTuD2SLtT0dFaazAsVbW1l5dJIumMEuOUv
	eOjBRumsg2ut/HBvYK1qzqnoC2Of0LtdiirtvXzQTV52RELNV5zIt1T8sxn4vs/8W/Qn9J5QmpH
	qxi2JLfBRbJ/ZwHjzOfjfTeDp9qvF4rswYBlXTFBgGprofXXxAq7pSjtU94F5HrP0JL4AIrqt1j
	L7bo990oJtzUQObzf8e5hX7PWyyr8DCdyKm7JXEsv9NrfbnxL8jmp9WnpDgGPjcDr3OfZBWmjjk
	I5+1KKKbhowf0gkp9QZA4iWSlQux/SYgXtc/5gdkcpmzEkiXmfs68=
X-Google-Smtp-Source: AGHT+IE2lTHAH8ZqVRgyoVpbNJloy9tP36XI9ebW93uKUhVNlx/7CgoYt9zD2sRkpsaeuSXfdNzkoA==
X-Received: by 2002:a05:6000:2c04:b0:429:cf03:8b2e with SMTP id ffacd0b85a97d-42b26f82e39mr1651138f8f.13.1762523251663;
        Fri, 07 Nov 2025 05:47:31 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/ucode: Add extra rows to the entrysign model table
Date: Fri,  7 Nov 2025 13:47:29 +0000
Message-Id: <20251107134729.20735-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Link: https://git.kernel.org/tip/d23550efc6800841b4d1639784afaebdea946ae0
Fixes: ff8228ab4658 ("x86/ucode: Relax digest check when Entrysign is fixed in firmware")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
--
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index d72b9556f65f..550b8c1e57ec 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -655,10 +655,12 @@ void __init amd_check_entrysign(void)
     case 0x0aa001: fixed_rev = 0x17; break;
     case 0x0aa002: fixed_rev = 0x19; break;
     case 0x0b0021: fixed_rev = 0x47; break;
+    case 0x0b0081: fixed_rev = 0x12; break;
     case 0x0b1010: fixed_rev = 0x47; break;
     case 0x0b2040: fixed_rev = 0x32; break;
     case 0x0b4040: fixed_rev = 0x32; break;
     case 0x0b6000: fixed_rev = 0x32; break;
+    case 0x0b6080: fixed_rev = 0x32; break;
     case 0x0b7000: fixed_rev = 0x32; break;
     default:
         printk(XENLOG_WARNING
-- 
2.39.5


