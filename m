Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA92832AA9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 14:42:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669052.1041642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQp8m-0001ts-0J; Fri, 19 Jan 2024 13:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669052.1041642; Fri, 19 Jan 2024 13:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQp8l-0001qW-Sg; Fri, 19 Jan 2024 13:42:35 +0000
Received: by outflank-mailman (input) for mailman id 669052;
 Fri, 19 Jan 2024 13:42:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xVsr=I5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQp8k-0001q9-QN
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 13:42:34 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98b8a200-b6d0-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 14:42:32 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e913e3f03so8918945e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 05:42:32 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c470400b0040e5945307esm29308109wmo.40.2024.01.19.05.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 05:42:32 -0800 (PST)
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
X-Inumbo-ID: 98b8a200-b6d0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705671752; x=1706276552; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hs7dwlUBPz9cZp16YJ/Cd9oFx062tW1i5m/v8g2rnFM=;
        b=fJjFGZ6K8Wt/BFyb/PIZCGfYablduF4mNzT9zBqn37/2aeGh+ZxRTIHhTiEqR6N3+a
         Fw7MH3ismZ5q2UEQJN6nPLkohbv7pgHp6v0SPbIuq7JGSrpNiQsX33ekY+uR+TdYlIe8
         s0sVL96B96/oaAdPlETfLmTEPL10ZH14pvSKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705671752; x=1706276552;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hs7dwlUBPz9cZp16YJ/Cd9oFx062tW1i5m/v8g2rnFM=;
        b=ZFSvUsPwM5poc00Ef6v3zZ9yVARx2hk5q0r6mVZxAEXfjFD0Enr862oGUojejhcUSZ
         BoLQCYE0kWfRH37gUmsEoIRKrasQFhbYLC0vOVPDKqc3ld9NIgJppHNoMqfnvUqfMWs+
         rzx+eRF3RvHeDK+QiJVI/4saYyUix8lKSB9gEIIS+mXASKt207O5LVG9EdZlqCkvsffs
         BVOHD1sbygs9JMcSdCsWvnwzFSi6RYmudT7AdmJL14kgwQ20ZVea60zTXSKX4ubTMRKL
         dY6q2dJI7GQDXynwkzmxblOH7E6Ao2CSG3GEl3Zjt/ElYABKgP5wcpGGFxgDiPisiXtJ
         k00Q==
X-Gm-Message-State: AOJu0Yy7wAn9TpSCOXxzgP/YSlFXVRNPGnS7+ynX6ewHWnO63E5D+AyC
	edkv6ysoF8GZCAvt2JEr25Y7xZj+WFP3vhq03JoQD04fOWMrHK+uxJeIWK97V9U=
X-Google-Smtp-Source: AGHT+IHKwgO+RxZjEi4/Xwu1G8MFLxP2Ix4AouNushWf1EGo33bHUigAGOLN5XJvlgMeu3P9aWyrWA==
X-Received: by 2002:a1c:4b11:0:b0:40e:4133:44da with SMTP id y17-20020a1c4b11000000b0040e413344damr1688353wma.26.1705671752239;
        Fri, 19 Jan 2024 05:42:32 -0800 (PST)
Date: Fri, 19 Jan 2024 14:42:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect
 vpci structure
Message-ID: <Zap8R5Q0wTPQ3lOP@macbook>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240115194309.45683-1-stewart.hildebrand@amd.com>

On Mon, Jan 15, 2024 at 02:43:08PM -0500, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Use the per-domain PCI read/write lock to protect the presence of the
> pci device vpci field. This lock can be used (and in a few cases is used
> right away) so that vpci removal can be performed while holding the lock
> in write mode. Previously such removal could race with vpci_read for
> example.
> 
> When taking both d->pci_lock and pdev->vpci->lock, they should be
> taken in this exact order: d->pci_lock then pdev->vpci->lock to avoid
> possible deadlock situations.
> 
> 1. Per-domain's pci_lock is used to protect pdev->vpci structure
> from being removed.
> 
> 2. Writing the command register and ROM BAR register may trigger
> modify_bars to run, which in turn may access multiple pdevs while
> checking for the existing BAR's overlap. The overlapping check, if
> done under the read lock, requires vpci->lock to be acquired on both
> devices being compared, which may produce a deadlock. It is not
> possible to upgrade read lock to write lock in such a case. So, in
> order to prevent the deadlock, use d->pci_lock in write mode instead.
> 
> All other code, which doesn't lead to pdev->vpci destruction and does
> not access multiple pdevs at the same time, can still use a
> combination of the read lock and pdev->vpci->lock.
> 
> 3. Drop const qualifier where the new rwlock is used and this is
> appropriate.
> 
> 4. Do not call process_pending_softirqs with any locks held. For that
> unlock prior the call and re-acquire the locks after. After
> re-acquiring the lock there is no need to check if pdev->vpci exists:
>  - in apply_map because of the context it is called (no race condition
>    possible)
>  - for MSI/MSI-X debug code because it is called at the end of
>    pdev->vpci access and no further access to pdev->vpci is made
> 
> 5. Use d->pci_lock around for_each_pdev and pci_get_pdev_by_domain
> while accessing pdevs in vpci code.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

