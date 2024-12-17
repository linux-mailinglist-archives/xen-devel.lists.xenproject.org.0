Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6889F48A9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 11:14:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858720.1270960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNUaX-0001h6-MC; Tue, 17 Dec 2024 10:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858720.1270960; Tue, 17 Dec 2024 10:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNUaX-0001ep-IZ; Tue, 17 Dec 2024 10:14:01 +0000
Received: by outflank-mailman (input) for mailman id 858720;
 Tue, 17 Dec 2024 10:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DIsX=TK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tNUaW-0001ej-SK
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 10:14:00 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1484a17-bc5f-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 11:13:58 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385d7f19f20so2554426f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 02:13:58 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c7fac5bbsm11066562f8f.0.2024.12.17.02.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 02:13:57 -0800 (PST)
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
X-Inumbo-ID: a1484a17-bc5f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734430438; x=1735035238; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u8arajGDs6ktkoavY4rzlsf1c1cP5MJcU3EzxUXBa+U=;
        b=PUSuRzTq6G3vsPEVBOfsYLRKgH74gG90TUVYm/t7TI9TUt/UUW7MPlsTFuRh1oRLxQ
         x4d8eHBVNRhkuyK4wvg1Ss7dFTXJ4a9Q3bttErsfJc4OpQGH+uLEy4Xa15WEgzZN7Bsx
         3gc/jCbfrvZsG8gloTZNK3SavIZCSv/uFpnl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734430438; x=1735035238;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8arajGDs6ktkoavY4rzlsf1c1cP5MJcU3EzxUXBa+U=;
        b=miiswObtsaA8/U8vx7MYVQEALWPfFGysbla0WcojrjY+XZLgVu12gsbyISKtJMKI+9
         xOKTFOVOA6cIynp/TDwKT78XS1jREI7KvXxMGZk81PDd7pbldt1YVGF0JhuKb38n12bP
         4UNK5v4C3nq5q/OFg7rLnoUB2Wl8wjeQsVL21dxVlUomU6exLe1EOVDA8bk9y2Yzwu3O
         JHsvb40RoqE1zpuwhdewxmaVhCHDKckibEHtSO8u2jenvrlKhbO58JFQO2sfE2DGyhl+
         MBBTLWHF69zk+LIAcPB9RgmHs887Vsj2+8byMya8Jl/O3WoJiK0k7rfs6uFSXMcpDsLd
         IV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHpYdJ13qgsjjDiZxEZX6EfxkzCgSJcFysP88kBAwIt4qohUYjlR8o00nl3wV4Y8Rbg+2+acYYldY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyY6dlIQN8aCY7Ap0vjLmDpxEfU6blG17rLMipcF3R77NHwdZnR
	Bcv8EkfvB7vWRB6mTjpYzVp7z2lF1B8Bi+gTrB+rUBrX5H5QDtNRNd3JSXZOUSo=
X-Gm-Gg: ASbGnctVBhduiykTkXPvq5OIXLgAPufzvflfx3dhZEj0dU18v39PODvt8Z8f/icLtRh
	5s0C8tt+Iy7H5gTlVVbvvMIP5PzVDPn0HnuNN99Z+fsiqQkdU7eDHvjn4434yzyj3uoMwz4Ja8i
	9v3Ux73lqsPM55M11e2XW0j2dHQIzlC7JfVwDAtEaaj+/22LRhhBisq/EfucFv5gaoFUxAHRPTw
	SIElMT+bFgV59fzOodZB/QayYryBSA8t76iVnLBmv5E4mDeIhsZFes28994Aw==
X-Google-Smtp-Source: AGHT+IFZOYiH3Lp+d7c3IwqfVvrJzv9LfhQkadnYh+yiXsg63+Fi3WdnIKMzN5v9yy0Mix+L9bzXEw==
X-Received: by 2002:a05:6000:4026:b0:385:e879:45cc with SMTP id ffacd0b85a97d-388da3941d2mr2416167f8f.19.1734430438094;
        Tue, 17 Dec 2024 02:13:58 -0800 (PST)
Date: Tue, 17 Dec 2024 11:13:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/io-apic: prevent early exit from i8259 loop detection
Message-ID: <Z2FO5LOAEl3vYUZ2@macbook.local>
References: <20241217090045.6251-1-roger.pau@citrix.com>
 <a44e6726-4c4b-434d-bace-585859c5d66d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a44e6726-4c4b-434d-bace-585859c5d66d@suse.com>

