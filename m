Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923689D8B2C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 18:19:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843037.1258698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFcjn-0006pE-A7; Mon, 25 Nov 2024 17:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843037.1258698; Mon, 25 Nov 2024 17:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFcjn-0006nF-6I; Mon, 25 Nov 2024 17:19:03 +0000
Received: by outflank-mailman (input) for mailman id 843037;
 Mon, 25 Nov 2024 17:19:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=toQe=SU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tFcjl-0006n9-Kt
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 17:19:01 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 596fd4f8-ab51-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 18:18:55 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so641235466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 09:18:55 -0800 (PST)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa545ab0c3dsm235059366b.43.2024.11.25.09.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 09:18:54 -0800 (PST)
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
X-Inumbo-ID: 596fd4f8-ab51-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU5NmZkNGY4LWFiNTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTU1MTM1LjQ1ODg2OSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732555135; x=1733159935; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d8RiDIgkFgDGgiWjGOVwNiSEX4PGoaxf2Ni4ujGWa8=;
        b=BsgXxiKts4dhfoLUTwyE61xjqp1Q2pJXv6kaphyQEHYzyppEmS+eN/mNVbn42Ut22w
         kEc5/8CwbDGDKZ9WupCJV/3miiyhaNMO8Yke/V5CX2bpXqLZde0qQs/uljEeRjGqkQ3Q
         O27mpHvJIP31XQZkPAJMglmhMpgWBc+9QC/4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732555135; x=1733159935;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2d8RiDIgkFgDGgiWjGOVwNiSEX4PGoaxf2Ni4ujGWa8=;
        b=dtGg2bQoJXYKg4Qlub1q/n3ahpLQ7RPTWVuWcgZXanD+oG90aOqXTqH1fouB8+fXNL
         DIXclvVw4V+RQb9gFH5GA+UcBlREtBbHXTs6SZnOUfsb8aZvpgkP+gpfRQiuFk16N45z
         NnE+r8klGJTr7WcTOldD9pu0Hff0Z1VJ4ZeB7rbrbyIikVoBGsUBDCvIOoiunQuFBUFV
         7gE2M9jTsXc0HNogb5q3y0P5GC/6OE1Gylo5x+lW7yf49dIFcsYf6rn2VgNCZfxznSpL
         tsnC7iICyokhS1UtDUa5i23qIhOTSHjB9hdLWtevj+5AQzq0xnGC1GeifrtagzeFwFTZ
         AFKA==
X-Forwarded-Encrypted: i=1; AJvYcCUdCamPjBsooVIybFj38rjqye2JTeCvGFdSy+IDJN58w5x77/bJdHxWQEf9ROWARygS5ha8l/1+s/8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPnV/g49nx0w1H70HiYeoyMSgOIFIUXNwzDlJrp3A1rUfsxQKv
	i17FAX4+K3yOBjnJokt0L2hviDst6Ih/a1uAD5YjcRy17Dnc37XKja1MqBN6Ie0=
X-Gm-Gg: ASbGncsG7yxvkObyAqa35DUHulTo07c4A5AAbyo67f2FC9MHktJbDNFHEmWjKhoIoIO
	4lwNRQjBoujNyFn++2EB5kvej8G+ye8HZz9nmfwAcqKbLbVcPxRdEkaITGeDrZ+vDNIQj+SPWTz
	SaCfcP6QwAGvavLmkBJ+o7lpKSzncm/OTA94FpoDavXlREvE3qIYsN8/3ts69tZGcDiOpiX7RtS
	GBUdmOi5rZQxFXfjS+WzxEQHHjRjqdyD2ud/oKhOp5qYqTGBWXXGuCM
X-Google-Smtp-Source: AGHT+IGFMeCrlCkv210bE4FsUStaceiBkgHxA1tADgg855BzLx9E5d3FwSF+s5gfTJHn+UkF3ReZ1A==
X-Received: by 2002:a17:906:31c5:b0:aa5:225f:47d9 with SMTP id a640c23a62f3a-aa5225fb282mr938102266b.29.1732555134906;
        Mon, 25 Nov 2024 09:18:54 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Nov 2024 17:18:51 +0000
Message-Id: <D5VFJBBZV0Q8.2LZQYX9EYBBUU@cloud.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Yann Dirson"
 <yann.dirson@vates.tech>
Subject: Re: [RFC PATCH 08/25] tools/xenbindgen: Add support for enums in
 TOML specs
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Teddy Astie" <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-9-alejandro.vallejo@cloud.com>
 <b4776dd0-9b4e-457c-9108-88fa2e575e7d@vates.tech>
In-Reply-To: <b4776dd0-9b4e-457c-9108-88fa2e575e7d@vates.tech>

On Mon Nov 25, 2024 at 4:39 PM GMT, Teddy Astie wrote:
> Hello,
>
> > +
> >   /// A language-agnostic specification.
> >   #[derive(Debug, serde::Deserialize)]
> >   struct InFileDef {
> >       /// List of structs described in this input specification.
> >       structs: Option<Vec<StructDef>>,
> > +    /// List of lang-agnostic enumerated descriptions.
> > +    enums: Option<Vec<EnumDef>>,
> >   }
> >  =20
>
> Alike for struct/..., I think we can merge that with OutFileDef using=20
> the default attribute in serde :
> #[serde(default)]
> https://serde.rs/field-attrs.html#default
>
> That way, when there is no structs/... entry in the file, it is parsed=20
> as a empty vec![] instead of failing which allows us to remove this=20
> wrapper struct.

I didn't know about that setting. Option<T> was indeed a clutch to avoid ha=
ving
to define enums =3D [] explicitly. I like your suggestion better.

>
> Cheers
>
> Teddy
>
>
>
> Teddy Astie | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech

Cheers,
Alejandro

