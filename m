Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57AFA5454B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903155.1311137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6tt-0000Qk-CF; Thu, 06 Mar 2025 08:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903155.1311137; Thu, 06 Mar 2025 08:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6tt-0000Ol-9b; Thu, 06 Mar 2025 08:48:17 +0000
Received: by outflank-mailman (input) for mailman id 903155;
 Thu, 06 Mar 2025 08:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bSAR=VZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tq6ts-0000Of-Bw
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:48:16 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bda4f330-fa67-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 09:48:15 +0100 (CET)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2fa8ada6662so901360a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 00:48:15 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2ff6933b039sm727306a91.1.2025.03.06.00.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 00:48:13 -0800 (PST)
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
X-Inumbo-ID: bda4f330-fa67-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741250893; x=1741855693; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w4k+jXFhr9NDIRUmOU/UyvLqGcx7hV3cHJqh3EvrMGk=;
        b=OLz8sSN2Eudd71Humn+PRjSH+Y7Q2cEa6YRGynffK/DybVsQSMeYGzmCCrKqFibGt5
         qkmCSVUCR3fhkGpk8KncOMd1N3zZjVCuYcs39+9lmgGNIXLsxyumXH/YYPHJrUe/gzf9
         OWL4fPW5SZlo8Y0xk12HJw5Mz6hW2aNkoykyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741250893; x=1741855693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4k+jXFhr9NDIRUmOU/UyvLqGcx7hV3cHJqh3EvrMGk=;
        b=Qy2iPWtD/TpBztoPK5dDwoogGNjqLUq6U8e9WOaRK1qJMV9P+wIJBiAQuJzsCd9LW+
         rJ+KVU6RgWWzXyeh/MzBAaf+eKfR2wI4bExEmJFKiPTx+pwRhwHv7bEHYnXWic+D1Jho
         SLR59yYuybJzABsvMzg8s9sP9BbWWGyL/zSWXFfVlsk1xNdXydq8KCObiRXRKY7k94/M
         smy+SI4GuFxFUVQVhi1Sm7gJirkbEooAahFJBKW8qwL3yQieOvQK44wG2whAWZ27lWap
         +bDSEDrvLZIO44tfFv0imdWUCFEfXYKp6Y/OdMFh0gbsj5Y6bd20v4pbEeANC2gvUVpg
         qN+g==
X-Forwarded-Encrypted: i=1; AJvYcCW6ROWQOqaLHMr6rFb3bniw+apbfG3me3S2EFe15X/Q2uBMBs/egqux67kd3X/mZHgbFWGAkwIItPY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXNfaVrGAq9DGSwuXD/YpFY5GLjXoX6UGKKfJc8abgO+FGjgZ7
	K3kL5/gEV6WaWaZoLcg+jI+adxbqymrGt88OugEmEroGqRZZOn0G64gG9dP1nOQ=
X-Gm-Gg: ASbGncvM15xEWWwAMIQ0K5GkW20Wj/p264Jh3aajyHDT2F8i5Zf0RG2HdcTIdAQ2enb
	OIkKonZqbSssJTvf/KAcq2QJrVaHQXJEzA12HxOKODOUGgvfpkpHP2AVU8Si8iK0RjBFBeq+UZw
	p9oSJWm70JtoA4JanIND6LocG0mk0jmoPmSiOWRwhYKjAWn2BmvHBfGTZo1VwXu44qW56lFVIx1
	EVqviks0U7X993/7DmcxMPSLiNn3zJZb3g722h/zhiBtTPcZr/g8uL7LhxqV8IYYB/45i3I5ZE5
	VX958e1goZ6YZYMV4xzOfT74aReHFSCUyEQnozJrGWadAZ/mNg==
X-Google-Smtp-Source: AGHT+IFzZ0vFCL7WbpviFO4L9vuMIRkk6grLTKfpSaA2lbSdMUSiTAorLN0JYGBYyPjaalZWK0RreA==
X-Received: by 2002:a17:90b:524f:b0:2fe:ba82:ca5 with SMTP id 98e67ed59e1d1-2ff497283aamr10783848a91.11.1741250893553;
        Thu, 06 Mar 2025 00:48:13 -0800 (PST)
Date: Thu, 6 Mar 2025 09:48:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Nirmal Patel <nirmal.patel@linux.intel.com>,
	Bjorn Helgaas <helgaas@kernel.org>, Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/3] xen: Fix usage of devices behind a VMD bridge
Message-ID: <Z8lhR2DSsB8P6L96@macbook.local>
References: <20250219092059.90850-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219092059.90850-1-roger.pau@citrix.com>

Hello,

I've attempted to ping Nirmal directly on the VMD patch, but got no
reply so far.

First version of this series was posted on 10/01, yet there hasn't
been any feedback from Nirmal.  Would it be possible to merge this
without Nirmal Ack due to timeout?

It's not even a new feature, just a bugfix that allows running with
VMD devices when using Xen.

Thanks, Roger.

On Wed, Feb 19, 2025 at 10:20:54AM +0100, Roger Pau Monne wrote:
> Hello,
> 
> The following series should fix the usage of devices behind a VMD bridge
> when running Linux as a Xen PV hardware domain (dom0).  I've only been
> able to test PV. I think PVH should also work but I don't have hardware
> capable of testing it right now.
> 
> I don't expect the first two patches to be problematic, the last patch
> is likely to be more controversial.  I've tested it internally and
> didn't see any issues, but my testing of PV mode is mostly limited to
> dom0.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (3):
>   xen/pci: Do not register devices with segments >= 0x10000
>   PCI: vmd: Disable MSI remapping bypass under Xen
>   PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag
> 
>  arch/x86/pci/xen.c           |  8 ++------
>  drivers/pci/controller/vmd.c | 20 +++++++++++++++++++
>  drivers/pci/msi/msi.c        | 37 ++++++++++++++++++++----------------
>  drivers/xen/pci.c            | 32 +++++++++++++++++++++++++++++++
>  include/linux/msi.h          |  3 ++-
>  kernel/irq/msi.c             |  2 +-
>  6 files changed, 78 insertions(+), 24 deletions(-)
> 
> -- 
> 2.46.0
> 

