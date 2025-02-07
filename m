Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E9BA2C763
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 16:38:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883760.1293667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgQQM-0003od-Fi; Fri, 07 Feb 2025 15:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883760.1293667; Fri, 07 Feb 2025 15:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgQQM-0003lh-Cs; Fri, 07 Feb 2025 15:37:46 +0000
Received: by outflank-mailman (input) for mailman id 883760;
 Fri, 07 Feb 2025 15:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ESK=U6=flex--seanjc.bounces.google.com=3xSimZwYKCfImYUhdWaiiafY.WigrYh-XYpYffcmnm.rYhjlidYWn.ila@srs-se1.protection.inumbo.net>)
 id 1tgQQL-0003lR-9D
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 15:37:45 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77c6abeb-e569-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 16:37:42 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2ef80d30df1so4738126a91.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 07:37:43 -0800 (PST)
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
X-Inumbo-ID: 77c6abeb-e569-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738942661; x=1739547461; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jwYTJjiEd1pBTulC56b0xIusdB3gOsGMSwp66kj31EA=;
        b=cLNXEu6a8tbDfDMM9z+QMGxyKmjWkEA75BaBNb5M59eobvbVP2w9a1xx7Lxy/0QYa7
         Qs8i14nYpx6BJkFyN870PE5kwTfgoMlZ7gIEx6MYZlXjxfr5E4Lc3HJz55/lXH3hvRng
         2w1f51uvxuefkyxGdVWka1E/F/FGxZbhLxdTklpvLqkbNJs06giqChrxA9+lKMvPsCQR
         jJX1rgALjiOt6KtX2AGuF3dtmxP2f9TvcWKJh9ZQSEK6+Sb3njEVS7oW2cDOPtqTQIf1
         IkDWKt9AL/NQ/dZSWgsanVTrtmS9jOdK1p9oKvFpHeGIzavwEuMVZ0Afn5l4kuXcq3Ui
         pXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738942661; x=1739547461;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jwYTJjiEd1pBTulC56b0xIusdB3gOsGMSwp66kj31EA=;
        b=qlu5ekHmY18vK93RPfPpj1jRySQ0JKBtk+c8dxTDdCKUvEf+EV4wezmujRKTLHGnRn
         6YCEFczWhGMHph92Eq5jGQCpmD+NEVorsI8H84FQW0ekYbGr+qZn4KrcqK7dRqN2C3NL
         2nCJok+ZcaMFBMWrI/7y8Xv9EVibfkKY2SQy7ZFFwmaHlNewimM8kZ47G3aaC3Zwr5+3
         YdsvrwQ6QWTxKGgY614KXU0nytgQYLenYtRjw4b4O1+I0ITKnF+Om4uzIzhmVGweREnG
         B7q8FlWktP/L9xyUBwrPrT7g+Tlzy+Uew+yJ3iVZudD631y9SVNUT210lohVKT1ZXnSc
         Xrew==
X-Forwarded-Encrypted: i=1; AJvYcCWTIckO95Wfg6pvNyDC0iNA+4IUs+pDU2LyEpFWW01CE1GJWEaJ74zNLcqrUZR1+DTy1baanQAiiNY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEK22JBJPnFj0pCPnp8p3+hBurwDge/igdwcvNrgFic67IOhgz
	PcwRi+VWxpkG4ls/R5R2hseTjTbqzscN3u9tSOmuXW9c/OzrSS2OuO7VcRQWoPrwFGqK8T6TOaj
	FtA==
X-Google-Smtp-Source: AGHT+IERa+Rywv/H/txubJQW0t0aFsR0oFzWrZg8x4V2aIf7jDbMtfwdY1UmKxioAzFzmBb+WHSzh3ryuv4=
X-Received: from pjm4.prod.google.com ([2002:a17:90b:2fc4:b0:2ea:5613:4d5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b44:b0:2ee:cdea:ad91
 with SMTP id 98e67ed59e1d1-2fa24175d63mr5586623a91.15.1738942661522; Fri, 07
 Feb 2025 07:37:41 -0800 (PST)
Date: Fri, 7 Feb 2025 07:37:40 -0800
In-Reply-To: <20250207143724.30792-1-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20250207143724.30792-1-dwmw2@infradead.org>
Message-ID: <Z6YoxFOaMdNiD_uv@google.com>
Subject: Re: [PATCH 1/2] i386/xen: Move KVM_XEN_HVM_CONFIG ioctl to kvm_xen_init_vcpu()
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Kevin Wolf <kwolf@redhat.com>, 
	Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marcelo Tosatti <mtosatti@redhat.com>, xen-devel@lists.xenproject.org, qemu-block@nongnu.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 07, 2025, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> At the time kvm_xen_init() is called, hyperv_enabled() doesn't yet work, so
> the correct MSR index to use for the hypercall page isn't known.
> 
> Rather than setting it to the default and then shifting it later for the
> Hyper-V case with a confusing second call to kvm_init_xen(), just do it
> once in kvm_xen_init_vcpu().

Is it possible the funky double-init is deliberate, to ensure that Xen is
configured in KVM during VM setup?  I looked through KVM and didn't see any
obvious dependencies, but that doesn't mean a whole lot.

