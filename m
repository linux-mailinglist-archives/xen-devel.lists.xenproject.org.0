Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 442811EBC8B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 15:08:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6ek-0004D6-I5; Tue, 02 Jun 2020 13:08:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr0K=7P=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jg6ej-0004D0-Hl
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 13:08:37 +0000
X-Inumbo-ID: 2b42dacc-a4d2-11ea-8993-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b42dacc-a4d2-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 13:08:36 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id a2so12641913ejb.10
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 06:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IyEANLQ0o6/Fw9Bto3i5SOm9Shq6rYVQG+4iJJiLZ44=;
 b=t1ND66yVJPWmZ0YVI4WzbKjikgqyjyq6GFLylPD82yMUGoDrx3r5vSDE8vC6WyJFV6
 y8rjCUx+XpWUDklb68MQwDJjjfH8g7/e8499G77lQ8/7tYcioX+kUXFs/rFUbBAn9iYS
 BQs/JZ53m36KEygkdzxw69i7ZEx04SIIJS54Tww04Fxpxp3w9pa0+qPHWCRRiWZVNYiW
 6MPKYSZTQT1IU74FGlYjsmMoMM2WuAfOYVm02olTdVUmRCRpjxJK5JslR8ho1L9p200N
 Xt+fPKlJRI+55XvTqc4QzQgLSuTdG9elteJg3HYc/Zw53CasqEGOyEMSsffobq+n3kNS
 gEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IyEANLQ0o6/Fw9Bto3i5SOm9Shq6rYVQG+4iJJiLZ44=;
 b=ckf0vYrmLBhg46LoHZJqPevpVTKs+pR+E0dEhzukQzjtsRueL6uM9U97B71ebDxfL/
 6DFZ4Xpnf6bHNET8WSeC1SFL31io+x90Es3X/Baue6OvXZtvxDYBNSm17/aTFm9iXWLl
 YflJkq/k4LMFOiI2tleFr5DW1Xo77NrVS2mFiNOEzLATA0MUdA2fE10a0g/Y3E75D2JG
 i5nJ6gmZ26Go6Aw8m0MpdfbpmbAW373yqjZAJKYAYdLMuP8SE/oeafWbq9FDiRqJ2HwX
 EqDWwIrj6xl42F4F7jCLrWK2URJi9i2CLv1lusbo4ylmOHeHc1BoHdghLr9W0dRVrfqe
 tLEg==
X-Gm-Message-State: AOAM532aWnDKR1cc8Yi3WXqAvR+YZWaVp45hRCCPibfVu41rUA5UoClY
 H0kINnjLwR1uwK+x2Wp203L5vys0mBY=
X-Google-Smtp-Source: ABdhPJz4SDFX0arws/MdHr1wSjx+xR7dNvk+nHbOne1hlYIza9X5L57UELqrt/8RtUBSI0E7TXF/1g==
X-Received: by 2002:a17:906:2a4d:: with SMTP id
 k13mr24432698eje.253.1591103315077; 
 Tue, 02 Jun 2020 06:08:35 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46])
 by smtp.gmail.com with ESMTPSA id gt26sm1611680ejb.107.2020.06.02.06.08.34
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 06:08:34 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id f5so3063720wmh.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 06:08:34 -0700 (PDT)
X-Received: by 2002:a05:600c:2294:: with SMTP id
 20mr4311282wmf.51.1591103314027; 
 Tue, 02 Jun 2020 06:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590028160.git.tamas@tklengyel.com>
 <b3c147cc226f3a30daec73b2ffd57bd285bc8659.1590028160.git.tamas@tklengyel.com>
 <20200602110223.GW1195@Air-de-Roger>
 <CABfawh=NST0Vq+O5UCqyCxt1z2O9pcES_DQon4-cs9w0TPOuJQ@mail.gmail.com>
 <20200602130114.GZ1195@Air-de-Roger>
 <f6b6fbe0-b917-2e25-de32-999671101928@suse.com>
In-Reply-To: <f6b6fbe0-b917-2e25-de32-999671101928@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 2 Jun 2020 07:07:57 -0600
X-Gmail-Original-Message-ID: <CABfawhnQcpBF0dB17YDet+PP3ER7e9RdeROknzb-4oNZqsG4dA@mail.gmail.com>
Message-ID: <CABfawhnQcpBF0dB17YDet+PP3ER7e9RdeROknzb-4oNZqsG4dA@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14 1/3] xen/monitor: Control register values
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 2, 2020 at 7:04 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 02.06.2020 15:01, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Jun 02, 2020 at 06:40:12AM -0600, Tamas K Lengyel wrote:
> >> On Tue, Jun 2, 2020 at 5:08 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> >>> On Wed, May 20, 2020 at 08:31:52PM -0600, Tamas K Lengyel wrote:
> >>>> --- a/xen/arch/x86/hvm/hvm.c
> >>>> +++ b/xen/arch/x86/hvm/hvm.c
> >>>> @@ -2263,7 +2263,8 @@ int hvm_set_cr0(unsigned long value, bool may_=
defer)
> >>>>      {
> >>>>          ASSERT(v->arch.vm_event);
> >>>>
> >>>> -        if ( hvm_monitor_crX(CR0, value, old_value) )
> >>>> +        if ( hvm_monitor_crX(CR0, value, old_value) &&
> >>>> +             v->domain->arch.monitor.control_register_values )
> >>>>          {
> >>>>              /* The actual write will occur in hvm_do_resume(), if p=
ermitted. */
> >>>>              v->arch.vm_event->write_data.do_write.cr0 =3D 1;
> >>>> @@ -2362,7 +2363,8 @@ int hvm_set_cr3(unsigned long value, bool may_=
defer)
> >>>>      {
> >>>>          ASSERT(v->arch.vm_event);
> >>>>
> >>>> -        if ( hvm_monitor_crX(CR3, value, old) )
> >>>> +        if ( hvm_monitor_crX(CR3, value, old) &&
> >>>> +             v->domain->arch.monitor.control_register_values )
> >>>>          {
> >>>>              /* The actual write will occur in hvm_do_resume(), if p=
ermitted. */
> >>>>              v->arch.vm_event->write_data.do_write.cr3 =3D 1;
> >>>> @@ -2443,7 +2445,8 @@ int hvm_set_cr4(unsigned long value, bool may_=
defer)
> >>>>      {
> >>>>          ASSERT(v->arch.vm_event);
> >>>>
> >>>> -        if ( hvm_monitor_crX(CR4, value, old_cr) )
> >>>> +        if ( hvm_monitor_crX(CR4, value, old_cr) &&
> >>>> +             v->domain->arch.monitor.control_register_values )
> >>>
> >>> I think you could return control_register_values in hvm_monitor_crX
> >>> instead of having to add the check to each caller?
> >>
> >> We could, but this way the code is more consistent.
> >
> > OK, I guess it's a matter of taste. I would rather prefer those checks
> > to be confined to hvm_monitor_crX because then the generic code is not
> > polluted with monitor checks, but that's likely just my taste.
>
> +1


OK.

