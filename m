Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6EA907553
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 16:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740031.1147028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHlb6-0007Pp-9K; Thu, 13 Jun 2024 14:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740031.1147028; Thu, 13 Jun 2024 14:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHlb6-0007Na-6U; Thu, 13 Jun 2024 14:38:40 +0000
Received: by outflank-mailman (input) for mailman id 740031;
 Thu, 13 Jun 2024 14:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g45b=NP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sHlb5-0007NU-3d
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 14:38:39 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9efd71fc-2992-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 16:38:38 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52c7f7fdd24so1586263e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 07:38:38 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287b357sm216038e87.236.2024.06.13.07.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 07:38:37 -0700 (PDT)
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
X-Inumbo-ID: 9efd71fc-2992-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718289518; x=1718894318; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=crUZ8CcQxQzcWTke0O5S4Uk6BJ9qzUN61uNds8btAd4=;
        b=lck/4HtcmHjZJZ4keSY8eHFFJpKDzgIeCDA7kXm8SYuh+E17Am7uZ8Ug/CHqiUezX0
         p0anOn8bjfRkI6VI1BtnMYnVtTgDzOEhET12mC+FbTz1oKkF7sZ/bBeGvEekosqjhLkF
         lHQ4Nu5zKcRL4tBHpyz9ohZMGQsSsM/JygY2/nJ/mBYKfumOepSTtOPZ07f6zOchs6Yt
         OV9IV4s2xRcEyjt69uobWTEzszGRmEOqmTVNtyPmt0bnVQ2aOqof70HlvGpjWYTMv6LT
         x5oCRT+WaDTR8hIcnJDbE4RwVBXCm95FTzymhF3tWePgchwat3uOIIgOE9wXOJAV9vW2
         G4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718289518; x=1718894318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=crUZ8CcQxQzcWTke0O5S4Uk6BJ9qzUN61uNds8btAd4=;
        b=GUPKsCpIGa1uvoJt0XnLkmzRFGwSCNKJgvlcul5nU9xksXBMT8pbtI+9CVzeMc7CUD
         qlJnldiz9KYJXe9JwZ95F8AHVV14oCmx+gH33tfU2ZWzbq/z8iuaJQFPqzy05SRAQEnz
         uSX9EgANse0R28jLb46sBf3wXGtYiB3w0DLnpVSxOwp13ruy3smGgWlIYUAj21+qWK+f
         h3DXtbdSem08k/pd2RzO9MFJTnuYZ1IfHycZQAN2NCveFbF/NngE/YuB3zvmEErDLZEI
         wAicJSoncT1GExxSIy100D6oQyfMRJxYfo5iaWyfTReRAiBh4DQ6NmeskDiCFEYMyRgL
         VSHw==
X-Forwarded-Encrypted: i=1; AJvYcCXHcS500dwXn3lb2UPPw8+BH22JFuytZHz/SeQpb8qEewjMoo0fzrUQ3FR06bHvC5HC30GEsWCB6LJ66f08lHOY3TQzintG5Mt4h+GiXiQ=
X-Gm-Message-State: AOJu0YyYPX8bjdK9702m1PPsEu6+iKb0ITyKGVxdR+MzESdcTcW5bVJt
	ZuCgFAnFDz2JufMcJ7RYWsrEqDXpi+84/VqADSXC9v81VIcen6n5
X-Google-Smtp-Source: AGHT+IG2JjFHDFkzX9vDpnk8HmkuybuIJTpYDm+aVb4jtILI5VGl98+ujPeuD7SMJJHA+gG+g0q82g==
X-Received: by 2002:a05:6512:131f:b0:52b:bee0:54b0 with SMTP id 2adb3069b0e04-52c9a3fd79dmr3599028e87.54.1718289517402;
        Thu, 13 Jun 2024 07:38:37 -0700 (PDT)
Message-ID: <39ecc9a67a2d71a4f97b80c97b7505664411046f.camel@gmail.com>
Subject: Re: [PATCH v2 for-4.19 1/3] x86/EPT: correct special page checking
 in epte_get_entry_emt()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Date: Thu, 13 Jun 2024 16:38:36 +0200
In-Reply-To: <175df1a2-a95f-462b-ad49-3a0fef727658@suse.com>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
	 <175df1a2-a95f-462b-ad49-3a0fef727658@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-06-12 at 15:16 +0200, Jan Beulich wrote:
> mfn_valid() granularity is (currently) 256Mb. Therefore the start of
> a
> 1Gb page passing the test doesn't necessarily mean all parts of such
> a
> range would also pass. Yet using the result of mfn_to_page() on an
> MFN
> which doesn't pass mfn_valid() checking is liable to result in a
> crash
> (the invocation of mfn_to_page() alone is presumably "just" UB in
> such a
> case).
>=20
> Fixes: ca24b2ffdbd9 ("x86/hvm: set 'ipat' in EPT for special pages")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
> ---
> Of course we could leverage mfn_valid() granularity here to do an
> increment by more than 1 if mfn_valid() returned false. Yet doing so
> likely would want a suitable helper to be introduced first, rather
> than
> open-coding such logic here.
> ---
> v2: New.
>=20
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -519,8 +519,12 @@ int epte_get_entry_emt(struct domain *d,
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 for ( special_pgs =3D i =3D 0; i < (1ul << order=
); i++ )
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( is_special_page(mfn_to_p=
age(mfn_add(mfn, i))) )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t cur =3D mfn_add(mfn, i)=
;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( mfn_valid(cur) && is_spe=
cial_page(mfn_to_page(cur)) )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
special_pgs++;
> +=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( special_pgs )
> =C2=A0=C2=A0=C2=A0=C2=A0 {
>=20


