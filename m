Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D480AB4ED0
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 11:05:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982702.1369052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uElZZ-0007e0-8W; Tue, 13 May 2025 09:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982702.1369052; Tue, 13 May 2025 09:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uElZZ-0007bX-5f; Tue, 13 May 2025 09:05:13 +0000
Received: by outflank-mailman (input) for mailman id 982702;
 Tue, 13 May 2025 09:05:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pn5q=X5=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uElZX-0007bB-8O
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 09:05:11 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d8d415b-2fd9-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 11:05:08 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-605fda00c30so2016913eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 02:05:08 -0700 (PDT)
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
X-Inumbo-ID: 5d8d415b-2fd9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747127107; x=1747731907; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5YqzDx1E8TGH+bAdDvHfGPqVZAPBd2+UY+KXP6zMug=;
        b=AUBOOPzQuGanY3CC4rUY2GNFvkNJq58hvzrJE3noePG3LiCC3EP3XaNTqgSQk0V+a4
         mE4A2GCQW1QLkgXaa2ndCOnjj1MXIuFAqB3J9EioLmhMpqN7iv5PlYJW7aOTEz6pOkeN
         cT4kwyJermVzZ9Ar44SNXpIPYKsmFemzezgJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127107; x=1747731907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5YqzDx1E8TGH+bAdDvHfGPqVZAPBd2+UY+KXP6zMug=;
        b=azVVB32Vb5S0WbnNhjoslBKEiugugp+HtNw0VWxy8LbA9eeUSxKxzVIetCpesYNj+K
         2BcmsWDx6MixwIcNaIreBKCNsyFcVs/sO9GSuAVuZG9YQry1U1WlhFla1y5f4JBoJ+jL
         XtXeco9ugBSRBgeA9FC/GHNgaE8H496yWsqNRy/e20Lg+uiwleU7+CSKtD+EGoCBMskr
         /I0rQE3wodAAx318CB1EmLMw1s30X2tNn5PDEBdNuoSJD/wvO98DWOCOXRiw5UAKs5eG
         EQXe+ZLZYXpkzyMCgANSltd6FIUB4gsZvnHbkvP4knD3FjyEMKidopPo2pQrnjcvy1yp
         rMbA==
X-Forwarded-Encrypted: i=1; AJvYcCVmaobk18r3JUmWRfhvPe6RLXlvsD0dXBinABnQXrC9yv8VTIh2BI5HLaiDHLt1dd3qDyK1PM/qUwE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwflHKZ44HiQO5YELWR2Hr2IAn/G+wDgGNGq0q3/KVMa95oAB22
	cw4W398L8WqbNQSkzFxu5edy2nWTeSR7aJjajAY3DPt/u+SPE8cQONxUaHud1SGanoenARwAdbh
	Kz8x3bK5+lUiJqY6TMwlbeb99BK6anI4OfbAC
X-Gm-Gg: ASbGnctpj5ymnxnoRdJgydefTsSFjyjkZw2f40S3/dT6WF89vFugz8InSI+33SDOOMp
	pTRHslCG7TH1fDmNsL/K3EJDPErahh433oUUML23QFUkrrpzvUNr2gyG60RHPyxEUHK+SqNXd8a
	BcWQswLbrMujw1un6xskuL2ZKwFMfN/wyK4ir5YJMC4w==
X-Google-Smtp-Source: AGHT+IFmmPau44n8iNx0hOeKpyiUSNa5JIMLuXHPIMsjcRoUP+MZwAHED9EHPm8XLRuthW5MM3Ztv4/bXvID9YGpk0c=
X-Received: by 2002:a05:6870:70aa:b0:2d5:296d:4ed4 with SMTP id
 586e51a60fabf-2dba4524cd2mr9907879fac.28.1747127107535; Tue, 13 May 2025
 02:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
 <20250509161846.45851-1-ross.lagerwall@citrix.com> <5e3a8054-53aa-490f-a60e-44ed34cbc74b@suse.com>
