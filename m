Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841A79CDBA4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 10:33:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836990.1252904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBshV-0001uw-FX; Fri, 15 Nov 2024 09:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836990.1252904; Fri, 15 Nov 2024 09:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBshV-0001sY-D0; Fri, 15 Nov 2024 09:33:13 +0000
Received: by outflank-mailman (input) for mailman id 836990;
 Fri, 15 Nov 2024 09:33:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNXE=SK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBshU-0001sS-J7
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 09:33:12 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f874db2-a334-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 10:33:08 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c94a7239cfso969824a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 01:33:08 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79c1dc72sm1407793a12.79.2024.11.15.01.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 01:33:06 -0800 (PST)
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
X-Inumbo-ID: 9f874db2-a334-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlmODc0ZGIyLWEzMzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjYzMTg4LjM1NTQzMywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731663188; x=1732267988; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ru+iVweZYSPDM200YyNYpdPjJ8QOJBEp3f8LklPQEpg=;
        b=nkz6PORWOG1XLfDuc6kXmOCKRKzz8/TOrI/tRuECw58Nn6YAmHvNZ//zj6l/KniEn8
         pyDbe9/sTHin5oH1jsHDx10ZToBXUSdXOF5cbtTBU3pYNhEhIhGYMltr0yAedQZYvwGn
         gi38P9K1JKe2ShYvkzQzEz33CDfm9tNVhbARY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731663188; x=1732267988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ru+iVweZYSPDM200YyNYpdPjJ8QOJBEp3f8LklPQEpg=;
        b=M0kr+eiYJx7bIBAQHozzc3H4QPm0MOqNENkGZo1mzcGLhPjJPXeA0C8HflKe8lIA3Z
         2iswhDf3W+7FS5rW4LbwqNy62VdrTWHFLJPlCkm/oo4E2rHjgD8zaIbyi9im+RHQ1qV8
         3eN0u4zRKjY21ego91vDfvETZMaXxejqenRpiJoAKUfBB/8rwz/93b99ZV0wWC8Qo9Ur
         TjUQlaE71ODhCrYlXFpVVYuhWHjUfvTT/D7HrHPXbSDviYdznKJ17zYcg40W419QG41X
         AuKIi4sEtAkBGkzVlW3vUZdpcUEgPF9+w0YshL6byJb8A6v+zRoRJpKMIcpNZa6wqBS7
         kjxw==
X-Forwarded-Encrypted: i=1; AJvYcCWB/XxR5X60KskuPvLAvBAVq4JB5QuGodC49lE7ibcYqSnyul7HqWLrzaQNPEo3RIWDgPhLqO1dIEM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3opRIDk8Vpq4Q8s/b7LhYSiCQX3G49qsQS6Jjurk373PKjVs5
	qi4S0QEVc0C4dNaN+pv02NW+ECn6x9zExYewRjCjpuKDiVv3auLsZWY34XWLhe/s1lcjYJojxkN
	l
X-Google-Smtp-Source: AGHT+IFyBPBsLUNwYqutk4vHPTp9B646LzgaXazd5i6S1ONojDFS9q0HX6TuFxPUGkbg+T0yQZ3yBg==
X-Received: by 2002:a05:6402:5210:b0:5ce:fa6f:eeb6 with SMTP id 4fb4d7f45d1cf-5cf8fc6399amr1879830a12.5.1731663187630;
        Fri, 15 Nov 2024 01:33:07 -0800 (PST)
Date: Fri, 15 Nov 2024 10:33:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/4] x86/mm: skip super-page alignment checks for
 non-present entries
Message-ID: <ZzcVUQWVws1UAf1f@macbook>
References: <20241114145715.59777-1-roger.pau@citrix.com>
 <20241114145715.59777-3-roger.pau@citrix.com>
 <32d9b9ac-f70f-42d7-8d6f-0d95b7838ed8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <32d9b9ac-f70f-42d7-8d6f-0d95b7838ed8@suse.com>

On Fri, Nov 15, 2024 at 10:09:39AM +0100, Jan Beulich wrote:
> On 14.11.2024 15:57, Roger Pau Monne wrote:
> > @@ -5517,7 +5524,8 @@ int map_pages_to_xen(
> >          L3T_LOCK(current_l3page);
> >          ol3e = *pl3e;
> >  
> > -        if ( cpu_has_page1gb && IS_L3E_ALIGNED(virt, mfn) &&
> > +        if ( cpu_has_page1gb &&
> > +             (!(flags & _PAGE_PRESENT) || IS_L3E_ALIGNED(virt, mfn)) &&
> >               nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
> >               !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
> >          {
> > @@ -5636,7 +5644,7 @@ int map_pages_to_xen(
> >          if ( !pl2e )
> >              goto out;
> >  
> > -        if ( IS_L2E_ALIGNED(virt, mfn) &&
> > +        if ( (!(flags & _PAGE_PRESENT) || IS_L2E_ALIGNED(virt, mfn)) &&
> >               (nr_mfns >= (1u << PAGETABLE_ORDER)) &&
> >               !(flags & (_PAGE_PAT|MAP_SMALL_PAGES)) )
> >          {
> 
> Upon inspecting Andrew's report of crashes I noticed that this can't be quite
> right. We can't entirely skip the alignment check when non-present mappings
> are requested; we merely need to limit the check to the VA. In a reply to
> the 1st v2 I actually had it arranged to match that requirement:
> 
>         if ( (cpu_has_page1gb || !(flags & _PAGE_PRESENT)) &&
>              IS_L3E_ALIGNED(virt, flags & _PAGE_PRESENT ? mfn : _mfn(0)) &&
>              nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
>              !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
> 
> Yet then I didn't pay attention to the difference when reviewing the 2nd v2
> (that versioning issue of course isn't helping here either).
> 
> I'm afraid I can't (yet) connect the observed bad behavior with this issue,
> though.

I think this might be caused by map_pages_to_xen() now freeing vmap
regions still under use, and that seems to manifest with the
memnodemap array being unintentionally unmapped (because it's
allocated with vmap_contig()).  See the usage of mfn_to_nid() in
free_heap_pages().

Will prepare a patch, sorry.

Thanks, Roger.

