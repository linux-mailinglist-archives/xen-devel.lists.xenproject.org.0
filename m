Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA6E9120C6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 11:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745171.1152333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKahh-0007E9-Jz; Fri, 21 Jun 2024 09:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745171.1152333; Fri, 21 Jun 2024 09:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKahh-0007BW-Gj; Fri, 21 Jun 2024 09:37:09 +0000
Received: by outflank-mailman (input) for mailman id 745171;
 Fri, 21 Jun 2024 09:37:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MgEJ=NX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sKahg-0007Af-1M
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 09:37:08 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3612082-2fb1-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 11:37:07 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52caebc6137so1841365e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 02:37:07 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b441csm146566e87.33.2024.06.21.02.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 02:37:06 -0700 (PDT)
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
X-Inumbo-ID: d3612082-2fb1-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718962627; x=1719567427; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PLXGmdtvLhHKkU/pDpI+VMRmDdENy4k3JuMXbMA+T98=;
        b=lxbktCFnY/uw+ZOmNajnnfTGAg6Pj3+zUTxlGguc4T0Pg7XLF5kW6tMJkjZpgyua7j
         dzWHhxeJPtH5XhUKlu3TH70LqLbZ4AytQugCPgmnMLko7DPoADnzGXOW9DkrNhWkiXXx
         XpYYvXkpVSOd2MQ9QYGY9dzU2EkQWZFDBsjKbGrmb++lvHDcElxVO45Ye1Sc9hdxuaxV
         DImjJ5Mc6aXe5Mu432CinfT5EHpez4N9UDBzWhdSxpCAsnGIG+x/WgQlaYv7cYZHReZX
         OCzFoHdygR9bPyaxWarsmZQyFchkdwgGNoxzVMJUpzYtTG9Rrh7Nvaqbtn2oW4JnrAoX
         lmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962627; x=1719567427;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PLXGmdtvLhHKkU/pDpI+VMRmDdENy4k3JuMXbMA+T98=;
        b=ThvCGGaNr9VhAlHjMyndow2NpUgFthwXMT7xlDMZa97nx6KpJpH07eU4S3QXMhcIGd
         FIXb4lD6DJqu83aVqZTWMG4SGU8i8YW4uC5vPBFDSiwlT9gM8gfgZNQWlhFeEYNGJwXa
         zA/Rz+eHRJewUHGP+hg7z21R+L0MUeE9PUzvwThLaV2LSkQLs/n7WM8rs3Ro7JQjdMUA
         Xt9jaBL1wPEIN3htI8modTzD8i25MAotwRYfMH4IcxuPlfuwtAq3avnNm2ASp2X4BOKH
         khQyhLVlZ0tpCpP1DbVcqV7MqjyfrBzUPZ36J2Nxc/3Pdk4nn0tHFkYwH5qeDyGvVrO5
         eeww==
X-Forwarded-Encrypted: i=1; AJvYcCW1pJ4rushk/roQgDrkKHSr/GpWmHApFvnjRNxzz6ql9GZ9rKYtTAtZLui+CbJatcs/aciJXPHq1/IpLGYiBf8eDLcFEXa05uqjTArIyqM=
X-Gm-Message-State: AOJu0YzFEjEy2vwYnKHxLro4fuKPt5W9dbLELYdmEI6pplrn4w7lp3OH
	erHAhF2jWSKkHp4pHh/+aCrdeox8HQilvgeXwobzW1Selo+qDwcsYORP7w==
X-Google-Smtp-Source: AGHT+IGI/wRUMKo1PgAPUQRH1M2iZOxMb1SC0yeSUOKQbygSfIJ9n44cilNThGO+hsjX7ySezl1jgQ==
X-Received: by 2002:ac2:5ecb:0:b0:52c:9383:4c16 with SMTP id 2adb3069b0e04-52ccaa5d4b2mr4507559e87.22.1718962626680;
        Fri, 21 Jun 2024 02:37:06 -0700 (PDT)
Message-ID: <70d4179eed3198a977e147e29d21ff6998eeb29f.camel@gmail.com>
Subject: Re: [PATCH for-4.19?] libelf: avoid UB in
 elf_xen_feature_{get,set}()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
  Stefano Stabellini <sstabellini@kernel.org>
Date: Fri, 21 Jun 2024 11:37:05 +0200
In-Reply-To: <40b33e27-663e-460b-8253-0f5b98fe7f23@citrix.com>
References: <42a8061a-b626-443a-ad42-0e05b043c6c7@suse.com>
	 <40b33e27-663e-460b-8253-0f5b98fe7f23@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-06-20 at 17:07 +0100, Andrew Cooper wrote:
> On 20/06/2024 4:34 pm, Jan Beulich wrote:
> > When the left shift amount is up to 31, the shifted quantity wants
> > to be
> > of unsigned int (or wider) type.
> >=20
> > While there also adjust types: get doesn't alter the array and
> > returns a
> > boolean, while both don't really accept negative "nr". Drop a stray
> > blank each as well.
> >=20
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> +1 for 4.19.
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

>=20
> > ---
> > Really I wonder why these exist at all; they're effectively
> > test_bit()
> > and __set_bit() in hypervisor terms, and iirc something like that
> > exists
> > in the tool stack as well.
>=20
> The toolstack has tools/libs/ctrl/xc_bitops.h but they're not API
> compatible with Xen.
>=20
> They're long-granular rather than int-granular, have swapped
> arguments,
> and are non-LOCKed.
>=20
> ~Andrew


