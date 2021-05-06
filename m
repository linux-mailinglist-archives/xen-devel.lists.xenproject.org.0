Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9267337556B
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:11:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123594.233146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeir-0005Zp-Nw; Thu, 06 May 2021 14:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123594.233146; Thu, 06 May 2021 14:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeir-0005XC-Ki; Thu, 06 May 2021 14:11:25 +0000
Received: by outflank-mailman (input) for mailman id 123594;
 Thu, 06 May 2021 14:11:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeYc-0003iB-OS
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:00:50 +0000
Received: from mail-qv1-xf32.google.com (unknown [2607:f8b0:4864:20::f32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f2608d6-893c-4fef-a0dc-3062f788dbe2;
 Thu, 06 May 2021 14:00:07 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id i8so3089726qvv.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 07:00:07 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.07.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 07:00:06 -0700 (PDT)
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
X-Inumbo-ID: 3f2608d6-893c-4fef-a0dc-3062f788dbe2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/E99YQTRx0RTZe0/WLzL6pyfS/6uYlG8h+BkItkooCA=;
        b=UaCztVZ/FvgmmGfmCyRvuOBoUlaURs6FyQg4qli38IOSMD2KRlepGKyjkoUZQoPNLz
         lKHaRMoQiD0JsidacRHL+lDV7hJLYzEufuD0VzEyZ4n3MPg2UfG/0zJcNBR3Ca6myBTG
         sxg1oUbygQfedRgXWi19MI7621vvkuKeqw4uq82nV1wsF/ph+mzW0xFxYnArgHu+Ha1l
         ry9VCBRbrw3kDRaYlou3tg2T+zsItnOKPy2EKfoQpVjyjL07O7bQowF3ndNdESIjW4lM
         F5D05iQ3AKf6eMRoRHG5v3I7G3pELEwPxWVbSWtrPMl/YZRvFGKGzrVVeaoQ7fHVGz9I
         TUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/E99YQTRx0RTZe0/WLzL6pyfS/6uYlG8h+BkItkooCA=;
        b=CisDO9qDcWcI41/9/g7zxouud4tVGCzSEGM6zH09mEDHrBJlrV35pE/HdSaRKB0sEp
         Bl6HClJxXF/A1OENLo4LIqxtqUg8QelYzpPo5RqPCuQAlvuxY7KofvQEeSGraOdKM0UJ
         c1N10OHBfBYhyO9vAdtNdkzF8lSojwRqACdAmiNoF/6ZnU2md/kbyzWRiBX3kyvpArhg
         siuuusmbZ2THYBHXNNfbr38Yv2Gheoo3TY6G/rWi55e3+UcMCOKoBWMAxeHPwcKK4I1z
         uihe65n+sm83z5DqPF5ExKb86JZ3+dzcS8Eh8XeKar7UClC8fvQKKFLNQdW0nIByX0UY
         ZDJg==
X-Gm-Message-State: AOAM531SCcfg5i7a9gawC2JNW+yuOMVCKkmgyH8sj281+pjeb4CZwleR
	NIByq7wfvFOG/ggimSG3MJPIvrtJu8w=
X-Google-Smtp-Source: ABdhPJxleNtmX+v0KHt/6+jkeldv+4xkcWlSn4GhoIc/oVW82SbEtnz/Kcgb+4eNSUSrCMmthwqHgg==
X-Received: by 2002:a05:6214:241:: with SMTP id k1mr4430410qvt.29.1620309607051;
        Thu, 06 May 2021 07:00:07 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 12/13] vtpmmgr: Check req_len before unpacking command
Date: Thu,  6 May 2021 09:59:22 -0400
Message-Id: <20210506135923.161427-13-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506135923.161427-1-jandryuk@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vtpm_handle_cmd doesn't ensure there is enough space before unpacking
the req buffer.  Add a minimum size check.  Called functions will have
to do their own checking if they need more data from the request.

The error case is tricky since abort_egress wants to rely with a
corresponding tag.  Just hardcode TPM_TAG_RQU_COMMAND since the vtpm is
sending in malformed commands in the first place.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 stubdom/vtpmmgr/vtpm_cmd_handler.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/stubdom/vtpmmgr/vtpm_cmd_handler.c b/stubdom/vtpmmgr/vtpm_cmd_handler.c
index c879b24c13..5586be6997 100644
--- a/stubdom/vtpmmgr/vtpm_cmd_handler.c
+++ b/stubdom/vtpmmgr/vtpm_cmd_handler.c
@@ -840,6 +840,12 @@ TPM_RESULT vtpmmgr_handle_cmd(
 	UINT32 size;
 	TPM_COMMAND_CODE ord;
 
+	if (tpmcmd->req_len < sizeof_TPM_RQU_HEADER(tpmcmd->req)) {
+		status = TPM_BAD_PARAMETER;
+		tag = TPM_TAG_RQU_COMMAND;
+		goto abort_egress;
+	}
+
 	unpack_TPM_RQU_HEADER(tpmcmd->req,
 			&tag, &size, &ord);
 
-- 
2.30.2


