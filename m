Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC03D23418
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 09:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204325.1519032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJ2y-0005Se-9i; Thu, 15 Jan 2026 08:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204325.1519032; Thu, 15 Jan 2026 08:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJ2y-0005Qe-5y; Thu, 15 Jan 2026 08:49:40 +0000
Received: by outflank-mailman (input) for mailman id 1204325;
 Thu, 15 Jan 2026 08:49:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+5kY=7U=gmail.com=akmarkov45@srs-se1.protection.inumbo.net>)
 id 1vgJ2w-0004G1-Io
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 08:49:38 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e7bee51-f1ef-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 09:49:36 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2a09757004cso5245935ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 00:49:36 -0800 (PST)
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
X-Inumbo-ID: 1e7bee51-f1ef-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768466975; x=1769071775; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wmenWw37itcVsqTSbXJxL8Gqvg4SzPFeokBdkrMeGSY=;
        b=Xqnd1AxJQttwr7LymhEm0D9FRQ8C4fKzqhmz3i7tCe2LpEbKSxIP7/uWlX50E92HsA
         QFEBa+06cabOvCLTZrpyGPjaMQi2cnA80TRi7qtNyiiB9nPn9HNmrionFNlyznL76WLp
         sir/gPyLLM9dIpwkbUQNlGh3RJWikmxbUuAPAZi9FbfMJqXdGOaBZurUIdFL920nRBuc
         W1mJ1qPqgb5/Rul791AM3IO9wpkh4gEkjt2FdkMclS31kVh7nCDUd8CyJQiQnk0kNVFo
         NwPTC2zgwHRxE2Fm1Sw4NSANMtslVuWI9//alpwAO+LRmRFJrmt9kcGq8OdKhAnJ1uf3
         AWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768466975; x=1769071775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmenWw37itcVsqTSbXJxL8Gqvg4SzPFeokBdkrMeGSY=;
        b=jPF++RCRHe2dXXShxtlAxdbs3Ao7oXbtYqp6l+5MvSAEqNcJG0JFCEcms9tRgWH2jn
         NrRyaGlIkpj6f53rOPs4EYAp1n9jw0txYfRr5oaWjY64yM/HfhuLAQwESZJUy3bnAGKr
         ziMAEAApzDzoDG71wuU9nzRQPjrWPwZltk4PIwwNkfx9f50hMQpENh5D1ktRm+hWM0qb
         C8QMKFch4pGxhPffophh3Ly3svq1MAsQr+/Rna7fKxCeYdJYDVj2TyYU1ZWsy/Ta7VB0
         ppf+fpaNzcayMyyCH2p4oAo/mkVENQ0inhW0kAt8mm6qDzRGUVXO5XQNkOi5Yql7oYFB
         9u/A==
X-Forwarded-Encrypted: i=1; AJvYcCUQerVJz3trpUIhGPjB3EBX65h+r5efPsWhL4PEbtgkPz9iZv9jPojwYT5VXuHyGR9KPo6F3o36qV0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsAkBn73lRNw9p0ejWj4czsqBAtIfABB7qnC7OpIDmCtouimEu
	vdFZGcP+jF98IakjIwMjn+0Ky0TIKwAocFXTdx0EqsZMiDFCOiifQdc9M/r6vmT86n1uSLYGxIv
	Jep+AMT/Jlu8mqOSKvmCiLFdtBbpP4llMNQJ/hXN5uBVt
X-Gm-Gg: AY/fxX4n/o+YT1CDv45N7H39iJMyUN/Fh6jd8wyxaEqsGF1LMRxurda/BS7nlfWK9U8
	01prKVKQvJmn8OsDRS4u/t+ZyKj+R71xSPqGe1gHn6Lht6d/NwTrDZvR0TSJgHA55aWIPdk3alE
	WTwi/uM3bqj711v0VcayNb3kmNG/Dy5kDqfcdOP3yHdNLa6UwgsBYvJkMmiXI5vdPfzqaoT6QzX
	OMaxylUZtAz3B3b8Gqpo7TriBmT1tu+9FR5Qe9/quqPzOA3tn/DH6I96WNsQEx30oBsLukgjI3V
	v9fryyo=
X-Received: by 2002:a17:902:f688:b0:295:745a:8016 with SMTP id
 d9443c01a7336-2a59bb1803bmr51851575ad.11.1768466975176; Thu, 15 Jan 2026
 00:49:35 -0800 (PST)
MIME-Version: 1.0
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com> <aWfXJk90Sh7B-qi7@Mac.lan>
 <e9205e59-fb1d-429e-877d-28aa8cb950ca@suse.com> <aWikMGJKa3VPQQzi@Mac.lan>
In-Reply-To: <aWikMGJKa3VPQQzi@Mac.lan>
From: Anton Markov <akmarkov45@gmail.com>
Date: Thu, 15 Jan 2026 11:49:23 +0300
X-Gm-Features: AZwV_QinbTdDHIwfGNQEJEjm8UqxJn4sKYAYXEFF6g_3XF-xDisXK_ej4TsIzZU
Message-ID: <CACQYvN_eCxxeZwCi3Qf5Zw8tnyGOsR=fCDeZ2xNZWQkMtu5niw@mail.gmail.com>
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in get_s_time_fixed()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000da3af10648694d8f"

--000000000000da3af10648694d8f
Content-Type: text/plain; charset="UTF-8"

Sorry. I mixed several threads into one. It wasn't immediately clear that
the second bug isn't related to handling negative values in scale_delta. It's
related to gradual time desynchronization between cores, so they should
probably be addressed separately.

Thanks.

--000000000000da3af10648694d8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span class=3D"gmail-HwtZe" lang=3D"en"><=
span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">Sorry.=
</span></span> <span class=3D"gmail-jCAhz"><span class=3D"gmail-ryNqvb">I m=
ixed several threads into one.</span></span> <span class=3D"gmail-jCAhz gma=
il-ChMk0b"><span class=3D"gmail-ryNqvb">It wasn&#39;t immediately clear tha=
t the second bug isn&#39;t related to handling negative values in scale_del=
ta.</span></span> <span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"g=
mail-ryNqvb">It&#39;s related to gradual time desynchronization between cor=
es, so they should probably be addressed separately.</span></span></span></=
div><div dir=3D"ltr"><span class=3D"gmail-HwtZe" lang=3D"en"><span class=3D=
"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb"><br></span></span><=
/span></div><div dir=3D"ltr"><span class=3D"gmail-HwtZe" lang=3D"en"><span =
class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">Thanks.</sp=
an></span></span></div></div>

--000000000000da3af10648694d8f--

