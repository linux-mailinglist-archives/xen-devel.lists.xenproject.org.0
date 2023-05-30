Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38061716B2A
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 19:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541326.843983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q43CN-0001tf-Rh; Tue, 30 May 2023 17:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541326.843983; Tue, 30 May 2023 17:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q43CN-0001rQ-OK; Tue, 30 May 2023 17:31:55 +0000
Received: by outflank-mailman (input) for mailman id 541326;
 Tue, 30 May 2023 17:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZuJ=BT=flex--seanjc.bounces.google.com=3BzN2ZAYKCXAgSObXQUccUZS.QcalSb-RSjSZZWghg.lSbdfcXSQh.cfU@srs-se1.protection.inumbo.net>)
 id 1q43CM-0001Na-6K
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 17:31:54 +0000
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [2607:f8b0:4864:20::54a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd93b758-ff0f-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 19:31:53 +0200 (CEST)
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-53445255181so2605152a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 10:31:53 -0700 (PDT)
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
X-Inumbo-ID: dd93b758-ff0f-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685467912; x=1688059912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5dIo9ozu/tftAp1UmpoAUrczqs99lWKXi5qA1UpHNYE=;
        b=fcMt7E9oftWvnXylT0q0LSi2ovxYU6GROaZO/YpP+hWVROA5CGkN858ssUM/OEUsq+
         cy2yKP5XxthrBWOhhRWmnMfaInbcFln+rmGuOYxtdLasZqdrf9i2ZKdgt/TEdCrBBjG7
         ZT9ootqRsxe/NChBz/85WsRSsuU1KSVsGHKC2qIH/mmVq1mmccPpcHFqUeIQGRkih0S3
         aGvDJJEkz3g8ZQ99QNMUDAP/dYZioxFkRygbUSwiPYm9+GJu5Jyv2dh2A01JO3qxQH41
         6ykaek6RLxvtQMhW8/hOelD76pSAAtY75YP51exJDFZC+VMuMAXLJkFisg7dDXEPnO0i
         fv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467912; x=1688059912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dIo9ozu/tftAp1UmpoAUrczqs99lWKXi5qA1UpHNYE=;
        b=GqQeARTJAIy0OCMnou0Vt/JPinTj7KJPa3u3g5owP1aXSvRugCBWy5UT3TO7eFis/I
         4i0DflcahSN1fWJpq30oLlezVcCKXOwb7P062DaI5um3qhTjoFgt1C7yWz1vu09FDXLe
         juRMvfEQJZ8HcTYO+3O9aXBhgdx64aLoFGTTuwlfKH4z1RKcYtiEbe6P5Td6jEvpycll
         +KkstALS2X4ixpj2bkKtNDZe1jtyPJ9K7XSg3MjF3KaQ0uWRYu8z6x8vgpF7OJuYm+kP
         uZiTvnwRlu8XZqJwjbw4swHjRinRZxs01dJLGS7CIdRatbD3FmIAcGFayILvyejVMcYW
         gucA==
X-Gm-Message-State: AC+VfDxU5zZhESBcIm0mGUnobpSyxLNVlTBPhKqKvuQRx8bZH/4xyRti
	uQgzWBxtKo9mj3aZwVQc9mWb30Hllq0=
X-Google-Smtp-Source: ACHHUZ5mA8belaIiWlXNNvjxlntxz+3HEXuwwih113OoUIVv+U+qOnHhtSEzZI4lNu6RqPJOqokzHLfKYhE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:510:0:b0:52c:9996:c1f8 with SMTP id
 16-20020a630510000000b0052c9996c1f8mr555070pgf.10.1685467911952; Tue, 30 May
 2023 10:31:51 -0700 (PDT)
Date: Tue, 30 May 2023 10:31:50 -0700
In-Reply-To: <20230530170210.ujkv737uyjfvdoay@box.shutemov.name>
Mime-Version: 1.0
References: <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name> <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx> <87cz2ija1e.ffs@tglx> <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name>
 <87wn0pizbl.ffs@tglx> <20230530170210.ujkv737uyjfvdoay@box.shutemov.name>
Message-ID: <ZHYzBrLfT6DIKBw4@google.com>
Subject: Re: [patch] x86/smpboot: Disable parallel bootup if cc_vendor != NONE
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Brian Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, 
	Oleksandr Natalenko <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, 
	Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	linux-csky@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	linux-parisc@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>, 
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, May 30, 2023, Kirill A. Shutemov wrote:
> On Tue, May 30, 2023 at 06:00:46PM +0200, Thomas Gleixner wrote:
> > On Tue, May 30 2023 at 15:29, Kirill A. Shutemov wrote:
> > > On Tue, May 30, 2023 at 02:09:17PM +0200, Thomas Gleixner wrote:
> > >> The decision to allow parallel bringup of secondary CPUs checks
> > >> CC_ATTR_GUEST_STATE_ENCRYPT to detect encrypted guests. Those cannot use
> > >> parallel bootup because accessing the local APIC is intercepted and raises
> > >> a #VC or #VE, which cannot be handled at that point.
> > >> 
> > >> The check works correctly, but only for AMD encrypted guests. TDX does not
> > >> set that flag.
> > >> 
> > >> Check for cc_vendor != CC_VENDOR_NONE instead. That might be overbroad, but
> > >> definitely works for both AMD and Intel.
> > >
> > > It boots fine with TDX, but I think it is wrong. cc_get_vendor() will
> > > report CC_VENDOR_AMD even on bare metal if SME is enabled. I don't think
> > > we want it.
> > 
> > Right. Did not think about that.
> > 
> > But the same way is CC_ATTR_GUEST_MEM_ENCRYPT overbroad for AMD. Only
> > SEV-ES traps RDMSR if I'm understandig that maze correctly.
> 
> I don't know difference between SEV flavours that well.
> 
> I see there's that on SEV-SNP access to x2APIC MSR range (MSR 0x800-0x8FF)
> is intercepted regardless if MSR_AMD64_SNP_ALT_INJ feature is present. But
> I'm not sure what the state on SEV or SEV-ES.

With SEV-ES, if the hypervisor intercepts an MSR access, the VM-Exit is instead
morphed to a #VC (except for EFER).  The guest needs to do an explicit VMGEXIT
(i.e. a hypercall) to explicitly request MSR emulation (this *can* be done in the
#VC handler, but the guest can also do VMGEXIT directly, e.g. in lieu of a RDMSR).

With regular SEV, VM-Exits aren't reflected into the guest.  Register state isn't
encrypted so the hypervisor can emulate MSR accesses (and other instructions)
without needing an explicit hypercall from the guest.

