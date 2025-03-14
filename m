Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8284A60B5F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:27:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913976.1319822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0O9-0006oZ-WB; Fri, 14 Mar 2025 08:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913976.1319822; Fri, 14 Mar 2025 08:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0O9-0006n2-St; Fri, 14 Mar 2025 08:27:29 +0000
Received: by outflank-mailman (input) for mailman id 913976;
 Fri, 14 Mar 2025 08:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OT8H=WB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tt0O8-0006YE-Jo
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:27:28 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a182704-00ae-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 09:27:28 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so273055766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:27:28 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e816968ce3sm1680623a12.21.2025.03.14.01.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 01:27:27 -0700 (PDT)
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
X-Inumbo-ID: 2a182704-00ae-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741940847; x=1742545647; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fKa77kKpxPD/JSawjiCNVi266c75q7p0zUaSTijaQdE=;
        b=op+oW46CS6qQ+dneC2YM6HbwOhWWGPdm93Az5eugxaLhRg61a3DbXnAo4oBphyeXml
         OMKAEnd8m1v3ceJPjFtTeyYjcDP1qdv3FCLtBpescl3QOYr+O12Gly64EsTKJMFScsrb
         DRjc1A9y1oO5qSa5VMX3HoLl9EgxPSICcaA7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940847; x=1742545647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKa77kKpxPD/JSawjiCNVi266c75q7p0zUaSTijaQdE=;
        b=irne2PU/dhISJtoYdrBvwZRE2kmGFUboFxFMDDOBoOersdEHZ7pFgy1z8WddoYkftR
         tQ/KsXKWAQn9q5BoBrswd2tT4V+cM3HZva1neQI4mHuE0tpFszNwCAHmyvFACW3A8GCW
         chGHR8E7fbNEQIDi6uYqvpfN2PfKGSsuuECOyYHWRh7kIJpwxHpKnS19A5Yc34qQsWIG
         Wt6NmVrYwLdrSTR+yGaAgqe7bv5TpmhYn9EsSNu0BHEvYHTnV91HrGHDtF+xtYKsUPJE
         PGwK22DahhWgSsDzJzCaQr9jBKG3moV4FQ88rbzLOcRHXEX06qJN/DRLDTVsFnsJyC2B
         EN4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCn63c+pozNfsTSPKOrPaALuej82hFx0EdPKHJ4XBDVHWYLqxxasagt/VyGZz08BYgGswkvXKV0EI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBVN8PEpVAMOimgUOBoEPhZ9ueiNU8jKhIuq3B3R3SrUZJw+mh
	kaSRGjZcKKjGEdo8fGRcygKGzK1vUNkxsFMUNEg8ddrSlShJfAEeeotYwvQtivE=
X-Gm-Gg: ASbGnct9D3KZfOOvup7EiLJ/tmGgwv5E0UBmkVyhOonES2UPNst7hKaR+k0q434Z4TU
	Qm2f/vq4T/yPT2IUDpWCLY1Vtfrtfqm/MDM9NO8yJLUPlWsO0Cbc1BoM4UPpRygAMTo8ppfSW3A
	u5TeZHkGqOxwcSsBFgNGj0fsMM0j45/E91+FAqRpUjL83obpmY9Y8qqUX1mIqtoj8NtitCrIdA2
	D3L1IP/J0rRutPjP3mSOt7F987ZI8V4T1zzhNm5uSV8i05Wl1/nRnexCugIboJx664T0C7s13qv
	Cuty/X0eBpnhFlEZ7htL+881avepUvRC4raKR8Utq6JwklQzXw==
X-Google-Smtp-Source: AGHT+IFbB12w4ynwbGuCYVq1+RNtf2sCDspYiwNaUoM8+2XiwaNe1ZT0/9kHBUST+VBCJNu2Xqhcuw==
X-Received: by 2002:a17:906:4795:b0:ac1:e752:17d2 with SMTP id a640c23a62f3a-ac33026ab45mr160263066b.19.1741940847382;
        Fri, 14 Mar 2025 01:27:27 -0700 (PDT)
Date: Fri, 14 Mar 2025 09:27:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/7] x86/dom0: placate GCC 12 compile-time errors with
 UBSAN and PVH_GUEST
Message-ID: <Z9PobmG8lDy-oscG@macbook.local>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-4-roger.pau@citrix.com>
 <eaf90340-929c-4c89-99cf-0383918e9d5a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eaf90340-929c-4c89-99cf-0383918e9d5a@suse.com>

On Fri, Mar 14, 2025 at 09:10:59AM +0100, Jan Beulich wrote:
> On 13.03.2025 16:30, Roger Pau Monne wrote:
> > When building Xen with GCC 12 with UBSAN and PVH_GUEST both enabled the
> > compiler emits the following errors:
> > 
> > arch/x86/setup.c: In function '__start_xen':
> > arch/x86/setup.c:1504:19: error: 'consider_modules' reading 40 bytes from a region of size 4 [-Werror=stringop-overread]
> >  1504 |             end = consider_modules(s, e, reloc_size + mask,
> >       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >  1505 |                                    bi->mods, bi->nr_modules, -1);
> >       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > arch/x86/setup.c:1504:19: note: referencing argument 4 of type 'const struct boot_module[0]'
> > arch/x86/setup.c:686:24: note: in a call to function 'consider_modules'
> >   686 | static uint64_t __init consider_modules(
> >       |                        ^~~~~~~~~~~~~~~~
> > arch/x86/setup.c:1535:19: error: 'consider_modules' reading 40 bytes from a region of size 4 [-Werror=stringop-overread]
> >  1535 |             end = consider_modules(s, e, size, bi->mods,
> >       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >  1536 |                                    bi->nr_modules + relocated, j);
> >       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > arch/x86/setup.c:1535:19: note: referencing argument 4 of type 'const struct boot_module[0]'
> > arch/x86/setup.c:686:24: note: in a call to function 'consider_modules'
> >   686 | static uint64_t __init consider_modules(
> >       |                        ^~~~~~~~~~~~~~~~
> > 
> > This seems to be the result of some function manipulation done by UBSAN
> > triggering GCC stringops related errors.  Placate the errors by declaring
> > the function parameter as `const struct *boot_module` instead of `const
> > struct boot_module[]`.
> > 
> > Note that GCC 13 seems to be fixed, and doesn't trigger the error when
> > using `[]`.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/setup.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 4a32d8491186..bde5d75ea6ab 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -684,7 +684,7 @@ static void __init noinline move_xen(void)
> >  #undef BOOTSTRAP_MAP_LIMIT
> >  
> >  static uint64_t __init consider_modules(
> > -    uint64_t s, uint64_t e, uint32_t size, const struct boot_module mods[],
> > +    uint64_t s, uint64_t e, uint32_t size, const struct boot_module *mods,
> >      unsigned int nr_mods, unsigned int this_mod)
> >  {
> >      unsigned int i;
> 
> While I'm okay-ish with the change, how are we going to make sure it won't be
> re-introduced? Or something similar be introduced elsewhere?

I'm afraid I don't have a good response, as I don't even know exactly
why the error triggers.  We will rely on the CI to start doing
randconfig builds with UBSAN enabled (see patch 7/7).

Thanks, Roger.

