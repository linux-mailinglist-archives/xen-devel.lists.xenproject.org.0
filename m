Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E137FB2429C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 09:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079482.1440314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um5sE-0006aN-2Q; Wed, 13 Aug 2025 07:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079482.1440314; Wed, 13 Aug 2025 07:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um5sD-0006ZU-U3; Wed, 13 Aug 2025 07:26:13 +0000
Received: by outflank-mailman (input) for mailman id 1079482;
 Wed, 13 Aug 2025 07:26:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zV9=2Z=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1um5sD-0006Yd-9Y
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 07:26:13 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c986cddc-7816-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 09:26:11 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so54324855e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 00:26:11 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3ac158sm47612555f8f.4.2025.08.13.00.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 00:26:10 -0700 (PDT)
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
X-Inumbo-ID: c986cddc-7816-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755069971; x=1755674771; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bHeYcTjmxodYuAyNKwXjhEgPTQNarlgaMTbnkGaftmc=;
        b=ucHQbjwanWqqSRsW/7hAABV7Sb696kJLORa6Z6YQaGG5fMu7LyBjjiYOFJ6A4kbGpb
         8h7JkQmzJ4/lYrB01ck0x3Q4WARFEjHFfs6ygZwvzHvBHBQAaWQs3XxSPaV7ZvUdH20+
         Y6IkeXUf5BB6s0EDhxXA1V/NZmKZxFZM65uOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755069971; x=1755674771;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHeYcTjmxodYuAyNKwXjhEgPTQNarlgaMTbnkGaftmc=;
        b=sqPnj2UBHsiaHobyw4VsmLSrU/TwiL2H2U4C2N2xpcePLBrNJ5H+/ZBvXTp6bBGU3r
         Hxx03IyB9Yxu6VN+FH5Lv1Gxe1EjEd5puJfNuXAo6GR7dCXmerKLWlfF5g4/g17OCWGa
         zsTu2Zyb1/Tke1i1K4AZwmgArQvUzoejlT1imNFkPJUuapavc8wKocreQag0HwLceYAT
         RJeSqYCOcDAzELGwgt5IumEuwG6/YRz1ZeIWQrx0jDph4241qY4/fppNi1OgNojenfSH
         znWYgI+mcPrwVza/KosLZ16ca5F/O+vl8d8q3Q3cX4MXBQbH7uieuVCb567Mv5cir2jH
         HECg==
X-Forwarded-Encrypted: i=1; AJvYcCUVAsyfA77Y4vVQg9Q2ttcEg67jFZ9iadGSevFCPWTFFrOnNmJlu8Zkl8JXA239bwWjh64QErIWDP8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDZ6lyberHPWGMHcoAgml1gV04ancPi/RButsKGEF+zJM+8gOu
	a4ClkjEBfqKvvKd24dAA4I/Q7XUOlSoDcjda3K1kHmn2djBLNwnsUJkyxqw3g6Dvw/g=
X-Gm-Gg: ASbGncuHaWfmheHFijctNJSv6v6m6U5AH5KUp8i5eyGFEW/ofa6y01BpbMhRuSP3+sM
	ld/aNN/y+fwjz4CmQvIuEEwwbC9HSzqXbdGCZp+ZgYyEOtMjBFBJqmDFChqkAkFHsY3PjJIwJQg
	D1Cpqls53UsFBaYQf4WnDu4EM33uR9UE8rreiw8rFYEFK8m5Ltg4rtWtQW5qyYmMoycDhWcho+U
	Ef7UwmBrxq5Dw437EIj6egiVX3cq0lNtOdg3shbB0UEG3/nufhJA4S2d9wzg9Rl2AxrGvEU9vW/
	6a2mgGTHF2yxf4kIJ1/bCQStWyc6bmdzhDLj92Kpye5mgVGgAtkxwFneaV480V3tExjfBFMi5oG
	lNftUNB7uKVEMyRaDvqwZt59O00mpG7nkH+durLHrkDWGhrNRHMoJuf7WnIQiAyC+vg==
X-Google-Smtp-Source: AGHT+IHuGhuBxOwQqIdH6u2VHgC9iRpH/LiqXiWHOwByGH7m6DvFqTE8vzKKCfSCbl8I2LkL6tVRnw==
X-Received: by 2002:a5d:5849:0:b0:3b7:9dc1:74a5 with SMTP id ffacd0b85a97d-3b917eb7c9emr1371130f8f.52.1755069970842;
        Wed, 13 Aug 2025 00:26:10 -0700 (PDT)
