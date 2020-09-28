Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4923427AE80
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:59:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsjy-00028A-Dx; Mon, 28 Sep 2020 12:58:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPfX=DF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kMsjw-000281-HE
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:58:48 +0000
X-Inumbo-ID: 98bd8f14-0320-4359-a6db-7abf3583d60d
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98bd8f14-0320-4359-a6db-7abf3583d60d;
 Mon, 28 Sep 2020 12:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601297927;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=CSQQt2W7geUDjIAtTZthgV3Kmtllpk+tjgsXcq1wbaA=;
 b=H/b/1kN1b3xfWzgHjMtbJjpa+bg2VCjIknLvKX9a4RJVZQBQCkyqzvbL
 SEqDCNHWF0/OGWF7omE4lNbT7IOu5SbSutnCOYwIyFj0fdq+/uJVfG/j+
 7KMEn1b1Bxo1h23p0xJKrIO6FAVP2N+71cNximzmxRoKmuNnAhZx6yIAF 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: odH9elqLJTQX+mCXMUfImjkEOOWFRH2Ch5apWAVzhoWkItW20MGkTT7AY1yZv6h1phiVw5TahB
 GL307L3FAiEZwATYK7MFCvBoHT9lQpBTAivbRKzE+/cz0ylsnoGmwI4QubOvUiPso8TIIb8V6Y
 auf6KtWvilTH7zdyVB9CXG/f6LwzHwJKydAGlOR2l0KqPs39F0BQgwNryzBKnan7ii/crmpU+F
 G232in4JUqpHk/7jDllmUf/Y6Q1U3L23CgTyExCN2ja+n0JV/xntN+YrijZ8uOrLJCPWJc/WRk
 rmQ=
X-SBRS: None
X-MesageID: 28085932
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,313,1596513600"; d="scan'208";a="28085932"
Subject: Re: [PATCH 3/5] x86/ELF: don't store function pointer in
 elf_core_save_regs()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
 <8abe7016-1cd7-246e-24ef-92d92ff27ad3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <33b47445-8de4-24f0-69b0-74119f10d7e9@citrix.com>
Date: Mon, 28 Sep 2020 13:58:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8abe7016-1cd7-246e-24ef-92d92ff27ad3@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/09/2020 13:06, Jan Beulich wrote:
> This keeps at least gcc 10 from generating a separate function instance
> in common/kexec.o alongside the inlining of the function in its sole
> caller. I also think putting the address of the actual code storing the
> registers is a better indication to consumers than that of an otherwise
> unreferenced function.

Hmm - that's unfortunate.

elf_core_save_regs is certainly a useful name to spot in a backtrace.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/include/asm-x86/x86_64/elf.h
> +++ b/xen/include/asm-x86/x86_64/elf.h
> @@ -54,7 +54,7 @@ static inline void elf_core_save_regs(EL
>      asm volatile("movq %%rsi,%0" : "=m"(core_regs->rsi));
>      asm volatile("movq %%rdi,%0" : "=m"(core_regs->rdi));
>      /* orig_rax not filled in for now */
> -    core_regs->rip = (unsigned long)elf_core_save_regs;
> +    asm volatile("call 0f; 0: popq %0" : "=m" (core_regs->rip));

lea 0(%rip) will be faster to execute, and this is 64bit code specifically.

Either way, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

>      core_regs->cs = read_sreg(cs);
>      asm volatile("pushfq; popq %0" :"=m"(core_regs->rflags));
>      asm volatile("movq %%rsp,%0" : "=m"(core_regs->rsp));
>


