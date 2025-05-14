Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E2AB669C
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 10:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984095.1370261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF7tY-0007kP-A5; Wed, 14 May 2025 08:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984095.1370261; Wed, 14 May 2025 08:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF7tY-0007i7-7N; Wed, 14 May 2025 08:55:20 +0000
Received: by outflank-mailman (input) for mailman id 984095;
 Wed, 14 May 2025 08:55:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Q1L=X6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uF7tX-0007i1-5q
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 08:55:19 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28239835-30a1-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 10:55:17 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ad238c68b35so827603466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 01:55:17 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad24085b44fsm649720766b.149.2025.05.14.01.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 01:55:16 -0700 (PDT)
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
X-Inumbo-ID: 28239835-30a1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747212916; x=1747817716; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1gkk0wjy3CX7r6hFn26WQaLAfJ0MqdkdVFt32jCHUD0=;
        b=YhuT2YrsU/vvjxGTgaIpOzWUX/02IOwCiQ+x1uJIFsfyINhcuGfAVuijMoBrGKjBGz
         X/WblRRzsz3i/OS88K9fmd7HBDb8Hqxa2cWe3DJxHhr6EgbASS/9LeylEh8mB5rlhyAY
         BIuJawU6c6aOS8b15gOVHJKI82dtaCEsNsEUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747212916; x=1747817716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1gkk0wjy3CX7r6hFn26WQaLAfJ0MqdkdVFt32jCHUD0=;
        b=e+ohWzpR16aR15s3rHGE3DAC6oZ9o3dIjt7kksks+l21M3vPP2pbpkfstuV+9N/OCX
         liWH1eII8aIFmBYlXWpTlt8jdjq6+O2Jo6v6zDJxnFiCd5vLuijP6WvyDkMwvTZGQ1Gv
         B0FJ7lK3rmOJVwIVGD6HS9eXK0F7cK8rte80Y58L2vRNg1xG2HFN/UDjRdb8l98dGCBH
         jRv1x1S8jZducJDli/GFx0GykmMMPf3a5nAU1XCr3ZUHSsvvHi1uoNdrv87mI47G9c9o
         tWV87IOWMl84A0XwuwN/V5W3zVsCCmyOnsDECkvSwKGWvbFn0CIjpqHV2oMoYETSdDfS
         Wl7A==
X-Forwarded-Encrypted: i=1; AJvYcCXu48TsUWXRD1KN+ZW7aB+WgTTnbkbie29xRWtihLe3vS6MkXDEQiF9Wg2Tp6/g5yZ1ckleVNymhEs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUzra/p0aqF7W1XELJwyDrVNW43pjlQGRdMDXthieB1ehTZ4kT
	gLSKC4F6W6tKgINwkrWOZymai7X8BDIKJBTbood9ZACcaU9Q/s28qXhb9IJiz5I=
X-Gm-Gg: ASbGncsKl7Q++WjJSki/o1kpFzpFv+D2qkG33V22mMB2p0g/rcLZLlTPHd2tTwp9GDD
	Y/JTN/vnYWXezMoBjrNSv4WxTVU3TYpAtvtEB6hdM2VdruWzkIU0+i+ZF7Vz45RW96w0ZBB2WwO
	aHF8c/kYt7TZcevlh6q8mqOtvO6RwvZyM3dgmfl/6b/2NNIDBtSoffRWQ+m4o1mctF2OgKP73PX
	J0OhMlO++Mhg/a0FblfhxK0Hrek1Hp1KXcJlrpdWI0qwf82UPDuet+fzrdPOdkOcmZtbHkq4eky
	pgR8V/ZlbJVEGa0q9gxktt1ksnS79peicYLA2/eO/WTKDEUGXQLX/05oeBwx0A==
X-Google-Smtp-Source: AGHT+IFUfCb1uSxL8jjqyrM6Qr8rR2Eeu0NbVFgp5i6RBkqRSCBZzSrjHkBo6Et1CgE8i/cGiqMQJg==
X-Received: by 2002:a17:907:7d90:b0:ad2:4a32:f173 with SMTP id a640c23a62f3a-ad4f717dc54mr251809566b.14.1747212916451;
        Wed, 14 May 2025 01:55:16 -0700 (PDT)
Date: Wed, 14 May 2025 10:55:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Assertion 'desc->arch.creator_domid == DOMID_INVALID' failed
Message-ID: <aCRac5s9PUlTGOd_@macbook.lan>
References: <aCObaP4xs158L5tV@mail-itl>
 <70e5eeee-f1fa-41b4-91eb-450edc0bcaca@suse.com>
 <aCRX899NrUI5OOJZ@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCRX899NrUI5OOJZ@mail-itl>

