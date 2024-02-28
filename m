Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC7A86B579
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 18:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686753.1069192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfNKo-0003vu-TT; Wed, 28 Feb 2024 17:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686753.1069192; Wed, 28 Feb 2024 17:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfNKo-0003tw-P5; Wed, 28 Feb 2024 17:03:10 +0000
Received: by outflank-mailman (input) for mailman id 686753;
 Wed, 28 Feb 2024 17:03:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6mx=KF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rfNKn-0003tq-DJ
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 17:03:09 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ef3352f-d65b-11ee-afd8-a90da7624cb6;
 Wed, 28 Feb 2024 18:03:08 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-512f3e75391so4933495e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 09:03:08 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a198c4a000000b00512dbd9cf32sm274786lfj.54.2024.02.28.09.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 09:03:07 -0800 (PST)
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
X-Inumbo-ID: 3ef3352f-d65b-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709139788; x=1709744588; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=30nIXP+od+UEsjVHmY9H6m9mbcUi/8rjFTWK7dcCxL4=;
        b=Aflv6hxGy0Z8tArcQ6DuuRwsDbCSSx4rH4hSOlJ03egMjJPHD0JsUFVhCbVg6W7ELT
         WLsCj/SJKerKar+dLTXDZoy18MbbXUQWDbQY9B8jEXe7slowYHdgCanV3iRlMBUfgXSG
         O/gHmNYQV6CGz1aLAbJHc8o7WHlpNFGwxrN/4Rm5ViCTfsDAKy3819SxH8+SePNvD/1a
         WQOL7nwS9pdGt7BZyAWOW2Mm7bgmoySK5kiLiNi5cVg/OwV+ZafkL6W1D69gwgyyOj3z
         lavMTgb8B4u061WfEMyLTB7wDvFHmq08AA23iVhahPfmuVsxXBv/tC+ZuWjrVAIjJw7R
         MHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709139788; x=1709744588;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30nIXP+od+UEsjVHmY9H6m9mbcUi/8rjFTWK7dcCxL4=;
        b=vHOROFeF6LXpXRpahm3Ubsv3ChMfHgTnar4MAR/BZ1lg55XSzn348jx1IftL/PlY83
         WlVcJUgJuXDFZvuj952/zXpqcm99E5VVpr1dX3CQcFWB8JeCVIcUhq5qZo3fsJyoKvd/
         4JxxjmPjJWtwI3IMDaXu0L5rIx933EdfE825OFanM9OCanpkgEwOsAhmlRZBk1vqYMjd
         xQnQoLEBd2ipxWhYgd9H5Sz/lTLuwRA47P40XI8TNbQir87juj6HWMgDrI6S1WOq6tv+
         d8ekVDPSLO+SGIFGMJDipp7s9RJM5gn9sI5IW6ykWMMXa7hZPToftHhy21IWKUh8IP56
         wrXw==
X-Forwarded-Encrypted: i=1; AJvYcCU9HWK5f5b3k+K++oh0U2sqCTMCo8ihzNUOskTXI/xj8FRineqGs4diHh32E3D+YLUz6udTUKArLQL1161ME31vQdj+83ZIQLf7VEau9MQ=
X-Gm-Message-State: AOJu0Yy9z52ivFYdpjyoJtsvk7KiNg4MEzJuzzwwC6JlHPdFpSKoPNAe
	6Sym7m0N/H6Fe1xG5WY3C4ehiBtkI9DmPhPKO9wyXVzhcBTdahrg
X-Google-Smtp-Source: AGHT+IHXlJZqNm+PSjjEfTml7jOtdStwEmV7hJWTn+x6bByrM3DEgf2BSaWdZZ/Pq/YS0Z6AzvKvvQ==
X-Received: by 2002:ac2:43d5:0:b0:512:bda2:7bd9 with SMTP id u21-20020ac243d5000000b00512bda27bd9mr126627lfl.64.1709139787434;
        Wed, 28 Feb 2024 09:03:07 -0800 (PST)
Message-ID: <b76526510f7ef080ddd970e85c3a88f1a7b58e0d.camel@gmail.com>
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 28 Feb 2024 18:03:06 +0100
In-Reply-To: <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
	 <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-02-27 at 08:55 +0100, Jan Beulich wrote:
> On 26.02.2024 18:39, Oleksii Kurochko wrote:
> > This patch doesn't represent a strict lower bound for GCC and
> > GNU Binutils; rather, these versions are specifically employed by
> > the Xen RISC-V container and are anticipated to undergo continuous
> > testing.
>=20
> Up and until that container would be updated to a newer gcc. I'm
> afraid I view this as too weak a criteria, but I'm also not meaning
> to
> stand in the way if somebody else wants to ack this patch in this
> form;
> my bare minimum requirement is now met.
>=20
> > --- a/README
> > +++ b/README
> > @@ -48,6 +48,15 @@ provided by your OS distributor:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - For ARM 64-bit:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GCC 5.1 or later
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GNU Binutils 2.24 or=
 later
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - For RISC-V 64-bit:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GCC 12.2 or later
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GNU Binutils 2.39 or late=
r
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This doesn't represent a st=
rict lower bound for GCC and
> > GNU Binutils;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rather, these versions are =
specifically employed by the
> > Xen RISC-V
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 container and are anticipat=
ed to undergo continuous
> > testing.
>=20
> As per above, I think here it really needs saying "at the time of
> writing"
> or recording a concrete date. Furthermore I expect "these versions"
> relates
> to the specifically named versions and particularly _not_ to "or
> later":
> With the criteria you apply, using later versions (or in fact any
> version
> other than the very specific ones used in the container) would be
> similarly
> untested. Much like x86 and Arm don't have the full range of
> permitted
> tool chain versions continuously tested. Plus don't forget that
> distros may
> apply their own selection of patches on top of what they take from
> upstream
> (and they may also take random snapshots rather than released
> versions).
>=20
> IOW it is hard for me to see why RISC-V needs stronger restrictions
> here
> than other architectures. It ought to be possible to determine a
> baseline
> version. Even if taking the desire to have "pause" available as a
> requirement, gas (and presumably gld) 2.36.1 would already suffice.
I'll be happy to determine a baseline version and RISC-V doesn't need
stronger restriction that why I wrote: "This patch doesn't represent a
strict lower bound for GCC and GNU Binutils".

Would it be good to use for GCC -> "12.2 or later" and for Binutils ->
"2.36.1 or later"?

I missed that I've pushed RISC-V contrainer without fixing version of
archlinux, so you are right that after container update what I wrote
won't be true, as compiler version might be changed.

Just for clarifying when the version will be agreed, does it mean that
I should use a toolchain with mentioned version in this file and each
time to verify that everything still working with this versions?

~ Oleksii


