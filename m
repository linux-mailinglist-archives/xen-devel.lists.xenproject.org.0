Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2BFA0B416
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 11:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870489.1281670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXHM4-0004Lc-MC; Mon, 13 Jan 2025 10:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870489.1281670; Mon, 13 Jan 2025 10:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXHM4-0004K4-JR; Mon, 13 Jan 2025 10:07:32 +0000
Received: by outflank-mailman (input) for mailman id 870489;
 Mon, 13 Jan 2025 10:07:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HK6=UF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXHM3-0004Jw-BA
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 10:07:31 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 326a8255-d196-11ef-99a4-01e77a169b0f;
 Mon, 13 Jan 2025 11:07:29 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d90a5581fcso6872314a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 02:07:29 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99008c2ccsm4765038a12.18.2025.01.13.02.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 02:07:28 -0800 (PST)
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
X-Inumbo-ID: 326a8255-d196-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736762849; x=1737367649; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ8hBilHaiJrXdn1x4pZcUJFv7XAxAtU+AZUJTBvXks=;
        b=G85/EtYRQUuY6bjJNjZiDtAfxzGeOEui/aBkr7YzNiA9SkWS+bdciguvU1BaBgtxGB
         7okhVZssV0TgSWxSDs/hyObX5PYll+OBxYolS8HfX/WGhh/3ZECwDg8JBIeM5hTJrQwu
         FF75p4u0rWDP1BWjpYqWCn8nX01GS30UTx9ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736762849; x=1737367649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQ8hBilHaiJrXdn1x4pZcUJFv7XAxAtU+AZUJTBvXks=;
        b=KHjtSC1dAlKxg8BOpTPkrP/1B34uA87XukXrHehAe4QzoTEBqj8P9FL386b2I9wGpS
         vf1IKSc5nKbZjl02RWfnjNY3CjBM9kpjvWf5ZMs4DIixqFmpKBfFZqPgL7v4rH4/OlyV
         9WR2zFiqb9+KsVu1r8u4WXETfulGdgr4I7dbsfXZhi/4j/FtUjVkmGBKrxIjygBAdpty
         SunpkAtYHi69okQfDq84P3+KYNZpjqSWpQUQ9PTpxHEhzZZ8dP3WcEwC1T4pVP6Fq5vs
         ekl9ZfUG5KtFNQmI04GFlVle0RNcu9JtR2OaJNPfVAMKnIe9s8+eLJeqPD1rsMlt7o5v
         AS/A==
X-Forwarded-Encrypted: i=1; AJvYcCWd1kj7dUNLk6iVED2zwJDL/9zCrkjjbWTtm72EDwmTEFKqrMn3ASII1KdqsMe+k7iJ9VpPZyAxO9c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1pkVkKlkHJQzzi6H/0jNA2PRTJ8B5njjWBJAxrOsr7PPl6CBb
	CTRf11MXjndfsF2Iv+mb28nkkUHS4angOCvLr+Q0Vso3+5uEUybJeE24iwos+fNfJCKXR/aRGOD
	V
X-Gm-Gg: ASbGncvUt3MdbRNgevQS+YQ2NCZdWbRTWn0pJqeFnA6XxITp9xIOCnKBNh6e9g1ULZO
	rieSt9yMbGuFFwln8tQsO0KSeP1FlGW3b38xVVyc8cQE549aYgnfvxZiGWs0rRSbNRC1oZdt2uO
	UegNycCDcE9SwnLzQKWPetjP2k0gWgDQmXWw6XkVoQhztSEGkjy7BTJpMgmbWfDqvdYm8EDIVme
	WBNltV727AHHbNnKfeYFuvQTF0wMy6Kf9GqSFgYdEWRgmUCubBQBxzB+JSgUQ==
X-Google-Smtp-Source: AGHT+IG0+0hZDzdp4js5X9Qv1pwIacDTz8sB7g6BrtwD/4COxyJ2JYTA+74n/qblZAnNxdkdxaGgnw==
X-Received: by 2002:a05:6402:50d0:b0:5d6:37e9:8a93 with SMTP id 4fb4d7f45d1cf-5d972dfbbcdmr14241323a12.2.1736762848818;
        Mon, 13 Jan 2025 02:07:28 -0800 (PST)
Date: Mon, 13 Jan 2025 11:07:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 2/3] vmd: disable MSI remapping bypass under Xen
Message-ID: <Z4Tl33MHEhgrHg1A@macbook.local>
References: <20250110222525.GA318386@bhelgaas>
 <bcb30b80-0902-4561-94f9-a6e451702138@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bcb30b80-0902-4561-94f9-a6e451702138@linux.dev>

On Fri, Jan 10, 2025 at 10:02:00PM -0700, Jonathan Derrick wrote:
> Hi Bjorn,
> 
> On 1/10/25 3:25 PM, Bjorn Helgaas wrote:
> > Match historical subject line style for prefix and capitalization:
> > 
> >    PCI: vmd: Set devices to D0 before enabling PM L1 Substates
> >    PCI: vmd: Add DID 8086:B06F and 8086:B60B for Intel client SKUs
> >    PCI: vmd: Fix indentation issue in vmd_shutdown()
> > 
> > On Fri, Jan 10, 2025 at 03:01:49PM +0100, Roger Pau Monne wrote:
> > > MSI remapping bypass (directly configuring MSI entries for devices on the VMD
> > > bus) won't work under Xen, as Xen is not aware of devices in such bus, and
> > > hence cannot configure the entries using the pIRQ interface in the PV case, and
> > > in the PVH case traps won't be setup for MSI entries for such devices.
> > > 
> > > Until Xen is aware of devices in the VMD bus prevent the
> > > VMD_FEAT_CAN_BYPASS_MSI_REMAP capability from being used when running as any
> > > kind of Xen guest.
> > 
> > Wrap to fit in 75 columns.
> > 
> > Can you include a hint about *why* Xen is not aware of devices below
> > VMD?  That will help to know whether it's a permanent unfixable
> > situation or something that could be done eventually.
> > 
> I wasn't aware of the Xen issue with VMD but if I had to guess it's probably
> due to the special handling of the downstream device into the dmar table.

Nothing to do with DMAR or IOMMUs, it's just that on a Xen system it
must be Xen the one that configures the MSI entries, and that requires
Xen being aware of the VMD devices and it's MSI or MSI-X
capabilities.

None of this is currently done, as Xen has no visibility at all of
devices behind a VMD bridge because is doesn't even know about VMD
bridges, neither about the exposed ECAM-like region on those
devices.

Thanks, Roger.

