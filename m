Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7F99459BC
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 10:16:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770365.1181269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnSW-0008UK-A2; Fri, 02 Aug 2024 08:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770365.1181269; Fri, 02 Aug 2024 08:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnSW-0008TB-70; Fri, 02 Aug 2024 08:16:20 +0000
Received: by outflank-mailman (input) for mailman id 770365;
 Fri, 02 Aug 2024 08:16:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAnW=PB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZnKl-0006cp-6U
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 08:08:19 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f81108e-50a6-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 10:08:17 +0200 (CEST)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-6b79c27dd01so44089106d6.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 01:08:17 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c79c147sm4759046d6.51.2024.08.02.01.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 01:08:15 -0700 (PDT)
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
X-Inumbo-ID: 5f81108e-50a6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722586096; x=1723190896; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6nQqqL5en1b240ZJA1HISwDrCWaKk6/SK8XO6tb2Q+4=;
        b=VZxzq6BnDnsB9a849mhrgncHwljlvWknQr5yQZniZFS9z77rFfAsYB5CcYnxLrhcK2
         gDZrhiHLXbr5pQ1APWjcoXOawn3ARg1IxVRKDuaMIUKAY5JUApEdXHXdg/647jnUnxM+
         SxfAWNCP/DO9oCAWUZVI73d6k33S7+tlVnh00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722586096; x=1723190896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nQqqL5en1b240ZJA1HISwDrCWaKk6/SK8XO6tb2Q+4=;
        b=IUbKT1UJLoom4hFVznHxc9yHpK2k03yhv7uiQqjH88QgBiaH7HEhFCiUuV0kWwUB1S
         uAJIuu7wMF18jyQhXorRuJ/o3nmkfrYrHe4RAzXMuGgKpmWw/qMLX1Jprh7Tn0sOs4qb
         OahBx5FuMrPwtIkCegqy8Rb0Nl5XQRg38HAWUMpE6ZZmI4chN+BQHh4xwlm8elqKcJcE
         OE7+/8qNbRXNZF0KjhRz9/Is+r9EMKay8i2GTbvN5WyKMZgab83aatuS1aJfkHrtcZPD
         sN1cCY8m05v1fZngXKuPfLKBtk6S+i/s94y2vWLAShEckw8YuD75k4kCck7APve7L+II
         8ISg==
X-Gm-Message-State: AOJu0Yw0roflhlcDsAoshj/hlDZp5m/xvN8ruljk7Ck/mPbG3ljrkl2i
	6Hikn3zzFNg1Qt0SG+BMXASWTsH6xdpGGoKGo93DCZzUD0QT71DqclljA32eCyw=
X-Google-Smtp-Source: AGHT+IGx4dAd7/EMrUoSggR9VL0inspdakRiSuh9sMigQhFJRPpe9n9F4/E2zauUZW1oudqtueZqvQ==
X-Received: by 2002:a05:6214:4a02:b0:6b7:9fe3:b2be with SMTP id 6a1803df08f44-6bb984351a0mr38460596d6.53.1722586096257;
        Fri, 02 Aug 2024 01:08:16 -0700 (PDT)
Date: Fri, 2 Aug 2024 10:08:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Message-ID: <ZqyT7ocbP6AZEb_S@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240708114124.407797-5-Jiqian.Chen@amd.com>

On Mon, Jul 08, 2024 at 07:41:21PM +0800, Jiqian Chen wrote:
> Some type of domains don't have PIRQs, like PVH, it doesn't do
> PHYSDEVOP_map_pirq for each gsi. When passthrough a device
> to guest base on PVH dom0, callstack
> pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
> domain_pirq_to_irq, because PVH has no mapping of gsi, pirq and
> irq on Xen side.
> What's more, current hypercall XEN_DOMCTL_irq_permission requires
> passing in pirq to set the access of irq, it is not suitable for
> dom0 that doesn't have PIRQs.
> 
> So, add a new hypercall XEN_DOMCTL_gsi_permission to grant/deny
> the permission of irq(translate from x86 gsi) to dumU when dom0
> has no PIRQs.

I've been wondering about this, and if the hypercall is strictly to
resolve GSIs into IRQs, isn't that the case that Xen identity maps GSI
into the IRQ space, and hence no translation is required?

Thanks, Roger.

