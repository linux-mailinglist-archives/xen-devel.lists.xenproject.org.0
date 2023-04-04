Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387616D6ABD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 19:36:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518093.804273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjkZd-00043V-Sz; Tue, 04 Apr 2023 17:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518093.804273; Tue, 04 Apr 2023 17:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjkZd-000411-Nm; Tue, 04 Apr 2023 17:36:01 +0000
Received: by outflank-mailman (input) for mailman id 518093;
 Tue, 04 Apr 2023 17:35:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jyst=73=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pjkZb-00040c-Ia
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 17:35:59 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2391ff87-d30f-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 19:35:49 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id eg48so133624781edb.13
 for <xen-devel@lists.xenproject.org>; Tue, 04 Apr 2023 10:35:49 -0700 (PDT)
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
X-Inumbo-ID: 2391ff87-d30f-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680629749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B++ILPDB3X+VuBU8jlV4qBmXikQNjKUxckqbnWCshEs=;
        b=nEMEpYDPKqf3YLC0FS2dnk3CaMTs5JeR/WJE92Vclc3fGNqm3Q4jcJ1saTecAW50kK
         SkZAAQedIQyx1QshTDj2dqfqdrj3L3TA98J03DxnWXM6lx5vIF1Y2qtzGFQYUnwou0NI
         0RdoLDwN3COEIJxX6HOFtQ68IcXGl00Q/Cro7ywaKLa/H7gl07KR0KPsmFRtsgxmVdPQ
         T++ulO6Hu1d7QX+FbmmPNluD3/GfPKnxXHpahwlm/bJjy3Lw/5Ek1C2Q4ArXC/Xs0TwO
         5CJyUvZoK5f8yImPnWACOMke+eMrjrzi/9c6YdRo3viKtljNnygfDHcE96qEVB9WWz+H
         RAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680629749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B++ILPDB3X+VuBU8jlV4qBmXikQNjKUxckqbnWCshEs=;
        b=AFT/M0Nw/UsOxWECXxMxd8uhjZ9DnVBrOD/nFh0igUX567IGw7new+d4TQsufbavEa
         pmVXIht3Bi4kGL/VWu01A4rRO/qlWQxbc54FaGVeqvhxZPTiOK0E6F3mIULWJkw9cTic
         O7LfzWxckbwJ1LbdWmlIeJMiWwNdFhYXSkQYk/9UztBdGc89mCmW6BN7BaAOwYKgBYD3
         QWz7ABzKStfTGy7eQaTaaPsyag4FFqQLWSQavvkcLJcwZvPvW6Ute0hEDxzXiL/0Uvsq
         dAedwIWEspZ7vp0Za1ygv9cEWTC68TvnVqtTeadCwbQXGwLJyqYCs470F0Bx5+4jxk6p
         5hYQ==
X-Gm-Message-State: AAQBX9etrsUW5ctkTP92hVHnAffy1Z5i9upsdayUpNcaNWR/mJkzsYWj
	wcVHgU2kwf4pt62HBNGRvQJR4/pnaE94lLdqaKFDvA==
X-Google-Smtp-Source: AKy350bFZ5U/HvpJohqoyPJEv2MbHDufBnPeztQmU14vuRQWrqhanpo8MykXvxhbF2/kYUPL7BROh16KxkmoJmjzqmw=
X-Received: by 2002:a17:906:9bde:b0:924:efbb:8a8b with SMTP id
 de30-20020a1709069bde00b00924efbb8a8bmr173409ejc.6.1680629748942; Tue, 04 Apr
 2023 10:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org> <20230307182707.2298618-14-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-14-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 18:35:38 +0100
Message-ID: <CAFEAcA_SS8xRjGKZoSyGc0nh_-C2Wh8hauGzR82Aj8S1g8xBOQ@mail.gmail.com>
Subject: Re: [PULL 13/27] hw/xen: Add xenstore operations to allow redirection
 to internal emulation
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
	Joao Martins <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Mar 2023 at 18:27, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: Paul Durrant <pdurrant@amazon.com>
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---

Hi; Coverity points out a memory leak in this code (CID 1508098):

> +static struct qemu_xs_handle *libxenstore_open(void)
> +{
> +    struct xs_handle *xsh = xs_open(0);
> +    struct qemu_xs_handle *h = g_new0(struct qemu_xs_handle, 1);

Here we allocate memory...

> +
> +    if (!xsh) {
> +        return NULL;

...but here we can return without freeing it...

> +    }
> +
> +    h = g_new0(struct qemu_xs_handle, 1);

...and here we allocate a second time and overwrite the
pointer to the first allocation.

Deleting the first call to g_new0() would fix both of these.

> +    h->xsh = xsh;
> +
> +    notifier_list_init(&h->notifiers);
> +    qemu_set_fd_handler(xs_fileno(h->xsh), watch_event, NULL, h);
> +
> +    return h;
> +}

thanks
-- PMM

