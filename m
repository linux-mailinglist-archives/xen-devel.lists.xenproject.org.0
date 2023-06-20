Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A54E737295
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551998.861889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBez1-00005H-00; Tue, 20 Jun 2023 17:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551998.861889; Tue, 20 Jun 2023 17:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBez0-0008R5-QZ; Tue, 20 Jun 2023 17:17:34 +0000
Received: by outflank-mailman (input) for mailman id 551998;
 Tue, 20 Jun 2023 17:17:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBeyz-0005QM-3r
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:17:33 +0000
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56b00e4c-0f8e-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:17:31 +0200 (CEST)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-bad0c4f6f50so7245312276.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:17:31 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 f81-20020a25cf54000000b00bcc0f2e4f05sm461938ybg.59.2023.06.20.10.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:17:29 -0700 (PDT)
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
X-Inumbo-ID: 56b00e4c-0f8e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281450; x=1689873450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKLROIhWgv3+xi3Vs6x4ocWCkHBA1opf2j9dZHATYxs=;
        b=TP1s5+8iR+cBMvwk90dAA1lgL5Z6puW4qrWgOa6gtmymrkBsZssZpuEHyEfhnOfBOh
         FFUeJavix8yHy0hAkvYbx/ed0n+dsE7+b3vkD8T2xSSXGeSjGPFApdYHSLLlB6OUaBBI
         Mxf45Ebsi6ykAEzObjnKd9tCY944d4cLVbMzsfUhSK9XPYJb6X8jWWDHygVXvOhU+iNc
         AgAFA/PkaxlIFyUDOsnCEmMzqicDuVFa+sD/wSRJOcc+uYILiUfiyuJzvkQKVFwUJDUx
         i7uZvslX1yxUda9+ZhsnwvR3NTff40UZxFxl5flAy6v7RNHSqc0wE4fgbc8HD8Z8sXzc
         QeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281450; x=1689873450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKLROIhWgv3+xi3Vs6x4ocWCkHBA1opf2j9dZHATYxs=;
        b=Xgnf3ThNpVWdZ/gK7+04AZSRGutnUid56KJwaNvvCIcOKEFx6DUZPfMvJlgmO68T5u
         47At0KotxLFCR2/9A1EhJSDIaeN+T9ijBc8paVdFb43BXudQvU/R0pbT3l4JXgGqyscH
         gZ3zgdflw0QcMI1ll4FZ13rwnKt5cbcFSSD74DgL8cW72j1xywUDa1qy5KpFheSqMQyI
         cuE/kGZv1YyaWEet/jZy/6Ubl3QWRxLj5gQkyFCfF/LK/uN9BfpN8AHBd/03601s3aYc
         vvWDHohrqll3EOXn7fvYfve7k97tD+3ZOMkutXkSrpkqp/Pz2LrcON169vAFbZ7n/c/a
         FFWQ==
X-Gm-Message-State: AC+VfDxkDjcWcSFnaYzKauruVFguyb/eG/UxLliSCgEjb5YOsttP3U3X
	+PZFsvQ3zgO8Y0eDSu7UrJtaJMbKmmSOew==
X-Google-Smtp-Source: ACHHUZ4VO5sA/MEoNT//Z7AzINadcpFUb7ygHV16VD68wDGOlNiSzZRmpM6RKADkZboMddtweLYbgQ==
X-Received: by 2002:a25:5ca:0:b0:bd6:a97e:3597 with SMTP id 193-20020a2505ca000000b00bd6a97e3597mr11233027ybf.30.1687281450004;
        Tue, 20 Jun 2023 10:17:30 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 11/12] docs: provide description for device_model_machine option
Date: Tue, 20 Jun 2023 13:15:51 -0400
Message-Id: <b505769464299002202f6a44d42fc4d414387918.1687215890.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687215890.git.jupham125@gmail.com>
References: <cover.1687215890.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds description for 'device_model_machine' option which allows
to control which chipset will be emulated by device model.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 docs/man/xl.cfg.5.pod.in | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 24ac927182..be61227313 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2838,6 +2838,33 @@ you have existing guests then, depending on the nature of the guest
 Operating System, you may wish to force them to use the device
 model which they were installed with.
 
+=item B<device_model_machine="STRING">
+
+Selects which chipset the device model should emulate for this
+guest.
+
+Valid options are:
+
+=over 4
+
+=item B<"i440">
+
+Use i440 emulation (a default setting)
+
+=item B<"q35">
+
+Use Q35/ICH9 emulation. This enables additional features for
+PCIe device passthrough
+
+=back
+
+Note that omitting device_model_machine parameter means i440 system
+by default, so the default behavior doesn't change for old domain
+config files.
+
+It is recommended to install the guest OS from scratch to avoid issues
+due to the emulated platform change.
+
 =item B<device_model_override="PATH">
 
 Override the path to the binary to be used as the device-model running in
-- 
2.34.1


