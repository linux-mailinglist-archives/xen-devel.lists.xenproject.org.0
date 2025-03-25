Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5F7A6EE44
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 11:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926293.1329161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx1w6-0004rE-7R; Tue, 25 Mar 2025 10:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926293.1329161; Tue, 25 Mar 2025 10:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx1w6-0004pd-4U; Tue, 25 Mar 2025 10:55:10 +0000
Received: by outflank-mailman (input) for mailman id 926293;
 Tue, 25 Mar 2025 10:55:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kATq=WM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tx1w5-0004pV-6J
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 10:55:09 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ca12ff2-0967-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 11:55:07 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-22622ddcc35so36271375ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 03:55:07 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-227811f4383sm86448905ad.229.2025.03.25.03.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 03:55:05 -0700 (PDT)
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
X-Inumbo-ID: 9ca12ff2-0967-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742900105; x=1743504905; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4cvwymUL0NvAVQbxd/v5L8Mbhjg/7BbJrcRQgHQwxds=;
        b=SEF6r0i40prYLry4qJEuijCYVUpVjui/RbM78ZckuuFkAv91bf/ujogEkFgDZN8j5R
         8NslAoAbz37wZHPrCyw2ZOdoRoLsp15uu2Qie8DbzNnmNLqd4z6eLcxyrZCeN6kno7pH
         8QpXD9zNYDvLa5tXHZkc2XgVYrHAfMVvE1jBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742900105; x=1743504905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cvwymUL0NvAVQbxd/v5L8Mbhjg/7BbJrcRQgHQwxds=;
        b=bV3TOXakNI07WRBpnPe2ElykY0nb4exlKGj1y5kteWKcGG4EN6da1Lb3SKw+b3/CGO
         MyOYsO/BM6Cgqhnnq6qyiWeAIN6uGJ+iT75+8zW4k8I7cdU+nXBQMLhXxS66NQPAqDHa
         Izb/2+F+4yT3RZb+aVInk6b2BfxW5r5u5YTP2S4Uj+IYfzp/yKmkyJWJIAH64G8UvqJS
         bjVtHIkfRy0ncd24AVxh35pbBW/C77/LtLK79VjOUs1G6y4L/lPzKkQds2sr3mUt/e47
         w4RB0el3/hvK1Oyv9pujty+mSgBLXKOavsl6aMWjXxRAHgfLigK+jIjy1Jrhio3F1n7q
         Wg5w==
X-Forwarded-Encrypted: i=1; AJvYcCV9BtOLOGE33oOMLWLvY6EzE6+ry3pL53qTrJJepNYUrU+oSbyYIKOadqygywHJsmsD+D+Lmo+VVFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQFu+FrX/9X4P+Ymi+Wd4UGqmQbsENZloqlH8rX7jV60dW4Slw
	7aOrvfExQIKmAnW12bnbgneT5JDwKwgmXJPZi+ycwDP0n/nsPHwNU1W+VKS/z9A=
X-Gm-Gg: ASbGncuJ+kwZJpaXVDs8HtF9RhYwnQ1FfuzsdHDt6J5cceCWuZe+bxPvlzRJrpCfkKm
	hn+EEJlCopEqXr8/St2Op3XFRXpfcAhHwh0o79m+BVrzxMB495fMXrC53INqxhcOnF4gZZO2j9+
	msLTRZy0bAUvSSLuz2pHipvIBxna0+ojZDHgeQ+USJxnRSYcRlQH8CTOSuzRVMuOK9KdvwL/CTc
	8Cs5xhBhNwgVE8g9wtSWbuNuTrMVQypEYImBySivnQOhBPA5agTg5ZeLiLvFIvSaSfNWDQhLAEG
	3SEpDxRHpYoulTm4mz+JnAB+4B3BuNqn2ZsgnIiB3J+ughDvRg==
X-Google-Smtp-Source: AGHT+IGgGtIICegH8Sb6BTn8pdS68Ec79sYIcjMu7xJeM2n4kbkhryUYoDxYxkGjBO8+Yres0KmyXA==
X-Received: by 2002:a17:902:d48b:b0:21f:52e:939e with SMTP id d9443c01a7336-22780d8ff5bmr251332765ad.28.1742900105535;
        Tue, 25 Mar 2025 03:55:05 -0700 (PDT)
Date: Tue, 25 Mar 2025 11:55:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Gomez <da.gomez@kernel.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 3/3] PCI/MSI: Convert pci_msi_ignore_mask to per MSI
 domain flag
Message-ID: <Z-KLhBHoNBB_lr7y@macbook.local>
References: <20250320210741.GA1099701@bhelgaas>
 <846c80f8-b80f-49fd-8a50-3fe8a473b8ec@suse.com>
 <qn7fzggcj6qe6r6gdbwcz23pzdz2jx64aldccmsuheabhmjgrt@tawf5nfwuvw7>
 <Z-GbuiIYEdqVRsHj@macbook.local>
 <kp372led6jcryd4ubpyglc4h7b3erramgzsjl2slahxdk7w575@jganskuwkfvb>
 <Z-Gv6TG9dwKI-fvz@macbook.local>
 <87y0wtzg0z.ffs@tglx>
 <87v7rxzct0.ffs@tglx>
 <Z-KDyCzeovpFGiVu@macbook.local>
 <87sen1z9p4.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sen1z9p4.ffs@tglx>

On Tue, Mar 25, 2025 at 11:27:51AM +0100, Thomas Gleixner wrote:
> On Tue, Mar 25 2025 at 11:22, Roger Pau Monné wrote:
> > On Tue, Mar 25, 2025 at 10:20:43AM +0100, Thomas Gleixner wrote:
> > I'm a bit confused by what msi_create_device_irq_domain() does, as it
> > does allocate an irq_domain with an associated msi_domain_info
> > structure, however that irq_domain is set in
> > dev->msi.data->__domains[domid].domain rather than dev->msi.domain,
> > and doesn't override the default irq_domain set by
> > pcibios_device_add().
> 
> The default irq domain is a parent domain in that case on top of which
> the per device domains are built. And those are private to the device.

Sorry to ask, but shouldn't dev_get_msi_domain() return the specific
device domain rather than the parent one?  Otherwise I feel the
function should rather be named dev_get_parent_msi_domain().

> The XEN variant uses the original global PCI/MSI domain concept with
> this outrageous domain wrapper hack. A crime committed by some tglx
> dude.

I see.  So the proper way would be for Xen to not override the default
x86 irq_domain in dev->msi.domain (so don't have a Xen PV specific
version of x86_init.irqs.create_pci_msi_domain) and instead do
something similar to what VMD does?

Thanks, Roger.

