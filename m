Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91307308E0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 21:57:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549223.857645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9WcR-00012O-P4; Wed, 14 Jun 2023 19:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549223.857645; Wed, 14 Jun 2023 19:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9WcR-0000z0-KL; Wed, 14 Jun 2023 19:57:27 +0000
Received: by outflank-mailman (input) for mailman id 549223;
 Wed, 14 Jun 2023 19:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9WcQ-0000yu-9H
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 19:57:26 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adf4fc94-0aed-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 21:57:25 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5147e8972a1so11980442a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 12:57:23 -0700 (PDT)
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
X-Inumbo-ID: adf4fc94-0aed-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686772643; x=1689364643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLPwTDo5gV4mqPvwKixQb840PKI9upvdKNQ9cbYW6Q8=;
        b=W2ov78I2fLzdyXFyjae1BbXmaJ7z/RMkaXP6zaB5hIFrlBcHlW7BTNBSt0QXWBZeA+
         FvjbNDAiNe8OJ3AdGVfCE83tlA3oQNReMQuYRr2V7TpYf6KPAIZcbf3ArQt0Qf0/tr1l
         amIBTKFg2Oi0uwX4lGLakw97Lprl8rBVx6iDuoSJoPAKgi7Ego/T91c5XUYZjPbowZlb
         L0pjIH3s9iCc0ol2fEzUAkFW6zM6AtKS7TbEEhOqCbzWyqxyujC09hyFgTgcTCAdT+jv
         VZ6lvf86Hyx0YhVji+W0UvoxYEK5QqXxP0SREU2e31HkPc75jS+vrpdYWTku1SVy/rFG
         IXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686772643; x=1689364643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLPwTDo5gV4mqPvwKixQb840PKI9upvdKNQ9cbYW6Q8=;
        b=VpFDdZD/b3jKKbN5Is40zhE4IDICXMImOPnIUyDBjsPUbJgbEaOCQI4Y48s4h30G5K
         sclcKt9JeqRJzvDcnSYu3n4C2Dk0syRXVEcsa5YAKMODtrjynGJ7SiOSDIXjqAWx52KW
         NboHdRAKEA/7hs1gCS5dqqrOnE3OtWyQPjS6BvP0oy8rdgw5Pp3Rv25tB9g3wIxkA0/S
         ikwCs7VbZjlPuJMgsNA5TY1z2hBvrWHXtqd8SaUmijKVUFGyIf/MmNIx5sY6HR9wZUyJ
         51RlTvDSp4aALnX2rzCU7rONuOyk63Y2r9xVtEqbV1UGR+wDWdHkp/YgJMre1wKaLFy7
         Ombw==
X-Gm-Message-State: AC+VfDz8JMljWoRV38Jilmx7F0SNPbbabnR5H1CvyoIOk3+RKgjQZzt+
	1Po/bRfkNPcR8if2+vNpyAhv5zwl1sLByhSaS1o=
X-Google-Smtp-Source: ACHHUZ4oTxUd1zwcNKSxEXWe/7DXGacs3lHbk1VkUT+4f2hzAvNapDLX1fEpElzJYAchKAT6G391OLBoYz2yHVDnOho=
X-Received: by 2002:a05:6402:34c:b0:50d:1e11:eb9 with SMTP id
 r12-20020a056402034c00b0050d1e110eb9mr10572574edw.1.1686772643127; Wed, 14
 Jun 2023 12:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20221121102113.41893-1-roger.pau@citrix.com> <20221121102113.41893-3-roger.pau@citrix.com>
 <bac0ed0f-6772-450b-663c-fc0614efa100@suse.com> <Y3uTTAWxe/676t3q@Air-de-Roger>
In-Reply-To: <Y3uTTAWxe/676t3q@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 14 Jun 2023 15:57:11 -0400
Message-ID: <CAKf6xptcWkdqELORESF1V9eeb-DFHS0UMumQbLYL1-Fgg0LhXg@mail.gmail.com>
Subject: Re: [PATCH 2/3] acpi/processor: sanitize _PDC buffer bits when
 running as Xen dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, jgross@suse.com, 
	stable@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Roger,

On Mon, Nov 21, 2022 at 10:04=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau@ci=
trix.com> wrote:
>
> On Mon, Nov 21, 2022 at 03:10:36PM +0100, Jan Beulich wrote:
> > On 21.11.2022 11:21, Roger Pau Monne wrote:
> > > --- a/drivers/acpi/processor_pdc.c
> > > +++ b/drivers/acpi/processor_pdc.c
> > > @@ -137,6 +137,14 @@ acpi_processor_eval_pdc(acpi_handle handle, stru=
ct acpi_object_list *pdc_in)
> > >             buffer[2] &=3D ~(ACPI_PDC_C_C2C3_FFH | ACPI_PDC_C_C1_FFH)=
;
> > >
> > >     }
> > > +   if (xen_initial_domain())
> > > +           /*
> > > +            * When Linux is running as Xen dom0 it's the hypervisor =
the
> > > +            * entity in charge of the processor power management, an=
d so
> > > +            * Xen needs to check the OS capabilities reported in the=
 _PDC
> > > +            * buffer matches what the hypervisor driver supports.
> > > +            */
> > > +           xen_sanitize_pdc((uint32_t *)pdc_in->pointer->buffer.poin=
ter);
> > >     status =3D acpi_evaluate_object(handle, "_PDC", pdc_in, NULL);
> >
> > Again looking at our old XenoLinux forward port we had this inside the
> > earlier if(), as an _alternative_ to the &=3D (I don't think it's valid
> > to apply both the kernel's and Xen's adjustments). That would also let
> > you use "buffer" rather than re-calculating it via yet another (risky
> > from an abstract pov) cast.
>
> Hm, I've wondered this and decided it wasn't worth to short-circuit
> the boot_option_idle_override conditional because ACPI_PDC_C_C2C3_FFH
> and ACPI_PDC_C_C1_FFH will be set anyway by Xen in
> arch_acpi_set_pdc_bits() as part of ACPI_PDC_C_CAPABILITY_SMP.
>
> I could re-use some of the code in there, but didn't want to make it
> more difficult to read just for the benefit of reusing buffer.
>
> > It was the very nature of requiring Xen-specific conditionals which I
> > understand was the reason why so far no attempt was made to get this
> > (incl the corresponding logic for patch 1) into any upstream kernel.
>
> Yes, well, it's all kind of ugly.  Hence my suggestion to simply avoid
> doing any ACPI Processor object handling in Linux with the native code
> and handle it all in a Xen specific driver.  That requires the Xen
> driver being able to fetch more data itself form the ACPI Processor
> methods, but also unties it from the dependency on the data being
> filled by the generic code, and the 'tricks' is plays into fooling
> generic code to think certain processors are online.

Are you working on this patch anymore?  My Xen HWP patches need a
Linux patch like this one to set bit 12 in the PDC.  I had an affected
user test with this patch and it worked, serving as an equivalent of
Linux commit a21211672c9a ("ACPI / processor: Request native thermal
interrupt handling via _OSC").

Another idea is to use Linux's arch_acpi_set_pdc_bits() to make the
hypercall to Xen.  It occurs earlier:
acpi_processor_set_pdc()
    acpi_processor_alloc_pdc()
        acpi_set_pdc_bits()
            arch_acpi_set_pdc_bits()
    acpi_processor_eval_pdc()

So the IDLE_NOMWAIT masking in acpi_processor_eval_pdc() would still
apply.  arch_acpi_set_pdc_bits() is provided the buffer, so it's a
little cleaner in that respect.

Thanks,
Jason

