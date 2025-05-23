Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A3AC1D47
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 08:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995182.1377701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMFh-0001g0-E8; Fri, 23 May 2025 06:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995182.1377701; Fri, 23 May 2025 06:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMFh-0001eZ-B1; Fri, 23 May 2025 06:51:33 +0000
Received: by outflank-mailman (input) for mailman id 995182;
 Fri, 23 May 2025 06:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JqHe=YH=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1uIMFf-0001eT-Fw
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 06:51:31 +0000
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [2607:f8b0:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5853271c-37a2-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 08:51:26 +0200 (CEST)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3da8e1259dfso64382315ab.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 23:51:26 -0700 (PDT)
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
X-Inumbo-ID: 5853271c-37a2-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747983085; x=1748587885; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jv2FlgL6Ms54XQlvM5VUyvHV4/YVXgzvos+Dpzbmm2M=;
        b=Z9g2yZJnLwgeUM6LI3QrVozgn6yxQiAthgwEg7xUgCZhn9ulsU2/Mi/zshohSKugx7
         yxs2emzcR4W/wZazBdpbI4jBG97fcTDGAbhUspmDh1PCbiiz/XpLtiFVv0QtfSM1yLHa
         uOktBnmMmu3FLwe8CEdIQg2q9kjbZjCfkA3U/ciXLoLVXrCwLWjgFc2/hZE/OgS8ZgUm
         zh10wy6j/ap7qQZ9QLXGV/eUr0t7GJi44l2GGqVjEnMK5Y9sJi59wugoQwR+kZCzXSBI
         g6+XJq9oHr+U5/XcqJOA4xK7/lcosbnu24/JNznO874j8wa5vQVISEmoe8wTKcDNFfEF
         zA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747983085; x=1748587885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jv2FlgL6Ms54XQlvM5VUyvHV4/YVXgzvos+Dpzbmm2M=;
        b=J3lHsNU4pGTMptGUtqXrS44Ck41rmghWUEXm7MzxUxQOEcy+ZgLiR6zTpcdLQ2SREu
         qzPJa9BjVz2F3PJkt3YICx3YxO/IZ0YEbfec12UyD8nL7dr6yvcLY02JdFs9jYKMRimo
         IO1l8Hgokl4eX1eIXoejHcy9f4kO115jr51CfLUyK8F5Il5R+tgYvD61SeFXcPZ51k6P
         /NCYrt2ks0qkuIxh/FBwvHtD8lxzOq41T1JbrCzuQ6np99RWf3w8VrvfGAPEkdTtk3a8
         8eZwyos63CCnr9IKhx0mArFKTq9AgdxN4HMwzuKIOIGzhZ7gE1HOnerxrsfMrhlR1SiA
         mnWw==
X-Gm-Message-State: AOJu0YzNb62Li3erW1aF/0iBq15Pwe/y5pvGrt/E3mkHZPvVOyWWrnEg
	dW0NUk4MR5WwxuO9u/01HSF8bqdizwhdR7wYFkOCeIYv13GLwYyZOEDqECf6iSy1or30oljnA+r
	JrXCyln/6UGvGnny5jxV7N7cyvc8RaeW55DBFdqaU5toyGOVl0qykjxk=
X-Gm-Gg: ASbGncuyUjYX+TgaoICR+BHnErP+GL2YUor7w6eAoFVr/YXuAKPn6RNfxBN5NHMiNGY
	ZieePmSBci6/Xj9uOBnttAyXxhECrjIKirm0J4y7A3Pc0YsuYDXM8ODXjCu3qmj5XmWgM6S12fG
	H1PiqGHJ0/DKlr7cBCnq+W6wf79Xrk1kSJhQ==
X-Google-Smtp-Source: AGHT+IFukozhMqaUDxabO/uMuohfJ7UiENQV4cPF2rk2OAC2W+PdWDZlHwhTnWWf36xAWFEjlMQGX5qa3l2/KvWu1Jo=
X-Received: by 2002:a4a:ec49:0:b0:607:dd61:9c33 with SMTP id
 006d021491bc7-609f48646b0mr15960985eaf.1.1747983073932; Thu, 22 May 2025
 23:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1747925287.git.bertrand.marquis@arm.com> <3405d6a545c5ad8fadf7b252c98ce4120fe63fd2.1747925287.git.bertrand.marquis@arm.com>
In-Reply-To: <3405d6a545c5ad8fadf7b252c98ce4120fe63fd2.1747925287.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 23 May 2025 08:51:01 +0200
X-Gm-Features: AX0GCFuYk_q4tgQfcUyO6KQYcR52qBieNTLlOxr2SRafveq64FXPsFmTAKoxi58
Message-ID: <CAHUa44EAEgRe=3v1sYyNLxSuzL92uY75TQLOPgMdSBCLZ0PPHA@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] xen/arm: ffa: Introduce VM to VM support
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, May 22, 2025 at 5:08=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
> between VMs.
> When activated list VMs in the system with FF-A support in part_info_get.
>
> When VM to VM is activated, Xen will be tainted as Insecure and a
> message is displayed to the user during the boot as there is no
> filtering of VMs in FF-A so any VM can communicate or see any other VM
> in the system.
>
> WARNING: There is no filtering for now and all VMs are listed !!
>
> This patch is reorganizing the ffa_ctx structure to make clear which
> lock is protecting what parts.
>
> This patch is introducing a chain list of the ffa_ctx with a FFA Version
> negociated allowing to create the partinfo results for VMs without

