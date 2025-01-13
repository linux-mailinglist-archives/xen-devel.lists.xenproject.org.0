Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3C1A0B446
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 11:14:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870503.1281681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXHSC-0006DO-EU; Mon, 13 Jan 2025 10:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870503.1281681; Mon, 13 Jan 2025 10:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXHSC-0006BQ-AV; Mon, 13 Jan 2025 10:13:52 +0000
Received: by outflank-mailman (input) for mailman id 870503;
 Mon, 13 Jan 2025 10:13:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HK6=UF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXHSB-0006BH-6l
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 10:13:51 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15695c5d-d197-11ef-a0e1-8be0dac302b0;
 Mon, 13 Jan 2025 11:13:50 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3e8f64d5dso7953665a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 02:13:50 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b20b1sm476929666b.157.2025.01.13.02.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 02:13:47 -0800 (PST)
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
X-Inumbo-ID: 15695c5d-d197-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736763230; x=1737368030; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D8lTHlEAyEJii3/Mpwsxjw0Vi02XDn0bU6dFc3Qzs4M=;
        b=nGLHNC5u+U5o0CATdiR1v269WmUwccQ+6RrGklclpSGp+V26gU540ggNojhQ0uGISd
         vmjNKXYWxkl+E1SnWiV7B6C6mNq4qD+OjF1AZ4/3oENYOELMgZxqZUd3yjU6rgSiCYVI
         Wmh9KDzIJ42RK8WoN6ZlI7oYlKv/OchY/S2xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736763230; x=1737368030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8lTHlEAyEJii3/Mpwsxjw0Vi02XDn0bU6dFc3Qzs4M=;
        b=D1pCG7FDNMLVJfqX735ufVI+9Gtm/CSBRoLnoGouP30Sas2+hCWrNSEIgQten69Cdd
         SaOkOsrSgbwbjop1LMl3atquaV3JMV0PA3UrUoUErmgMsbIDLrkVJ9PDin0zU9tXzUZx
         rZ9VA2xS+DxJWgVBoFT5MBzhtYBoc3PB6hGAuNKHrbgS3D89+4L8zHC/xlJuPXAJO/x2
         VTh5mn77ut3zRe6FVdW/M7hBMxvUOZ5RqUU2ROb+fJ1gk1GC/L8QFWbRNR8upgnRc3bH
         yvbH0I+92m1Shl+BldoQRwzC2/MYtPmjms7L3myJ2O1JJZsroI/FC9C0tJW+3tiOdqCG
         sM0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOILAQWEhm2XpJc5U0fDyGT7TiJl6luVZH2nwI1b4h9RFd0m8wGzgS7x0/tmwRxq+eiqUm0CqlK0w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw71O4HHn09TMC4zb33tDUjcHfhGjj6bf9QhEd4KXFengh9wrKF
	RuH7HHG/6FReH1nGqF2v3WS99XISUHTRTVA7iFmwb7XqbFDEpAKrIdM+fQimL8M=
X-Gm-Gg: ASbGncs6coDLhbVLBEfv5zLvNOZzSz41OYv27Lsexld22yJdGq9oPBaULG+X5nh3SLt
	sv3MNXDi3eMGRikpWXhicYkpnI+KjKvWvkazzSUHRim0Uk6ZwNPa9IgasVEZ0PkQa2Vk5XMEw3G
	X79xHbIWBK3lIH6Vwpn5zLi4CAUuYBs01Z69+42JbyyMJ2pqXTwjiMAL7gUs9563mYg6T2jowKr
	JG1v7/eEQG30mlHqVHD+0hqP+yQRhY0l+svK68hRyxz3+gtTN8zVSb4kv2g1g==
X-Google-Smtp-Source: AGHT+IHQkfbOK7qojKw+VPoB34F3v7yvjSb9eEpH3DVYUTt7SdxJWey3SgTqrE3crVT85gfimKgYaQ==
X-Received: by 2002:a17:907:1998:b0:ab2:c9b8:aaa7 with SMTP id a640c23a62f3a-ab2c9b8ad19mr1517175666b.44.1736763228224;
        Mon, 13 Jan 2025 02:13:48 -0800 (PST)
Date: Mon, 13 Jan 2025 11:13:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] xen/pci: do not register devices outside of PCI
 segment scope
Message-ID: <Z4TnWiijgBK3fThI@macbook.local>
References: <20250110140152.27624-1-roger.pau@citrix.com>
 <20250110140152.27624-2-roger.pau@citrix.com>
 <28ad828a-0a9a-4637-bf55-59de2f731537@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <28ad828a-0a9a-4637-bf55-59de2f731537@suse.com>

On Mon, Jan 13, 2025 at 08:17:23AM +0100, Jan Beulich wrote:
> On 10.01.2025 15:01, Roger Pau Monne wrote:
> > The PCI segment value is limited to 16 bits, however there are buses like VMD
> > that fake being part of the PCI topology by adding segment with a number
> > outside the scope of the PCI firmware specification range (>= 0x10000). The
> > MCFG ACPI Table "PCI Segment Group Number" field is defined as having a 16 bit
> > width.
> > 
> > Attempting to register or manage those devices with Xen would result in errors
> > at best, or overlaps with existing devices living on the truncated equivalent
> > segment values.
> > 
> > Skip notifying Xen about those devices.
> 
> Hmm, is simply omitting the notification really all it takes? How would Xen
> manage MSI / MSI-X, for example, without knowing of the device? As per the
> BoF on the summit in Prague(?), I continue to think we need partial driver
> logic in Xen for VMD ...

The basic mode of operation of devices behind a VMD bridge is to
reference the interrupts of the bridge device in its MSI(-X) entries,
so the VMD bridge acts as a de-multiplexer and forwards the interrupts
to the device behind the VMD bridge.  See vmd_alloc_irqs() (and
calling context) in the VMD driver for a reference about how this is
setup and operates.  Note also that devices behind a VMD bridge
operate using a different MSI domain, that uses a custom
irq_compose_msi_msg hook.

Thanks, Roger.

