Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC55F6BBA80
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 18:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510147.787342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcUba-00025U-GA; Wed, 15 Mar 2023 17:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510147.787342; Wed, 15 Mar 2023 17:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcUba-000229-CH; Wed, 15 Mar 2023 17:08:02 +0000
Received: by outflank-mailman (input) for mailman id 510147;
 Wed, 15 Mar 2023 17:08:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmeT=7H=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pcUbY-000223-W6
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 17:08:01 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eea0c342-c353-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 18:07:57 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id f18so25194594lfa.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Mar 2023 10:07:57 -0700 (PDT)
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
X-Inumbo-ID: eea0c342-c353-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1678900077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=82bf4OTlxoiPDUb/FMPDY4R5Ptwkv1SXhg1Gpvbt0ZM=;
        b=OxXveYeAu1sX7EjOn1jgmWWBLDzrNtXuRi/d/BwrMKlhKrPR29qEUUMJkEMrd4fJ9g
         uvr53FZMcn6D5Qgq+3vovGUUXQQazLxIAgQBKDvmEZynmoReO6L5O9GDLlJSxqxqaj6v
         Jz+lRmS/pIPBPU6vtYnNmza2AWcTS9WilkfsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678900077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82bf4OTlxoiPDUb/FMPDY4R5Ptwkv1SXhg1Gpvbt0ZM=;
        b=Yxb2+VKRK//szcEJ1lfpqKDRpph9u1JxsJNGOX2UtUM83mKrwpUIUjy6lZuB3pGXQM
         tJ6o3PUY8A+PlhPUy/x6IAXvbaEWb6I2yEkTTgy82CjwD2lXawXgFdhxqrno5mCmnRzS
         dVMpKZHRLSigDsjZfkgTgG5pavOF3EguxGIFu35MpHGnik3x+ojz6rICKkmk+2gehNOK
         KtOFlnYUM2GwI5ajhWnhgPIKPOEqHXwTxb8Hyqyt/XgHGV8B2127bwrCcEO8+FexBAse
         mwvjh0GvfW8vdno9K8xPsglbGjF7m2LIU8xO8q23jbAR+JFja1qXtKsS4sdKUjSRTp3J
         0PEQ==
X-Gm-Message-State: AO0yUKU7MCBm8Xm6i1IzPJ8L5Arm4dqUDVd3qO9jU/NKVGS9QeTBxmBL
	9tKReu9ohW5tyY0sZ3drv8KWOsipMp5IFh0BbtxYOQ==
X-Google-Smtp-Source: AK7set96McqJA6QKjsc5k6J2dNPd7jlNrDjATfqvEgBhPpjonsfYcxdXFPxnEQpVon/tZttceFz5gr8WR2Mzty9sxAw=
X-Received: by 2002:ac2:4c08:0:b0:4db:266c:4337 with SMTP id
 t8-20020ac24c08000000b004db266c4337mr2231682lfq.1.1678900076793; Wed, 15 Mar
 2023 10:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230315090558.731029-1-luca.fancellu@arm.com> <20230315090558.731029-10-luca.fancellu@arm.com>
In-Reply-To: <20230315090558.731029-10-luca.fancellu@arm.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 15 Mar 2023 17:07:45 +0000
Message-ID: <CA+zSX=aMHBkj=AKRjcLjVehPho3cBEoMnntGG32=CDQBu35WdA@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] xen/tools: add sve parameter in XL configuration
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, 
	Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="000000000000b0eab205f6f36256"

--000000000000b0eab205f6f36256
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 9:06=E2=80=AFAM Luca Fancellu <luca.fancellu@arm.co=
m> wrote:

> Add sve parameter in XL configuration to allow guests to use
> SVE feature.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>

Golang bits:

Acked-by: George Dunlap <george.dunlap@cloud.com>

And you can retain the ack as long as nothing dramatic changes.

>
>

--000000000000b0eab205f6f36256
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 15, 2023 at 9:06=E2=80=AF=
AM Luca Fancellu &lt;<a href=3D"mailto:luca.fancellu@arm.com">luca.fancellu=
@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Add sve parameter in XL configuration to allow guests to use<br>
SVE feature.<br>
<br>
Signed-off-by: Luca Fancellu &lt;<a href=3D"mailto:luca.fancellu@arm.com" t=
arget=3D"_blank">luca.fancellu@arm.com</a>&gt;<br></blockquote><div><br></d=
iv><div>Golang bits:</div><div><br></div><div>Acked-by: George Dunlap &lt;<=
a href=3D"mailto:george.dunlap@cloud.com">george.dunlap@cloud.com</a>&gt;</=
div><div><br></div><div>And you can retain the ack as long as nothing drama=
tic changes.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
</blockquote></div></div>

--000000000000b0eab205f6f36256--

