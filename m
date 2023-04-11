Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ADC6DE381
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 20:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519756.806693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmIPH-0004c2-1p; Tue, 11 Apr 2023 18:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519756.806693; Tue, 11 Apr 2023 18:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmIPG-0004aH-V3; Tue, 11 Apr 2023 18:07:50 +0000
Received: by outflank-mailman (input) for mailman id 519756;
 Tue, 11 Apr 2023 18:07:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqSW=AC=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pmIPF-0004aA-0d
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 18:07:49 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c372ae83-d893-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 20:07:47 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id sg7so33995401ejc.9
 for <xen-devel@lists.xenproject.org>; Tue, 11 Apr 2023 11:07:47 -0700 (PDT)
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
X-Inumbo-ID: c372ae83-d893-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681236466; x=1683828466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p+ZXlQzojGZSUw8Sbrj54moAbTxBe6kr2mEZxRk868M=;
        b=htQd6MnaVmc6ChTU9ga2AKBuKN/jMCHPNppmEK68X4N53Qb1vdWgV8+ScDciTYIfNf
         yTTv+p+l/7zd7JnjzLpoI0T9rpGVoM3rBovx9O9MYXZOOZAHEGAEofuZXYNMCMm4S2je
         HrVEnuiyo58GeRHtEWg1acuDtaAm6cAXPjFpqpLP5RG7wvqkVgDZy63tt4L/jkH3PrAd
         Sr0luoY0PXQkxG7c620MMgKqeEVWRqOW0XxeVlYVPHJ9+xt8lWSFR5GsDF9XgX9moyki
         BeRspCtNH3VYVNWx8BrwC9LwJQBkchSkeHcXsjk9cpa6LVSFcMgpqK+vqEBZEk7zBBSP
         tJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681236466; x=1683828466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+ZXlQzojGZSUw8Sbrj54moAbTxBe6kr2mEZxRk868M=;
        b=rxAfwC4h7aLRzzI/ANzKh2HJT5OM+2tRQK+HN+jFo+Lx5sRq2YQEKzHO1zoIOxgN66
         iDM4+1RdeDQ6Q20cK7vBJpeYgn0DQt3MdpTFhHfBNq7AV73Z6IVJh9YEtzSjxLVAZbHL
         hKc6VaFGkBUhKk64k4A2WWZPW5StDONIkbJSbPP+4/F4va3KoYCSXGg3ELF5YAFpg2Uk
         ewN4h0crTHFycOi6XlaQ5j/4NeNkisP1Dd2maj/fCQfM1qd76Sqmlm3bL6YzvUcsWDrg
         BduNI0Ppys5+DQNJf1gbYzOd1sHI4Yn6gWJkWeQHMEPHz9mr+tGfUqkU/fskDBHrx+aL
         nKUw==
X-Gm-Message-State: AAQBX9fezB8PnJNPFbw0R1MEohjWcrVbQY8geySekq1pnzXCxfgawa4g
	BkBCd8OnsVxa6VjmnAunwo2aCdWa00XPUtFI2PuHmA==
X-Google-Smtp-Source: AKy350aJKxcJXaacrbJSaqSrXddCMNffIuvTCBmwTQDw5caxmJIJZoc5CGUDO73D9H9Mawv/lNkDNQ71sykqnrtiSRU=
X-Received: by 2002:a17:906:2a48:b0:920:da8c:f7b0 with SMTP id
 k8-20020a1709062a4800b00920da8cf7b0mr5987227eje.6.1681236466538; Tue, 11 Apr
 2023 11:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org> <20230307182707.2298618-23-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-23-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 19:07:35 +0100
Message-ID: <CAFEAcA-vCihVupZsLBdh6+-xjdNX2-K1Ceo+tgsjA=KCdWTjpg@mail.gmail.com>
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
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>



> +static void xs_be_unwatch(struct qemu_xs_handle *h, struct qemu_xs_watch *w)
> +{
> +    xs_impl_unwatch(h->impl, DOMID_QEMU, w->path, NULL, xs_be_watch_cb, w);

Coverity points out that this is the only call to xs_impl_unwatch()
where we don't check the return value. Is there some useful way
we can report the error, or is it a "we're closing everything down
anyway, no way to report anything" situation? (This particular
Coverity heuristic is quite prone to false positives, so if that's
the way it is I'll just mark it as a f-p in the coverity UI.)


> +    h->watches = g_list_remove(h->watches, w);
> +    g_list_free_full(w->events, (GDestroyNotify)free_watch_event);
> +    g_free(w->path);
> +    g_free(w);
> +}

thanks
-- PMM

