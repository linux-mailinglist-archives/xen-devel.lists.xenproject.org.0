Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF48A8BCF80
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 15:54:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717673.1120109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3ymd-0007Wl-Vl; Mon, 06 May 2024 13:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717673.1120109; Mon, 06 May 2024 13:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3ymd-0007UE-SW; Mon, 06 May 2024 13:53:35 +0000
Received: by outflank-mailman (input) for mailman id 717673;
 Mon, 06 May 2024 13:53:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3ymc-0007Tp-8N
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 13:53:34 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 061c6ecc-0bb0-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 15:53:31 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41b79451145so14110835e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 06:53:31 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 p12-20020adfe60c000000b0034ccd06a6a3sm10781264wrm.18.2024.05.06.06.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 06:53:30 -0700 (PDT)
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
X-Inumbo-ID: 061c6ecc-0bb0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715003611; x=1715608411; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IzWay8SvDuFicV4e9SxZxNL2/VKrxE94L4zRP/ZhYDo=;
        b=XfiluBt3L8LzrXx44oKBzqxE9qYS4AdGITyUpe/KSDbtCI3JPwzjp4HSnl1B4YYq9b
         pKVIZTKvQm9SW54pFSUVM9rSSPS80/EDSF/aN8FZdf1xcEphvkg+92IaG5njKH1/0WBd
         JhQ4P0DJxVxWrNiCuAqeGTKfi6RboGljInE5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715003611; x=1715608411;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzWay8SvDuFicV4e9SxZxNL2/VKrxE94L4zRP/ZhYDo=;
        b=YSYBgpf728/kW4vzARetMuGUF9IVzMZDR6H+652sdq4IbsiTk7E1pAsw6CWuEpnuFR
         a1y9vO0PM0cc3TT8HMk2mqDjZ/mkL7mRNoSBRjF4FU20+uVS0+JNH7vabR50BMPDRNr8
         dr3vHIqzvdH5lNH7JvSyyG4MPo27y+fAkwlc08h+23eskNVTE/3SByvcW2hmxYiMLmoo
         ldvr9iX+8UJP5iHeRdDsTWG8XMjJ07cflD+4YfAP6FbWjGTwSOtilyj8Rg5o10bdcvl6
         krapo91R3W0tKmfXcd2tbtzSj5qcU3Bq4vcPtSb2BXrUK05aXHFJVuyIr+Ko4H11t6gH
         it3A==
X-Gm-Message-State: AOJu0Yw+CdGuDrrfY906Hzy+Mq29m8kfnbdWMVnCh+i5RSKf23QytTgA
	RnC9DLyIAUbDLkt17dZwPnv49/PaVOnNrl1VR6bod5C2M8+NjDFRO4JCm8HzQBk=
X-Google-Smtp-Source: AGHT+IECXGdbR1PYnK/N65eDMHZTdJDAYaRVnuIIuJiDv+0mZpEiiAj6edJsFQ7AJXcAOdeddrVUfA==
X-Received: by 2002:a05:6000:36f:b0:343:7b6b:dcc6 with SMTP id f15-20020a056000036f00b003437b6bdcc6mr6306378wrf.30.1715003611140;
        Mon, 06 May 2024 06:53:31 -0700 (PDT)
Date: Mon, 6 May 2024 15:53:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 05/12] IOMMU: rename and re-type ats_enabled
Message-ID: <Zjjg2ueqgjmn-MS3@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <7f11ca06-9bed-443b-9c79-0e62b71a1f96@suse.com>
 <ZjjQIaxEwS6b-swj@macbook>
 <24d52bbb-1329-4f8a-81be-505a35969875@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24d52bbb-1329-4f8a-81be-505a35969875@suse.com>

On Mon, May 06, 2024 at 03:20:38PM +0200, Jan Beulich wrote:
> On 06.05.2024 14:42, Roger Pau Monné wrote:
> > On Thu, Feb 15, 2024 at 11:15:39AM +0100, Jan Beulich wrote:
> >> Make the variable a tristate, with (as done elsewhere) a negative value
> >> meaning "default". Since all use sites need looking at, also rename it
> >> to match our usual "opt_*" pattern. While touching it, also move it to
> >> .data.ro_after_init.
> > 
> > I guess I need to look at further patches, as given the feedback on
> > the past version I think we agreed we want to set ATS unconditionally
> > disabled by default, and hence I'm not sure I see the point of the
> > tri-state if enabling ATS will require an explicit opt-in on the
> > command line (ats=1).
> 
> With the present wording in the VT-d spec (which we've now had vague
> indication that it may not be meant that way) there needs to be
> tristate behavior:
> - With "ats=0" ATS won't be used.
> - With "ats=1" ATS will be used for all ATS-capable devices.
> - Without either option ATS will be used for devices where firmware
>   mandates its use.

I'm afraid I don't agree to this behavior.  Regardless of what the
firmware requests ATS must only be enabled on user-request (iow: when
the ats=1 command line option is passed).  Otherwise ATS must remain
disabled for all devices.  It's not fine for firmware to trigger the
enabling of a feature that's not supported on Xen.

> >> @@ -196,7 +196,7 @@ static int __must_check amd_iommu_setup_
> >>          dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
> >>  
> >>          if ( use_ats(pdev, iommu, ivrs_dev) )
> >> -            dte->i = ats_enabled;
> >> +            dte->i = true;
> > 
> > Might be easier to just use:
> > 
> > dte->i = use_ats(pdev, iommu, ivrs_dev);
> 
> I'm hesitant here, as in principle we might be overwriting a "true" by
> "false" then.

Hm, but that would be fine, what's the point in enabling the IOMMU to
reply to ATS requests if ATS is not enabled on the device?

IOW: overwriting a "true" with a "false" seem like the correct
behavior if it's based on the output of use_ats().

> >> @@ -257,7 +257,7 @@ static int __must_check amd_iommu_setup_
> >>                                           ACPI_IVHD_SYSTEM_MGMT));
> >>  
> >>          if ( use_ats(pdev, iommu, ivrs_dev) )
> >> -            ASSERT(dte->i == ats_enabled);
> >> +            ASSERT(dte->i);
> > 
> > ASSERT(dte->i == use_ats(pdev, iommu, ivrs_dev));
> 
> I'm okay switching here, but better to the precise logical equivalent of
> the earlier code:
> 
> ASSERT(dte->i || !use_ats(pdev, iommu, ivrs_dev));

Hm, I see.  I think we should be more strict with this (see my
previous comment), but we could defer to a later change.

> 
> >> @@ -43,7 +43,7 @@ static inline int pci_ats_enabled(int se
> >>  
> >>  static inline int pci_ats_device(int seg, int bus, int devfn)
> >>  {
> >> -    if ( !ats_enabled )
> >> +    if ( !opt_ats )
> >>          return 0;
> > 
> > Can't you remove that check altogether now, since you are adding an
> > opt_ats check to use_ats()?
> 
> Two reasons why not: For one this isn't AMD-specific code, and hence
> shouldn't be tied to the AMD-specific use_ats(). In principle VT-d
> code should be okay to call here, too. And then
> amd_iommu_disable_domain_device() doesn't use use_ats(), but does call
> here.

Oh, that's confusing, I didn't realize use_ats was AMD specific code.
It should have some kind of prefix to avoid this kind of confusion.

Thanks, Roger.

