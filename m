Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EA884C6CB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 10:02:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677296.1053811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXdo8-0002Gh-CP; Wed, 07 Feb 2024 09:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677296.1053811; Wed, 07 Feb 2024 09:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXdo8-0002EU-9i; Wed, 07 Feb 2024 09:01:28 +0000
Received: by outflank-mailman (input) for mailman id 677296;
 Wed, 07 Feb 2024 09:01:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvxy=JQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rXdo6-0002EO-Rq
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 09:01:26 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7916f562-c597-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 10:01:25 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a29c4bbb2f4so47303166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 01:01:25 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 lj24-20020a170906f9d800b00a38599ba2d1sm511259ejb.118.2024.02.07.01.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:01:25 -0800 (PST)
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
X-Inumbo-ID: 7916f562-c597-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707296485; x=1707901285; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hRekonX+MjgbxnCNc9YwjzVl3WE2txkCIt6Y5xOA35Q=;
        b=YBj6lL+gMpMBjAmu5I0t8LWokPBb9Gz25aAyWjRDeHlXE35TGLChXanFx2xo7dkV13
         EEX3OGBiuhVKg1vWItuATR0Yhz96LI2yRB688VU39levfNZOOU8hn/xB74Biji63Fayw
         cyEsM3pxJdn9WygnJqMMzIkdc0ARn9iP979Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707296485; x=1707901285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRekonX+MjgbxnCNc9YwjzVl3WE2txkCIt6Y5xOA35Q=;
        b=RTVkpqB/I2fnEIh0yiAO3Qvv+UoN0sAdigEg8hKSYmsQsaF4d7dVfcjOmJ1UOTvnh/
         RfE3eFFtTfA2l+h3diLUZb7pFkD81JbCPKCZDhIVVcS2TuLzhpwIKlGKOtEJEZ7T6qQj
         ZVdfBfAFD5eFlano8rw5XXSeoG698qC8Bq0OM+uupoxF+4sn22fDWqWGeayY0DNvuCbW
         IDHD74WpILcIdkAyXKvQTElGrlkeMdMqPrQdL0mgRJYTf5Kj7HIdWOIVKswjwWKPAfdQ
         lGY7GA0dRu0pD0WrSU6tt0XGShVM4J4jxZ2P5B12u5ECtk0KctE61LN6yiBpxQqSaUip
         jLKw==
X-Gm-Message-State: AOJu0Yzak14fM/DO7FNipKC2HlSw/1P7aE81jToRFZf2bzbhLPFO7TtM
	eJl/K2KMp3hzFqbPjTMzr7xVfYlLoz6sst4NcdpLLAdb5G0adfXreb0/HKOXU5w=
X-Google-Smtp-Source: AGHT+IHB3w25zugsVwLODItPAS1DcwZ2c5AvOeJdV4n/n05x+tJ3ToCBEZapJZ5bi6pTkSaQUXawEA==
X-Received: by 2002:a17:906:1296:b0:a38:537:9598 with SMTP id k22-20020a170906129600b00a3805379598mr3489470ejb.17.1707296485316;
        Wed, 07 Feb 2024 01:01:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWivn7J+iIFw6MXZ2wFXOkvCJjCq8G5GkAG14G6eMH2R1L9hO0E2rfMxsOe9U+WcvvwFWyMTwZGkjz1kflQfJ7WujT1UHioB0ubmkJgk4Q=
Date: Wed, 7 Feb 2024 10:01:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/4] iommu/vt-d: switch to common RMRR checker
Message-ID: <ZcNG5C9gEzlcWJPw@macbook>
References: <20240201170159.66330-1-roger.pau@citrix.com>
 <20240201170159.66330-4-roger.pau@citrix.com>
 <90f8e183-5e78-49e8-ae2f-9898c1d7686b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90f8e183-5e78-49e8-ae2f-9898c1d7686b@suse.com>

On Tue, Feb 06, 2024 at 12:28:07PM +0100, Jan Beulich wrote:
> On 01.02.2024 18:01, Roger Pau Monne wrote:
> > Use the newly introduced generic unity map checker.
> > 
> > Also drop the message recommending the usage of iommu_inclusive_mapping: the
> > ranges would end up being mapped anyway even if some of the checks above
> > failed, regardless of whether iommu_inclusive_mapping is set.
> 
> I'm afraid I don't understand this: When not in an appropriate E820
> region, you now even fail IOMMU initialization. Shouldn't such
> failure only occur when inclusive mappings weren't requested? At
> which point referring to that option is still relevant?

This is now better handled, since the VT-d code will use the same
logic as the AMD-Vi logic and attempt to 'convert' such bogus RMRR
regions so they can be safely used.  iommu_unity_region_ok() signals
the RMRR region is impossible to be used, and hence not even
iommu_inclusive_mapping would help in that case.  Also note that
iommu_inclusive_mapping is only applicable to PV, so the message was
already wrong in the PVH case.

> Further to this failing - in patch 2 shouldn't the respective log
> messages then be XENLOG_ERR, matching the earlier use of
> AMD_IOMMU_ERROR()?

Oh, indeed, I've converted them all to WARN, when the first one is
indeed WARN, but the following two are ERROR.

> > --- a/xen/drivers/passthrough/vtd/dmar.c
> > +++ b/xen/drivers/passthrough/vtd/dmar.c
> > @@ -642,17 +642,9 @@ acpi_parse_one_rmrr(struct acpi_dmar_header *header)
> >             return -EEXIST;
> >         }
> >  
> > -    /* This check is here simply to detect when RMRR values are
> > -     * not properly represented in the system memory map and
> > -     * inform the user
> > -     */
> > -    if ( !e820_all_mapped(base_addr, end_addr + 1, E820_RESERVED) &&
> > -         !e820_all_mapped(base_addr, end_addr + 1, E820_NVS) &&
> > -         !e820_all_mapped(base_addr, end_addr + 1, E820_ACPI) )
> > -        printk(XENLOG_WARNING VTDPREFIX
> > -               " RMRR [%"PRIx64",%"PRIx64"] not in reserved memory;"
> > -               " need \"iommu_inclusive_mapping=1\"?\n",
> > -                base_addr, end_addr);
> > +    if ( !iommu_unity_region_ok(maddr_to_mfn(base_addr),
> > +                                maddr_to_mfn(end_addr + PAGE_SIZE)) )
> > +        return -EIO;
> 
> Hmm, noticing only here, but applicable also to the earlier patch: The
> "RMRR" (and there "IVMD") is lost, which removes some relevant context
> information from the log messages. Can you add a const char* parameter
> to the new helper, please?

I debated myself whether to keep the RMRR/IVMD prefix, but I didn't
think there was a lot of value in it, since whether it's an RMRR or an
IVMD region can be deduced from previous messages.  Anyway will pass
the prefix as a function parameter.

Thanks, Roger.