On Wed, May 14, 2025 at 10:44:34AM +0200, Marek Marczykowski-Górecki wrote:
> On Wed, May 14, 2025 at 09:09:08AM +0200, Jan Beulich wrote:
> > On 13.05.2025 21:20, Marek Marczykowski-Górecki wrote:
> > > Hi,
> > > 
> > > When debugging CI job on Linus' master branch, I added "console=vga vga=,keep" and got PV dom0 crash Xen with:
> > > 
> > > (XEN) [   40.870435] Assertion 'desc->arch.creator_domid == DOMID_INVALID' failed at arch/x86/irq.c:294
> > > (XEN) [   40.886925] ----[ Xen-4.21-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
> > > (XEN) [   40.903356] CPU:    10
> > > (XEN) [   40.919824] RIP:    e008:[<ffff82d04059d2ed>] create_irq+0x272/0x339
> > > (XEN) [   40.936267] RFLAGS: 0000000000010297   CONTEXT: hypervisor (d0v13)
> > > (XEN) [   40.952709] rax: 00000000fffffff4   rbx: ffff830498007c00   rcx: 0000000000001899
> > 
> > There looks to be a -ENOMEM in %rax, so ...
> > 
> > > (XEN) [   40.969147] rdx: ffff830498007c5e   rsi: 0000000000000002   rdi: ffff83049830e398
> > > (XEN) [   40.985892] rbp: ffff830498307d18   rsp: ffff830498307ce8   r8:  0000000000000000
> > > (XEN) [   41.003093] r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
> > > (XEN) [   41.020279] r12: 00000000fffffff4   r13: 000000000000007c   r14: ffffffffffffffff
> > > (XEN) [   41.037489] r15: 000000000000007c   cr0: 0000000080050033   cr4: 0000000000b526e0
> > > (XEN) [   41.054699] cr3: 0000000492c34000   cr2: ffff8881001603f0
> > > (XEN) [   41.071904] fsb: 0000000000000000   gsb: ffff8882365ac000   gss: 0000000000000000
> > > (XEN) [   41.089116] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> > > (XEN) [   41.106320] Xen code around <ffff82d04059d2ed> (create_irq+0x272/0x339):
> > > (XEN) [   41.123521]  3f d9 ff e9 cc fe ff ff <0f> 0b 48 8d 3d 5a a0 29 00 e8 f4 3d d9 ff c6 43
> > > (XEN) [   41.140739] Xen stack trace from rsp=ffff830498307ce8:
> > > (XEN) [   41.157931]    000000ff00000001 ffff830497faa000 ffff830498307e00 00000000ffffffff
> > > (XEN) [   41.175132]    0000000000010000 ffff830497faa160 ffff830498307d70 ffff82d0405a6f85
> > > (XEN) [   41.192351]    00000000000002a0 ffff830498307e24 0000000000000200 00000000ffffffff
> > > (XEN) [   41.209551]    ffff830497faa000 0000000000000000 ffff830497faa168 0000000000010000
> > > (XEN) [   41.226753]    ffff830497faa160 ffff830498307de0 ffff82d0405c9ea6 5f24a0ddbbeda194
> > > (XEN) [   41.244062]    ffff830498307e10 0000000000000000 0000000000000001 ffff830498307e00
> > > (XEN) [   41.261387]    ffff830498307e24 ffff830498307e20 ffff830497faa000 ffff830498307ef8
> > > (XEN) [   41.278730]    ffff830497faa000 ffff830497f5a000 ffffc9004002ba78 ffff830498307e68
> > > (XEN) [   41.296052]    ffff82d0405cbd4f ffff82d04053fc3e ffffc9004002ba78 00000000000000a0
> > > (XEN) [   41.313381]    00a0fb0000000001 0000000000000000 0000000000007ff0 ffffffffffffffff
> > > (XEN) [   41.330708]    000000a000000000 0000000000000000 0000000000000000 ffff830498307ef8
> > > (XEN) [   41.348026]    ffff830497f5a000 0000000000000021 0000000000000000 ffffc9004002ba78
> > > (XEN) [   41.365357]    ffff830498307ee8 ffff82d0405427db ffff8881d6961b40 0000000000000001
> > > (XEN) [   41.382680]    000000a000000000 000000000000000d 0000000000000000 ffff830498307ee8
> > > (XEN) [   41.400003]    ffff82d0405e7bc2 ffff830497f5a000 0000000000000000 ffff830497f5a000
> > > (XEN) [   41.417343]    0000000000000000 0000000000000000 ffff830498307fff 0000000000000000
> > > (XEN) [   41.434674]    00007cfb67cf80e7 ffff82d0402012d3 ffff8881d6961b40 ffff888100ef30c0
> > > (XEN) [   41.452010]    0000000000000001 0000000000000005 0000000000000000 ffff888100ef3000
> > > (XEN) [   41.469342]    0000000000000202 0000000000000001 0000000000007ff0 ffff8881d6961b40
> > > (XEN) [   41.486681]    0000000000000021 ffffffff8229d355 000000a000000000 ffffc9004002ba78
> > > (XEN) [   41.504015] Xen call trace:
> > > (XEN) [   41.521314]    [<ffff82d04059d2ed>] R create_irq+0x272/0x339
> > 
> > ... I'd expect the function calling init_one_irq_desc() to have caused this.
> > In which case, yes, the assertion is certainly valid to trigger (as it's
> > arch_init_one_irq_desc() which sets the field to the expected value, yet
> > that won't happen if one of the involved allocations fails). I'll make a
> > patch, but this raises the question of how you're running Xen, when
> > seemingly small allocations like the ones involved here end up failing.
> 
> That's weird, there should be plenty of memory. Xen is started with
> dom0_mem=4G and it's a 16GB system.

I wouldn't be surprised that you are impacted by:

https://lore.kernel.org/xen-devel/20250514080427.28129-1-roger.pau@citrix.com/

If the kernel is built without CONFIG_XEN_UNPOPULATED_ALLOC.  Sorry,
that was my fault.

Regards, Roger.

