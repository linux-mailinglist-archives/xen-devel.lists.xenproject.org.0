Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C809A092B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 14:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819997.1233491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t12yS-0000eV-IM; Wed, 16 Oct 2024 12:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819997.1233491; Wed, 16 Oct 2024 12:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t12yS-0000c0-FE; Wed, 16 Oct 2024 12:17:56 +0000
Received: by outflank-mailman (input) for mailman id 819997;
 Wed, 16 Oct 2024 12:17:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kaV7=RM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t12yR-0000bs-5P
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 12:17:55 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aad51b74-8bb8-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 14:17:52 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a998a5ca499so942454466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 05:17:52 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a298443e8sm176620066b.156.2024.10.16.05.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 05:17:51 -0700 (PDT)
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
X-Inumbo-ID: aad51b74-8bb8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729081072; x=1729685872; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyHvjcuE6v5NTlo8HH7py55aUKwv0dAcBjfoKY88kgQ=;
        b=TW5gf+ea1FLEViwOyCr7C/PxDwQ0MRwkJBEAJuEfJzVWUlIph5RC9zX8+RMaAI9LDp
         UNvzs591i92sXjOnYYZ+86jKuZXm5NCbTgStjilCSrmk/IdcM3ym182AqPH0bU3g+C56
         XjwEgqEpuPrT0PO60qpK8FAtHItNtyAQyyTtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729081072; x=1729685872;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RyHvjcuE6v5NTlo8HH7py55aUKwv0dAcBjfoKY88kgQ=;
        b=A6ijv0eil93pf4nYFFRLuo4ASGt2s132iyxxH4ySHSQgMaymXONqEhdHI0bjbHBE/9
         l+ljT73LQ7g+0TFXUaTnSEhwkfG1t3IB66Lx7ohcOEgwDvl/44Czzc85F6sOYQbTtfyp
         ShnbvHW0phrKm4elucp52F9YSVIw2OmDPOkBACme0JVUFMZTqHGfvB8uRUoRVgSxhAak
         sIP+h2REkpx3z3F1IBLZBMY+9gUg1zwGrkj28Y5h6u6O4VxfUCfPFeWcmc07tjMECu4C
         KjjNeKYz34r9U87DQMw7EoG6Ujknf8hCOnoL2E8tWdRTKkEkE3WJjNDA7Y+lsQhWys83
         rb8A==
X-Forwarded-Encrypted: i=1; AJvYcCVwlJzB8qc2z4lxolL7rxcsq+30fcVpgdlZBWz1M6GF1TgZundDuTp1dsPe93bY0K0Q9v3orryThBc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxP4nu8anAmluk6qoRv64WHynQe+3Kc6TpBiRCuXWDP/K7tIl3Y
	igyGdr18FO4f8BLQiXb7cLN1MnB6LPkqgCRnnW0Z5Tt+No1UOOK/6tsecj/qk/8=
X-Google-Smtp-Source: AGHT+IF7ExTwV5nKkff9upJbzzP4eumcMxHXZ+Hz2w0IIvZQvEkTBWgw3bKGq7yMx+CJn3y3lzYPQg==
X-Received: by 2002:a17:907:788:b0:a99:46dd:f397 with SMTP id a640c23a62f3a-a99e3e9c018mr1486845466b.64.1729081072254;
        Wed, 16 Oct 2024 05:17:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Oct 2024 13:17:45 +0100
Message-Id: <D4X82ZHFVVB6.12QCXQVZ41W9Q@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86emul/test: drop Xeon Phi S/G prefetch special case
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <a2dae57f-d166-4c99-8edd-11784abdecab@suse.com>
 <D4X5VZZWZJII.271VYW2L8Y0PG@cloud.com>
 <0695d72d-7138-4d35-be5d-c0fb0589944b@suse.com>
In-Reply-To: <0695d72d-7138-4d35-be5d-c0fb0589944b@suse.com>

On Wed Oct 16, 2024 at 11:54 AM BST, Jan Beulich wrote:
> On 16.10.2024 12:34, Alejandro Vallejo wrote:
> > On Wed Oct 16, 2024 at 8:46 AM BST, Jan Beulich wrote:
> >> --- a/tools/tests/x86_emulator/evex-disp8.c
> >> +++ b/tools/tests/x86_emulator/evex-disp8.c
> >> @@ -911,10 +911,8 @@ static void test_one(const struct test *
> >>      n =3D test->scale =3D=3D SC_vl ? vsz : esz;
> >>      if ( !sg )
> >>          n +=3D vsz;
> >> -    else if ( !strstr(test->mnemonic, "pf") )
> >> -        n +=3D esz;
> >>      else
> >> -        ++n;
> >> +        n +=3D esz;
> >=20
> > Just making sure. This is leftover from 85191cf32180("x86: drop Xeon Ph=
i
> > support"), right? Dead code after the removal of the avx512pf group.
>
> Yes.
>
> > If so, that sounds good. But (not having looking at the general logic),=
 how
> > come we go from ++n to "n +=3D esz". It's all quite cryptic.
>
> It's the (prior) if() portion we're keeping, and the "else" we're droppin=
g.
> The if() checks for _no_ "pf" in the mnemonic. "Going from ++n to n+=3D e=
sz"
> is merely an effect of how the change is being expressed as diff.
>
> Jan

Bah, misremembered strstr() being used like strcmp() on match, but of cours=
e
that makes no sense with the substring being returned. Thanks for spelling =
it
out :)

Cheers,
Alejandro

