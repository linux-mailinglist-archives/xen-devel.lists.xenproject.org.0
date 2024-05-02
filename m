Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FFE8B96D6
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 10:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715659.1117441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2S9M-0001Ou-84; Thu, 02 May 2024 08:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715659.1117441; Thu, 02 May 2024 08:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2S9M-0001Mi-5C; Thu, 02 May 2024 08:50:44 +0000
Received: by outflank-mailman (input) for mailman id 715659;
 Thu, 02 May 2024 08:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ua+q=MF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s2S9K-0001Mc-P7
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 08:50:42 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dbe21a2-0861-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 10:50:40 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57230faeb81so4691941a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 01:50:40 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a1709060fd100b00a526a992d82sm297321ejk.4.2024.05.02.01.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 01:50:39 -0700 (PDT)
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
X-Inumbo-ID: 0dbe21a2-0861-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714639840; x=1715244640; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FwQKVQZOC9HuXifBT4s+lUF7T1W9sP/iWQHSp2dc6hg=;
        b=eKBdrLL8RhEcKnrD/82Pgau/fYhrtDb7RwRsrS2QQ+PJCxOR0NdQmwpv10xJ0EHuJ9
         4sxwRxMf8Ki0FeaSEJokGdjtsAz9KXnjkuLvtjzh/784ZXYxreNKOgyr0UEk/BHY0/w0
         /4LefN/qNK53NfB/CJs52YP+fxIpNgwu/VJ39yAKwB/jJpqeXj/IFjSIcABdweVRZWXG
         Had6S9M//PSATwi9h4FA7b/U/R9LXE5OGGCcHDY/3PNVZRVSH2kaR24DLIoCCUJUSNXe
         logDxVIOUq3KOyHXmUonznFQDTtr8XxRJBo8TOmIju/Owla1XLO1jKClwLQWQXns8Dsm
         soAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714639840; x=1715244640;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwQKVQZOC9HuXifBT4s+lUF7T1W9sP/iWQHSp2dc6hg=;
        b=JqoYnu1yE1zg4ldaMw5B6Y9wrQZPE9sLVaoUySITNImnuBzUeEiN5IE7PgsamImQ+7
         /PcvaaV+pSfRc+YTUq541i/3lLaLFDBLNs8qZK9SGeRHP2yJdDbPGxERG0nBhyWR0BNZ
         3Rjlo5TXL6mz4Uo7alkdL7Y8wEfberzMH3RQC7L/POODUOv17AmaQ14SeB99YIrbE15v
         43TSDU29WCu3gnUWoT4Yti2pzwZyCdT+YLkpuDTATzSKxsDLwDCmPMmzsHT1Ndpg2Jn5
         v15cjnhPHzXHJ+Glt519W2pfGkbrBM5BmFZTsaI0XyFRATNWe3O1Wu/Y09Z1wQT2q0R8
         XWrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8oFLMQIhldNBw7udFIHA1Zz7Al8yNnklfmaNd5t3iqn1d64ZfODH1My+wA4Mqb3X05QzuiNf+qgZZ9M2Gvhn9GTiRFyGvr2CseaPXfIQ=
X-Gm-Message-State: AOJu0YxH4isyXE5t8JSs86GyCuzwflptwMbU3zv3Tn6PX92eB4e/zcH2
	d1y2CKCGeW/l/5Th8X80db3n/RbAYejWmhVAwEpQ2PVcjlBgnqnP
X-Google-Smtp-Source: AGHT+IEFRr2bNheETiMxne1P0mHyjiVNUbUXoOY59uuCkTOEka3C5lhLPWWdD2vW2qU+/vvlgG0P0g==
X-Received: by 2002:a50:c353:0:b0:570:5bcc:f749 with SMTP id q19-20020a50c353000000b005705bccf749mr3586960edb.29.1714639840089;
        Thu, 02 May 2024 01:50:40 -0700 (PDT)
Message-ID: <a23399a560ac566e15a3881063d34ebc19fb524a.camel@gmail.com>
Subject: Re: [PATCH for-4.19? 0/2] xen/x86: support foreign mappings for HVM
From: Oleksii <oleksii.kurochko@gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  George Dunlap <george.dunlap@citrix.com>,
 Community Manager <community.manager@xenproject.org>
Date: Thu, 02 May 2024 10:50:38 +0200
In-Reply-To: <20240430165845.81696-1-roger.pau@citrix.com>
References: <20240430165845.81696-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

Hi Roger,

On Tue, 2024-04-30 at 18:58 +0200, Roger Pau Monne wrote:
> Hello,
>=20
> The following series attempts to solve a shortcoming of HVM/PVH
> guests
> with the lack of support for foreign mappings.=C2=A0 Such lack of support
> prevents using PVH based guests as stubdomains for example.
>=20
> Add support in a way similar to how it was done on Arm, by iterating
> over the p2m based on the maximum gfn.
>=20
> Mostly untested, sending early in case it could be considered for
> 4.19.
In case of it will be properly tested I think we can consider this
patch as a candidate for 4.19

~ Oleksii

>=20
> Thanks, Roger.
>=20
> Roger Pau Monne (2):
> =C2=A0 xen/x86: account for max guest gfn and number of foreign mappings
> in
> =C2=A0=C2=A0=C2=A0 the p2m
> =C2=A0 xen/x86: remove foreign mappings from the p2m on teardown
>=20
> =C2=A0CHANGELOG.md=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0xen/arch/x86/domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 +++
> =C2=A0xen/arch/x86/include/asm/p2m.h | 28 ++++++++++----
> =C2=A0xen/arch/x86/mm/p2m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 70
> ++++++++++++++++++++++++++++++++--
> =C2=A04 files changed, 94 insertions(+), 11 deletions(-)
>=20


