Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768D78BCEE7
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 15:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717655.1120079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yMN-00013W-Gu; Mon, 06 May 2024 13:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717655.1120079; Mon, 06 May 2024 13:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yMN-00011p-EE; Mon, 06 May 2024 13:26:27 +0000
Received: by outflank-mailman (input) for mailman id 717655;
 Mon, 06 May 2024 13:26:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3cb6=MJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s3yMM-00011h-59
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 13:26:26 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ca3daf9-0bac-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 15:26:25 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a59a9d66a51so405880066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 06:26:25 -0700 (PDT)
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
X-Inumbo-ID: 3ca3daf9-0bac-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715001985; x=1715606785; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXjEFMRzTzj3KldPoNPBs9HkkDMftiy61B6AF2CyXKk=;
        b=NMZC1GpRiuCI2vCfxAUFcjCQ0ai0CZCBEWEMHIL5Jyna42GvTYu6j+grOkcz8nex45
         WGrU/LFW5MbSUDvPGTpmLpPufZYp0JvlCRdyHjVRzRwZqkiPyfkQff3dagPedyXZZnNW
         ys5MolhMHWUoS4XU6TYUzmdc2CW9g5jVYFb8jV6Da0TGw4I7V28ZSBTrYNUNzCH4LW+I
         rKd8EdKrNvqEoC2vni71JLyvtUDoRzdEdvEBvh7LL74w3HHGlBl1i2+AMoI6WJRp2POJ
         8OpK+BUaQyh33SW51zHV8ZZcFdnxoEpFZUZh/9jodkNQwzAsvE/i7TqJU0KYx7biSS4u
         STvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715001985; x=1715606785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXjEFMRzTzj3KldPoNPBs9HkkDMftiy61B6AF2CyXKk=;
        b=t37E/aBt5EqsHr50KWPEMZ5uGcBJzPpklK3c2EOXkYBCya+D9NCHemQAmHtej0jOEy
         DoVIv4X1W8ETFzkyLSu8gGWGRFqrSFLyoQJRSOaaaPrLiV63Hewv7JsBb6R+2M4m2Ier
         foGJSj//GtdA8VNJmo84TUhNZH9BuAKucioREd4CXJF9L3QIPd2Szwd1DqKWRiOw9EjS
         bJUKVtdeECoQiectg5Nw8w4pqTd3hCNsN9/vJ+MtZl4+3PTpQbU66vTVoM2UeYGz6eE+
         5tCki/FZk+b7rEogTS6icQfbdR9GMOXaEV4r/RlRfiWoWuHju6aEXXdb+qqhwzC0nPal
         91BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlkDRQfdCwioVLT6FdY3b532qTrKnKQfT47f5ZVpE3qwkXu8mfBBJNNSmocGkdTVxxNfazG2upMd3YLOFP1rknG1paBFb5Ea6ezxJ0iyU=
X-Gm-Message-State: AOJu0YylnkMZQlvgGq4Rj4NIiGKNzjouFLc/VdM+WDTZDdl3STR1gCYT
	rqsfHf1PMG5l586ZDOn4ESjBMNGqdNKZ8ARRCB3EGgmzwwkeyHc2eZneIDgXzObFr+fXgeXkr5G
	6OVjg7dNMUrN1DxAknQoUTxDcymc=
X-Google-Smtp-Source: AGHT+IFjRGcd4vevXd4YmEJIpnLbj+EtQPldgB+Qq/+tP0OUO7ic/p9jXzqaReEl+6jNOvGvJR1QQdDnYUkvaMPNk/A=
X-Received: by 2002:a50:d495:0:b0:56d:c928:ad76 with SMTP id
 s21-20020a50d495000000b0056dc928ad76mr6259743edi.26.1715001984479; Mon, 06
 May 2024 06:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-15-edgar.iglesias@gmail.com> <0263b7e8-5800-4f5a-9dc5-bc2b4fbbbbfe@redhat.com>
 <d4008042-6f68-42f6-8ade-fbb0ba115a33@linaro.org>
In-Reply-To: <d4008042-6f68-42f6-8ade-fbb0ba115a33@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 6 May 2024 15:26:12 +0200
Message-ID: <CAJy5ezoVOR-OB7HVEAAkmwdC7jerCVatNS=VdP1jTMZpgUm_fg@mail.gmail.com>
Subject: Re: [PATCH v4 14/17] xen: Add xen_mr_is_memory()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org, sstabellini@kernel.org, 
	jgross@suse.com, "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 11:59=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 2/5/24 09:26, David Hildenbrand wrote:
> > On 30.04.24 18:49, Edgar E. Iglesias wrote:
> >> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >>
> >> Add xen_mr_is_memory() to abstract away tests for the
> >> xen_memory MR.
> >>
> >> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> >> ---
> >
> > [...]
> >
> >>   #endif
> >> diff --git a/system/physmem.c b/system/physmem.c
> >> index ad7a8c7d95..1a5ffcba2a 100644
> >> --- a/system/physmem.c
> >> +++ b/system/physmem.c
> >> @@ -2227,7 +2227,7 @@ static void *qemu_ram_ptr_length(RAMBlock
> >> *block, ram_addr_t addr,
> >>            * because we don't want to map the entire memory in QEMU.
> >>            * In that case just map the requested area.
> >>            */
> >> -        if (block->offset =3D=3D 0) {
> >> +        if (xen_mr_is_memory(block->mr)) {
> >>               return xen_map_cache(block->mr, addr, len, lock, lock,
> >>                                    is_write);
> >>           }
> >
> > I'd have moved that into a separate patch, because this is not a simple
> > abstraction here.
>
> Yes please, maybe using Stefano review comment in the description.
>

Thanks, for v5 I've split out this particular change into a separate patch:

    softmmu: Replace check for RAMBlock offset 0 with xen_mr_is_memory

    For xen, when checking for the first RAM (xen_memory), use
    xen_mr_is_memory() rather than checking for a RAMBlock with
    offset 0.

    All Xen machines create xen_memory first so this has no
    functional change for existing machines.

    Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

diff --git a/system/physmem.c b/system/physmem.c
index ad7a8c7d95..1a5ffcba2a 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -2227,7 +2227,7 @@ static void *qemu_ram_ptr_length(RAMBlock
*block, ram_addr_t addr,
          * because we don't want to map the entire memory in QEMU.
          * In that case just map the requested area.
          */
-        if (block->offset =3D=3D 0) {
+        if (xen_mr_is_memory(block->mr)) {
             return xen_map_cache(block->mr, addr, len, lock, lock,
                                  is_write);
         }



> >
> > Acked-by: David Hildenbrand <david@redhat.com>
> >
>

