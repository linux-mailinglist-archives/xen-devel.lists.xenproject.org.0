Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE67A3B51D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 09:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892479.1301447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkfqB-0002Ya-UP; Wed, 19 Feb 2025 08:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892479.1301447; Wed, 19 Feb 2025 08:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkfqB-0002Wz-RX; Wed, 19 Feb 2025 08:53:59 +0000
Received: by outflank-mailman (input) for mailman id 892479;
 Wed, 19 Feb 2025 08:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQLC=VK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkfqA-0002Wt-DU
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 08:53:58 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d539994-ee9f-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 09:53:57 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-220d132f16dso93096355ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 00:53:57 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5367ecbsm101505775ad.59.2025.02.19.00.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:53:55 -0800 (PST)
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
X-Inumbo-ID: 0d539994-ee9f-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739955235; x=1740560035; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KgYUeCdQpGyTjNOQm4bK6NBaw01hnN8RvlwAlNtxFqs=;
        b=HaOAb8qqHUeg3EpKEVcGp1vuu99rl+aKDChgLew4dPao9DTgUjVABewYaN5wstYXE7
         QoTJhdQ7tEqEKHjV+7ggb9Y/HUomfUqtAe8oP9ZFmMUItXjZM127O2JSek4gm1ErD2m3
         tV+Cpwga/8UwWp0pYJZk53fgsku0smhmmQksg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955235; x=1740560035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgYUeCdQpGyTjNOQm4bK6NBaw01hnN8RvlwAlNtxFqs=;
        b=RwceC47UICVEnI6/+Hzw++BxF2jXzlTugCCQT/vTxs2PKpbFA4GKKUwUqZVFkoBR2p
         Op2lUPCFPjK2KRZLSTo7ymK93dGYvBaqKrgYgrE9gB5AwGLZIoa34XUYcmPk6fmDVTqA
         fgJC01H9Ii2y+f1KCxYdbqSO9VewZ0YFePbqWZf+XJlX8WU7IFrqIYz7EwyptuthUJX0
         mRpXYjJrohiORJMbsalNizkoI/cBzaD4nz9Zo3qHSbovkiR6nTyPQj+JHiddPeXE3kHr
         oCCW5U02pDZEPuvfoCUKCUR8wMwC20Dfk83yjtfQ9I9MIv0e/JQkcz674785qMzVp5OP
         N2hw==
X-Gm-Message-State: AOJu0YyWc8DSYbx2J61SbqAptX6aoPRG/RgUxtW3Y1oFsplue8illTJh
	sV4ADyRgtvt8y3y7SjBFuhPAId6wSTu1Q5oLgTBiwYKJlJrYOyhnrUlCJWTaRWo=
X-Gm-Gg: ASbGncvCZHdvmCX4GCyIgn8oy+9T785R96v6svUHq3WVkf6kOHR/Sr7a9Vbp3bLWCEr
	5xo0QR6DewPFr1z+6+SNiZnArt4o7EnT+628o6P0jVFWaUyF0Rq1x/KugHzN/+j6HhE4kdq+sgF
	JDbIrx59RyPAmdDmKglT7Uh8MxDSCiB47ZRVV75+K56MHcn3v8MhElLuDjcluQzjA1nctKY6n4V
	G3iFeEVZhu+YjAu6aneCBOO3/JFxJ46YffYCaD8zPF/mGvdVkKbhwidelCcsA+VBj46zILhdEoP
	ooZJOx4gDw7gawtZKUIqken0hw==
X-Google-Smtp-Source: AGHT+IH49gaOPMF7t4upT5Tx5Hog2RKAz0lDvcXcNi0V5azvArwfOwcee0tCGXjc/+LK8uxZWbdQZg==
X-Received: by 2002:a17:903:2283:b0:21d:cd54:c7ef with SMTP id d9443c01a7336-2217055dc08mr41960675ad.9.1739955235583;
        Wed, 19 Feb 2025 00:53:55 -0800 (PST)
Date: Wed, 19 Feb 2025 09:53:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
	bertrand.marquis@arm.com, michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com, dpsmith@apertussolutions.com,
	xenia.ragiadakou@amd.com
Subject: Re: [PATCH v3] xen/dom0less: support for vcpu affinity
Message-ID: <Z7WcHlkY360pfeRO@macbook.local>
References: <alpine.DEB.2.22.394.2502181227580.1085376@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2502181227580.1085376@ubuntu-linux-20-04-desktop>

On Tue, Feb 18, 2025 at 12:29:24PM -0800, Stefano Stabellini wrote:
> Add vcpu affinity to the dom0less bindings. Example:
> 
>     dom1 {
>             ...
>             cpus = <4>;
>             vcpu0 {
>                    compatible = "xen,vcpu-affinity";
>                    id = <0>;
>                    hard-affinity = "4-7";
>             };
>             vcpu1 {
>                    compatible = "xen,vcpu-affinity";
>                    id = <1>;
>                    hard-affinity = "0-3";
>             };
>             vcpu2 {
>                    compatible = "xen,vcpu-affinity";
>                    id = <2>;
>                    hard-affinity = "1,6";
>             };
>             ...
> 
> Note that the property hard-affinity is optional. It is possible to add
> other properties in the future not only to specify soft affinity, but
> also to provide more precise methods for configuring affinity. For
> instance, on ARM the MPIDR could be use to specify the pCPU. For now, it
> is left to the future.
> 
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Sorry to be picky, just an unrelated nit, but usually the first SoB
matches the "From:" field in the patch, or a commit body "From:" tag,
for example:

https://lore.kernel.org/xen-devel/20250124120112.56678-2-roger.pau@citrix.com/

Thanks, Roger.

