Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180266DE315
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 19:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519752.806683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmI5k-000219-EK; Tue, 11 Apr 2023 17:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519752.806683; Tue, 11 Apr 2023 17:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmI5k-0001zO-B7; Tue, 11 Apr 2023 17:47:40 +0000
Received: by outflank-mailman (input) for mailman id 519752;
 Tue, 11 Apr 2023 17:47:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqSW=AC=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pmI5i-0001zI-P1
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 17:47:39 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0cae525-d890-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 19:47:35 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94a356c7419so213604466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Apr 2023 10:47:34 -0700 (PDT)
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
X-Inumbo-ID: f0cae525-d890-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681235254; x=1683827254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=89D/U2/ABD8Hnu1Y3Qqw4jqD4G1xSecynmnwgvqJh1E=;
        b=YnBxk/BjOwvAHI0NJ7QNqauiFlUOEHqqJtYcO4wshZ5d4biGRT67xd+gtKmL2yTAG1
         /spFeX1cHhQgfRHw3qLE5gFE7DRVJIMjMwU0DKeOPP0up7qHE+6ksN0ALNPK6hDQfnEC
         1sV/LtYwA/6V9r7/ZEqPfrGe5yyGQXOSKvcaxXB4v6K6z1xRdLMUuK2JPIv3XQ3tgxtX
         p3Ltf49Z5yLqWpbA8sgb666/3Gc2TXDl8ibXyTw+niQhw+3KVsqdSceIVC0Vi+7rN3c8
         cmNFc/doZli6PfAphk5aF7x2UCDJ1v0sdXqMpgHst/1sSiaUnbaNpir21qrErLs7O43a
         94+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681235254; x=1683827254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89D/U2/ABD8Hnu1Y3Qqw4jqD4G1xSecynmnwgvqJh1E=;
        b=D+Kug/RWbwvJ/XkWufEbRly7eH5prDZT/oO/GaR0pzBQy1zbH0q75GaZcdg6M8zSFS
         OZgfHVcKIrnx1bhYAo9W7FT5IYnzSNFZzEYBec1uUS8ndNlLc14L2X/wC2WoxTq3BRG+
         MlfYcXRanUoeN/ANTWj7hZQhUtQHQaXSmNhAmpFbLwWdHSVhxtJmST0hoGpPvtecvABe
         IJbwKsFnw9p65/sqbf/d9FqSJ+phPGMlqLh/MdfQLUNXRKgj6EHW608IFdPHhDGo/QFJ
         7E9mSmZu74NnKznqeMBGd6fH22bHBP6d9JL1JZfqVzo64Yk4GMGn1r2YWD3o50cBEYd3
         1/CA==
X-Gm-Message-State: AAQBX9ejJMVs+nsq7XSqtFwcyb+GP87xVkq51m+QglLAukywmDcY9AKO
	ZVVMBOIYWmiWwue4Az6E0k6nRPogCCDgZ0TC0qT8xg==
X-Google-Smtp-Source: AKy350ahP395VbSvIx11nYGRgeo6TcVvzT9+ov1e9nkBImUEMlhVDS3j04fcNMoH4CH/1w9Xg8+N3piLIX+Q3hmx3y4=
X-Received: by 2002:a50:baea:0:b0:4fc:fc86:5f76 with SMTP id
 x97-20020a50baea000000b004fcfc865f76mr5594114ede.6.1681235254106; Tue, 11 Apr
 2023 10:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org> <20230307182707.2298618-23-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-23-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 18:47:23 +0100
Message-ID: <CAFEAcA-uebHqs=53w62BiKQGhXZedA5ijAoOefd2pcOFPF_Rpw@mail.gmail.com>
Subject: Re: [PULL 22/27] hw/xen: Add emulated implementation of XenStore operations
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
	Joao Martins <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Mar 2023 at 18:27, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Now that we have an internal implementation of XenStore, we can populate
> the xenstore_backend_ops to allow PV backends to talk to it.
>
> Watches can't be processed with immediate callbacks because that would
> call back into XenBus code recursively. Defer them to a QEMUBH to be run
> as appropriate from the main loop. We use a QEMUBH per XS handle, and it
> walks all the watches (there shouldn't be many per handle) to fire any
> which have pending events. We *could* have done it differently but this
> allows us to use the same struct watch_event as we have for the guest
> side, and keeps things relatively simple.


> +static struct qemu_xs_handle *xs_be_open(void)
> +{
> +    XenXenstoreState *s = xen_xenstore_singleton;
> +    struct qemu_xs_handle *h;
> +
> +    if (!s && !s->impl) {

Coverity points out that this will dereference a NULL pointer
if you hand it one, and will happily let through a XenXenstoreState
where s->impl is NULL.
Should be "!s || !s->impl" I guess ?
CID 1508131.

> +        errno = -ENOSYS;
> +        return NULL;
> +    }
> +
> +    h = g_new0(struct qemu_xs_handle, 1);
> +    h->impl = s->impl;
> +
> +    h->watch_bh = aio_bh_new(qemu_get_aio_context(), be_watch_bh, h);
> +
> +    return h;
> +}

thanks
-- PMM

