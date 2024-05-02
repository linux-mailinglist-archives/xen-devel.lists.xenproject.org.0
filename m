Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480638B9C5C
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 16:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715855.1117814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2XWL-0003JJ-El; Thu, 02 May 2024 14:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715855.1117814; Thu, 02 May 2024 14:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2XWL-0003Gc-Bi; Thu, 02 May 2024 14:34:49 +0000
Received: by outflank-mailman (input) for mailman id 715855;
 Thu, 02 May 2024 14:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPCJ=MF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s2XWK-0003B2-AS
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 14:34:48 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ff1fd41-0891-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 16:34:47 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-78ecd752a7cso555524685a.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 07:34:47 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 e10-20020a05620a12ca00b0078d65fbde2bsm406490qkl.86.2024.05.02.07.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 07:34:46 -0700 (PDT)
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
X-Inumbo-ID: 1ff1fd41-0891-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714660486; x=1715265286; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h33R/j8iwl+jeKLC2uWicBtIIQspILXeWPCqycXkLtg=;
        b=NXAje8FUAkS58yhG1oEq/ie8R/XNF9b0PrP0nZaPb8mfDaHlzaP1pGR+kQri6/OIvI
         DJIhXvT/xcy/yMlEPoUema+uhqDd/WvKS7UW8MzqntROzKpnjrh3lBDwDu4r0juJBsqL
         zvF7ljEqELv8euRPBupF5hsTLh2y9DxMGo9is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714660486; x=1715265286;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h33R/j8iwl+jeKLC2uWicBtIIQspILXeWPCqycXkLtg=;
        b=jY21lebnOUQfA1H/d0KYoOK4s+VT4Q5Nug6aKDNe8/lCTcaPOkf3j0MbGN8fgRLpcl
         d2dXttC/z7R6dDJgJwLnVU8QMeu1XEZGjWEe/VblBpTE0NTM99sM1qS09OQdpsFqpe7D
         vkKdyORtirnAkcMe1onB5BEkHDZMwnm/rsEjHpkVlvZmaahISM+JvPFUWnHJwaxhuY0l
         Fac4iw3iODdaUfTluima4p0xLW8//5X3mHLxNwz6tU8z2IAVGV/q93Uc6jqQo/v95ydZ
         txOgjUg+Np5MPEoEbO3IdxjCHOhmzrYAYlTKVdmAS5r91VHtDPfL9y2rUUDWuwJjqIg5
         BCzw==
X-Forwarded-Encrypted: i=1; AJvYcCVplxiQzMXdSZfSayBx6fA09aVIm0a7Wv8B2ahPEXhom/2FMneIVjw2nLPc3neVOPPJedNMY/5TeOCyNcYp/IFTHCkDOhPJ8BVPJjhrpfM=
X-Gm-Message-State: AOJu0Yzfi05qDGhpp1WJleBSPcu+J7VdM7J3Dj/acHYhMr6GQQkRlECp
	sA31RBx8ZufzZJuQADRKsydhxpU/JIcfhOapA0skRtmz22ALc0H+pZqtGLY6WRE=
X-Google-Smtp-Source: AGHT+IHKEwVIb8rtmfrTtO7fcepZoKajc4IyCRyfViGbhIgKyFC6qOjCUGZ72SSKkva65uBdtn89GA==
X-Received: by 2002:a05:620a:2158:b0:790:919c:2051 with SMTP id m24-20020a05620a215800b00790919c2051mr5840876qkm.5.1714660486577;
        Thu, 02 May 2024 07:34:46 -0700 (PDT)
Date: Thu, 2 May 2024 16:34:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19 v2] tools/xen-cpuid: switch to use cpu-policy
 defined names
Message-ID: <ZjOkhMGzHWEEdsQf@macbook>
References: <20240502114922.94288-1-roger.pau@citrix.com>
 <2ddc6307-c9a6-4ee8-9689-c9c2c5a37142@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ddc6307-c9a6-4ee8-9689-c9c2c5a37142@suse.com>

On Thu, May 02, 2024 at 03:16:54PM +0200, Jan Beulich wrote:
> On 02.05.2024 13:49, Roger Pau Monne wrote:
> > Like it was done recently for libxl, switch to using the auto-generated feature
> > names by the processing of cpufeatureset.h, this allows removing the open-coded
> > feature names, and unifies the feature naming with libxl and the hypervisor.
> > 
> > Introduce a newly auto-generated array that contains the feature names indexed
> > at featureset bit position, otherwise using the existing INIT_FEATURE_NAMES
> > would require iterating over the array elements until a match with the expected
> > bit position is found.
> > 
> > Note that leaf names need to be kept, as the current auto-generated data
> > doesn't contain the leaf names.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> except that ...

Thanks.

> 
> > --- a/xen/tools/gen-cpuid.py
> > +++ b/xen/tools/gen-cpuid.py
> > @@ -475,6 +475,32 @@ def write_results(state):
> >      state.output.write(
> >  """}
> >  
> > +""")
> > +
> > +    state.output.write(
> > +"""
> > +#define INIT_FEATURE_NAME_ARRAY { \\
> > +""")
> > +
> > +    try:
> > +        _tmp = state.names.iteritems()
> > +    except AttributeError:
> > +        _tmp = state.names.items()
> 
> ... can't figure what this try/except is needed for. Hopefully someone with
> better Python foo than mine can take a look.

If I understood this correctly (which I might have not, I know very
little Python), iteritems() method was removed in Python 3, and what
used to be iteritems() in Python 2 is items() on Python 3.

Regards, Roger.

