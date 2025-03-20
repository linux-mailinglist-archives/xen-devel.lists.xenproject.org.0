Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166EDA6AAF5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 17:22:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922944.1326720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIea-0000j5-1l; Thu, 20 Mar 2025 16:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922944.1326720; Thu, 20 Mar 2025 16:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIeZ-0000hJ-V0; Thu, 20 Mar 2025 16:21:55 +0000
Received: by outflank-mailman (input) for mailman id 922944;
 Thu, 20 Mar 2025 16:21:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hxt=WH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tvIeY-0000hD-8D
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 16:21:54 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ea8a778-05a7-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 17:21:52 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso230274366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 09:21:52 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3efd5e92fsm5223566b.174.2025.03.20.09.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 09:21:51 -0700 (PDT)
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
X-Inumbo-ID: 6ea8a778-05a7-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742487712; x=1743092512; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WsSHdLKubVh1IMGmcvj7Aq0XahJ/1yi7vqSiFBPiWOE=;
        b=fC70wkG3jzuqWhjrSkpyaMdQrNKcM3H4MJeSyMEh+y2GAtKd7uN2Uyq1eiRp9Qle4W
         QE/cmJYony3Iu6NWkORl3rln7niJF/MYU8b/9m4kZmTm9us8muRM4GHj7AA8oA6S4GWq
         WRwHLB/nLYmP04j2KKIORkkK9KiQXCCsoYALc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742487712; x=1743092512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WsSHdLKubVh1IMGmcvj7Aq0XahJ/1yi7vqSiFBPiWOE=;
        b=DxMNB92G29LDXSxuEbZ3yec/LDXJap4v8tdTASYXdlOjFeCqiVj6HbSYXvp/TYeoij
         uMKE7VexA0SH4o38xbVW/xFLTLcRWWCZ062tMbO+ELSF0iUUTc6sPNI0WN+d9wym641g
         AWTTe0+O3sh+xbAUR1E5rg2s+AUlaFLI21cKGOVf8jugZVkrcKHENiOfoT23OuhPPC3m
         ZCoOoHhoRWgs+ZJLJeMfdFgd7BzTiwMWn7IgzJJkpD+C1hWit4JSx5jE+0QqQKEonoOJ
         MV9XDCu2jtc3GOuGKPzIzcQJeO88fNzDSB4GJRFNPJusgUNALpkVtuKs+1dg4TRaOOgv
         3eow==
X-Forwarded-Encrypted: i=1; AJvYcCWqCr3Lnir6XYCiTefjXK2PzVhJxnPt7AA9gbiEgunWESxmfY4Zv+HQVhy8XgfQZikxQ7hoB9cb8j4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5Pga8exOSamULeN6nIJmMbVl1I3sSAz/OGOhEldYJ4hekirVz
	l3XIHWyyg5SqcnLzH6Ph1R8Wb5P87N2atQpxe2dyCOykORAdqofufKkrtJ/VplI=
X-Gm-Gg: ASbGncs4w4DkKNL5J22Z5X7L7ZMrNBWG1EQwJHmwIXxlbPokQRbDQF0caLfpiHSq4nc
	tDxNZrDm+3Zi54J5H8nAQvdSYDQXOK8cfD6+++nBlCMwZ9gerjBG6jMddJk+DvYBCS+SnoUaKEx
	n4brZxlGL2Sj3/BWti6m/PbDr/MmgNcZCe2ly8T1fJoR4M/TOS/K/LUzG7b0V+rDzfo0Ui3wWtn
	yEoH58KIPyY9rx6HLJVHuT9qE9PbOutRVSPrIgQq9US6JeUhDP6q6xmHYUbROvxdyWZB0AB0teb
	epICPJ4vuHCAOkoPjsEvM7pfVS6AR0B/8bKiPoFcCltq2TYZgLhsiL4=
X-Google-Smtp-Source: AGHT+IGWh2pEgle/irg0C/CUM00/xQIommVW2MZdhgOZpOyebwdp0vHY/RtGkExib7V2R/tNv0BCZw==
X-Received: by 2002:a17:907:86ac:b0:ac2:8faa:e037 with SMTP id a640c23a62f3a-ac3b8068789mr753209266b.57.1742487711611;
        Thu, 20 Mar 2025 09:21:51 -0700 (PDT)
Date: Thu, 20 Mar 2025 17:21:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Nirmal Patel <nirmal.patel@linux.intel.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/3] xen: Fix usage of devices behind a VMD bridge
Message-ID: <Z9xAnusUbAiAHT7s@macbook.local>
References: <20250219092059.90850-1-roger.pau@citrix.com>
 <Z8lhR2DSsB8P6L96@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8lhR2DSsB8P6L96@macbook.local>

Ping x2?

Thanks, Roger.

On Thu, Mar 06, 2025 at 09:48:07AM +0100, Roger Pau Monné wrote:
> Hello,
> 
> I've attempted to ping Nirmal directly on the VMD patch, but got no
> reply so far.
> 
> First version of this series was posted on 10/01, yet there hasn't
> been any feedback from Nirmal.  Would it be possible to merge this
> without Nirmal Ack due to timeout?
> 
> It's not even a new feature, just a bugfix that allows running with
> VMD devices when using Xen.
> 
> Thanks, Roger.
> 
> On Wed, Feb 19, 2025 at 10:20:54AM +0100, Roger Pau Monne wrote:
> > Hello,
> > 
> > The following series should fix the usage of devices behind a VMD bridge
> > when running Linux as a Xen PV hardware domain (dom0).  I've only been
> > able to test PV. I think PVH should also work but I don't have hardware
> > capable of testing it right now.
> > 
> > I don't expect the first two patches to be problematic, the last patch
> > is likely to be more controversial.  I've tested it internally and
> > didn't see any issues, but my testing of PV mode is mostly limited to
> > dom0.
> > 
> > Thanks, Roger.
> > 
> > Roger Pau Monne (3):
> >   xen/pci: Do not register devices with segments >= 0x10000
> >   PCI: vmd: Disable MSI remapping bypass under Xen
> >   PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag
> > 
> >  arch/x86/pci/xen.c           |  8 ++------
> >  drivers/pci/controller/vmd.c | 20 +++++++++++++++++++
> >  drivers/pci/msi/msi.c        | 37 ++++++++++++++++++++----------------
> >  drivers/xen/pci.c            | 32 +++++++++++++++++++++++++++++++
> >  include/linux/msi.h          |  3 ++-
> >  kernel/irq/msi.c             |  2 +-
> >  6 files changed, 78 insertions(+), 24 deletions(-)
> > 
> > -- 
> > 2.46.0
> > 

