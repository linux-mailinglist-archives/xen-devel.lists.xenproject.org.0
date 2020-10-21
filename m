Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B67294B95
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 12:59:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10015.26408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVBpa-0000ct-C9; Wed, 21 Oct 2020 10:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10015.26408; Wed, 21 Oct 2020 10:58:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVBpa-0000cG-7z; Wed, 21 Oct 2020 10:58:58 +0000
Received: by outflank-mailman (input) for mailman id 10015;
 Wed, 21 Oct 2020 10:58:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zsxo=D4=gmail.com=pankaj.gupta.linux@srs-us1.protection.inumbo.net>)
 id 1kVBpZ-0000c1-Dw
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:58:57 +0000
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd35d6ce-8b8d-43aa-9446-57d42f91c94d;
 Wed, 21 Oct 2020 10:58:56 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id p15so2697393ioh.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2020 03:58:56 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zsxo=D4=gmail.com=pankaj.gupta.linux@srs-us1.protection.inumbo.net>)
	id 1kVBpZ-0000c1-Dw
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:58:57 +0000
X-Inumbo-ID: fd35d6ce-8b8d-43aa-9446-57d42f91c94d
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fd35d6ce-8b8d-43aa-9446-57d42f91c94d;
	Wed, 21 Oct 2020 10:58:56 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id p15so2697393ioh.0
        for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2020 03:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GICSwgN3sNFkPLzb9ZiuRIa+ZIKU5hbtJb9zZM8PdNs=;
        b=ENzNLNVw380JSauwEXTsNIwfSS+Pfic6wIwk3mcDkx2ZI8vSJTG9T4To95nV5K++3S
         wXrPtza7/nKOZyWO6GUYg/19vJCSiI3irHrOtUq4HfvmyEmN9+Er/0f8hl5JC3NY9rCU
         4VXyirx16ZxcwPrFkWNc5+fdgPzJzwoqh23QZ4siuTOAmG7kAyniMqDNFkdjAyBLV9KU
         6xUTE1fU2WS7Y2iHpg238szVhAOmVhcjtjhCua1z7pgont9fb1+CXR9apRekKvjEBXQ4
         Mjsvsuixy9gpE8FbEhU64igpCUNBdcJC/8ogPwXvQvXYuRk8lqRCeWNgGrCpzH1AQQOC
         Q+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GICSwgN3sNFkPLzb9ZiuRIa+ZIKU5hbtJb9zZM8PdNs=;
        b=N8iTpknxlkPHFXddK9SpLj1ELntD/L7k/W4hwUs1zNjMbU+AYB+Z9dQEZIZFVAvyca
         tei2OaBzX9qT9umrygjef+g7nRWcnVc5RRA4sQrbdByUVxTC0pxRYd6PyhPHo4m5oVIc
         Ke5rnnjfqEd1nSw76MGbTIKZik/W3872MsZbrgqwxcSU25tHq2n+DmZ7/lzaQrS7owJ9
         SKZoxMlIcbZoAaYBzM2ec9F33Ypd1WSsXfAmagxeAYqtDjAVaW9tAq4fHs0PcbCJ44h2
         OY5F/C9mHpXyPx8PopSytsBnpbGd81oXur6p8yWTapnVuCZYCZmtknZGtLVw2LiOSYoz
         fgnA==
X-Gm-Message-State: AOAM530CjFXKJf/P9swbZCxCId1xxZzwi+FchSE3R2gqhSgc2HZ7GMdB
	lffRzOdw41SnA01O/SPhT+E7WYI31IzImvl43FQ=
X-Google-Smtp-Source: ABdhPJxVGoa8oGWf7NMjH5r135bL5msWqxriS77JIexiAMhTvnG4ddTh5FYX+VcY2vpk3tlFdrFb/MgirSrWDhsBaEo=
X-Received: by 2002:a5d:87c7:: with SMTP id q7mr2174472ios.162.1603277936222;
 Wed, 21 Oct 2020 03:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201005121534.15649-1-david@redhat.com> <20201005121534.15649-6-david@redhat.com>
In-Reply-To: <20201005121534.15649-6-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 21 Oct 2020 12:58:45 +0200
Message-ID: <CAM9Jb+jXR6iPvSxExaEJvm90mqRozh1wcJ6ukEmDy_pqc-37oQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] mm/memory_hotplug: update comment regarding zone shuffling
To: David Hildenbrand <david@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-acpi@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Wei Yang <richard.weiyang@linux.alibaba.com>, 
	Michal Hocko <mhocko@suse.com>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, 
	Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>, 
	Dave Hansen <dave.hansen@intel.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> As we no longer shuffle via generic_online_page() and when undoing
> isolation, we can simplify the comment.
>
> We now effectively shuffle only once (properly) when onlining new
> memory.
>
> Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Cc: Mel Gorman <mgorman@techsingularity.net>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Dave Hansen <dave.hansen@intel.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory_hotplug.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 03a00cb68bf7..b44d4c7ba73b 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -858,13 +858,10 @@ int __ref online_pages(unsigned long pfn, unsigned long nr_pages,
>         undo_isolate_page_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE);
>
>         /*
> -        * When exposing larger, physically contiguous memory areas to the
> -        * buddy, shuffling in the buddy (when freeing onlined pages, putting
> -        * them either to the head or the tail of the freelist) is only helpful
> -        * for maintaining the shuffle, but not for creating the initial
> -        * shuffle. Shuffle the whole zone to make sure the just onlined pages
> -        * are properly distributed across the whole freelist. Make sure to
> -        * shuffle once pageblocks are no longer isolated.
> +        * Freshly onlined pages aren't shuffled (e.g., all pages are placed to
> +        * the tail of the freelist when undoing isolation). Shuffle the whole
> +        * zone to make sure the just onlined pages are properly distributed
> +        * across the whole freelist - to create an initial shuffle.
>          */
>         shuffle_zone(zone);
>

Acked-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

