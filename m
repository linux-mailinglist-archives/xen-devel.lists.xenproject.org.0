Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D940264DC4E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 14:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463393.721550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5oL1-0007jS-UN; Thu, 15 Dec 2022 13:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463393.721550; Thu, 15 Dec 2022 13:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5oL1-0007h7-RU; Thu, 15 Dec 2022 13:31:51 +0000
Received: by outflank-mailman (input) for mailman id 463393;
 Thu, 15 Dec 2022 13:31:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lTo=4N=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p5oL0-0007h1-BJ
 for xen-devel@lists.xen.org; Thu, 15 Dec 2022 13:31:50 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2921eb5-7c7c-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 14:31:49 +0100 (CET)
Received: by mail-pj1-x102c.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso2798623pjt.0
 for <xen-devel@lists.xen.org>; Thu, 15 Dec 2022 05:31:47 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 e5-20020a17090ada0500b0020ad53b5883sm3212132pjv.14.2022.12.15.05.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 05:31:45 -0800 (PST)
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
X-Inumbo-ID: d2921eb5-7c7c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hmaoQKS8SQdk7CQ+JO49wtIWp6z2c0zI9KuRQA7z6c=;
        b=Y+7zd78KY76Bzd+eA2UKYjiBO2PIW4m1H0mgmgZdUEBlBCT/hcSWVM0hUdGtIcccdz
         AKwAV9mUMkFfGKnVCOnW5xK+SUFjworSYHf5Z89HjVjqZ7b0BewFiVcRsh08TDAYNOre
         GwL+ObHEzbRoYzuQkOhjni0mqQXHEMpPk7kQOif736W9RryDWzl2qZOv9AtFJphZDvs+
         wRnJlA7yeivIdozPgsmKXYcJPI7eykHhAMoQCP0qEdQpRYE+acxCNZYfiG4Hr5t7E3Y4
         xROuEC0CzzzCth+QPtCS5uujWDs7yNTxSjHuVKISmyrtN0L34q4ekNE7CJKdpp9PutYj
         vE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hmaoQKS8SQdk7CQ+JO49wtIWp6z2c0zI9KuRQA7z6c=;
        b=crYPm96CmJPLFLoZzqzg5SV5DIr8Fkl55TV0a++afuVL2eG3dB2LXTXKIbRpBRh8kO
         KLayT8GR2e7Lc3siowYLrfTjMSdtPeuHggj/vnCY386qMl0ltjqE6byv4MbxnzkL+i+K
         a90r/PjjnPQ2qciigt7H61MrCfibiY3P4XvJRX82bZzkqO40YfOPo4Br2chCPaak1Bu1
         TsZdqZ345YvwbQJEwsXAXE+lwjvHdCfPp2F+nvI3CmEkUm2Iv17HkxXCqwUlx56yiuKL
         n/B/v9cHQVOKENbG2wk6ifYVTbTR4o79slQu0bWb3A2DFyEPITdiVmtr86icI7jehpbp
         W9GQ==
X-Gm-Message-State: ANoB5plv9fKJZ0EnNmvJrpXYyfvK5b4nNw20CQK37+7KO1syCvXVJka5
	qn9n3nJygXF6I4AQhzMI42Z7HwZ8tYKVFSza
X-Google-Smtp-Source: AA0mqf58blWXMce/Jot7EhsynkWA1JsXQ+cPVhFPEVoApoYoEpwkEgT6ztXPP1+TM0MKfjaFp4Mgkw==
X-Received: by 2002:a17:90a:fc85:b0:21a:b64:3488 with SMTP id ci5-20020a17090afc8500b0021a0b643488mr28772562pjb.44.1671111106264;
        Thu, 15 Dec 2022 05:31:46 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	osstest-admin@xenproject.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] libxl: virtio: Fix build error for 32-bit platforms
Date: Thu, 15 Dec 2022 19:01:40 +0530
Message-Id: <d4cf6539ff179e7ade820feadd8088f33da49196.1671111056.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
References: <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field 'base' in 'struct libxl_device_virtio' is defined as uint64,
while we are printing it with '%lu', which is 32bit only 32-bit
platforms. And so generates a error like:

  libxl_internal.h:4388:51: error: format '%lu' expects argument of type 'long
  unsigned int', but argument 3 has type 'uint64_t' {aka 'long long unsigned
  int'} [-Werror=format=]

Fix the same by using PRIx64 instead.

Now that the base name is available in hexadecimal format, prefix it
with '0x' as well, which strtoul() also depends upon since base passed
is 0.

Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Couldn't test on 32-bit platforms yet, but works fine for 64 bit one.

 tools/libs/light/libxl_virtio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
index 6a38def2faf5..2217bda8a253 100644
--- a/tools/libs/light/libxl_virtio.c
+++ b/tools/libs/light/libxl_virtio.c
@@ -45,12 +45,12 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
     const char *transport = libxl_virtio_transport_to_string(virtio->transport);
 
     flexarray_append_pair(back, "irq", GCSPRINTF("%u", virtio->irq));
-    flexarray_append_pair(back, "base", GCSPRINTF("%lu", virtio->base));
+    flexarray_append_pair(back, "base", GCSPRINTF("0x%"PRIx64, virtio->base));
     flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
     flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
 
     flexarray_append_pair(front, "irq", GCSPRINTF("%u", virtio->irq));
-    flexarray_append_pair(front, "base", GCSPRINTF("%lu", virtio->base));
+    flexarray_append_pair(front, "base", GCSPRINTF("0x%"PRIx64, virtio->base));
     flexarray_append_pair(front, "type", GCSPRINTF("%s", virtio->type));
     flexarray_append_pair(front, "transport", GCSPRINTF("%s", transport));
 
-- 
2.31.1.272.g89b43f80a514


