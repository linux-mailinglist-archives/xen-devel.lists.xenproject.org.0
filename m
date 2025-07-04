Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BE8AF9A23
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 19:52:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033605.1406947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXkaC-0002mF-QZ; Fri, 04 Jul 2025 17:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033605.1406947; Fri, 04 Jul 2025 17:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXkaC-0002jc-O0; Fri, 04 Jul 2025 17:52:20 +0000
Received: by outflank-mailman (input) for mailman id 1033605;
 Fri, 04 Jul 2025 17:52:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9FN=ZR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uXkaB-0002Ij-GL
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 17:52:19 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a04021be-58ff-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 19:52:17 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so10098525e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 10:52:17 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-454a9bde954sm60693535e9.33.2025.07.04.10.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 10:52:16 -0700 (PDT)
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
X-Inumbo-ID: a04021be-58ff-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751651537; x=1752256337; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ms/NSX/AAcSvd3GRB6+EMG4ETv1y93NAyqjXzbMzQFc=;
        b=sZL5GpqBsraD9VPND6p59PamXoMnlsnSaCyT1lJ1ssT+wRhqvikrefZIXh59flSSRj
         01qKG5amaF4Vkphi/T3X3M4bNFvvIb1ws0Fj/NONC2MrFNSLlQwqhe4Y+tFas3Kn16jQ
         K2zlXO2j/jCSQgIERWCIpkddXB5nqGzP2W8KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751651537; x=1752256337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ms/NSX/AAcSvd3GRB6+EMG4ETv1y93NAyqjXzbMzQFc=;
        b=R9xI4kJXSuNjZj5A/AWvCU/5MGjzik22+y/4z6XTvYx9Ba0jBZhowXRNpgBn7xvicI
         JSA3GWGyV5cnP2lIYztXdcjzusp4KzJ5P77x76LrVUcA7OPKAys2A7SfsPzrD0V7x4dN
         tnxTXQzrfYIp2ViO4DECueCkP97wpdz4+M/jLRU2yjoyswAJsM6/4Yles+YAjyzbGoUd
         74bljR0tCwtuFG70AFoV1sTkwgkhKqRWtuMsy7w8bEQWgvWjxvFIZA3a6h6z9XjNBVJp
         dclR6VwwE6e/FGqyMNx8St8Z7twSS6qFo65u0Vn4GE/Rg77PVMCBEysPtxRsUtGFkptK
         qKUg==
X-Gm-Message-State: AOJu0YzFP24rxvaAM6i+8mVKp40DYqlyy5DT0BMGBOjrqU5/RJbvznU4
	4WonyC58Fu0mHxy8WHecjVldjjuRPhysG4TcJeine5NRC3acNlnNNoNGYUfhaG75byE=
X-Gm-Gg: ASbGnctBdhBdsSCITc+t9BfJQ9sePsWLtsk3xt/qgNmOtnCIt+HIYCQNbi0F/TcZAwf
	uvM3g3e39F0c5j4LXjjvov+XZI35pNNNKiimpZhqzSxc1jdGlD26TtincJ9uqKrwu51NQUpxjON
	zwqyHDr2rZYzqqC2taEIMtBqHJzo3/ZD0Vm9BEgXsg8JVVbp10z9sVeR9sV5VTrsbwr5ZdxP05J
	kBunCNKwFjKlCqzuFkOzJvPefegC9dT/rZhmP4R4L3YPM3IPnR43n5HQW4h/1fl3pgV+9ssquFT
	Yxs3tU2VzvlLALEgfLareqZBq0NCZmFksOokaHNYHJ+/fgon475FhUa5eTWSrFK5zZumGiXGsJ/
	28lHXvRM0MaWSSHIXgqHhdXs7GwFkFw==
X-Google-Smtp-Source: AGHT+IHE/f2VfaEhUQsqV5VkVMmp+2L4Ocw6zWxdo+1BRWR67tya6BZrrpsN6+7EYNhnUz751prFQg==
X-Received: by 2002:a05:600c:648a:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-454b4e769e4mr34090845e9.10.1751651537192;
        Fri, 04 Jul 2025 10:52:17 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:52:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/6] x86/idle: Convert force_mwait_ipi_wakeup to
 X86_BUG_MONITOR
Message-ID: <aGgU0F9gFnJ3Lx1d@macbook.local>
References: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
 <20250704163410.1412367-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704163410.1412367-4-andrew.cooper3@citrix.com>

On Fri, Jul 04, 2025 at 05:34:07PM +0100, Andrew Cooper wrote:
> We're going to want alternative-patch based on it.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

