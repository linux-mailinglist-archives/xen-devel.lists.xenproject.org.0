Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CFE828D3A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 20:19:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664923.1035057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNHdL-0003at-GK; Tue, 09 Jan 2024 19:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664923.1035057; Tue, 09 Jan 2024 19:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNHdL-0003YE-DJ; Tue, 09 Jan 2024 19:19:31 +0000
Received: by outflank-mailman (input) for mailman id 664923;
 Tue, 09 Jan 2024 19:19:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNHdK-0003Y8-FR
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 19:19:30 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0211845b-af24-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 20:19:28 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5537dd673e5so2848266a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 11:19:28 -0800 (PST)
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
X-Inumbo-ID: 0211845b-af24-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704827968; x=1705432768; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gy/j+RRXODkGHLfjKG7cyx2aYViX/Dhfxb0YeAQNk8Y=;
        b=B28gJm4aNYs7AXJWzHDPHMB3/bnyWs6JMS9SNUmdLy5bx7GSa13H8psb254P07RleP
         HjAPGb4a6j+1iPl4JXq8fGJ472VqEJxcT7iE3XhZuTCUu6hI6XJbhBCNQ/aW8Uc6mhv1
         rYxfRqqi9dcTiiaYsnTnFFDzjfFPoIIb36JNr952h/XLyllFEl74OUn/9DJm6sINw64w
         3dpR/OvqBoFPBykGLp1GGDNDMg70bTLyUrFFscyXkE1baorj2C35bfWZSLeFoQgBf++v
         x4N2ZWtuc9EzUIKUpVr6yVOtWmnj5BYeW8l4KYfvlGG/n+bhaa7uRLB1A1UJ+QPgYp8R
         cqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704827968; x=1705432768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gy/j+RRXODkGHLfjKG7cyx2aYViX/Dhfxb0YeAQNk8Y=;
        b=k++PSrqNu8Cp1Q8KZJJIlrpx6EVGuANNvQKud4N38+L7mL9QHaHGYZZ2CJr004l98w
         w6QwTByISJ3ZUCqRAHTSJqSHV4QwZLsnvK/gNSWFqM8EcxdBk1rBqeZ9bQRa9EpCHlk9
         q/l/eD8PyneA7RdaE7TWuYuQC4+zZ2Ehzg8Qh9sEOHyQtw3lLlsU3xl+5Tj06qetH7Xl
         YVSCab17/wxdl/+2MmKMG3Ohhqownro+V4BzwWTaIf1WbOTeHQEY2xvwOwWc29i33n5V
         R7i6uHZqPzNHiL5YHIdz0QtfZRNMreZyJQMTjIaoKqCDSVIGlUlRzyRfUdC50fQQkrP6
         lA3g==
X-Gm-Message-State: AOJu0YztGGfR74LafpRd5k1FjfWuQtvE94fSKSAr+yMJ2N1FhMZqP4ga
	gWdCBbFEW6z+HmfosKqhdZEa/yFSV5YRh6DwfXY=
X-Google-Smtp-Source: AGHT+IGAnZXWhzF7k1h8I6pQ9xItPQEuUnnzaE9ii3SwR6oUdVB77/fEuheJznS5NFZucCBXvge5rFpbDwmQxiIv198=
X-Received: by 2002:a50:955c:0:b0:553:ad79:b7cb with SMTP id
 v28-20020a50955c000000b00553ad79b7cbmr3169209eda.3.1704827967756; Tue, 09 Jan
 2024 11:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-10-jgross@suse.com>
In-Reply-To: <20240104090055.27323-10-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 9 Jan 2024 14:19:15 -0500
Message-ID: <CAKf6xpu-P5pmL6Nk2Zvu3Va1fgzTUPnTgrdk0wgszAb3WoBgtg@mail.gmail.com>
Subject: Re: [PATCH v3 09/33] tools/xenlogd: add 9pfs walk request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:10=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the walk request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

With one minor comment.

> +    path =3D calloc(path_len + 1, 1);
> +    if ( !path )
> +    {
> +        p9_error(ring, hdr->tag, ENOMEM);
> +        goto out;
> +    }
> +    strcpy(path, fidp->path);
> +
> +    if ( n_names )
> +    {
> +        qids =3D calloc(n_names, sizeof(*qids));
> +        if ( !qids )
> +        {
> +            p9_error(ring, hdr->tag, ENOMEM);
> +            goto out;
> +        }
> +        for ( i =3D 0; i < n_names; i++ )
> +        {
> +            if (strcmp(path, "/"))
> +                strcat(path, "/");

strcmp() can only return 0 on the first iteration, so it seems
inefficient to have it inside this loop.  But the added complexity to
avoid calling it doesn't seem worthwhile.

> +            strcat(path, ring->str + names[i]);
> +            ret =3D fill_qid(device, path, qids + i, NULL);
> +            if ( ret )
> +            {
> +                if ( !walked )
> +                {
> +                    p9_error(ring, hdr->tag, errno);
> +                    goto out;
> +                }
> +                break;
> +            }
> +            walked++;
> +        }
> +    }

