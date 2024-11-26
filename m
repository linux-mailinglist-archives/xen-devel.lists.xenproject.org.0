Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A359D99B6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 15:37:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843813.1259395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFwgL-00030W-JQ; Tue, 26 Nov 2024 14:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843813.1259395; Tue, 26 Nov 2024 14:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFwgL-0002yn-Gi; Tue, 26 Nov 2024 14:36:49 +0000
Received: by outflank-mailman (input) for mailman id 843813;
 Tue, 26 Nov 2024 14:36:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEbF=SV=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tFwgJ-0002yW-RX
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 14:36:47 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da5e1a47-ac03-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 15:36:42 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso91314951fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 06:36:42 -0800 (PST)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b52fb87sm603987966b.95.2024.11.26.06.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 06:36:40 -0800 (PST)
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
X-Inumbo-ID: da5e1a47-ac03-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzMiLCJoZWxvIjoibWFpbC1sajEteDIzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRhNWUxYTQ3LWFjMDMtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjMxODAyLjEwMDQ1NSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732631801; x=1733236601; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTssS+aaTG1GgabD+8/QxS9e9rDhNHvzrc6pc9fuxFA=;
        b=RWhMkviDRKYttF7pZDWFA1JxJwSXKDykNj+210/pUM1BR8JRgPjcFxbFhuoOj7J91v
         LyqHIHls/mss3Y39WMTSPfTeQQzEuQDh9E1v8HS1cZRLt+7IvP2vM4l2129IQfwFE9Dl
         2q0QiYCtZB296BCF84+9fj/A7s8Jw7fRcPkos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732631801; x=1733236601;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JTssS+aaTG1GgabD+8/QxS9e9rDhNHvzrc6pc9fuxFA=;
        b=qSQbs7Wn7YDjXddAT/RPh0oUUvug2X/j3jEdEFwcwd/5hkFe6YNBv2/gxbhvVtbSmG
         j7XBkyVzf5BrlXnBH5USFIA9Qxo4DEUGgq/8Kc/fRp+EHzfXFEZdT7xbXgJGjDaklECn
         lKlU0Ib0uUhiIXK/GZAOnj4zOLCrPYDkhUWSHmZPh/DWXf8lwq8kDk/q4ZUSQCc5TUHP
         kCWXXDScWkAKYdiWUYSh2BTn9+sX027cxU4OP2BkOj6C3gdj3iFPkZ9o8N3WpsdbNfLR
         vMPLNW10ii8iOTG0Uja5PeicNYF0dxebB9nH0/9lZdMjMFuG/EknA6iWorqB3So6gyv0
         itew==
X-Forwarded-Encrypted: i=1; AJvYcCVxIhnR5vmOkeEiey+o/AB6/UC/FNIb6MKVdQKBab6krPiZJdIUaKZaTY4IUapyNEk9mOQYuFiWFzc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwB7L27Kq/77sQaI+tQiUe9pTjHtp30LnY1DGd7KS0dfUmPDZyj
	jF2d3UUisdnulVsWhJNj8wo0kYJ0wTOJNobWR9W04K+Enbay8fVw2UdWTS/jZw8=
X-Gm-Gg: ASbGncvguU5tz2DSiOFCpwa9SC/8HH9F+DZhNAiSXOQl1i7/eZoExQ62hSe5BXtV6wD
	JBOxppavIIHTVJyAOoVI94e1t2VNisr9TOMaTOzhSGp4LnjIT0lkdpc05pm2dAYw8HfgebR0QYq
	+OA2GiHUh0CoALkT2GkFVCUo9Ogeqm5gvI1evtiK4H8YhBvljj2Yr5cCeIXd6X3gIRBKQsNAOPy
	v9BqcQKdeZdwacrWzss3Botb5Ye4gqf0PCvUasXMSOyDooHNXuTyBMU
X-Google-Smtp-Source: AGHT+IGSDXhmS5irS/5kkKUrwWGujUvipSx3neVvEQanDW+biXHlf2L6UngsK1ZR0ibRqJwnGq9Wyw==
X-Received: by 2002:a2e:a58b:0:b0:2fb:36df:3b4 with SMTP id 38308e7fff4ca-2ffa7187eb1mr146921241fa.34.1732631801447;
        Tue, 26 Nov 2024 06:36:41 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 Nov 2024 14:36:37 +0000
Message-Id: <D5W6PN8FJ5CA.378A9JFXP34X7@cloud.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Samuel Thibault"
 <samuel.thibault@ens-lyon.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 12/25] xen: Replace sysctl/readconsole with
 autogenerated version
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-13-alejandro.vallejo@cloud.com>
 <0a5a66d9-4fd4-4084-b7f9-0923d5a4c6d5@suse.com>
 <D5VHI2OA8QTK.1H4ZDUSP5EZX5@cloud.com>
 <737292fd-1c4a-4fd6-ae98-a701adb0b88e@suse.com>
 <D5W3YYDE2F09.IHJMRBUBE6EV@cloud.com>
 <e40ed7c2-6111-468e-8655-884953bd33e7@suse.com>
