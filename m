Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0AC696976
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495326.765684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyA8-0000c7-Pt; Tue, 14 Feb 2023 16:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495326.765684; Tue, 14 Feb 2023 16:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyA8-0000aP-M4; Tue, 14 Feb 2023 16:28:12 +0000
Received: by outflank-mailman (input) for mailman id 495326;
 Tue, 14 Feb 2023 16:28:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6HWG=6K=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pRyA6-0000Zv-EX
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:28:10 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 917e1170-ac84-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 17:28:09 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id bu23so16244946wrb.8
 for <xen-devel@lists.xenproject.org>; Tue, 14 Feb 2023 08:28:09 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 x1-20020adfffc1000000b002425be3c9e2sm13551199wrs.60.2023.02.14.08.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:28:08 -0800 (PST)
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
X-Inumbo-ID: 917e1170-ac84-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UBkEiwCl6774X6U2cNYVFm41NA84KkS8Y4tNQdu50uc=;
        b=DFscOrDMorZFsVsEzkGWkoJK7EHVShMa1w6hNUt4OFjT8udIynQHIxkNDkHQDzjF5y
         EJ2hLZqWmu9wUsraID71bnu8S8Wjeukfn4kOcMEubn+GlZ1O6NS4176mikCMKvcqNats
         mFyzBOmuOS+0OafFXJQ4USdUEkmA2PDvn1a7w7aIKOmgb40AIXTsBPrD5vHEPUz8SG/R
         rHy8xMbUbZy+Gw/vauDrESdHIvClOT+TK6bDhrTknhpZHrdPUE+VbSWeJF5i8pOCIBod
         O0kpkpa+V43UOXeoR34YCehEGD/Qxi9fjw6TaFMNfPQFDRVAMW1AtWsHz3ZeDwlyI7OX
         aIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBkEiwCl6774X6U2cNYVFm41NA84KkS8Y4tNQdu50uc=;
        b=suLe/Ra9q+Ovi6jsp7I7O8LaIkDUDCPR/TEy6u0ow7fVSDATmONppRZ0Kdd4KJaJUC
         A8/6/v+RvUvE37uglY7KF+/EMDp7BMaIkZKprnkRceZeOxZvHxcHsGgI5HbVG08YYucp
         vvi8Wj6eTwJ/QvB0vrzEqQm+Cof/emXYR97rpS8CMAAOflZ7O0Nps8DOlfOgHgt92PMG
         tJOfoD6sK6QT+s2fn9dANlOOg6Wz3+NcvrqRpDnIScZi12Ad00A9dtEQiTnwhuvoNs8T
         HElDfGx8KPq54RqZh6teZoy6CgLBFKf/brab6YS3Rcay5v3FAGYEbfXVgfvlrUluANHu
         8Llw==
X-Gm-Message-State: AO0yUKVEn8uLc3pQRPr6gOR9Od5s7t92NCm78CIpbczc+eSota2vV03V
	NqBaIW+djrM7HcPPotIf46c=
X-Google-Smtp-Source: AK7set/nBGsVJSHUPKcP/jgdSako3DV6IqQbf5NqQYw1sX78A9iylaDzaJe5KCJPk1wEQtcrUnJWrQ==
X-Received: by 2002:a5d:46c3:0:b0:2c5:58fd:a965 with SMTP id g3-20020a5d46c3000000b002c558fda965mr2485095wrs.35.1676392089093;
        Tue, 14 Feb 2023 08:28:09 -0800 (PST)
Message-ID: <bd3e489f2ec977fedd392a3dfd48e34d37edd895.camel@gmail.com>
Subject: Re: [PATCH v1 2/4] xen/arm: switch ARM to use generic
 implementation of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,  xen-devel@lists.xenproject.org
Date: Tue, 14 Feb 2023 18:28:07 +0200
In-Reply-To: <77deb11b-e460-ef70-9710-90b13c88b680@suse.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
	 <6c8b46f2f3326b833c73dbb86674ac5eb6ea45c8.1675441720.git.oleksii.kurochko@gmail.com>
	 <77deb11b-e460-ef70-9710-90b13c88b680@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-02-13 at 14:02 +0100, Jan Beulich wrote:
> On 03.02.2023 18:05, Oleksii Kurochko wrote:
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -18,6 +18,7 @@ config ARM
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select HAS_PDX
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select HAS_PMAP
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select IOMMU_FORCE_PT_S=
HARE
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select GENERIC_DO_BUG_FRAME
>=20
> Please maintain (largely?) alphabetic ordering here.
Sure. I'll do that in the next version of the patch series.

>=20
> Jan
>=20
~ Oleksii


