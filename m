Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394BD81923A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 22:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657212.1025944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFhZ2-00025F-7v; Tue, 19 Dec 2023 21:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657212.1025944; Tue, 19 Dec 2023 21:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFhZ2-00021u-4V; Tue, 19 Dec 2023 21:23:44 +0000
Received: by outflank-mailman (input) for mailman id 657212;
 Tue, 19 Dec 2023 21:23:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6WA=H6=gmail.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rFhYz-00021o-O8
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 21:23:41 +0000
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfb06910-9eb4-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 22:23:39 +0100 (CET)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-58d1b767b2bso3169887eaf.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 13:23:38 -0800 (PST)
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
X-Inumbo-ID: dfb06910-9eb4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703021017; x=1703625817; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nICuEkfj3PLAPb4crBPZRGpg1B1vpuOWK3zadnS8iKQ=;
        b=WFySQjuwwy3PVXrtea+IBOzz2ag5ujhj+qO3vB8JZ2w62lXmKKzexSv16YrzQq6Zdh
         VVW33uGZPz0T6tpJ8p8LcgjtXTNpEshn0/vzRL27pgW7O24N2ZtTA5uZI3ciPX2EJDP3
         hgEIx+0zf59Zc1jQySeoNL5ll0+DBXkBO19kBBr3ZLSBtuU8GsdVYdSdsBpzjw2x5h74
         KIpOOAEOVgc1AbyH0EFlfkOFOh/w8JM0Kn+GziPrm5RzYMqfvzmIyr2UfdtQfcnnpBSv
         Qe3YVlZG92+ezDvH1v6tuRcDsRD1aftHmf4aWvFpSqUnvrQnMDHMaFYB+gWjZyu1MSgP
         uXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703021017; x=1703625817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nICuEkfj3PLAPb4crBPZRGpg1B1vpuOWK3zadnS8iKQ=;
        b=qKiSS2v8XjlkN/iUWFGEzsMdcUQx9AMva/toUVMAXAIZ4Nl+N+AG1/UPzmoXem3kM3
         EA9g+DVQp2qPPvEEitp0HeKzbgCPmrgCZAwPtJD9KxRC1i3++h+4GE66/BDCsxX9iI3a
         qu9T5XF0t1rRhkWet1M5qsXJRDcuiu+LWns+6t0EXL1a9NuX8vZ15aSBauf5O7o9ZN4u
         H2bAU3l1e2WH/iG09FCZ8SD3Y637T1pj9GjfWsUFX3e8iOAyfnJSX2ExwPYhUqtW9VtV
         3wOZXlIXzUXasnE7wd5vxQG1ab/W1CatZhSt3+XM2gmyqZHFkPIKV4UtjDLuloqu0acH
         O4Ng==
X-Gm-Message-State: AOJu0YxpZkII7RgWb5PYosrW/8SEynrhRYVCs7yZiSR71NMS/1DDPscv
	bP34UcgosV9ZG7/5bM7z4003ZpadmKmRDQU717E=
X-Google-Smtp-Source: AGHT+IHVIv/bhibWf/9XrrtIyC0FAx9t0SjtZNCD+Hdo7m5wJu+F4HtlpD8Eqdypy7Sair+AhRUzUIcHjZxF9HQZERU=
X-Received: by 2002:a4a:aac4:0:b0:593:f907:68ec with SMTP id
 e4-20020a4aaac4000000b00593f90768ecmr686837oon.14.1703021017426; Tue, 19 Dec
 2023 13:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20231205182011.1976568-1-stefanha@redhat.com> <20231205182011.1976568-5-stefanha@redhat.com>
 <ZYG2mSe1JWnC0tq_@redhat.com> <ZYHew2poxuJJRyhC@redhat.com>
In-Reply-To: <ZYHew2poxuJJRyhC@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 19 Dec 2023 16:23:25 -0500
Message-ID: <CAJSP0QX0fg0TGWuveJz6+QbF9EmY=vPiU-c99fHZMN=1jAnXkw@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] aio: make aio_context_acquire()/aio_context_release()
 a no-op
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Cleber Rosa <crosa@redhat.com>, 
	Xie Changlong <xiechanglong.d@gmail.com>, Paul Durrant <paul@xen.org>, Ari Sundholm <ari@tuxera.com>, 
	Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Wen Congyang <wencongyang2@huawei.com>, 
	Alberto Garcia <berto@igalia.com>, Anthony Perard <anthony.perard@citrix.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, 
	Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>, 
	Fabiano Rosas <farosas@suse.de>, Hanna Reitz <hreitz@redhat.com>, Zhang Chen <chen.zhang@intel.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Peter Xu <peterx@redhat.com>, 
	Emanuele Giuseppe Esposito <eesposit@redhat.com>, Fam Zheng <fam@euphon.net>, Leonardo Bras <leobras@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Li Zhijian <lizhijian@fujitsu.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

The following hack makes the test pass but there are larger safety
issues that I'll need to look at on Wednesday:

diff --git a/nbd/server.c b/nbd/server.c
index 895cf0a752..cf4b7d5c6d 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1617,7 +1617,7 @@ static void nbd_drained_begin(void *opaque)
     }
 }

-static void nbd_drained_end(void *opaque)
+static void nbd_resume_clients(void *opaque)
 {
     NBDExport *exp = opaque;
     NBDClient *client;
@@ -1628,6 +1628,15 @@ static void nbd_drained_end(void *opaque)
     }
 }

+static void nbd_drained_end(void *opaque)
+{
+    NBDExport *exp = opaque;
+
+    /* TODO how to make sure exp doesn't go away? */
+    /* TODO what if AioContext changes before this runs? */
+    aio_bh_schedule_oneshot(nbd_export_aio_context(exp),
nbd_resume_clients, exp);
+}
+
 static bool nbd_drained_poll(void *opaque)
 {
     NBDExport *exp = opaque;

