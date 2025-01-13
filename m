Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC84AA0B481
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 11:26:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870521.1281701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXHdy-0000GL-Jx; Mon, 13 Jan 2025 10:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870521.1281701; Mon, 13 Jan 2025 10:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXHdy-0000Eq-Gr; Mon, 13 Jan 2025 10:26:02 +0000
Received: by outflank-mailman (input) for mailman id 870521;
 Mon, 13 Jan 2025 10:26:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HK6=UF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXHdx-0000Ek-5y
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 10:26:01 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c88e82fb-d198-11ef-a0e1-8be0dac302b0;
 Mon, 13 Jan 2025 11:26:00 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d932eac638so7865401a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 02:26:00 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046a05asm4788651a12.67.2025.01.13.02.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 02:25:59 -0800 (PST)
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
X-Inumbo-ID: c88e82fb-d198-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736763960; x=1737368760; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=925HmCk6HSMWdjeEYYDzVrquNKNAs9H/T8Q5GhNYCxE=;
        b=QO8epKrDtZt3c8MMU06kGXmAlNnuM8cDUBFk0Yny4lMxcaW0xbQdsKYx/5PhfQ5D4G
         23wI2Ac0wUf0qQqX7/go5DFjGSjYLww/keHmTjSWEtGPSQILXN0/PjbUdCL+Non2nEqg
         Eynt9U0EvCALSyHzwxEXMjZ/QLv9GOyldrgLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736763960; x=1737368760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=925HmCk6HSMWdjeEYYDzVrquNKNAs9H/T8Q5GhNYCxE=;
        b=BgMiKXMSh8HifK5ssPjRQV3kT2kZZV5vOaOk+sBAZFaJhl+RpvlmhjvW+w2wUKcXZs
         qktDXMGJA4IaoYclAMlsZXc6txV71Ai4kfaxFogbSQCnd75UJaU1vV4AvbGpbsawC8g3
         eSPB53Z72enqrmx9w9QsQ9IJs+KiWCvQ66vjCddvI0uQ13BYyFuNvBZa3OF+KQnSU2+I
         0Y2QeTEcWryi/nUBxyqRrGt0yyLqMvFa7M53vQOOEnr2rWyLLaOSZr6iefoyygQ2ycmO
         BpqsmtADq0JkgCab0vGVJkq2kNiuoP+p1V9xFyhMIhHMSs8G2IEoHwWmD4ZvW1zTMtVN
         uU8g==
X-Forwarded-Encrypted: i=1; AJvYcCUSLHH74YMCSaGqEvV+46XfDcNvmt2pfKttW5lK+dbkpNShoNCiq0TAIFuiwcKd/I80p3ngapXvmLc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzExH/e3GLORF2wa6FQ3a0+hV76mjMUZGpJt+IpdB8l538JnhLA
	5tDjUCLc2TKaZZdZMKL7z6NBs9o4hEf7l3iDWaefNzOS5oZuT67tJEru0xrWxDw=
X-Gm-Gg: ASbGncsJ81JsS0OPGZ5jiQGYZn+41Eb0DMLt4izxkyULaXnSJi8ry3z2y/Te/tjjDBT
	UXib7MrT+za1q+e1rkuqPxxGnFl6o0h/r49UcaqZ2NIX2a2IFFSTr0wfcybBe3Kh69zV6SynhWM
	2gwMrZ/Ro/hp01dxvL5Srftlwb+qY+AbcSDBig7I+mP43z+JiNof9iZjq0uNLSp9ECIDkQhp5Uo
	gaupYBjuXunBvwBQ2wJjTjCz4l8ecVK7Xt3Xi3/J98taU56aAtQGuK67AyXRg==
X-Google-Smtp-Source: AGHT+IFqQfQXn4x8tYwm9aCoWhJeQj7jQKe/nY36w28hVZGBm5avVQz2Sjl6V/fPorhg+0bEmX3Ptg==
X-Received: by 2002:a05:6402:5006:b0:5d0:e3fa:17ca with SMTP id 4fb4d7f45d1cf-5d972e17902mr18117568a12.15.1736763959654;
        Mon, 13 Jan 2025 02:25:59 -0800 (PST)
Date: Mon, 13 Jan 2025 11:25:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 3/3] pci/msi: remove pci_msi_ignore_mask
Message-ID: <Z4TqNn_RSwGX1TQn@macbook.local>
References: <20250110140152.27624-4-roger.pau@citrix.com>
 <20250110223057.GA318711@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110223057.GA318711@bhelgaas>

On Fri, Jan 10, 2025 at 04:30:57PM -0600, Bjorn Helgaas wrote:
> Match subject line style again.
> 
> On Fri, Jan 10, 2025 at 03:01:50PM +0100, Roger Pau Monne wrote:
> > Setting pci_msi_ignore_mask inhibits the toggling of the mask bit for both MSI
> > and MSI-X entries globally, regardless of the IRQ chip they are using.  Only
> > Xen sets the pci_msi_ignore_mask when routing physical interrupts over event
> > channels, to prevent PCI code from attempting to toggle the maskbit, as it's
> > Xen that controls the bit.
> > 
> > However, the pci_msi_ignore_mask being global will affect devices that use MSI
> > interrupts but are not routing those interrupts over event channels (not using
> > the Xen pIRQ chip).  One example is devices behind a VMD PCI bridge.  In that
> > scenario the VMD bridge configures MSI(-X) using the normal IRQ chip (the pIRQ
> > one in the Xen case), and devices behind the bridge configure the MSI entries
> > using indexes into the VMD bridge MSI table.  The VMD bridge then demultiplexes
> > such interrupts and delivers to the destination device(s).  Having
> > pci_msi_ignore_mask set in that scenario prevents (un)masking of MSI entries
> > for devices behind the VMD bridge.
> > 
> > Move the signaling of no entry masking into the MSI domain flags, as that
> > allows setting it on a per-domain basis.  Set it for the Xen MSI domain that
> > uses the pIRQ chip, while leaving it unset for the rest of the cases.
> > 
> > Remove pci_msi_ignore_mask at once, since it was only used by Xen code, and
> > with Xen dropping usage the variable is unneeded.
> > 
> > This fixes using devices behind a VMD bridge on Xen PV hardware domains.
> 
> Wrap to fit in 75 columns.
> 
> The first two patches talk about devices behind VMD not being usable
> for Xen, but this one says they now work.

Sorry, let me try to clarify:

Devices behind a VMD bridge are not known to Xen, however that doesn't
mean Linux cannot use them.  That's what this series achieves.  By
inhibiting the usage of VMD_FEAT_CAN_BYPASS_MSI_REMAP and the removal
of the pci_msi_ignore_mask bodge devices behind a VMD bridge do work
fine when use from a Linux Xen hardware domain.  That's the whole
point of the series.

> But this doesn't undo the
> code changes or comments added by the first two, so the result is a
> bit confusing (probably because I know nothing about Xen).

All patches are needed.  There's probably some confusion about devices
behind a VMD bridge not being known by Xen vs not being usable by
Linux running under Xen as a hardware domain.

With all three patches applied devices behind a VMD bridge work under
Linux with Xen.

Thanks, Roger.

