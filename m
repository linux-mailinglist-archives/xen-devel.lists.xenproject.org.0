Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983F890400D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 17:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738532.1145314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3U0-0008Rd-Jy; Tue, 11 Jun 2024 15:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738532.1145314; Tue, 11 Jun 2024 15:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3U0-0008Oh-HD; Tue, 11 Jun 2024 15:32:24 +0000
Received: by outflank-mailman (input) for mailman id 738532;
 Tue, 11 Jun 2024 15:32:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=887E=NN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sH3Ty-0008Oa-Nc
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 15:32:22 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cba51557-2807-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 17:32:21 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52bc29c79fdso4898539e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 08:32:21 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c899bd9d5sm1118642e87.257.2024.06.11.08.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 08:32:20 -0700 (PDT)
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
X-Inumbo-ID: cba51557-2807-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718119941; x=1718724741; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tpm0S6fj0bcy9G/8UXbYvcBQjs1Nke37QyJgI25AkUs=;
        b=gBelceU09e8LsQ5uTaBRI5kjPIu75UK4q7vmodXRV62dz4icMEkzNJBoHl1Co7F5sU
         PXrFHI/sB4JjbfVJHFNhP0hx4w1WmR3ks+2SY4zaG6vqsqCFrdJrsSTdT6EE4tQDXupV
         KAxQv/SxV/l86kdhVrqDq6MpVpJ952vJ5lzdaYJ+6hEW78OG3GxOkmPFgRD3b1i6z7Z6
         Ha7gctxFfeXU9mw3S47phZXKxS976ffMLXopg+Hf0MzKQkLbFImFu21SKgqFT4MuQ6de
         syJIzAtRfVv5isU+VozsHY/+P5s9K3ki78O/VCgVj4q6cu8BX3v+maEZ/U2+XNizkhKX
         GROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718119941; x=1718724741;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tpm0S6fj0bcy9G/8UXbYvcBQjs1Nke37QyJgI25AkUs=;
        b=L6L6qHnt1ZYMVP8mw3wkrJMB24OxdkFYxo3cZ1UfDqt278QdfpnIqvn+iLys9gRR3V
         MTp4r3JGmKLkJnNoudVRKFxnDpD+C49YAqN+oh8vTY29TeflSAc6hc4oPXUwYfxdBvba
         QGijZsXMYwqRxOOpzbTQ222Y9W+dTbH7q08OBaLOoQKsCT4hUlwdwN9kXW+xTdVq7oRz
         b4v7lPxUNdAwnPc/FUZm4Dwnec48LSxB7sjqF2OS8iOxXgPhVr+fiOR4K1s6cSLOvMBl
         QiSlHGaBErHJ4iXaaZD9DHBmHRQpW1kAbWs9CI8Rr1YJE2LG20PnW1+FMO0wfI+zLndQ
         3r0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHjzB+6aR+hsFcX1VJECwl/g4kpc8DEsC7uJw+KugaK4xCW/RF8aiakS92/RfsVhTWExwWtSTWf8mR6ILCukP40mMJBBwlwnMhzPCaYLs=
X-Gm-Message-State: AOJu0YynnK3YaxlcJZEjGo6y/EJeYm7aXulO4W9dLdEsH7m8yFf3iWvC
	rrjkIVqLfriTQlfBfS2Krr0phlxdHak6L/Bw8NGovPam+aF2f23X
X-Google-Smtp-Source: AGHT+IEcWsldpicF8KuMr4ItGuSVT86QYhc8Cl644vhCjir/Qm6lEIp3An4+X98cSiqe/apC2CBJrg==
X-Received: by 2002:a05:6512:404:b0:52b:8ad9:cf0a with SMTP id 2adb3069b0e04-52bb9fc5e89mr8513310e87.51.1718119941142;
        Tue, 11 Jun 2024 08:32:21 -0700 (PDT)
Message-ID: <50a2438030c160505603501044bc4045749a769c.camel@gmail.com>
Subject: Re: [PATCH for-4.19] CI: Update FreeBSD to 13.3
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	 <michal.orzel@amd.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>
Date: Tue, 11 Jun 2024 17:32:20 +0200
In-Reply-To: <20240611124701.802752-1-andrew.cooper3@citrix.com>
References: <20240611124701.802752-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-06-11 at 13:47 +0100, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Jan Beulich <JBeulich@suse.com>
>=20
> Updated run:
> =C2=A0 https://cirrus-ci.com/task/4903594304995328
>=20
> For 4.19, and for backporting to all trees including security trees.
> FreeBSD-13.2 isn't available any more:
> =C2=A0 https://cirrus-ci.com/task/4554831417835520
>=20
> causing build failures.
> ---
> =C2=A0.cirrus.yml | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/.cirrus.yml b/.cirrus.yml
> index d0a9021a77e4..c431d8d2447d 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -17,7 +17,7 @@ freebsd_template: &FREEBSD_TEMPLATE
> =C2=A0task:
> =C2=A0=C2=A0 name: 'FreeBSD 13'
> =C2=A0=C2=A0 freebsd_instance:
> -=C2=A0=C2=A0=C2=A0 image_family: freebsd-13-2
> +=C2=A0=C2=A0=C2=A0 image_family: freebsd-13-3
> =C2=A0=C2=A0 << : *FREEBSD_TEMPLATE
> =C2=A0
> =C2=A0task:
>=20
> base-commit: ea1cb444c28ce3ae7915d9c94c4344f4bf6d87d3


