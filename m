Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E93C99ECBFC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 13:24:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854721.1267855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLLlT-0003QX-L4; Wed, 11 Dec 2024 12:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854721.1267855; Wed, 11 Dec 2024 12:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLLlT-0003OQ-I6; Wed, 11 Dec 2024 12:24:27 +0000
Received: by outflank-mailman (input) for mailman id 854721;
 Wed, 11 Dec 2024 12:24:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YxMG=TE=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1tLLlR-0003OJ-Gu
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 12:24:25 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da3aa3a1-b7ba-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 13:24:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BC3B0A420DE
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 12:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C787C4AF0B
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 12:24:21 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so3994686e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 04:24:21 -0800 (PST)
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
X-Inumbo-ID: da3aa3a1-b7ba-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733919861;
	bh=DsXfp69fj2fRqzzDFgqUyNg8ViPXWlKIo43PfinZuFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hbBGffLG09YowJve8o2b2lzExQfsrf3VQXWFB8Xtk06XrXMUwu8qfiY9DHU9o1848
	 VrsVvUN/EA7cvw933gACaa9OvZX6sqlLNIq02WNb1asVKkuwUbAFS1EnwzA93i4VZL
	 i6hqVluyEO9kH4saaXyezegM7E3n9Y0Ywd/Yd1ClCB4u95ZrtACPreUzpn094pVniF
	 weqU4p/6AhkK4jc/4tZvsMwG/X49rjFChcSz6Pj/ZJhbS8jEQXOCvAk6ogmNxGmidE
	 26PBXcIvNmFkd2z7ZDu9YX7SWwbd6ldzX1RtpMuc95BFC7YNZ2x6E4++8SPA59AWgf
	 LaSSkWlpcigtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR85md++qAkWOiNvkOqPNOexO2ppi4MBR7X8Fl4V4VTrShxL5oHqaQnM0wnhaFDHnzslMb7fHdPgU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyltz3Xttml09TkA3Cyw2ybtlGWB6NS/yljunNQc54h9l4u10pY
	KD5HAM36cK5vQMWfEffd99Sx5L9nY85L6UJHXaNjb+wf43IlactBT9c5bmt7PQRjj3COEZ8xtqV
	hk/8t3+cGrUoklSB0vIGfy0eg6tA=
X-Google-Smtp-Source: AGHT+IGGcmOcREgNPBxszaP86ASREHMb1Gbb7UNcEMwpTi1i2aaMzaHU//SFUnwFwNZQnYbltrR5CTAM3YNBIp6px58=
X-Received: by 2002:a05:6512:3d18:b0:53e:398c:bf8f with SMTP id
 2adb3069b0e04-5402a5e5f9cmr849575e87.32.1733919859838; Wed, 11 Dec 2024
 04:24:19 -0800 (PST)
MIME-Version: 1.0
References: <Z1l6XbHP6BTTZSwr@mail-itl> <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
In-Reply-To: <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 11 Dec 2024 13:24:08 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHSiCo7FH0Mo-_R9HjxhthddPUZfgm5c8yj7vjGvgfTPg@mail.gmail.com>
Message-ID: <CAMj1kXHSiCo7FH0Mo-_R9HjxhthddPUZfgm5c8yj7vjGvgfTPg@mail.gmail.com>
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, regressions@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Dec 2024 at 12:53, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote=
:
>
> Jason, Ard,
>
> I guess there are some prereq patches missing in stable 6.6.y branch?
>
>
> Juergen
>
> On 11.12.24 12:41, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >
> > With Linux 6.6.64 I get the following crash on domU boot:
> >
> > (XEN) d5v0 Triple fault - invoking HVM shutdown action 1
> > (XEN) *** Dumping Dom5 vcpu#0 state: ***
> > (XEN) ----[ Xen-4.19.0  x86_64  debug=3Dn  Tainted:  M     ]----
> > (XEN) CPU:    4
> > (XEN) RIP:    0008:[<ffffffff82b64050>]
> > (XEN) RFLAGS: 0000000000010086   CONTEXT: hvm guest (d5v0)
> > (XEN) rax: ffffffff82b64050   rbx: ffffffffffe00000   rcx: 00000000c000=
0101
> > (XEN) rdx: 0000000000000000   rsi: 0000000003a00038   rdi: 0000000002a9=
bc98
> > (XEN) rbp: 0000000000000000   rsp: 0000000002aa0ce8   r8:  000000000000=
0000
> > (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 000000000000=
0000
> > (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 000000000000=
0000
> > (XEN) r15: 0000000000000000   cr0: 0000000080000011   cr4: 000000000000=
0020
> > (XEN) cr3: 0000000002022000   cr2: 0000000000000000
> > (XEN) fsb: 0000000000000000   gsb: 0000000002a9ccc0   gss: 000000000000=
0000
> > (XEN) ds: 0010   es: 0010   fs: 0000   gs: 0000   ss: 0010   cs: 0008
> >
> > Linux 6.6.63 works fine.
> >
> > Looking at the changes, I suspect one of those:
> >
> >      83d123e27623 x86/pvh: Call C code via the kernel virtual mapping
> >      f662b4a69e1d x86/pvh: Set phys_base when calling xen_prepare_pvh()
> >

The second patch shouldn't have been backported. It is unnecessary,
given that in the old situation, the kernel image needs to be loaded
at a fixed address. And it assumes  that %rbp is set to the physical
load offset, but those patches were not backported.

