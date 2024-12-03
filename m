Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7120F9E10E9
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 02:45:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847223.1262341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIHyQ-0000OR-GE; Tue, 03 Dec 2024 01:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847223.1262341; Tue, 03 Dec 2024 01:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIHyQ-0000MS-D5; Tue, 03 Dec 2024 01:45:10 +0000
Received: by outflank-mailman (input) for mailman id 847223;
 Tue, 03 Dec 2024 01:45:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fX1Z=S4=google.com=kevinloughlin@srs-se1.protection.inumbo.net>)
 id 1tIHyO-0000MM-Gw
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 01:45:08 +0000
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [2607:f8b0:4864:20::a2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37fca537-b118-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 02:45:05 +0100 (CET)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-5152377321cso1262571e0c.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 17:45:06 -0800 (PST)
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
X-Inumbo-ID: 37fca537-b118-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733190305; x=1733795105; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wscqKrTwFb9sgoc/UfAh+DpARa9frP273Npy3sEJYN8=;
        b=y/8bFtFyrjzUnrJ3LJq1pwH94m4S7alku5Blp/DwYrz/qIBH05yKToxBZWx/zbRyQc
         zgJ4BKqbhkCXndD73z93lKlUZLQCQyOwXNovs5IZ+ZzARiZRn3IiRXC7jlxuDWZbtjzR
         mOnRtmxN9ttsAdaKzlMjZP4TwxNMYFAM+FtQCn+gIiaFZ5wGBO2VjpGq4a1UeHqoBKQE
         81kmWmw3cwAlW7j2XYAzNxCTabCEGPm3wiMcYkEmvJD1I56t8wqmUxI/zZ74i1zt3Fr1
         xfoL4FFjA/gjJIogg55aftN6TXq8kmYuEA+hh+ffDWXcCLx0MIMSkkBvyXFQSwOLi8yv
         rt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733190305; x=1733795105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wscqKrTwFb9sgoc/UfAh+DpARa9frP273Npy3sEJYN8=;
        b=e/QqAgxC+hYZ9GAb2xZVtCb59dP6Vs3SL9Qr9Mn979a9Q6oefSjfNpWztqfsW8urQ8
         Ox0yWhzIVL+5Oj+b/ZAIKN97kQgu2UzQuO/+o7RCyu9EgrXDf+qOZqaO2Rdf2s4AEoQQ
         xqkdU4Y/ImxCm20NJzSSgIR1NsgtCeziWlj6mumo+gsNhNDUZwuWL4a9yd2Tn5EJ2J1r
         jHFDKlsNZg8aJ6OQtPwT3Q07H2E/5Izgc5mdq4tfaHGX50Aa3Hkg3DiLFJQNYlcZLft2
         DXXe6fVX/Vu8vJ/rYjS+kCopHedsn5Ow4+DRQZkKWAcdzYV25+K6lW1gwcZR5wj7UnL3
         ohNA==
X-Forwarded-Encrypted: i=1; AJvYcCXw2TTJttSKPIZM4AK9/AqAx6/3/so8pMrc7yRHtP11Ivut61NWHWaJkVG2+0PZsPv0KLo1fy05QQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0bWOk21NSLRSlk5/+nKQlWZHbbk0AkcWq3Vbo0rTrJ9sUGs18
	OWh2eat2EXsXI6pysEO2O+xDUWRYTWsB5rinqQs0J2rA2Jsd2CcZic1sz5otLbdOHdHNYmurTkU
	Hr9fKbaWj6CFC9NeOWM0MB57wmarTyPAaBSDi
X-Gm-Gg: ASbGncurPCq27bD1Qeo4GU1MOI/RrLvZdjk/4Xu838EAT6D/NlSVDv1Y8GSrdrylG0o
	KnqpEyq5Ob7F05MlcMPveoiAdjhqYp7+R
X-Google-Smtp-Source: AGHT+IEp0cLLV0HS2GVNv35k+CB8WVNUZpet9fwmVxa/fQluHk3o8PZV+wDlJqqbk9+pA1JRUyjCGBWE6ek73EZak9c=
X-Received: by 2002:a05:6122:169a:b0:515:4fab:2e53 with SMTP id
 71dfb90a1353d-515bf56cea7mr1114649e0c.7.1733190304632; Mon, 02 Dec 2024
 17:45:04 -0800 (PST)
MIME-Version: 1.0
References: <20241203005921.1119116-1-kevinloughlin@google.com>
 <20241203005921.1119116-2-kevinloughlin@google.com> <a9560e97-478d-4e03-b936-cf6f663279a4@citrix.com>
In-Reply-To: <a9560e97-478d-4e03-b936-cf6f663279a4@citrix.com>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Mon, 2 Dec 2024 17:44:53 -0800
Message-ID: <CAGdbjmLRA5g+Rgiq-fRbWaNqXK51+naNBi0b3goKxsN-79wpaw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] x86, lib, xenpv: Add WBNOINVD helper functions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: linux-kernel@vger.kernel.org, seanjc@google.com, pbonzini@redhat.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	kvm@vger.kernel.org, thomas.lendacky@amd.com, pgonda@google.com, 
	sidtelang@google.com, mizhang@google.com, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 5:28=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 03/12/2024 12:59 am, Kevin Loughlin wrote:
> > diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/par=
avirt.h
> > index d4eb9e1d61b8..c040af2d8eff 100644
> > --- a/arch/x86/include/asm/paravirt.h
> > +++ b/arch/x86/include/asm/paravirt.h
> > @@ -187,6 +187,13 @@ static __always_inline void wbinvd(void)
> >       PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT_XEN);
> >  }
> >
> > +extern noinstr void pv_native_wbnoinvd(void);
> > +
> > +static __always_inline void wbnoinvd(void)
> > +{
> > +     PVOP_ALT_VCALL0(cpu.wbnoinvd, "wbnoinvd", ALT_NOT_XEN);
> > +}
>
> Given this, ...
>
> > diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
> > index fec381533555..a66b708d8a1e 100644
> > --- a/arch/x86/kernel/paravirt.c
> > +++ b/arch/x86/kernel/paravirt.c
> > @@ -149,6 +154,7 @@ struct paravirt_patch_template pv_ops =3D {
> >       .cpu.write_cr0          =3D native_write_cr0,
> >       .cpu.write_cr4          =3D native_write_cr4,
> >       .cpu.wbinvd             =3D pv_native_wbinvd,
> > +     .cpu.wbnoinvd           =3D pv_native_wbnoinvd,
> >       .cpu.read_msr           =3D native_read_msr,
> >       .cpu.write_msr          =3D native_write_msr,
> >       .cpu.read_msr_safe      =3D native_read_msr_safe,
>
> this, and ...
>
> > diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> > index d6818c6cafda..a5c76a6f8976 100644
> > --- a/arch/x86/xen/enlighten_pv.c
> > +++ b/arch/x86/xen/enlighten_pv.c
> > @@ -1162,6 +1162,7 @@ static const typeof(pv_ops) xen_cpu_ops __initcon=
st =3D {
> >               .write_cr4 =3D xen_write_cr4,
> >
> >               .wbinvd =3D pv_native_wbinvd,
> > +             .wbnoinvd =3D pv_native_wbnoinvd,
> >
> >               .read_msr =3D xen_read_msr,
> >               .write_msr =3D xen_write_msr,
>
> this, what is the point having a paravirt hook which is wired to
> native_wbnoinvd() in all cases?
>
> That just seems like overhead for overhead sake.

I'm mirroring what's done for WBINVD here, which was changed to a
paravirt hook in 10a099405fdf ("cpuidle, xenpv: Make more PARAVIRT_XXL
noinstr clean") in order to avoid calls out to instrumented code as
described in the commit message in more detail. I believe a hook is
similarly required for WBNOINVD, but please let me know if you
disagree. Thanks!

