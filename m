Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1D6B1C7BA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 16:37:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071883.1435242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujfGh-0002bC-54; Wed, 06 Aug 2025 14:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071883.1435242; Wed, 06 Aug 2025 14:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujfGh-0002Zj-1t; Wed, 06 Aug 2025 14:37:27 +0000
Received: by outflank-mailman (input) for mailman id 1071883;
 Wed, 06 Aug 2025 14:37:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kasG=2S=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujfGf-0002Zc-Ro
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 14:37:25 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de3d6525-72d2-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 16:37:24 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45994a72356so8640055e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 07:37:24 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c4a2848sm23040515f8f.71.2025.08.06.07.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 07:37:23 -0700 (PDT)
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
X-Inumbo-ID: de3d6525-72d2-11f0-a322-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754491044; x=1755095844; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fkN2Uehwul7oD7ifqYMtbWgz9qgTAJ6LbALemLk3DR0=;
        b=i1fNNa55qFW8pqu11+INGj6P0Eu1oxgAGJ92S8YGoZYNa+bFxgG8ZPEtgELVSg7YcH
         0Ey2Qqx6KmR9ZjAIWBe10Hdb71SU0eIvF8pbP11ofl93+AHuMJ+qM4mQy9yVzC17vVzd
         80H6isQ1Q7ot2730G0GkV9RQPMkrnv1CJ1MPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754491044; x=1755095844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkN2Uehwul7oD7ifqYMtbWgz9qgTAJ6LbALemLk3DR0=;
        b=SQVC9MFJ8+fHKvvKWFRgf1br6H1zmhEjFDGzh0kfl/iPQBayS2pQFNWdC9Kb3UkKSd
         08PxxtSfrHcheLBxyMC3pAdsYDYr7CfYqP2mZizOnGS1SvamRJN42IRiBHXrnRUgU/el
         wFOf6y4NZjaWgKoY0eD05SnU222Nhi+S1da8fC/n8L2w63mnVtnuMroR9YazdGCUrXcC
         +xLWzADbIKgHqva8Cwyzapj+mimdgERsQLm7/T9nBmkMWJP7uXtrOj/Qs+o/758n/BjR
         xRJdAyA5Bi0wN6ryAyhlFKvY/rIyeh2h3n6sXsdV3i+tVFKZe4pSjrmY8F+Vy6dfS+hU
         MutQ==
X-Gm-Message-State: AOJu0YxRl6PhI3bHuME3ToqXg37ZO5KHkL8vcpjJxc1bgk/CCjD6gfJW
	jxxbML8fGCfFZCFJXrzfpeeJd66nLZpY1PPHtM3EGO+q2wDlJPzufQJn7QpvmeTZg48=
X-Gm-Gg: ASbGncvp74Y8C6t/aWdSPlffV2qxp67mR0Elh8iBEJBAKD1nGifhCjTQS288oTWpqf5
	3ja9RS1IkBhc/UIyiyGmM74zgjBeTbhqHD2RFETXQ87t9PrJlr0AC9PgAxs7N3lkdHYR9GpAviE
	Vgmy3eenZz7yg+q9ud5m7Id/s2lwSQaE3oOjvV/O+wd2sFvaPsb++CY3Rdh8p1dtMgBFpvDLGE5
	zrwaXRxk9G1mmxUNICQ/B7mH/qK5IwdmI+7OPCyN4JohS9WY8Ic0qj1v6Q9h4XqlmWo7OkVidnC
	Xk9JrPhB1mG2tl2ODNU8attCxLEVPXOPlhYAqdTVHQQK8JYwAjssWvpNCVirzECXfYpyKrq1cof
	xO9CNY1xmkKLUHohfUvYI/2vaTunVd2sB3hH774SDG2hz99hNuYCoqQPtC8GKj4snFA==
X-Google-Smtp-Source: AGHT+IH7bq4z7cSR4tZLYhRHt38AMtGjh5yhkqMaugK8dj5RlQmq3wKdGYTTFeLN5VaQueQVm8JUgQ==
X-Received: by 2002:a05:600c:1382:b0:456:2139:456a with SMTP id 5b1f17b1804b1-459e70e8ad8mr31414155e9.15.1754491044109;
        Wed, 06 Aug 2025 07:37:24 -0700 (PDT)
Date: Wed, 6 Aug 2025 16:37:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v4 3/8] x86/domain: allocate d->{iomem,irq}_caps before
 arch-specific initialization
Message-ID: <aJNoo6s_7CV6tIjy@macbook.local>
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-4-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250731192130.3948419-4-dmukhin@ford.com>

On Thu, Jul 31, 2025 at 07:21:54PM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Move IRQ/IOMEM rangesets allocation before arch_domain_create().
> 
> That guarantees that arch-specific code could access those rangesets to
> register traps for emulation.
> 
> It is necessary for those emulators registering trap handlers and ensuring
> that emulated IRQs are not shared with the physical IRQs.
> 
> Move dom0_setup_permissions() call right after I/O rangesets are allocated.
> 
> Move pvh_setup_mmcfg() inside dom0_setup_permissions() close to the place
> where MMCFG ranges are initialized.

I'm a bit puzzled by this, you don't need I/O permission to setup
traps.  You can setup traps everywhere, the I/O rangesets control
whether a domain can access the physical resource, not whether
accesses can be emulated.

The dependency between MMCFG registration (pvh_setup_mmcfg()) and
calling dom0_setup_permissions() is because the later consumes the
MMCFG ranges added by the former to mark them as not accessible by
a PVH dom0.

I think you don't need this for vUARTS, as the ports are know at build
time, and hence you can block access to them without requiring the
actual vUART to be initialized.

Thanks, Roger.

