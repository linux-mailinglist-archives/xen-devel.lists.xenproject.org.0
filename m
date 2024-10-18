Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA099A37BD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 09:56:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821650.1235563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1hpd-0007Jh-Gp; Fri, 18 Oct 2024 07:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821650.1235563; Fri, 18 Oct 2024 07:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1hpd-0007Hp-EJ; Fri, 18 Oct 2024 07:55:33 +0000
Received: by outflank-mailman (input) for mailman id 821650;
 Fri, 18 Oct 2024 07:55:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+xU=RO=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1t1hpc-0007Hj-DC
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 07:55:32 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58e3a3bd-8d26-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 09:55:31 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a0472306cso229893966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 00:55:31 -0700 (PDT)
Received: from smtpclient.apple ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a68bf7194sm58799166b.184.2024.10.18.00.55.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Oct 2024 00:55:30 -0700 (PDT)
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
X-Inumbo-ID: 58e3a3bd-8d26-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729238131; x=1729842931; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OmCAW04F+XNRYTouUorOSGcUl6M9+czQrDiQWyjOlY=;
        b=Cp8gq6MnnPITx+cAQf6DZYKKkLwTnrx5gY6gbYrdy/KvQkFP2IPBorepJHi8Pjz7k2
         abAsr3L71S2cy4u4ND3kfq/ydvR+N+3fFZGyKpUPysC2Odx1ZpuryeEB5YEJOqk6QsOg
         7b6Qv7d+X7JcjsinZ0r6bNoEi1N1xY8IONX7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729238131; x=1729842931;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OmCAW04F+XNRYTouUorOSGcUl6M9+czQrDiQWyjOlY=;
        b=Ms+V9EUZ/GkT+bh5v87SoPSfZ/55MlBzYZht9auMbf8dCc0jQbGA8t8Da+f8F7S/Pw
         Nq3LAzWspgOQxQFjN/+5DetXQobbyE8IqHWUzZXYc8VPknG3UmC4+W30SVd6uMzXl31c
         7etIHlovUfoHKhcib5kXliEKLmJtmeZAPdEXvyrPK9kfJFh4Bh2lpe6XVMceRQg/raqn
         xzVF8XB4QpnnBaqQdcRvUrwSsoypBYJBGfp+VL4I/qNTSVf4LBtRO6uNl2wNgna2dXh3
         XevGXgkxxhGCNXR0gkVqnfoZ+77XYIV7j6dj3gaNCuy15PpiKD2kG6HdmHdnT7m+tNKg
         mKcQ==
X-Gm-Message-State: AOJu0YwIql1hLbhIU+YEegKsil52BXXkX53eVRPddrpD5rMJC+F58/Tg
	5ZGpWfKo2MgVDrKJSB97CAOTJ6Y4XqcXeWw+2YzMrJN9W5XOmvS5YcBfbUg3ATE=
X-Google-Smtp-Source: AGHT+IFHgbpwzSldzxWVTO5CihohsLlb/4f8FglcyqkoSI86XItCVdyH/g8lj9p4N/o4AIU69UNU2A==
X-Received: by 2002:a17:907:1c1e:b0:a9a:294:cb30 with SMTP id a640c23a62f3a-a9a69a75013mr104115966b.16.1729238130680;
        Fri, 18 Oct 2024 00:55:30 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [XEN PATCH v1 2/3] ocaml/libs: Fill build failure due to unused
 variable in ocaml macro
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <a2fb569d-4314-4d0e-b288-8891d8848d24@citrix.com>
Date: Fri, 18 Oct 2024 08:55:18 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrii Sultanov <andrii.sultanov@cloud.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <638CD86D-09F4-4706-95CF-71B2E2971E25@cloud.com>
References: <cover.1729170005.git.javi.merino@cloud.com>
 <d6b98ca75017bf4aa72a69468321705263e66f30.1729170005.git.javi.merino@cloud.com>
 <a2fb569d-4314-4d0e-b288-8891d8848d24@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Javi Merino <javi.merino@cloud.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 17 Oct 2024, at 18:47, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
>=20
> So, I think this is a better fix:
>=20
> @@ -69,6 +69,7 @@ static void Noreturn xsd_glue_failwith(
>         free(str);
> =20
>         caml_raise_with_arg(*caml_named_value("xsg.error_v1"), msg);
> +       CAMLnoreturn;
>  }
>  #define xsd_glue_failwith(xch) xsd_glue_failwith(xch, __func__, =
__LINE__)
> =20
> and F40 seem happy with the result.

Acked-by: Christian Lindig <christian.lindig@cloud.com>


I like the effort to remove warnings.

=E2=80=94 C=

