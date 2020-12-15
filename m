Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 243DD2DB15F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:28:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54474.94659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDBr-000436-Ry; Tue, 15 Dec 2020 16:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54474.94659; Tue, 15 Dec 2020 16:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDBr-00042d-OY; Tue, 15 Dec 2020 16:28:43 +0000
Received: by outflank-mailman (input) for mailman id 54474;
 Tue, 15 Dec 2020 16:28:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpDBq-00042O-GB
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:28:42 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c445b198-3528-46e9-9a1c-f6ac4e3b9408;
 Tue, 15 Dec 2020 16:28:41 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k10so17433170wmi.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 08:28:41 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 94sm39531260wrq.22.2020.12.15.08.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:28:40 -0800 (PST)
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
X-Inumbo-ID: c445b198-3528-46e9-9a1c-f6ac4e3b9408
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j4tyz0KYb1+m9dRi4JRX79o8d/DzBmaeKPiouZzpfiw=;
        b=AymfjRnC//EHiu7Vefi0Onerqg91k03TRLX2YXA+GrVZI70L6l081fFn6znm0HDZ+E
         /5j7/pKSN9/dhGweT0Q74NjJAj3YjHW3sSA2PDFmSrzHy4aYsPAO6qDY18nJvfSHfYks
         rUpayxobe/0HI53Xrcjb9YXWV+8G23VZNj/hSGW4K1vL1W4RbRiu1bkodVLr1zqHdAqr
         zeJo4ve6MSFQgatxOOeajPlml8fF2Ieg7JdO+I9l2rOAcEjKryxXO4XkM/PH98PwSJ2K
         y8OBgXBHb0pK5BHrRdYqsF9p793dw5MwuDNIMqTREyi57WnuEawxYIk1tEz51rW5wFbM
         eXSw==
X-Gm-Message-State: AOAM533/I/j+4JRG1Ys62Ibq2aJy5HN56LOUfSm63Qv1rMYFt7uVX4lU
	lUAuKUJTBhz9iJedCiQuDO4=
X-Google-Smtp-Source: ABdhPJyl+EIpqtc0c0xoqNXI313POITbese7sP6R6Su0lWEELf4cv8amYqeyVPZBhw6Y32FV+pqPRA==
X-Received: by 2002:a1c:770d:: with SMTP id t13mr34839387wmi.153.1608049721060;
        Tue, 15 Dec 2020 08:28:41 -0800 (PST)
Date: Tue, 15 Dec 2020 16:28:39 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/4] x86: verify function type (and maybe attribute)
 in switch_stack_and_jump()
Message-ID: <20201215162838.o7ihaoj2tirqjg5s@liuwe-devbox-debian-v2>
References: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
 <792c442d-c05a-7a00-c807-b94a54bca94f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <792c442d-c05a-7a00-c807-b94a54bca94f@suse.com>
User-Agent: NeoMutt/20180716

On Tue, Dec 15, 2020 at 05:11:41PM +0100, Jan Beulich wrote:
> It is imperative that the functions passed here are taking no arguments,
> return no values, and don't return in the first place. While the type
> can be checked uniformly, the attribute check is limited to gcc 9 and
> newer (no clang support for this so far afaict).
> 
> Note that I didn't want to have the "true" fallback "implementation" of
> __builtin_has_attribute(..., __noreturn__) generally available, as
> "true" may not be a suitable fallback in other cases.
> 
> Note further that the noreturn addition to startup_cpu_idle_loop()'s
> declaration requires adding unreachable() to Arm's
> switch_stack_and_jump(), or else the build would break. I suppose this
> should have been there already.
> 
> For vmx_asm_do_vmentry() along with adding the attribute, also restrict
> its scope.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

