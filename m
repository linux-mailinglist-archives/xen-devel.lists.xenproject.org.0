Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEFBA68C92
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:15:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920496.1324649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusKg-00042y-FC; Wed, 19 Mar 2025 12:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920496.1324649; Wed, 19 Mar 2025 12:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusKg-0003zq-CN; Wed, 19 Mar 2025 12:15:38 +0000
Received: by outflank-mailman (input) for mailman id 920496;
 Wed, 19 Mar 2025 12:15:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiIg=WG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tusKf-0003zk-DG
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:15:37 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd15b5e0-04bb-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 13:15:36 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so5846662f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:15:36 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395cb7eb9d7sm20510810f8f.89.2025.03.19.05.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 05:15:35 -0700 (PDT)
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
X-Inumbo-ID: dd15b5e0-04bb-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742386536; x=1742991336; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7yok1QcGQoACln5BawssiDPZqhZeQ/jqdyKxpBNCp10=;
        b=ROA9t8SV/akkOGSnaRHA6JKPHsEOSkkqLLxofdPioGJvy/A/CAPKWrW9xPzAnx6Jav
         57zG3EkN50f68WunXYbHMEsE7hasbKSRHQkm4Tmfy5sqTDLOUFRVWyFpaNox1+NpZE78
         mUAguv69JCqchaaOkVvuhcR6t3kOWC3Dfoi7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742386536; x=1742991336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yok1QcGQoACln5BawssiDPZqhZeQ/jqdyKxpBNCp10=;
        b=gS7e9aVuO5+2NEM5+PL1L0726eXZgjf1q3L0wDOoPi3PE+AWyYw7nQ1VEUW3bbR/mn
         /JYqQvmNCW1QIs3MbW8itF5Kr0MYDc2siWUnmcXRRUPeu8ufTfOBt51hRRM7ii1e6TOZ
         HpOhyYMdHrsQOxjt97d28bKK8NnSmkDKk+D2eOJHTcmuJjnDu25N81+LA84rSwsiKe2R
         SoKfLK0/PyGZGqrStdwYl///kKGuf1ho8v2IeJnfHBB9eu8GQSOipxtM5PscNPTyl4Kr
         qBzlzxXNTXxRF08ngA8L6Zs+zLUQhB2cTEySGOvORUXPenwg7E0X7JojqqIucqF6qjRN
         +5sw==
X-Gm-Message-State: AOJu0Yz6pe/ICOz8Sr4RCvJb+mt/2i2FsOnXOtXyrJVlYJqSDYLUphJK
	W3p+Nor3xaQUPMhLnFIGv3YIUV98b65H6C6+t4vmJCcLfAZ5gMqdjrvIPZB3VtA=
X-Gm-Gg: ASbGncsDESgKDhyWGfN0jo8pkOQKKhzCzxROWII4rCl2Jq9MNriW4wqbvrsXCEd7KHn
	MgNZpt01RXzB/+0oZ6Qi5NPVjMDWlaCBC3h3eqWHVdNSDXp+BIMDZ+WIv4Vuu+3utY50kQOBpfO
	jrZEqOtXoHNgyhQr8+8ErvQiWofyYZTmcR2cw2HXZKHKPBhYmcGs1Qq6/vXIx2FAyvNSKc1phGz
	R1z6oZHntTEw1+ZcpISFPAqengYMSKXppzV7D/3nwlfXkIlaI+jjs2eOVu159vkWTLV1xaQcgaJ
	uSsiucT0FmpC9NHqWK44nbvZN2rkLO20rTog8k7ikzEnVRqVwyP0e4sB4JNd
X-Google-Smtp-Source: AGHT+IEk5Gz7DHOmHIpawzmTTE+yJTSXYvcuEBrJ1tp1q3dFOtJLFlXHYW7NMyVU2DHX4uY6oANqHQ==
X-Received: by 2002:a05:6000:1f82:b0:391:2bcc:11f2 with SMTP id ffacd0b85a97d-399739b6759mr2337188f8f.1.1742386535790;
        Wed, 19 Mar 2025 05:15:35 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:15:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86/setup: correct off-by-1 in module mapping
Message-ID: <Z9q1Zv9IEJOCycan@macbook.local>
References: <f346b510-dbd1-431a-ad35-3f1b8fe76c58@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f346b510-dbd1-431a-ad35-3f1b8fe76c58@suse.com>

On Wed, Mar 19, 2025 at 12:21:53PM +0100, Jan Beulich wrote:
> If a module's length is an exact multiple of PAGE_SIZE, the 2nd argument
> passed to set_pdx_range() would be one larger than intended. Use
> PFN_{UP,DOWN}() there instead.
> 
> Fixes: cd7cc5320bb2 ("x86/boot: add start and size fields to struct boot_module")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1730,7 +1730,7 @@ void asmlinkage __init noreturn __start_
>      {
>          unsigned long s = bi->mods[i].start, l = bi->mods[i].size;
>  
> -        set_pdx_range(paddr_to_pfn(s), paddr_to_pfn(s + l) + 1);
> +        set_pdx_range(PFN_DOWN(s), PFN_UP(s + l));

Is the set_pdx_range() provided smfn, emfn range inclusive?

>          map_pages_to_xen((unsigned long)maddr_to_virt(s), maddr_to_mfn(s),
>                           PFN_UP(l), PAGE_HYPERVISOR);

Isn't this line also bogus, as there's no guarantee that the start
address is aligned to PAGE_SIZE?  And hence the length should take
into account a possible page offset of s?

Thanks, Roger.

