Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B078AC8C13
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 12:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000664.1380859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKwv4-0002ff-MN; Fri, 30 May 2025 10:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000664.1380859; Fri, 30 May 2025 10:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKwv4-0002eE-JQ; Fri, 30 May 2025 10:24:58 +0000
Received: by outflank-mailman (input) for mailman id 1000664;
 Fri, 30 May 2025 10:24:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sK0T=YO=gmail.com=anthoine.bourgeois@srs-se1.protection.inumbo.net>)
 id 1uKwv3-0002e8-5D
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 10:24:57 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5441fe79-3d40-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 12:24:55 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a37ed01aa0so1540563f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 03:24:55 -0700 (PDT)
Received: from gmail.com (163.red-2-139-141.dynamicip.rima-tde.net.
 [2.139.141.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d8000e9asm13960185e9.21.2025.05.30.03.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 03:24:43 -0700 (PDT)
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
X-Inumbo-ID: 5441fe79-3d40-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748600694; x=1749205494; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1X9rxMVPFyCu2AkEbqxPhYR/MPNJ6FHvSsL1T/B5CtY=;
        b=U6BRp0P2XYX88lTtyl/weXwAJL66Go//YjpEFN3Ux35bvWnN09u2x8l/ydl2gt+BjG
         j8FO1Q28yi9yZcZJ28MK7NXV3WwLKjUFWYy/G0RfQfbHp7h4Xgz9EDYmyJ+gzNZStM9n
         9JRpaW6fB22RzuB4ef0ryc/kdeptrb4qm3ScYmvGkNz/EHvOWfPx8ebza6ff2AHfPI/D
         czb+TvQatgDZwgVK6GEBmOnxc6W9bcXvCLq9tyH6RautMNGVYjjEUGjcdjZDN7XpHBqe
         JSGhUjhz3UvAsFClp/Lf/8ZTpL6YkPjjuJ0oxPHehQc1X52Hb2OH0+bMjLMY0HLWn5DZ
         9PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748600694; x=1749205494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1X9rxMVPFyCu2AkEbqxPhYR/MPNJ6FHvSsL1T/B5CtY=;
        b=ClumSizS/J4EIuIda6EqomZvu8AhxJuVbNyADIGExuFZYYcGcen11j/N2rGGbqE+MZ
         Pi9XHEU4XxNyGXaDrIh2fiQ67OHqhaZ74UeqS4Btmed65XJ6iBVf+S/4uygoTNlm34v+
         SqFka2TWpIrBN0359xTkU6XalBDSpee1HKBhu9K6QpaEy5nPs5HXTx560l4P4F1MmVmr
         7EHzaJUI6eLCDFA9UDmMkY3MqTheVYNJuAS/yTgGH44yep4x+EAoYAJqCHvLp1MCUCAF
         Kdg6RJQNIAs+SeQYRVJKKOZAmiBo57qyoRH53O/q7CgzbQXL3Oaa4Ww7TucsAY3ilTIz
         pvfg==
X-Gm-Message-State: AOJu0YzwW3B0dZq+kIdeXnuqX6ydfbZVDKGwSVcZAmALQB/mg6zO+tRt
	bjK0UXY7XuH3UVFa0CnbWeQCA8kQ3R5oocGhd5lbrWz09y+Uw0yWt7gaJDWZHKF5tKDw1A==
X-Gm-Gg: ASbGncuEbB+4yLcCWV1g9myEue1ftldbSuDOGnwvoL4q1R6fxMoXLWL5C6kHrzVSlnm
	euAajoYN2AaXBpwVbgQnhN9AL7mlFNcBY+4LwVmdmVW1y0YnJ28NdUG9eY+xzmh+xaL3z/yPAaH
	EYAD0uBeS5lsb8/tpG/c1bHxF9a4qQMRvvy5eU44O/84pUYGLuRuFQPTQeejhQ6K0vmBxtaaU6n
	HvQUy2czvzUSVCRhq1ebL7NwA+LwaEdbn3Vijqs17QU4Mtz4c9Ze3noPZxG/gsz/JnNSolQakMz
	yyqSAI9OvG+/bTD0urLXuqwFXnkUKFQmqFBxhdeJbcyg/TGb//nLzUPbJoMyQTaVry0ittst6Uh
	MC9LJl9ODW785tT0N7k5qRr5z28iH
X-Google-Smtp-Source: AGHT+IGobE8D9Toxi9X3qI1AGxlvvF1VmPQsB6OvKbpf/Cc/KmYOzBV7OSdW4Xs6nYrVMftQmKYVyw==
X-Received: by 2002:a05:600c:8207:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-450d652794amr27149965e9.13.1748600684043;
        Fri, 30 May 2025 03:24:44 -0700 (PDT)
Date: Fri, 30 May 2025 12:24:42 +0200
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Subject: Re: [PATCH] x86/hvmloader: don't set xenpci MMIO BAR as UC in MTRR
Message-ID: <aDmHaoW8eiTfkxuA@gmail.com>
References: <20250530092314.27306-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530092314.27306-1-roger.pau@citrix.com>

On Fri, May 30, 2025 at 11:23:14AM +0200, Roger Pau Monne wrote:
>The Xen PCI device (vendor ID 0x5853) exposed to x86 HVM guests doesn't
>have the functionality of a traditional PCI device.  The exposed MIO BAR is
>used by some guests (including Linux) as a safe place to map foreign
>memory, including the grant table itself.
>
>Traditionally BARs from devices have the uncacheable (UC) cache attribute
>from the MTRR, to ensure correct functionality of such devices.  hvmloader
>mimics this behaviour and sets the MTRR attributes of both the low and high
>PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.
>
>This however causes performance issues for the users of the Xen PCI device
>BAR, as for the purposes of mapping remote memory there's no need to use
>the UC attribute.  On Intel systems this is worked around by using iPAT,
>that allows the hypervisor to force the effective cache attribute of a p2m
>entry regardless of the guest PAT value.  AMD however doesn't have an
>equivalent of iPAT, and guest PAT values are always considered.
>
>Linux commit:
>
>41925b105e34 xen: replace xen_remap() with memremap()
>
>Attempted to mitigate this by forcing mappings of the grant-table to use
>the write-back (WB) cache attribute.  However Linux memremap() takes MTRRs
>into account to calculate which PAT type to use, and seeing the MTRR cache
>attribute for the region being UC the PAT also ends up as UC, regardless of
>the caller having requested WB.
>
>As a workaround to allow current Linux to map the grant-table as WB using
>memremap() special case the Xen PCI device BAR in hvmloader and don't set
>its cache attribute as UC.  Such workaround in hvmloader should also be
>paired with a fix for Linux so it attempts to change the MTRR of the Xen
>PCI device BAR to WB by itself.
>
>Overall, the long term solution would be to provide the guest with a safe
>range in the guest physical address space where mappings to foreign pages
>can be created.
>
>Some vif throughput performance figures provided by Anthoine from a 8
>vCPUs, 4GB of RAM HVM guest(s) running on AMD hardware:
>
>Without this patch:
>vm -> dom0: 1.1Gb/s
>vm -> vm:   5.0Gb/s
>
>With the patch:
>vm -> dom0: 4.5Gb/s
>vm -> vm:   7.0Gb/s
>
>Reported-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
>Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Also
Tested-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>

