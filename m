Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92286A60B29
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913938.1319782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0IS-0003mT-Gg; Fri, 14 Mar 2025 08:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913938.1319782; Fri, 14 Mar 2025 08:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0IS-0003jw-DT; Fri, 14 Mar 2025 08:21:36 +0000
Received: by outflank-mailman (input) for mailman id 913938;
 Fri, 14 Mar 2025 08:21:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OT8H=WB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tt0IR-0003jq-JL
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:21:35 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 574f4879-00ad-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 09:21:34 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so2988106a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:21:34 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e816afc8aasm1722550a12.65.2025.03.14.01.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 01:21:33 -0700 (PDT)
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
X-Inumbo-ID: 574f4879-00ad-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741940494; x=1742545294; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HStr08WdE8uiWr9BK6ptSHnc3HyVIpz+2wDbEy6ATws=;
        b=Lr6u8mb5I5frhBkBrrkEaAXRriMeMoS4mV16O0YDNnbAT/L4+HibL/2OEBWWoFAWPc
         v7jgvCklDf7LciDpIiOqFUT5pmDKIUNCs/NfdDSoTkKMD46JEGsf07RX0RuPMNwdQ39d
         fDRhB6IHrIAaU3+T4a0cvvr8+b+U+b0cEspOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940494; x=1742545294;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HStr08WdE8uiWr9BK6ptSHnc3HyVIpz+2wDbEy6ATws=;
        b=fcgofkO+dEUIk1WvKIJD7HOXdSiUdd8eLScwPBf8W65Bf1jK2EFsL6ltoumGlfn+GW
         G/NyvmebCWTISe/F89zdH0plU0T5uOnzOu7HtyOEnpgbFyLlobdEQFCxlJ1bGH7IA3Wn
         Dar2h3dFbZmZd8zIGyqdnOCiGP4F2uis2XqYjm6kbHsXiJLHESZXfW1FPKMbwlFSEcRS
         HbzFL+MWYHKOUdNfYX/+f1w1qgsMqkMykjSvNNFW7wh/oxp4A6Q5nfALIhzAY7D9aDSs
         yawBT2eBBDdvhkpr2rpo8hoRtF/kRpMuRYtBsgxtnA/3rSt0Jwpy8khqnk4rOQTcnNET
         9Fqw==
X-Gm-Message-State: AOJu0YwG6hzOrprfe/z3dR/JZKCG3lTzdIIFtbABLsxyIV+0J06cs90V
	+amV+LUW0V1dDVZ4kBScwFUzAuBANaSXygYoND3h7mM2X1hU8ZK2AWJDx200gc4=
X-Gm-Gg: ASbGnctTe8FviC2f/s4ieJZM6hqXNC3LTFMLLAYNVwZctP7u4J8oRJ0OPNquT2nMa4d
	w6q7i8E7aIm7qX8DMQcntXT4+RkqNUHcuFg9sB1p0vm8c8DHHShAiP16g6kpGG6AZBMxQV2rQFs
	2F71/dhTNSLlD/FULlF4DC3aYa++shTCrYhnIUNSiT3r7+l5oL7BxHctw5QZpGdoVdDtqaUL0fn
	nZEKp2QXbmEKZi+goGTjKK0BY6aFUsn1CPed+AL6Lc0r3HfTd+5tGSgcfEPHxUAhlD1kzdaOSii
	XAYMa3qvrkFq7dzfIeS8AB+X6LGizwEfaq49ahLFfjVLd1Ps7A==
X-Google-Smtp-Source: AGHT+IFVGyMzOLHLr6ADs5XXH3I5NysdD+84JGs+8M+Pu/+DzANyVwL54UnRXshczg9eX7K3QRRKOA==
X-Received: by 2002:a05:6402:c8a:b0:5e6:17d7:9a32 with SMTP id 4fb4d7f45d1cf-5e89fa3a292mr1506504a12.18.1741940493850;
        Fri, 14 Mar 2025 01:21:33 -0700 (PDT)
Date: Fri, 14 Mar 2025 09:21:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH] [RFC] vpci: allow BAR write while mapped
Message-ID: <Z9PnDOn4t0vzApaQ@macbook.local>
References: <20250312195019.382926-1-stewart.hildebrand@amd.com>
 <Z9MaZVMtI86eAmDJ@macbook.local>
 <9e619631-a7f7-4f69-aff8-13202d61b79a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e619631-a7f7-4f69-aff8-13202d61b79a@suse.com>

On Fri, Mar 14, 2025 at 09:04:55AM +0100, Jan Beulich wrote:
> On 13.03.2025 18:48, Roger Pau Monné wrote:
> > On Wed, Mar 12, 2025 at 03:50:17PM -0400, Stewart Hildebrand wrote:
> >> @@ -585,10 +601,31 @@ static void cf_check bar_write(
> >>      {
> >>          /* If the value written is the current one avoid printing a warning. */
> >>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> >> +        {
> >>              gprintk(XENLOG_WARNING,
> >> -                    "%pp: ignored BAR %zu write while mapped\n",
> >> +                    "%pp: allowing BAR %zu write while mapped\n",
> >>                      &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> > 
> > If Xen now handles BARs writes with memory decoding enabled the
> > message can be removed.  It's only purpose was to signal this missing
> > handling.
> > 
> >> -        return;
> >> +            ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> >> +            ASSERT(spin_is_locked(&pdev->vpci->lock));
> >> +            reenable = true;
> >> +            cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> >> +            /*
> >> +             * Write-while-mapped: unmap the old BAR in p2m. We want this to
> >> +             * finish right away since the deferral machinery only supports
> >> +             * unmap OR map, not unmap-then-remap. Ultimately, it probably would
> >> +             * be better to defer the write-while-mapped case just like regular
> >> +             * BAR writes (but still only allow it for 32-bit BAR writes).
> >> +             */
> >> +            /* Disable memory decoding */
> >> +            modify_bars(pdev, cmd & ~PCI_COMMAND_MEMORY, false);
> > 
> > I think if the guest explicitly avoids toggling memory decoding Xen
> > should also to the same, and not touch the bit.
> 
> For Dom0 I'm inclined to agree, but for DomU-s it may be unsafe to do so.
> (You may have meant it like this, but you said "guest".)

Sorry, I'm not sure I'm following.  For domUs the BAR register write
is not propagated to the hardware, it's just the p2m mappings that
change, and hence it's even safer to not toggle the memory decoding
bit for that case? (as there's no write to the device BAR registers
for domUs).

Maybe there's some aspect I'm missing.

Thanks, Roger.

