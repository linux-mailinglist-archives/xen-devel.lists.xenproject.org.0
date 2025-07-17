Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62616B0895E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 11:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046480.1416830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucL0T-0002Tb-KB; Thu, 17 Jul 2025 09:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046480.1416830; Thu, 17 Jul 2025 09:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucL0T-0002S3-G6; Thu, 17 Jul 2025 09:34:25 +0000
Received: by outflank-mailman (input) for mailman id 1046480;
 Thu, 17 Jul 2025 09:34:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W9zS=Z6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ucL0S-0001xs-GE
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 09:34:24 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38c28091-62f1-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 11:34:22 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45634205adaso3429495e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 02:34:22 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45634f6b1a0sm16469255e9.16.2025.07.17.02.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 02:34:21 -0700 (PDT)
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
X-Inumbo-ID: 38c28091-62f1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752744862; x=1753349662; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MDzfGhZk+yq8CqA+eSlVn6C+M3MLEqwZN/4xSKUK68w=;
        b=SzV5ZE0eDygfUzuoc9pYaIHdgD8L8Wp8koJ4PryQrl0W4OJadb79wi1vY+cPKPzhuM
         JzYrVWQqv8qiLNza0k69BtARDSdSzERxPaVjtIul1kzLatCXJaBC38qMhYv4AZfmPFmr
         Q8tLrn9fgp9mUCBc2+aNzaAoRET2y1We/bBEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752744862; x=1753349662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDzfGhZk+yq8CqA+eSlVn6C+M3MLEqwZN/4xSKUK68w=;
        b=NQq0c5OoLQVQ5xHYbJPUZAStW3xdyToRYo/MieLUFYXH4Q/OoHZH2GpKrzmWPDmlRr
         Ic+Zq4K3D2R6Ig5L93f1/j0d+c0kkH/bUEJpzu4xDf7a40d184pEAgFOYbY/ZG5PtlAl
         hEUqu8cTkE5SlAWoeibl9+hlNLZJY1sX8+dR1rMcZS2yGVI1mLwkaV526yr1DzQTDE7n
         ly/qW1dOon+qZFhx9ieUvoUgaiD8Jyho3WWv+AxjOeUBOwYQId9m1CNsoWlBFZVSvCSV
         E0HndTg9gRwWpjhMo2D6ic8qT/paKsuBv+Yxk6a36nSiHUi+8sYzXYIIzOZSGe4wGZ9T
         q7KQ==
X-Gm-Message-State: AOJu0Yw5SW7un/3PJLmznZJxrH0zZlx8vJOB43Ra/nSReFHC2L/0NFNW
	uYz7yds1SIroZXPQLj2rm91tvhtym1rxuRb+IxKqOJPms8KUczUMJH3RLBBITP6Lbg4=
X-Gm-Gg: ASbGnctTiJ4U6WGBMkRksilVdpIbVRqK1SlX4UFrN0L0dcDLMrIaDeMlNnzqtPXyeTD
	lMDbdDd7KE8iVtcsJ+/G4UmiqVpqA+IwdCSnQGyUTRx49tbdk+n4WQQTAJM0QvpdDhb4tM6nkqW
	RHhKFxwqQ2iCV6ygo9mMiCTg8QOxaT8GFtZnVnEHEid49ZzdxW0QX+ssFQnCvT3NfPpmykvsEuE
	Vd1Gf2kMklBQt2e0WmZ1EsR0u/TPeToC08mvj323/mJyZICkBzjJdL6tjFenhRetY6FGZ18AV8X
	hgeJzJ/nJBbXvRyeyq0gfqCvMZfFeV/vN07VRycmdIJ1AqV1InXcC25iemme+sFJfeKWUE+g7Rc
	TGcwiVqZbEILf6QL9h2fneE78EHfmQDLvJ07BTmNFMBl2fsYEays7x/NKI0gYmxRtBSp/xJNyGb
	gm
X-Google-Smtp-Source: AGHT+IEAxcukBeUwx5F4Lwn35RKa/Os8P3clvSub2r4c3Kit4yenzz27750gDyFPczmVTgUZH4nesA==
X-Received: by 2002:a05:600c:3b1e:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-4562e321debmr63481275e9.0.1752744862243;
        Thu, 17 Jul 2025 02:34:22 -0700 (PDT)
Date: Thu, 17 Jul 2025 11:34:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/SMP: guard socket_cpumask[] access in
 cpu_smpboot_free()
Message-ID: <aHjDnEvCntB88Zl6@macbook.local>
References: <7fa05d3f-2f85-4a42-9549-b68a486e30ea@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fa05d3f-2f85-4a42-9549-b68a486e30ea@suse.com>

On Mon, Jun 30, 2025 at 01:42:31PM +0200, Jan Beulich wrote:
> Before CPU identification has run (and it may not have run at all e.g.
> when AP bringup failed altogether), cpu_data[].phys_proc_id (which is
> what cpu_to_socket() resolves to) can't really be used. The use of
> cpu_to_socket()'s result as an array index cpu_smpboot_free() therefore
> needs guarding, as the function will also be invoked upon AP bringup
> failure, in which case CPU identification may not have run.
> 
> Without "x86/CPU: re-work populating of cpu_data[]" [1] the issue is
> less pronounced: The field starts out as zero, then has the BSP value
> (likely again zero) copied into it, and it is properly invalidated only
> in cpu_smpboot_free(). Still it is clearly wrong to use the BSP's socket
> number here.
> 
> Making the guard work with and without the above patch applied turns out
> interesting: Prior to that patch, the sole invalidation done is that in
> cpu_smpboot_free(). Upon a later bringup attempt, the fields invalidated
> are overwritten by the BSP values again, though. Hence compare APIC IDs,
> as they cannot validly be the same once CPU identification has run.
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2024-02/msg00727.html
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

