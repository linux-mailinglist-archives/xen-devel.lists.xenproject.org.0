Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D1E9C854F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 09:53:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836081.1251952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVaX-00012x-4o; Thu, 14 Nov 2024 08:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836081.1251952; Thu, 14 Nov 2024 08:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVaX-00010k-26; Thu, 14 Nov 2024 08:52:29 +0000
Received: by outflank-mailman (input) for mailman id 836081;
 Thu, 14 Nov 2024 08:52:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Deeb=SJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBVaU-00010e-VE
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 08:52:27 +0000
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [2607:f8b0:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c38af9db-a265-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 09:52:23 +0100 (CET)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-718065d6364so174862a34.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 00:52:23 -0800 (PST)
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
X-Inumbo-ID: c38af9db-a265-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjozMjkiLCJoZWxvIjoibWFpbC1vdDEteDMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMzOGFmOWRiLWEyNjUtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTc0MzQzLjc1NzI4OSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731574342; x=1732179142; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FY5vudhcS/wmwWrySd0bdenvV2M8hGnY9coczwzn4CQ=;
        b=ZGruRqRULN2cs8FbhJZ+5Yt0TVKaqagp0NyBW0pSiWq92XLEf64Fdt08AjJLLAy36U
         wF65BzNTICU2tTjBkHF9R6yDCTClqBsvGhRfWU/GvF21gF75JuC7eEWlSQgWNP2H3Eil
         072C7Q4wb/6GVSD2xisRgNXdxe3nrXjODfEzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731574342; x=1732179142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FY5vudhcS/wmwWrySd0bdenvV2M8hGnY9coczwzn4CQ=;
        b=FMb3gvS+OZ2hVzc9KFg73NP7BVzFHuSiwF3891Bk81Ne9gMuE+HvN+g16/rGQzqEPx
         xx69aDK9WwHKCUsflTr1+eFTArE2WifDXHfA1l/xudKVL0TcEgr7JaS5I7J6+sHBvher
         Vmh3tOJ5B/QBxzqg3UNkeJTsDwywadF85sehTXpzww8I/nzJ3iRfi5hxQkmS2OMI+fxW
         iwueD5Ww3SR8dHrQBu2JGKLOOazwJUMb89MCYx/HoHHplFq8hGpm2jed4IKGAADBeXt3
         Rk94Q4jvpLdhd1rg56wesl2XvO6N8a8fbMY5bGGU+JYYsWymvwm1ddh8zkjqPJCGvU8D
         W96g==
X-Gm-Message-State: AOJu0Yxu7mJcRYwUJjmfDncRqb7lbIAq7RLrieCA0ImXkven9Bn4nzHx
	r0w7eCX3mWwyIuCwyI5CASBi8fSAPf0+ufykQ1q0QRoGkrZ88z9QC41nwQZYcP6F8PKaGxe1syy
	v0QNSJbLCWbQvz7Ndi55dcGRLlGjYH7SRr3vNfw==
X-Google-Smtp-Source: AGHT+IHAaZji3fNHi8vzgB6Gfv/SihFTsSgrCNz3wrMpEHT8shDvA6KMR+x5PjJQvEvNJ9gE/hTctSv6ObNiYHOIAkA=
X-Received: by 2002:a05:6830:600b:b0:715:10d4:b06e with SMTP id
 46e09a7af769-71a6e44964cmr1604056a34.9.1731574342266; Thu, 14 Nov 2024
 00:52:22 -0800 (PST)
MIME-Version: 1.0
References: <20241113164844.1750237-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241113164844.1750237-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 14 Nov 2024 08:52:11 +0000
Message-ID: <CACHz=Zjxx-TvLiDWXqzwO3Amr69KYzfQU3e5GXVZXEZyiKBN7g@mail.gmail.com>
Subject: Re: [PATCH] xen/earlycpio: Fix header to be standalone
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 4:49=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> Split out of yet-more microcode cleanup work.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/include/xen/earlycpio.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/include/xen/earlycpio.h b/xen/include/xen/earlycpio.h
> index d4992035982d..b1dafc3b0b75 100644
> --- a/xen/include/xen/earlycpio.h
> +++ b/xen/include/xen/earlycpio.h
> @@ -1,6 +1,8 @@
>  #ifndef _EARLYCPIO_H
>  #define _EARLYCPIO_H
>
> +#include <xen/types.h>
> +
>  #define MAX_CPIO_FILE_NAME 18
>
>  struct cpio_data {
>
> base-commit: 38febce5b35a7a4391906499b2046f01ec0129ca

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

