Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C04C6E4124
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 09:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521792.810667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJPQ-0004lw-Mr; Mon, 17 Apr 2023 07:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521792.810667; Mon, 17 Apr 2023 07:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJPQ-0004jW-Jt; Mon, 17 Apr 2023 07:36:20 +0000
Received: by outflank-mailman (input) for mailman id 521792;
 Mon, 17 Apr 2023 07:36:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5U/i=AI=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1poJPP-0004jQ-Hu
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 07:36:19 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 899b8447-dcf2-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 09:36:16 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f16ecaade1so6653225e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 00:36:17 -0700 (PDT)
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
X-Inumbo-ID: 899b8447-dcf2-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681716977; x=1684308977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIKmirvKiuWLnbuh3Hx46nqicgE588SNTJroauuaDcs=;
        b=Pf4B+onBpHlN+bJvCPT6HFsKwZ66NJnTgGTf1SHfnonxTETGfIQStqK0xbKEoSwgX4
         0a83wD+QzHQ3zJOTCjYc9PAwTXsWzHUgXQdZgcIbTLLc3lWdE7RsOXCbosFdkGQ+rl94
         AiZnXU+xaUXQZgrWJuPFqGtzj2Fo/MfEN1f9yUNB9/B9E3rN+IKLM4xCkDiUwfYz9hya
         F0edpDpVkb+fbaCOZqnkJn8PpiQi6T9qhttrASO6eUjtm+sX98G3ffWKh+tGU/552WJe
         Qgqy6WA+/XVBXplSMBRmCUlZtp2sLUvJFBawDvGe4j15WHz0k7UrXVavFgA+G7kYSWIS
         fj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681716977; x=1684308977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIKmirvKiuWLnbuh3Hx46nqicgE588SNTJroauuaDcs=;
        b=OKnAQmMs9qwlxvtGAVBTF/bWAgCCOe2pr4rknp2E1/72GGcjsW7PBkRzpmG3K0yNQK
         ytIvLMeh3n7oSxFGdFijY7B2Uxr7pus0fDh/x3iwpH8PSR8jhsMwqGuty1qbVasGN9Oa
         cizhmgNO3bwrqHqMFHmdIIN25ZhQkzYwgSoHVW67rOB8pfpf5uQ5/SaPRVJ+yGjrBeNJ
         iIghoc4MEGhEyFzc8weRfTpuqkgObgB7pBh/gOqzX1WcPpuh/FJnNlIY7A1hTf7sHYiy
         5grmWL1s1zIVRByzVefB9TaxBsq3qnjvlx2HfcRYgG5ee/fbUzOuPpPWmHKbnbW322XE
         GHQA==
X-Gm-Message-State: AAQBX9ep0TXHh6dc8FXFxYg7Y/xwCviLJWo1EUcnxGNwxvZu1F0ISYG6
	oBqRV2EXkQHbtMrk+v+ZfYlFqllXRgShzgeHzcXISA==
X-Google-Smtp-Source: AKy350b7gZaM9cVXb2M/uURPE5aD6IvTV1i6BxWj5KFkbjF97PT3P1JHVyvjdBnKphfMPh7EMexAhaxaGZlrE4cRBTU=
X-Received: by 2002:a5d:525b:0:b0:2c8:14ba:4594 with SMTP id
 k27-20020a5d525b000000b002c814ba4594mr1062704wrc.3.1681716976901; Mon, 17 Apr
 2023 00:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-18-jens.wiklander@linaro.org> <176f5384-6e35-83bd-5f77-8b31412e8048@xen.org>
In-Reply-To: <176f5384-6e35-83bd-5f77-8b31412e8048@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 17 Apr 2023 09:36:06 +0200
Message-ID: <CAHUa44Gf1aC8D8TBYGk3r=D3Xvs+N-HRpWWmfWk7VgWFKQHKEA@mail.gmail.com>
Subject: Re: [XEN PATCH v8 17/22] xen/arm: ffa: support sharing memory
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
	Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Thu, Apr 13, 2023 at 10:53=E2=80=AFPM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Jens,