On Tue, Dec 17, 2024 at 10:40:31AM +0100, Jan Beulich wrote:
> On 17.12.2024 10:00, Roger Pau Monne wrote:
> > Avoid exiting early from the loop when a pin that could be connected to the
> > i8259 is found, as such early exit would leave the EOI handler translation
> > array only partially allocated and/or initialized.
> > 
> > Otherwise on systems with multiple IO-APICs and an unmasked ExtINT pin on
> > any IO-APIC that's no the last one the following NULL pointer dereference
> > triggers:
> > 
> > (XEN) Enabling APIC mode.  Using 2 I/O APICs
> > (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Not tainted ]----
> > (XEN) CPU:    0
> > (XEN) RIP:    e008:[<ffff82d040328046>] __ioapic_write_entry+0x83/0x95
> > [...]
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d040328046>] R __ioapic_write_entry+0x83/0x95
> > (XEN)    [<ffff82d04027464b>] F amd_iommu_ioapic_update_ire+0x1ea/0x273
> > (XEN)    [<ffff82d0402755a1>] F iommu_update_ire_from_apic+0xa/0xc
> > (XEN)    [<ffff82d040328056>] F __ioapic_write_entry+0x93/0x95
> > (XEN)    [<ffff82d0403283c1>] F arch/x86/io_apic.c#clear_IO_APIC_pin+0x7c/0x10e
> > (XEN)    [<ffff82d040328480>] F arch/x86/io_apic.c#clear_IO_APIC+0x2d/0x61
> > (XEN)    [<ffff82d0404448b7>] F enable_IO_APIC+0x2e3/0x34f
> > (XEN)    [<ffff82d04044c9b0>] F smp_prepare_cpus+0x254/0x27a
> > (XEN)    [<ffff82d04044bec2>] F __start_xen+0x1ce1/0x23ae
> > (XEN)    [<ffff82d0402033ae>] F __high_start+0x8e/0x90
> > (XEN)
> > (XEN) Pagetable walk from 0000000000000000:
> > (XEN)  L4[0x000] = 000000007dbfd063 ffffffffffffffff
> > (XEN)  L3[0x000] = 000000007dbfa063 ffffffffffffffff
> > (XEN)  L2[0x000] = 000000007dbcc063 ffffffffffffffff
> > (XEN)  L1[0x000] = 0000000000000000 ffffffffffffffff
> > (XEN)
> > (XEN) ****************************************
> > (XEN) Panic on CPU 0:
> > (XEN) FATAL PAGE FAULT
> > (XEN) [error_code=0002]
> > (XEN) Faulting linear address: 0000000000000000
> > (XEN) ****************************************
> > (XEN)
> > (XEN) Reboot in five seconds...
> > 
> > Reported-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> > Fixes: 86001b3970fe ('x86/io-apic: fix directed EOI when using AMD-Vi interrupt remapping')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Hmm, considering the earlier change was backported, I'm even inclined to
> delay 4.18.4 a little, for taking this one there as well.
> 
> > --- a/xen/arch/x86/io_apic.c
> > +++ b/xen/arch/x86/io_apic.c
> > @@ -1389,14 +1389,15 @@ void __init enable_IO_APIC(void)
> >              /* If the interrupt line is enabled and in ExtInt mode
> >               * I have found the pin where the i8259 is connected.
> >               */
> > -            if ((entry.mask == 0) && (entry.delivery_mode == dest_ExtINT)) {
> > +            if ( ioapic_i8259.apic == -1 && entry.mask == 0 &&
> > +                 entry.delivery_mode == dest_ExtINT )
> > +            {
> > +                ASSERT(ioapic_i8259.pin == -1);
> 
> I'm not sure of the value of this assertion. It is provable that ...
> 
> >                  ioapic_i8259.apic = apic;
> >                  ioapic_i8259.pin  = pin;
> 
> ... both fields are updated together (and not earlier on), and hence once
> we've been here neither field will still be -1.

No strong opinion, as all asserts I've placed it here in case the
logic to set apic or pin would change.

> Looking around I further notice that it's generally ioapic_i8259.pin that
> we check against -1, so I wonder whether - just for consistency - the if()
> condition wouldn't better too use that one.

As with the above, no strong opinion really, it's true that most
checks tend to use ioapic_i8259.pin != -1 instead of the apic field,
so I can adjust to that.

> Preferably with these adjustments:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, Roger.

