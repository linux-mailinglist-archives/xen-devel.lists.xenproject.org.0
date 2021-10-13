Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF5C42B8A5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 09:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207971.363972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maYRt-0003O2-1x; Wed, 13 Oct 2021 07:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207971.363972; Wed, 13 Oct 2021 07:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maYRs-0003M8-Uc; Wed, 13 Oct 2021 07:13:12 +0000
Received: by outflank-mailman (input) for mailman id 207971;
 Wed, 13 Oct 2021 07:13:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmSx=PB=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1maYRr-0003M2-Oy
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 07:13:11 +0000
Received: from mail-io1-xd2a.google.com (unknown [2607:f8b0:4864:20::d2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d21eafa-d5c4-4a84-a8c3-d535b795752b;
 Wed, 13 Oct 2021 07:13:10 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id x1so1681127iof.7
 for <xen-devel@lists.xenproject.org>; Wed, 13 Oct 2021 00:13:10 -0700 (PDT)
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
X-Inumbo-ID: 7d21eafa-d5c4-4a84-a8c3-d535b795752b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KHB4g6o0LeMzf6QhsqguIIRvH+olg3UnDhoJaR0aLNA=;
        b=avPTWRvD87X49NZcwlii0xdmVFI41b1HDJTeSUpV6LTstZj5FMBkZDEpcCnnV6wh09
         tkLv9db1x07e+t/oQyZn8p2e1N6gQiet1Pbm4ckl21olRRwSML+IJtPQ5J3XScYpq+mI
         JgiVbyQ7DFL7gdytixxEnQzk/i9FfuXjXfHvxwZBmRQWVR1ZzV+6Vgo4XssTxxUy0s6A
         MhZTjzoA5tZ8zJIWwjFjdo/7wfq4BkqVbsSWPrnHVJxA1rQCHHwxVPBYM9oKV14JGha3
         iZkQZGbR9s1yGyXVp/0KymzoP6LIaXMT1lzaITBayQAvzJwYyt4vLlVJlm4V3pmjWU+3
         dLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KHB4g6o0LeMzf6QhsqguIIRvH+olg3UnDhoJaR0aLNA=;
        b=eGLItcLvMteAG0PlXhSqHhDhzq0xf8bpfdURggnynC3dnMQwpahGtFSgfPA/icggOg
         lw4vryaeGD/VQmh+A+N/uOJSv+RdLYBjSvM9DXUztEBzLMLZWhZb2mGjNwAGAzCJIMHV
         vf1LW5P+z97J8D3KMUBXrfCaguT8lH/8xFKgYCcYgMYrga8XJ+CP8rZGX39Lvp9hm8D/
         cqWkSGp0O5aI2R8ibtpYFT/iUBKWHsTATULz5zUxxAwAANAvQkL91ORUwJqctyqEMc4c
         G0FX0qr57xI/fgO4H3Y9IQZ5ooc8GJN0HdPtGvwQyOyRYhg+hy2TcpH4z1Ih14QYmzz5
         rDXQ==
X-Gm-Message-State: AOAM533GtM07t5kQ8W6Sai/HOqvoDdcH08eUfC0cM8KFQg5Qg4nJ0O0c
	SEqMhXVvRxdyEIvaT9wiwHXsWncPo46r0UNY7yM=
X-Google-Smtp-Source: ABdhPJwAerQBrE6h1mAcc8a9ejLtUsRNqYkv/iKjXq1q0SyzeWPOBrz+6jeH+TXpXPz1j01S6PDyDckoOD1oFZSZOyY=
X-Received: by 2002:a05:6602:2e8c:: with SMTP id m12mr8986722iow.91.1634109190435;
 Wed, 13 Oct 2021 00:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com> <20210922161405.140018-12-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-12-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 17:12:44 +1000
Message-ID: <CAKmqyKMP5-8wGY6vFEXeiCgrJQhZRQWcYvyqbEihjCkv1bYEhQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/16] softmmu/memory: add memory_region_try_add_subregion
 function
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, 
	mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>, Eric Blake <eblake@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, "open list:X86" <xen-devel@lists.xenproject.org>, 
	Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Mark Burton <mark.burton@greensocs.com>, Edgar Iglesias <edgari@xilinx.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 2:29 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> It allows to try to add a subregion to a memory region with error
> handling. Like memory_region_add_subregion_overlap, it handles
> priority as well.
> Apart the error handling, the behavior is the same. It can be used
> to do the simple memory_region_add_subregion() (with no overlap) by
> setting the priority parameter to 0.
>
> This commit is a preparation to further use this function in the
> context of qmp command which needs error handling support.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Adding a new function is obviously not ideal. But there is ~900
> occurrences of memory_region_add_subregion[_overlap] calls in the code
> base. We do not really see an alternative here.
> ---
>  include/exec/memory.h | 22 ++++++++++++++++++++++
>  softmmu/memory.c      | 22 ++++++++++++++--------
>  2 files changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317..422e1eda67 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2162,6 +2162,28 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>                                           MemoryRegion *subregion,
>                                           int priority);
>
> +/**
> + * memory_region_try_add_subregion: Add a subregion to a container
> + *                                  with error handling.
> + *
> + * Behaves like memory_region_add_subregion_overlap(), but errors are
> + * reported if the subregion cannot be added.
> + *
> + * @mr: the region to contain the new subregion; must be a container
> + *      initialized with memory_region_init().
> + * @offset: the offset relative to @mr where @subregion is added.
> + * @subregion: the subregion to be added.
> + * @priority: used for resolving overlaps; highest priority wins.
> + * @errp: pointer to Error*, to store an error if it happens.
> + *
> + * Returns: True in case of success, false otherwise.
> + */
> +bool memory_region_try_add_subregion(MemoryRegion *mr,
> +                                     hwaddr offset,
> +                                     MemoryRegion *subregion,
> +                                     int priority,
> +                                     Error **errp);
> +
>  /**
>   * memory_region_get_ram_addr: Get the ram address associated with a memory
>   *                             region
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4d..eac61f8236 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2513,22 +2513,28 @@ done:
>      memory_region_transaction_commit();
>  }
>
> -static void memory_region_add_subregion_common(MemoryRegion *mr,
> -                                               hwaddr offset,
> -                                               MemoryRegion *subregion)
> +bool memory_region_try_add_subregion(MemoryRegion *mr,
> +                                     hwaddr offset,
> +                                     MemoryRegion *subregion,
> +                                     int priority,
> +                                     Error **errp)
>  {
> -    assert(!subregion->container);
> +    if (subregion->container) {
> +        error_setg(errp, "The memory region is already in another region");
> +        return false;
> +    }
> +    subregion->priority = priority;
>      subregion->container = mr;
>      subregion->addr = offset;
>      memory_region_update_container_subregions(subregion);
> +    return true;
>  }
>
>  void memory_region_add_subregion(MemoryRegion *mr,
>                                   hwaddr offset,
>                                   MemoryRegion *subregion)
>  {
> -    subregion->priority = 0;
> -    memory_region_add_subregion_common(mr, offset, subregion);
> +    memory_region_try_add_subregion(mr, offset, subregion, 0, &error_abort);
>  }
>
>  void memory_region_add_subregion_overlap(MemoryRegion *mr,
> @@ -2536,8 +2542,8 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>                                           MemoryRegion *subregion,
>                                           int priority)
>  {
> -    subregion->priority = priority;
> -    memory_region_add_subregion_common(mr, offset, subregion);
> +    memory_region_try_add_subregion(mr, offset, subregion, priority,
> +                                    &error_abort);
>  }
>
>  void memory_region_del_subregion(MemoryRegion *mr,
> --
> 2.33.0
>
>

