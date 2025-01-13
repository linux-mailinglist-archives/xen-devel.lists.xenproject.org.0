Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC7DA0BA3A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 15:49:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870598.1281762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXLjm-0001lD-A7; Mon, 13 Jan 2025 14:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870598.1281762; Mon, 13 Jan 2025 14:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXLjm-0001iv-7K; Mon, 13 Jan 2025 14:48:18 +0000
Received: by outflank-mailman (input) for mailman id 870598;
 Mon, 13 Jan 2025 14:48:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uBYe=UF=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tXLjl-0001ip-2F
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 14:48:17 +0000
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [2607:f8b0:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a68e7a2-d1bd-11ef-a0e1-8be0dac302b0;
 Mon, 13 Jan 2025 15:48:14 +0100 (CET)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-71e15e75717so506405a34.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 06:48:14 -0800 (PST)
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
X-Inumbo-ID: 6a68e7a2-d1bd-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736779693; x=1737384493; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wed0ovCZrQjH1cGnaVHuR1PDs2srTZ0avB1/jNISbI=;
        b=Bg8YXie3QhqmttZ7yeL7oJf6RM8msSFCEJ2TaUXBnodsbRGJFaHfDkS24uabEDjE9u
         /HaDnqAqesRLuwh0DIeFVSGvwpAAP5QSRcGYQc0xQKiJfu4u7wRPtrUWO8JW+VtRZoPG
         iIYllGGz337VFnXinm80uuW0l+dFx8gziLdSGOfSO5pEHr450x/ih0CSI/1Z/GaSUGzE
         L0v7CiErw6FzSaevC8OgB7GzYasycNB2zCxHhoIVre9m4XDBlH5Ufzam8sEmwS90VGc9
         bVCCdQrFZqtBgR5rm88MJp3Af5pW+m6ZHfIDY2bix/6GtSYZwA7NFr1sSo3Xd77GlJ46
         eXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736779693; x=1737384493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wed0ovCZrQjH1cGnaVHuR1PDs2srTZ0avB1/jNISbI=;
        b=srZ4Zo681oc6pzf4LJlPnTJUuv0B0NkzRZWkXXteBnl4A6yBnqfrJJJPq4QsZgMo53
         lZnkKKkRE2JeT/wjPJaYfuUw0S1smeJ9OWA5y+3KVTZIXoedLSAkMBlwm7S8Lvkdw65a
         gKbX6NBS3hiNZxnHhVOvSfH8psXYYIbp7mfSiFaTQPVYGAbP3kLd6nm0usTXbt/UeAcq
         16DjxXr9EU6HRuxNMHj3o8Yguh/DpKT4xbCWcLERLkPMZb9N8bP/jvtHbNCz0IVIyhkF
         d/DrVDTCscZ8R1vXAak7QphTyp1dQHMNs6lEke8hKUjOxPJ0ZhSPZT80WgYyuMhnAN3B
         DhVA==
X-Forwarded-Encrypted: i=1; AJvYcCWjTa7izJJ2zITVTxaCeFGb3wAXpAcIRKtc73aTHLhyo7ts/Gk4Q0LePVX4Xe2m6AXovD1FUsDmLos=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUpnBpWBdRre4laYtTTEXIz6JlUJXIhRx6Km673tyYBZHYJxxc
	WHkD3abKr/A7kpLyhY7mLPyJT7qf8TUvW3+mcmSRJ4QJKf1g7sjjprswuheueC55AsdNVmwCVBN
	xe8DWrltJ3iPDQPjk2NZ+KMexYEs=
X-Gm-Gg: ASbGnctxOy1/E6EiPYwgUpkn0Fq608YH/sD1/pu1UDqv32DiYO9VDa+ews4QFTFcPuY
	4w004wXKSMrPMaiz/vC/Ap31OzS95ZmCSGmS+
X-Google-Smtp-Source: AGHT+IHtKCiOI6oZH20Kohs0+BPkqMLSKn5pfXXA0DRTFLEeR3yi1hvkTvOlrdF42TkWAOrce/JGH2UtHewqynYFoQc=
X-Received: by 2002:a05:6870:ce8e:b0:29e:5f79:21b4 with SMTP id
 586e51a60fabf-2aa069c334cmr4221999fac.13.1736779693020; Mon, 13 Jan 2025
 06:48:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1735837806.git.w1benny@gmail.com> <31a1ff2d5d1e17bb73231e008f1e47c501bb3ce8.1735837806.git.w1benny@gmail.com>
 <d6eb70a7-5895-4471-95b3-609f133fa457@suse.com> <CAKBKdXjJm5194Wa=gy=DikiUEsevrB2Xn-idr+vgfgJMBrfZ-w@mail.gmail.com>
 <b182555c-555e-4efc-94a0-5f383f7d8689@suse.com> <00662cf8-7bff-4963-8b52-5df2e6a75132@citrix.com>
In-Reply-To: <00662cf8-7bff-4963-8b52-5df2e6a75132@citrix.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Mon, 13 Jan 2025 15:48:01 +0100
X-Gm-Features: AbW1kvbMJbuOi5oYsaMm0TdztLi7CgmFFlBZGuFEJt1A0gTCOpf2b3qvCGR49ak
Message-ID: <CAKBKdXjNRHtpLXFT6J9ZRggK94dKTXBeJAvbJEMG=uLO1-=Hbw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] x86: Add Support for Paging-Write Feature
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 1:23=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
> Seeing as this is the only issue, I'm happy to fix on commit?

Fine by me!

P.

