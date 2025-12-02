Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA49C9B3D7
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 11:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176072.1500648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQO4R-0007pt-Nb; Tue, 02 Dec 2025 10:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176072.1500648; Tue, 02 Dec 2025 10:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQO4R-0007mf-Jq; Tue, 02 Dec 2025 10:57:23 +0000
Received: by outflank-mailman (input) for mailman id 1176072;
 Tue, 02 Dec 2025 10:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tQLy=6I=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vQO4Q-0007Nh-0n
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 10:57:22 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa719918-cf6d-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 11:57:16 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477632b0621so33135495e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Dec 2025 02:57:16 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791164d365sm289825795e9.12.2025.12.02.02.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 02:57:15 -0800 (PST)
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
X-Inumbo-ID: aa719918-cf6d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764673036; x=1765277836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uTknspdwfVlg5HxX4a1l7HLU0GTjm03g0aB2rEYFsg=;
        b=mlij7gWD6fPtxgJvZlrg8+0nusMdD/uE3/0nyjQs/MmrHapGl8NbF4up3zJC3/CDAE
         0Xa7CidpUixZmiwu9DmdZN6ZVsZZtZyg5xcdp7KNCuolfTI0dQ9eDKj3xD8NW0LXKe9t
         rYowqWz7IM8f4oARIKSusK2lmcdeHKljwyfOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764673036; x=1765277836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3uTknspdwfVlg5HxX4a1l7HLU0GTjm03g0aB2rEYFsg=;
        b=W8hNFlq7RgD0dTQcEjwdpJFrW44AEE6WLg4RGln/zRj0OtNxx8Umy5j+nlmYlSESqD
         y8fiivC5L3Ts02d/2JL7jyEP/+K7G12rZUXJsp3Y6mSgSUY/6cc9Je7Vaz2QFHoDEhwV
         4z1/CGAKCnyBMmEIJebab+pkyJi9nG7s8IMzDU8Ha3zTQVAWsudsEW4safQm1LqZ7C0n
         okMlyfqiaLvjhu2a42AT8UekzkfqZePd3C+kLReECAdfcQf95JvejbofWHaphIziRbh7
         MHJOrIOzwbJ3XXn0CodpniBcSEYM0GTXFCNcWxdTU5L1XwaabtrOBvPcBr1/WMQCxjAb
         l1qA==
X-Gm-Message-State: AOJu0YxQBZ9PhTx4zy5Q6ec7VInSSdOskqL6alZPGaL31b4X8XjDwaPv
	lHJgmk4lYCGnWxyjYwlDihW8ovMyAUI1a2ieZGQn/ZtriOawNv3vIRixtaQqnw0TWF8AjeQ31rL
	x/350
X-Gm-Gg: ASbGnctS1JrTFRBKiJpD7ywGGKXTKT3UDL1+lz7Tk4Or+SyQjWp+9Br5W0lh2nCr95r
	Q4scCIwKdPSQNLfdqtCORHE2E/fUI2FEKcFbE1a4ULeIcQbg0rZxTnWnS0Ri+nWVByYkbVpIN6P
	SJKsiEBkY6uVFX+jmUbLTq1uxfrje+TqnhsIW4g190+TRdB141lZ8Oegnce7XWCOAWMNv3YE/j/
	WP1HmQkzaVA5KwxuBPRZEIbow8P4TMLRsnamIZHLzWwiAq9o5DBKShBEkDQjH6rm0hH2jeeJOlm
	W/yA9lPZV4P7k/eIE56q3RRFlo2gICgpeUqLV0EXkmr0wz8RDQ9vpyE1FNrNHurIuckU6g/Y6Ry
	03/snIHbv55TG7tB95pbb4ixCFKTacwVapbzuFk5t7gm0AxZipycI3a9U2qf/Z8TzeiMSx6s1Yy
	HCANW4rupLtwTcBZztSxktUoh5FdwXSzXvFLBQqawBIpWDnG1Ns0fno/lu63XP8Q==
X-Google-Smtp-Source: AGHT+IEu+buKMVbsAKdlEx9OLFYApjuDQtKjGSVYWrbbpb3M2OiazRwqK6TuNVelOV2m117N04nNhg==
X-Received: by 2002:a05:600c:450f:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-477c1124ecfmr404638545e9.27.1764673035896;
        Tue, 02 Dec 2025 02:57:15 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86/amd: Fold another DE_CFG edit into amd_init_de_cfg()
Date: Tue,  2 Dec 2025 10:57:08 +0000
Message-Id: <20251202105710.1472927-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
References: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fam12h processors aren't SMT-capable so there are no race condition worries
with this path.  Nevertheless, group it together with the other DE_CFG
modifications.

Fixes: d0c75dc4c028 ("x86/amd: Fix race editing DE_CFG")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I apparently couldn't count how many examples we had editing DE_CFG...
---
 xen/arch/x86/cpu/amd.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 47c109f89804..4dc9157836ad 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -920,6 +920,13 @@ void amd_init_de_cfg(const struct cpuinfo_x86 *c)
     if ( zenbleed_use_chickenbit() )
         new |= (1 << 9);
 
+    /*
+     * Erratum #665, doc 44739.  Integer divide instructions may cause
+     * unpredictable behaviour.
+     */
+    if ( c->family == 0x12 )
+        new |= 1U << 31;
+
     /* Avoid reading DE_CFG if we don't intend to change anything. */
     if ( !new )
         return;
@@ -1201,15 +1208,6 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 					    smp_processor_id());
 			wrmsrl(MSR_AMD64_LS_CFG, value | (1 << 15));
 		}
-	} else if (c->x86 == 0x12) {
-		rdmsrl(MSR_AMD64_DE_CFG, value);
-		if (!(value & (1U << 31))) {
-			if (c == &boot_cpu_data || opt_cpu_info)
-				printk_once(XENLOG_WARNING
-					    "CPU%u: Applying workaround for erratum 665\n",
-					    smp_processor_id());
-			wrmsrl(MSR_AMD64_DE_CFG, value | (1U << 31));
-		}
 	}
 
 	/* AMD CPUs do not support SYSENTER outside of legacy mode. */
-- 
2.39.5


