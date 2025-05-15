Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0561CAB843A
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 12:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985202.1371161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFW4S-0007KD-3H; Thu, 15 May 2025 10:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985202.1371161; Thu, 15 May 2025 10:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFW4S-0007IG-0f; Thu, 15 May 2025 10:44:12 +0000
Received: by outflank-mailman (input) for mailman id 985202;
 Thu, 15 May 2025 10:44:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT6j=X7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFW4R-0007IA-2r
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 10:44:11 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8855d6ea-3179-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 12:44:09 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso5371395e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 03:44:09 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442f39e852fsm67759265e9.27.2025.05.15.03.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:44:08 -0700 (PDT)
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
X-Inumbo-ID: 8855d6ea-3179-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747305849; x=1747910649; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5A5ze9++jixZm+Ncscv5mJmZLzS6LZbUHutAhH+rzQ=;
        b=chvoF52OZQVzSoFI8e998uS2fmlCA/n5V1U2kbKh20E4OeYgJqkuef2WKRfTqs+k6H
         0ZbUACaMNSvtJnCAbXElcN69FLopicGl6gtTNIGS2j1a1XNT3rrrtfH9RzN17Kjg2y1R
         6HrQ48XuMwCR6xMSXHb63oSGfMKd2ViQ7aK9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747305849; x=1747910649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5A5ze9++jixZm+Ncscv5mJmZLzS6LZbUHutAhH+rzQ=;
        b=n9rZ25FkDvb5mZPDJkB8wZRLNDOqgbtuqmaojfOSuWme4F/Vr1ExjUgvo55zZey/51
         +3O6EFbAQqvxhco1/w5ICZe7btZtj3wtMX1NsH2PqD8S39kB23bFEjq6+DglgS2I7rqw
         TWiH0hVaMT1qo27HweMZ4/JAl3UyCyIxSLb4NtbdyTPKGJE8YFs7rvHU6LkWI9jxUjHV
         8l2ojvzvYw6koiCseVreTERHInqqEvec/1+PN2JN1FUubeY7Y+iDrixd7lKjmN6aX1eo
         HO7BmwJ0pXENuSB7bL7roG8eDc0VFyTuCVl/WOWLiKqsHslBevljFuIUwXI73ys4V1MK
         9kKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXyOCvGHYCFg1jQCu1XO3QyTI/9N/5pSz22F9K930UuDkx+w75KdHBWq9Ny3Cwutv+DoVy6vfvD4I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcJk7iQRPtXM32XjrQ1eElyoh9sR/7za9n7VVicpRJ3CWMMxnM
	/3yxoqKTTg0+aeh8S2lRNCHbCreBFASdtv7IuFwdVx91owPFmomtyUX2jZ4mWf4=
X-Gm-Gg: ASbGncsaS53vxOWWdSNPBn51rvZ9XShrbYxMOG1WYuQ5rB6d0ON7mfudONGk7AtwFyt
	WNbCCYJWDF8Mh4NdB0KhoUQlI0nOozvSkEBF9H8L4R3OXXNKuYGmsxJVZazYim05iPJe+RWb+l1
	Jdq90+KzvZ+1yGvRHxvqzRbyHFw8r2+ezn2bc1PlvoMpXKxPeIdokvWH+9iycHa8DYtIoiCu098
	wtrgxnVdKFcjZ4IPBn004H8xwEnHPGTUrQuFluT2niyfb7w+RZHlnX5JoguLjxCyJ2ePkZ1NHsT
	O3dPYNGsqfNyqBdTE2e0mjpHqAvcZrarZ4m7y1HhnFj14sJDmjkuP0VN
X-Google-Smtp-Source: AGHT+IGBYei+d349jZv3zDg10rwljFD6NsKvgunQvWuYu6rmKk45N7oLZyEsJimcejTqH+Bk6zIWDA==
X-Received: by 2002:a05:600c:1f15:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-442f96e70f7mr16998615e9.11.1747305849210;
        Thu, 15 May 2025 03:44:09 -0700 (PDT)
Date: Thu, 15 May 2025 12:44:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 8/9] xen: introduce flag when a domain requires cache
 control
Message-ID: <aCXFeBGIr87MwELu@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-9-roger.pau@citrix.com>
 <b9a2b6fb-af34-443e-93b6-a5e827259a4b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b9a2b6fb-af34-443e-93b6-a5e827259a4b@suse.com>

On Mon, May 12, 2025 at 05:24:01PM +0200, Jan Beulich wrote:
> On 06.05.2025 10:31, Roger Pau Monne wrote:
> > Such flag is added to the domain create hypercall, and a matching option is
> > added to xl and libxl to set the flag: `cache_control`.  When the flag is
> > set, the domain is allowed the usage of cache control operations.  If the
> > flag is not explicitly set, libxl will set it if the domain has any `iomem`
> > or `ioports` ranges assigned.
> > 
> > Modify cache_flush_permitted() helper so that it's return value is no
> > longer based on the IO resources assigned to the domain, but rather whether
> > the domain has been explicitly allowed control over the cache, or if it has
> > IOMMU support and there's a single IOMMU in the system that doesn't allow
> > forcing snooping behind the guest back.  As a result of this, the return of
> > cache_flush_permitted() is constant for the lifetime of a domain, based on
> > the domain creation flags and the capabilities of the IOMMU if enabled
> > for the domain.
> 
> This then further emphasizes the remark made for patch 7.

Hm, I think you are referring to the remark about how PCI device
without IO resources would be handled then, and what would
cache_flush_permitted() return then?

IMO the benefit of the approach presented here is that it aims to know
whether a domain needs cache control to be set at creation time, and
not altered during it's runtime.

Thanks, Roger.

