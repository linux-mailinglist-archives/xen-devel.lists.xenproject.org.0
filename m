Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7317F78EFD1
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 16:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593995.927157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbj3n-0007Pv-4h; Thu, 31 Aug 2023 14:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593995.927157; Thu, 31 Aug 2023 14:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbj3n-0007N0-17; Thu, 31 Aug 2023 14:54:15 +0000
Received: by outflank-mailman (input) for mailman id 593995;
 Thu, 31 Aug 2023 14:54:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYAZ=EQ=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1qbj3l-0007Mu-Gr
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 14:54:13 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e746048-480e-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 16:54:11 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-522dd6b6438so1170650a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 07:54:11 -0700 (PDT)
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
X-Inumbo-ID: 3e746048-480e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693493650; x=1694098450; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2wEWAeSU+xhAZFakzZbQNkD6WWYDXkiKXFY/AdXwAUY=;
        b=dQv4VDlng04203vHOvm95mExMCoGCVlTg3WclaPc0axchXeb+oYT5GughuzP/M0EEL
         AyenVpJ2mACRMMtvXfwt4tL9d0Dd6aozRCBjM3xg9hZZ7aufSsX/AKQFixbPAs2NSPte
         4ByO7LXXXy59gH9TU14fYVzdNZF8EDggaEC1mPxEwEy0JX8vN/KJN2ljcEwMNJmuScxj
         ohYxjbld8Q4j0l8exActZsKKrnWeqE8mZHrcMDMauKB1vuC0YlqAF/Y4sY7XbxKAicVW
         ESmT5dLDH7m1OeIaLMGmTSSlKNTlZce1oPqNfwUHn2eRWWw7PrKhcWr2dhbgurrYftTv
         2qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693493650; x=1694098450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wEWAeSU+xhAZFakzZbQNkD6WWYDXkiKXFY/AdXwAUY=;
        b=P750My/Wo8KYKY4eYKPcX7/FFOqS+9aPvDeGXw/x0LCVJbOTk40J41y7gsoKsFcaLs
         u7UlrRc+jiHSOpjl7nL4b4ciKDN/6L+U26Wmyqs7asIJhU9HysIXxDY/zha+8kHdKSkT
         y33dpDBQPbWtm/URD2f0ChyVx/MKinYRzEbLn773GXs4jsljb2hdyQOFAoooo4M2GRtY
         XY49XzolP6iIcKtOx9ZN60SjGKnwcWpupIXD/wO0Nv0PBijCvpa7BMu3bvgrrcoePU6f
         8CJeMgITZrW0VcO9TtNcT+qeQeLhVXQOhmO9+h2gYZmH1CuZ9Z+g2Fw1AbrzxTnsHf4U
         ng2Q==
X-Gm-Message-State: AOJu0YwinMDiuyUBXiAIbrE6CmjSTbSrANGkxMHWCbElxb+V+yNFEPoZ
	/spYT/P68/OcLjz8G0h+/xygngrBXNGb5CP5loMyeQ==
X-Google-Smtp-Source: AGHT+IFqT8KTaZoEKWvPQ8gzuOKgMSnOVcBh2vLKZ3yJ/Ezgic6ziyRaHhtm93rngv6BIta49p6MDa1m6R6t3HSfp6Y=
X-Received: by 2002:a05:6402:1604:b0:522:3a37:a463 with SMTP id
 f4-20020a056402160400b005223a37a463mr4323944edv.20.1693493650556; Thu, 31 Aug
 2023 07:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230831132546.3525721-1-armbru@redhat.com> <20230831132546.3525721-4-armbru@redhat.com>
In-Reply-To: <20230831132546.3525721-4-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Aug 2023 15:53:59 +0100
Message-ID: <CAFEAcA-0yYGkeg1gOtz8GRp-DbaxMQCzhRf=B4rq=Bz_DrsxNA@mail.gmail.com>
Subject: Re: [PATCH 3/7] ui: Clean up local variable shadowing
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com, 
	eblake@redhat.com, vsementsov@yandex-team.ru, jsnow@redhat.com, 
	idryomov@gmail.com, pl@kamp.de, sw@weilnetz.de, sstabellini@kernel.org, 
	anthony.perard@citrix.com, paul@xen.org, pbonzini@redhat.com, 
	marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com, 
	philmd@linaro.org, stefanha@redhat.com, fam@euphon.net, quintela@redhat.com, 
	peterx@redhat.com, leobras@redhat.com, kraxel@redhat.com, 
	qemu-block@nongnu.org, xen-devel@lists.xenproject.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Aug 2023 at 14:25, Markus Armbruster <armbru@redhat.com> wrote:
>
> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Tracked down with -Wshadow=local.
> Clean up: delete inner declarations when they are actually redundant,
> else rename variables.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>


> diff --git a/ui/vnc-enc-zrle.c.inc b/ui/vnc-enc-zrle.c.inc
> index c107d8affc..edf42d4a6a 100644
> --- a/ui/vnc-enc-zrle.c.inc
> +++ b/ui/vnc-enc-zrle.c.inc
> @@ -153,11 +153,12 @@ static void ZRLE_ENCODE_TILE(VncState *vs, ZRLE_PIXEL *data, int w, int h,
>      }
>
>      if (use_rle) {
> -        ZRLE_PIXEL *ptr = data;
> -        ZRLE_PIXEL *end = ptr + w * h;
>          ZRLE_PIXEL *run_start;
>          ZRLE_PIXEL pix;
>
> +       ptr = data;
> +        end = ptr + w * h;
> +
>          while (ptr < end) {
>              int len;
>              int index = 0;
> @@ -198,7 +199,7 @@ static void ZRLE_ENCODE_TILE(VncState *vs, ZRLE_PIXEL *data, int w, int h,
>          }
>      } else if (use_palette) { /* no RLE */
>          int bppp;
> -        ZRLE_PIXEL *ptr = data;
> +        ptr = data;
>
>          /* packed pixels */
>
> @@ -241,8 +242,6 @@ static void ZRLE_ENCODE_TILE(VncState *vs, ZRLE_PIXEL *data, int w, int h,
>  #endif
>          {
>  #ifdef ZRLE_COMPACT_PIXEL
> -            ZRLE_PIXEL *ptr;
> -
>              for (ptr = data; ptr < data + w * h; ptr++) {
>                  ZRLE_WRITE_PIXEL(vs, *ptr);
>              }

For this one I'm tempted to suggest instead moving the
pix and end currently at whole-function scope into their
own block, so it's clear these are actually four
completely independent uses of ptr/end. But either way

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

