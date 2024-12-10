Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2FA9EB34E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:29:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852535.1266301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1Ew-0001tK-W3; Tue, 10 Dec 2024 14:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852535.1266301; Tue, 10 Dec 2024 14:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1Ew-0001qN-St; Tue, 10 Dec 2024 14:29:30 +0000
Received: by outflank-mailman (input) for mailman id 852535;
 Tue, 10 Dec 2024 14:29:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVUM=TD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tL1Eu-0001ph-V5
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:29:28 +0000
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28a5722d-b703-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 15:29:27 +0100 (CET)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3eb7934a948so143023b6e.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:29:27 -0800 (PST)
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
X-Inumbo-ID: 28a5722d-b703-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733840966; x=1734445766; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWW5naczYNd45v8bpPkM9yKFkCN9DJw7HpGuugwtxdk=;
        b=NWo8Ye8/egWykI7kv23k/HidX7uBVSlgPOgF9eEunBNpNgKKQalG91dLwza4kRxWyW
         l8q5deUScBLU+3U8WdVLO6eGR3K5uizNQGkIaHI8BEW5nTekaiFMnQyCUI2wFXDXomwE
         L4n6cJfVYEuV8K/r6BQ4KumWf7NfrhqN865ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733840966; x=1734445766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWW5naczYNd45v8bpPkM9yKFkCN9DJw7HpGuugwtxdk=;
        b=gZauvtffjjfyBNnQ7KKEHakQjtSK0edWbSzyN4LdwQN1biG1u0zCU+qQ/iHLDr/exd
         eWzfxumnf6rlRWtbgZUjFpsk6GFep/RT1X1EKBVYMiFc6jSZDhRVNtaPHrzEJViiYECq
         DS63rlfTV8YX3tN1DsCXY+G5IhBmDAaSe61nV+4rkBS67uPtVyk8R99Uo9Mqyb/mi6eo
         S2UhZ8t0N9wWAjVNYJf3rqR4E1usDl/Yr66QLP1akpMaaSfLRn7wWoFRUkmZ39if4Ub4
         cXghhWXNBk3LNfE+R4JDQW3gAdvAFPkC07UfJ29nHRpSweVXFtzSGpUOeXegJ30m4+uE
         P+6g==
X-Forwarded-Encrypted: i=1; AJvYcCVxSCyKdjl37UxHVeGTk3g4QNR/I9CC7xfKZJFWiCE4FeLiZzTHjOyRYN/b+Xt+4O8cE4MEUGB8cqo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAuNzjl9g22LhT6/jJAg4v7PuXnV22yckpUpag1/PnrTzjSiSo
	VKlQwePbNyZNQ2l0VVz81fvh+/K2WCH9PMf/Pt4b1LLyTRPDXjBD48l3x+Ilh7TMIZmUNMaog7i
	yJswKCu6+H1RCTy3W37mStWMkXKYKpLs5g956OQ==
X-Gm-Gg: ASbGncuEwZqSucA38ZcgrIMRc0ti+6fERtCT/krbEsQc9aNu46PGW7mo+7VBrLGMAmr
	ddeFmFdmPiDcDUM0Qr/mdGsRrqQXUl2svCU70mw==
X-Google-Smtp-Source: AGHT+IFVNmBT0BEW3PUcKek50XhjepwVDT5qVOlUfiNLlnvrhgPcEwwNjf/QWMTnIWl1b1UrkRVkTJuJ7fc+d0GoX4M=
X-Received: by 2002:a05:6870:9d05:b0:29e:526a:eeef with SMTP id
 586e51a60fabf-29f7389c828mr11009779fac.34.1733840966093; Tue, 10 Dec 2024
 06:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
 <20241122093358.478774-2-frediano.ziglio@cloud.com> <f1586637-9d09-405b-8da3-c98d4e38f839@suse.com>
In-Reply-To: <f1586637-9d09-405b-8da3-c98d4e38f839@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 10 Dec 2024 14:29:15 +0000
Message-ID: <CACHz=ZgyxwCVq1Zvwz9oVQO=-e85Sy8CnvyspK_-FFB4FTGyrA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] Use an include/boot directory to override headers
 for boot code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 10:14=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 22.11.2024 10:33, Frediano Ziglio wrote:
> > Not all headers can be used by 32 bit boot code.
> > Allows to override some headers, we don't want to mess up with
> > main headers as most of the code is only 64 bit so the easy stuff shoul=
d
> > be done for 64 bit declarations.
> > Boot headers should be 64 bit compatibles to avoid having multiple
> > declarations.
>
> I'm afraid that in isolation it's not clear what is intended. Boot code i=
s
> all located in a single directory. Can't we use local headers there, usin=
g
> #include "...", instead of ...
>

That approach was refused. Some definitions are in the headers (like
CPU features for instance) but duplicating the definitions was
rejected as a solution.
So the idea is to reuse such definitions. But, as stated in the
comment, the "x86" includes are not for x86, but most of them are just
for x64.This for historic reasons. But most of the code is x64 only so
changing headers to be x86 compatible would complicate them for a
minimal gain.

> > --- a/xen/arch/x86/boot/Makefile
> > +++ b/xen/arch/x86/boot/Makefile
> > @@ -18,7 +18,7 @@ CFLAGS_x86_32 :=3D $(subst -m64,-m32 -march=3Di686,$(=
XEN_TREEWIDE_CFLAGS))
> >  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> >  CFLAGS_x86_32 +=3D -Werror -fno-builtin -g0 -msoft-float -mregparm=3D3
> >  CFLAGS_x86_32 +=3D -nostdinc -include $(filter %/include/xen/config.h,=
$(XEN_CFLAGS))
> > -CFLAGS_x86_32 +=3D $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
> > +CFLAGS_x86_32 +=3D -I$(srctree)/arch/x86/include/boot $(filter -I% -O%=
,$(XEN_CFLAGS)) -D__XEN__
>
> ... introducing a arch-wide subdir, which non-boot code could easily (ab)=
use?
>

You would have to explicitly add the "boot" into the path, it does not
seem "easy" to me, but if you really want to do it you can do with
these or any other headers, like simply "#include "../arch/arm/..." in
x64 code. Same easiness.

> Jan

Frediano

