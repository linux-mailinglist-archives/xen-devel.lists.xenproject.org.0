Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567C287BED5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 15:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693283.1081191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkm0l-0002uA-9d; Thu, 14 Mar 2024 14:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693283.1081191; Thu, 14 Mar 2024 14:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkm0l-0002rX-6r; Thu, 14 Mar 2024 14:24:47 +0000
Received: by outflank-mailman (input) for mailman id 693283;
 Thu, 14 Mar 2024 14:24:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k6je=KU=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkm0j-0002rN-UJ
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 14:24:45 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ab345bb-e20e-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 15:24:44 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d208be133bso13972551fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 07:24:44 -0700 (PDT)
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
X-Inumbo-ID: 9ab345bb-e20e-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710426284; x=1711031084; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eE9q4Q01UYQYqY5fwC6tqKiprWoMreG95et3p+5+Q9k=;
        b=KTDcODzP5HiUjbTJs4dhEzxXDIzQYlGyDESxAj1bcaqEkchZON6t6DglJwHem8kUwZ
         BqNdTnk3VbhpUyovzEuZ1ddz4NqrUkXStdQ+ZOWYlhOYKJoGk0qmSuW6y1CNgTUQJWv+
         hTDB118CVq3YDl7QRGYUSYhkfgsgYQRmgq2nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426284; x=1711031084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eE9q4Q01UYQYqY5fwC6tqKiprWoMreG95et3p+5+Q9k=;
        b=bpEPiQZluoY4K7cWNK326J4pskdThmMA53naD2+tSZlyVlNRoXTxMsbJDtM+CkG5iM
         4IVWDK0oXsb+NvvyKK2yozSYsn11tsQrD5YdZQg0zayFUZ9CRDP6USw5DrxSffHnVK3x
         cm2D0WQ3hEefpSb++U5GLd57T31OrJaDLT2wKD1zVgYLy1TuQzLyxMz4L8YNqobe5h5t
         MQeu/t0FxANb2gPkwP5DCljYlWb2xWmbDPTbBl3vBuokuLEtyc357QYPumZHichSNFI2
         tN6nowieTq8r8DG+SeUNqkh2Gti8z/njhnbDxxKQkmXQaKTaVhIqilmnZ+YTe+F8jBhT
         KnRw==
X-Gm-Message-State: AOJu0YxOsKzbhIXjP/xMlVsl9lOOkiGUillwvfZo6KnPwr/xqjTfin3p
	aeGNog9RiEYbtNo2xZkpe+WzTDu/V2UAOBcSoTW2o0HOfZId4kvvDMVfGbTN3WNp6uhuicyG5Qf
	BNq+6aebdIV8V2QW+RLCjB1GuUULq5p5+8D4CzzysELIFbbR95EE1
X-Google-Smtp-Source: AGHT+IGvh0qoWbbG2d+SvduVPKKMqsK/Z0ugqZHGsWLdzsNVC5nhhv1ttkMdHOFkyicUGvbNpEM9qot11RQYXjpDaOM=
X-Received: by 2002:a2e:9bc3:0:b0:2d4:4777:e2d8 with SMTP id
 w3-20020a2e9bc3000000b002d44777e2d8mr135371ljj.13.1710426284181; Thu, 14 Mar
 2024 07:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
 <20240313150748.791236-2-ross.lagerwall@citrix.com> <c6e79962-0537-4ed8-b99f-f2614f5a7987@suse.com>
 <CAG7k0Ep6fDfjKXj-iwuGh=pF_BS-1EaT9kRm1xJTZ=bmt=3+rA@mail.gmail.com> <d2be3727-3a94-408f-a751-e91792c9d15c@suse.com>
In-Reply-To: <d2be3727-3a94-408f-a751-e91792c9d15c@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 14 Mar 2024 14:24:31 +0000
Message-ID: <CAG7k0EoHs7WZrgL4ixZWvfc1VUv40pQe=qt8WTLMdQhBv54ngA@mail.gmail.com>
Subject: Re: [PATCH 1/7] multiboot2: Add load type header and support for the
 PE binary type
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Daniel Kiper <daniel.kiper@oracle.com>, grub-devel@gnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 1:37=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 14.03.2024 10:30, Ross Lagerwall wrote:
> > On Thu, Mar 14, 2024 at 7:24=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 13.03.2024 16:07, Ross Lagerwall wrote:
> >>> In addition to the existing address and ELF load types, specify a new
> >>> optional PE binary load type. This new type is a useful addition sinc=
e
> >>> PE binaries can be signed and verified (i.e. used with Secure Boot).
> >>
> >> And the consideration to have ELF signable (by whatever extension to
> >> the ELF spec) went nowhere?
> >>
> >
> > I'm not sure if you're referring to some ongoing work to create signabl=
e
> > ELFs that I'm not aware of.
>
> Something must have been invented already to make Linux modules signable.

Linux module signatures operate outside of the ELF container. In fact,
AFAIK the actual signed content could be anything. The file format is:

* Content (i.e. ELF binary)
* Signature of content in PKCS7 format
* Signature info, including signature length
* Magic marker: "~Module signature appended~\n"

This kind of arrangement does indeed work but it is fragile. Since the
signature is on the entire contents and tools that understand ELF don't
parse the signature, any transformation of the binary (e.g. to
strip out debuginfo) will cause the signature to be lost / invalidated.

Nevertheless, this could still be an option for Xen if this is
deemed to be a preferred solution by others. It would be good to hear
some opinions on this.

>
> > I didn't choose that route because:
> >
> > * Signed PE binaries are the current standard for Secure Boot.
> >
> > * Having signed ELF binaries would mean that code to handle them needs
> > to be added to Shim which contravenes its goals of being small and
> > simple to verify.
>
> Both true, but neither goes entirely without saying, I suppose.
>
> > * I could be wrong on this but to my knowledge, the ELF format is not
> > being actively updated nor is the standard owned/maintained by a
> > specific group which makes updating it difficult.
>
> And PE/COFF isn't under control of a public entity / group afaik, which
> may be viewed as no better, if not worse.

Agreed, I guess my point was that PE/COFF doesn't need to be updated to
support signing because it already supports it.

Thanks,
Ross

