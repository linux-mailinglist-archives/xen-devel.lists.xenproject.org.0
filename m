Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5B8514F78
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 17:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317459.536797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkSXw-0008SW-7f; Fri, 29 Apr 2022 15:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317459.536797; Fri, 29 Apr 2022 15:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkSXw-0008Pi-4M; Fri, 29 Apr 2022 15:28:40 +0000
Received: by outflank-mailman (input) for mailman id 317459;
 Fri, 29 Apr 2022 15:28:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R1X1=VH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nkSXu-0008Pc-FN
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 15:28:38 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09a87750-c7d1-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 17:28:36 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id 4so10894013ljw.11
 for <xen-devel@lists.xenproject.org>; Fri, 29 Apr 2022 08:28:36 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a05651c211100b0024f3d1daeffsm296467ljq.135.2022.04.29.08.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 08:28:35 -0700 (PDT)
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
X-Inumbo-ID: 09a87750-c7d1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=bhq9Edgd4TreDu6ZZX1wON0xSU1SZwVBqK/SEM+ml3E=;
        b=B3xMcLPAdNIn9uq2hakHPIlS8jvWBspKPqlkNh7vmKOaxKyaL3MczjXBPc9hVIXgb1
         SlB7eFrdt9btBjddlOdddK+/PmXIeU3GNfb8PNgtu+RtZWanbwMO8BJlHjIEMhfmyu/T
         Yz9yA4QKZjJ0yuLILO6MXxuVhhMZC27HA09vKdW5kBBW03uApgo+MylQXsOBwVr/Av/O
         WCZXKN5nHBdMVFcX7SWG+NB5ndonYXbRPW1G1aTeJNvNvL24WQsXVfK0szPmNTtarEjx
         5cQ5QxyNDKEDTiWR9DzKsYLtudCV/5shn5aipbTP45CTmfARLAAmoL6iXuGUHzwn8TS+
         6WeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=bhq9Edgd4TreDu6ZZX1wON0xSU1SZwVBqK/SEM+ml3E=;
        b=bVCGcNrqiv2LEHlfvohHcMqBY3jXfAnnbw8/fvCQRiu9trgfvGzQqi41135e89LlvF
         6MQxNGCNYbPlHuwxKC7Z1ZaACYmMoQ26r+/wwcT7uF7f3BDvwW31gEUD4m6LocRb9+Gj
         +NMjB/RP5J+xHujcO/o3q+dOBzTwktiS+sHxS99As3AbXC2CzSrbUTXhdDnJThfz/V78
         xweLygTP3q/gejNxLfpj5p5EuQgiEr5zpGTvWUglZn+x9ty2jEe+SMKDTb+Sg3vrfnK1
         3+AIV5eukvHi1xZFU4ZIAP3LfUwahtDHAe51mA2NlfOdwzYsuPJ8ZshU4Kl1zcpdhO/C
         dAsA==
X-Gm-Message-State: AOAM532Fo2kcZ+aDzLlWUpO+wqbqsA+okTQd9+ENpPaaulrVZVxpZIr4
	0ajX5ITKtPy+nkyhlly8yJU=
X-Google-Smtp-Source: ABdhPJwohhuXeqggDcgYROZEOtgIKa51kUFPDtQnKaRDo5KPeapt3KOaEM3V1qCKDEH1jMSMEdtQUA==
X-Received: by 2002:a2e:87cb:0:b0:24f:81c:8940 with SMTP id v11-20020a2e87cb000000b0024f081c8940mr20554318ljj.423.1651246116210;
        Fri, 29 Apr 2022 08:28:36 -0700 (PDT)
Subject: Re: [PATCH v2 08/19] xen/shbuf: switch xen-front-pgdir-shbuf to use
 INVALID_GRANT_REF
From: Oleksandr <olekstysh@gmail.com>
To: Juergen Gross <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220428082743.16593-1-jgross@suse.com>
 <20220428082743.16593-9-jgross@suse.com>
 <CAPD2p-nisRgMOzy+w2jx5ULfZTyv4MqtG0wkV9jNn3wNg415sQ@mail.gmail.com>
Message-ID: <b05fe983-8f9e-da3d-1bf0-e121ba969ae3@gmail.com>
Date: Fri, 29 Apr 2022 18:28:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPD2p-nisRgMOzy+w2jx5ULfZTyv4MqtG0wkV9jNn3wNg415sQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hello Juergen


