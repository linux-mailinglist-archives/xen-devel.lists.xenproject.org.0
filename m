Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC9D27B09A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 17:16:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMusb-0007Lk-DB; Mon, 28 Sep 2020 15:15:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPfX=DF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kMusZ-0007Lf-Eu
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 15:15:51 +0000
X-Inumbo-ID: ac5b9c48-288e-453f-b029-16090ef36315
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac5b9c48-288e-453f-b029-16090ef36315;
 Mon, 28 Sep 2020 15:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601306150;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9Q1dmAVFDlRUEG5coF9y+C2hyJhPQoBQMoivYO7Cl5s=;
 b=Xp2ZDZpM8P5aA5zjQUKMYYgQCT+nU6HDCjfWf2BnoHxm9xPHkZI3nmnD
 XKL82MPrs1l/7SCA9mvVVt84xRKAhoWkAIjyqsOEZESNls5cjalPs/maH
 cn036IjXibxqZBYPultKjGbfUiTeHSDQxmfm3B00QWJw86mNafOa7NOo6 w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: UZrY48eB6cX+PFKC6qxivUrBBoQYzzgt40gdxNl2VNm66FCXl7afBEFlDs64crpvd0ZzDDTF0V
 oIJJ6ig8gvYIYK8M7FGOiKDQ5ERq2qNZUg7NP+e4UEaT9SXdgTZKC6XkZdpG745aXQGq4ui0Eq
 7OZuLzLS0xtnEKQfOcVNiQdWAd9muqWlC/ik5ir473A2KCqVVMRi2f5v0aOTMQELQ1ezlfO096
 /rUm5dMO9IWXCF8qgmfmvH+YJwcYpgZjDZwu49wpD9O1JOT/jhj9C24IJpuMZir+7U0hww3SK5
 bCU=
X-SBRS: None
X-MesageID: 28772009
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,313,1596513600"; d="scan'208";a="28772009"
Subject: Re: [PATCH 6/5] x86/ELF: drop unnecessary volatile from asm()-s in
 elf_core_save_regs()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
 <06b8dedb-49d9-eeb6-d56a-c7852486d22e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d8d88d50-13a3-b415-2cfa-3064fbf4c5bd@citrix.com>
Date: Mon, 28 Sep 2020 16:15:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <06b8dedb-49d9-eeb6-d56a-c7852486d22e@suse.com>
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

On 28/09/2020 16:04, Jan Beulich wrote:
> There are no hidden side effects here.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.
>
> --- a/xen/include/asm-x86/x86_64/elf.h
> +++ b/xen/include/asm-x86/x86_64/elf.h
> @@ -37,26 +37,26 @@ typedef struct {
>  static inline void elf_core_save_regs(ELF_Gregset *core_regs, 
>                                        crash_xen_core_t *xen_core_regs)
>  {
> -    asm volatile("movq %%r15,%0" : "=m"(core_regs->r15));
> -    asm volatile("movq %%r14,%0" : "=m"(core_regs->r14));
> -    asm volatile("movq %%r13,%0" : "=m"(core_regs->r13));
> -    asm volatile("movq %%r12,%0" : "=m"(core_regs->r12));
> -    asm volatile("movq %%rbp,%0" : "=m"(core_regs->rbp));
> -    asm volatile("movq %%rbx,%0" : "=m"(core_regs->rbx));
> -    asm volatile("movq %%r11,%0" : "=m"(core_regs->r11));
> -    asm volatile("movq %%r10,%0" : "=m"(core_regs->r10));
> -    asm volatile("movq %%r9,%0" : "=m"(core_regs->r9));
> -    asm volatile("movq %%r8,%0" : "=m"(core_regs->r8));
> -    asm volatile("movq %%rax,%0" : "=m"(core_regs->rax));
> -    asm volatile("movq %%rcx,%0" : "=m"(core_regs->rcx));
> -    asm volatile("movq %%rdx,%0" : "=m"(core_regs->rdx));
> -    asm volatile("movq %%rsi,%0" : "=m"(core_regs->rsi));
> -    asm volatile("movq %%rdi,%0" : "=m"(core_regs->rdi));
> +    asm ( "movq %%r15,%0" : "=m" (core_regs->r15) );
> +    asm ( "movq %%r14,%0" : "=m" (core_regs->r14) );
> +    asm ( "movq %%r13,%0" : "=m" (core_regs->r13) );
> +    asm ( "movq %%r12,%0" : "=m" (core_regs->r12) );
> +    asm ( "movq %%rbp,%0" : "=m" (core_regs->rbp) );
> +    asm ( "movq %%rbx,%0" : "=m" (core_regs->rbx) );
> +    asm ( "movq %%r11,%0" : "=m" (core_regs->r11) );
> +    asm ( "movq %%r10,%0" : "=m" (core_regs->r10) );
> +    asm ( "movq %%r9,%0" : "=m" (core_regs->r9) );
> +    asm ( "movq %%r8,%0" : "=m" (core_regs->r8) );

Any chance we can align these seeing as they're changing?

What about spaces before %0 ?

Either way, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> +    asm ( "movq %%rax,%0" : "=m" (core_regs->rax) );
> +    asm ( "movq %%rcx,%0" : "=m" (core_regs->rcx) );
> +    asm ( "movq %%rdx,%0" : "=m" (core_regs->rdx) );
> +    asm ( "movq %%rsi,%0" : "=m" (core_regs->rsi) );
> +    asm ( "movq %%rdi,%0" : "=m" (core_regs->rdi) );
>      /* orig_rax not filled in for now */
>      asm ( "call 0f; 0: popq %0" : "=m" (core_regs->rip) );
>      core_regs->cs = read_sreg(cs);
> -    asm volatile("pushfq; popq %0" :"=m"(core_regs->rflags));
> -    asm volatile("movq %%rsp,%0" : "=m"(core_regs->rsp));
> +    asm ( "pushfq; popq %0" : "=m" (core_regs->rflags) );
> +    asm ( "movq %%rsp,%0" : "=m" (core_regs->rsp) );
>      core_regs->ss = read_sreg(ss);
>      rdmsrl(MSR_FS_BASE, core_regs->thread_fs);
>      rdmsrl(MSR_GS_BASE, core_regs->thread_gs);
>


