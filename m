Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C85A71579
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 12:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927589.1330309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txOi5-0004rN-IZ; Wed, 26 Mar 2025 11:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927589.1330309; Wed, 26 Mar 2025 11:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txOi5-0004p5-Fl; Wed, 26 Mar 2025 11:14:13 +0000
Received: by outflank-mailman (input) for mailman id 927589;
 Wed, 26 Mar 2025 11:14:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mf06=WN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txOi3-0004oz-O8
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 11:14:11 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 714a2eb0-0a33-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 12:14:11 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so10307748a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 04:14:11 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3efbcf5fdsm1015676866b.124.2025.03.26.04.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 04:14:09 -0700 (PDT)
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
X-Inumbo-ID: 714a2eb0-0a33-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742987650; x=1743592450; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s1DMxTj9W79Y/bQ7a4BC76DwUnfHWXcWHC6BQFkffiQ=;
        b=OWxJez5Yfx0zulZ/7vTP3RiWBxLCa9DZrpDmwufCBAPH6WVq0mSi4YHCG2DL0E5vnj
         6MSwdjRfGz3hq0cYLFV8Lcwcz5PKiIYVIa7tpMb3maiKSkPqbMax4vHc0/OGKeWde+Ae
         kvAeOtAl684G8VzHKjDZX6naDJJ5A19fp2V/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742987650; x=1743592450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1DMxTj9W79Y/bQ7a4BC76DwUnfHWXcWHC6BQFkffiQ=;
        b=cKk5GpqeLJPz/RYgV8r15uc3+0WEbfvsC9jbeS66LCj2atN2mh2Na8HuHB2i7qA9Fb
         mTOSpVtGDaOZf79K78FfZrz648DoYcbuiFuNEvepz82z/aN5zLye2eHRjfnVEJexd1hE
         GgXN9mZYnBtVTVGegCAYE8Vwy/u14fHsHaqGKexNc6W/Q/mnjvwLRt8elsPtqOATm4b1
         qQgqDmuNONOf0xdDW5M2+MpHUGHQumLDCnRk8dTt033V2km0x5vE5BOMNRZR7Dk5QFKt
         0ePbwvdDhgNplkchiUET5jwOywF0V9rW6aX9GeKGnuIhXvzBrXJaWfgw2rYI4DZGNWFs
         Dt4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVamL/h0j7Puy7to2hmK4ahrBs+f/THhYr2W/yOGYv95puURXqVBDlSEruVkeKEj2pg2hHAIXJWKm4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziHm/sLTfocmk9UOQpk02/q+PAGjFXaLmiZwbPa2sO/lzmF4qx
	PdAWBCgKFBqA5byKdpitIZ8KMMVX955+yYPYJSy+BcGlxRNMsFhlI7nvRb9l7Yo=
X-Gm-Gg: ASbGncvI7HgbCFkFIx78h4ov9WkLPSz7F2XnR9rjiu45DPkzbQT8oLbhFe4LwK7/Ooi
	UTVCyZ1ItZgkacZrtlM2qEjWoJVjo5Mir643SlWgIg+IAo1RopM5mSOm3AKto+1gRn1ssZbCe0e
	bF+JoycTMjdXg3zy/TenwW+AAJ+euwYxIdwBS+5PjrgkEGRPAA5KG4w6LackLBywikjWhKAN1L+
	PYeJXtnYY3N6CkRUuBp69D0joGmxHb/rjHEmcoRZ5mqofZhEOlzdv+mWSkHIBf2YWr88cm2U+GT
	hmx4HqASsZ6fA9tk9V0SVl22GH4P/T4fRf3moVT0g4vJ9C0sSg==
X-Google-Smtp-Source: AGHT+IH0Jg9Mrd0b7FGaEKEhOFjXfX9lAmyt6lVJIoo5kD62q1WqzTmjAHiwoMhyh1JPCuA41d2BtQ==
X-Received: by 2002:a17:907:7289:b0:abf:a387:7e35 with SMTP id a640c23a62f3a-ac3f280cac7mr2218889366b.53.1742987650254;
        Wed, 26 Mar 2025 04:14:10 -0700 (PDT)
Date: Wed, 26 Mar 2025 12:14:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Juergen Gross <jgross@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 3/3] PCI/MSI: Convert pci_msi_ignore_mask to per MSI
 domain flag
Message-ID: <Z-PhgWQMHjxbac3b@macbook.local>
References: <20250219092059.90850-1-roger.pau@citrix.com>
 <20250219092059.90850-4-roger.pau@citrix.com>
 <20250326110455.GAZ-PfV3kOiQw97fDj@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250326110455.GAZ-PfV3kOiQw97fDj@fat_crate.local>

On Wed, Mar 26, 2025 at 12:04:55PM +0100, Borislav Petkov wrote:
> + Linus so that he can whack it before it spreads any further.
> 
> On Wed, Feb 19, 2025 at 10:20:57AM +0100, Roger Pau Monne wrote:
> > Setting pci_msi_ignore_mask inhibits the toggling of the mask bit for both
> > MSI and MSI-X entries globally, regardless of the IRQ chip they are using.
> > Only Xen sets the pci_msi_ignore_mask when routing physical interrupts over
> > event channels, to prevent PCI code from attempting to toggle the maskbit,
> > as it's Xen that controls the bit.
> > 
> > However, the pci_msi_ignore_mask being global will affect devices that use
> > MSI interrupts but are not routing those interrupts over event channels
> > (not using the Xen pIRQ chip).  One example is devices behind a VMD PCI
> > bridge.  In that scenario the VMD bridge configures MSI(-X) using the
> > normal IRQ chip (the pIRQ one in the Xen case), and devices behind the
> > bridge configure the MSI entries using indexes into the VMD bridge MSI
> > table.  The VMD bridge then demultiplexes such interrupts and delivers to
> > the destination device(s).  Having pci_msi_ignore_mask set in that scenario
> > prevents (un)masking of MSI entries for devices behind the VMD bridge.
> > 
> > Move the signaling of no entry masking into the MSI domain flags, as that
> > allows setting it on a per-domain basis.  Set it for the Xen MSI domain
> > that uses the pIRQ chip, while leaving it unset for the rest of the
> > cases.
> > 
> > Remove pci_msi_ignore_mask at once, since it was only used by Xen code, and
> > with Xen dropping usage the variable is unneeded.
> > 
> > This fixes using devices behind a VMD bridge on Xen PV hardware domains.
> > 
> > Albeit Devices behind a VMD bridge are not known to Xen, that doesn't mean
> > Linux cannot use them.  By inhibiting the usage of
> > VMD_FEAT_CAN_BYPASS_MSI_REMAP and the removal of the pci_msi_ignore_mask
> > bodge devices behind a VMD bridge do work fine when use from a Linux Xen
> > hardware domain.  That's the whole point of the series.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> > Acked-by: Juergen Gross <jgross@suse.com>
> 
> Did anyone actually test this on a normal KVM guest?

Sorry, not on KVM, I've tested on Xen and native.  It also seems to be
somewhat tied to the Kconfig, as I couldn't reproduce it with my
Kconfig, maybe didn't have the required VirtIO options enabled.

It's fixed by:

https://lore.kernel.org/xen-devel/87v7rxzct0.ffs@tglx/

Waiting for Thomas to formally sent that.

Thanks, Roger.