>
> On 13/04/2023 08:14, Jens Wiklander wrote:
> >   static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> >                                         uint8_t msg)
> >   {
> > @@ -781,6 +862,400 @@ out:
> >                resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 =
& mask);
> >   }
> >
> > +/*
> > + * Gets all page and assigns them to the supplied shared memory object=
. If
> > + * this function fails then the caller is still expected to call
> > + * put_shm_pages() as a cleanup.
> > + */
> > +static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
> > +                         const struct ffa_address_range *range,
> > +                         uint32_t range_count, unsigned int start_page=
_idx,
> > +                         unsigned int *last_page_idx)
> > +{
> > +    unsigned int pg_idx =3D start_page_idx;
> > +    gfn_t gfn;
> > +    unsigned int n;
> > +    unsigned int m;
> > +    p2m_type_t t;
> > +    uint64_t addr;
> > +
> > +    for ( n =3D 0; n < range_count; n++ )
> > +    {
> > +        for ( m =3D 0; m < range[n].page_count; m++ )
> > +        {
> > +            if ( pg_idx >=3D shm->page_count )
> > +                return FFA_RET_INVALID_PARAMETERS;
> > +
> > +            addr =3D read_atomic(&range[n].address);
>
> I am confused with the use of read_atomic() here. Is this part of the
> guest memory? If so, why don't page_count is also not read atomically?
>
> Also, it looks like you are using you will read the same address
> atomically. Shouldn't this be moved just before the loop?

You're right it is from guest memory and we should use read_atomoc()
only once. I'll fix it.

>
> > +            gfn =3D gaddr_to_gfn(addr + m * FFA_PAGE_SIZE);
> > +            shm->pages[pg_idx] =3D get_page_from_gfn(d, gfn_x(gfn), &t=
,
> > +                                                P2M_ALLOC);
> > +            if ( !shm->pages[pg_idx] )
> > +                return FFA_RET_DENIED;
> > +            /* Only normal RAM for now */
> > +            if ( !p2m_is_ram(t) )
> > +                return FFA_RET_DENIED;
> > +            pg_idx++;
> > +        }
> > +    }
> > +
> > +    *last_page_idx =3D pg_idx;
> > +
> > +    return FFA_RET_OK;
> > +}
> > +
> > +static void put_shm_pages(struct ffa_shm_mem *shm)
> > +{
> > +    unsigned int n;
> > +
> > +    for ( n =3D 0; n < shm->page_count && shm->pages[n]; n++ )
> > +    {
> > +        put_page(shm->pages[n]);
> > +        shm->pages[n] =3D NULL;
> > +    }
> > +}
> > +
> > +static struct ffa_shm_mem *alloc_ffa_shm_mem(struct ffa_ctx *ctx,
> > +                                             unsigned int page_count)
> > +{
> > +    struct ffa_shm_mem *shm;
> > +
> > +    if ( page_count >=3D FFA_MAX_SHM_PAGE_COUNT ||
> > +         ctx->shm_count >=3D FFA_MAX_SHM_COUNT )
> > +        return NULL;
> > +
> > +    shm =3D xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count)=
;
> > +    if ( shm )
> > +    {
> > +        ctx->shm_count++;
> > +        shm->page_count =3D page_count;
> > +    }
> > +
> > +    return shm;
> > +}
> > +
> > +static void free_ffa_shm_mem(struct ffa_ctx *ctx, struct ffa_shm_mem *=
shm)
> > +{
> > +    if ( shm ) {
>
> Coding style:
>
> if ( ... )
> {
>
> but I would prefer if we remove one level of indentation and use:
>
> if ( !shm )
>    return;

OK, I'll change it.

Thanks,
Jens

>
> > +        ASSERT(ctx->shm_count > 0);
> > +        ctx->shm_count--;
> > +        put_shm_pages(shm);
> > +        xfree(shm);
> > +    }
> > +}
>
> Cheers,
>
> --
> Julien Grall

