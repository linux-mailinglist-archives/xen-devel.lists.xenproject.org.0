Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB8C9C3D07
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 12:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833593.1248773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASUl-00084Y-Fp; Mon, 11 Nov 2024 11:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833593.1248773; Mon, 11 Nov 2024 11:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASUl-00081x-CF; Mon, 11 Nov 2024 11:22:11 +0000
Received: by outflank-mailman (input) for mailman id 833593;
 Mon, 11 Nov 2024 11:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNnr=SG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tASUk-00081p-Er
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 11:22:10 +0000
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e50d4d6-a01f-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 12:22:06 +0100 (CET)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5ebc0dbc65dso2126156eaf.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 03:22:06 -0800 (PST)
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
X-Inumbo-ID: 2e50d4d6-a01f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpjMmQiLCJoZWxvIjoibWFpbC1vbzEteGMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJlNTBkNGQ2LWEwMWYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzI0MTI2Ljg4NzI5MSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731324125; x=1731928925; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZVJGjRydN2DLENj02s9jTif2zAXBMwENRaV6Cm60gk=;
        b=Mu43kv1IrQ26jgsK8+eUwr9jKtOXDAGaRSklysHkyIvSOiaxUwjbEbaFp2pvjcfI56
         +utMz35vd7rqB4sgV/natm/KLXz4GXo8o0IbOyo4HohweyXVCk3tPUqBKLQcGf6zZovX
         U9cR//Ei35CYfMbvYBQrkXDvKZlLrlZEpIV0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731324125; x=1731928925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZVJGjRydN2DLENj02s9jTif2zAXBMwENRaV6Cm60gk=;
        b=OLU6t+BgRAvg+r7DWKX9oSBqN2s5zaiuj1XKzhum0vbgn6YsKhO3d2jiqYA/VugOBQ
         1XCiBba63LZWocLax02tFfqt4fLcfEwmJOHqHnUXcM6BvGBtfLAJLGBsFFWqJwtDyw51
         L6nPt6BLkF9mnWClAFmKEs/9fn58W/bQA6+UvAooZFmmXw2rhn7QqwpjNyTtnwdJl6hh
         aKpQwZp0VyQi7AmPaJ1WCA/ZkFVwKymBKaDPKnU7O96bdmUIFwwxx8isDy3Gp07Jc/BG
         A8dX9iM4WU68X8TfzNDnC0NzAYkLoG5g1W5kpVj8zBXrFqufnE/i/aW8xb6hmbqJ9lCS
         Dr+g==
X-Gm-Message-State: AOJu0Yz+lKnt0r74vY1asI59aHdYV5qVLlw3nJPQbTt8J9c9NljRy2Au
	zfNc2JCzNRKenr+gDLTg6axXB9Wjsaurp5HB0rWMsxF8WgcTLb2C2d35p32vHCfRoqRNFa6/N8v
	R4Uyxfkj8imsG863hwBKv+wgUPDSs6azIl+d9PA==
X-Google-Smtp-Source: AGHT+IGgPOLDYKsNpnewujfp4+Tl1B4HceuEfh1n6WIqGwQz3oG4hqgq7gKZ4CSGqHfXD3cW1APQC/w+cAb8IeLW2aY=
X-Received: by 2002:a05:6820:8c8:b0:5eb:75a9:3aac with SMTP id
 006d021491bc7-5ee57c61091mr7048602eaf.6.1731324124753; Mon, 11 Nov 2024
 03:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20241109003654.884288-1-andrew.cooper3@citrix.com>
 <CACHz=ZjBiEkXCGayGSdFUUc0eCFqSvGGSyFDMmRc76Nz_aP9QA@mail.gmail.com> <1ace53f6-dd00-4277-9e91-4f3117facd38@citrix.com>
