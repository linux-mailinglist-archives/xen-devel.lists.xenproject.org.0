Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ED5ACAF43
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:42:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003377.1382916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5QR-0005Dq-Ks; Mon, 02 Jun 2025 13:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003377.1382916; Mon, 02 Jun 2025 13:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5QR-0005Bs-Hx; Mon, 02 Jun 2025 13:42:03 +0000
Received: by outflank-mailman (input) for mailman id 1003377;
 Mon, 02 Jun 2025 13:42:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2MT+=YR=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uM5QQ-0005Bl-AP
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:42:02 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c4a6f22-3fb7-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 15:42:01 +0200 (CEST)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2e8ec65078eso3270606fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 06:42:01 -0700 (PDT)
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
X-Inumbo-ID: 5c4a6f22-3fb7-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748871720; x=1749476520; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7PQuANJfTujA3g/Om1tWM/nzKErHeArIm4YuhdyCvU=;
        b=BRetK6GGEcgfVbJG72usV4s5d/mcnGHemv9MzoVTV+Wg1gdNBst/vhtZ/w60VwSPo7
         BuPEatAptLL82/tFI02uFn+6bJQMpjGNJ9mUlJzN35LprUVU6QWf9nG1aazGzESuWnfM
         LiUrFwfe4MluXJ9DH6tfB/Xot5Gw+90VirgNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871720; x=1749476520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7PQuANJfTujA3g/Om1tWM/nzKErHeArIm4YuhdyCvU=;
        b=YojxveowFFuBdWZ+oTur4eUaC3DsmHSlGy6DZYFlyOVuM3seDCSXGfvW0h7Hbgs8VF
         dT9/uQ09/pCt0oK/1lp7Sf7bMw581iNa//qu4j8wFXgoY/esmw4C5IiAGz3yHJhFF6z9
         TNoUZYue9g/X1jMmxmZ/A3uvzrdekVlre86pQ936PfFs5Rp9OTVnO7IZfJBL6HSRAmLq
         qRxZTwjNRy02QYEpD/EOAppMWtTJmBIgF4Y32O3nNf3PXHIDXIVWXyhGaByBAyA1WAmC
         Ned6hSYMLYe4z1MiHVMv/QGVm1LnF1uK9pf7d+5KNJ1+oSza5sN0R/uvXiAhd75R70Mr
         Dg9A==
X-Forwarded-Encrypted: i=1; AJvYcCXv9uC5s4bKmJ78JhyrqVw9k8XEkZSHqBIaXUTZ4gUi1clYz1RjYhzLScOHl3lVjBUmIRlAP0OwQuE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx18bzRLQsUHkF/62K/TKT6ndK55NkIr9sLbj0+68An2Rehmmeu
	um3wgdEffrdhRoRpTT3PQdA6H7BmCduikNlunj55ETgUNF09FcWCqstHTmJEF22bzZiv/NRLskY
	EqVnnnw2DyqAf61ngKf/dReXmHEyLvr6IphgZfjMpA+077a8qXORXuw==
X-Gm-Gg: ASbGncsuSodjmKcrqITEDqL228VlKUgRNv4Yr/X8UPS5pcD3OySLj2o/mFsERU7w2TD
	zNQEy9xLYA4FQT8zCZHwuQpXMvoWqbh9Ug+LODIbo1bw4rypQZArR5HFezVQvizkt8qQPb8SRCO
	YLbnXctIx5V4T4M/ORlwpsoDge4YJEANI=
X-Google-Smtp-Source: AGHT+IHm2T2yKn9FuSpyCg9OjEmGB7rTkfVvdgYGcTDKDAFkt+8YzGPrDCSFwg7ZnIwg+kwDChUmNtGcA8YTkFb9ILI=
X-Received: by 2002:a05:6871:713:b0:2c2:260:d77b with SMTP id
 586e51a60fabf-2e9486d6508mr5058862fac.5.1748871720291; Mon, 02 Jun 2025
 06:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250515093822.659916-1-ross.lagerwall@citrix.com>
 <20250515093822.659916-5-ross.lagerwall@citrix.com> <2c5fbc92-c81f-452c-8a5a-3f1eaf53dfdb@suse.com>
In-Reply-To: <2c5fbc92-c81f-452c-8a5a-3f1eaf53dfdb@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Mon, 2 Jun 2025 14:41:48 +0100
X-Gm-Features: AX0GCFvTq6Vq5JBgMcyXp2hGPWqqtrX1z7biGpGUMFstGsjRS5tHU9AtW8Fti-8
Message-ID: <CAG7k0EqC9tbZqKBZJchQdLZ0fF-NiQp_8226gyF_UWgwEp-O4g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] livepatch: Load built-in key during boot
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 1:17=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.05.2025 11:38, Ross Lagerwall wrote:
> > @@ -73,6 +75,10 @@ static struct livepatch_work livepatch_work;
> >  static DEFINE_PER_CPU(bool, work_to_do);
> >  static DEFINE_PER_CPU(struct tasklet, livepatch_tasklet);
> >
> > +#ifdef CONFIG_PAYLOAD_VERIFY
> > +static struct rsa_public_key builtin_payload_key;
>
> __read_mostly or even __ro_after_init?
>
> > @@ -2287,6 +2293,31 @@ static void cf_check livepatch_printall(unsigned=
 char key)
> >      spin_unlock(&payload_lock);
> >  }
> >
> > +static int __init load_builtin_payload_key(void)
> > +{
> > +#ifdef CONFIG_PAYLOAD_VERIFY
> > +    const uint8_t *ptr;
> > +    uint32_t len;
> > +
> > +    rsa_public_key_init(&builtin_payload_key);
> > +
> > +    ptr =3D xen_livepatch_key_data;
> > +
> > +    memcpy(&len, ptr, sizeof(len));
>
> Doesn't this (and the similar one further down) need to be an endian-
> ness conversion? In fact, seeing how the data is being built, it's
> not really clear to me what endian-ness the field would be written
> in, when build host and target host endianness differ.

Good point. In v3, I've made this and the build-time tool use little
endian which in most cases should be a no-op.

>
> > +    ptr +=3D sizeof(len);
> > +    builtin_payload_key.n =3D mpi_read_raw_data(ptr, len);
>
> Whether there are endianness concerns here I also don't know.

As a byte sequence, this always uses big endian (much like OpenSSL).
I've added a comment in v3 to clarify this.

Thanks,
Ross

