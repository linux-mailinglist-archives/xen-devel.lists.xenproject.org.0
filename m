Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F82A0B45E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 11:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870512.1281691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXHXB-0006nt-UF; Mon, 13 Jan 2025 10:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870512.1281691; Mon, 13 Jan 2025 10:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXHXB-0006m4-RZ; Mon, 13 Jan 2025 10:19:01 +0000
Received: by outflank-mailman (input) for mailman id 870512;
 Mon, 13 Jan 2025 10:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HK6=UF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXHXA-0006ly-CE
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 10:19:00 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdb0161d-d197-11ef-a0e1-8be0dac302b0;
 Mon, 13 Jan 2025 11:18:59 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa6c0d1833eso72636766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 02:18:59 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b1207sm480261466b.153.2025.01.13.02.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 02:18:58 -0800 (PST)
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
X-Inumbo-ID: cdb0161d-d197-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736763539; x=1737368339; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VrEW9RapkLUvbhwp5lZsmgCTaBubEpv7gR1Du+cFUKw=;
        b=sB1ORh4ISCaXBEepfxjzPLe3xpftzZr0ch/Gqbu0YN9z3LJjsDYfcM3rgriAtJZNJX
         2kgsCDMxCcIVlzuW32APHKIZ2jRp64XfrHvN2yFmZ6MJniJYGYlGkOPQv5f1b8irz8LY
         nYJrucsfvrYaF3ps2Rl4AQtrNMph6Ja1V6g64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736763539; x=1737368339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrEW9RapkLUvbhwp5lZsmgCTaBubEpv7gR1Du+cFUKw=;
        b=g/dRVZxlZqAjxJcHZuLjECiUbK1MKRsIBj9H+v3wbpLlBqzKphFEDVbo6pKbJHhNP9
         AXc8x5/tPqUyKJbKxkPyeqlU+8ucQ6DC3XTFoMkUd8jCFEYEnvzK68BqMwEW5kax6VSN
         H4mQUmilfE6fqhkFAPVGDiMYKV2kF+oJ/zC1sPjIhLpKewGoxHofuVWoCNKhWI8XQS67
         1h29e5M+fIMJWPgFXds1x5wjOqd/Voy9DcECpEp9U+eITvow5ykQO7RxMV0cgFljYC4C
         mWhOUeUBUbMemUKVawzbzE6i0UOX8t/ZoPa2LYkz89Z8KZ5sC5yasb0VcEW3BEWibBtX
         4eDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsP1MklgwKwP1FBpABpdVNB7EyftJieQJn/PfF584QD2Lf1jnKfNk1SJzGRZLKuWjhMpskS1cZcfI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFTDjSJn0UbngCF/hRnKhQnK+u452yV0vfcFbevytFWA5w33IY
	hlwjFNeGNNSkTT9IoRxsHctFJZlCfgi8IeXbQXbnKdzMAlY0fyAGJHBapasp1N0=
X-Gm-Gg: ASbGncsMstmXz3jo/Tf/8mSzFsOnQX5FGUnTRqpQKEt5LU9Aw0mVut/h65125ipRTvM
	JP9pjxPFN4N4XOTyLkNGG8aBfZ5enIk2X45TD4PQT8tiTzbDej3bZalAEC/J9p2Nn7w0cjl/whL
	INHdU+/xdLe+UC6WHt1sIIxk1j8v+RWVigIvUtuUDNtfbrnYivGgCP3HECd/U3MdUpU2eVrDg8V
	GLjyju4xiuUyabpN7nH1YlWc3LTEvoLMdRhB9AuKQ8b3WhW3L5QEVKHEv1Tjw==
X-Google-Smtp-Source: AGHT+IFj27FBVfZTJ7AzO9lrawoAO53MNm4jmh4KeKFNibSqpwXUBrNBlB8upGMQuZot38gb5qnfxw==
X-Received: by 2002:a17:907:2d94:b0:aa6:66eb:9c06 with SMTP id a640c23a62f3a-ab2ab6a8e01mr1928797466b.5.1736763538798;
        Mon, 13 Jan 2025 02:18:58 -0800 (PST)
Date: Mon, 13 Jan 2025 11:18:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH 1/3] xen/pci: do not register devices outside of PCI
 segment scope
Message-ID: <Z4TokbA1s3OyNdjt@macbook.local>
References: <20250110140152.27624-2-roger.pau@citrix.com>
 <20250110222129.GA317771@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110222129.GA317771@bhelgaas>

On Fri, Jan 10, 2025 at 04:21:29PM -0600, Bjorn Helgaas wrote:
> On Fri, Jan 10, 2025 at 03:01:48PM +0100, Roger Pau Monne wrote:
> > The PCI segment value is limited to 16 bits, however there are buses like VMD
> > that fake being part of the PCI topology by adding segment with a number
> > outside the scope of the PCI firmware specification range (>= 0x10000). The
> > MCFG ACPI Table "PCI Segment Group Number" field is defined as having a 16 bit
> > width.
> >
> > Attempting to register or manage those devices with Xen would result in errors
> > at best, or overlaps with existing devices living on the truncated equivalent
> > segment values.
> 
> The ACPI _SEG method (ACPI r6.5, sec 6.5.6) and the corresponding
> value in the MCFG table (PCI Firmware r3.3, sec 4.1.2) are clearly
> 16-bit values.
> 
> But otherwise, the segment value is pretty much an arbitrary software
> value, and the kernel works fine with the larger domain values from
> vmd_find_free_domain(), so this isn't quite enough to explain what the
> issue with Xen is.
> 
> Does Xen truncate the domain to 16 bits or use it to look up something
> in ACPI?

In the interface between Xen and Linux the segment field is 16 bit
width, so with the current interface is not possible to reference
devices that are past the 0xffff segment.

I also wonder whether Xen and Linux (or guest OSes in general) would
agree on how to reference such devices.  AFAICT VMD segment numbers
are purely a software construct, but not something enforced by the
specification.  Could for example FreeBSD assign a different segment
to VMD devices?

If so we would need some kind of specification about how VMD segment
values are assigned so that OSes have a coherent way of referencing
VMD devices without ambiguity.

Thanks, Roger.