In-Reply-To: <1ace53f6-dd00-4277-9e91-4f3117facd38@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 11 Nov 2024 11:21:54 +0000
Message-ID: <CACHz=ZgjpZ5TkwwDrbCZkOG1XnjAV7uGxDqZGYu_StTMAPKD0w@mail.gmail.com>
Subject: Re: [PATCH] x86/wakeup: Fix code generation for bogus_saved_magic
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 11:05=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 09/11/2024 5:29 pm, Frediano Ziglio wrote:
> > On Sat, Nov 9, 2024 at 12:37=E2=80=AFAM Andrew Cooper <andrew.cooper3@c=
itrix.com> wrote:
> >> bogus_saved_magic() is in a .code64 section but invokved in 32bit mode=
.  This
> > Typo: invoked
> >
> >> causes a real encoding difference.
> >>
> >> Before:
> >>   66 c7 04 25 14 80 0b 00 53 0e    movw   $0xe53,0xb8014(,%eiz,1)
> >>
> >> After:
> >>   66 c7 05 14 80 0b 00 53 0e       movw   $0xe53,0xb8014
> >>
> >> The differnce happens to be benign, but move the logic back into a .co=
de32 for
> > Typo: difference
>
> Thanks.  I'd noticed and fixed up locally.
>
> >
> >> sanity sake.  Annotate it with ELF metadata while doing so.
> >>
> >> Fixes: d8c8fef09054 ("Provide basic Xen PM infrastructure")
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>
> >> This issue dates back to the very introduction of S3 support in Xen, i=
n 2007.
> >> ---
> >>  xen/arch/x86/boot/wakeup.S | 9 +++++----
> >>  1 file changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
> >> index 08447e193496..c929fe921823 100644
> >> --- a/xen/arch/x86/boot/wakeup.S
> >> +++ b/xen/arch/x86/boot/wakeup.S
> >> @@ -153,15 +153,16 @@ wakeup_32:
> >>          /* Now in compatibility mode. Long-jump to 64-bit mode */
> >>          ljmp    $BOOT_CS64, $bootsym_rel(wakeup_64,6)
> >>
> >> +FUNC_LOCAL(bogus_saved_magic, 0)
> >> +        movw    $0x0e00 + 'S', 0xb8014
> >> +        jmp     bogus_saved_magic
> >> +END(bogus_saved_magic)
> >> +
> >>          .code64
> >>  wakeup_64:
> >>          /* Jump to high mappings and the higher-level wakeup code. */
> >>          movabs  $s3_resume, %rbx
> >>          jmp     *%rbx
> >>
> >> -bogus_saved_magic:
> >> -        movw    $0x0e00 + 'S', 0xb8014
> >> -        jmp     bogus_saved_magic
> >> -
> >>  /* Stack for wakeup: rest of first trampoline page. */
> >>  ENTRY(wakeup_stack_start)
> > Hi,
> >    I agree with the code move, it's supposed to be 32 bit so it should
> > be in the 32 bit section.
> > Does the ELF annotation help with debug information? Maybe worth
> > adding to the comment.
>
> As said in the commit message, it's simply ELF metadata (symbol type and
> size).
>
> It doesn't interact with debug symbols, so far as I'm aware.
>
> It's mainly for livepatching (the ELF metadata is how changes are
> identified), but we're applying it uniformly to all assembly as a
> cleanup activity.
>

I don't think livepatching this code would be so easy. That code is
copied to low memory and discarded (.init section) later, so patching
the code in the current ELF code would corrupt Xen memory.

> > OT: If I understood correctly, the code is writing a character on
> > screen in a tight loop. Maybe an hlt instruction could be helpful?
>
> Yeah, it's not exactly great code, but it needs more adjustments than
> just a hlt.
>
> It ought to know about CONFIG_VIDEO, and ideally video=3Dnone.
>

In head.S we write messages in both VGA (if possible) and serial.
Anyway... out of scope here.


> > Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> Thanks.
>
> ~Andrew

Frediano

