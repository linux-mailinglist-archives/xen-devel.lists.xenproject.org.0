Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E77198F0DC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 15:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809487.1221837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMHr-0007HD-97; Thu, 03 Oct 2024 13:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809487.1221837; Thu, 03 Oct 2024 13:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMHr-0007EP-5q; Thu, 03 Oct 2024 13:54:35 +0000
Received: by outflank-mailman (input) for mailman id 809487;
 Thu, 03 Oct 2024 13:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RhK6=Q7=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1swMHq-0007EJ-CH
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 13:54:34 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04d74638-818f-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 15:54:33 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso11128811fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 06:54:33 -0700 (PDT)
Received: from localhost ([52.174.59.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8ca4d75d8sm730761a12.62.2024.10.03.06.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 06:54:32 -0700 (PDT)
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
X-Inumbo-ID: 04d74638-818f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727963673; x=1728568473; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUx3N2vjuO8Kz76ZbhxE3SEAUrrJvIVEQe7naCLp43k=;
        b=hmPSgYi01j5H1gzK1lO3ZlU3OBPI8oZ8ogJvGhoSgofvjg8sj8n7nvPAFWx/EIsH5r
         nlbOcYJutNK/tubg7b7JP/D0yNLV8cji/63UWBHVWETj5X6YroAz5QZOCTXoJPUrNKt/
         xyDKvwL39ajnwMdoWP9Go5w+HdBwX5QBR1G+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727963673; x=1728568473;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zUx3N2vjuO8Kz76ZbhxE3SEAUrrJvIVEQe7naCLp43k=;
        b=fiaB60f4UXF506giF0RPqXAtYI9i992VuKOfmGzGRDtIQaCw76AqN2078vVikLNCao
         cVxUplBnPV/d4rUzccXRzQXOHA+C65TlEoc2WikQCsX+BHAV4mkU8JUfXJYGVs6eFG47
         /JFPbYaLBXp+OHJv1tNk0asKHyWDj5MTDJ/QQnPAqLb9riGOI15RvQLNeNedmkdyuSSR
         eYeK1tMOq1pW8Eq0do/3J+qeCb9x+ElCxlSRFhwr9KkzKUn0TW0XKWJNUEOmI3H8WHxU
         KOxFvMw7DrJ4DrFJdFMkvCLaEm939nEl/wxBD9krETbEsLeCJRklqOEyYaYwnqOIAAN9
         NA+A==
X-Forwarded-Encrypted: i=1; AJvYcCU+FEWug9T+GDz4018ZcuMtpeMxs/LghuHI/N2f0IFNnare7fEVHtxBhJZ+J/HQQDxXPygL/lyZM+g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyocN76QYrW+gxHgupH7HudsmUNwwtZXpC0htv93sSMqkYUb73B
	SGCWwGkgURaf8tLwQmsoBbTjZgw03StZtpDfQzXsmR6hzzgOKIWIDBIyTqRGLes=
X-Google-Smtp-Source: AGHT+IF+91+sHkIgkMHJqGdo7fitN9yxDne71je8QzNha9G1jL0dTTfGA/hEzNW1YZVHgLd5SoZFVw==
X-Received: by 2002:a2e:b8c8:0:b0:2fa:d40f:559 with SMTP id 38308e7fff4ca-2fae1018e56mr39401161fa.18.1727963672704;
        Thu, 03 Oct 2024 06:54:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Oct 2024 14:54:30 +0100
Message-Id: <D4M7ZZL8YUXE.1D7KX3JJDYH6L@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] x86/fpu: Split fpu_setup_fpu() in three
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, "Jan Beulich"
 <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20240813142119.29012-1-alejandro.vallejo@cloud.com>
 <20240813142119.29012-3-alejandro.vallejo@cloud.com>
 <c83942d9-bb55-45c2-9a44-314266ce14c0@suse.com>
 <D3EXG6HDKMYR.15275C42NLLBL@cloud.com>
In-Reply-To: <D3EXG6HDKMYR.15275C42NLLBL@cloud.com>

Hi,

On Tue Aug 13, 2024 at 5:33 PM BST, Alejandro Vallejo wrote:
> On Tue Aug 13, 2024 at 3:32 PM BST, Jan Beulich wrote:
> > On 13.08.2024 16:21, Alejandro Vallejo wrote:
> > > It was trying to do too many things at once and there was no clear wa=
y of
> > > defining what it was meant to do. This commit splits the function in =
three.
> > >=20
> > >   1. A function to return the FPU to power-on reset values.
> > >   2. A function to return the FPU to default values.
> > >   3. A x87/SSE state loader (equivalent to the old function when it t=
ook a data
> > >      pointer).
> > >=20
> > > While at it, make sure the abridged tag is consistent with the manual=
s and
> > > start as 0xFF.
> > >=20
> > > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >
> > > ---
> > > v3:
> > >   * Adjust commit message, as the split is now in 3.
> > >   * Remove bulky comment, as the rationale for it turned out to be
> > >     unsubstantiated. I can't find proof in xen-devel of the stream
> > >     operating the way I claimed, and at that point having the comment
> > >     at all is pointless
> >
> > So you deliberately removed the comment altogether, not just point 3 of=
 it?
> >
> > Jan
>
> Yes. The other two cases can be deduced pretty trivially from the conditi=
onal,
> I reckon. I commented them more heavily in order to properly introduce (3=
), but
> seeing how it was all a midsummer dream might as well reduce clutter.
>
> I got as far as the original implementation of XSAVE in Xen and it seems =
to
> have been tested against many combinations of src and dst, none of which =
was
> that ficticious "xsave enabled + xsave context missing". I suspect the
> xsave_enabled(v) was merely avoiding writing to the XSAVE buffer just for
> efficiency (however minor effect it might have had). I just reverse engin=
eering
> it wrong.
>
> Which reminds me. Thanks for mentioning that, because it was really just
> guesswork on my part.
>
> Cheers,
> Alejandro

Playing around with the FPU I noticed this patch wasn't committed, did it f=
all
under the cracks or is there a specific reason?

Cheers,
Alejandro

