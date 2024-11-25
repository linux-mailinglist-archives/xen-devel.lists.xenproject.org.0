Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC329D8AA7
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 17:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842976.1258638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFcJO-0000du-4b; Mon, 25 Nov 2024 16:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842976.1258638; Mon, 25 Nov 2024 16:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFcJO-0000bx-0w; Mon, 25 Nov 2024 16:51:46 +0000
Received: by outflank-mailman (input) for mailman id 842976;
 Mon, 25 Nov 2024 16:51:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=toQe=SU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tFcJN-0000br-5h
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 16:51:45 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a8b9c86-ab4d-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 17:51:39 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ffb5b131d0so21836901fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 08:51:39 -0800 (PST)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3b032esm4257497a12.19.2024.11.25.08.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 08:51:38 -0800 (PST)
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
X-Inumbo-ID: 8a8b9c86-ab4d-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMjkiLCJoZWxvIjoibWFpbC1sajEteDIyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhhOGI5Yzg2LWFiNGQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTUzNDk5Ljc4MTM2Miwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732553499; x=1733158299; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzepjfH+q3/6KBH49DhoICOV6voO0/yK4Z8MIs3mFvg=;
        b=BTUzTZG5ex0UIiekm3gNvOea7weULQe8GhJIXzkuwgSYG5x8lBn6uS69+oCUJ0JEAf
         u+nAAHPm2qKXyY8iuEGi5GPPRY7XncZQMXp3SEr7bSVLEzeVfJWA02N3TPcf8/T+1i/F
         2YpqTX0CxzJM9ZiVqa7rsh1yQjSSxwZfU4bS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732553499; x=1733158299;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wzepjfH+q3/6KBH49DhoICOV6voO0/yK4Z8MIs3mFvg=;
        b=Yb1G3DMgWVBGjYBY0mulEltTGeJL0ijeS2IU7t6WGXavxWe1DbywfuQxvrdtktN923
         NAXjG09liDdxBCk/4kBuiQBjhjgYUP/f18D6upHx8OlkMZziQ+UwbXJFeVPjujVXfJG2
         7DlSqdkcBo/A8BkIjllyWzcsYxEwRTw5SiQ2RlWVJrpU+Qrh84BHGBVfowHe06Bk897B
         YkhxK1oUT92aPDu2lxolUrdHHtS4+gpHCBFElv611r6OO3zc+CgUxZqHtglsa3wOyO4Q
         5v36FJ+d+FA3TjWO8AckZP4JE50BrKs0145rUsU2SBRq71RNggOqSuyOL81qTTowuvGb
         J6+w==
X-Forwarded-Encrypted: i=1; AJvYcCVrilZ48aINw0j+7MWxT3xSrYXkVSAILSh/AU+Qxprjgsz+t0G9IGpTHWhYISRu8CtDOGh62elQG40=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxymEtShXID+jkez9kRPPzHVUC/ZN8SIEh8keNJosYZX1421uLA
	weMWAwGxE+o0t62P3GnmodOlBELz2P+pW5v8Rggqfu0Dym65xWVCoYQjTcRme12h9Lc+2XYUC0k
	H
X-Gm-Gg: ASbGncvcobWvVGfkq95z9WbhHLAT7BHvECjrBw0nbMJ5XRkmxxP/JJ14M2sLtFwgRWn
	L7Nj9lUdbT3MSj2dqeJlYNBdeN8QAyi3rT+wNEMkjaJbD8a3tFsaV+uSaPzIkirrIPEb8vvWoxF
	OT1oi5G8mrI4g68iWwuyNVRnXzJLWnOVXLvqeDLb2Ysx0ieZTppn29liGw51brEWFPALPqMGyia
	WfAXtF96LzG1HlAmZRaVmqQCccD3mKgzbW7kSWuUMOdY9emQsEJvTs0
X-Google-Smtp-Source: AGHT+IHMVintiZhNak7S1kjzfe/vS7utaWHqj922saQa0EAZqRZeOlZC5SDrP1N7XGOhs6Us10icNQ==
X-Received: by 2002:a2e:b8d1:0:b0:2ff:58e5:af0f with SMTP id 38308e7fff4ca-2ffa711ff87mr62163391fa.19.1732553499244;
        Mon, 25 Nov 2024 08:51:39 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Nov 2024 16:51:34 +0000
Message-Id: <D5VEYFJOCITG.3RPS1UQFDNY25@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Teddy Astie" <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Yann Dirson"
 <yann.dirson@vates.tech>
Subject: Re: [RFC PATCH 04/25] tools/xenbindgen: Add a TOML spec reader
X-Mailer: aerc 0.18.2
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-5-alejandro.vallejo@cloud.com>
 <aa5ed051-3696-42f1-9eec-d7cbd21d9882@vates.tech>
In-Reply-To: <aa5ed051-3696-42f1-9eec-d7cbd21d9882@vates.tech>

On Mon Nov 25, 2024 at 3:13 PM GMT, Teddy Astie wrote:
> Hi,
>
> > +    let _specification =3D match spec::Spec::new(&cli.indir) {
> > +        Ok(x) =3D> x,
> > +        Err(spec::Error::Toml(x)) =3D> {
> > +            error!("TOML parsing error:");
> > +            error!("{x:#?}");
> > +            std::process::exit(1);
> > +        }
> > +        Err(spec::Error::Io(x)) =3D> {
> > +            error!("IO error:");
> > +            error!("{x:#?}");
> > +            std::process::exit(1);
> > +        }
> > +    };
>
> I think it can be replaced with .unwrap() (or making the main function=20
> returns a Result<T, E>) as long as our internal error implements Display.

Oh, I wasn't aware E: Display was honoured on exit. I thought it always use=
d E:
Debug. That ought to be a lot nicer.

>
> > +/// Internal error type for every error spec parsing could encounter
> > +#[derive(Debug)]
> > +pub enum Error {
> > +    /// Wrapper around IO errors
> > +    Io(std::io::Error),
> > +    /// Wrapper around deserialization errors
> > +    Toml(toml::de::Error),
> > +}
> > +
> > +/// Maps an [`std::io::Error`] onto a [`Error`] type for easier propag=
ation
> > +fn from_ioerr<T>(t: std::io::Result<T>) -> Result<T, Error> {
> > +    t.map_err(Error::Io)
> > +}
> > +
>
> May be worth a
> impl From<std::io::Error> for super::Error
> such as ? operator can automatically convert it to our internal error typ=
e
>
> Cheers
> Teddy
>
>
> Teddy Astie | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech

Yes, I replaced all this faff in my internal branch with From<std::io::Erro=
r>
and From<toml::de::Error> shortly after sending the RFC. It is indeed a lot
tidier.

Cheers,
Alejandro


