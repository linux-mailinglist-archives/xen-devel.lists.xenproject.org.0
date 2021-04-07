Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D8F356CD0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 15:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106636.203883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU7nK-0007eK-LO; Wed, 07 Apr 2021 13:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106636.203883; Wed, 07 Apr 2021 13:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU7nK-0007dt-IB; Wed, 07 Apr 2021 13:00:30 +0000
Received: by outflank-mailman (input) for mailman id 106636;
 Wed, 07 Apr 2021 13:00:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bfSB=JE=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1lU7nJ-0007do-5q
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 13:00:29 +0000
Received: from mail-wr1-f43.google.com (unknown [209.85.221.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8464b059-9ca3-4f83-af16-c47bd6c2d70f;
 Wed, 07 Apr 2021 13:00:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id a12so8115562wrq.13
 for <xen-devel@lists.xenproject.org>; Wed, 07 Apr 2021 06:00:28 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id k3sm19834667wrc.67.2021.04.07.06.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 06:00:26 -0700 (PDT)
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
X-Inumbo-ID: 8464b059-9ca3-4f83-af16-c47bd6c2d70f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NwLKTNKDKP75b7p50B/o71iDiFr0JTQFhm3wPogEFdU=;
        b=gjg3DxMqeiXNCFKV8t5c1VnagBqFZ2YxeqGx1Tc224cGJyCmIIVRUASOXvgauLW/aw
         4yjO1YY79sizaCy9O/hCLVpsBlEjadeVCmPp50gC2NhHF7C1uTkbgxTZ9zc5O6tLyzk8
         2xcmyob+14B1MkXuWoW6AW99FcrqYhik2VtX3E2+9abPzUwJNrQ5bTsK3+p50dm9N6Le
         44VQ6kLGmn3W2cixwsmM4QWtCsANfdkUg0nGbIK2lnXoRfKylcgtvh+5uYbxC1qFlFhu
         7b1NBvb/9w9G4bnHNwdYSZlbL9p5oUSSUj2bA6ySYe4QiD9t5VkMYvCeKe6Uryxbjzq3
         0OSw==
X-Gm-Message-State: AOAM5327pjg/YbulBNq12tAPcl7Kw1cj/T2NoC9u78YlXd9VPswqsBTj
	HVsttDnqUta+puKLGlzOViE=
X-Google-Smtp-Source: ABdhPJze8GqaoC7VT4EBUo/P3ST9s9tLdsZXJdoXUKWyW/Gkw8UQr9VDY3nhMuQID9gqjD7B0tz1BA==
X-Received: by 2002:a05:6000:2a7:: with SMTP id l7mr3338450wry.413.1617800427739;
        Wed, 07 Apr 2021 06:00:27 -0700 (PDT)
Date: Wed, 7 Apr 2021 13:00:25 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: sstabellini@kernel.org, jgross@suse.com, jgrall@amazon.com,
	boris.ostrovsky@oracle.com, tglx@linutronix.de, wei.liu@kernel.org,
	jbeulich@suse.com, yyankovskyi@gmail.com,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, bertrand.marquis@arm.com
Subject: Re: [PATCH] xen/evtchn: Change irq_info lock to raw_spinlock_t
Message-ID: <20210407130025.tfe6aszjyjzz6ar2@liuwe-devbox-debian-v2>
References: <20210406105105.10141-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406105105.10141-1-luca.fancellu@arm.com>

On Tue, Apr 06, 2021 at 11:51:04AM +0100, Luca Fancellu wrote:
> Unmask operation must be called with interrupt disabled,
> on preempt_rt spin_lock_irqsave/spin_unlock_irqrestore
> don't disable/enable interrupts, so use raw_* implementation
> and change lock variable in struct irq_info from spinlock_t
> to raw_spinlock_t
> 
> Cc: stable@vger.kernel.org
> Fixes: 25da4618af24 ("xen/events: don't unmask an event channel
> when an eoi is pending")
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Wei Liu <wei.liu@kernel.org>

