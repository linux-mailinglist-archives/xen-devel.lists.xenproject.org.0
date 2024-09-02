Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF26596824E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 10:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787645.1197070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2h2-00027z-C3; Mon, 02 Sep 2024 08:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787645.1197070; Mon, 02 Sep 2024 08:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2h2-00026R-80; Mon, 02 Sep 2024 08:45:48 +0000
Received: by outflank-mailman (input) for mailman id 787645;
 Mon, 02 Sep 2024 08:45:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/cM=QA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sl2h1-00026I-1n
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 08:45:47 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bea6a67a-6907-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 10:45:45 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c210e23573so4016114a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 01:45:45 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c250b06725sm1920038a12.82.2024.09.02.01.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 01:45:44 -0700 (PDT)
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
X-Inumbo-ID: bea6a67a-6907-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725266745; x=1725871545; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9HrfPe7Pf6yhyELogj2LYVh4WzkNyvHvW63pdIpAQXo=;
        b=qUWOynqgVJP4GrxN0kF2EbyE9SYzaIuIj+I5iq7ESbhveqHKOdTTvAUyYf8/76qYQM
         HgedFl8bV0OyaxRg32RtqjXJfK4Hnwgfw6FGfqLb/0XoEwo+155CvDKXGZszDcEuV7XX
         y/ggdQdXJhiaedzJsZnbEw5IidZCPFjuU3lAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725266745; x=1725871545;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HrfPe7Pf6yhyELogj2LYVh4WzkNyvHvW63pdIpAQXo=;
        b=r7fIrAgZmH6rv5UppbXbHyqULov1TqN6YR8JAW5BJkvhJPXbZkAd+/gqm4tQJ2vhzP
         9r69YPtVBE+AYyeN7ksSe7qLxDf2femKkbbRJTCH/+6ekYpwpTqgp+uItcFBCrOlv56R
         CbZxpKxSBQWXM+SHTdqd1GILdNB0S4Xkq2DhHt5BME2vhVAsmkWpDf44vkn2+j6kbAGo
         XESRfJwFWml2p925hX6BnjQ6hHTfunrhc4KuJWC6CuHzYpm0yDMIzvoTWQ9sF/e8KmQa
         Xkx7ongkbUfGACmUzl2M8CUvULVjngsnQ/84u17k+F1EHzrdImGj3p6eEQBl8Orvhd/4
         vkcQ==
X-Gm-Message-State: AOJu0YxHv3tQJUHVg9uxQWpybwko4WknTA7Mg4m+Vw+CGaoc59BfkTkB
	IGswvl3VkjZlbL1sF7Vnfkf4yS05QpgRMZppbCAdwbsX9BS/ch1Kgox/Hzz8zuM=
X-Google-Smtp-Source: AGHT+IHATXs0M40cWc61ohT99dvCA5g7g2M2omFpXxN1cDZEOVvSdA2WWwmwFvEr+7lPLoxOMoLU6Q==
X-Received: by 2002:a05:6402:3484:b0:5c0:ba90:463f with SMTP id 4fb4d7f45d1cf-5c25f22d5c1mr969649a12.7.1725266744575;
        Mon, 02 Sep 2024 01:45:44 -0700 (PDT)
Date: Mon, 2 Sep 2024 10:45:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86/time: prefer CMOS over EFI_GET_TIME
Message-ID: <ZtV7Nzp7AxXh0NQF@macbook.local>
References: <20240830095220.49473-1-roger.pau@citrix.com>
 <20240830095220.49473-3-roger.pau@citrix.com>
 <ca2aa9b3-44cf-4a44-9111-1d7e8c9b4dff@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca2aa9b3-44cf-4a44-9111-1d7e8c9b4dff@citrix.com>

