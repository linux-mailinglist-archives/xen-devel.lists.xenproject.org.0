Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2416956CFB
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 16:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779762.1189446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg3Bq-0003Nl-SW; Mon, 19 Aug 2024 14:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779762.1189446; Mon, 19 Aug 2024 14:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg3Bq-0003Lu-Pt; Mon, 19 Aug 2024 14:16:58 +0000
Received: by outflank-mailman (input) for mailman id 779762;
 Mon, 19 Aug 2024 14:16:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lvcB=PS=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sg3Bp-0003Ln-0n
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 14:16:57 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b009c1ae-5e35-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 16:16:56 +0200 (CEST)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7092ea69218so2808259a34.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 07:16:56 -0700 (PDT)
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
X-Inumbo-ID: b009c1ae-5e35-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724077015; x=1724681815; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/pApi+8umoTH5J9AzCFYX9iYJCXMacYCdoA/1DBtPU=;
        b=fJvCsJcx03Of2vNDh9msF8bl/GeKek0GG45b5Zw0FOf8WPwxto1NzATNLDYgvE9RbW
         K3jdBVNC/+IH8AcApLGUdTRFBfZikyuhHIV8NiopmK3F48yP3UBM0mDCJgNHFUbjDF9t
         5d2ouZVNDYZYxgsFvwgGsT30+3ZHkDGfOnxWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724077015; x=1724681815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/pApi+8umoTH5J9AzCFYX9iYJCXMacYCdoA/1DBtPU=;
        b=VqdZ1VuNkBqQIMvuboWHGJ3m/8WXuhUT6Pzyi4KCwcRj7aHn0UlwsK3VnbeDchbeQr
         /tMcmckGd3T1b6Xu8TMo6/yMjhbWi8EPiBNUoiAtbiB8oCEY2CQTTNtURNYboDah+4wd
         CRdYQ0f1tKutk5BJxucwSD9nskxGFEs8xUk8Jt9V/PysUEFe96H9b4kF4zN5pr3/Hy9I
         ylp9wmqhJ75f+3GJTaqlZfEuQqak7MSSliFHoWl1zOVuZ/mVOQJ4pLOw+bRQaMtXqgm0
         SsC9wfLR8makrzcKrOwKXdBXxjxRb1CA+z9MKP74NMaIz1TMygJq1kIQFrYV3zQOzrlZ
         0x3w==
X-Forwarded-Encrypted: i=1; AJvYcCUx0Zi2F2hs3xvjF35KFNnjWtGQBzmy/+CC02Hzh5ZtDICKP/TdUc/31FwgQ2gPv4p68LZ8P7M3EpCQ77GTzTd/LXVR/GJg1ffb1oCxBcs=
X-Gm-Message-State: AOJu0YzYFRN7bUR7lTieBWiZpmURSP1cD4aRMAm+BjwioPYCLoEn9Lub
	u5mM0LMVEGP/B9h2BlFoztkbKrAJ7TEC5gKrm6lS7TJqnkwVyzmuuepHb8QxPNYJjZplKFMt33l
	Q5Nn/XXTTRL8RAKLNX4xxgppDqS0VKc1URFA8CQ==
X-Google-Smtp-Source: AGHT+IGdB4/gDPvFnGD7YfeGp2XV5S4ND3UDqIrkFNMKGb7VAAgIHG/dkgfRMLeO1wHU2JBEdlHSSEHq3J7ZL0Ynu3M=
X-Received: by 2002:a05:6870:9619:b0:22a:57da:6fec with SMTP id
 586e51a60fabf-26fff646d06mr6458269fac.16.1724077014595; Mon, 19 Aug 2024
 07:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-2-alejandro.vallejo@cloud.com> <ad72cc97-b9dd-4e7e-93f6-333805e40785@suse.com>
 <CACHz=Zh7wK58mbB762fnevHEKW9qhp-NRJ6buNe1b-qLxP0qPg@mail.gmail.com> <b9b40658-ff13-4240-98a2-4811411e31b6@suse.com>
In-Reply-To: <b9b40658-ff13-4240-98a2-4811411e31b6@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 19 Aug 2024 15:16:43 +0100
Message-ID: <CACHz=Zj8h-TeDa2Ey8EKKEOpXJqx9MnL+AGpdTBY1B8PZ0==mA@mail.gmail.com>
Subject: Re: [PATCH 1/5] x86: Put trampoline in .init.data section
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 9:54=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 08.08.2024 10:00, Frediano Ziglio wrote:
> > On Thu, Aug 8, 2024 at 8:34=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 07.08.2024 15:48, Alejandro Vallejo wrote:
> >>> This change allows to put the trampoline in a separate, not executabl=
e
> >>> section. The trampoline contains a mix of code and data (data which
> >>> is modified from C code during early start so must be writable).
> >>> This is in preparation for W^X patch in order to satisfy UEFI CA
> >>> memory mitigation requirements.
> >>
> >> Which, aiui, has the downside of disassembly of the section no longer
> >> happening by default, when using objdump or similar tools, which go fr=
om
> >> section attributes. Why is it being in .init.text (and hence RX) not
> >> appropriate? It should - in principle at least - be possible to avoid
> >> all in-place writing to it, but instead only ever write to its relocat=
ed
> >> copy. Quite a bit more code churn of course.
> >>
> >> I wonder if we shouldn't put the trampoline in its own section, RWX in
> >> the object file, and switched to whatever appropriate in the binary
> >> (which really may be RX, not RW).
> >
> > We cannot have RWX to satisfy UEFI CA memory mitigation, that's why I
> > had to move it, code sections should not be writeable. We can mark
> > either RX or RW but we use the data very early so we are not able to
> > change the permissions (we can try with all complications that this
> > could bring like how to report an error at so early stages).
>
> The early writing could be done away with, as indicated. There's not
> really any strict requirement to write to the trampoline region within
> the Xen image. All updates to it could in principle be done after it
> was copied into low memory. Then (and of course only then) could it be
> part of an RX section in the image, maybe .init.text, maybe a separate
> .trampoline section.
>
> Jan

Hi Jan,
   how strong are you on this? Is this "objdump" thing such a big
issue? The code contains a lot of 16 bit code which would require
additional options anyway. Won't be an assembly listing output more
helpful instead?
I tried to change the code to change only the final copy of the
trampoline but it looks like lot of code assumes it can change the
source of it (that is requiring it to be in a writeable section). For
instance EFI change settings directly and then allocate space for the
copy later. The allocation could be moved but there's a fallback on
code that assumes that early allocation can fail.
The trampoline relocation is done with PC relative addressing which is
helpful if you are changing the source directly, not the copy.
Could I ouput the trampoline in a code section ("ax" instead of "aw")
and then later move it into .init.data section assuring .init.data is
writeable but not executable?

Frediano

