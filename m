Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37733AD6E44
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 12:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012835.1391347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfX3-0007kR-KH; Thu, 12 Jun 2025 10:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012835.1391347; Thu, 12 Jun 2025 10:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfX3-0007j0-HO; Thu, 12 Jun 2025 10:51:41 +0000
Received: by outflank-mailman (input) for mailman id 1012835;
 Thu, 12 Jun 2025 10:51:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy9=Y3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPfX2-0007iu-Hj
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 10:51:40 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3829f894-477b-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 12:51:39 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-450ce671a08so4510745e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 03:51:39 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a561b4bac4sm1606998f8f.74.2025.06.12.03.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 03:51:38 -0700 (PDT)
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
X-Inumbo-ID: 3829f894-477b-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749725499; x=1750330299; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zm4D+RVcWaiwl1TrPi8KZVeHXJ8qL9r8IMWFbqSI1bI=;
        b=F68oZiN24UVlgh2XX+CMEXt1JOS4pLr9IBwhAUnR6JNaYnVkb/Yp/To58s0URU7UU3
         FqA7JYUFp6xh+kytrYpOWin4ks7Elnw5dJeYHp/c8a+csJmMBeRW90ar/iNEeSEnExXk
         Oa5w2b4rVLkBNZdbWUeCLFBJozo1836nA2Svc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749725499; x=1750330299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zm4D+RVcWaiwl1TrPi8KZVeHXJ8qL9r8IMWFbqSI1bI=;
        b=FZBnVH52jzWg51DdhHvOndqqzEcnG7XV9aGyifpC9ks/e+/9742awx2chVAdoKjnWl
         aQZy3vyX6w4iYzVFSz6UaHl80xm0ocLMlfPNXUnZ4YSB53kfCUZm527KTM3IzGNYCeb3
         uaE/V2zdSPF+PCs5v5emQNXADsjJk8lXlIOEcaPvwVBLR/UDTYeV+7kTzJ5kqIgREU9a
         D4raj3KTO7h3lmiRhcugDTV5mp8CsjXVx/4e0jqmR7joLqeKA/lmNoXEkPdsYm4Gqmtf
         D/Et5eOE6L03MWmTY63zdyT6txGB7N4UOD6lYfjY4Gnt1MC0WKO2c0WtQqEyWguisbcF
         nY6g==
X-Forwarded-Encrypted: i=1; AJvYcCUUQEk2hOs4G5fOD4/f0iUoFzEDJwf1lygBRWY76I0OQcIgDRnNbLSw11oLfE/MdnexM0vC/+yKB/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf7GUydRqySaoaDnic9A5dJ9IP6HKTgU1uQC5dyoE6bShT+oo8
	yC1wL8DwkFd0+KPvuZOJviyMLThiz8+UrJ5Bkrnykv7+D1P8ntKCT1l6kZNxN8Apqnw=
X-Gm-Gg: ASbGncueRGfX1Q38xJcqhoINmzO8eP+5ukJY5cc/osan7fqY838rJnd/2yhdlTuS+sw
	QgTuWdssNjDB5GCEDfETxpaA7xuX0sXVCgrKpuTKR5/s1xpYW9dC7q8yZpoPV0IbreJbB+Bte6+
	k5ZXO/1pkBoBsgD5IJ/tH9CAQJG/4+WzsCODYx7DZ2jf/NVMuaEonkmz/LVyH3K1ausEYsjZa4U
	e+F/YfrWirw1xzE+9H1aLj5e/AvUubr/W8sAEIwOVnkFdoMl5+gp0/x4CbkFlk2gybX2+p0udAg
	YzgOhUBa6YqI5bNuoYxwduY33GeJ4Cr9lVf7OIl88wm3VOesVoGGsFuAzzujezljF0sLBT9Ybl0
	xtskQNIIWmWBtvZjwhb6KHfH66kGiFg==
X-Google-Smtp-Source: AGHT+IEzmb7KffDjEFlFz+b4Gz4b90xImAp4nWPoykROPuCzwuscM+aaxSvb5V2B+aGdEBd1ovQ/UA==
X-Received: by 2002:a05:600c:c490:b0:453:b1c:442a with SMTP id 5b1f17b1804b1-4532d317892mr20499515e9.27.1749725499297;
        Thu, 12 Jun 2025 03:51:39 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:51:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/8] pdx: provide a unified set of unit functions
Message-ID: <aEqxOmmdn_1eeGdg@macbook.local>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-5-roger.pau@citrix.com>
 <84080c88-b68f-4ab3-8b69-a3e45e9c74d9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <84080c88-b68f-4ab3-8b69-a3e45e9c74d9@suse.com>

On Thu, Jun 12, 2025 at 10:36:36AM +0200, Jan Beulich wrote:
> On 11.06.2025 19:16, Roger Pau Monne wrote:
> > @@ -80,6 +81,39 @@ unsigned long get_max_pfn(unsigned long top_pfn)
> >      return pdx_to_pfn(pdx - 1) + 1;
> >  }
> >  
> > +#ifndef CONFIG_PDX_NONE
> > +
> > +#ifdef CONFIG_X86
> > +# include <asm/e820.h>
> > +# define MAX_PFN_RANGES E820MAX
> > +#elif defined(CONFIG_HAS_DEVICE_TREE)
> > +# include <xen/bootfdt.h>
> > +# define MAX_PFN_RANGES NR_MEM_BANKS
> > +#else
> > +# error "Missing architecture maximum number of RAM ranges"
> > +#endif
> > +
> > +/* Generic PFN compression helpers. */
> > +static struct pfn_range {
> > +    unsigned long base, size;
> > +} ranges[MAX_PFN_RANGES] __initdata;
> > +static unsigned int __initdata nr;
> 
> One other remark / nit: For my taste, "nr" isn't a suitable name for a static.
> It's too short, and hence the risk is too high that some function would add a
> local aliasing this one.

Is nr_ranges enough to avoid aliasing?  Otherwise I could rename
ranges to pfn_ranges, and nr to nr_pfn_ranges.

Thanks, Roger.

