Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DD79E0A08
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 18:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846944.1262068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIAIm-0006lz-9s; Mon, 02 Dec 2024 17:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846944.1262068; Mon, 02 Dec 2024 17:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIAIm-0006j3-77; Mon, 02 Dec 2024 17:33:40 +0000
Received: by outflank-mailman (input) for mailman id 846944;
 Mon, 02 Dec 2024 17:33:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=no4W=S3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tIAIk-0006ix-Pk
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 17:33:38 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f0d4e62-b0d3-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 18:33:36 +0100 (CET)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-71d5476ebb1so1951442a34.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 09:33:36 -0800 (PST)
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
X-Inumbo-ID: 8f0d4e62-b0d3-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1733160815; x=1733765615; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrUozg3jRdY0qRVlW3pISKvHP9R1SVt3R+pgqv7WHfY=;
        b=z4Hr+9KSzsjRv/sV1b0kJHsZnyq/JjWQIrmUhMEK/7m7d+Pozx9vonKjrElmYj/Iaj
         LDEDz8fvaum5YTuUXRPtona9d/oayildKonFOGlCZG8br2hbfDUKCSCVjnsco0KACni2
         4jxsAqHlo/R1zLqSj6/8UPuNnO0zwW9feRt4sjjsv32uxQreoTzN8LZWeqfHUbagW4Nh
         n8kSTspD85CXJyyMLlpO15YedEu69lNYDlyHvjYBPTAUAINMZa1bjF0L5xQAGmEWsoY9
         M2EayD/XuR1+lTMyQb5BCm29I5G0VRPksG9sTyReUMONv7i0nPsLe1WgGv+44LlFkzNi
         9DbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160815; x=1733765615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrUozg3jRdY0qRVlW3pISKvHP9R1SVt3R+pgqv7WHfY=;
        b=ZRz8WVvnp8FGjlbyP+I0BCivcqCDIBQZQEUbaTJZxNkywy4w2gLV4C+lfXfUIUhrue
         v8jY7rVj/mUUtDIoAi5ucrkcoABJ/owyW7aT4bI1axzX2KHmLVt6giFxcKGw5mS8uDrQ
         IXUlIEMzPKC+a7R9GpPgHHCR5eyFRw1g7ZaOJtYNSztebWmw5lfpt1DGBpjJMQ/P3hHJ
         5KdkxrzrDaKe6Hstfjyn/qT4DkNB7W1Fu9l9lCRvSZC/cDUmSZ19JSGzKT0nFCqi1yCL
         WNaHV26lgNGL+DnkAHG9opfMNQCeo7n1JVyIdMnGnwOwRkL1xQJKVwQdsANFGqslDX+J
         GsoA==
X-Gm-Message-State: AOJu0YyEODHO6C2jIWYefRIo8FnSkRWMC/x59LDmOddr8jJZCKrD/62B
	+A6ywMIO0xtfnIoY2dNMIRTRLHJLw9zKpMBU5B3yHLOvAKekyXMrQ2o76XqbxnwJ5xO1S7PsS/i
	YevjTD9tt9afQ4w1io+UBWlLd3VNd0u0URzwnFLaID3jB/NDFWng=
X-Gm-Gg: ASbGnctxhpWx4ys0S7SMmZsWyyAfuvQ36gs76vBCZEf0nyH+XGO5iqeYqpW7H7tjldI
	gw1IoEEasp0LYjOqxk3+twQR0Frva9Iig
X-Google-Smtp-Source: AGHT+IHaq5L05Jz51NraCFfDdHEi6jfBClAScqBxMrcR05V1qNObc+OAZ858XmCVZKM+sVCqQRYnQGRbxjZSZPdb93w=
X-Received: by 2002:a05:6830:25d6:b0:71d:5983:8827 with SMTP id
 46e09a7af769-71d65cf7445mr14236820a34.19.1733160814980; Mon, 02 Dec 2024
 09:33:34 -0800 (PST)
