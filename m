Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCD68C57E6
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721568.1125075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6t7f-0001IL-FR; Tue, 14 May 2024 14:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721568.1125075; Tue, 14 May 2024 14:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6t7f-0001G3-CH; Tue, 14 May 2024 14:27:19 +0000
Received: by outflank-mailman (input) for mailman id 721568;
 Tue, 14 May 2024 14:27:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6t7d-0001Fx-Ie
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:27:17 +0000
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ffdad04-11fe-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 16:27:16 +0200 (CEST)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-43de92e236fso40396061cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 07:27:16 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e251233c6sm13445221cf.84.2024.05.14.07.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 07:27:15 -0700 (PDT)
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
X-Inumbo-ID: 0ffdad04-11fe-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715696835; x=1716301635; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rh9kVC5CL/PTjZKOoNWg1FSAjsf22ptRuCD3BlIjHzA=;
        b=My3xIcIlqN/gX2p0T8tJsBKcqyqiuK95RsGOXdRm2pejdx60rkfhh8JzK6oN3LEF2Z
         5Q7gcijOkFYaumQEHX2YKI5stLhtjoXSAaubD/nv1qfz+iABb5koVaXsmerxSEoqvHjE
         BHNwfNw0BpJcxlRQzUpiAIhXH7msFr38KjY9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715696835; x=1716301635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rh9kVC5CL/PTjZKOoNWg1FSAjsf22ptRuCD3BlIjHzA=;
        b=JOOHzjO5Z/Qa8xqwa1IjMIT7AvhHu2AfDhldph9mlopGLsaU05j1LmVoTbARP0MKFY
         Bc+v02NuB1Cdh8+lqpyufCOE64eRd6NGjvan/sg4il+yh+UYLZ8zxMokmN1vtEv90rrs
         jerakSPkwZTFd8DCXmURqEAABV3h8yUWSLUE5otW/4GcOc/Np1YMj4KtZVlTSoiAhgSK
         82GWVTLxyCh+SZlJJ6NiMkZWZ9XzSbBFp4c5tLBu8d23s2joR81Yr3CFjPebz7Fb//YZ
         a9bXABiL9/WmEQNmqv60zdtIGAPOy2ulqN5RVBBc4eLZQS35+TOkWROFUQdFH1Y+Vgp1
         vjVg==
X-Gm-Message-State: AOJu0YynYIXjHC+cH/fJiUiTSH4TbY9JgYEtOl3LGZtg/uvBQo5VGpv0
	/cragsCd5uctf+Ew5m0u3zeq1Y9+oJpH0CSPchbNJJi47zt7h6GWBMnIl+QE0nV2p6cNJUPkjjg
	r
X-Google-Smtp-Source: AGHT+IH0M00lNZ551UtLzz8kx5B1WY2R48FaCeN1Ht6YvSkEhOQy4vzqBsB8xYbLN6dDOBCwZU1OFw==
X-Received: by 2002:a05:622a:34d:b0:43d:f9b6:d5bf with SMTP id d75a77b69052e-43dfdb4e58emr150195051cf.33.1715696835357;
        Tue, 14 May 2024 07:27:15 -0700 (PDT)
Date: Tue, 14 May 2024 16:27:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 3/4] tools/xen-cpuid: Use automatically generated feature
 names
Message-ID: <ZkN0wXbVu-sbCNdf@macbook>
References: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
 <20240510224002.2324578-4-andrew.cooper3@citrix.com>
 <ZkMYXSf9abR3J3FE@macbook>
 <58577656-d1c9-4f54-9526-83bdbcaa37a6@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58577656-d1c9-4f54-9526-83bdbcaa37a6@citrix.com>

On Tue, May 14, 2024 at 02:05:10PM +0100, Andrew Cooper wrote:
> On 14/05/2024 8:53 am, Roger Pau Monné wrote:
> > On Fri, May 10, 2024 at 11:40:01PM +0100, Andrew Cooper wrote:
> >> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> >> index 6ee835b22949..2f34694e9c57 100644
> >> --- a/tools/misc/xen-cpuid.c
> >> +++ b/tools/misc/xen-cpuid.c
> >> @@ -291,6 +292,9 @@ static const struct {
> >>  
> >>  #define COL_ALIGN "24"
> >>  
> >> +static const char *const feature_names[(FEATURESET_NR_ENTRIES + 1) << 5] =
> >> +    INIT_FEATURE_VAL_TO_NAME;
> > I've also considered this when doing the original patch, but it seemed
> > worse to force each user of INIT_FEATURE_VAL_TO_NAME to have to
> > correctly size the array.  I would also use '* 32', as it's IMO
> > clearer and already used below when accessing the array.  I'm fine
> > if we want to go this way, but the extra Python code to add a last
> > array entry if required didn't seem that much TBH.
> 
> I was looking to avoid the other BUILD_BUG_ON()'s, and in particular
> bringing in known_features just for a build time check.
> 
> Given that there's only one instance right now, and no obvious other
> usecase, I'd say this is better.  In terms of just xen-cpuid.c, it's
> clearly correct whereas leaving it implicitly to
> INIT_FEATURE_VAL_TO_NAME is not.

If you dislike my original attempt at doing this, what about casting
the literal array initializer created by gen-cpuid.py, so that the
result ends up looking like:

#define INIT_FEATURE_NAME_ARRAY (const char *[(FEATURESET_NR_ENTRIES + 1) * 32]) { \
...

Would that be better?

Regards, Roger.

