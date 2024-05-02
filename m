Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD48E8B955B
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 09:35:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715619.1117392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Qy9-0000tJ-Da; Thu, 02 May 2024 07:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715619.1117392; Thu, 02 May 2024 07:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Qy9-0000rc-AS; Thu, 02 May 2024 07:35:05 +0000
Received: by outflank-mailman (input) for mailman id 715619;
 Thu, 02 May 2024 07:35:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2Qy7-0000rW-J5
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 07:35:03 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b84a9ee-0856-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 09:35:00 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-572adaa172cso2103138a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 00:35:00 -0700 (PDT)
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
X-Inumbo-ID: 7b84a9ee-0856-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714635300; x=1715240100; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlUMOnUMKElu43V8N8NXHih/16FRYsa+DT2aHHqwJNE=;
        b=fxtLdDno0cNzUZmJ9P2LIj3H61O5CM5oACEUZLdkft/cOH3ZBVTTqwykGdX8GbRku/
         Eu7n6Wl8xCNIlksgCJHy1l9Fvd0HegENm1RnnIt+4LxdP3RDQXb0QBNgIOnicn97M3pd
         38Yr3QpiGDdnb36tBdO0GxvS0y6j2YD7J/3ke+yaYzvhZPfiN0+F4PgFs9oSMabveaaW
         pXpUBqTm/ubQVac41TjS5Rati1heyU8uCFC9iLCBwedKlzsT44k+edbCk+WMvYt1Ij1Y
         CGPsE5CfC0uejkPJz3i+TG+IALoPPase0HYBTQptVHEMJdqbeYfQBAMXPkx3vER5SMLI
         wV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714635300; x=1715240100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlUMOnUMKElu43V8N8NXHih/16FRYsa+DT2aHHqwJNE=;
        b=p2ZBclRMeVRFZkiWxFWYM2ZG02hnLYEae8KytW/SBb9+Fm6c+o9WCyf90W3V0uvYz/
         8shM1feKljturQB6TZaTzSuBe3S4T9j5sKX88sNoOMPXnV4bzPIj+1D5gDfnBOB+J295
         sKgJSBRfC71e4z/G818rlN+6Rf7SQRI/luKjon51wUqKwZmwpZIq5k8J/NZN3oLAIIhz
         x9Dd7njyAYGuN8GS44rmtybwa/0rUAlsKfHHE7RIe3glrFywitwzhI0VRaNKzK7XZZcS
         Xjzkk79xoAd5PMAIPu/4svCgNpKBuMt86SVfeZgMGd6/uOzo5xDXIuKgXeo73Ldh9coy
         E0lw==
X-Forwarded-Encrypted: i=1; AJvYcCV0/+wCaOutlikvH9wat9OPkqr0mihHD2Ms3F9Lqlly/PCqasUcA03TOI0e6Ks5Oz90JTQF0Gt/W7GyaCS10VVZhPs1vLU4KYdxxzuiG/k=
X-Gm-Message-State: AOJu0Yz4FFLXi0tWotea2NjSZyFbAgPa8FN+UsSSSi747bQ0yb7pLaXq
	qSgHH41+LAkO6zN4pVVrVCl4+rFtWwUXygmHNEFaxmP+LVl0BNnU+v5cZGlI9H0KOG0DjSZnTAd
	ZO2TBS/frD8fQ9BghsUsv111dEZw=
X-Google-Smtp-Source: AGHT+IFeFt+Pbra3NifN8rs1UXcD8UP6ZmjUZHfOEsk+O2tSlQVe5lCGAJsT/L6+37rrO+XVhxWqsOTvvoJ6Jvn3MsI=
X-Received: by 2002:a50:cd53:0:b0:570:4aea:4e1e with SMTP id
 d19-20020a50cd53000000b005704aea4e1emr1859829edj.15.1714635299936; Thu, 02
 May 2024 00:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-13-edgar.iglesias@gmail.com>
In-Reply-To: <20240430164939.925307-13-edgar.iglesias@gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 2 May 2024 09:34:47 +0200
Message-ID: <CAJy5ezrJ2YYgAXFhcyAVosnKL3a5E96oJCfkuS4y2OGSxdU0Fw@mail.gmail.com>
Subject: Re: [PATCH v4 12/17] xen: mapcache: Unmap first entries in buckets
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com, 
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 6:50=E2=80=AFPM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> When invalidating memory ranges, if we happen to hit the first
> entry in a bucket we were never unmapping it. This was harmless
> for foreign mappings but now that we're looking to reuse the
> mapcache for transient grant mappings, we must unmap entries
> when invalidated.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/xen/xen-mapcache.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 4f98d284dd..0365311788 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -486,18 +486,22 @@ static void xen_invalidate_map_cache_entry_unlocked=
(MapCache *mc,
>          return;
>      }
>      entry->lock--;
> -    if (entry->lock > 0 || pentry =3D=3D NULL) {
> +    if (entry->lock > 0) {
>          return;
>      }
>
> -    pentry->next =3D entry->next;
>      ram_block_notify_remove(entry->vaddr_base, entry->size, entry->size)=
;
>      if (munmap(entry->vaddr_base, entry->size) !=3D 0) {
>          perror("unmap fails");
>          exit(-1);
>      }
> -    g_free(entry->valid_mapping);
> -    g_free(entry);
> +    if (pentry) {
> +        pentry->next =3D entry->next;
> +        g_free(entry->valid_mapping);
> +        g_free(entry);
> +    } else {
> +        memset(entry, 0, sizeof *entry);

I noticed that we're leaking entry->valid_mapping here. I'll fix this for v=
5.

Cheers,
Edgar


> +    }
>  }
>
>  typedef struct XenMapCacheData {
> --
> 2.40.1
>

