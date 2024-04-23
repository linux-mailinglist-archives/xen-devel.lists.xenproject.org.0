Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D28AF36D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 18:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710890.1110421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIeF-00054x-K9; Tue, 23 Apr 2024 16:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710890.1110421; Tue, 23 Apr 2024 16:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIeF-00052i-Ha; Tue, 23 Apr 2024 16:05:35 +0000
Received: by outflank-mailman (input) for mailman id 710890;
 Tue, 23 Apr 2024 16:05:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=09RI=L4=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rzIeE-00052c-9C
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 16:05:34 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fac9918-018b-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 18:05:32 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41a0979b9aeso22182885e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 09:05:32 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c470b00b0041a963bf2cdsm4582313wmo.36.2024.04.23.09.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 09:05:31 -0700 (PDT)
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
X-Inumbo-ID: 4fac9918-018b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713888331; x=1714493131; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Q5YOP0rXj6VEA6DoK8C+uxFXSznjLoYHRToR6eId/Y=;
        b=JHyvaqZv4Po9XgkuVBOLIZkplj5dDcThyRmVE6/H2uvUEd2Y90dca8iP2GCENHMUw0
         uW6weLAQzMn0lxf958HXp4nlP9EHPwSX29OE8ePWcJmXntNml4RtVdUkLYifwzlJkLkh
         ChPsYzEe3OoGSu2Hmc3BUQ+eEPOZ0Yj+goExU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713888331; x=1714493131;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Q5YOP0rXj6VEA6DoK8C+uxFXSznjLoYHRToR6eId/Y=;
        b=w/YHelvtmN6pd2gyHhiWCRmsNY/194Sz7yxe+c+mURP2dub7AcZXtqKX5Y2mAoKZc0
         HypMyOAvljPDlcDp9g4DibgWIoTs/Od/7eR8xw45QOu60Dnpt7iNDMAQCd5L17yXFGT7
         PIFyuur8UKgsWNLvlV+EFRRZOzEVdXYTyT/hJYVU0DLVdlgUdd2LgNXCiB+fdHCQolaL
         J212sG6+sc95PNy4KYwpvCWsXzRaJ0KnlQak4CrLEQ9vQ/WvKL3FeiVU5MtC2sdmKdle
         CwNcPm4ThupVk+8KjiGu0rg6LqqHob47k/wYQEJDvMs4V3e+PG/O2f124dpres/hT/QF
         W8TA==
X-Gm-Message-State: AOJu0YyLaGq9+kIOA1Uhjtpma/u5q4HEtYD3Ke8ZPr80OtZ735wW0HmT
	FZAVaGvQW41wy61EXwtmOSWy/io4DL4Ll7JXRhcfXPjlHzViX0M5KaUWSUl4z4Q=
X-Google-Smtp-Source: AGHT+IFNPTuccVFjee0pTet3C3BhXDQ4MdmXMb8Dwi93NFYuUhDQRzM2VdNBHMFcmO+ODDY5UQqE4A==
X-Received: by 2002:a05:600c:1c1c:b0:419:ea21:2d83 with SMTP id j28-20020a05600c1c1c00b00419ea212d83mr9811797wms.0.1713888331603;
        Tue, 23 Apr 2024 09:05:31 -0700 (PDT)
Date: Tue, 23 Apr 2024 17:05:30 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v3 2/4] livepatch: introduce --force option
Message-ID: <f6df04b5-3285-467d-aedf-272ca0f2183f@perard>
References: <20240423131249.29825-1-roger.pau@citrix.com>
 <20240423131249.29825-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423131249.29825-3-roger.pau@citrix.com>

On Tue, Apr 23, 2024 at 03:12:47PM +0200, Roger Pau Monne wrote:
> Introduce a xen-livepatch tool --force option, that's propagated into the
> hyerpvisor for livepatch operations.  The intention is for the option to be
> used to bypass some checks that would otherwise prevent the patch from being
> loaded.
> 
> Re purpose the pad field in xen_sysctl_livepatch_op to be a flags field that
> applies to all livepatch operations.  The flag is currently only set by the
> hypercall wrappers for the XEN_SYSCTL_LIVEPATCH_UPLOAD operation, as that's so
> far the only one where it will be used initially.  Other uses can be added as
> required.
> 
> Note that helpers would set the .pad field to 0, that's been removed since the
> structure is already zero initialized at definition.
> 
> No functional usages of the new flag introduced in this patch.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

For the tools:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