In-Reply-To: <5e3a8054-53aa-490f-a60e-44ed34cbc74b@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 13 May 2025 10:04:56 +0100
X-Gm-Features: AX0GCFvv1etXaX0okBUXHL_tFfxIbkHqga8YlRf-HW7sNkl-oBWGm5BC2ERVAZw
Message-ID: <CAG7k0EpfJURuuV55XTC3Xny9STYiaGsy16VG+Ly1Wr9LvJiMpA@mail.gmail.com>
Subject: Re: [PATCH 1/4] docs: Introduce live patch signing
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 1:19=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 09.05.2025 18:18, Ross Lagerwall wrote:
> > --- a/docs/misc/livepatch.pandoc
> > +++ b/docs/misc/livepatch.pandoc
> > @@ -917,6 +917,58 @@ The normal sequence of events is to:
> >   3. *XEN_SYSCTL_LIVEPATCH_ACTION* with *LIVEPATCH_ACTION_APPLY* to app=
ly the patch.
> >   4. *XEN_SYSCTL_LIVEPATCH_GET* to check the `->rc`. If in *-XEN_EAGAIN=
* spin. If zero exit with success.
> >
> > +## Signature Checking
> > +
> > +While loading live patches would generally be restricted to a privileg=
ed
> > +process in dom0, in certain cases signature checking in Xen may be req=
uired.
> > +For example, when Secure Boot is enabled live patches need to be verif=
ied
> > +before being loaded.
> > +
> > +Xen live patches are ELF binaries but there is no standardized mechani=
sm for
> > +signing ELF binaries. One approach used by Linux is to append a signat=
ure to
> > +the end of the binary, outside of the ELF container. While this works,=
 it tends
> > +to be fragile since tools that handle ELF binaries do not correctly ha=
ndle the
> > +signature. Instead, the approach taken here is to use an ELF note for =
the
> > +signature.
> > +
> > +The ELF note section name shall be `.note.Xen.signature` with note nam=
e `Xen`
> > +and type `0`.
> > +
> > +The note data shall contain a header followed by the signature data:
> > +
> > +    #define SIGNATURE_SUPPORTED_VERION 1
>
> I don't think this is a good name (leaving aside the typo); conceptually
> multiple versions could be supported. Otoh live patches are hypervisor
> build specific anyway, so it's hard to see why a version would be needed
> in the first place. Alternatively should version or ...

How about LIVEPATCH_SIGNATURE_VERSION (analogous to
LIVEPATCH_PAYLOAD_VERSION)?

I think keeping the version is harmless and may cover some future
scenario I haven't considered, even if it is not strictly necessary at
the moment.

>
> > +    #define SIGNATURE_ALGORITHM_RSA 0
> > +    #define SIGNATURE_HASH_SHA256 0
>
> ... these two be encoded in the note's type, instead of leaving that
> effectively unused?

That's a good idea. The version, algorithm, and hash can be encoded in
the type and the signature length can be encoded in the note descriptor
length and that would allow removing the signature header completely.

>
> > +    struct payload_signature {
> > +        uint16_t version;
> > +        uint8_t algo;        /* Public-key crypto algorithm */
> > +        uint8_t hash;        /* Digest algorithm */
> > +        uint32_t sig_len;    /* Length of signature data */
>
> Should there be a minimum length specified, to ensure security at least
> for the moment (before e.g. quantum computers can break things)?

I'd prefer to leave that policy to the distros who use this
functionality rather than trying to keep up with what is currently
considered secure.

>
> > +    };
> > +
> > +To sign a live patch:
> > +
> > +1) Add a new note section with a populated payload signature and zeroe=
d out
> > +   signature.
> > +2) Generate a detached signature over the entire binary.
> > +3) Fill in the signature in the note section.
> > +
> > +During live patch load, Xen shall verify the signature using the follo=
wing
> > +steps:
> > +
> > +1) Copy the signature out of the note section.
> > +2) Zero the signature.
> > +3) Generate a detached signature over the entire binary.
> > +4) Compare against the signature from (1).
> > +
> > +Initially, to avoid including DER / X.509 parsing of certificates, han=
dling
> > +chains, etc. Xen shall verify signatures against a compiled in RSA key=
 in
> > +exponent/modulus form.
>
> And this is sufficient to satisfy (Microsoft's?) requirements?
>

To my knowledge Microsoft has not stated explicitly how various
components in the OS should be verified / secured. However, their
current requirement is that firmware is verified using at least RSA-2048
with SHA-256 so with a sufficiently large key this would cover that,
assuming they apply the same requirement to the OS.

Ross