MIME-Version: 1.0
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech> <20241202165921.249585-9-carlo.nonato@minervasys.tech>
In-Reply-To: <20241202165921.249585-9-carlo.nonato@minervasys.tech>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 2 Dec 2024 18:33:24 +0100
Message-ID: <CAG+AhRXrnZbX=0Dic4zRTddYx7+tbounnB9tT4vrt-MHsp9ikw@mail.gmail.com>
Subject: Re: [PATCH v11 08/12] xen/page_alloc: introduce preserved page flags macro
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, Dec 2, 2024 at 5:59=E2=80=AFPM Carlo Nonato
<carlo.nonato@minervasys.tech> wrote:
>
> PGC_static and PGC_extra need to be preserved when assigning a page.
> Define a new macro that groups those flags and use it instead of or'ing
> every time.
>
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> ---
> v11:
> - removed PGC_broken from PGC_preserved
> - removed PGC preservation from mark_page_free()
> v10:
> - fixed commit message
> v9:
> - add PGC_broken to PGC_preserved
> - clear PGC_extra in alloc_domheap_pages() only if MEMF_no_refcount is se=
t
> v8:
> - fixed PGC_extra ASSERT fail in alloc_domheap_pages() by removing PGC_ex=
tra
>   before freeing
> v7:
> - PGC_preserved used also in mark_page_free()
> v6:
> - preserved_flags renamed to PGC_preserved
> - PGC_preserved is used only in assign_pages()
> v5:
> - new patch
> ---
>  xen/common/page_alloc.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 55d561e93c..e73b404169 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -161,6 +161,7 @@
>  #endif
>
>  #define PGC_no_buddy_merge PGC_static
> +#define PGC_preserved (PGC_extra | PGC_static)
>
>  #ifndef PGT_TYPE_INFO_INITIALIZER
>  #define PGT_TYPE_INFO_INITIALIZER 0
> @@ -1447,8 +1448,7 @@ static bool mark_page_free(struct page_info *pg, mf=
n_t mfn)
>          break;
>
>      case PGC_state_offlining:
> -        pg->count_info =3D (pg->count_info & PGC_broken) |
> -                         PGC_state_offlined;
> +        pg->count_info =3D (pg->count_info & PGC_broken) | PGC_state_off=
lined;
>          pg_offlined =3D true;
>          break;
>
> @@ -2382,7 +2382,7 @@ int assign_pages(
>
>          for ( i =3D 0; i < nr; i++ )
>          {
> -            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
> +            ASSERT(!(pg[i].count_info & ~PGC_preserved));
>              if ( pg[i].count_info & PGC_extra )
>                  extra_pages++;
>          }
> @@ -2442,7 +2442,7 @@ int assign_pages(
>          page_set_owner(&pg[i], d);
>          smp_wmb(); /* Domain pointer must be visible before updating ref=
cnt. */
>          pg[i].count_info =3D
> -            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocate=
d | 1;
> +            (pg[i].count_info & PGC_preserved) | PGC_allocated | 1;
>
>          page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
>      }
> @@ -2501,6 +2501,14 @@ struct page_info *alloc_domheap_pages(
>          }
>          if ( assign_page(pg, order, d, memflags) )
>          {
> +            if ( memflags & MEMF_no_refcount )
> +            {
> +                unsigned long i;
> +
> +                for ( i =3D 0; i < (1UL << order); i++ )
> +                    pg[i].count_info &=3D ~PGC_extra;
> +            }
> +
>              free_heap_pages(pg, order, memflags & MEMF_no_scrub);
>              return NULL;
>          }
> @@ -2555,6 +2563,7 @@ void free_domheap_pages(struct page_info *pg, unsig=
ned int order)
>                  {
>                      ASSERT(d->extra_pages);
>                      d->extra_pages--;
> +                    pg[i].count_info &=3D ~PGC_extra;
>                  }
>              }
>
> --
> 2.43.0
>

Sorry guys, this patch is wrong.
Here's the correct one.

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 55d561e93c..1c0990b180 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -161,6 +161,7 @@
 #endif

 #define PGC_no_buddy_merge PGC_static
+#define PGC_preserved (PGC_extra | PGC_static)

 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
@@ -2382,7 +2383,7 @@ int assign_pages(

         for ( i =3D 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
+            ASSERT(!(pg[i].count_info & ~PGC_preserved));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2442,7 +2443,7 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcn=
t. */
         pg[i].count_info =3D
-            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated =
| 1;
+            (pg[i].count_info & PGC_preserved) | PGC_allocated | 1;

         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }

Sorry about that.
Thanks.

