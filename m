Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C223A5BEB2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 12:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907865.1315088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxbL-0007iK-Hp; Tue, 11 Mar 2025 11:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907865.1315088; Tue, 11 Mar 2025 11:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxbL-0007fN-Cb; Tue, 11 Mar 2025 11:16:47 +0000
Received: by outflank-mailman (input) for mailman id 907865;
 Tue, 11 Mar 2025 11:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WQE=V6=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1trxbK-0006Sq-6k
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 11:16:46 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51188313-fe6a-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 12:16:45 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5495078cd59so6077124e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 04:16:45 -0700 (PDT)
Received: from epuakyiw0a98.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae45fa8sm1755729e87.52.2025.03.11.04.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 04:16:43 -0700 (PDT)
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
X-Inumbo-ID: 51188313-fe6a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741691804; x=1742296604; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOtEpGDdd8lHC2aLHRNxzl9ISoh4BrNCKPiIInwVNAg=;
        b=jBRiO0kkqdvSA4yK0nouc/gtILNiwORc3ZNvygEFl+N2eeoHHQ6ny5l5sojXR1AXZt
         TUOjyIhuR5kDyACqy1jfNX2OoneZof1iT4adTxMJMCGkxS/26dSkrM6Wvi3Wrk4OmRYr
         f8+QrnPqSRcU0fBrLXwS7ipgnc86CiiwbH6W9FdryrWZxcoViRwrfLuRjk32eZmtxBcg
         d2D/sQ3BZj6CjbcYZIbTUob4RcDExj7TBnvd6bOSb4O4ke1cM40gan+ncHRBR+ixdkp3
         EDOQKhDhOTZzqL1Ks2f94HHBAxhK6W4+T6K0wV/hEgrpk8ZjpPbLm6V5E4ZnQD8xqzS1
         MweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691804; x=1742296604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOtEpGDdd8lHC2aLHRNxzl9ISoh4BrNCKPiIInwVNAg=;
        b=LNajOXVRtcJc8H/bKfy6vaSv6A/Fp6R28efp6Cyzgr8X50EUdp3N8qySJuazyIX1ho
         MG8SqbFmbJ9w4jj4P+T8aNXsRTxPKXtsrRrOGAW2R9GweAo7RhhQuFG4Zkpch70+vCsy
         jQ4/1KnVzUSL1RmT4p77Z/xRCE+OFpz/RDM68N8BuNBcaFnJbgeANwAagtBWmjBbC85y
         c5EoFMrgHu5piNsBvRz8G6Gqkt7m3AWmTyfMYskW8vwInYOZingQCPkGK7k0DGLEixAI
         /rG2YKVKlujD4XqIb0S0H69t8t0SkyvTUU2fRYjhcGL7gWNGQvlxIDajipADQeswmEcJ
         l7Vg==
X-Gm-Message-State: AOJu0Yz1AR/bpzv4nspbO7FM3gHw0IeRGpfANnklenLm0xsF6Gdwq+ca
	/GV2bNRqfv5eqWwoTaRSKtjNUwSdKxfhSfXpK/Fv3Klyr4WapMlFyqYdnQ==
X-Gm-Gg: ASbGncsbBGMUA9DEASmHL/6vv4ijQMv1rm4T7xhQUEDkD5GpRS8SD8v67D45OdecdVj
	60UuJg+ZgojvP9IwdPVASHW4l4AwvW9/rHgwhdhPFnvCUaJx+j2IApUGgmGUKJSiNFKqwE0BaMg
	XLtvm3bfToyJTcW66ztkTCsqF5AwWNCNwq3J3imiJ+2S/uKxOvULNZJXUlIQ7KxEqNllVAFqlnN
	n9GBI+aosxsM59aPB2uN+qSWkfL04dEf3fbanuV2y6xHjFOsnyA1LRxa0opjmXG1I3nZWMo6erD
	dZ+ToUU80PZEXd+cDPnIZhD9QeofzIZadfhmNVZ9iJcl4bPj2vyJYx4xc3fuYUpLXgbaZ6CcHef
	gRJpJrsX7Y+2aCW8ubUVk3InR50E=
X-Google-Smtp-Source: AGHT+IGw121SvpsZ35jLD8nCjjL/pIbEqsB+Js6bNwH38TaKrgmFssk+9nrfBp83LHpRtNi4TrBygQ==
X-Received: by 2002:a05:6512:3e01:b0:549:8f47:e67d with SMTP id 2adb3069b0e04-549abae7180mr1223991e87.34.1741691804231;
        Tue, 11 Mar 2025 04:16:44 -0700 (PDT)
From: Grygorii Strashko <gragst.linux@gmail.com>
X-Google-Original-From: Grygorii Strashko <grygorii_strashko@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"Roger Pau Monne" <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [RFC PATCH v3 5/7] libs: libxenhypfs - handle blob properties
Date: Tue, 11 Mar 2025 13:16:16 +0200
Message-Id: <20250311111618.1850927-6-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311111618.1850927-1-grygorii_strashko@epam.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

libxenhypfs will return blob properties as is. This output can be used
to retrieve information from the hypfs. Caller is responsible for
parsing property value.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 tools/libs/hypfs/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/libs/hypfs/core.c b/tools/libs/hypfs/core.c
index 52b30db8d777..d09bba7d8c86 100644
--- a/tools/libs/hypfs/core.c
+++ b/tools/libs/hypfs/core.c
@@ -307,8 +307,6 @@ char *xenhypfs_read(xenhypfs_handle *fshdl, const char *path)
         errno = EISDIR;
         break;
     case xenhypfs_type_blob:
-        errno = EDOM;
-        break;
     case xenhypfs_type_string:
         ret_buf = buf;
         buf = NULL;
-- 
2.34.1


