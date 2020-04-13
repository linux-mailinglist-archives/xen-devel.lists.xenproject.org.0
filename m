Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 454EC1A6B97
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2020 19:42:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jO35X-0002Le-U3; Mon, 13 Apr 2020 17:41:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=geSq=55=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1jO35W-0002LZ-UX
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2020 17:41:38 +0000
X-Inumbo-ID: 0610868d-7dae-11ea-8886-12813bfff9fa
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0610868d-7dae-11ea-8886-12813bfff9fa;
 Mon, 13 Apr 2020 17:41:37 +0000 (UTC)
Received: from zn.tnic (p200300EC2F06C90094DE0BDBF95A27C8.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f06:c900:94de:bdb:f95a:27c8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 111041EC0A02;
 Mon, 13 Apr 2020 19:41:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1586799696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gc71y0cM8+tCsVwGa6HMo9kNdRtGev9oBI43iMJtcF8=;
 b=QlfEDmYJMey1yNVo645/4JcSkWdZcGpFSZ9EqumxKdxRVN3ySYXLtmr4pm7D5WU3Uvb0e+
 9fuaFwAaWbly5fAj5YWAl74qHDx51jn5MrfYhaTQOcWvjwCfRLPGgFB89kbxynd+RN4czu
 0SJLDsmAS77rKFsro5fk3uViVVABcRM=
Date: Mon, 13 Apr 2020 19:41:30 +0200
From: Borislav Petkov <bp@alien8.de>
To: boris.ostrovsky@oracle.com, jgross@suse.com
Subject: Re: [PATCH v2] xen x86: fix early boot crash with gcc-10
Message-ID: <20200413174130.GE3772@zn.tnic>
References: <20200413142051.GC3772@zn.tnic>
 <20200413150314.13974-1-frederic.pierret@qubes-os.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200413150314.13974-1-frederic.pierret@qubes-os.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, hpa@zytor.com,
 =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, tglx@linutronix.de
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 13, 2020 at 05:03:14PM +0200, Frédéric Pierret (fepitre) wrote:
> The change fixes boot failure on VM where kernel (at least v5.4 and v5.6)
> is built with gcc-10 and STACKPROTECTOR_STRONG enabled:
> 
> ```
> Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: cpu_bringup_and_idle+0x93/0xa0
> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.4.31-1.qubes.x86_64 #1
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.12.0-1 04/01/2014
> Call Trace:
>   dump_stack+0x64/0x88
>    panic+0x10b/0x2ed
>    ? cpu_bringup_and_idle+0x93/0xa0
>    __stack_chk_fail+0x15/0x20
>    cpu_bringup_and_idle+0x93/0xa
> ```
> The change makes successfully booting the VM. The VM is hosted by
> KVM hypervisor and is running Xen into.
> 
> Based on work done by Sergei Trofimovich: https://lkml.org/lkml/2020/3/26/1133
> 
> Signed-off-by: Frédéric Pierret (fepitre) <frederic.pierret@qubes-os.org>
> ---
>  arch/x86/xen/smp_pv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
> index 8fb8a50a28b4..5c8ee4a5bb0c 100644
> --- a/arch/x86/xen/smp_pv.c
> +++ b/arch/x86/xen/smp_pv.c
> @@ -88,7 +88,7 @@ static void cpu_bringup(void)
>  	local_irq_enable();
>  }
>  
> -asmlinkage __visible void cpu_bringup_and_idle(void)
> +asmlinkage __visible void __no_stack_protector cpu_bringup_and_idle(void)
>  {
>  	cpu_bringup();
>  	boot_init_stack_canary();
> -- 

Boris O, Jürgen,

you guys might wanna wait a bit with this one:

https://lkml.kernel.org/r/20200413163540.GD3772@zn.tnic

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

