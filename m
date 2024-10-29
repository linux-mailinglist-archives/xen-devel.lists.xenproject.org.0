Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326559B4FB0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 17:45:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827719.1242409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5pKo-0002w8-0L; Tue, 29 Oct 2024 16:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827719.1242409; Tue, 29 Oct 2024 16:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5pKn-0002tP-U0; Tue, 29 Oct 2024 16:44:45 +0000
Received: by outflank-mailman (input) for mailman id 827719;
 Tue, 29 Oct 2024 16:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5pKm-0002tH-4Z
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 16:44:44 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1720889c-9615-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 17:44:40 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9932aa108cso853441766b.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 09:44:39 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f0683edsm492381466b.93.2024.10.29.09.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 09:44:38 -0700 (PDT)
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
X-Inumbo-ID: 1720889c-9615-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE3MjA4ODljLTk2MTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjIwMjgwLjAwMzIyOSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730220279; x=1730825079; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UKpQ6H7KJCvfzxstBzvZFdAe35kNgbTXIXbsTG5uXc=;
        b=TGWfJJP3nhxHaYZ8RdI8Ex5el8PKqV7xGcB73EKKOZpbaJoso3XBWlt6SA05qmQK6C
         kDvfrZxLTsrA3kAHhyU8Uxxxm8fND7avkAK7j8s+wjOkgoeIKD/Pny780/5Cm0rS6UE6
         vKgertw/81oJwo5NE3G2bzl1ZnaHeQ+6RdmlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730220279; x=1730825079;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3UKpQ6H7KJCvfzxstBzvZFdAe35kNgbTXIXbsTG5uXc=;
        b=t8MyYWW+SiJe/bs6Lc+U1jEdnOuQGkBdskIqbxKRBUQ9AX7ScF7ERY+TM5HsDjJVXn
         oGoBRbcLzO0D2myIDIdjHTWqefM7gVbLD0O5TKQCoCEnAJ6RBiAiSocJYnLFQ6OH5ER9
         ZtmtmBsG88DX79lBxpOngN69Ps6g2N7GaoxnnYb75f3E2J3KJjHhsEZzn6iYguNkB6he
         hdL/6Dz+4gHaGUNcuCE2aldLUT9km0P4QgIUFsHBlFt0yjIKtrtgvcr/0aQXIcLWix0I
         bDh4t+b9zEijADRUYGHQaYA30rTep9bWT/6qXI0wmyyiz7QxTv2ixvGlgJC1jdWi5MTf
         sK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqMzjkGmGx9VRU7dpJMMvJNSBISdmgK2L8LGsIRoxvY8Rbnfol/1g2wyZ9vGH4hI0Ou2NhqGuJ4+4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOS9Mi25wq6X3Or8L0pIxuUQWgqMy8RRN3Kfd0GdX6HSCdAQKK
	JNl8tBCQMfGtnWz14cWAkq9CjjOloH6yJMZFFPRX8vcjIBSodfV/x3lrT4eLgN7olbEgzXt0ltS
	M
X-Google-Smtp-Source: AGHT+IFZ1xDtB3k5CD6seXWZx1YJkBxJq60i5bzBD4gZigqdxAZp7jISCgnQToSXsB873F4tKwiO+w==
X-Received: by 2002:a17:907:2d90:b0:a9a:2a55:d130 with SMTP id a640c23a62f3a-a9de61dec24mr1249172166b.55.1730220279298;
        Tue, 29 Oct 2024 09:44:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Oct 2024 16:44:37 +0000
Message-Id: <D58FWEECU4HH.2UEMEF0HVJ2ND@cloud.com>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v7 5/5] x86/boot: Clarify comment
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Frediano Ziglio" <frediano.ziglio@cloud.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
X-Mailer: aerc 0.18.2
References: <20241029102942.162912-1-frediano.ziglio@cloud.com>
 <20241029102942.162912-6-frediano.ziglio@cloud.com>
 <ZyD29aZqLRydMUCp@macbook>
 <864df257-dc7b-4028-932e-86f0d69debdb@citrix.com>
 <CACHz=ZjHjBMt=k-tX68XqMjJXs9+1LFFXDEHHJzRqbONq6N=WA@mail.gmail.com>
In-Reply-To: <CACHz=ZjHjBMt=k-tX68XqMjJXs9+1LFFXDEHHJzRqbONq6N=WA@mail.gmail.com>

On Tue Oct 29, 2024 at 4:40 PM GMT, Frediano Ziglio wrote:
> On Tue, Oct 29, 2024 at 3:07=E2=80=AFPM Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:
> >
> > On 29/10/2024 2:53 pm, Roger Pau Monn=C3=A9 wrote:
> > > On Tue, Oct 29, 2024 at 10:29:42AM +0000, Frediano Ziglio wrote:
> > >> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > >> ---
> > >>  xen/arch/x86/boot/reloc.c | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> > >> index e50e161b27..e725cfb6eb 100644
> > >> --- a/xen/arch/x86/boot/reloc.c
> > >> +++ b/xen/arch/x86/boot/reloc.c
> > >> @@ -65,7 +65,7 @@ typedef struct memctx {
> > >>      /*
> > >>       * Simple bump allocator.
> > >>       *
> > >> -     * It starts from the base of the trampoline and allocates down=
wards.
> > >> +     * It starts on top of space reserved for the trampoline and al=
locates downwards.
> > > I'm afraid this line is over 80 characters long, will need to be
> > > adjusted.  Maybe:
> > >
> > >     * Starts at top of the relocated trampoline space and allocates d=
ownwards.
> >
> > This patch miss misses 2 of the 3 incorrect statements about how the
> > trampoline works, and Alejandro had some better suggestions in the
> > thread on the matter.
> >
> > ~Andrew
>
> Hi,
>   changed to "Starts at the end of the relocated trampoline space and
> allocates backwards".
>
> See https://gitlab.com/xen-project/people/fziglio/xen/-/commit/21be0b9d28=
13db9c578e8a6ace76eee2445908f5.
>
> Frediano

with that:

  Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

