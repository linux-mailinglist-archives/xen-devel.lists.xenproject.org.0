Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1521EACB212
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003523.1383096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM68N-0004kQ-2Z; Mon, 02 Jun 2025 14:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003523.1383096; Mon, 02 Jun 2025 14:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM68M-0004i1-Vc; Mon, 02 Jun 2025 14:27:26 +0000
Received: by outflank-mailman (input) for mailman id 1003523;
 Mon, 02 Jun 2025 14:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9xt=YR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uM68L-0004hv-Di
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:27:25 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3a5623a-3fbd-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 16:27:24 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-450cfb79177so23389205e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 07:27:24 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-450d7fb7e41sm122725445e9.26.2025.06.02.07.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 07:27:23 -0700 (PDT)
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
X-Inumbo-ID: b3a5623a-3fbd-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748874444; x=1749479244; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FThXX84qzUvkWuvanpUBN/Tye/WVUi7pzOiYGlnoRLY=;
        b=Lj9wFkLkw7Fwt/8tiWYOwyktWLsKns+3xYnDM9pZMrbFKQnQjZGt09pGGmuB5wMrM0
         NxfTbnYVcus2chZWEBCSbul6ZAMKrMqIWt1wUvMqCm6tqt9uUSBBNqY0O0iTiDEnDQsT
         TrQxrEc3VJRVLDgEdEiJzWQqPhK7hGAawfFcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748874444; x=1749479244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FThXX84qzUvkWuvanpUBN/Tye/WVUi7pzOiYGlnoRLY=;
        b=vIDPGI4Q7rpE4lAYxyxGpLkUlrdcfnMeiImk4aLg4bf6FFDzCSva8qwy4No0Pn0LML
         JDmy7fVdlJOv1LW1lFGur5sPMIqjpxvT7YriznbOpigx3WwZz9HdcD9Dls7v+Sweife+
         m0DwWKlS0eynOp1EMxeE9oJilTvIk7LILoil0pRyaCnVLpDxCFDKLL/M5QbmS3sgrDaH
         nDCmdxONgqTHKaMmXn2fU010Wh0N9J6trDbnGqNf15oEamAZTqs/85OzYQGjBhikuzGR
         qJpsTACINSuF9RQQEdN4LgWsnYuP4Y8lUrO22GjGKhwi+nhw862xB9w+kEzHularcrCZ
         d3vg==
X-Forwarded-Encrypted: i=1; AJvYcCXT2NWjBnmP/b6BsvaG6QLLlUZLbP+zQ8LyDKWnwJNuEm4aMiNOUJOi+Q6Vt+HG3hRol0WjEOpLFdQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjkCMpt3ZbwZt8N9eeeEDd0fmd1knkqlpxUNv01xQrrmO0NDpf
	UBn04WJZQZGh9hBF9wpN0bTC+tjmpzuUQDpaDJvRx0NNZqfldWyaxpyIsyx3UIgYlUc=
X-Gm-Gg: ASbGnctjmmLIo+2DOMJM2o7nWELh7tIzjYDtm+FtJbeIdRScbSrrPKlVYhmtpZIU7lx
	5FPqFHsyNV2UmriyjhOIDXeOLpt+lfubfxv4+eIGjSavLY3kNH4fROV/vminzjrxYFjuNGx0Q68
	Ot/L6pWGn3PXv4VV79jP1CY+8KQO3kHSi0mrdkwctGTyG/eX8NNCTQ0APixgv+7QCilC5vNiit0
	3IFB8aIclcwUDT01cMujnmc5spIDdDMIheHQLJ+ytaVenDH/CeirmjCHLnp2wnEXixOvaj3ET9i
	E+8g9CldXJgcfemphQRz/dpt0xBjewjVRZaOSTOcA9ss1edUC7lYE61b1uzd8dhKqLNm5ygnbRy
	aePyiGM55VyUtwK2HfXnVsy/unSTShQ==
X-Google-Smtp-Source: AGHT+IEDBm1thALKRLLquPDciEzDf+F/HEJD1o4XUAkGUIn3gKRgVB61smOj3Vo9fIbjE+IWz8/GhA==
X-Received: by 2002:a05:600c:314a:b0:442:d9f2:c6ef with SMTP id 5b1f17b1804b1-450d880abb7mr119480495e9.2.1748874443872;
        Mon, 02 Jun 2025 07:27:23 -0700 (PDT)
