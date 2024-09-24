Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42FF984850
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 17:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803044.1213441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st7B0-0007lU-Cs; Tue, 24 Sep 2024 15:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803044.1213441; Tue, 24 Sep 2024 15:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st7B0-0007jW-9Q; Tue, 24 Sep 2024 15:10:06 +0000
Received: by outflank-mailman (input) for mailman id 803044;
 Tue, 24 Sep 2024 15:10:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZSf=QW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1st7Ay-0007Se-Qr
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 15:10:04 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12c2e260-7a87-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 17:10:02 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c40942358eso9449076a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 08:10:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf49d7ebsm834372a12.45.2024.09.24.08.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 08:10:01 -0700 (PDT)
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
X-Inumbo-ID: 12c2e260-7a87-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727190602; x=1727795402; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=byUl82INZlv612W6FxDlVPwsOPRJbIrXPRVbK26XlZg=;
        b=T8UCokUwLfLG+HxEZocwmNv0UROYW79zHZ0CXVMHheXN+bCYE4vr2kcAx3W18uy9Rm
         0G6DciZHunVrf8se5UBYY9Fss+4zIG7y4/PpEV/s49b5n3i1T1dhuEIHu8xKCDfjKqZ0
         mvOR02f1orHXcJ1gLNkRkrLj6yqjonkseKHMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727190602; x=1727795402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byUl82INZlv612W6FxDlVPwsOPRJbIrXPRVbK26XlZg=;
        b=AJF+dWvYjfJ1p/TOKNpp0T3KiuwXC5DsY6OX8Sw7bKzsNTW20S4KM4+h2F9c0TMrt6
         Bx1yokWzsjcUDQuGeMxz3H43UjFNE4ekQeWP9UQvh9pufaa5JR8ihHK6hkK4wUDmDPhi
         FX/zGXMwljExG9xE64GwTQtVnykv1g53zvhGyOGrgCLf/0zlefJVMDH+ukHduJfZ93Nx
         QS7eBfFLjI+3XJggPsbHSl/IF+5ofhPnZwnO9ycxS0BgVF5XnqvhAZC7QSs7OrAZYnps
         NCZ6U4za2UAK5AySEtAlSb7UEDmnGGIWp2ubgVSi6yBOBqdxK+qZRdQCsPgbEnoDYen/
         voqg==
X-Gm-Message-State: AOJu0Yw4sK8XZppj7pht0aOT2nmfHve8iMMgd8neZ0R1t41KfmGUr0WK
	5cSu+qtGhl+ODs3Ha8D9c9MODrVvvLeJ1Q8y2b23Yh/Pku5lEdfRa5Hh/xulpXk=
X-Google-Smtp-Source: AGHT+IHp/g1lzam4D7tPVKmhC6AfBxI5VmXy/mKZ/BdEEhmrNnZB6WlYJ7g/5GVlJJiF/NTukbHG1w==
X-Received: by 2002:a05:6402:3509:b0:5c5:cb7f:e56a with SMTP id 4fb4d7f45d1cf-5c5cdfa0523mr3670130a12.1.1727190601999;
        Tue, 24 Sep 2024 08:10:01 -0700 (PDT)
Date: Tue, 24 Sep 2024 17:10:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/APIC: Remove x2APIC pure cluster mode
Message-ID: <ZvLWSEwbdL1kpvC6@macbook.local>
References: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>

On Mon, Sep 23, 2024 at 03:35:59PM +0100, Matthew Barnes wrote:
> With the introduction of mixed x2APIC mode (using cluster addressing for
> IPIs and physical for external interrupts) the use of pure cluster mode
> doesn't have any benefit.
> 
> Remove the mode itself, leaving only the code required for logical
> addressing when sending IPIs.
> 
> Implements: https://gitlab.com/xen-project/xen/-/issues/189

There's at least one extra bit which I would also like to see removed,
either in this patch, or as following patch.

In struct arch_irq_desc we have 3 cpumasks: cpu_mask, old_cpu_mask and
pending_mask.  After dropping cluster mode for external interrupts,
those fields could become integers AFACT, as now interrupts can only
target a single CPU opposed to a logical CPU set.

Thanks, Roger.