Date: Wed, 13 Aug 2025 09:26:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 regression related to XSA-471 patches
Message-ID: <aJw98srxJKZ2msct@macbook.local>
References: <aJMtPLNqQFbGg5cs@mail-itl>
 <f971f8a8-487e-4b9f-8c75-80ebfe70c3b6@suse.com>
 <aJMyjYfeTL5uPRtk@mail-itl>
 <aJTilUXpchmRq2Ng@mail-itl>
 <4fb544d7-fede-46b8-950e-f9c4af1cb04f@citrix.com>
 <B667172D-84FA-488D-98F9-0D7D34402EF7@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B667172D-84FA-488D-98F9-0D7D34402EF7@invisiblethingslab.com>

On Wed, Aug 13, 2025 at 04:53:53AM +0200, Marek Marczykowski-Górecki wrote:
> 
> 
> On August 11, 2025 3:16:46 PM GMT+02:00, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >On 07/08/2025 6:29 pm, Marek Marczykowski-Górecki wrote:
> >> On Wed, Aug 06, 2025 at 12:46:36PM +0200, Marek Marczykowski-Górecki wrote:
> >>> On Wed, Aug 06, 2025 at 12:36:56PM +0200, Jan Beulich wrote:
> >>>> On 06.08.2025 12:23, Marek Marczykowski-Górecki wrote:
> >>>>> We've got several reports that S3 reliability recently regressed. We
> >>>>> identified it's definitely related to XSA-471 patches, and bisection
> >>>>> points at "x86/idle: Remove broken MWAIT implementation". I don't have
> >>>>> reliable reproduction steps, so I'm not 100% sure if it's really this
> >>>>> patch, or maybe an earlier one - but it's definitely already broken at
> >>>>> this point in the series. Most reports are about Xen 4.17 (as that's
> >>>>> what stable Qubes OS version currently use), but I think I've seen
> >>>>> somebody reporting the issue on 4.19 too (but I don't have clear
> >>>>> evidence, especially if it's the same issue).
> >>>> At the time we've been discussing the explicit raising of TIMER_SOFTIRQ
> >>>> in mwait_idle_with_hints() a lot. If it was now truly missing, that imo
> >>>> shouldn't cause problems only after resume, but then it may have covered
> >>>> for some omission during resume. As a far-fetched experiment, could you
> >>>> try putting that back (including the calculation of the "expires" local
> >>>> variable)?
> >>> Sure, I'll try.
> >> It appears this fixes the issue, at least in ~10 attempts so far
> >> (usually I could reproduce the issue after 2-3 attempts).
> >>
> >
> >Can you show the exact code which seems to have made this stable?
> 
> This patch: https://github.com/marmarek/qubes-vmm-xen/blob/7c9e9e312948c772d9a68090109964121c1d16fe/0001-DEBUG-S3.patch

Hello,

Can you test if the patch below in isolation makes any difference?

Thanks, Roger.
---
diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 2ac162c997fe..27d672ad5dbb 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -19,6 +19,7 @@
 #include <xen/iommu.h>
 #include <xen/param.h>
 #include <xen/sched.h>
+#include <xen/softirq.h>
 #include <xen/spinlock.h>
 #include <xen/watchdog.h>
 
@@ -310,6 +311,7 @@ static int enter_state(u32 state)
     thaw_domains();
     system_state = SYS_STATE_active;
     spin_unlock(&pm_lock);
+    raise_softirq(TIMER_SOFTIRQ);
     return error;
 }
 
diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 0fd8bdba7067..9d66db861b74 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -65,7 +65,6 @@ static struct {
     unsigned int apic_lvt0;
     unsigned int apic_lvt1;
     unsigned int apic_lvterr;
-    unsigned int apic_tmict;
     unsigned int apic_tdcr;
     unsigned int apic_thmr;
 } apic_pm_state;
@@ -658,7 +657,6 @@ int lapic_suspend(void)
     apic_pm_state.apic_lvt0 = apic_read(APIC_LVT0);
     apic_pm_state.apic_lvt1 = apic_read(APIC_LVT1);
     apic_pm_state.apic_lvterr = apic_read(APIC_LVTERR);
-    apic_pm_state.apic_tmict = apic_read(APIC_TMICT);
     apic_pm_state.apic_tdcr = apic_read(APIC_TDCR);
     if (maxlvt >= 5)
         apic_pm_state.apic_thmr = apic_read(APIC_LVTTHMR);
@@ -718,7 +716,7 @@ int lapic_resume(void)
         apic_write(APIC_LVTPC, apic_pm_state.apic_lvtpc);
     apic_write(APIC_LVTT, apic_pm_state.apic_lvtt);
     apic_write(APIC_TDCR, apic_pm_state.apic_tdcr);
-    apic_write(APIC_TMICT, apic_pm_state.apic_tmict);
+    apic_write(APIC_TMICT, 0);
     apic_write(APIC_ESR, 0);
     apic_read(APIC_ESR);
     apic_write(APIC_LVTERR, apic_pm_state.apic_lvterr);


