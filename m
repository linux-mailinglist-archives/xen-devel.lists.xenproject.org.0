Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C1F8B9551
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 09:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715615.1117382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Quj-0007cu-Qx; Thu, 02 May 2024 07:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715615.1117382; Thu, 02 May 2024 07:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Quj-0007bM-No; Thu, 02 May 2024 07:31:33 +0000
Received: by outflank-mailman (input) for mailman id 715615;
 Thu, 02 May 2024 07:31:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2Qui-0007bG-CO
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 07:31:32 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe395625-0855-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 09:31:30 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5727dc6d3edso4852590a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 00:31:30 -0700 (PDT)
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
X-Inumbo-ID: fe395625-0855-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714635090; x=1715239890; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6K+vQgBEJa5RBagBtZnrylNM7yhfiFaLALvIlNSgfg=;
        b=Mn7lzZ9nslwo3JyfW91cLREteIKC6kOkSfwBAXnIkyWazs7id3dRizsfuJCuwOHf0t
         tPyEnnyKx53PwnPVynjpijYiZ3UHE4hS5+hq+VKcHE3bakLaJ2+KeunoEdNBBm51OW2W
         XrV5dWLt36KRVgGXp3G1wbcCV7TlLY3Y88JJns8fiW5vizICmKXzvhG7YxgQ1NkDgah/
         uwVsJhxyzQ6hFrUtE/25LuJBEKbHXcz6Y5zxQnwTbCbZMBmzjMOTEaylBfvdLmKAdWNq
         UktakWJ/S4KOrFXtas+HtThDUqDI4px6MwPX61JhYzHJdwOpcK8iR8/c40Ty9rEdZSHQ
         ixZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714635090; x=1715239890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6K+vQgBEJa5RBagBtZnrylNM7yhfiFaLALvIlNSgfg=;
        b=BHHWWPgit8IZqKGegdiTwM/1ivtnKVBxntEha2LDz1aBxqHPOflEJX6QSjjKom4t72
         80irLIo1m/F00+pIraj5O1I1LygE8sEUpzP+tHHHzU3FPPxOenfwKjktOSBqCbOCZbM1
         sUW1r89jWDWrcc+EPvKYFg/AJ2ZmeVamWlRC7o8QU8L8BbZI0orkLdTSZAlwjiPK3/sA
         nU6/OO04SEARJ8E4bFY+Hx8UtoAMf1/P2eAqciQe7klbYC5swoVwAODdvAslzCi8rQ30
         hmO22bHp7s4dVStnHEnGsGUmZBHd2xhbYeb0LTZcK2ZCLngiXKfiCncuZ6f2aYP7jrCH
         sHQA==
X-Forwarded-Encrypted: i=1; AJvYcCXCeFuRRrHy0h8r1OgjQOSvc7yWeyX3vpmXMPEdxOlGqO1hlTJwNG3hwHfoLGA8HjtWUG6hoyOF4ma8ycOERPjUE4gRzYHh4TGT/jV3GQg=
X-Gm-Message-State: AOJu0YzYY3afPEiRNqKpzhh9zgeivCm7vxzNaYVt51GfLftqk7KLeZq0
	9hAsRLeT4oTg/rPkaoL0huq75ujeylyFDNDIIrE96iqYwpIp3NLxy3I6k/RH4TAM7QyeDWm6vI5
	4AROzM0KYoxzkJwmSgcimUqjS0aE=
X-Google-Smtp-Source: AGHT+IGMHAiiyj/igyCydtEDbXlM1aLJwGa5/OER2+/iX842FcrCPNtsDsqsmkDTMJpWU8WX/JeJCxlIf+/12u8L+4k=
X-Received: by 2002:a50:aade:0:b0:571:c0e6:233c with SMTP id
 r30-20020a50aade000000b00571c0e6233cmr3365370edc.37.1714635089557; Thu, 02
 May 2024 00:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-14-edgar.iglesias@gmail.com> <7172c93c-8c25-4934-b1d8-de0658c6f50f@redhat.com>
In-Reply-To: <7172c93c-8c25-4934-b1d8-de0658c6f50f@redhat.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 2 May 2024 09:31:17 +0200
Message-ID: <CAJy5ezrP0OQU7ZOfZUDg2QgVZ+zcicrACk=UoL68BWEhOaQWsQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/17] softmmu: Pass RAM MemoryRegion and is_write xen_map_cache()
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 9:24=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 30.04.24 18:49, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > Propagate MR and is_write to xen_map_cache().
>
> I'm pretty sure the patch subject is missing a "to" :)

Thanks David! I'll fix it in v5!

Cheers,
Edgar


>
> > This is in preparation for adding support for grant mappings.
> >
> > No functional change.
> >
>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> --
> Cheers,
>
> David / dhildenb
>

