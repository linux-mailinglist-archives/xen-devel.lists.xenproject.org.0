Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B39B903910
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 12:39:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738258.1144954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGytu-0007I5-4V; Tue, 11 Jun 2024 10:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738258.1144954; Tue, 11 Jun 2024 10:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGytu-0007FQ-1c; Tue, 11 Jun 2024 10:38:50 +0000
Received: by outflank-mailman (input) for mailman id 738258;
 Tue, 11 Jun 2024 10:38:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=887E=NN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sGytt-0007FK-DX
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 10:38:49 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c95b2d47-27de-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 12:38:48 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52bbdb15dd5so1129770e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 03:38:48 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c90657c72sm456085e87.0.2024.06.11.03.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 03:38:47 -0700 (PDT)
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
X-Inumbo-ID: c95b2d47-27de-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718102328; x=1718707128; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=senLl3UHIbk9RkT+z6sH70yFNN3h44ScR0/Is9gc4Ms=;
        b=PbPscuRv8i9WTqbfnlMBsk3PHV2SUq0LE/gYcAa5DjRtRskKN52Pn4AufaqWsYVyFl
         wu+ZT/VhQhaCHIA5HEbPqOIv+ZGzoRR8N31u1cQKpXMxv6roX0nmsEHPrIXEeuaNbSmA
         eLt/DmHhCrns5286WdAvnokKWSB7RreJElBH9oxWLbXavdk4Bkk9tTtoq65HyDW1mSGg
         7f8uI1MlRCBUm0dBeNatL6P5J+J3uXATPwMY1aIF8hLRe90FDO19BHQoozpF2YVjJJqJ
         2RkvdxtLjl/GxpHyf+0A1W1nS4TmkI2efF+GNd101b0wJNQa4IyKHRjwDh677kEXkYZm
         P8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718102328; x=1718707128;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=senLl3UHIbk9RkT+z6sH70yFNN3h44ScR0/Is9gc4Ms=;
        b=xVWVJvPs8BoHTeWKj++fQDllXcH+S6Mw1R5hIAjLKeBhLP+jypR7FZTt3fZREiUw15
         WgnBN8JeCMGGgPEt5L1asaPDSRta4Z5ZoVi0aqnxIoYgmASscoi5BCu44pEc/pLVJcSq
         +U48qvAOERaCITAZM2leIezA+4/HbKclQQt4OZkvYkRdT6RindKfghuCpfRC6D5ypq/S
         qzGfPFMckJEac3m7fjfp9EEAMmzWW5lsMoSZyC5QIDEDdvyYMYE4ofvcMB5p1hBUaejW
         ptvogWA5gQETqvwRJYP19i/rWInRpzEjnXYcOYvhN/HzUuMpiIYl4uUdiRg3CUz5h+tV
         2Onw==
X-Forwarded-Encrypted: i=1; AJvYcCXa9Q2A57id1ELEoviWK+OgSOUn+5Jg4TaW/Qo90Foj7QvLfsa9l0haKwpQoWn+huAW7hvxJgEjeSNim9gSsVCDJ+pfpkSTs1+I2587vck=
X-Gm-Message-State: AOJu0Yw5MfdHA7XEqf/SzUaRa2yJNlZDF9oL1pe3qsMGCSkPw137QN7h
	dROHYGo3kXQWMSWyU2PUt0WfZooYy+sSPUIlFvpt+AyNpJtXpZKP
X-Google-Smtp-Source: AGHT+IGG1BVYgE2BWmAgeI49uqjNWliuK7t48IpO0S3BoKH8pnS1w97htLc28fIcjSsz1bOEavo1DA==
X-Received: by 2002:a05:6512:785:b0:52b:c14d:733c with SMTP id 2adb3069b0e04-52bc14d73f5mr5800054e87.68.1718102327969;
        Tue, 11 Jun 2024 03:38:47 -0700 (PDT)
Message-ID: <fcfe1bb749473920a72858ee1cbbb443ca059a09.camel@gmail.com>
Subject: Re: [PATCH for-4.19 v1] automation: add a test for HVM domU on PVH
 dom0
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
	 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>
Date: Tue, 11 Jun 2024 12:38:47 +0200
In-Reply-To: <67a6fc3a-bcc3-48e8-beb8-b3c05217083c@citrix.com>
References: <20240610133210.724346-1-marmarek@invisiblethingslab.com>
	 <67a6fc3a-bcc3-48e8-beb8-b3c05217083c@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Mon, 2024-06-10 at 16:25 +0100, Andrew Cooper wrote:
> On 10/06/2024 2:32 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > This tests if QEMU works in PVH dom0. QEMU in dom0 requires
> > enabling TUN
> > in the kernel, so do that too.
> >=20
> > Add it to both x86 runners, similar to the PVH domU test.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> CC Oleksii.
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii=20
>=20
> > ---
> > Requires rebuilding test-artifacts/kernel/6.1.19
>=20
> Ok.
>=20
> But on a tangent, shouldn't that move forwards somewhat?
>=20
> >=20
> > I'm actually not sure if there is a sense in testing HVM domU on
> > both
> > runners, when PVH domU variant is already tested on both. Are there
> > any
> > differences between Intel and AMD relevant for QEMU in dom0?
>=20
> It's not just Qemu, it's also HVMLoader, and the particulars of VT-
> x/SVM
> VMExit decode information in order to generate ioreqs.
>=20
> I'd firmly suggest having both.
>=20
> ~Andrew