Date: Mon, 2 Jun 2025 16:27:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/hvmloader: don't set xenpci MMIO BAR as UC in MTRR
Message-ID: <aD20yhCFYVXvTPZv@macbook.local>
References: <20250530092314.27306-1-roger.pau@citrix.com>
 <58c0499c-cdde-4cc3-9441-606a0eea4652@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58c0499c-cdde-4cc3-9441-606a0eea4652@suse.com>

On Mon, Jun 02, 2025 at 11:46:52AM +0200, Jan Beulich wrote:
> On 30.05.2025 11:23, Roger Pau Monne wrote:
> > The Xen PCI device (vendor ID 0x5853) exposed to x86 HVM guests doesn't
> > have the functionality of a traditional PCI device.  The exposed MIO BAR is
> > used by some guests (including Linux) as a safe place to map foreign
> > memory, including the grant table itself.
> > 
> > Traditionally BARs from devices have the uncacheable (UC) cache attribute
> > from the MTRR, to ensure correct functionality of such devices.  hvmloader
> > mimics this behaviour and sets the MTRR attributes of both the low and high
> > PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.
> > 
> > This however causes performance issues for the users of the Xen PCI device
> > BAR, as for the purposes of mapping remote memory there's no need to use
> > the UC attribute.  On Intel systems this is worked around by using iPAT,
> > that allows the hypervisor to force the effective cache attribute of a p2m
> > entry regardless of the guest PAT value.  AMD however doesn't have an
> > equivalent of iPAT, and guest PAT values are always considered.
> > 
> > Linux commit:
> > 
> > 41925b105e34 xen: replace xen_remap() with memremap()
> > 
> > Attempted to mitigate this by forcing mappings of the grant-table to use
> > the write-back (WB) cache attribute.  However Linux memremap() takes MTRRs
> > into account to calculate which PAT type to use, and seeing the MTRR cache
> > attribute for the region being UC the PAT also ends up as UC, regardless of
> > the caller having requested WB.
> > 
> > As a workaround to allow current Linux to map the grant-table as WB using
> > memremap() special case the Xen PCI device BAR in hvmloader and don't set
> > its cache attribute as UC.
> 
> Can we (fully compatibly) make such a change? IOW do we know all possible
> guests would be at least unaffected (ideally affected positively)? Imo ...

Is there any other possible usage for the xenpci MMIO BAR?  My
understanding is it was introduced for this specific purpose; to
signal a safe place to map the grant-table or foreign mappings, which
in both cases want to have an effective WB cache attribute.

> >  Such workaround in hvmloader should also be
> > paired with a fix for Linux so it attempts to change the MTRR of the Xen
> > PCI device BAR to WB by itself.
> > 
> > Overall, the long term solution would be to provide the guest with a safe
> > range in the guest physical address space where mappings to foreign pages
> > can be created.
> 
> ... this is the only viable path.

I agree, however this will take more time to materialize IMO.  Needs a
patch to Linux, plus possible backports, and then distros picking the
updates.

While I agree this needs fixing in Linux, I don't see any downsides of
doing the workaround in hvmloader also, as a faster way to get it
deployed with just a Xen update.

> > Some vif throughput performance figures provided by Anthoine from a 8
> > vCPUs, 4GB of RAM HVM guest(s) running on AMD hardware:
> > 
> > Without this patch:
> > vm -> dom0: 1.1Gb/s
> > vm -> vm:   5.0Gb/s
> > 
> > With the patch:
> > vm -> dom0: 4.5Gb/s
> > vm -> vm:   7.0Gb/s
> > 
> > Reported-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I don't think the ACPI tables builder consume the PCI window size
> > information, I'm not seeing any consumer of the acpi_info->pci_{min,len}
> > fields, yet I've keep them covering the xenpci device BAR, hence the
> > adjustment to hvmloader_acpi_build_tables() part of this patch.
> 
> acpi_build_tables() copies the field, and the comment ahead of struct
> acpi_info clarifies where the uses are: It's the PLEN field, which does
> have a use in dsdt.asl. Aiui the change you make is therefore a necessary
> one.

Right, thanks.  I was grepping for 'Field("BIOS"', instead of 'Field(BIOS'.

Roger.

