Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C1772FBEC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 13:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548719.856814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9OKk-0003g4-LO; Wed, 14 Jun 2023 11:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548719.856814; Wed, 14 Jun 2023 11:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9OKk-0003dr-Ic; Wed, 14 Jun 2023 11:06:38 +0000
Received: by outflank-mailman (input) for mailman id 548719;
 Wed, 14 Jun 2023 11:06:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRK2=CC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q9OKj-0003dl-BA
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 11:06:37 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8770a254-0aa3-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 13:06:36 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f6170b1486so8012762e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 04:06:36 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w23-20020ac254b7000000b004f60be0c687sm2090810lfk.122.2023.06.14.04.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 04:06:35 -0700 (PDT)
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
X-Inumbo-ID: 8770a254-0aa3-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686740796; x=1689332796;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4j9jjeC9kYwcknimJac8/V/j04DKwIARrhyBUvrUV3I=;
        b=Va9WdYPCnog5TUtGvtv3fE+o6yJYrhFWFwV0dW2qzBxiC9CKuipguPPkeMK5JNkmJj
         GwgDOdF0MWI3O4bdZ5vMNh90DBjnG1gmIxcU4UWgRazrNBOFzRKI5bx1ra2vGaSni+Lg
         K3g1oXY61RJea17iQ+OsHKfcdVs0TDhyYjEMXeboqCFLD0T79CV0ReTS/OxuSABRd0VW
         7hVm1RyV1mRss55fd3OJaYltB+qbWk82D8e/IZsQ1tu1ZRcit1Wtn2W0jYI2UEee60ph
         GdcMdQypYhZ02bO1uRM0LNKHBHWLgB2trZzEzRnG1gd1/FUYA0PtfnRE4FFsa/dwv0C1
         EQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686740796; x=1689332796;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4j9jjeC9kYwcknimJac8/V/j04DKwIARrhyBUvrUV3I=;
        b=bAhw/5R5TrWFU7lj/135VGQm09ToDpfbFHBpRUzCsL9hzmZbuW9x0/PHLjKoJBz+p3
         U7C8XM5/JjB9fVQ3I3YtQU4OFQasZnXFG5Tw8s3I3XDC8sskXdluVt1KJ288dfvCuEiM
         QcYW3aQgaeSpKwra/Z62aqlaTamU68C9PNs8kpO37zjcD/KKlVGL2iy/VgDtkh7//rDp
         rDzK0hD55/Dco3io69rnIUZgfJY4h65UCt/uTWxP/7TYz5+FPVu31P6LKfHx4kAp4PLR
         k0RmvSlZcmy9vCQIK+2bdQNx8hcMpvJm0uY33BFgCzVHgw7I9BqYGnFY/0mGulBfx5es
         VDFA==
X-Gm-Message-State: AC+VfDyQE55ojPBmK6dqOucnGCijVmeTavvind5R0MedDlIU2gcmZCFk
	SNk9vVo69yTMJ7WmHWCuw3w=
X-Google-Smtp-Source: ACHHUZ75Ln0qKwVMpCrbG6O4VxwcUepcbnRIqaTWU2QgWBjgBYnmZRIPqt/JwKa2gyRcxhW3KpTUOA==
X-Received: by 2002:a05:6512:3a94:b0:4f4:f38a:4423 with SMTP id q20-20020a0565123a9400b004f4f38a4423mr489727lfu.27.1686740795671;
        Wed, 14 Jun 2023 04:06:35 -0700 (PDT)
Message-ID: <2f23afd53e748a09d3de2b50aaec0c6d2cf106c0.camel@gmail.com>
Subject: Re: [PATCH v1 5/8] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 14 Jun 2023 14:06:34 +0300
In-Reply-To: <4ac462c3-9cb6-f467-2b86-925fb068486d@suse.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
	 <32aef31768cd81ffc8c848af6c29cd8510bbbf6d.1686080337.git.oleksii.kurochko@gmail.com>
	 <4ac462c3-9cb6-f467-2b86-925fb068486d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

> > +}
> > +
> > +void __init remove_identity_mapping(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 int i, j;
>=20
> Nit: unsigned int please.
>=20
>=20
It should be int in the current case because of the 'for' exit
condition:
      for ( pgtbl =3D stage1_pgtbl_root, i =3D CONFIG_PAGING_LEVELS - 1; i
>=3D 0; i-- )

Should exit condition be re-writen?

~ Oleksii

