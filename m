Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6451D2C13
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 12:02:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZAgg-0000Rl-OL; Thu, 14 May 2020 10:01:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=otfA=64=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZAgf-0000Rc-8V
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 10:01:57 +0000
X-Inumbo-ID: f123cce6-95c9-11ea-a464-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f123cce6-95c9-11ea-a464-12813bfff9fa;
 Thu, 14 May 2020 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589450516;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=htGQpczr7kVz+Vy1EktgZWFDxdY3YxljwCelp6QqO0Q=;
 b=InO/hM6tapFN97H3RXJPZ03Q/G80yuD9/Pwpyx/ZHdI0hFxgxR+FydpQ
 C5kxXIDZqlFri9sDM6xftRj/p8pil59Fub9TcdK4F0Sw2ZU4ZpJjS/lhr
 RMo57gJ2MVfD6mlqxZ6ZKAtqycMOIm4N23w0dVZ3Z4IVlw0974wyVDc4u Q=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: qFo1ZqjK9iKSIq17MsRtARt+8wMsOg/uEGgrqSE9NvpFS6oaJMiQtxsMmPlXJM79XobrwJclDt
 Q/l06SJ/0flY+h0WWlzqPSgXadF8rnHj5LR+hCADMHmaZtAoaN+i4xwmLMJO429zx43VJqY7PO
 2c1vl5Lov3AF+qHAI44EIG/pbaMGvjhPAfOvJKvB0VWIk+FyWR0UqIJxjvqeImOy+utUj7rBPC
 9n6OC0a5GPsSTsOzbznHx84DB/qxqIXvHdM9CvJGRm2ZKw2IKm6jc9aXlap6iuyX/CJeTKNw4w
 dYM=
X-SBRS: 2.7
X-MesageID: 17529291
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,390,1583211600"; d="scan'208";a="17529291"
Date: Thu, 14 May 2020 12:01:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 4/4] x86/APIC: restrict certain messages to BSP
Message-ID: <20200514100145.GA54375@Air-de-Roger>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
 <513e4f93-a8a0-ae72-abcc-aa28531eca97@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <513e4f93-a8a0-ae72-abcc-aa28531eca97@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Mar 13, 2020 at 10:26:47AM +0100, Jan Beulich wrote:
> All CPUs get an equal setting of EOI broadcast suppression; no need to
> log one message per CPU, even if it's only in verbose APIC mode.
> 
> Only the BSP is eligible to possibly get ExtINT enabled; no need to log
> that it gets disabled on all APs, even if - again - it's only in verbose
> APIC mode.
> 
> Take the opportunity and introduce a "bsp" parameter to the function, to
> stop using smp_processor_id() to tell BSP from APs.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

LGTM:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

AFAICT this doesn't introduce any functional change in APIC setup or
behavior, the only functional change is the log message reduction.
Might be good to add a note to that effect to make this clear, since
the change from smp_processor_id() -> bsp might make this not obvious.

> 
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -499,7 +499,7 @@ static void resume_x2apic(void)
>      __enable_x2apic();
>  }
>  
> -void setup_local_APIC(void)
> +void setup_local_APIC(bool bsp)
>  {
>      unsigned long oldvalue, value, maxlvt;
>      int i, j;
> @@ -598,8 +598,8 @@ void setup_local_APIC(void)
>      if ( directed_eoi_enabled )
>      {
>          value |= APIC_SPIV_DIRECTED_EOI;
> -        apic_printk(APIC_VERBOSE, "Suppress EOI broadcast on CPU#%d\n",
> -                    smp_processor_id());
> +        if ( bsp )
> +            apic_printk(APIC_VERBOSE, "Suppressing EOI broadcast\n");
>      }
>  
>      apic_write(APIC_SPIV, value);
> @@ -615,21 +615,22 @@ void setup_local_APIC(void)
>       * TODO: set up through-local-APIC from through-I/O-APIC? --macro
>       */
>      value = apic_read(APIC_LVT0) & APIC_LVT_MASKED;
> -    if (!smp_processor_id() && (pic_mode || !value)) {
> +    if (bsp && (pic_mode || !value)) {
>          value = APIC_DM_EXTINT;
>          apic_printk(APIC_VERBOSE, "enabled ExtINT on CPU#%d\n",
>                      smp_processor_id());
>      } else {
>          value = APIC_DM_EXTINT | APIC_LVT_MASKED;
> -        apic_printk(APIC_VERBOSE, "masked ExtINT on CPU#%d\n",
> -                    smp_processor_id());
> +        if (bsp)
> +            apic_printk(APIC_VERBOSE, "masked ExtINT on CPU#%d\n",
> +                        smp_processor_id());

You might want to also drop the CPU#%d from the above messages, since
they would only be printed for the BSP.

>      }
>      apic_write(APIC_LVT0, value);
>  
>      /*
>       * only the BP should see the LINT1 NMI signal, obviously.
>       */
> -    if (!smp_processor_id())
> +    if (bsp)
>          value = APIC_DM_NMI;
>      else
>          value = APIC_DM_NMI | APIC_LVT_MASKED;

This would be shorter as:

value = APIC_DM_NMI | (bsp ? 0 : APIC_LVT_MASKED);

Not specially trilled anyway.

Thanks, Roger.

