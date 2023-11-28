Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F687FBD10
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 15:45:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643262.1003263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7zKm-00021Z-DQ; Tue, 28 Nov 2023 14:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643262.1003263; Tue, 28 Nov 2023 14:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7zKm-0001yl-An; Tue, 28 Nov 2023 14:45:08 +0000
Received: by outflank-mailman (input) for mailman id 643262;
 Tue, 28 Nov 2023 14:45:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C3UE=HJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7zKk-0001yZ-Fj
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 14:45:06 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b82ea506-8dfc-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 15:45:05 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50bbc36f767so892534e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 06:45:05 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c37-20020a05651223a500b0050aa6bdd12esm1859625lfv.6.2023.11.28.06.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 06:45:04 -0800 (PST)
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
X-Inumbo-ID: b82ea506-8dfc-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701182705; x=1701787505; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KfGd4ab310AsxiKSY3TXfdDWoTTuBnt+9aGFV/fwthQ=;
        b=K5vgEC0aFsezCakvMv/jyjECusAFvfboN0edakOcQZB0GT5r+mGY4Qy9MLBYIOiz/8
         qQKXJNtfNebqmmJkK0u7d5K3W4G2ImhdD+grDl4ehFomjLIbb/AZgYIgCGV1nJVav8an
         f+QZi5SzSKwUTIeud2+X3a7yceUx6f4TiM8Dcp9Kkb+sj5+jHD5g9AuaMgMdT/9SLDRy
         8X2neaFm6NFZKFPtZhWDm1NYITpWEfrAjdKDuxfa/0edUGqBvoZkG74JQnz+wJTBnbMv
         fuTdsh3YLmzVdCCgHCZ/p4KOqUI1bD6HNY1v8g6es3z9qo2Yp2o2D0sUVjc4wE4sjxX4
         +Lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701182705; x=1701787505;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KfGd4ab310AsxiKSY3TXfdDWoTTuBnt+9aGFV/fwthQ=;
        b=X6BHJyKEQtm2e6MhrxYgODXFTY+n3M9W5xLURM2iSfBpY2XiPNP3msK1RY6fMzX7kW
         K4ezQoRcTahZZS0cTQvatbcmuj8jJsO0sIov3whxivlAYfvpt8f6H1U9lCD6orE/IxJW
         leFtVV/072a710Anoe93jWAqPbEmDfIn/NZD1NzKcF4jCcB6Xzne/GbXJezWvMymgLMf
         ik4qf3APFknts/iUbB3Tifd56fZIJkPzEoZM44dO+ViLnWCz/W6uv83xCuKWBnFl2flH
         IpJ9rHkXjyXHmpy9IJwz3inG1ZRxBe1EKtVa3riWvqV/tu0cJLL6aTN5PA2I0aaS13dG
         nKrA==
X-Gm-Message-State: AOJu0YwlV9zASFi1plm665MUUDLLoephL1NbSErhWMaglXVbbs6fHLgy
	iBJrDJARcuZgSViWfpAYtL8=
X-Google-Smtp-Source: AGHT+IEHFSrGMKpQmty4/o/U1cd110W7l4wI2z4IPM1+ppx0fBqWiclq0BgReY29Fs9WhO6LTBP4AQ==
X-Received: by 2002:ac2:55b9:0:b0:50b:bfc2:7912 with SMTP id y25-20020ac255b9000000b0050bbfc27912mr742519lfg.34.1701182704948;
        Tue, 28 Nov 2023 06:45:04 -0800 (PST)
Message-ID: <c594af5abe74f85a37b05ef9030e6361dfb3b67f.camel@gmail.com>
Subject: Re: [PATCH] .gitignore: generalize *.new
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Tue, 28 Nov 2023 16:45:03 +0200
In-Reply-To: <40438252-0d54-47f0-aad8-e76d57508bc5@suse.com>
References: <40438252-0d54-47f0-aad8-e76d57508bc5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

Hi Jan,

On Tue, 2023-11-28 at 13:51 +0100, Jan Beulich wrote:
> It's not only in xen/include/xen/ that we generate (intermediate)
> *.new
> files.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Really I don't think I can spot what *.new we create in that specific
> directory. xen/include/ certainly has some.
>=20
> --- a/.gitignore
> +++ b/.gitignore
> @@ -17,6 +17,7 @@
> =C2=A0*.so.[0-9]*
> =C2=A0*.bin
> =C2=A0*.bak
> +*.new
> =C2=A0*.tmp
> =C2=A0*.spot
> =C2=A0*.spit
> @@ -277,7 +278,6 @@
> =C2=A0xen/include/config/
> =C2=A0xen/include/generated/
> =C2=A0xen/include/public/public
> -xen/include/xen/*.new
> =C2=A0xen/include/xen/acm_policy.h
> =C2=A0xen/include/xen/compile.h
> =C2=A0xen/include/xen/hypercall-defs.h

I am happy with these changes.

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


