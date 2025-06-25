Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B596AE87AB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 17:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025215.1400855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uURpN-0008UR-Q9; Wed, 25 Jun 2025 15:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025215.1400855; Wed, 25 Jun 2025 15:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uURpN-0008Ra-Lb; Wed, 25 Jun 2025 15:14:21 +0000
Received: by outflank-mailman (input) for mailman id 1025215;
 Wed, 25 Jun 2025 15:14:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7fe=ZI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uURpM-0008Q9-Fr
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 15:14:20 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1093de12-51d7-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 17:14:19 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so34150b3a.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 08:14:19 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b320ef71cf5sm8918135a12.77.2025.06.25.08.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 08:14:17 -0700 (PDT)
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
X-Inumbo-ID: 1093de12-51d7-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750864458; x=1751469258; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EhFoht+ZsIrNOntSfCCAOP4S5UhiAYMnhAPoQTjIBi8=;
        b=Er1OQwyUdCizAza5Bg/j6K5+4AG0MZSQsAnOiXUSWF0kZ4+1ph/gyg3L6wJDJiwmAI
         dDbWn45taqO+O9ofUlm++WDtit402XqUB5SRGscdQ7KSFlluwlAM4wWjkqa/UABXYWLL
         zK5cxSV07J7lDWkFDMUcocz8+OoQBawQbuR5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864458; x=1751469258;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EhFoht+ZsIrNOntSfCCAOP4S5UhiAYMnhAPoQTjIBi8=;
        b=tnUZ8fdlYgTsiVwJFtVPvpr5AwCBoO0XyWIriQQNiggCObIBUeOfZtXzUFwUPKF7m1
         MVWVYzh33f8mlIYE1el5ipMcwqeXBPyIh3drU8l7mMtmpECnccM1IYTmGAh8K8z3TMLG
         UzaazNpExeTIpuoVwwFaxIDbgMPAx60adaFu1d1iclmu1lMBiY2YI3unNWyICLjt+lik
         PaMvmNZlL67en4AFXBoa0FZ15I3xE+js0RfY/s1c51y9XnLW5BFKwfrAkYrcIq8n/K9q
         XarfSIWn+aeKhVJ0eL82nlTcQW6fPI0Cr4rgatAJfUTP4/hYQOqvIohA9BcT8bqgM69Y
         fBvw==
X-Forwarded-Encrypted: i=1; AJvYcCWsyQgdb28i8/OwurQNzpHuyEtgfOyvcIE0myFCh3hkOR20I3cklcnnsQSMcnqqM6voH9XqxugiPhM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytuPX76X+Hd7TWXiKrDwtLY4YiLvMgQSed+hyUb+2lffEf+4zs
	VhQtY5iKyFfxvlebiMD6YDDRuy5mFSuFj6TNZxbCAFhYvHxgyLgsfKGQTmhZq9uDQuY=
X-Gm-Gg: ASbGnctLjIm/ytEM5D7WhPFhhYBm2VqSPbWixGr1nsva364GWkUw+HXZUqnIjC4KGBW
	uhjThi4d7Hm3eGnQJ4/ThhOT6wkYTUpGIr1WcidPaajDh5bG6dHwMvvHxJxOvO7xVt6SH4npHYf
	ugUhb9d7BQvRrQH8lXUd2k4iZ24cSGw2DF6mOQiNJ2EQ68SXLHLUItCO3HK2CGiDQpdnjfXGoVw
	bAIp+tCpNF/1qmmjpw/YYhZ+sLqD/E0nptW9wmi1Eaj8LixmhS+LErUqpfKJjFp7P/xzcDPI8H4
	ExX6FlvmLzFfkPaVLYbc+ySm3RT9BRP0STQ31iyBRpvT5D/2TVUWTcGmSjPoeqUekrgIoI2ISl0
	qzNncLAnmMQpMxMhnl522/dBLikmstg==
X-Google-Smtp-Source: AGHT+IF9BzxdrwxNcQZxU0a9LJzENuHzYiLNvleTDUqVxQhnmx00tQ8+e4hf26rreoE0jbaFe354eg==
X-Received: by 2002:a05:6a20:e30b:b0:203:c461:dd36 with SMTP id adf61e73a8af0-2208c08a537mr371930637.6.1750864457947;
        Wed, 25 Jun 2025 08:14:17 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:14:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/8] x86/pdx: simplify calculation of domain struct
 allocation boundary
Message-ID: <aFwSRM_RaabXFj9q@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-2-roger.pau@citrix.com>
 <e897b424-0bc2-4346-8c3b-3b22837e9481@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e897b424-0bc2-4346-8c3b-3b22837e9481@suse.com>

On Tue, Jun 24, 2025 at 03:05:11PM +0200, Jan Beulich wrote:
> On 20.06.2025 13:11, Roger Pau Monne wrote:
> > When not using CONFIG_BIGMEM there are some restrictions in the address
> > width for allocations of the domain structure, as it's PDX truncated to 32
> > bits it's stashed into page_info structure for domain allocated pages.
> > 
> > The current logic to calculate this limit is based on the internals of the
> > PDX compression used, which is not strictly required.  Instead simplify the
> > logic to rely on the existing PDX to PFN conversion helpers used elsewhere.
> > 
> > This has the added benefit of allowing alternative PDX compression
> > algorithms to be implemented without requiring to change the calculation of
> > the domain structure allocation boundary.
> > 
> > As a side effect introduce pdx_to_paddr() conversion macro and use it.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> > @@ -498,14 +474,20 @@ struct domain *alloc_domain_struct(void)
> >       * On systems with CONFIG_BIGMEM there's no packing, and so there's no
> >       * such restriction.
> >       */
> > -#if defined(CONFIG_BIGMEM) || !defined(CONFIG_PDX_COMPRESSION)
> > -    const unsigned int bits = IS_ENABLED(CONFIG_BIGMEM) ? 0 :
> > -                                                          32 + PAGE_SHIFT;
> > +#if defined(CONFIG_BIGMEM)
> > +    const unsigned int bits = 0;
> >  #else
> > -    static unsigned int __read_mostly bits;
> > +    static unsigned int __ro_after_init bits;
> >  
> >      if ( unlikely(!bits) )
> > -         bits = _domain_struct_bits();
> > +         /*
> > +          * Get the width for the next pfn, and unconditionally subtract one
> > +          * from it to ensure the used width will not allocate past the PDX
> > +          * field limit.
> > +          */
> > +         bits = flsl(pdx_to_paddr(1UL << (sizeof_field(struct page_info,
> > +                                                       v.inuse._domain) * 8)))
> 
> You didn't like the slightly shorter sizeof(frame_table->v.inuse._domain) then?

No strong opinion really, I have the impression however that using the
struct type itself would be less fragile, in case we ever change
frame_table variable name (which is very unlikely).

Roger.

