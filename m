Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E633B82C204
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 15:41:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666903.1037842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOIiA-00010E-A0; Fri, 12 Jan 2024 14:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666903.1037842; Fri, 12 Jan 2024 14:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOIiA-0000xP-7C; Fri, 12 Jan 2024 14:40:42 +0000
Received: by outflank-mailman (input) for mailman id 666903;
 Fri, 12 Jan 2024 14:40:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UAL2=IW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rOIi8-0000xI-E9
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 14:40:40 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d4b0ae0-b158-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 15:40:38 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so75610265e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 06:40:38 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c1c1100b0040c46719966sm9949056wms.25.2024.01.12.06.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:40:36 -0800 (PST)
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
X-Inumbo-ID: 8d4b0ae0-b158-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705070437; x=1705675237; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0WLkMv+Bv4decaU9ImEkTxl8k8dzoFw6XgyEPxak7mA=;
        b=WWhbsSPqXel0ND1y1u8Xq2LW4JnQRYVSCCnM/HFMKQeO9wIATStypWOJD5KPMab+Og
         7celGLjpZt8csUPaj2bXXhAbszt38P3C4oRWQ9jPS+qfEjbeo4qelRkyR8paevLrNlV2
         2PZm87hCtdZZA2/XGcNXumXQ7pSkkxYHLT0oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705070437; x=1705675237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0WLkMv+Bv4decaU9ImEkTxl8k8dzoFw6XgyEPxak7mA=;
        b=TapXcQoN1aakyiViJkanJ47wqJmM+W6hfBuy62O1G5i2ivm6OW0TrLSP5ggNMhAeth
         BeodxmEYMWnlAtDZ4Bq7VcT0R+H/XVsfsCKmsrmSr9uc59SFg1qLXCgs2GefhNhXm9kM
         5CmSyI3F02jBymXAzpJSGfRIZIkdpDDfABTpc9YU8pm4E5XM66wI6W3ofjTfBpSJgNLp
         duGVYe6mpT1M4U7fnFzOHQPLbfwKMvlHHPE0MFOEsX4ATsHXO4la8AgiT2I0IT7OLRhv
         VL5GnNzyML+DZvZpfrRg0b5B1cPwtlmJJmZ7yCwDoORBpq1QqefJtyL8tyYZ834YJzdW
         E1iA==
X-Gm-Message-State: AOJu0YwH2VNvYPKfQXd+CaEIioRYhIZHBVzEwurs0R0bEUCRfyguVp4N
	NEH/HAChCMpBe6ae0Ba2xdnHNGhoDEZyKw==
X-Google-Smtp-Source: AGHT+IFypSk3he7+ExpeN1ER61UgFNd+yXDwBbwa2YzeUoNWuRvUgWdj9BEYkMAIZbGOEMTXu6+mgQ==
X-Received: by 2002:a05:600c:2a18:b0:40e:4b04:d2b6 with SMTP id w24-20020a05600c2a1800b0040e4b04d2b6mr550911wme.207.1705070437633;
        Fri, 12 Jan 2024 06:40:37 -0800 (PST)
Date: Fri, 12 Jan 2024 14:40:35 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: don't expose XENFEAT_hvm_pirqs by default
Message-ID: <7e325111-5b36-4b31-aed8-f5f11390b504@perard>
References: <20240110124202.62843-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240110124202.62843-1-roger.pau@citrix.com>

On Wed, Jan 10, 2024 at 01:42:02PM +0100, Roger Pau Monne wrote:
> The HVM pirq feature allows routing interrupts from both physical and emulated
> devices over event channels, this was done a performance improvement.  However
> its usage is fully undocumented, and the only reference implementation is in
> Linux.  It defeats the purpose of local APIC hardware virtualization, because
> when using it interrupts avoid the usage of the local APIC altogether.
> 
> It has also been reported to not work properly with certain devices, at least
> when using some AMD GPUs Linux attempts to route interrupts over event
> channels, but Xen doesn't correctly detect such routing, which leads to the
> hypervisor complaining with:
> 
> (XEN) d15v0: Unsupported MSI delivery mode 7 for Dom15
> 
> When MSIs are attempted to be routed over event channels the entry delivery
> mode is set to ExtINT, but Xen doesn't detect such routing and attempts to
> inject the interrupt following the native MSI path, and the ExtINT delivery
> mode is not supported.
> 
> Disable HVM PIRQs by default and provide a per-domain option in xl.cfg to
> enable such feature.  Also for backwards compatibility keep the feature enabled
> for any resumed domains that don't have an explicit selection.
> 
> Note that the only user of the feature (Linux) is also able to handle native
> interrupts fine, as the feature was already not used if Xen reported local APIC
> hardware virtualization active.
> 
> Link: https://github.com/QubesOS/qubes-issues/issues/7971
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Should we have an entry in the changelog about this patch?

With the patch, we will need to regenerate the golang binding, at least
on commit.

Otherwise, patch looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

