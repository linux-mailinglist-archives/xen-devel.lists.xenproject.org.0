Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AE5960667
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 11:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783739.1193009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sisx5-0007wm-AD; Tue, 27 Aug 2024 09:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783739.1193009; Tue, 27 Aug 2024 09:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sisx5-0007uo-5z; Tue, 27 Aug 2024 09:57:27 +0000
Received: by outflank-mailman (input) for mailman id 783739;
 Tue, 27 Aug 2024 09:57:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZjl=P2=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1sisx3-0007ui-F8
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 09:57:25 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c28b9080-645a-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 11:57:24 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f4f505118fso43277771fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 02:57:24 -0700 (PDT)
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
X-Inumbo-ID: c28b9080-645a-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724752644; x=1725357444; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y74mDAAvmzgFRz+jUBoXAQGFr/r5n1KrbangKEg1qgM=;
        b=JKjMUFT0ncdLFk7lRRbMJr6NJ1WwOaD4HfaEyF5TW0s5QPVrGoNf6sGIlf90NW8zpq
         4RwvE+5mjVh9QSwOfoLngWvutcF+EMO8IAuu6NA/Dht2bYgbWRuw7zGQOB6q0LgUVE6s
         12hW+eoDfKkUIh5X14p22+clpSNmyjO+zsJJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724752644; x=1725357444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y74mDAAvmzgFRz+jUBoXAQGFr/r5n1KrbangKEg1qgM=;
        b=Rvxxl5LahVNtVum5IQ2ExD5HlowTASmgjBcR69ZJyBkNVZ9NsL8PswR1ykyrqY3l/P
         fcTaanM/Py5WCudXEWzvWZuKhfE6hEapxzUDlmMdRG41gMte34TV8EuntDn+iJmGRf65
         YQT6q+bJ0QE9VFoYfAtv/+19VnIfpeEeD4WFwEfg8sPjn+gxPHXwJoI3g2qKRBGFg6rH
         Xco8e8EqHrv2Z4nTva3mYqzsGxRWmeJtJT5/qO7dkBWpsANRxwqcrkCxTmQRDgBDOKQ5
         1/uSGtYhfJVX4M2raV10B5BeGwzcveytg+4ERd6O6B21sjrwBFAj1xUvpfj+ZiqCdxRq
         pQ+w==
X-Gm-Message-State: AOJu0YzfG9uU8NsDY5fBTi2l20Ygl/+oObDwYxBv1zejyuOwyPikidFQ
	t89Wg3uvvGwEQABDZkQw8GSQ2f/uvGA+q65CcAoonzdBq77kRpmZQN598axrdR4MbprKEc24h8r
	kILvQL8PtR+CL61nDH5+80tsOHnnb6Qq+6IYOGQ==
X-Google-Smtp-Source: AGHT+IGFWxjQkBRz7IxrDZpnVVz2MT1txRsJM3zNHflhGVnqovLvAGteZ6c5BloRTpUm4060ThSbAiXosyNa2PYeilg=
X-Received: by 2002:a05:651c:54a:b0:2ef:290e:4a39 with SMTP id
 38308e7fff4ca-2f4f4927e50mr102364371fa.35.1724752643749; Tue, 27 Aug 2024
 02:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1724314239.git.andrii.sultanov@cloud.com>
 <6d4b94939c8910ffd7d70301b1d26c828f72ad86.1724314239.git.andrii.sultanov@cloud.com>
 <Zscl2DITQS9T6Sg9@l14>
In-Reply-To: <Zscl2DITQS9T6Sg9@l14>
From: Andrii Sultanov <andrii.sultanov@cloud.com>
Date: Tue, 27 Aug 2024 10:57:12 +0100
Message-ID: <CAAa3AOMv64=Gunzbi32oNCpswU5Hw+6bfRfO9PqOi3KQ7zcLjA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] ocaml/libs: Implement a dynamically-loaded plugin
 for Xenctrl.domain_getinfo
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Content-Type: multipart/alternative; boundary="000000000000a813740620a744d3"

--000000000000a813740620a744d3
Content-Type: text/plain; charset="UTF-8"

> It seems that location for ocaml libs is in $(OCAMLDESTDIR), any reason
> to deviate from that?

OCAMLDESTDIR is only defined in tools/ocaml/common.make, and is unavailable
at the top-level directories level of the autoconf infrastructure (which
generates the
paths.ml file), as far as I understand.

> Is there any reason to put that new library in "/usr/libexec"?
> It doesn't seems like a good place for it, and using "/usr/lib" instead
> seems better.

I find that the general idea of libexec - that only a particular program
(oxenstored)
relies on this and others should not - fitting for this use case. It will
additionally
distinguish between the plugin itself and the packaged plugin interface
(that will go
into OCAMLDESTDIR, as suggested elsewhere in the review comments)

> libexec is mostly for binary, according to
>    https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s07.html

Even though the .cmxs is a shared object, it will run some of its own code
to "link"
itself to the global ref defined in the plugin interface, even without
anyone calling
into the library, sort of behaving like a binary.

--000000000000a813740620a744d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt;=20
It seems that location for ocaml libs is in $(OCAMLDESTDIR), any reason<br>=
&gt; to deviate from that?

</div><div dir=3D"ltr"><br></div><div>OCAMLDESTDIR is only defined in tools=
/ocaml/common.make, and is unavailable</div><div>at the top-level directori=
es level of the autoconf infrastructure (which generates the</div><div><a h=
ref=3D"http://paths.ml">paths.ml</a> file), as far as I understand.<br></di=
v><div><br></div><div>&gt;=20
Is there any reason to put that new library in &quot;/usr/libexec&quot;?<br=
>
&gt; It doesn&#39;t seems like a good place for it, and using &quot;/usr/li=
b&quot; instead<br>
&gt; seems better.<br>

</div><div dir=3D"ltr"><br></div><div>I find that the general idea of libex=
ec - that only a particular program (oxenstored)</div><div>relies on this a=
nd others should not - fitting for this use case. It will additionally</div=
><div>distinguish between the plugin itself and the packaged plugin interfa=
ce (that will go</div><div>into OCAMLDESTDIR, as suggested elsewhere in the=
 review comments)<br></div><div><br></div><div>
&gt; libexec is mostly for binary, according to<br>&gt;=C2=A0 =C2=A0 <a hre=
f=3D"https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s07.html" rel=3D"=
noreferrer" target=3D"_blank">https://refspecs.linuxfoundation.org/FHS_3.0/=
fhs/ch04s07.html</a>

</div><div><br></div><div>Even though the .cmxs is a shared object, it will=
 run some of its own code to &quot;link&quot;=C2=A0</div><div>itself to the=
 global ref defined in the plugin interface, even without anyone calling</d=
iv><div>into the library, sort of behaving like a binary.<br></div></div>

--000000000000a813740620a744d3--

