Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738D29D5FBE
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 14:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841874.1257356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tETgS-00082s-LS; Fri, 22 Nov 2024 13:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841874.1257356; Fri, 22 Nov 2024 13:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tETgS-00080U-Ij; Fri, 22 Nov 2024 13:26:52 +0000
Received: by outflank-mailman (input) for mailman id 841874;
 Fri, 22 Nov 2024 13:26:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMXp=SR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tETgR-00080O-Ex
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 13:26:51 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6aa7700e-a8d5-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 14:26:44 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4315eeb2601so24317085e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 05:26:44 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde8fbe6sm27015265e9.27.2024.11.22.05.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 05:26:43 -0800 (PST)
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
X-Inumbo-ID: 6aa7700e-a8d5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmMiLCJoZWxvIjoibWFpbC13bTEteDMyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZhYTc3MDBlLWE4ZDUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjgyMDA0LjQ2MTY5Nywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732282004; x=1732886804; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2P7V0WczIKMwHImY+eNpzEk5PxhmoH3sB89ni8KmzZ4=;
        b=TuxXxqNpMSv0bhxzHHaVhxTSt7UI6lgI4a5DJwNT2lP2zY/LLChI1sPhJf6X7qcBxg
         VZGtBeoaPMd9KbvhOttdClPw9gRfqHpfQkNVrDii7IJnFTbRq1MUPoG3sLiTceGveC/M
         lE9cpBhPNka8U+7C2lOTYsw5xvuuoJvzkTS7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282004; x=1732886804;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2P7V0WczIKMwHImY+eNpzEk5PxhmoH3sB89ni8KmzZ4=;
        b=mTKyxwKynIeBQMUxDRyBInZKXAtNqrkBGibcUt1hPoViKL8yhlLtnjgRbODfA5NwcT
         g2rMQNahVwWmuIFBAqY8mRoEu0+G0Kl13QI5WvI7e7N5dqlqKvFKzL3J7LwgjHivVEat
         H+j8e3l1D4eJvFYE111N/8Vot+XlfeP4vlHP7PJTVqKr70MNqvHET+ZqB1h+Juy0IOdF
         aN89XbVlCXIZxQS4OBlFWJRimCWgrbJozcQiPH/t1LLz00tlbGfd96zcQwEUURU96ddQ
         VHCQPqgsgRzdoZS8oBNX83SmATu4kN9lTQoGxupafnHXTKTwZRSj6DOk4/DagBUtOO/H
         0/5A==
X-Gm-Message-State: AOJu0YxbJUEJugvWkiMDQAxKXTAOfp48LkoyT5RgLQ9UIJISEwZEW7Iu
	BuExmFThPHobhiPP34PlMG5NUWe5KujcSsNCnFXCH0d28wmBIz7tbzyBnZOu4ts10GGb2ixwwwS
	0
X-Gm-Gg: ASbGnctI/zRDoAijh8rQdNvDXljICSsuuVlVXy7UeSPE8zhv1qbRPVFZP4lA4N7PAWL
	4T2ZGuLTiO4XdqBtv/O5XBwK1YW5ZKffjvVjL6X2Pt59zbeEjRpRCZK06oX+Mhz4k7Zrr2FV9ff
	KKwIfe27ItvuEKssC7VKLnvbVPIioP4OoYxtvhtVUyf8MURrzHx9mfB+jef5wbO6TMw0fx2QHZ7
	unNkfLM15neD7mbMz3AMxIoOkd4lVe1KiZxnBp8tHNWhWJKvLuJKwVdN5jyhKJ5ppZlvaCdkCk4
	JH8J
X-Google-Smtp-Source: AGHT+IHec0vr31XKe/XUzhH5QOPx+/KHifOpQNkXDgXAQQLxhvpCb5J1z2EMJPGaJ4n3t8I5UoTrsw==
X-Received: by 2002:a05:600c:4507:b0:432:d735:cc71 with SMTP id 5b1f17b1804b1-433ce48fe52mr23721505e9.25.1732282003893;
        Fri, 22 Nov 2024 05:26:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Nov 2024 13:26:42 +0000
Message-Id: <D5SQPY0SVMIA.QQ6497HZAJJ5@cloud.com>
Subject: Re: [RFC PATCH 00/25] Introduce xenbindgen to autogen hypercall
 structs
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Teddy Astie" <teddy.astie@vates.tech>, "Anthony PERARD"
 <anthony.perard@vates.tech>
Cc: <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <Zz9yEUj1_t1SSKE_@l14> <5a3c8a6e-fee7-4dba-8d86-506aa7b3c2de@vates.tech>
In-Reply-To: <5a3c8a6e-fee7-4dba-8d86-506aa7b3c2de@vates.tech>

On Fri Nov 22, 2024 at 10:52 AM GMT, Teddy Astie wrote:
> Le 21/11/2024 =C3=A0 18:46, Anthony PERARD a =C3=A9crit=C2=A0:
> > Instead of creating your own IDL specification, did you look for
> > existing project that would do just that? That is been able to describe
> > the existing ABI in IDL and use an existing project to generate C and
> > Rust headers.
> >
> > I kind of look into this, but there's quite a few project to explore an=
d
> > I didn't really spend enough time. Also, there's probably quite a lot
> > that are for client-server interfaces rather than syscall/hypercalls, o=
r
> > they impose a data format.
> >
>
> I think a such IDL would be C headers, but it's easy to make C headers
> that are hard to deal with in other languages.

Well, that's how x86_64 and x86_32 came to have different ABIs. Have a look=
 at
xen/include/public/ and xen/include/compat/

As it turns out, C is very deceptive. And the AST doesn't codify many
invariants we'd like to preserve and write down so languages capable of
enforcing them can do so. One example I'm working on now is evtchn_status. =
It
contains a tagged union with a external status field (used as the union tag=
).
In C this relationship is basically unenforced and stated via comments. For
other languages to know about it it ought to be formalized.

IOW, if we were to simply transpile C it's impossible to restrict C to only=
 use
safe constructs in other languages.

> I checked briefly, and
> there is Fuchsia IDL that could be interesting in that matter but is
> much more complex than what we may be looking for.

Fuchsia IDL in in the same camp as Protocol Buffers, Smithy and others, I
think. It's a protocol specification rather than an ABI specification, with=
 the
specific twist that it's tailored for Zircon channels. I don't think it cre=
ates
structs.

>
> >
> > Next, on the file format choice, is TOML the best for describing an ABI=
,
> > or would other existing file format make it a bit easier to read, like
> > JSON or YAML? (I quite like using YAML so I have a bias toward it =F0=
=9F=99=82,
> > and that's the format used for the CI). I don't think it mater much for
> > Serde which file format is used.
>
> It can be decided by making examples of IDL files in various formats and
> deciding on which one would be the most readable/easy to deal with.

Yeah, I'll probably do that.

>
> Teddy
>
>
> Teddy Astie | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech

Cheers,
Alejandro

