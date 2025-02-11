Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF21A31435
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 19:39:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885861.1295660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thvAe-0004px-1D; Tue, 11 Feb 2025 18:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885861.1295660; Tue, 11 Feb 2025 18:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thvAd-0004ng-Ua; Tue, 11 Feb 2025 18:39:43 +0000
Received: by outflank-mailman (input) for mailman id 885861;
 Tue, 11 Feb 2025 18:39:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thvAd-0004na-9l
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 18:39:43 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8da3c129-e8a7-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 19:39:41 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-21f4af4f9ddso69998645ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 10:39:41 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048bf143dsm9657721b3a.118.2025.02.11.10.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 10:39:39 -0800 (PST)
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
X-Inumbo-ID: 8da3c129-e8a7-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739299180; x=1739903980; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MvOMFGVSXHFORIqeWB79XTPXbin0iZOuP7KRfrKc+JY=;
        b=t1QaUvHVOMlVdAyTNOI4zV8fsZM9be6T0iMOJpZoWpwi2+tvu2nBVQuCCaaR5tstFH
         5urvNftO/W1+d6wwuxVTY8VFaR/Gk7rVDIasiJ+AjBb/Pa34hY2wpYaCEaItg2RH60ET
         ymUXvXQe4LBRDvzhqnwm3xWt1QXsg6SIOmjdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739299180; x=1739903980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvOMFGVSXHFORIqeWB79XTPXbin0iZOuP7KRfrKc+JY=;
        b=GCf+AZRFsOpqtmHW9tzY8/rbQSR5H//1UlhJ3O0l8RjVEFv+fpHovp2vHVCimk/mBM
         WNgd/PAsAmNpI3QxJhSpgmTmIo589Jk3Q9ytP5KMFbVUKk0QRYQ+uo57T1JvHvfkqZpJ
         7ztj4iUvIGJ4+zLVOfT41Oi3rEA2uXc6ThNxCZOtK42eMrBLSsXp7rlXEp53Or/aXCOJ
         yIYRX7f6OEUiAK7TDDYllcgJsCNBJoShSISdubtEG11NeNkAfafi0RIaFPgyfS3i5dIQ
         2wPMRfRa+ZrE1YVTa6/015uh+H+UgeSVGxcHTfBC8ZRR9ymmB/nWFcpdA6Kh4VgQ3DfG
         FFTw==
X-Gm-Message-State: AOJu0YwwhBAhe1Hvd4tVG52XN7pVsPnTWfPXqDrBxWKHqlpOVrioU0j1
	VJ8P9RQxeLWP1WyavYr2YiGMA0wPZlxX41fpHnxJUPz4vAp31Fhb3jS0PaVmLfI=
X-Gm-Gg: ASbGncsmG6g53LpoyIGbr0Ykrk/XMrXbIe+MDb54gCVdSDrK4ELKlPchlgFW4HEUY8L
	PDhwRI88SGNy04ba2hslkEFPuo0cAcOZo+xcsZeAtrMM7cEVbZdBOcfRa5ICwI5j38KEhedxBmO
	M5fPrbQ8+7gpt+CXHS2407etedJZ1KULrEB5GIrjYmjMhtmcJr51L061fFhwd4P9cJanhuoozGz
	eL6HXYe/olPhO/1uhJZXKBKi3O8yqT17iYcuhl0uULNYLAd5p86qEm6rZPy7HkSpItRFJfsrTLm
	3W8NVuV4K0X9rfFCQgk423up0A==
X-Google-Smtp-Source: AGHT+IF6ywFrmytxCSsAeLA9ObMFCFPtz6DnS6JtMAT9ZsPK1l58IDcGh5U135kEtNqpIFEUa+xruw==
X-Received: by 2002:a05:6a00:2348:b0:725:e37d:cd36 with SMTP id d2e1a72fcca58-7322c3719dbmr50936b3a.2.1739299179931;
        Tue, 11 Feb 2025 10:39:39 -0800 (PST)
Date: Tue, 11 Feb 2025 19:39:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: oleksii.kurochko@gmail.com
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.20 v3 0/5] xen/x86: prevent local APIC errors at
 shutdown
Message-ID: <Z6uZZrR9XvTFjtO9@macbook.local>
References: <20250211110209.86974-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250211110209.86974-1-roger.pau@citrix.com>

On Tue, Feb 11, 2025 at 12:02:04PM +0100, Roger Pau Monne wrote:
> Hello,
> 
> The following series aims to prevent local APIC errors from stalling the
> shtudown process.  On XenServer testing we have seen reports of AMD
> boxes sporadically getting stuck in a spam of:
> 
> APIC error on CPU0: 00(08), Receive accept error
> 
> Messages during shutdown, as a result of device interrupts targeting
> CPUs that are offline (and have the local APIC disabled).
> 
> First patch strictly solves the issue of shutdown getting stuck, further
> patches aim to quiesce interrupts from all devices (known by Xen) as an
> attempt to prevent a spurious "APIC error on CPU0: 00(00)" plus also
> make kexec more reliable.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (5):
>   x86/shutdown: offline APs with interrupts disabled on all CPUs
>   x86/irq: drop fixup_irqs() parameters
>   x86/smp: perform disabling on interrupts ahead of AP shutdown
>   x86/pci: disable MSI(-X) on all devices at shutdown
>   x86/iommu: disable interrupts at shutdown

This is now fully reviewed, can I get your opinion (and
release-acked-by) on which patches we should take for 4.20?

Thanks, Roger.

