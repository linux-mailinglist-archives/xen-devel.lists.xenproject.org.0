Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0316C927419
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 12:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753665.1161850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPJl1-0003m4-DV; Thu, 04 Jul 2024 10:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753665.1161850; Thu, 04 Jul 2024 10:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPJl1-0003kN-Au; Thu, 04 Jul 2024 10:32:07 +0000
Received: by outflank-mailman (input) for mailman id 753665;
 Thu, 04 Jul 2024 10:32:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EPo+=OE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sPJkz-0003kH-Jk
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 10:32:05 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a80d6683-39f0-11ef-bbf9-fd08da9f4363;
 Thu, 04 Jul 2024 12:32:04 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7527afa23cso55240966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 03:32:04 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf1bb6bsm586019666b.30.2024.07.04.03.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 03:32:03 -0700 (PDT)
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
X-Inumbo-ID: a80d6683-39f0-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720089124; x=1720693924; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1XApMi+8DvodCrfCf9LIdZCQ4QD7cfsXASSmgnXh8bU=;
        b=IL2iHaefCeWamaFaTpMK8Af7HNIdExHpsUCz4k4W5MjrwO6ps3FS3jdiTJiDSjO2BZ
         vDrDnFmCpl8lgo1rZo+pIS6irWWTJYl4y7kt5XwwZ1fh+Yao2qI/9itF03boRL4ZP7Ad
         TpK26fIs41rGU172X3RBWI87rmFZ5Z1ixJyw6FsjEu0wyc9SX25ikxLCPhccDvBXyyYJ
         rktxrCUeWpfGp1r0gE8hdc9zjORJsEza6JA9c9oJDq9CF5Y3BgLcsSJS8AWnSW/FS7Li
         bSvsYaSkH8M1BH46Gz8mWPE+yV/vitOSV0XUfj5tBZt9TMMdrcm0KCiUy3PiGwrEJ9bB
         hSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720089124; x=1720693924;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XApMi+8DvodCrfCf9LIdZCQ4QD7cfsXASSmgnXh8bU=;
        b=Rp31uImy45X2vB7q1zlmHtrBJ/I35nE54qSRDbteb18qEosH5z0FWBaf+iNtOgbZ+S
         CB8dFG5y9tA4Aijv3JuPq2uQUmgx0O5qdOJdaIYw9MH9cwe78Jt8Pzm1Vzs/ciA0R1k2
         28P4cDwF6BWPz6vGoLFxycXlsGMERGyGRq597fz8yWfMTmdp8TzN5upC+dekM7f+tvOM
         qDZCN+ceL7NkA7+sd4TeInrcoDRPs9Y3se09rWykZYezGaxq7X7ovq77mypS4SfpyKYK
         IrlUbPRDu1VD1U0FAQcycMErl8r4Vq+wpkwkSVozvWArY+e4RH48/9hnFfZwdmfZ/xvF
         beig==
X-Forwarded-Encrypted: i=1; AJvYcCUSv0gYPiNK5g2QvgBm9XccZy8PEoqiF9lX2U1hTM92vChiRihI7nw4CzxNHCY2jL3zj6xnisUkLa6IND9MKq/Yz7mKjLOvOnNHV5Nko4s=
X-Gm-Message-State: AOJu0YzH2bzNOSgca+Fnx0ePHWIcO5FgA5Zg74muo3NnLO01goGL7XVI
	p2YVU0CZSLrnh5o3C4ypPXyMsuiF3eaxM8d5NP+FVWL8JspMDoWl
X-Google-Smtp-Source: AGHT+IEc7Z68otNh5EKMEwQciaGVMlu6Pmmh0fBrxweNa3B4n4dBpkzUcnR28lAtVAhlOVv5cJvjOA==
X-Received: by 2002:a17:906:adca:b0:a72:9d25:8ad7 with SMTP id a640c23a62f3a-a77ba455795mr93497366b.1.1720089123909;
        Thu, 04 Jul 2024 03:32:03 -0700 (PDT)
Message-ID: <a1ed996df2afbc423f141dbd20a0881c321d4e9b.camel@gmail.com>
Subject: Re: [PATCH for-4.19] tools/xs-clients: Fix `make clean` rule
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
 <jgross@suse.com>
Date: Thu, 04 Jul 2024 12:32:03 +0200
In-Reply-To: <20240703223611.1754927-1-andrew.cooper3@citrix.com>
References: <20240703223611.1754927-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-03 at 23:36 +0100, Andrew Cooper wrote:
> Prior to the split, "the clients" used
> tools/xenstored/Makefile.common whose
> clean rule includes *.o whereas after the split, the removal of *.o
> was lost
> by virtule of not including Makefile.common any more.
>=20
> This is the bug behind the following build error:
>=20
> =C2=A0 make[2]: Entering directory '/local/xen.git/tools/xs-clients'
> =C2=A0 gcc=C2=A0=C2=A0=C2=A0=C2=A0 xenstore_client.o=C2=A0=C2=A0=C2=A0 (s=
nip)
> =C2=A0 /usr/bin/ld: xenstore_client.o: relocation R_X86_64_32S against
> `.rodata' can not be used when making a PIE object; recompile with -
> fPIE
> =C2=A0 /usr/bin/ld: failed to set dynamic section sizes: bad value
> =C2=A0 collect2: error: ld returned 1 exit status
> =C2=A0 make[2]: *** [Makefile:35: xenstore] Error 1
>=20
> which was caused by `make clean` not properly cleaning the tree as I
> was
> swapping between various build containers.
>=20
> Switch to a plain single-colon clean rule.
>=20
> Fixes: 5c293058b130 ("tools/xenstore: move xenstored sources into
> dedicated directory")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Juergen Gross <jgross@suse.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> For 4.19.=C2=A0 It's a minor build system corner case, but is also very
> safe too.
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

>=20
> Ultimately it needs backporting to 4.18 too.
> ---
> =C2=A0tools/xs-clients/Makefile | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/xs-clients/Makefile b/tools/xs-clients/Makefile
> index 4e78d365e0df..5415c441920a 100644
> --- a/tools/xs-clients/Makefile
> +++ b/tools/xs-clients/Makefile
> @@ -38,8 +38,8 @@ xenstore-control: xenstore_control.o
> =C2=A0	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
> =C2=A0
> =C2=A0.PHONY: clean
> -clean::
> -	$(RM) $(TARGETS) $(DEPS_RM)
> +clean:
> +	$(RM) *.o $(TARGETS) $(DEPS_RM)
> =C2=A0
> =C2=A0.PHONY: distclean
> =C2=A0distclean: clean


