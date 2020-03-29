Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E821B196DF2
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 16:39:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIZ1v-0008Dc-Fe; Sun, 29 Mar 2020 14:35:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jlgP=5O=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jIZ1u-0008DX-6S
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 14:35:14 +0000
X-Inumbo-ID: 8041aa5c-71ca-11ea-92cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8041aa5c-71ca-11ea-92cf-bc764e2007e4;
 Sun, 29 Mar 2020 14:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=8A1G4JkUryr+RpJkNUDock9XYRQoW6PHovj7V5a6tks=; b=mBL6WAlNIW3EyoomSi2hfttwpO
 FSPqiHrDLRuDubeBoYEZJpJ/gR7ETJ2PWTMEBsgSmBiO2cQUxa7PZo4wse5WFsnIBtr1sx2au5COh
 mMjYaASpvKVrE/SSOc7f56Db3sHqzUSVxGgYy3Ebr1NAApDBFdQ5TpWQgAcgWbafrxeI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIZ1t-0004ky-54; Sun, 29 Mar 2020 14:35:13 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIZ1s-0003pc-Rk; Sun, 29 Mar 2020 14:35:13 +0000
Date: Sun, 29 Mar 2020 15:35:10 +0100
From: Wei Liu <wl@xen.org>
To: Julien Grall <julien@xen.org>
Message-ID: <20200329143510.mn7esll6nzzxwmqo@debian>
References: <20200327190546.21580-1-julien@xen.org>
 <20200327190546.21580-4-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327190546.21580-4-julien@xen.org>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 3/3] xen/x86: ioapic: Simplify ioapic_init()
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Mar 27, 2020 at 07:05:46PM +0000, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit 9facd54a45 "x86/ioapic: Add register level checks to detect
> bogus io-apic entries", Xen is able to cope with IO APICs not mapped in
> the fixmap.
> 
> Therefore the whole logic to allocate a fake page for some IO APICs is
> unnecessary.
> 
> With the logic removed, the code can be simplified a lot as we don't
> need to go through all the IO APIC if SMP has not been detected or a
> bogus zero IO-APIC address has been detected.
> 
> To avoid another level of tabulation, the simplification is now moved in
> its own function.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/x86/io_apic.c | 63 ++++++++++++++++++++----------------------
>  1 file changed, 30 insertions(+), 33 deletions(-)
> 
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index 9a11ee8342..3d52e4daf1 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -2537,34 +2537,25 @@ static __init bool bad_ioapic_register(unsigned int idx)
>      return false;
>  }
>  
> -void __init init_ioapic(void)
> +static void __init init_ioapic_mappings(void)
>  {
> -    unsigned long ioapic_phys;
>      unsigned int i, idx = FIX_IO_APIC_BASE_0;
> -    union IO_APIC_reg_01 reg_01;
>  
> -    if ( smp_found_config )
> -        nr_irqs_gsi = 0;
>      for ( i = 0; i < nr_ioapics; i++ )
>      {
> -        if ( smp_found_config )
> -        {
> -            ioapic_phys = mp_ioapics[i].mpc_apicaddr;
> -            if ( !ioapic_phys )
> -            {
> -                printk(KERN_ERR "WARNING: bogus zero IO-APIC address "
> -                       "found in MPTABLE, disabling IO/APIC support!\n");
> -                smp_found_config = false;
> -                skip_ioapic_setup = true;
> -                goto fake_ioapic_page;
> -            }
> -        }
> -        else
> +        union IO_APIC_reg_01 reg_01;
> +        unsigned long ioapic_phys = mp_ioapics[i].mpc_apicaddr;
> +
> +        ioapic_phys = mp_ioapics[i].mpc_apicaddr;

ioapic_phys is set a second time here. See the line before.

Wei.

