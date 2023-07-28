Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9347676BE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 22:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571557.895705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTk2-00030k-DO; Fri, 28 Jul 2023 20:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571557.895705; Fri, 28 Jul 2023 20:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTk2-0002wx-Ae; Fri, 28 Jul 2023 20:07:14 +0000
Received: by outflank-mailman (input) for mailman id 571557;
 Fri, 28 Jul 2023 20:07:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0rLm=DO=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1qPTk0-0002wr-Me
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 20:07:12 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5579f8b1-2d82-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 22:07:10 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbab0d0b88so25713155e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 13:07:09 -0700 (PDT)
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
X-Inumbo-ID: 5579f8b1-2d82-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1690574829; x=1691179629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8kBW59IIrbLMgwPiVreMk5VUmZXeMXnwXr5avrfQTw=;
        b=IiWNBkM6vEFPcPhh73VtL6nRJlL5auk4PsNvgGu5N0q8LxIVNno3Ga8RGF3GbB1nvw
         Zduu8ob/gg0lVtTeqocZqxwF+7pAPsSQ8NM1zUTkJJ7T06FrhPJwV7cCpymVav0iHo41
         CfIoE6U1TIOwFty0o5+VIywXCI+TFR9pySfGwqn9EY77s6DCkEWvvY54ZIsSTPq3S9Wl
         fPEJI8rCcAh9cXqFfQ8xT8f3CwSytxjqUxsF1RRpGZaaQITouJppXWyy/gzbfHAozlHJ
         QouaoTKl+z1Jky0MDJTFMSSSvBJEk2iYTB1HGKJyqkpD4IINjT5sChGVb7k10oAoEsyk
         52sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690574829; x=1691179629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8kBW59IIrbLMgwPiVreMk5VUmZXeMXnwXr5avrfQTw=;
        b=ON860sqnlnn4Ez9sHP7kKDpa80lLUONFtlaJnwqyavjDiLQD4MhTO3oOv4uov6e3m9
         4kIOI3UvywlaBYoc8GoNaQxJrZnu2/vPciat9P4jy+w4GB7tsvuLZS5Rtm2deo/0ZBTk
         DPyccnpXEVL0nQ964pDyr//ulZzZxTKpupDx0SwjB0wU91uWj7LMoCdRGU3/OJ3iSi7q
         bzShq007OUZhFiwetF7Er/eenBNJXwDk/lbEv5dgbkmn8AOY3Iy5RMYPPwpWWUw3es8C
         m4NkmExppWdC4P2BThjs5bGtbqtkLTXRshCikSqd4MKLbPiy065f84Nx552zKpwsPbuV
         IP/w==
X-Gm-Message-State: ABy/qLbA6XrHh4Z/snCwMVm19br4nw6HvlgvifncjsdhLY8JXWsAdpBh
	HPK0eteAzfhFfABPob1+p4Hq4RRR0UrrFXqKzqA7wtdv
X-Google-Smtp-Source: APBJJlGbfEczlGplmMMyeNCLUD3nRqClyRJhc6Wg83RLs/1zxkNtijHO2vt3XTG5NvOC0DHLHj+W+FwjWwfZ7GEa4aM=
X-Received: by 2002:a5d:4cc3:0:b0:317:52ba:81f2 with SMTP id
 c3-20020a5d4cc3000000b0031752ba81f2mr4681717wrt.16.1690574829219; Fri, 28 Jul
 2023 13:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230601142742.15489-1-olaf@aepfle.de> <20230601142742.15489-2-olaf@aepfle.de>
In-Reply-To: <20230601142742.15489-2-olaf@aepfle.de>
From: George Dunlap <dunlapg@umich.edu>
Date: Fri, 28 Jul 2023 21:06:58 +0100
Message-ID: <CAFLBxZZJzLNNGVtGYjB+aYuwtSc+ucOzTk7eAn1z-TpxMsJ2Vg@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] xentrace: remove unimplemented option from man page
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="00000000000029741a060191a008"

--00000000000029741a060191a008
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 3:28=E2=80=AFPM Olaf Hering <olaf@aepfle.de> wrote:

> The documented option --usage worked because every unknown option
> showed the help.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

--00000000000029741a060191a008
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 1, 2023 at 3:28=E2=80=AFP=
M Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de">olaf@aepfle.de</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The docum=
ented option --usage worked because every unknown option<br>
showed the help.<br>
<br>
Signed-off-by: Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de" target=3D"=
_blank">olaf@aepfle.de</a>&gt;<br></blockquote><div><br></div><div>Reviewed=
-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.du=
nlap@cloud.com</a>&gt;</div><div>=C2=A0</div></div></div>

--00000000000029741a060191a008--

