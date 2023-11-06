Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E47E281C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 16:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628138.979307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AM-0001Oo-Jb; Mon, 06 Nov 2023 15:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628138.979307; Mon, 06 Nov 2023 15:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AM-0001LR-FL; Mon, 06 Nov 2023 15:05:26 +0000
Received: by outflank-mailman (input) for mailman id 628138;
 Mon, 06 Nov 2023 15:05:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eGT=GT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r01AK-000892-DO
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 15:05:24 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8176dff-7cb5-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 16:05:22 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so32935115e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 07:05:22 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b0040776008abdsm12507392wmo.40.2023.11.06.07.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 07:05:14 -0800 (PST)
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
X-Inumbo-ID: e8176dff-7cb5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699283121; x=1699887921; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4/Hgemc7FudDEbRsY77L74znr+mz6WqSRzC5h7qg2g=;
        b=X49b5EgeCbaWw46qSJ4hKp1gccCM3lf2KUICJ+OWIYgWuMo7AewmzSLq+fGWOfOVza
         QTFdkfYHMzIW6yghbDVftQVRT75npFQazoAF+wYcIr91sY5ZeUf7qc/kUBU7GWM1yCEG
         mq6fJbPCWXKg14JW9kA3uH+QD8dLdScMLwJRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283121; x=1699887921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4/Hgemc7FudDEbRsY77L74znr+mz6WqSRzC5h7qg2g=;
        b=uz/prow8c/cjicBT25pDbwBiCztZTFL5goSx9cjFd6bPsS3hvLW80nmIhf7aJqcO8C
         tsCxKLcytLyV3VhKwrEKpD/ZUJ+uNMZOSBZWDMjTHmZ6u0J3gyZlJkJGIRZolTmGiEyT
         ultHvamaxwYOI31MvFQza5XAQZiU1u8fLDm9nSDqCcXqV722ODvzDztlyfersfhovc8t
         XbApz8xK0uyW22Ifojq3xDNROugBV/y6ralyhx2T/+6U6S25UNyVIR5UrVSNQJU8qz/p
         4s96Y27+VVadvGvKfW+igG9M4TNQcxkw+ST1Z1ud5VMDmpVrjoWY5Fm1eHp72c8RlQqG
         WbHw==
X-Gm-Message-State: AOJu0YwEbvGQz7iIU684ZQb58yPd5QIBJOCQEWs5s93iLDozucg+Dzcm
	HJi3ffn9trTD8my0XZpBgam4d/yuBX9p13n8cAg=
X-Google-Smtp-Source: AGHT+IGh7mkaVJD+dEz1MhtP/IPYiw7iBgy6n149cmbUk/mpic12Beg8L/ECH7uBbE6E9DQ1MHmlpw==
X-Received: by 2002:a05:600c:19d3:b0:402:f91e:df80 with SMTP id u19-20020a05600c19d300b00402f91edf80mr11789213wmq.3.1699283114304;
        Mon, 06 Nov 2023 07:05:14 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/6] tools/pygrub: Fix bug in LIMIT_FSIZE env variable override
Date: Mon,  6 Nov 2023 15:05:04 +0000
Message-Id: <20231106150508.22665-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The env variable must be interpreted as an integer. As it is, the override
logic simply causes an exception.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/pygrub/src/pygrub | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
index 08540ad288..327cf51774 100755
--- a/tools/pygrub/src/pygrub
+++ b/tools/pygrub/src/pygrub
@@ -89,7 +89,7 @@ def downgrade_rlimits():
     # write permissions are bound.
     fsize = LIMIT_FSIZE
     if "PYGRUB_MAX_FILE_SIZE_MB" in os.environ.keys():
-        fsize = os.environ["PYGRUB_MAX_FILE_SIZE_MB"] << 20
+        fsize = int(os.environ["PYGRUB_MAX_FILE_SIZE_MB"]) << 20
 
     resource.setrlimit(resource.RLIMIT_FSIZE, (fsize, fsize))
 
-- 
2.34.1