In-Reply-To: <e40ed7c2-6111-468e-8655-884953bd33e7@suse.com>

On Tue Nov 26, 2024 at 1:20 PM GMT, Jan Beulich wrote:
> On 26.11.2024 13:27, Alejandro Vallejo wrote:
> > On Tue Nov 26, 2024 at 9:40 AM GMT, Jan Beulich wrote:
> >> On 25.11.2024 19:51, Alejandro Vallejo wrote:
> >>> On Mon Nov 25, 2024 at 12:05 PM GMT, Jan Beulich wrote:
> >>>> On 15.11.2024 12:51, Alejandro Vallejo wrote:
> >>>>> Describe sysctl/readconsole as a TOML specification, remove old
> >>>>> hand-coded version and replace it with autogenerated file.
> >>>>>
> >>>>> While at it, transform the console driver to use uint8_t rather tha=
n
> >>>>> char in order to mandate the type to be unsigned and ensure the ABI=
 is
> >>>>> not defined with regards to C-specific types.
> >>>>
> >>>> Yet the derived C representation imo then should still be using char=
, not
> >>>> uint8_t.
> >>>
> >>> There's 2 issued addressed by this patch.
> >>>
> >>>   1. The removal of char from the external headers (and the Xen drive=
r).
> >>>   2. The replacement of the existing struct by the autogenerated one.
> >>>
> >>> (1) wants doing irrespective of (2). char has neither a fixed width n=
or a fixed
> >>> sign. Which is irrelevant for ABI purposes in this case because what =
we really
> >>> meant is "give me a pointer" in this hypercall, but it may be importa=
nt in
> >>> other cases.
> >>>
> >>> IOW, char should've never made it to the definition of the public ABI=
, and I'm
> >>> merely taking the chance to take it out. Happy to extract this patch =
and send
> >>> it separately.
> >>
> >> Well, work towards fully getting char out of the public headers may in=
deed be
> >> worthwhile. Otoh with char being the basic addressing granularity, I t=
hink
> >> the ABI is pretty much tied to sizeof(char) =3D=3D 1, imo limiting the
> >> worthwhile-ness quite a bit.
> >=20
> > Let me put it another way. If I were to create a separate patch strippi=
ng char
> > and using uint8_t instead, what are my chances of getting an Acked-by? =
Or not a
> > NAK, at least. (there's other maintainers that I need that from, but on=
e step
> > at a time).
>
> That would to some degree depend on what other maintainers think. Not a s=
traight
> NAK in any event.
>
> >> Signed-ness of plain char doesn't really matter as long as it's used o=
nly for
> >> what really are characters (or strings thereof). And that looks the be=
 pretty
> >> much the case throughout the public headers.
> >=20
> > Maybe. Still, as a general principle caller and callee ought to agree o=
n size,
> > alignment and sign for every type. I'd rather not make exceptions for t=
hat
> > invariant unless truly well motivated. And in this case it's a case of
> > requiring trivial non-functional changes.
>
> In how far they're non-functional will need to be seen. You also need to =
keep
> consumers in mind: They may face sudden type disagreement that compilers =
may
> complain about. Yet "stable" for the public headers means not just the AB=
I
> itself being stable, but updated headers also being usable as drop-in
> replacements for older versions.

Would it be fair to say that users of the Xen low-level API strictly go via
xenctrl et al? So long as it's only those libraries being affected the effe=
cts
should not be externally visible. It's just the hypercall boundary that is
adjusted, not the external API.

>
> >>>> Nit: For anything that is committed, it would be nice if those files=
 were as
> >>>> tidy as possible style-wise. Most of the above looks entirely okay, =
just
> >>>> that there is an unnecessary trailing blank line.
> >>>
> >>> I did go out of my way to prettify the output.
> >>>
> >>> The trailing newline was intentional to make it C++03-compatible. I c=
an get rid
> >>> of it, as it doesn't matter a whole lot.
> >>
> >> I haven't followed the development of C++ very closely; my experience =
with it
> >> is mostly from far more than 20 years ago. What's that C++03 compatibi=
lity
> >> requirement?
> >=20
> > It's really unimportant. -Wnewline-eof, I think it was. There's a pedan=
tic
> > paragraph in the C++ spec from 2003 that states that if a file is not
> > newline-terminated it's UB to parse it. I tend to newline-terminate my =
files
> > for easy `cat`-ing them together in the rare occasions where that's use=
ful for
> > something.
>
> Unimportant or not - there must then be some misunderstanding on either m=
y
> side or yours. Even the assembler insists on a final newline, as does pla=
in
> C. Yet that means one newline, not two (i.e. not a trailing blank line).
>
> Jan

Ok, I see what you mean now (only after doing `xxd <file>`). There's indeed=
 an
extra trailing newline. My $EDITOR led me astray.

Cheers,
Alejandro

