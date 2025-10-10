Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B5BCC42A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 11:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141081.1475686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v799H-0004vi-Et; Fri, 10 Oct 2025 09:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141081.1475686; Fri, 10 Oct 2025 09:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v799H-0004tb-BW; Fri, 10 Oct 2025 09:10:51 +0000
Received: by outflank-mailman (input) for mailman id 1141081;
 Fri, 10 Oct 2025 09:10:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEoC=4T=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1v799F-0004tV-KT
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 09:10:49 +0000
Received: from mail-yx1-xb133.google.com (mail-yx1-xb133.google.com
 [2607:f8b0:4864:20::b133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01d8c7e7-a5b9-11f0-9809-7dc792cee155;
 Fri, 10 Oct 2025 11:10:47 +0200 (CEST)
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-635401a8f5aso2153872d50.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Oct 2025 02:10:47 -0700 (PDT)
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
X-Inumbo-ID: 01d8c7e7-a5b9-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760087446; x=1760692246; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3nRxT3OHljzrss5NC8JSQZQE+R7vCfFl9/8UGo8EvA=;
        b=Ww4G2cE8373w9iz+hD/+gu4aTCUv0JK5w0demKe5THcJdgrJzrY4LiSZwq3bZm20DH
         MinD0X8xBmII9y437dDzySR7B5ZI4NcYi8sYe/J4KZk333PiNFvvvCvisrGySI2j9WU5
         U+md0MA88CdY9PMA8yT9Wnp1kvYclv1BgzyYtEPqmo1m5Emyit/JU0eeO16AzuqxCJt5
         78z5VCFiUKGq2lqSXcNm/C6lrgZaHFPmLhTMyfjRgPfbzK/FGuaCttD2i9P8SKmFPfHq
         aMYEo9Mg1fHx0vqVyq7vhLglANhMKz5rYYcoKig9oq0DHTMTKrSactkCKBj0f2TjktTo
         cVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760087446; x=1760692246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3nRxT3OHljzrss5NC8JSQZQE+R7vCfFl9/8UGo8EvA=;
        b=IP6fw8pVRW3x+LXFen292mhsRwUZUHPbCh+XvutSqOXC1cTZhQtUWrBmZ3xe2SSlqt
         VmH4NzlcXz05St5FWYllTxv+Yjgc0tuAgCaJSACN3+SuS1UMTmg4Zk0tM1PijuyiUuME
         JMIKYe68oheK7EmY5lKBxyvJTATeCmBq4aqNSmOXgT5yGeiNiQP/JD6BkGPLZWgVNU09
         igqB7fZXGkdLQhe0emKc0/EyhhrfXK8fWxgTHtIIgcKe+8LjAT1URX+VkGCsUDVnDG/w
         CxR1D9x1p2IyCiaj7LWK7Wxp6k7sqcOdBD0wI+NBC+SBYsK6Wp3sgfsx8+YsZbG+7Dmt
         ZZog==
X-Forwarded-Encrypted: i=1; AJvYcCWFRtgJ6JDxNLqort06LWaU/ZR7C1VffNepSNCc0M4qLszMj0EWl/CxSvK5lnzKUBb34H4fDMISQqo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg4qdBbVxPQNS4oVLSrcSHNz7ZW+Is2bjFeIzBBTrUShO/UwCT
	1E7e7YrDku8Wshie8r2pWc35ABHz/e0VirgQPyn8MdVRQvPArkaxUinueBP8a6wCmIZy07Qvunt
	B0XE/XxRrWfXNcgTgqzi1RQkWQkofhCQ=
X-Gm-Gg: ASbGnct8DPD1G1aHY49hRm86Ek+6umectSGzZv/3M6x1DCG0gyT1wPv/uQsIpgDfPi3
	ejrYKiKumsOCTjk9s2H7b2sN1jImfBpWARkMwF9JtPKnMQic0QDPrTNexPzlnp4KGoo7eeqrudL
	+lsKObCkWac9SXlpcv12GTD+BD7PvfDjC17GMJAaHYlgtykn3SwFKvXz+eBNsv81hkoXzQfk/1X
	fgUO11+z2qEqag+dXZ7HQWuJ3Ye7f8IpbDl
X-Google-Smtp-Source: AGHT+IHlONdUxnKPMzR918fP5TCT6hUIXe21g6x+7aU+CsbYDUYtOl0z3OvUaeiwAsYrhNS3jtYrLUJ1Rc/RJ4DvR8Q=
X-Received: by 2002:a53:e00e:0:b0:633:acd8:cd70 with SMTP id
 956f58d0204a3-63ccb905443mr9326455d50.33.1760087446016; Fri, 10 Oct 2025
 02:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250612100705.21988-1-frediano.ziglio@cloud.com>
 <586a66e5-4b11-485e-955a-da5fc3183737@citrix.com> <aN6H8dOlea2Um8y8@mail-itl>
 <1708c939-4b06-4d09-acb8-6965383d91f4@suse.com> <aOUiU86LtvsVFukW@mail-itl>
 <e3db4a71-336c-4039-a2fc-7997fadc81b3@suse.com> <aOeeMtiJEhdEiadg@mail-itl>
In-Reply-To: <aOeeMtiJEhdEiadg@mail-itl>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Fri, 10 Oct 2025 10:10:34 +0100
X-Gm-Features: AS18NWDAr6_E95Oeb4uDw3N3sjkQylfaY3x3K7og0Cv4AsJHhfuxXRzmfnDuMZk
Message-ID: <CAHt6W4dDQOPZzBkD+rwYfJ6DzyWXM32NbGQwngoGrVuwyyXahg@mail.gmail.com>
Subject: Re: [PATCH v2] xen: Strip xen.efi by default
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio <frediano.ziglio@cloud.com>, 
	xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Daniel Smith <dpsmith@apertussolutions.com>, 
	"michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 12:56=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Tue, Oct 07, 2025 at 04:46:17PM +0200, Jan Beulich wrote:
> > On 07.10.2025 16:23, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Tue, Oct 07, 2025 at 04:12:13PM +0200, Jan Beulich wrote:
> > >> On 02.10.2025 16:10, Marek Marczykowski-G=C3=B3recki wrote:
> > >>> On Thu, Oct 02, 2025 at 02:05:56PM +0100, Andrew Cooper wrote:
> > >>>> On 12/06/2025 11:07 am, Frediano Ziglio wrote:
> > >>>>> For xen.gz file we strip all symbols and have an additional
> > >>>>> xen-syms file version with all symbols.
> > >>>>> Make xen.efi more coherent stripping all symbols too.
> > >>>>> xen.efi.elf can be used for debugging.
> > >>>>>
> > >>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > >>>
> > >>> Generally,
> > >>> Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> > >>
> > >> Just to double check: You offer this after having read (and discarde=
d) my
> > >> comments on v1, which v2 left largely unaddressed?
> > >
> > > You mean the one about objcopy result used for debugging? I didn't se=
e
> > > that before, since I wasn't in cc on v1...
> > >
> > > Anyway, are you aware of some specific objcopy issue. Or in other wor=
ds:
> > > would xen.efi.elf _currently_ be broken (as in - unusable for
> > > debugging/disassembly)?
> >
> > I can't tell. I've seen fair parts of the code in the course of address=
ing
> > various issues, and I would be very surprised if all of that was workin=
g
> > correctly.
> >

Yes, sorry about not replying to this part. At the time I was testing
the various usages we do with that file before replying. Beside
debugging we use it for automatic crash dump analysis and live
patching. Unfortunately live patching was not working for reasons not
bound to this change and it tooks a while to fix it. Once fixed live
patching all our use cases of the ELF-translated file are working
perfectly confirming that the file works correctly.

> > > If not, then I take that relevant part of your
> > > objection is mostly about inconsistent naming (xen.gz -> xen-syms, vs
> > > xen.efi -> xen.efi.elf). Would xen-syms.efi.elf be better?
> >
> > Plus the one asking to strip only debug info, but not the symbol table.
> > (And no, none of the suggested names look really nice to me.)
> >
> > Plus the one indicating that the change better wouldn't be made in the
> > first place. As said, to deal with size issues we already have machiner=
y
> > in place. Not very nice machinery, but it's apparently functioning.
>
> I'm of the opinion that defaults matter. Just having ability to build a
> binary that works on more systems is not sufficient, if you'd need to
> spend a day (or more...) on debugging obscure error message to figure
> out which hidden option to use to get there. And while one could argue
> that CONFIG_DEBUG=3Dy builds are only for people familiar with details to
> deal with such issues, IMO just CONFIG_DEBUG_INFO=3Dy shouldn't need
> arcane knowledge to get it working... And since that's a common option
> to enable in distribution packages, person hitting the issue might not
> even be the one doing the build (and thus controlling the build
> options).
>
> As for the details how to get there, I'm more flexible. Based on earlier
> comments, it seems that (not stripped) xen.efi isn't very useful for
> debugging directly, an ELF version of it is. So IMO it makes sense to
> have the debug binary already converted. But if you say you have use for
> xen.efi with all debug info too, I'm okay with keeping it too, maybe as
> xen-syms.efi. It's a bit of more space (to have both efi and elf version
> with debug info), but since it doesn't apply to the installed version,
> only the one kept in the build directory, not a big issue IMO.
>

Frediano

