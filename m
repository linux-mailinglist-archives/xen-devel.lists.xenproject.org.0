Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C34E87EF680
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 17:46:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635320.991212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r41ye-0002LP-Rt; Fri, 17 Nov 2023 16:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635320.991212; Fri, 17 Nov 2023 16:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r41ye-0002IO-OS; Fri, 17 Nov 2023 16:45:56 +0000
Received: by outflank-mailman (input) for mailman id 635320;
 Fri, 17 Nov 2023 16:45:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r41yc-0002II-OZ
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 16:45:54 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c529c0b9-8568-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 17:45:52 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so17168565e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 08:45:52 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c05d300b004081a011c0esm7523360wmd.12.2023.11.17.08.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 08:45:51 -0800 (PST)
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
X-Inumbo-ID: c529c0b9-8568-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700239552; x=1700844352; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVo6DqtPUzrFKz0gl1yax1yTDGlE+9FdDqEQaRRgmYo=;
        b=M9WAnZ2hzXBU2ooLPiiuLIA2y62CvnaD7ASAHfrPGf3MMlX3cj5OQXli9DDaig0U+d
         atigqkSa4nfSFNAsWJkPbymw8f2SQIXD+wUk3wCM9xhaBo2d7wER1XvtWn1n3LyoK0rt
         fwzRO6sIbgPgTSEP9UYgZx/sqhJWTPy5zT1GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700239552; x=1700844352;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVo6DqtPUzrFKz0gl1yax1yTDGlE+9FdDqEQaRRgmYo=;
        b=Lsah+33Z/JgvCjPm4G6m9HjaDtqoQlrBQgbGcOQdnNRlERbXwHLsaAdUfO4KE9s1Iw
         67sI55FfIwvEJIUzYV4HLEWtTUKHl0mhCbOM07iBz8jGvbd+GtRqntpDiIUjSwX0jfZa
         sgTyMCZbRgIWb13+MtWTG1KBB5w5YumTgwubPdd0DdTCVX8+KCSNmid4henllBluSdG/
         /naTh9VRaLj+SGlsfEYE3Z/X28m/w4JCTe/VCiUeRRb1stKYJeDmEEay00WyPCBUwUfH
         Seo0u6r6avekE3Fh4+IcdpaV/WIpZce9GlU6dX/OotrP0R+Pb5/QE+jKkTqPkGeCbL42
         0Zpw==
X-Gm-Message-State: AOJu0Ywr4pkZN/QTfPg//6qA0AtkKSyFQn/qZV5tzAQYfg2KTiMjnZLB
	O0xFB6RJ1gxO/Gxk5nmvl17S7zV9z1YTUVqvnKE=
X-Google-Smtp-Source: AGHT+IGnG6iTsOCEeWm1J9/vBV8FvHt1UXZ8jhBsSjIYIOIg9UodqxSKA+w49PcJtZA/V+3cAN5uWQ==
X-Received: by 2002:a05:600c:3c87:b0:402:8896:bb7b with SMTP id bg7-20020a05600c3c8700b004028896bb7bmr14473294wmb.6.1700239552120;
        Fri, 17 Nov 2023 08:45:52 -0800 (PST)
Date: Fri, 17 Nov 2023 17:45:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Message-ID: <ZVeYviUt9BIa6Y1B@macbook.local>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
 <ZVdfRQpGFSU1OIkh@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVdfRQpGFSU1OIkh@macbook.local>

On Fri, Nov 17, 2023 at 01:40:37PM +0100, Roger Pau Monné wrote:
> On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
> >      {
> > -        uint32_t val;
> > -
> >          val = r->read(pdev, r->offset, r->private);
> > +        val &= ~r->rw1c_mask;
> >          data = merge_result(val, data, size, offset);
> >      }
> >  
> > +    data &= ~(r->rsvdz_mask | r->ro_mask);
> > +    data |= val & r->ro_mask;
> 
> You cannot apply the register masks directly into the final value, you
> need to offset and mask them as necessary, likewise for val, see
> what's done in merge_result().

Never mind, I was wrong, there's no need to offset anything here.

Roger.

