Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AD0782E32
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 18:18:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587710.919083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7br-0005fq-0M; Mon, 21 Aug 2023 16:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587710.919083; Mon, 21 Aug 2023 16:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7bq-0005dE-Tp; Mon, 21 Aug 2023 16:18:30 +0000
Received: by outflank-mailman (input) for mailman id 587710;
 Mon, 21 Aug 2023 16:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WiRE=EG=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qY7bp-0005d6-T8
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 16:18:29 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cfcc873-403e-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 18:18:28 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fee06efd6bso13717005e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Aug 2023 09:18:28 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c1-20020a7bc001000000b003fee567235bsm9024709wmb.1.2023.08.21.09.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 09:18:28 -0700 (PDT)
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
X-Inumbo-ID: 5cfcc873-403e-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1692634708; x=1693239508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gEN2hXg7vP73QvnLrDyorfgNBzSnS89HtAfPQpE3PWI=;
        b=X1+xSccQW4JuFeI2LWd5r30Gl+ujJSvoPj0gPyGYOXsdtOi+2we5pRW95KQC8WOH0A
         HTlQuwl0r0fX4RdklmFKBeKPfwFgau0miAYW3d+WR4oT8PONk06uYdSUUcwmFNQBKBlG
         Z9HtZZrw2eE5XG35+Fx094jPh/3ik476PGJMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634708; x=1693239508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEN2hXg7vP73QvnLrDyorfgNBzSnS89HtAfPQpE3PWI=;
        b=GDGoFxC34Vq9zSw22qkH9XfihMI/cDslos+U/CWf8orflOCjLGLZW6PHs1FDGvsjEc
         kSO6Zr0vV3GAK3poSgKcmdHSUAZSlxzajoI+1ku4ivJoMiM3oWnYxXG85s4Nc+FRfzJS
         i0h13X5qu/Rvv3+p1a6Ew6CqjE8vaCp6JwYKJZItsGr65ZXEMIQR3/gzd+dMM88ZYsy7
         Z3VoXyheMP3b/tTHvw2jMjIIBQvDwYXgT0zXUq4CRiExYofIRhNWCSRv+kKWpQ22MhkU
         tpvGFxzbUXJcWd/rtgWp0/7wK2D2i1WOGROkTsaXSzPqKLyn2UiL9bWTBQQUy3qpshqH
         ocig==
X-Gm-Message-State: AOJu0Yw9v5mpCQ6ZYMpOWx2847btgvpdGFBxhonJwNPFZ5LXN2n/6l+s
	2TyYVYko+YuUwVi9Yz8n2cBcPeKEQhExBhVXvxnQ9A==
X-Google-Smtp-Source: AGHT+IH39wVtsljzvIuPxTcd/VRxzRGcCcJ3RLrRQPQmbU4lJVb/dFmA1BU2G5XbpaJQhRtSlXG/jQ==
X-Received: by 2002:a05:600c:3646:b0:3fe:d45a:5bfd with SMTP id y6-20020a05600c364600b003fed45a5bfdmr5191426wmq.13.1692634708257;
        Mon, 21 Aug 2023 09:18:28 -0700 (PDT)
Date: Mon, 21 Aug 2023 17:18:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [XEN][PATCH v9 17/19] tools/libs/ctrl: Implement new xc
 interfaces for dt overlay
Message-ID: <b94a7e3f-8583-4ffc-85ea-cf59e85e1786@perard>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-18-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230819002850.32349-18-vikram.garhwal@amd.com>

On Fri, Aug 18, 2023 at 05:28:48PM -0700, Vikram Garhwal wrote:
> xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
> operation type i.e. add or remove to xen.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Hi Vikram,

I've given some comments on the v7 of this patch at [1], there's been no reply
and the patch hasn't changed.

[1] https://lore.kernel.org/xen-devel/9975f41c-c149-445a-8122-c15cfe5511b0@perard/

Did this fell through the cracks?

Cheers,

-- 
Anthony PERARD

