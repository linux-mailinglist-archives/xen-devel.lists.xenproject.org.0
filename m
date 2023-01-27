Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB8867E0A3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 10:47:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485377.752572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLLKB-0003m6-ME; Fri, 27 Jan 2023 09:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485377.752572; Fri, 27 Jan 2023 09:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLLKB-0003jh-Ht; Fri, 27 Jan 2023 09:47:11 +0000
Received: by outflank-mailman (input) for mailman id 485377;
 Fri, 27 Jan 2023 09:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yrR2=5Y=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pLLKA-0003im-MW
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 09:47:10 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9079e61e-9e27-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 10:47:08 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id s3so4247289edd.4
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 01:47:08 -0800 (PST)
Received: from uni.router.wind (adsl-40.109.242.227.tellas.gr.
 [109.242.227.40]) by smtp.googlemail.com with ESMTPSA id
 l23-20020a50d6d7000000b004a0b1d7e39csm2054861edj.51.2023.01.27.01.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 01:47:07 -0800 (PST)
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
X-Inumbo-ID: 9079e61e-9e27-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNHLqVTJvvKFPavM3IC7KX+Lm0FkHZuO+pPfJrnfnO0=;
        b=amMeP8IP3Mn9HPzY0unccRDcPcTE/i3gEg22kwEdTJsxvSFHlyhCPT2ENTP44V31Rf
         zjxMogcdbckB/c8eaAVvptC+h/p5+dPjDKv9A+3YftJwj0Xj/IaZZawb5EJCLJC1/77g
         Jd6c0Qnke9Q1YH0Oh3b+6lYbe4io+PljsFw9npPi/0/4fscDEgzpcEINaWqFfNPt/W8w
         LgOQIQHIsPRFF/rjoLiiQBdVDcqKdR+td6WU1jXpjj0LsheQm3tJL/sb0e8DIkSidPI9
         6aEhWGH7yuiG7IeFKjlEsscJKMdnX+DeLq6Acx/Lp/VyfnxicoqaCwsthq1HigW9L28e
         /+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNHLqVTJvvKFPavM3IC7KX+Lm0FkHZuO+pPfJrnfnO0=;
        b=LHLQz3KOoTQTgNMd3kdV20UMBz8K5bkLStrpLVuSGdxDFFxvi6nv/8ZtHT/8eXh/2p
         zqtOjvU+6O+DaOe2Ff8s/ixXq3qyVh/kkUp6Xk2zhZUMYZx/Srx2LkSzX6buvh/7I1Ep
         xOysevf2CT7JZhfcMCUJE3lgQuLIJAjfcH3ww6vzZ9Uw9WNq0DCbOpioEvTfCoAw7edF
         XiFK5QqkjKetAnkiTO1k9GwtK8JNNW+Hzcizxty7J1/RiAh1DYxB3mbVpHCSNmvbtLWz
         e5ScbTWNzSloFK6SBSDSQ5Fl9THjTROYhb6Kxzz/LZd/fKVW7plZGl62FynD/jjw/AeB
         XcNA==
X-Gm-Message-State: AO0yUKXclyNWT1GSTNwpLhitPMbihmnwohYoVDI/58yIpMopxmpqXT3Z
	beuy5j0bpd9rEmFcGJzomRfNJ9FjJjw=
X-Google-Smtp-Source: AK7set9YbIeVVxZQvUD7MCdwwdED7L+4+SehWRHzX8xbhSB+9RftPx5MGarrrJgiGFEGa5dsuO2BSQ==
X-Received: by 2002:a50:ce54:0:b0:4a0:e039:e911 with SMTP id k20-20020a50ce54000000b004a0e039e911mr5663717edj.12.1674812827804;
        Fri, 27 Jan 2023 01:47:07 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/vpmu: remove unused svm and vmx specific headers
Date: Fri, 27 Jan 2023 11:46:56 +0200
Message-Id: <20230127094656.140120-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230127094656.140120-1-burzalodowa@gmail.com>
References: <20230127094656.140120-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: 8c20aca6751b ("x86/vPMU: invoke <vendor>_vpmu_initialise() through a hook as well")
Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

I 'm not sure that a Fixes tag applies in this case. I 've added it mostly
for reference.

 xen/arch/x86/cpu/vpmu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 64cdbfc48c..33e2fca8cd 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -31,10 +31,6 @@
 #include <asm/p2m.h>
 #include <asm/vpmu.h>
 #include <asm/hvm/support.h>
-#include <asm/hvm/vmx/vmx.h>
-#include <asm/hvm/vmx/vmcs.h>
-#include <asm/hvm/svm/svm.h>
-#include <asm/hvm/svm/vmcb.h>
 #include <asm/apic.h>
 #include <irq_vectors.h>
 #include <public/pmu.h>
-- 
2.37.2


