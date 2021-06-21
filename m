Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8659D3AF10E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 18:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145637.267825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvNBV-0001cq-Kn; Mon, 21 Jun 2021 16:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145637.267825; Mon, 21 Jun 2021 16:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvNBV-0001aX-HV; Mon, 21 Jun 2021 16:54:05 +0000
Received: by outflank-mailman (input) for mailman id 145637;
 Mon, 21 Jun 2021 16:54:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8wfi=LP=rasmusvillemoes.dk=linux@srs-us1.protection.inumbo.net>)
 id 1lvNBU-0001aR-27
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 16:54:04 +0000
Received: from mail-ej1-x62e.google.com (unknown [2a00:1450:4864:20::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b1f2e15-99bd-43c8-89e0-ce801c88abc4;
 Mon, 21 Jun 2021 16:54:02 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ho18so29939679ejc.8
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jun 2021 09:54:02 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.64.110])
 by smtp.gmail.com with ESMTPSA id f14sm313127edd.69.2021.06.21.09.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 09:54:01 -0700 (PDT)
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
X-Inumbo-ID: 3b1f2e15-99bd-43c8-89e0-ce801c88abc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P2Td/+tIipAgfyxPjVHvnCAo9n1WaYveTmTAYM/j+jY=;
        b=diuj5gabJqISgVVxx3Akhkd9RYmJFByRkUBchT88Z00CkuGWojs+VGfxVUt18Ow1NT
         iIs9CPaqGh7r/1KD5cILlcpveOUj3CJF4M7DbQqERFA9+ywOFCmKxKF8X0t8+AlKR+tN
         jXwgDjJn9NupBFYxyzDNQyDRkmzMZohSurPoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P2Td/+tIipAgfyxPjVHvnCAo9n1WaYveTmTAYM/j+jY=;
        b=Q7EZduHsWZnptYf703qVFasm8lDLK8Psk6QpL5o3le9U3IYrvmdCNWXVDJPuIPCG/9
         +ewzT6uWyA41ZiDO/Wt6a3ryAymNMJbf7LfIeIwBK0WpyCIrT/E/FPyJIkYHUQSsP7ib
         yAmxBjya1dISb1wjXXmBb1TJVDfHPfdczCcL8LzEYX658KhFLW523SxeJ/NwbfoLsB0Q
         4OPN5xnmDuZzGSntzv6zn5fdZ5CAmCqooGstI6Zc6CA75dxR9rQw2EuU4mWz+nnCH0FI
         CNBpuWCRGlHaxVsUWJtAJZ8xF8rlGSoDVMNmrRkjnnO/V3kokx2ZKj+nqU3RgTB/9r65
         KpDQ==
X-Gm-Message-State: AOAM5331kkDsYSci9/CR4N2aeQ5Zy7vvl2nr3i9RpFnRNTEZ3NOXBgdB
	yoVlAANxdyJ0tlKVd9qhn7Km2g==
X-Google-Smtp-Source: ABdhPJxjYawB6DJpcIRc0YMX54xgWCzAW7ksE8qOaz7mcYqVsYntvbdMZwPqOAEECmQCM421IbYweQ==
X-Received: by 2002:a17:906:264c:: with SMTP id i12mr25567215ejc.101.1624294441554;
        Mon, 21 Jun 2021 09:54:01 -0700 (PDT)
Subject: Re: Linux 5.13-rc6 regression to 5.12.x: kernel OOM and panic during
 kernel boot in low memory Xen VM's (256MB assigned memory).
To: Sander Eikelenboom <linux@eikelenboom.it>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Juergen Gross <jgross@suse.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 kernel test robot <oliver.sang@intel.com>
References: <ee8bf04c-6e55-1d9b-7bdb-25e6108e8e1e@eikelenboom.it>
 <CAHk-=wjgg67NMBNG99naEQ1cM0mXBBzdhCJaYFH-kC+mLK+J2g@mail.gmail.com>
 <9108c22e-3521-9e24-6124-7776d947b788@rasmusvillemoes.dk>
 <0b12f27b-1109-b621-c969-10814b2c1c2f@eikelenboom.it>
 <7338064f-10b6-545d-bc6c-843d04aafe28@eikelenboom.it>
 <e7f9c4f8-1669-75ce-b052-1030350a159e@eikelenboom.it>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <bfdd1d6b-77a3-450b-71f4-63e9cc314ace@rasmusvillemoes.dk>
Date: Mon, 21 Jun 2021 18:54:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e7f9c4f8-1669-75ce-b052-1030350a159e@eikelenboom.it>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18/06/2021 03.06, Sander Eikelenboom wrote:
> On 17/06/2021 21:39, Sander Eikelenboom wrote:

> 
> OK, done some experimentation and it seems with 256M assigned to the VM
> it was almost at the edge of OOM with the 5.12 kernel as well in the
> config I am using it.
> With v5.12 when I assign 240M it boots, with 230M it doesn't. With 5.13
> the tipping point seems to be around 265M and 270M, so my config was
> already quite close to the edge.
> 
> The "direct kernel boot" feature I'm using just seems somewhat memory
> hungry, but using another compression algorithm for the kernel and
> initramfs already helped in my case.
> 
> So sorry for the noise, clearly user-error.

Hm, perhaps, but I'm still a bit nervous about that report from Oliver
Sang/kernel test robot, which was for a VM equipped with 16G of memory.
But despite quite a few attempts, I haven't been able to reproduce that
locally, so unfortunately I have no idea what's going on.

Rasmus

