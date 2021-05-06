Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4F4375545
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123534.233003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeXq-0004am-4S; Thu, 06 May 2021 14:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123534.233003; Thu, 06 May 2021 14:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeXq-0004WY-0I; Thu, 06 May 2021 14:00:02 +0000
Received: by outflank-mailman (input) for mailman id 123534;
 Thu, 06 May 2021 14:00:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeXo-0003iB-NM
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:00:00 +0000
Received: from mail-qk1-x72b.google.com (unknown [2607:f8b0:4864:20::72b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35cf9597-2d37-4779-b7e5-b5274f56732d;
 Thu, 06 May 2021 13:59:56 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id a22so4385472qkl.10
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 06:59:56 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.06.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:59:55 -0700 (PDT)
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
X-Inumbo-ID: 35cf9597-2d37-4779-b7e5-b5274f56732d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SCid/Fz7LIrkhT623U47nCiexIJBPSb/z7U4jQky+9M=;
        b=o74AxszkG4ApqEkoZ8gmh9ZcWJHzVmj9wYURxh2AI+TkrexELduphfW+qEXIX+gkuo
         adrRZWaGh77TNrzEn+VCKwwlm68QOuah312/X/FjOIjE759FbPWIxCBDUySfHoG1gRv2
         LYskFUGFsNJZGi1at+wWQh4EfpnYfZ54tSd/qtnoG9ZMBDdnE6a3lQjTECSeyi3WmG0S
         ee1YQnzPQ13t2/ho7lrg/VvZoUTLqsLPYUuX9qczGd1GdFjd31BBUcd2TAfkHNrSyals
         rt+cV2ODjk+1uKVvjs1Xkus0cF3gfNr+NtP7cBXK6GU2f0gKX8nsgF5zqVKu/RPXfoaB
         4zAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SCid/Fz7LIrkhT623U47nCiexIJBPSb/z7U4jQky+9M=;
        b=TrNukfYeITWXslD2Sf4E5xCfTC6jGiSPdOn9X0EQF6D94BS6Fb4KqS98dWkWrzsWqa
         mwLvLd0D7xns4JMUi6LxaVs9mgyTrFIe19/RfU8ZtjJaNxij8iZuiIexdY+A0RAN5T/1
         mvKFk5zqEg0LCt8KlCX/5U3tTgNsn+6TYIpK4ishGDEVVaGeDt7TyGIlgPOE3fgM+914
         xFxmWkr4UPkqMEuwvoMb0185NwDgoGB+8zeDhkL37ZopOhlEarFt9ANWu2VS5m/3xOJk
         5Fo2+cxHXmrdpHdhPNnCw7QSXhhzWFjkgkxQdK9DYj/mNBcj8q0/5dvFAfI4XB8UMV+T
         Xzfw==
X-Gm-Message-State: AOAM53016wWfpxgHw88D9MdkQPpuNZH2v0J+JIG7Xd1gMM1pJFNfdnAq
	4Uhy/SF/phg2xYy22R3oSsEBEvG67n8=
X-Google-Smtp-Source: ABdhPJznW38Pts006EYI4l39hd8n1Uo8kITRc1YT80eVCcvk6D4zMIvvHlnpALjfDJcYZCDkjDXYlw==
X-Received: by 2002:a05:620a:e05:: with SMTP id y5mr4149112qkm.250.1620309595574;
        Thu, 06 May 2021 06:59:55 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 02/13] vtpmmgr: Print error code to aid debugging
Date: Thu,  6 May 2021 09:59:12 -0400
Message-Id: <20210506135923.161427-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506135923.161427-1-jandryuk@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tpm_get_error_name returns "Unknown Error Code" when an error string
is not defined.  In that case, we should print the Error Code so it can
be looked up offline.  tpm_get_error_name returns a const string, so
just have the two callers always print the error code so it is always
available.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 stubdom/vtpmmgr/tpm.c  | 2 +-
 stubdom/vtpmmgr/tpm2.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/stubdom/vtpmmgr/tpm.c b/stubdom/vtpmmgr/tpm.c
index 779cddd64e..83b2bc16b2 100644
--- a/stubdom/vtpmmgr/tpm.c
+++ b/stubdom/vtpmmgr/tpm.c
@@ -109,7 +109,7 @@
 			UINT32 rsp_status; \
 			UNPACK_OUT(TPM_RSP_HEADER, &rsp_tag, &rsp_len, &rsp_status); \
 			if (rsp_status != TPM_SUCCESS) { \
-				vtpmlogerror(VTPM_LOG_TPM, "Failed with return code %s\n", tpm_get_error_name(rsp_status)); \
+				vtpmlogerror(VTPM_LOG_TPM, "Failed with return code %s (%x)\n", tpm_get_error_name(rsp_status), rsp_status); \
 				status = rsp_status; \
 				goto abort_egress; \
 			} \
diff --git a/stubdom/vtpmmgr/tpm2.c b/stubdom/vtpmmgr/tpm2.c
index c9f1016ab5..655e6d164c 100644
--- a/stubdom/vtpmmgr/tpm2.c
+++ b/stubdom/vtpmmgr/tpm2.c
@@ -126,7 +126,7 @@
     ptr = unpack_TPM_RSP_HEADER(ptr, \
           &(tag), &(paramSize), &(status));\
     if ((status) != TPM_SUCCESS){ \
-        vtpmlogerror(VTPM_LOG_TPM, "Failed with return code %s\n", tpm_get_error_name(status));\
+        vtpmlogerror(VTPM_LOG_TPM, "Failed with return code %s (%x)\n", tpm_get_error_name(status), (status));\
         goto abort_egress;\
     }\
 } while(0)
-- 
2.30.2