negotiated

> taking a lock on the global domain list in Xen.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

[...]
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 0a9c1082db28..08dbdf9fcddd 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -195,6 +195,18 @@
>   */
>  #define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
>
> +/*
> + * Partition properties we give for a normal world VM:
> + * - can send direct message but not receive them
> + * - can handle indirect messages
> + * - can receive notifications
> + * 32/64 bit flag is set depending on the VM
> + */
> +#define FFA_PART_VM_PROP    (FFA_PART_PROP_DIRECT_REQ_SEND | \
> +                             FFA_PART_PROP_INDIRECT_MSGS | \
> +                             FFA_PART_PROP_RECV_NOTIF | \
> +                             FFA_PART_PROP_IS_PE_ID)
> +
>  /* Flags used in calls to FFA_NOTIFICATION_GET interface  */
>  #define FFA_NOTIF_FLAG_BITMAP_SP        BIT(0, U)
>  #define FFA_NOTIF_FLAG_BITMAP_VM        BIT(1, U)
> @@ -297,36 +309,70 @@ struct ffa_ctx_notif {
>  };
>
>  struct ffa_ctx {
> -    void *rx;
> -    const void *tx;
> -    struct page_info *rx_pg;
> -    struct page_info *tx_pg;
> +    /*
> +     * Chain list of all FF-A contexts, to prevent locking access to thi=
s list,
> +     * all "unlocked" data from the structure must be set before adding =
an
> +     * entry in the list and an entry must be removed from the list befo=
re
> +     * freeing a context.
> +     */
> +    struct list_head ctx_list; /* chain list of all FF-A contexts */
> +
> +    /*
> +     * Data access unlocked (mainly for part_info_get in VM to VM).
> +     * Those should be set before the ctx is added in the list.
> +     */
> +    /* FF-A Endpoint ID */
> +    uint16_t ffa_id;
> +    uint16_t num_vcpus;
> +    bool is_64bit;
> +
> +    /*
> +     * Global data accessed atomically or using ACCES_ONCE.
> +     */
> +    struct ffa_ctx_notif notif;
> +
> +    /*
> +     * Global data accessed with lock locked.
> +     */
> +    spinlock_t lock;
> +    /*
> +     * FF-A version negociated by the guest, only modifications to

negotiated

With the two spell errors fixed.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

