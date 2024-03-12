Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFFD87924D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 11:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691747.1078028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzWY-00081E-QB; Tue, 12 Mar 2024 10:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691747.1078028; Tue, 12 Mar 2024 10:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzWY-0007zg-N6; Tue, 12 Mar 2024 10:38:22 +0000
Received: by outflank-mailman (input) for mailman id 691747;
 Tue, 12 Mar 2024 10:38:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dSPz=KS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rjzWW-0007za-PR
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 10:38:20 +0000
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [2607:f8b0:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a439eae6-e05c-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 11:38:19 +0100 (CET)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-36671d34b58so149245ab.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 03:38:19 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a92cc91000000b003664ef72ac6sm1246688ilo.68.2024.03.12.03.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 03:38:18 -0700 (PDT)
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
X-Inumbo-ID: a439eae6-e05c-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710239898; x=1710844698; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BBb2cb85x2ye9vgFEXWP4NLtt5MavEsdzf3VT/F7YNM=;
        b=Aqj/bIuBnPt2XMuiFczNCCUGIx7ovSfre9cpL9C3m56+kdeWRncq2pN8Cm9sOvNFnd
         3b/0l6Pv8ouxEGSCqblBsqNYxbqxwQAE2aVio/SluRAKIKmrkUKogL57umBv45dhFD3F
         cl0HFrrtOF4cFKnzkMJRxsmP/FxuCCMoxVuiSxRIx2qiNQMGPa0Ilzgh6z05Hgx470cZ
         WSBP3K89in7QUbgdApIbQbrujAVw7yNdHRxsP4zCrY8+5TxeLFdNgPCiTZUeWeoWV5Z/
         kHIKsnkocsFd3FsU8CucjWgYfbsLWnyGALexWPwOBCsxjMfYm2NWukfgrfDXcYprCjub
         G0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710239898; x=1710844698;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BBb2cb85x2ye9vgFEXWP4NLtt5MavEsdzf3VT/F7YNM=;
        b=KV7h/G2aDJ4qLcbyHaYuuuTtIMOdGvUl4A1COc5zxwCB1ovD54gx5bsv0W8xQJuwTl
         +PUaKHdmWArTwkrWTgey3UqKbxUpBa9K5x9nm4CxPAsCev2iomqKqs5Kdvegm8Dcr0Mt
         i+PquJEP1//Y9DV89By7e8NavAhEUUzFZSBEkib05lF5fDaa4GJa1TYH5fxCeZRpqzud
         OVJMmOe69klVR2cZnrXq8lWFG7A5NKNpsmTpOvMi6VMP9wy1EXogwrrAag7vS/D/m5s0
         WjoGGBQSDc6S8EHIy806QvIht2P3Sj3z0x6PEvM9ix8P7+ZiCdLAS8SaSx5srY01hkWY
         r1Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUboCJYw5IDY6Z4Czcb99KU11XSpBeZjlUxH5AnVy7rIEdopWsQHh4zH/gI6XdSyLp9mgZgrlIgJbkBUo//+TGHp0C+huzXfReWx4vN9O0=
X-Gm-Message-State: AOJu0YzwfrRAxCswygOsGf3ivPqngCHw9fY5UvtOPG8kNWBuJZuT+lfQ
	Czspnk7kU7pLqxQEEaGurPcISFdx6c1G7fQcdSzoCCObMWcX50vB
X-Google-Smtp-Source: AGHT+IEKK6Yzleb+V2ZY6ZuKNOB6iewltzBdWyVVEMBnpSQ7qOaeNOeaKrnDcMgQTE1eQJCKQyDg7g==
X-Received: by 2002:a05:6e02:168d:b0:366:6d12:8e3d with SMTP id f13-20020a056e02168d00b003666d128e3dmr1027067ila.22.1710239898564;
        Tue, 12 Mar 2024 03:38:18 -0700 (PDT)
Message-ID: <b23e5f3a1d8386db4a78d0c4ea0bf31269ea2663.camel@gmail.com>
Subject: Re: [PATCH v2] x86+Arm: drop (rename) __virt_to_maddr() /
 __maddr_to_virt()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Wei Liu <wl@xen.org>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>
Date: Tue, 12 Mar 2024 11:38:14 +0100
In-Reply-To: <cb41fa55-5c05-4156-87d8-1ef1c2bf5ce5@xen.org>
References: <f7b82e17-8282-400b-a6c2-b74761bbd6ce@suse.com>
	 <cb41fa55-5c05-4156-87d8-1ef1c2bf5ce5@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Julien,

On Tue, 2024-03-12 at 10:33 +0000, Julien Grall wrote:
> Hi Jan,
>=20
> On 12/03/2024 10:27, Jan Beulich wrote:
> > There's no use of them anymore except in the definitions of the
> > non-
> > underscore-prefixed aliases.
> >=20
> > On Arm convert the (renamed) inline function to a macro.
> >=20
> > On x86 rename the inline functions, adjust the virt_to_maddr()
> > #define,
> > and purge the maddr_to_virt() one, thus eliminating a bogus cast
> > which
> > would have allowed the passing of a pointer type variable into
> > maddr_to_virt() to go silently.
> >=20
> > No functional change intended.
> >=20
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > v2: Avoid aliasing macro on Arm.
>=20
> Interesting, I was expecting x86 to follow the same approach. I don't
> quite understand the benefit of the aliasing here but at the same
> time I=20
> don't maintain it. So for Arm (only):
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20
> Also, Oleksii, when you send a patch for RISC-V, can you please avoid
> the aliasing on RISC-V? I understand we want to prefer static inline=20
> (and in general I would prefer them), but we also need to balance
> with=20
> avoiding aliasing when there are zero benefits.
Sure. I wanted to that in the same way after your comment for the first
version of this patch.

~ Oleksii