On 28.04.22 21:03, Oleksandr Tyshchenko wrote:
>
>
> On Thu, Apr 28, 2022 at 11:28 AM Juergen Gross <jgross@suse.com 
> <mailto:jgross@suse.com>> wrote:
>
> Hello Juergen
>
> [sorry for the possible format issue]
>
>     Instead of using a private macro for an invalid grant reference use
>     the common one.
>
>     Signed-off-by: Juergen Gross <jgross@suse.com
>     <mailto:jgross@suse.com>>
>     ---
>      drivers/xen/xen-front-pgdir-shbuf.c | 17 ++++-------------
>      1 file changed, 4 insertions(+), 13 deletions(-)
>
>     diff --git a/drivers/xen/xen-front-pgdir-shbuf.c
>     b/drivers/xen/xen-front-pgdir-shbuf.c
>     index a959dee21134..fa2921d4fbfc 100644
>     --- a/drivers/xen/xen-front-pgdir-shbuf.c
>     +++ b/drivers/xen/xen-front-pgdir-shbuf.c
>     @@ -21,15 +21,6 @@
>
>      #include <xen/xen-front-pgdir-shbuf.h>
>
>     -#ifndef GRANT_INVALID_REF
>     -/*
>     - * FIXME: usage of grant reference 0 as invalid grant reference:
>     - * grant reference 0 is valid, but never exposed to a PV driver,
>     - * because of the fact it is already in use/reserved by the PV
>     console.
>     - */
>     -#define GRANT_INVALID_REF      0
>     -#endif
>     -
>      /**
>       * This structure represents the structure of a shared page
>       * that contains grant references to the pages of the shared
>     @@ -83,7 +74,7 @@ grant_ref_t
>      xen_front_pgdir_shbuf_get_dir_start(struct xen_front_pgdir_shbuf
>     *buf)
>      {
>             if (!buf->grefs)
>     -               return GRANT_INVALID_REF;
>     +               return INVALID_GRANT_REF;
>
>             return buf->grefs[0];
>      }
>     @@ -142,7 +133,7 @@ void xen_front_pgdir_shbuf_free(struct
>     xen_front_pgdir_shbuf *buf)
>                     int i;
>
>                     for (i = 0; i < buf->num_grefs; i++)
>     -                       if (buf->grefs[i] != GRANT_INVALID_REF)
>     +                       if (buf->grefs[i] != INVALID_GRANT_REF)
>     gnttab_end_foreign_access(buf->grefs[i], 0UL);
>             }
>             kfree(buf->grefs);
>     @@ -355,7 +346,7 @@ static void backend_fill_page_dir(struct
>     xen_front_pgdir_shbuf *buf)
>             }
>             /* Last page must say there is no more pages. */
>             page_dir = (struct xen_page_directory *)ptr;
>     -       page_dir->gref_dir_next_page = GRANT_INVALID_REF;
>     +       page_dir->gref_dir_next_page = INVALID_GRANT_REF;
>      }
>
>      /**
>     @@ -384,7 +375,7 @@ static void guest_fill_page_dir(struct
>     xen_front_pgdir_shbuf *buf)
>
>                     if (grefs_left <= XEN_NUM_GREFS_PER_PAGE) {
>                             to_copy = grefs_left;
>     -                       page_dir->gref_dir_next_page =
>     GRANT_INVALID_REF;
>     +                       page_dir->gref_dir_next_page =
>     INVALID_GRANT_REF;
>
>
> I faced an issue with testing PV Sound with the current series.
>
> root@salvator-x-h3-4x2g-xt-domu:~# aplay /media/MoodyLoop.wav
> Playing WAVE '/media/MoodyLoop.wav' : Signed 16 bit Little Endian, 
> Rate 44100 Hz, Stereo
> (XEN) common/grant_table.c:1053:d1v2 Bad ref 0xffffffff for d6
>
> Here we have an interesting situation. PV Sound frontend uses this 
> xen-front-pgdir-shbuf framework. Technically, this patch changes 
> page_dir->gref_dir_next_page (reference to the next page describing 
> page directory) from 0 to 0xffffffff here.
> #define INVALID_GRANT_REF  ((grant_ref_t)-1)
>
> But according to the protocol (sndif.h), "0" means that there are no 
> more pages in the list and the user space backend expects only that 
> value. So receiving 0xffffffff it assumes there are pages in the list 
> and trying to process...
> https://elixir.bootlin.com/linux/v5.18-rc4/source/include/xen/interface/io/sndif.h#L650
>
>
> I think, the same is relevant to backend_fill_page_dir() as well.


In addition to what I said yesterday:

PV Display also uses this xen-front-pgdir-shbuf framework. It's protocol 
(displif.h) also mentions the same as sndif.h if the context of 
gref_dir_next_page:

  * gref_dir_next_page - grant_ref_t, reference to the next page describing
  *   page directory. Must be 0 if there are no more pages in the list.


With that local change both PV devices work in my environment.

diff --git a/drivers/xen/xen-front-pgdir-shbuf.c 
b/drivers/xen/xen-front-pgdir-shbuf.c
index fa2921d..ad4a88e 100644
--- a/drivers/xen/xen-front-pgdir-shbuf.c
+++ b/drivers/xen/xen-front-pgdir-shbuf.c
@@ -346,7 +346,7 @@ static void backend_fill_page_dir(struct 
xen_front_pgdir_shbuf *buf)
         }
         /* Last page must say there is no more pages. */
         page_dir = (struct xen_page_directory *)ptr;
-       page_dir->gref_dir_next_page = INVALID_GRANT_REF;
+       page_dir->gref_dir_next_page = 0;
  }

  /**
@@ -375,7 +375,7 @@ static void guest_fill_page_dir(struct 
xen_front_pgdir_shbuf *buf)

                 if (grefs_left <= XEN_NUM_GREFS_PER_PAGE) {
                         to_copy = grefs_left;
-                       page_dir->gref_dir_next_page = INVALID_GRANT_REF;
+                       page_dir->gref_dir_next_page = 0;
                 } else {
                         to_copy = XEN_NUM_GREFS_PER_PAGE;
                         page_dir->gref_dir_next_page = buf->grefs[i + 1];
(END)



>
>                     } else {
>                             to_copy = XEN_NUM_GREFS_PER_PAGE;
>                             page_dir->gref_dir_next_page =
>     buf->grefs[i + 1];
>     -- 
>     2.34.1
>
>
>
>
> -- 
> Regards,
>
> Oleksandr Tyshchenko

-- 
Regards,

Oleksandr Tyshchenko


