Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077269B4F9C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 17:41:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827708.1242390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5pH4-0001Tw-95; Tue, 29 Oct 2024 16:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827708.1242390; Tue, 29 Oct 2024 16:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5pH4-0001Qr-62; Tue, 29 Oct 2024 16:40:54 +0000
Received: by outflank-mailman (input) for mailman id 827708;
 Tue, 29 Oct 2024 16:40:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WX/=RZ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t5pH3-0001Ql-04
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 16:40:53 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d9c57fb-9614-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 17:40:49 +0100 (CET)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5eb67d926c4so12143eaf.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 09:40:49 -0700 (PDT)
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
X-Inumbo-ID: 8d9c57fb-9614-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpjMzAiLCJoZWxvIjoibWFpbC1vbzEteGMzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhkOWM1N2ZiLTk2MTQtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjIwMDQ5LjkyMTY2Nywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730220048; x=1730824848; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzPKExmdt+RrplYoyCu5aXdJlYTWZ0xvypOBeoE36/c=;
        b=e+CyMtsYtCTufHXjAgrHi8nHiBKY3iwVN0WGVsGwfFN+Wm/XKO847HexQ/RzPZOu2U
         rHDRC1ZdlY9tw55KZI4brkmusUo5JyDsxTn6vVhwneNxE/HuBv8aAG9ZFZGRnHlu06jZ
         agKN5/MyqBxh+IyXS9Sz28IObCGAByoNlrSDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730220048; x=1730824848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzPKExmdt+RrplYoyCu5aXdJlYTWZ0xvypOBeoE36/c=;
        b=YX9f4fThEOCGUrhnUbImf3uMaqE9XfS4OcIkXnz4HEm227EGF5CU9JhtbKOPHTd1Q1
         mQUnx+v92gEv+b96/AVcINF0GYnzGAT2E4GJ24uk4Dp0leWQcAwSzoZ4/YrsjqkbwoBj
         7cz92ia043hCzVq8OGeOqXjBB7iTYnCWuZ3N8SteagYb6So0k+PBQ4LtLDvsPoV359kh
         K/Uv7+gTj0/muPd+1qjN/n5vLsbpf+rnjSUvMTfpi8/FkySGpEEjDWtMCfXicG84zGQq
         LiDB3yUQ/CcoLn3e+9OrMXfVsJPhuYX8uTNhPlHY+ekpIxqbUsXx1+E6MAkBCCOJIAvh
         VMjw==
X-Forwarded-Encrypted: i=1; AJvYcCVF/6RG6K1bITdc+KsCktflUYa3wdv2RM+0x48dCzzHzMkhbilnPqE/54Ihpt2kKVbzLUhXknDs3QI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQY0rWm/7jQqZ6+YxIG60FzkCdW9vv1Jn/lIcNwS2E8YLH4An6
	13EiZMrDkb0509qQYD68vd0loZCdzagxlPghJT3d1KAJZYPWpdEM4Mm7n5//eZYBbx1ejq9aFXM
	08AfbaukYTBIaLKsvnrWGx1pMpjf4RoafkjOs0A==
X-Google-Smtp-Source: AGHT+IEdc2tRJY7iEA4I2C5t/ixmdtGwMXZueJZaDyQBwPIsGdwuUQVfkq9zgSFKTsUwZleX0euPPbwLBqDr00AE8es=
X-Received: by 2002:a05:6820:220b:b0:5e1:c6ae:d93 with SMTP id
 006d021491bc7-5ec54da4da0mr1729574eaf.2.1730220048516; Tue, 29 Oct 2024
 09:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241029102942.162912-1-frediano.ziglio@cloud.com>
 <20241029102942.162912-6-frediano.ziglio@cloud.com> <ZyD29aZqLRydMUCp@macbook>
 <864df257-dc7b-4028-932e-86f0d69debdb@citrix.com>
In-Reply-To: <864df257-dc7b-4028-932e-86f0d69debdb@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 29 Oct 2024 16:40:37 +0000
Message-ID: <CACHz=ZjHjBMt=k-tX68XqMjJXs9+1LFFXDEHHJzRqbONq6N=WA@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] x86/boot: Clarify comment
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 3:07=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 29/10/2024 2:53 pm, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Oct 29, 2024 at 10:29:42AM +0000, Frediano Ziglio wrote:
> >> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >> ---
> >>  xen/arch/x86/boot/reloc.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> >> index e50e161b27..e725cfb6eb 100644
> >> --- a/xen/arch/x86/boot/reloc.c
> >> +++ b/xen/arch/x86/boot/reloc.c
> >> @@ -65,7 +65,7 @@ typedef struct memctx {
> >>      /*
> >>       * Simple bump allocator.
> >>       *
> >> -     * It starts from the base of the trampoline and allocates downwa=
rds.
> >> +     * It starts on top of space reserved for the trampoline and allo=
cates downwards.
> > I'm afraid this line is over 80 characters long, will need to be
> > adjusted.  Maybe:
> >
> >     * Starts at top of the relocated trampoline space and allocates dow=
nwards.
>
> This patch miss misses 2 of the 3 incorrect statements about how the
> trampoline works, and Alejandro had some better suggestions in the
> thread on the matter.
>
> ~Andrew

Hi,
  changed to "Starts at the end of the relocated trampoline space and
allocates backwards".

See https://gitlab.com/xen-project/people/fziglio/xen/-/commit/21be0b9d2813=
db9c578e8a6ace76eee2445908f5.

Frediano

