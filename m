Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7156E6AE09E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 14:33:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507385.780802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXQy-000825-7e; Tue, 07 Mar 2023 13:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507385.780802; Tue, 07 Mar 2023 13:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXQy-0007zm-4y; Tue, 07 Mar 2023 13:32:52 +0000
Received: by outflank-mailman (input) for mailman id 507385;
 Tue, 07 Mar 2023 13:32:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZXQx-0007Qm-DU
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 13:32:51 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e7c7181-bcec-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 14:32:50 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id p16so7754574wmq.5
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 05:32:50 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 r39-20020a05600c322700b003eafc47eb09sm12525574wmp.43.2023.03.07.05.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:32:49 -0800 (PST)
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
X-Inumbo-ID: 8e7c7181-bcec-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678195970;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kDsyvzDA2+Psrh9BpIfxaF+LujFd3oi/i0xLE80Ui3c=;
        b=nCMky25iTURI9/TaPxOOya0n8CwUqv0yj6qGrMSx6lMjSlnDlwRUrYXtgHwfnq/gse
         eYkVl7NqBmisW5VRBiDY1Bpbl/egKRSoddKECq0nRvtyoIQLxpc908BsZSmVol5R/tko
         IKzXdCM9aWfBr6LiXszRINHazD/jb7WCg4nXrwnXVnDAZaNN1E+RlHjGZcPUkdJQenKv
         Cp6q3UeOcNftTLHaWxdwlERwLrW3bCksyEZP0vYM2281kbPQ4yTDnfP5oX11YZUTE9qk
         9UTZpQGrweRo4nkdV2gkhAhQle/bkw2oykklgJA24exZiN1tr/OjGaFxatGT3dxNplEP
         zCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195970;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDsyvzDA2+Psrh9BpIfxaF+LujFd3oi/i0xLE80Ui3c=;
        b=JTdnp2rLnFezFk/5U5JysFwfJk/Dp/Rhgnd+9FRO9akvysfBpKDXK5LJFs9JuIu3+v
         Mn80CfyADFr4mlIFj7Yn2vGhoAcJAoEqKsScWTISotUKPE6J93vUBZb5tyZfOgaMCbWk
         5N95KIX8cGM6oKy/k4IKxD/UmAzDDCNEUhBr2RfggVSTpVFVH3WUxrdrXRqkYvdsnDy3
         6s3rAJqUK+GrWuSCEwXTb22UAs9RbSOJc/RIO0ogH56F7dr6lJ0pGUsnssKe4vNOtX2L
         59NJvC7BDwL08dY+u+ZjwzDUK9sRkGRNq2695bZNgPIfNG4x1gSEhUomt0HCt4BFRWkc
         epsg==
X-Gm-Message-State: AO0yUKVGEI0hRsuexBHOMTF/HvqxdbOaNoOBrTkybHfQ6lER5OMJFv4m
	MhXGFSh9h38Q46Ap1UCVItc=
X-Google-Smtp-Source: AK7set8Z0OvvHtBbdRob0NHfPmqKbu8pXQDMIHHkSrhsvZr6Y+/aoR8LjxYbUVWyGzMM5Yz9b0WSvg==
X-Received: by 2002:a05:600c:1e14:b0:3ea:edd7:1f1f with SMTP id ay20-20020a05600c1e1400b003eaedd71f1fmr12651873wmb.40.1678195970271;
        Tue, 07 Mar 2023 05:32:50 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f133ca78-8b1e-149c-d907-7a843c8f322d@xen.org>
Date: Tue, 7 Mar 2023 13:32:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 05/25] hw/xen: Watches on XenStore transactions
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-6-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Firing watches on the nodes that still exist is relatively easy; just
> walk the tree and look at the nodes with refcount of one.
> 
> Firing watches on *deleted* nodes is more fun. We add 'modified_in_tx'
> and 'deleted_in_tx' flags to each node. Nodes with those flags cannot
> be shared, as they will always be unique to the transaction in which
> they were created.
>
> When xs_node_walk would need to *create* a node as scaffolding and it
> encounters a deleted_in_tx node, it can resurrect it simply by clearing
> its deleted_in_tx flag. If that node originally had any *data*, they're
> gone, and the modified_in_tx flag will have been set when it was first
> deleted.
> 
> We then attempt to send appropriate watches when the transaction is
> committed, properly delete the deleted_in_tx nodes, and remove the
> modified_in_tx flag from the others.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xenstore_impl.c | 151 ++++++++++++++++++++++-
>   tests/unit/test-xs-node.c   | 231 +++++++++++++++++++++++++++++++++++-
>   2 files changed, 380 insertions(+), 2 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

... with a couple of nits in comments called out below...

[snip]
> +static gboolean tx_commit_walk(gpointer key, gpointer value,
> +                               gpointer user_data)
> +{
> +    struct walk_op *op = user_data;
> +    int path_len = strlen(op->path);
> +    int key_len = strlen(key);
> +    bool fire_parents = true;
> +    XsWatch *watch;
> +    XsNode *n = value;
> +
> +    if (n->ref != 1) {
> +        return false;
> +    }
> +
> +    if (n->deleted_in_tx) {
> +        /*
> +         * We first watches on our parents if we are the *first* node

We first *fire* watches on our parents...

> +         * to be deleted (the topmost one). This matches the behaviour
> +         * when deleting in the live tree.
> +         */
> +        fire_parents = !op->deleted_in_tx;
> +
> +        /* Only used on the way down so no need to clear it later */
> +        op->deleted_in_tx = true;
> +    }
> +
> +    assert(key_len + path_len + 2 <= sizeof(op->path));
> +    op->path[path_len] = '/';
> +    memcpy(op->path + path_len + 1, key, key_len + 1);
> +
> +    watch = g_hash_table_lookup(op->s->watches, op->path);
> +    if (watch) {
> +        op->watches = g_list_append(op->watches, watch);
> +    }
> +
> +    if (n->children) {
> +        g_hash_table_foreach_remove(n->children, tx_commit_walk, op);
> +    }
> +
> +    if (watch) {
> +        op->watches = g_list_remove(op->watches, watch);
> +    }
> +
> +    /*
> +     * Don't fire watches if this node was only copied because a
> +     * descendent was changed. The modifieD_in_tx flag indicates the

s/modifieD/modified

> +     * ones which were really changed.
> +     */
> +    if (n->modified_in_tx || n->deleted_in_tx) {
> +        fire_watches(op, fire_parents);
> +        n->modified_in_tx = false;
> +    }
> +    op->path[path_len] = '\0';
> +
> +    /* Deleted nodes really do get expunged when we commit */
> +    return n->deleted_in_tx;
> +}


