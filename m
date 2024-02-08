Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0592E84E6D6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 18:32:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678453.1055763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY8FU-0001tA-C5; Thu, 08 Feb 2024 17:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678453.1055763; Thu, 08 Feb 2024 17:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY8FU-0001qY-8r; Thu, 08 Feb 2024 17:31:44 +0000
Received: by outflank-mailman (input) for mailman id 678453;
 Thu, 08 Feb 2024 17:31:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mdps=JR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rY8FT-0001qS-6Y
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 17:31:43 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb64a81c-c6a7-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 18:31:40 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cf5917f049so1365131fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 09:31:40 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 cx12-20020a170907168c00b00a3bcfe76170sm119527ejd.2.2024.02.08.09.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 09:31:39 -0800 (PST)
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
X-Inumbo-ID: eb64a81c-c6a7-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707413500; x=1708018300; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vOKqfPtYD5AX98Cbs2+YqThcOaVb5WkLWqN42uxEHYI=;
        b=TO1JA352brXbB/BjrU1fEFcrlH508zQouWQH0+elaSClbqLJ5x5LM05mUz7594OWs3
         jt4tjIg/Ua5uP3dV/YS0iKz016tKXTzsx9Vc7/1HjOUZSLvLbxuj8JBPGoa/mSBiQZqg
         2q+22xZ7KIMgqSHq2Su/olhva/fl1TZcm6A3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707413500; x=1708018300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOKqfPtYD5AX98Cbs2+YqThcOaVb5WkLWqN42uxEHYI=;
        b=cn77FoXWdvIJqGY6RGC8i5zPKXf22B4qw7Rz9awTGGK4RpWBNyLbOkRwTmgtQJgf2T
         HgMYhgiz9pRW97YR7QgCROqXgOC5nU/zAlN9jFi1AaxZjKTbBEuNrGILEWgUgvBkRG8W
         gzHhQ7AfsVsn3H9YalRCalSIIEAcw5U+XIMKNH9RZMW5pmiLHwMSUZCdDmLtUYlVFCA+
         SnsNbg3GdrL2XPuo6d/rjQNvtyb90ModfVvH18zX7Ea7IxJk+9mVfHwMICg1A5Ktk2WS
         XuUP8X+w+Sopz8rYPPVDrsHJL3MLjc4eFP8oEgvWkoW+ccD4HedUB+Djm4DNc2animLQ
         Y7NA==
X-Gm-Message-State: AOJu0YzGXqkWYehKa1u+ZE6DLYx69k5G59xR60wmuLrhyxiLsKBdjIUp
	gouKh3HeJcyAPergPdlaUEbrFviYVLfqQtRIEzXooiqbFoecKZihlt2ljim9rkg=
X-Google-Smtp-Source: AGHT+IFxextErh7M4gWfyaT2Njuy6Op6P/1y8aX0KQoW/JbjiHrsZ2ob/M+5aa+NeuPTyWFxxNQLBA==
X-Received: by 2002:a2e:9211:0:b0:2d0:aafc:914c with SMTP id k17-20020a2e9211000000b002d0aafc914cmr28432ljg.1.1707413500051;
        Thu, 08 Feb 2024 09:31:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5yA5s0TRpr2zJQPNryhdwWB1slmgWyKG9LI2WcZbw8wiLp2e9+7DVsCXp1IR4MTuOBdld1gwN/7zC1ho5Tk7RebNHZ/g6ADwmQHbhMlKOoweh
Date: Thu, 8 Feb 2024 18:31:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 4/7] VT-d: replace find_ats_dev_drhd()
Message-ID: <ZcUP-t5gFx2v31at@macbook>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <a75bef32-8bbb-4471-b26b-981b06173cd5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a75bef32-8bbb-4471-b26b-981b06173cd5@suse.com>

On Mon, Feb 05, 2024 at 02:56:36PM +0100, Jan Beulich wrote:
> All callers only care about boolean outcome. For this there's no point
> in allocating a duplicate of the respective DRHD structure; a simple
> boolean suffices (which eventually may wantg to become a count, such
                                         ^ want
> that the "any ATS devices assigned state" can also clear again). With
> that boolean, remove respective parameters from internal helper
> functions right away, as those have access to the flag through another
> parameter.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

AFAICT the intention is that this is a non-functional change?

> 
> --- a/xen/drivers/passthrough/vtd/extern.h
> +++ b/xen/drivers/passthrough/vtd/extern.h
> @@ -65,8 +65,6 @@ struct acpi_drhd_unit *ioapic_to_drhd(un
>  struct acpi_drhd_unit *hpet_to_drhd(unsigned int hpet_id);
>  struct acpi_rhsa_unit *drhd_to_rhsa(const struct acpi_drhd_unit *drhd);
>  
> -struct acpi_drhd_unit *find_ats_dev_drhd(struct vtd_iommu *iommu);
> -
>  int ats_device(const struct pci_dev *, const struct acpi_drhd_unit *);
>  
>  int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16 did,
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -624,8 +624,7 @@ int cf_check vtd_flush_iotlb_reg(
>  }
>  
>  static int __must_check iommu_flush_iotlb_global(struct vtd_iommu *iommu,
> -                                                 bool flush_non_present_entry,
> -                                                 bool flush_dev_iotlb)
> +                                                 bool flush_non_present_entry)
>  {
>      int status;
>  
> @@ -633,7 +632,7 @@ static int __must_check iommu_flush_iotl
>      vtd_ops_preamble_quirk(iommu);
>  
>      status = iommu->flush.iotlb(iommu, 0, 0, 0, DMA_TLB_GLOBAL_FLUSH,
> -                                flush_non_present_entry, flush_dev_iotlb);
> +                                flush_non_present_entry, iommu->flush_dev_iotlb);

Any reason to not also remove the parameter from here also?  As the handler
gets iommu passed as the first parameter anyway.

Thanks, Roger.

