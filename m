Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67C6ADD55
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 12:30:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507302.780632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVVf-0001qR-Jc; Tue, 07 Mar 2023 11:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507302.780632; Tue, 07 Mar 2023 11:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVVf-0001nS-G2; Tue, 07 Mar 2023 11:29:35 +0000
Received: by outflank-mailman (input) for mailman id 507302;
 Tue, 07 Mar 2023 11:29:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZVVe-0001nM-1m
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 11:29:34 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 544f52ee-bcdb-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 12:29:31 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id g3so11763595wri.6
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 03:29:31 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 c10-20020adffb0a000000b002ce72cff2ecsm2753413wrr.72.2023.03.07.03.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 03:29:30 -0800 (PST)
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
X-Inumbo-ID: 544f52ee-bcdb-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678188571;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH3Q1fiViFkedD/SohivkdCJBORP2dYkWAHXGgMGnQU=;
        b=bYEbe4alNTH1brr9NksFnpytF/v98dG4TityAnXFRd3UU9kGlZ8UU+bDJyB4rPUXeH
         FZk/u1LeYUF20rcQTfoylIOq3XwjiX7ONG2mu9d/i1BKKQqI7gbR5PdrmuJP8qRwBg1/
         J97r28ac6C8rV6Qunq4gSIlgLRrVGMIVrzPqGY8gmM+tghAAzeNmnE7xdr9oFvqw323n
         kBxN+ZDNU/18BspzG6coku5fsrSrNT5HohGKIV3/UxKAhVUlowyFtP5C6K9aV4l5h8mJ
         1HbW87lwLYrk6smoHY+sGHkyvUG4q5haVvY//U/kHukHN8s50WEWwX66ae8D8VINW8pr
         s31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678188571;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZH3Q1fiViFkedD/SohivkdCJBORP2dYkWAHXGgMGnQU=;
        b=kqusTuqkz4/PyUTzngl/dtJERGHBwWDfmxrA9m+iEQ5zYy0U3h75c96dAoM7IuGJC5
         lmfTbw9CIXyLFBawz8x2nN+IkFmylLnWxrZgnkmut+AYXuyoOtXZxkShjYwA+vr/QPYB
         CKCEktExqlTwqKVLMDMGcHic5bJFIwqxSiYl2l0tjvfi5n0dPnb1siaKbg6qm4eKcF77
         bmDj0+dggdH+Ax6ZZNyyGxb0YSLL4U+zvO9muNV/KGFCkThkW/thd9+kEx8pmgBuwhB3
         QRcMjQpXC9T7u3G2LzMynkhOh7lH2bbeRfjR7zodCbQ4I18RtU8nUfcd89cHVEp7Bt/2
         cqqg==
X-Gm-Message-State: AO0yUKU2f+z90O96Z6AIYnWydKEH+3dPWHf19+K1ZTKc8PaRD35GLBek
	JiGvn4BdpWK2Hq99H9bd5fE=
X-Google-Smtp-Source: AK7set8Lclo21+j8Gxl4MN8i0MzUImFNsiKxJ2ypaJRJ+vZG5Jq1AaAuRc/IUvQQUn8nANF098S2og==
X-Received: by 2002:adf:e8cd:0:b0:2cb:3660:44e with SMTP id k13-20020adfe8cd000000b002cb3660044emr9034590wrn.66.1678188571284;
        Tue, 07 Mar 2023 03:29:31 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b7ef693a-5586-fe65-9825-15655a7ec67b@xen.org>
Date: Tue, 7 Mar 2023 11:29:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 03/25] hw/xen: Implement XenStore watches
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-4-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Starts out fairly simple: a hash table of watches based on the path.
> 
> Except there can be multiple watches on the same path, so the watch ends
> up being a simple linked list, and the head of that list is in the hash
> table. Which makes removal a bit of a PITA but it's not so bad; we just
> special-case "I had to remove the head of the list and now I have to
> replace it in / remove it from the hash table". And if we don't remove
> the head, it's a simple linked-list operation.
> 
> We do need to fire watches on *deleted* nodes, so instead of just a simple
> xs_node_unref() on the topmost victim, we need to recurse down and fire
> watches on them all.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xenstore_impl.c | 253 +++++++++++++++++++++++++++++++++---
>   tests/unit/test-xs-node.c   |  85 ++++++++++++
>   2 files changed, 323 insertions(+), 15 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

... with one suggestion...

[snip]
> +    /* Check for duplicates */
> +    w = g_hash_table_lookup(s->watches, abspath);
> +    while (w) {
> +        if (!g_strcmp0(token, w->token) &&  opaque == w->cb_opaque &&
> +            fn == w->cb && dom_id == w->dom_id) {
> +            return EEXIST;
> +        }
> +        w = w->next;

I think you could stash a tail pointer here...

> +    }
> +
> +    if (dom_id && s->nr_domu_watches >= XS_MAX_WATCHES) {
> +        return E2BIG;
> +    }
> +
> +    w = g_new0(XsWatch, 1);
> +    w->token = g_strdup(token);
> +    w->cb = fn;
> +    w->cb_opaque = opaque;
> +    w->dom_id = dom_id;
> +    w->rel_prefix = strlen(abspath) - strlen(path);
> +
> +    l = g_hash_table_lookup(s->watches, abspath);

... to avoid the duplicate hash lookup here.

> +    if (l) {
> +        w->next = l->next;
> +        l->next = w;
> +    } else {
> +        g_hash_table_insert(s->watches, g_strdup(abspath), w);
> +    }
> +    if (dom_id) {
> +        s->nr_domu_watches++;
> +    }
> +
> +    /* A new watch should fire immediately */
> +    fn(opaque, path, token);
> +
> +    return 0;
> +}


