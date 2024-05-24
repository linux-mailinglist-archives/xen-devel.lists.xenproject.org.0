Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9938CEAA6
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729746.1135006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8m-0007LJ-04; Fri, 24 May 2024 20:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729746.1135006; Fri, 24 May 2024 20:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8l-0007Hm-ST; Fri, 24 May 2024 20:03:47 +0000
Received: by outflank-mailman (input) for mailman id 729746;
 Fri, 24 May 2024 20:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8l-00076x-5Z
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:47 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bab09028-1a08-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 22:03:46 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a626ac4d299so130911666b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:46 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:45 -0700 (PDT)
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
X-Inumbo-ID: bab09028-1a08-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581026; x=1717185826; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnH7+DLTFV7y8fHOYV2l/9gV4Q+4MdvhQykzDmFzA1Q=;
        b=BXxkz8TrhETVdIlnQW5HMSmfVEsfaRN3l//4D2li3A3D1stDBnxa98ECMXVDsjVB2d
         Rq0LXvRoUpXz3VM6u0IZ5wK73LPSX8aTfC9ORpdaSvfWzdrspAgD+lfLzlv8qigzsEBv
         7BBImx+RFrAaqgOy8yOBcKW15JtnGs5DTCz6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581026; x=1717185826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnH7+DLTFV7y8fHOYV2l/9gV4Q+4MdvhQykzDmFzA1Q=;
        b=vi21uvdPX0YLhvrV93YXtIBciV8s/2f8ufX5pn5MVEHP2KSdYTw8DDAVTqHv7T58wb
         CGrNDwGDfrGqowxB89JLWR+mDPZbakE1HlM6wG7hRQaGB4AIlWxYYrRGEyG/KAA2tCra
         hxpRFTzxN3Maw+ZMXsuBOyz+SZ0FEZesCk74S/9ch5+2Gn+JrM59f7w2FPvv3HMUT1zY
         m1odqGMofvzKX1pWpn3Wz4vO6ZmKJiXmdfEFVCOmVXsk38alTl52eoBbovWRL3FJZEtP
         ywokkiuXr2pThthSqlKrrcG86a3vlDJCvPHzxXGDRx1zQuGhpgpg8cCjdcon5286JAmC
         +JPw==
X-Gm-Message-State: AOJu0Yz1ngR92wJJDAzVPbXFQVSotggbni2Ma5Cp6O7YUkVCdsVxTKFm
	2+i/u5lvRTXux9tYeX1lXdkrWqzHGr2FglXRdZcy10zENCFfndckxtqd2Ll2IJks68Em9mxVPsm
	U9Ks=
X-Google-Smtp-Source: AGHT+IFQfNCCCpPoRMWhGk3Fjgu6D6H4jwZJNkukRDDsfp149c37Pbw35L5hdzTbWaMHsYivMRl++A==
X-Received: by 2002:a17:906:f9c9:b0:a5a:f16:32b1 with SMTP id a640c23a62f3a-a62641cfb1dmr238210266b.31.1716581026128;
        Fri, 24 May 2024 13:03:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v2 03/13] ARM/bitops: Change find_first_set_bit() to be a define
Date: Fri, 24 May 2024 21:03:28 +0100
Message-Id: <20240524200338.1232391-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is in order to maintain bisectability through the subsequent changes, as
the order of definitions is altered.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

v2:
 * New
---
 xen/arch/arm/include/asm/bitops.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index ab030b6cb032..199252201291 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -167,10 +167,7 @@ static inline int fls(unsigned int x)
  * Returns the bit-number of the first set bit (first bit being 0).
  * The input must *not* be zero.
  */
-static inline unsigned int find_first_set_bit(unsigned long word)
-{
-        return ffsl(word) - 1;
-}
+#define find_first_set_bit(w) (ffsl(w) - 1)
 
 /**
  * hweightN - returns the hamming weight of a N-bit word
-- 
2.30.2


