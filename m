Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FB2B0A3BC
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 14:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048611.1418808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucjlQ-0001RY-AP; Fri, 18 Jul 2025 12:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048611.1418808; Fri, 18 Jul 2025 12:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucjlQ-0001P8-7M; Fri, 18 Jul 2025 12:00:32 +0000
Received: by outflank-mailman (input) for mailman id 1048611;
 Fri, 18 Jul 2025 12:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ry9=Z7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ucjlP-0001P0-LD
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 12:00:31 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca575b63-63ce-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 14:00:26 +0200 (CEST)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-61593d51267so873843eaf.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 05:00:26 -0700 (PDT)
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
X-Inumbo-ID: ca575b63-63ce-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1752840025; x=1753444825; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGbUZqPcCWUiF8dTbkA43hymVBRkhAm0KAIaZL9UOUM=;
        b=JrNRGt9xx62bgh1/xcwJOgfIha6LHfC8OfBfwNFhITe/QdBsnFLiJISWQSDEz+AfEZ
         +bwqrpK8DpYLgmjm9RtB/3ZFzwReMfomFiXohJcef7bgy/fa36oMtOwIvvdxdgStfaGA
         1LCw4EF/v/BUP6A+ZLBj5Ha7DhDqX0013XjOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752840025; x=1753444825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGbUZqPcCWUiF8dTbkA43hymVBRkhAm0KAIaZL9UOUM=;
        b=YVSkdohE3W6yTq9t65qW7CmM1fVijQQz0RTo1dYmI6yeY27R8i/VtvFrUVSROZLx1o
         4T9tnKEpqKa5OyeJJsGvKntlI+bxckIbTCh4aoZyapg7aEqTgA2z4lI4l1DjFop0rOpe
         Cfbno4B9FFfjfy8B9jG3eWPjr71o1Uq15UOHUjKmOtkucEYSK416JjcXZQTQXO0qA6tM
         0FF4UNZ+JTmRK1CRYankZqJV36ElAVOuEG0aqlqMTVkh0fdMA9I+NFVCu/zs+IHTxuLb
         7LjCyfHWEw9pWrhWTtYprW8GKjo0dXA9/CqEC0vA0Km1G4sHmGfYOwsAsxxA6ZPfO0+H
         GQ3w==
X-Gm-Message-State: AOJu0YzD4WJUQ/EjekNQABu17OrSCI1XnwsWEQPXZ+ewe/2hOCoJ7Ury
	9HyXU5Tt8gATYpgA0a0BLiuDkaATjveJ81/uoESBqtKB5kBNu0ETqTDaID2kiUmg5JU0q241WTI
	UHUyarR36KcsqemJCksoVAP9C3uVBu0/0KjoqEEQEXQ==
X-Gm-Gg: ASbGncsot98MUqdrDL7Ip2um/EPArG/YTb7fZqTNeQXFgpb46uH66YGUqdOZq7lS4AM
	Dahhv+62StluxIZQqjFm1hEqw5xba63qVm1cs31CkJTGWcuIt4plwM2HSQ8PVrIGM5kg9Tw95wB
	xmLHw5m9342xSFtptp6W/KiB0hVsWz1jPlPSS4/BN9cvoEXAs7zfZ4ffe/1nLFohfaDUEnHLCrQ
	/w4+HA=
X-Google-Smtp-Source: AGHT+IFmCPPno+3qfNoc97A+pRNM2vN/csvlcKSKKpCdRp6MaPs19fUEdeTT6hoULtG2+ZCJO0E9ZXmWvO4FWpT5X1k=
X-Received: by 2002:a05:6820:3087:b0:613:bd19:54fb with SMTP id
 006d021491bc7-615a1ed6487mr7642740eaf.2.1752840024897; Fri, 18 Jul 2025
 05:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250718094139.19351-1-frediano.ziglio@cloud.com> <a0e250fe-8b88-4c54-8554-1e488bd58c28@citrix.com>
In-Reply-To: <a0e250fe-8b88-4c54-8554-1e488bd58c28@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 18 Jul 2025 13:00:14 +0100
X-Gm-Features: Ac12FXzgj0n1LDnQYLke3A44VFnsYrXVtgpO95qflbqykQ-atgdov_46TWRaAN8
Message-ID: <CACHz=ZhUCWK2jjyfw2PLUV5D0-o3HQEGEBWgDa_b3fL5K8jmwA@mail.gmail.com>
Subject: Re: [PATCH] xen/efi: Reuse PrintMessage function
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2025 at 12:12=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 18/07/2025 10:41 am, Frediano Ziglio wrote:
> > PrintMessage function print a message string followed by a
> > new line.
> > Move the function from ARM specific code to common code.
> > Reuse it in EFI code.
> > No functional changes.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> Please no.
>
> Hiding \n (or \r\n) in strings is an antipattern and a source of
> confusion that we do not want in Xen.
>

I didn't realize it was not a Xen pattern. I found the thing not that
coherent between x86 and arm and attempted to fix it.

> Instead, delete PrintMessage() and convert ARM to use PrintStr().  That
> looks like it was premature anti-optimisation.  You save 4 bytes per
> string, but it costs 12 byte minimum in .text to set up the function
> call, let alone the function call itself.
>

To be honest I didn't consider this aspect and I don't feel it matters much=
.
Looking at other languages printing an implicit newline is pretty
common, Pascal has "Wtite" and "WtiteLn", Ocaml has "print_string" and
"print_endline", Python has an "end" parameter which by default is the
newline, Basic (if I remember) has the possibility of an implicit
empty field. In C is not so common although there's "puts" and some
functions (like "syslog") have some kind of implicit newline.
But obviously Xen is not any of them.

As I said above however my main reason is coherency so I'll post your
suggestion.

> ~Andrew

Frediano

