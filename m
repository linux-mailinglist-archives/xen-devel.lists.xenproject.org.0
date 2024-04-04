Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E3898C16
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 18:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700976.1094904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPxG-00062X-JX; Thu, 04 Apr 2024 16:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700976.1094904; Thu, 04 Apr 2024 16:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPxG-00060r-Gv; Thu, 04 Apr 2024 16:28:46 +0000
Received: by outflank-mailman (input) for mailman id 700976;
 Thu, 04 Apr 2024 16:28:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LwOm=LJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rsPxE-00060l-PS
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 16:28:44 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 670b1568-f2a0-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 18:28:43 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-516c97ddcd1so1164155e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 09:28:43 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f21-20020ac251b5000000b00516d2184388sm41484lfk.177.2024.04.04.09.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 09:28:42 -0700 (PDT)
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
X-Inumbo-ID: 670b1568-f2a0-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712248123; x=1712852923; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/hrLdDBDfokovgDCPPFYLacpfD+nXTpae+Ut4iBcWsM=;
        b=GYFshrhzDflB7V9xrS8iRFbpGF5C/Lfj7Pe+z8ef3IXNjOT2qNiM7jQTI83J5VOvdT
         yTnjrBequ6Yt/4TSPYb2D/eFApiftlYZPMjqH1YTSzVdjoepOUiwmadsqR3mWfiLG4Ds
         nRcmypOyaVCfKzVZxy39nEQJ5XbNFtT7ER4D5uoW8T2gwu258aqajYa3YE8bUjkl9WF0
         pdgriKp9jlzbg5IWSnjFyNAHGPa6giYCCV2JxVEVaPJ7AtdpiQCGvp5gvXHmkmhU24P8
         wDFSfS6B4wqVNjM6Eied/QqMS17j6GslSBTJpUir/F4jw0Z+xOy4TGZY23YkAPnlun2O
         UDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712248123; x=1712852923;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hrLdDBDfokovgDCPPFYLacpfD+nXTpae+Ut4iBcWsM=;
        b=Zt6D1GgksZeFvj1+bwFrO4rCgofVd9lpH8/VP853bVaItpXo30MXaxbQTanOCV+V7d
         UDdqC100bpdQGJs3JtVEssepGFV754odRG2tVil1VRTECKg4+7LGjrUekjbWjcSxCBzN
         OY8eycZ+J2tk3ldAg7yxiHGybKr1kb1UJYZLiHs4LrPG/mkFzN//x2XzKMvIp9kEDQzL
         kaZfMyLxOPlS2yPbyQ9BBdGhXxS2ZY/Nm1iWPNoRzi/fuG+IQbmf6nNi0PCxuPXPctU8
         92tidpxKE+n+eKitkXnnOTEOXLHyHSYujONMdSzko92cyg8x0cjIy+6NNfXs7+di3+LQ
         Y8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkSceh516zKs0yYcPELaM8NreqV3EZTwsz5XVusvgrCnEDW26RfNgY/Wjl9RcZ7M/Yj4t/xrAOTSdE1syV+Nsnt4jDO9+kF72Mbw2egP4=
X-Gm-Message-State: AOJu0Yz+SeGS9gzs608mlpwViXSAQugtVGoTkEZsP4YRgMOKY0z7Qx9j
	cuAZu2qZ9EGSLGLjXPuSL5VbRDask33NafSStUxhci77erxmmAvC
X-Google-Smtp-Source: AGHT+IFKSO/IhKaCIeeQIxMzEP3LTYGmIk4il8HQuvKpVyUGvIDiTOVhrFAOw4vPm/P67dB2NrZIeQ==
X-Received: by 2002:ac2:5150:0:b0:516:a32e:ab54 with SMTP id q16-20020ac25150000000b00516a32eab54mr1997759lfd.69.1712248122689;
        Thu, 04 Apr 2024 09:28:42 -0700 (PDT)
Message-ID: <a8103dfc03990a48054878bb78db90d3077881f9.camel@gmail.com>
Subject: Re: [PATCH v7 08/19] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 04 Apr 2024 18:28:41 +0200
In-Reply-To: <a315c515-8f6a-4222-999b-865f19e15a28@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <f0d836be5dbc04468a74cabf9b48a51921bf749b.1712137031.git.oleksii.kurochko@gmail.com>
	 <d315dda1-f89e-4028-9aa0-98b4e80c81fc@suse.com>
	 <0d09adbb0ac52e6e20252ddd6e599ee15030fad6.camel@gmail.com>
	 <a315c515-8f6a-4222-999b-865f19e15a28@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-04-04 at 18:14 +0200, Jan Beulich wrote:
> On 04.04.2024 18:04, Oleksii wrote:
> > On Thu, 2024-04-04 at 17:01 +0200, Jan Beulich wrote:
> > > On 03.04.2024 12:20, Oleksii Kurochko wrote:
> > > Everything else okay-ish to me now, but I can't very well given
> > > an
> > > ack for
> > > a patch depending on things that haven't been committed yet and
> > > may
> > > never be.
> > Except 3 dependency ( which should be dropped as nothing anymore is
> > used now from this headers ):
> > =C2=A0=C2=A0 #include <asm/fence.h>
> > =C2=A0=C2=A0 #include <asm/io.h>
> > =C2=A0=C2=A0 #include <asm/system.h>
> >=20
> > It seems everything else doesn't depending on other things, does
> > it?
>=20
> Didn't I see a STATIC_ASSERT_UNREACHABLE() somewhere?
Sure, forgot about this macros. In this case, I think it would be
better to return back:

   extern void __bad_{xchg,...)(...);
  =20
   ....
   default:
       __bad_xchg(ptr, size), ret =3D 0;

And do a follow-up patch when it will be committed.

~ Oleksii

