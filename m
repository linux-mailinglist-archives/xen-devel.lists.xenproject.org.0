Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1294C852A97
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 09:11:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679782.1057469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZnsj-0006ep-VY; Tue, 13 Feb 2024 08:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679782.1057469; Tue, 13 Feb 2024 08:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZnsj-0006ce-Ss; Tue, 13 Feb 2024 08:11:09 +0000
Received: by outflank-mailman (input) for mailman id 679782;
 Tue, 13 Feb 2024 08:11:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJZn=JW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rZnsi-0006cX-DI
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 08:11:08 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f56a1ca-ca47-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 09:11:05 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-410e7b08252so4289735e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 00:11:05 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 y12-20020a056000108c00b0033b40a3f92asm8871466wrw.25.2024.02.13.00.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 00:11:04 -0800 (PST)
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
X-Inumbo-ID: 6f56a1ca-ca47-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707811865; x=1708416665; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WyMBnM0DuyKb1MqB/cj3eU9Z2BMuh3mD8a7quXtJ5tc=;
        b=uR8I/6cuW+3BT3C8FKNbZy3S8JUrBKzvRmV3R1hHJh4d2lQIaCwdlK8pKDElyEkD87
         aB/aNdz7GfYUDGnm7MCxxsCFuYiECLtG6XlhtPc5p4xT5hC6DEa2QuQlMqfjFBabJexY
         ZALucrIosqWdhDWPLXeNZYCOI3KP3dis6atkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707811865; x=1708416665;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WyMBnM0DuyKb1MqB/cj3eU9Z2BMuh3mD8a7quXtJ5tc=;
        b=Jfwa5X1q0ymgFyPXU/z1u7gM3TB+/AjnmAZPmVXwsApjQGD/G+5mMjBIVfEGntHTrX
         5aSdOgUnfu/s8n8X3WY/PUcj2lyuuO8JEhVktmA0CcwGHk49u2z8Oeb72RFp4tntB5PO
         41UuRP4t1nLIi9S0PVEGYQ4bO3p8tmzOtVMxCQO4AJ5iz7Mc7YZAoNDMgXY0K8Ce7k10
         8L8APoQXmlpJ9qyv03PALeNC/CZLy1IapUtx0fAXlmZnj3zokOaD0Xo/SnJSenECWMa/
         pUXmLkLfjG1hD1Kw7+yDP44SznkTRjbvlCKYZtvwXiAClYiLVCIyUmFRQqD/R2MzKqRO
         nH+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKlPrVimP5CIcMXRfoIBcWoq+LPGlvCrvLLfqqBc+ZQpKC5G2WBy7Sa6Y7QfZ+NKm2BOljKghHPEGH4zuX3JcqX/NxeLLZf46c2mI0YKE=
X-Gm-Message-State: AOJu0YzX7hJQc4cDMfFZaKwgKyo+x8+Rbwc6itMUcJJzYqhHOcna7YUY
	a+Ark/RmuCRpkeLtE4EZ5OuXJDPMChzJf9FCEYtmldKnyGMJZwnZ6N3ZI0W8wGg=
X-Google-Smtp-Source: AGHT+IEzMyoEFgrOk1qX4+lP3za8Xq5oZmu2egfj/E857RKJEvEUqXHObwpz34VFG+j7RWXktr3PwA==
X-Received: by 2002:a05:600c:2342:b0:40f:20e:bf7d with SMTP id 2-20020a05600c234200b0040f020ebf7dmr7280059wmq.22.1707811865022;
        Tue, 13 Feb 2024 00:11:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXb8EnQy3Yxro3K6/q+b+bx8RlRsNFbUrgw9FyQzsuzVA0rdIuUNVgViFRoIvRliv4QsqqLe2V2V++lTX8cbS71EOueOEu+f1zqkuJbUCn7KpltP5zkSqrZGKxonIIPvubZRj1eWQaNiw==
Date: Tue, 13 Feb 2024 09:11:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] iommu/x86: introduce a generic IVMD/RMRR range
 validity helper
Message-ID: <ZcskGNrX7y3aFWes@macbook>
References: <20240207153417.89975-1-roger.pau@citrix.com>
 <20240207153417.89975-2-roger.pau@citrix.com>
 <ee4b4d25-e6db-4265-adc4-4080784495cf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee4b4d25-e6db-4265-adc4-4080784495cf@suse.com>

On Mon, Feb 12, 2024 at 03:34:59PM +0100, Jan Beulich wrote:
> On 07.02.2024 16:34, Roger Pau Monne wrote:
> > IVMD and RMRR ranges are functionally equivalent, and as so could use the same
> > validity checker.
> > 
> > Move the IVMD to x86 common IOMMU code and adjust the function to take a pair
> > of [start, end] mfn parameters.
> > 
> > So far only the AMD-Vi side is adjusted to use the newly introduced helper, the
> > VT-d side will be adjusted in a further change.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one minor remark:
> 
> > --- a/xen/drivers/passthrough/x86/iommu.c
> > +++ b/xen/drivers/passthrough/x86/iommu.c
> > @@ -792,6 +792,52 @@ static int __init cf_check adjust_irq_affinities(void)
> >  }
> >  __initcall(adjust_irq_affinities);
> >  
> > +bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
> > +{
> > +    mfn_t addr;
> > +
> > +    if ( e820_all_mapped(mfn_to_maddr(start), mfn_to_maddr(end) + PAGE_SIZE,
> > +                         E820_RESERVED) )
> > +        return true;
> > +
> > +    printk(XENLOG_WARNING "%s: [%#" PRI_mfn " ,%#" PRI_mfn
> > +           "] is not (entirely) in reserved memory\n",
> 
> Would you mind if I re-flowed this to
> 
>     printk(XENLOG_WARNING
>            "%s: [%#" PRI_mfn " ,%#" PRI_mfn "] is not (entirely) in reserved memory\n",
> 
> while committing?

Sure.  FWIW, when the line contains format specifiers I take that as a
point where splitting might be acceptable, since it already prevents
proper grepping.  Will try to remember to attempt to not split the
line.

Thanks, Roger.

