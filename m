Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9964C1FF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 02:49:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461555.719654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5GtW-0001Mg-6V; Wed, 14 Dec 2022 01:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461555.719654; Wed, 14 Dec 2022 01:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5GtW-0001JP-3j; Wed, 14 Dec 2022 01:49:14 +0000
Received: by outflank-mailman (input) for mailman id 461555;
 Wed, 14 Dec 2022 01:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akjR=4M=gmail.com=jcmvbkbc@srs-se1.protection.inumbo.net>)
 id 1p5GtU-0001JJ-EG
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 01:49:12 +0000
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [2607:f8b0:4864:20::b2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8113bdec-7b51-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 02:49:11 +0100 (CET)
Received: by mail-yb1-xb2d.google.com with SMTP id o127so19850797yba.5
 for <xen-devel@lists.xenproject.org>; Tue, 13 Dec 2022 17:49:11 -0800 (PST)
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
X-Inumbo-ID: 8113bdec-7b51-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xExdyQDhYTgV1IdxIuGP7o71ehB3CFKVoLy9PDmyibI=;
        b=CpQZevHLxrKv/1hgs+V2M6cSkSoV06F4lrYnaOXQP0TPCfiOv3a3XN/FUVsGLczONc
         Xoat0JVF6aWTnCtcoy0u8DaFnXLbOjr0GHowLyZMrkgrzMTSZuQb7jBkg29up3JFdnwb
         z1xpRhcvLh6rCbteub8Jcjve+YrOKZGEMD7u0Lze3jmBJXrFTkMX5NNiAeXpg7USuUsU
         H40QWeWHAWUskJKHXI/uEl0ZGO7h/DpvUk2CvRbW29DwT9GxFM07swURLZpZdI4fbjpV
         Hlq89BIEjgQzeMI9bDbAYiB6D/gX0qGIS3aqm628+LMHVQ3l5rrxI4O+dCFluPi5Hu0T
         Q+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xExdyQDhYTgV1IdxIuGP7o71ehB3CFKVoLy9PDmyibI=;
        b=URdnxqOyuHVfW+e3AgK9kywZ13z5YF80WbxYMoV44C8S2z/MI/k0XNkhpyH+KqtGmK
         hP3sZ8dghdpvAwl7vrsZuaEbRPerpi+la4nNZqngqxi3Q1ukWeEYCZWgG/V55IOVoXdZ
         JC6Ol5D2R8RPUOtYohMCxYD6Aa00G7D9058pcQSVOZ5jJMoUFSD1UcqrwDNlxHUz/K3g
         NM4wIagupCZTctS5WnnT24VQGDo35MoNpCxY6L4KG93/TxlQWgKJx0d7NQmTksCQrNZ1
         2Pc22KIDE2zVJU8D5PqqsscsTZMpEM8udGCh4dNUMcRGZ5c89U5VadpTP+lGk5s1ZQlS
         FY/w==
X-Gm-Message-State: ANoB5pkEwsYsJvUe7F8aOKKkSeCwOFqaw9lS1IjRy66ACv9rE9Z9Z6Xg
	2QbHB7EoU/v/bBKTNTpgTbC7Zwe4MUMP4olh1aQ=
X-Google-Smtp-Source: AA0mqf6aVToRrr31IEWqBS+HG0H/EHpXHAs4dR9uyadBVst6sowJPiHa9e2nz4BE/XZPJEaRMOKC5NsyelGKuryt+Ws=
X-Received: by 2002:a25:6b4e:0:b0:6f9:91bd:c5de with SMTP id
 o14-20020a256b4e000000b006f991bdc5demr41309865ybm.497.1670982550268; Tue, 13
 Dec 2022 17:49:10 -0800 (PST)
MIME-Version: 1.0
References: <b2ada465-8eec-a7e3-0265-df9d0e8492d2@gmail.com>
In-Reply-To: <b2ada465-8eec-a7e3-0265-df9d0e8492d2@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 13 Dec 2022 17:48:59 -0800
Message-ID: <CAMo8Bf+8Bn7pNNbBbXgphfe41Kxx7cHb9LTtBexy15mpL8hKuw@mail.gmail.com>
Subject: Re: [PATCH] arch: change variable types to match those of what is
 assigned to them
To: Seija Kijin <doremylover123@gmail.com>
Cc: sstabellini@kernel.org, tsbogend@alpha.franken.de, chris@zankel.net, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Seija,

On Tue, Dec 13, 2022 at 4:51 PM Seija Kijin <doremylover123@gmail.com> wrote:
>
> There are many places where "int len = strlen(foo);" is written, just for len to be passed as a parameter of size_t.

[...]

> diff --git a/arch/xtensa/platforms/iss/console.c b/arch/xtensa/platforms/iss/console.c
> index 10b79d3c74e0..3159917ffd2f 100644
> --- a/arch/xtensa/platforms/iss/console.c
> +++ b/arch/xtensa/platforms/iss/console.c
> @@ -64,7 +64,7 @@ static int rs_write(struct tty_struct * tty,
>   static void rs_poll(struct timer_list *unused)
>   {
>       struct tty_port *port = &serial_port;
> -    int i = 0;
> +    size_t i = 0;

This is not what happens here at all.

-- 
Thanks.
-- Max

