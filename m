Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5047E6E97B4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 16:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524308.815151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppVdc-0000RP-2m; Thu, 20 Apr 2023 14:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524308.815151; Thu, 20 Apr 2023 14:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppVdb-0000OU-W0; Thu, 20 Apr 2023 14:51:55 +0000
Received: by outflank-mailman (input) for mailman id 524308;
 Thu, 20 Apr 2023 14:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ZnX=AL=flex--seanjc.bounces.google.com=3h1FBZAYKCVgI40D926EE6B4.2ECN4D-34L4BB8IJI.N4DFHE942J.EH6@srs-se1.protection.inumbo.net>)
 id 1ppVda-0000OM-QU
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 14:51:54 +0000
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [2607:f8b0:4864:20::64a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2b0ab03-df8a-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 16:51:53 +0200 (CEST)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-1a6820f90c6so7694265ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Apr 2023 07:51:52 -0700 (PDT)
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
X-Inumbo-ID: e2b0ab03-df8a-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682002311; x=1684594311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cenhvMgRBJVEyO+DQ1Yk7EeAnoD+Mx3QDGrPvs6dp/U=;
        b=ozdQf66WPw8ShRBluz+LMQljss+d3T0PBYjA3jmNDdv//pVrmGXx6L9uusb7fIhJSL
         LymgWp9X3FbkLAAxceftLeQZn0/6M8JdZmIbsV9oONQVhJAe+e9OODUteXA7bMLvWkmz
         5ayRkEY6NENxUYGlnGZFkZBlmyRHMXNIOgoLHCbFX3aaDwjuintlWNx5LkJKfs2Sd6PE
         Ya8JLH6D3Xz61J6mffVksjDGSWXvO9yhMWIRSY/rzCnaTg7svns1MKliwXodcMA+7eb1
         u30LO7+8+pIMTa1eXTgGdK8wfjlZ/7y7DufflgYGy0ae6b3znNofgHpeyL7dnXNOKs4z
         yrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682002311; x=1684594311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cenhvMgRBJVEyO+DQ1Yk7EeAnoD+Mx3QDGrPvs6dp/U=;
        b=UVOG4CH6ABhPrsR2y8WPnuayPtk1Phdb8xUHkHDUxX2/+ZSOSQ7PdYqvkNc6PEHRw8
         9dMKdpynCSi305o4/TYRlmE4pVACXRLSDOwkcY3su4Ynjxck50fsWQlvnDsPnY8rmRoL
         dGV2ClksgmTt2L2bIX3ybVHeF37GZhXE3HhtD1n82n6otxiHqgL2/CbJ+ByHyOSS1MyG
         p2ChW37gytCjsyRHxYDF1qt0gCVngZ/rPxuleqXyDYDoaoMTZEbgfpCCeKv+qPiCcbx2
         7wpo9DuVallieJM+/q04zSTbOVjZbCdg6Sq7kaPG282IMOoW+te4FRsh3IJVlQkDFKtb
         kZng==
X-Gm-Message-State: AAQBX9fC9Ryt0tx8KqzUUV/naU5ogVbO7fa783IhZJQKZB2Ih87o6+8z
	9etqrEKpKiZOB7GGmmnN95ksGOSeny0=
X-Google-Smtp-Source: AKy350YZDYx9Ka0U+LJTenQgM1KG3UW2Yutu07LdZ7q6GZTzBdJRqMrlgBJSIie+uzUyI4FO9iSrYEblhR4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f807:b0:1a6:3a2e:b731 with SMTP id
 ix7-20020a170902f80700b001a63a2eb731mr623230plb.1.1682002311424; Thu, 20 Apr
 2023 07:51:51 -0700 (PDT)
Date: Thu, 20 Apr 2023 07:51:49 -0700
In-Reply-To: <87y1mm3iqz.ffs@tglx>
Mime-Version: 1.0
References: <87r0sh4m7a.ffs@tglx> <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
 <87a5z443g2.ffs@tglx> <877cu83v45.ffs@tglx> <874jpc3s3r.ffs@tglx>
 <0f5463fd-9c4a-6361-adbb-dd89dbb9138d@citrix.com> <c2aaa4fb-a5ba-d5bf-634a-dcf4fd8ad246@citrix.com>
 <871qkf3qek.ffs@tglx> <26d385da-2ede-5d73-2959-84c8f7d89e03@citrix.com> <87y1mm3iqz.ffs@tglx>
Message-ID: <ZEFRhXua6Jxvit1R@google.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Arjan van de Veen <arjan@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul McKenney <paulmck@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Oleksandr Natalenko <oleksandr@natalenko.name>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	Piotr Gorski <lucjan.lucjanov@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Usama Arif <usama.arif@bytedance.com>, 
	"=?iso-8859-1?Q?J=FCrgen_Gro=DF?=" <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	linux-csky@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, 
	"James E. J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	linux-parisc@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Apr 20, 2023, Thomas Gleixner wrote:
> On Thu, Apr 20 2023 at 10:23, Andrew Cooper wrote:
> > On 20/04/2023 9:32 am, Thomas Gleixner wrote:
> > > On Wed, Apr 19, 2023, Andrew Cooper wrote:
> > > > This was changed in x2APIC, which made the x2APIC_ID immutable.
>
> >> I'm pondering to simply deny parallel mode if x2APIC is not there.
> >
> > I'm not sure if that will help much.
> 
> Spoilsport.

LOL, well let me pile on then.  x2APIC IDs aren't immutable on AMD hardware.  The
ID is read-only when the CPU is in x2APIC mode, but any changes made to the ID
while the CPU is in xAPIC mode survive the transition to x2APIC.  From the APM:

  A value previously written by software to the 8-bit APIC_ID register (MMIO offset
  30h) is converted by hardware into the appropriate format and reflected into the
  32-bit x2APIC_ID register (MSR 802h).

FWIW, my observations from testing on bare metal are that the xAPIC ID is effectively
read-only (writes are dropped) on Intel CPUs as far back as Haswell, while the above
behavior described in the APM holds true on at least Rome and Milan.

My guess is that Intel's uArch specific behavior of the xAPIC ID being read-only
was introduced when x2APIC came along, but I didn't test farther back than Haswell.

