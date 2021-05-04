Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3E8372A54
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122281.230601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUK-0005og-6f; Tue, 04 May 2021 12:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122281.230601; Tue, 04 May 2021 12:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUK-0005o0-2z; Tue, 04 May 2021 12:49:20 +0000
Received: by outflank-mailman (input) for mailman id 122281;
 Tue, 04 May 2021 12:49:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lduUH-0005hX-RF
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:49:17 +0000
Received: from mail-qt1-x82c.google.com (unknown [2607:f8b0:4864:20::82c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37a208f9-55da-474d-b809-2c31378d1d2e;
 Tue, 04 May 2021 12:49:12 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id o1so6152340qta.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 05:49:12 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:92e5:6d58:b544:4daa])
 by smtp.gmail.com with ESMTPSA id
 i11sm2355001qtv.8.2021.05.04.05.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:49:11 -0700 (PDT)
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
X-Inumbo-ID: 37a208f9-55da-474d-b809-2c31378d1d2e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mBt899KCzk+1nbxQuHuD9pe5MRuqdb/uNTd34+igWrM=;
        b=G/Us5UcFLnbOBW2ZxV/xvgiRyKBiZispCo68BGevhBKsXCLZtNTLLTc4oPSfFJalWY
         hFENro5shnFlNzV5GZ+qEECrYCZDtO74ZZ/Y/iebR9qmVb2biicsJUvFdB6scJn6tcaw
         2xuh1FD38bAYlvkqgdyjEG6hvmk1uk90DiDhyjuMuj8FFFNyG0HT/if7yY8dR1tbazYG
         v/b7PUaMKPyY2DfLi8CK9jLSVU2/yU3vP/QS5O8ZLsel1lYVxxOT5YpxtS1qlWhp3UNA
         3mWvvS87E0tKEyFqCNVoZq4bCmtnui3HEmUD7n+eJ93fdAJH2ru32RuUqrS4JV+HtLRC
         34zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mBt899KCzk+1nbxQuHuD9pe5MRuqdb/uNTd34+igWrM=;
        b=t0lpoCK2acfOcG3WWFMBGBnOgTuRc3NETXD8u2H5SlFhz3MHvL0iTc+VEa1lMWu8uK
         dwP4XfstadKxt2bKt1QvNbWjlpAcVPB69ZM0O/vwrtyjFN9hTDcdWZ/JS5Inh1kBvka7
         8TP7wvf+04X3bBJe3IHNPw9igsp7frCBQHc7AGKNoygk8CeWv2b3M2eRabBGn9c60bgw
         EWO2hDmNs6ptagub92/o+Baw7KYvMEZPN3ImW2EW08wJewmVq99Hg8HJL+rTL+OE68B7
         ZJ6CpWTD1ra+kQCHJoSisU8/Obl3TAR2SE7zmyp/Za2Al7lK2eV49K3hXwhALQJTXwjv
         rH0A==
X-Gm-Message-State: AOAM5339/iVnZmc5XtJskGhLq/4+gXqQqkDWXKyCpiF3sLBmvpYBniaJ
	pADLNyy2I/zAkoDwZhswh/1BQTw+lL4=
X-Google-Smtp-Source: ABdhPJwNXWm+uBV0EUqUcW0M49kF1m7xKv8ZVNnfm8ZAL8isMlbC1MwV+wwtOvN2wXOH7wVCTmEQCw==
X-Received: by 2002:ac8:5358:: with SMTP id d24mr3180823qto.351.1620132552280;
        Tue, 04 May 2021 05:49:12 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 2/9] vtpmmgr: Print error code to aid debugging
Date: Tue,  4 May 2021 08:48:35 -0400
Message-Id: <20210504124842.220445-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504124842.220445-1-jandryuk@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tpm_get_error_name returns "Unknown Error Code" when an error string
is not defined.  In that case, we should print the Error Code so it can
be looked up offline.  tpm_get_error_name returns a const string, so
just have the two callers always print the error code so it is always
available.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
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


