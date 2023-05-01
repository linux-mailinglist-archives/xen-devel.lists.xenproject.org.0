Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90FA6F37AE
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528113.820941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEv-00043C-6L; Mon, 01 May 2023 19:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528113.820941; Mon, 01 May 2023 19:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEu-0003zc-UY; Mon, 01 May 2023 19:31:12 +0000
Received: by outflank-mailman (input) for mailman id 528113;
 Mon, 01 May 2023 19:31:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZEt-000149-19
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:31:11 +0000
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b922eb57-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:31:09 +0200 (CEST)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-3eab1f2ba18so13396801cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:31:09 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d6-20020ac80606000000b003bf9f9f1844sm9351784qth.71.2023.05.01.12.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:31:07 -0700 (PDT)
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
X-Inumbo-ID: b922eb57-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969468; x=1685561468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SMitIr3/lPLI3ESf+JT4clE3jKHCc578aryTjCi/TM=;
        b=fiGDFAOgA/yRwd4eCcCOYq1b+8La77hlcXxxVYY11Jk3ndSYohpbOgDWzMc+ef2i7y
         MZUw4a2bVpYlLbvPg0AkKIkzn/jZOC0/fSkrMmVCbF5iNv+gD5CzIpL9eKIXO4A4IWOY
         zO5I+Gppui1NvJrXDFx5WHy4gH9DsTROqREvqQVl0rpr2FiWZ8JRj9AD29fcdwqL7mOu
         UenAFx6F2pAc7I+Z0qFd2qyUwx2BXVG4ZsRItUDTqLk6dI9yNwsqHk3OWC0hmzQW/cDz
         klfjzF7uS9KkQhdVoDE3D2XHzi//AoVJg5Gt783IE/hqKELm00ios7PJhaABv269uSGX
         nNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969468; x=1685561468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SMitIr3/lPLI3ESf+JT4clE3jKHCc578aryTjCi/TM=;
        b=Jin5OuPOQdz8Jh887hbY6gzPZGH5y9Cc095NUQiEse0T7JJLcMiOnGZj+ZVgIx75Ke
         6MedX/5QdFyFcUiftjLOMjR6w8Dahp9PLyNjygRya4Tdb9U1ym0JcSTJKUHkpl3lu6rl
         QmU8gVvrFuqtVbVur1E32AzCR8S3P90g4cVVdsncJw0Qt+N1jAkA359EwHv+ZD80XIaW
         oRdCim4VZ4fycer0ZphWR5XkSr8/jPjpHVz2jUyr2BCFcMDEWz04qrGG1LYduza7pF88
         db8F+zcTViI+amomQkJLr9pLrpyUOWeQk6i1aHd8D3Wv6kJzm4ZhhHtCazPmdzmLsqsT
         De8Q==
X-Gm-Message-State: AC+VfDzdwcu5opoyq/xs7T86F7RJgDc8HIq1+aQba8XAHRQ6IlwPVyHO
	iba1AHNuw+Ka7hQNk1ahK8IjsqBkC2g=
X-Google-Smtp-Source: ACHHUZ4zfsPnNVWoI6gOx5jVThON5YPlKizbp+7vW0T78d3g1rUxzlLc/WN/8uL2RyHM2Eexervnuw==
X-Received: by 2002:a05:622a:1a8c:b0:3a8:a84:7ffa with SMTP id s12-20020a05622a1a8c00b003a80a847ffamr24778833qtc.57.1682969467897;
        Mon, 01 May 2023 12:31:07 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 08/14 RESEND] libxc: Include hwp_para in definitions
Date: Mon,  1 May 2023 15:30:28 -0400
Message-Id: <20230501193034.88575-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501193034.88575-1-jandryuk@gmail.com>
References: <20230501193034.88575-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the hwp_para fields through libxc.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/include/xenctrl.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 05967ecc92..437001d713 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1903,6 +1903,7 @@ int xc_smt_disable(xc_interface *xch);
  */
 typedef struct xen_userspace xc_userspace_t;
 typedef struct xen_ondemand xc_ondemand_t;
+typedef struct xen_hwp_para xc_hwp_para_t;
 
 struct xc_get_cpufreq_para {
     /* IN/OUT variable */
@@ -1930,6 +1931,7 @@ struct xc_get_cpufreq_para {
     union {
         xc_userspace_t userspace;
         xc_ondemand_t ondemand;
+        xc_hwp_para_t hwp_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.40.0