On Fri, Aug 30, 2024 at 05:31:04PM +0100, Andrew Cooper wrote:
> On 30/08/2024 10:52 am, Roger Pau Monne wrote:
> > The EFI_GET_TIME implementation is well known to be broken for many firmware
> > implementations, for Xen the result on such implementations are:
> >
> > ----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
> > CPU:    0
> > RIP:    e008:[<0000000062ccfa70>] 0000000062ccfa70
> > [...]
> > Xen call trace:
> >    [<0000000062ccfa70>] R 0000000062ccfa70
> >    [<00000000732e9a3f>] S 00000000732e9a3f
> >    [<ffff82d04034f34f>] F arch/x86/time.c#get_cmos_time+0x1b3/0x26e
> >    [<ffff82d04045926f>] F init_xen_time+0x28/0xa4
> >    [<ffff82d040454bc4>] F __start_xen+0x1ee7/0x2578
> >    [<ffff82d040203334>] F __high_start+0x94/0xa0
> >
> > Pagetable walk from 0000000062ccfa70:
> >  L4[0x000] = 000000207ef1c063 ffffffffffffffff
> >  L3[0x001] = 000000005d6c0063 ffffffffffffffff
> >  L2[0x116] = 8000000062c001e3 ffffffffffffffff (PSE)
> >
> > ****************************************
> > Panic on CPU 0:
> > FATAL PAGE FAULT
> > [error_code=0011]
> > Faulting linear address: 0000000062ccfa70
> > ****************************************
> >
> > Swap the preference to default to CMOS first, and EFI later, in an attempt to
> > use EFI_GET_TIME as a last resort option only.  Note that Linux for example
> > doesn't allow calling the get_time method, and instead provides a dummy handler
> > that unconditionally returns EFI_UNSUPPORTED on x86-64.
> >
> > Such change in the preferences requires some re-arranging of the function
> > logic, so that panic messages with workaround suggestions are suitably printed.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/time.c | 26 +++++++++++++++++++-------
> >  1 file changed, 19 insertions(+), 7 deletions(-)
> >
> > diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> > index 272ca2468ea6..0eee954809a9 100644
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -1305,24 +1305,36 @@ static unsigned long get_cmos_time(void)
> >      static bool __read_mostly cmos_rtc_probe;
> >      boolean_param("cmos-rtc-probe", cmos_rtc_probe);
> >  
> > +    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
> > +        cmos_rtc_probe = false;
> > +
> > +    if ( (!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) ||
> > +          cmos_rtc_probe) && read_cmos_time(&rtc, cmos_rtc_probe) )
> > +        return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
> > +
> >      if ( efi_enabled(EFI_RS) )
> >      {
> >          unsigned long res = efi_get_time();
> >  
> >          if ( res )
> >              return res;
> > +
> > +        panic("Broken EFI_GET_TIME %s\n",
> > +              !cmos_rtc_probe ? "try booting with \"cmos-rtc-probe\" option"
> > +                              : "and no CMOS RTC found");
> >      }
> >  
> > -    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
> > -        cmos_rtc_probe = false;
> > -    else if ( system_state < SYS_STATE_smp_boot && !cmos_rtc_probe )
> > +    /*
> > +     * No viable clock source found.  Attempt to provide some guidance to the
> > +     * user about possible workarounds to boot Xen on the system.
> > +     */
> > +    ASSERT(system_state < SYS_STATE_smp_boot);
> > +
> > +    if ( !cmos_rtc_probe )
> >          panic("System with no CMOS RTC advertised must be booted from EFI"
> >                " (or with command line option \"cmos-rtc-probe\")\n");
> >  
> > -    if ( unlikely(!read_cmos_time(&rtc, cmos_rtc_probe)) )
> > -        panic("No CMOS RTC found - system must be booted from EFI\n");
> > -
> > -    return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
> > +    panic("No CMOS RTC found - system must be booted from EFI\n");
> >  }
> >  
> >  static unsigned int __ro_after_init cmos_alias_mask;
> 
> Hmm, I know I said "fix the crash first, cleanup later" on the prior
> patch, but I'm tempted to retract that.  This is very hard to follow.

Yeah, I was attempting to refrain myself from fully re-writing the logic.

> Going back to first principles, at runtime we need USE_{XEN,RTC,EFI} to
> select between the various methods available.
> 
> At boot, we need to figure out what to do.  I think we want an
> init_wallclock_time() split out of get_cmos_time() (which is badly named
> anyway, given EFI), and called from init_xen_time() only.  In
> particular, the init stuff should not be re-evaluated in
> time_{suspend,resume}().

I also disliked the current arrangement, and adding a probe function
crossed my mind, I simply wanted to avoid this fix growing to a 10
patch series, but I think it's inevitable.

> Various details we have to work with:
> 
>  * ACPI_FADT_NO_CMOS_RTC, although we know this is falsely set on some
> platforms, hence the whole probing logic.
> 
>  * Booted on an EFI system, although we know EFI_GET_TIME is broken on
> millions of systems, and we only find this out with a #PF in the middle
> of EFI-RS.  Furthermore, more-major-OSes-than-us strictly veto the use
> of this service, and it's not only Linux; it's Windows too.
> 
> Personally, I think "cmos-rtc-probe" is inappropriate/insufficient.  It
> ought to be wc-time=guess|xen|rtc|efi.  We should be able to influence
> the behaviour more than a boolean "probe or not".  The Xen case might be
> better as "hypervisor", although I can't see any evidence of Viridian
> having a virtualised wallclock interface.
> 
> I think the init logic wants to be:
>  * If ACPI says we have an RTC, use it.
>  * If ACPI says we have no RTC, probe to see if it's really there.
>  * If we genuinely seem to not have an RTC, probe EFI.  This would be
> quite invasive in the #PF handler, but not impossible.

My plan would be to use EFI as a last resort if available, and hence
not probe it.  It would however be nice to give the user a better
error message than a #PF in the hypervisor with some random stack
trace.

Is #PF the only fault that we can expect from EFI_GET_TIME?  That's
what I've seen on some of the systems, but I wouldn't for example
discard #GP or #UD as also possible outcomes?

> 
> 
> That said, I'm still holding out hope that we can simply delete Xen's
> need for wallclock time.  Xen only uses wallclock time for the
> non-default console_timestamps=date, but even then it's uncorrelate with
> dom0 changing the platform time, leading to actively-misleading log
> files.  There's a reason why "time since boot" is the norm.

But there's a wallclock provided in the share_info page, do you
suggest that dom0 should pass the wallclock value to Xen, so Xen can
initialize the shared_info wallclock time?

That would leave the fields uninitialized for dom0 which would be an
ABI change.

Thanks, Roger.

