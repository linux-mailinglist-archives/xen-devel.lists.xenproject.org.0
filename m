Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C05A7091EA
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 10:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536767.835451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvl0-0000sT-VG; Fri, 19 May 2023 08:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536767.835451; Fri, 19 May 2023 08:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvl0-0000nd-R9; Fri, 19 May 2023 08:46:38 +0000
Received: by outflank-mailman (input) for mailman id 536767;
 Fri, 19 May 2023 08:46:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qg83=BI=redhat.com=sgarzare@srs-se1.protection.inumbo.net>)
 id 1pzvkz-0000DN-MT
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 08:46:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a92afa7b-f621-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 10:46:36 +0200 (CEST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-cfZxm1aPPUqmfaY1c8D1qA-1; Fri, 19 May 2023 04:46:30 -0400
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-96f6e83685eso37415166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 May 2023 01:46:30 -0700 (PDT)
Received: from sgarzare-redhat (c-115-213.cust-q.wadsl.it. [212.43.115.213])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a1709066c9700b0094f4d2d81d9sm1996669ejr.94.2023.05.19.01.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 01:46:28 -0700 (PDT)
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
X-Inumbo-ID: a92afa7b-f621-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684485994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YEL2y9nbWEymaZC5VtAMnGiLPQ/RQ8cB14tNAAAKQbE=;
	b=diOdkqvPd9LkiEUo+u23roxXbub6FKj2bAy3wcbJyIQbBHrPODXl0ZldjlXoVvyLTrTPY9
	pdcvjZu39gJPgUpNozxcpI86sYd7AG8pZrU21IUdXxaO/0rYEANU4J4yCo5H1LM+hcP15G
	iQLRG1cN1Nsk3h8hmhY0pWU56eQYh3g=
X-MC-Unique: cfZxm1aPPUqmfaY1c8D1qA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684485990; x=1687077990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEL2y9nbWEymaZC5VtAMnGiLPQ/RQ8cB14tNAAAKQbE=;
        b=D6exAjiYFa4CfoGOy/d1sA5LEPn1jATW74UeMPS09CUPgUvFhPg9NWImY5lDjf4D5X
         tDJ+uRxfRh/uDNGoJ9FsRgrFR7D8OT88KEJEhP5+Gx32QBaXyP36iOuskuuY2UKMQXos
         Lz1mWuw2XT1hHzGVO5qfeo2uVgXi9IMwUP/LQwAq/aUBV48Hu1V7VnBs6AbTMLmW5vf/
         OzGoQnKbxBwWE5YcaxkWtNIrScaeVaxMKHjNbDmCb9yDKITR+vnKcTn0jc+bx0r/bYiD
         daiBFPSgFZWaos3RHCxnnvb69zONSlxijfO19LMDDGXDgKN1z1a6KTl5KZ537Hm8QcXu
         Yz+g==
X-Gm-Message-State: AC+VfDzdAGDwDLbATD4OyRLSUZWjvi7+KC2da/3WptOgZYhlcfKk1wRO
	mhtsalmQAe3cQhfiVxrlSWhEcJo0DQVpemslhWDQX8RQOBnOZF7vE/KACJOSWBAYPmCKONqhz9A
	FJrTnNrCsV/GscybekxQT0UwP7wo=
X-Received: by 2002:a17:907:6d26:b0:957:2e48:5657 with SMTP id sa38-20020a1709076d2600b009572e485657mr888525ejc.68.1684485989850;
        Fri, 19 May 2023 01:46:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5SxN5pRvFk0iFfnDnDMghNaM1OvyjcQaMREZ/NtKawPbRiFV6lVdDqQ5/uyeE2nKgNGlLyqw==
X-Received: by 2002:a17:907:6d26:b0:957:2e48:5657 with SMTP id sa38-20020a1709076d2600b009572e485657mr888509ejc.68.1684485989512;
        Fri, 19 May 2023 01:46:29 -0700 (PDT)
Date: Fri, 19 May 2023 10:46:25 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
	Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Aarushi Mehta <mehta.aaru20@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 2/6] block/nvme: convert to blk_io_plug_call() API
Message-ID: <utuievutol5cux2axpym7x3t4tueresl4tbqadizc36f5yblpi@ndpva7u6croa>
References: <20230517221022.325091-1-stefanha@redhat.com>
 <20230517221022.325091-3-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230517221022.325091-3-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, May 17, 2023 at 06:10:18PM -0400, Stefan Hajnoczi wrote:
>Stop using the .bdrv_co_io_plug() API because it is not multi-queue
>block layer friendly. Use the new blk_io_plug_call() API to batch I/O
>submission instead.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> block/nvme.c | 44 ++++++++++++--------------------------------
> 1 file changed, 12 insertions(+), 32 deletions(-)
>
>diff --git a/block/nvme.c b/block/nvme.c
>index 5b744c2bda..100b38b592 100644
>--- a/block/nvme.c
>+++ b/block/nvme.c
>@@ -25,6 +25,7 @@
> #include "qemu/vfio-helpers.h"
> #include "block/block-io.h"
> #include "block/block_int.h"
>+#include "sysemu/block-backend.h"
> #include "sysemu/replay.h"
> #include "trace.h"
>
>@@ -119,7 +120,6 @@ struct BDRVNVMeState {
>     int blkshift;
>
>     uint64_t max_transfer;
>-    bool plugged;
>
>     bool supports_write_zeroes;
>     bool supports_discard;
>@@ -282,7 +282,7 @@ static void nvme_kick(NVMeQueuePair *q)
> {
>     BDRVNVMeState *s = q->s;
>
>-    if (s->plugged || !q->need_kick) {
>+    if (!q->need_kick) {
>         return;
>     }
>     trace_nvme_kick(s, q->index);
>@@ -387,10 +387,6 @@ static bool nvme_process_completion(NVMeQueuePair *q)
>     NvmeCqe *c;
>
>     trace_nvme_process_completion(s, q->index, q->inflight);
>-    if (s->plugged) {
>-        trace_nvme_process_completion_queue_plugged(s, q->index);

Should we remove "nvme_process_completion_queue_plugged(void *s,
unsigned q_index) "s %p q #%u" from block/trace-events?

The rest LGTM!

Thanks,
Stefano


