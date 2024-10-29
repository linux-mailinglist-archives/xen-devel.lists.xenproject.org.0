Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9663B9B47A0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 12:00:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827259.1241832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jxG-000083-8y; Tue, 29 Oct 2024 11:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827259.1241832; Tue, 29 Oct 2024 11:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jxG-0008W6-6A; Tue, 29 Oct 2024 11:00:06 +0000
Received: by outflank-mailman (input) for mailman id 827259;
 Tue, 29 Oct 2024 11:00:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5jxE-0008Dk-FG
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 11:00:04 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0c57a31-95e4-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 11:59:59 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso781347566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 03:59:59 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb631a24dsm3831291a12.74.2024.10.29.03.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 03:59:58 -0700 (PDT)
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
X-Inumbo-ID: f0c57a31-95e4-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYwYzU3YTMxLTk1ZTQtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMTk5NTk5Ljg5MzQzNywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730199599; x=1730804399; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTsghFy1Ayh32UBlFMRlzPpNBumM3S1QCcBT04TmHak=;
        b=cDSw9dxWVikNzOU+qLmDF7LTj9SlEPYSXswW9pxJl1/+obqpOyZEZA/6mbLvmQsjWh
         ftmWx54rqQpGjjEINJpPhiSq8nZkPctRemyBhIOjJsmZDxxrGr8N5ekf00rH52pIwaWf
         kJbaOSwjpt7XmbRtc0jQyiKZ8gWLsXjFI5gI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199599; x=1730804399;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZTsghFy1Ayh32UBlFMRlzPpNBumM3S1QCcBT04TmHak=;
        b=iKgfPd+C5R7a9W07As8utAOLevr3ACA5jHJ10+hbJa5/2Wi0P0dmDFcUASxiosEj0s
         Kl4wpqif1qxlhMmEhWdKD8JRk3dLXAZb1ZP3dWn4wKI/WJs4xaHpkOUY7kk0Tj7lYmRK
         ZHk9XSuft1iUvEaf4ZJsJw4qqRr4X3UVm7++Ms0wDlh3MXFGRzWB5ippgNVvGMD4XxnO
         3ZJINBhlmhTk3e4UR2gPD0T8exD86lzcildBldbst3uO/8Dfr5rrsNh+8h6HXNCpE7nG
         Ix8siWXrtzSK4z4qtL3DhdsznnA2iQ3eqvt1grmtlstG/4+AKsSAWcI3mQZ2KIDOS2Aa
         cKEA==
X-Forwarded-Encrypted: i=1; AJvYcCW0fWjRI5Yg/vXJgfxFMikrwnZdCGQ3OSWOmo65G3bztcSWUJHsIUONGSPO57Vh41+yCHnLf/LFEqc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyL9uJ2o1IPJgl1vbQgGyE5eyeqnV7sgtWNm8XxYDGhx0J7fT8A
	UFjgFKGffygE5aPvLn3i1BDsrHRordstWy55yJk3jd3dgAIY8n4kZwyE+AM9y1edD+iNjEQHluO
	N
X-Google-Smtp-Source: AGHT+IF+lo/2cLctftdBr3o34xeA0aYShztjINgB9F0zQrM+U6lwX7r3FyBix5u2slyC6NNVxY6DAw==
X-Received: by 2002:a17:907:948c:b0:a99:f8db:68b2 with SMTP id a640c23a62f3a-a9de5ecca55mr1192183266b.18.1730199599191;
        Tue, 29 Oct 2024 03:59:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Oct 2024 10:59:58 +0000
Message-Id: <D588KIJCBFQQ.2AC6KE08Z8YWK@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 12/14] x86/fpu: Pass explicit xsave areas to
 fpu_(f)xsave()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-13-alejandro.vallejo@cloud.com>
 <85e7334b-b878-4896-8f7a-462ba73ea9e2@suse.com>
In-Reply-To: <85e7334b-b878-4896-8f7a-462ba73ea9e2@suse.com>

On Tue Oct 29, 2024 at 8:37 AM GMT, Jan Beulich wrote:
> On 28.10.2024 16:49, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/xstate.c
> > +++ b/xen/arch/x86/xstate.c
> > @@ -300,9 +300,8 @@ void compress_xsave_states(struct vcpu *v, const vo=
id *src, unsigned int size)
> >      vcpu_unmap_xsave_area(v, xstate);
> >  }
> > =20
> > -void xsave(struct vcpu *v, uint64_t mask)
> > +void xsave(struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
> >  {
> > -    struct xsave_struct *ptr =3D v->arch.xsave_area;
> >      uint32_t hmask =3D mask >> 32;
> >      uint32_t lmask =3D mask;
> >      unsigned int fip_width =3D v->domain->arch.x87_fip_width;
>
> Imo this change wants to constify v at the same time, to demonstrate that
> nothing is changed through v anymore. The comment may extend to other fun=
ctions
> as well that are being altered here; I only closely looks at this one.
>
> Jan

I didn't think of that angle... I'll have a look and take it into account f=
or
v2.

Cheers,
Alejandro

