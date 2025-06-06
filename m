Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BAEACFEF7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:14:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008259.1387524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNT9M-0007Il-VB; Fri, 06 Jun 2025 09:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008259.1387524; Fri, 06 Jun 2025 09:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNT9M-0007Fe-QR; Fri, 06 Jun 2025 09:14:08 +0000
Received: by outflank-mailman (input) for mailman id 1008259;
 Fri, 06 Jun 2025 09:14:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNT9L-0007FW-Pm
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 09:14:07 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9616ecc1-42b6-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 11:14:02 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so21510895e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 02:14:02 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a53229d9adsm1278618f8f.9.2025.06.06.02.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 02:14:00 -0700 (PDT)
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
X-Inumbo-ID: 9616ecc1-42b6-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749201241; x=1749806041; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+kRDJw2A6HRmYkmknLlDaEb2F350dVP5YmdjLdI5kB8=;
        b=RCJuoUtwN7oajH0B2Sp0qWkn4sxOHANq6aO8WlH3tXOnHiQXf7uKMMALSEEDqdj6lf
         E9OV6DO6sy1zwStXKwfb543l0cTIwn6lguWF5SfGDxVIh2VvSEmyrCnzpx8QGdEz3VSf
         GqS8QwBI8j06pD0UpF571ENVoLBUGJyMbqAsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201241; x=1749806041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+kRDJw2A6HRmYkmknLlDaEb2F350dVP5YmdjLdI5kB8=;
        b=NiFmizmNILyKh+5NbNYQ3X0MEF4sMqkYCvucfYVdZOKHI5rmBaXLUFiwtv9hGnsAps
         8LGVWxq8DTuJ7F0ValkuzUmNiYiAm1K2sNBrBwUPryrbkkmK9RUoieNXoHLfBIoJF9fY
         Ru7hEEZUYmALRoO8uFi4WaWE8bRwFtb7f5iGbFjOWn1vocwhrAb40FW3ZxSCZ9mshkoo
         TtZXec7s+FkSOM2nx2yGDW9UGLBKdZucY2d/R5iJsAMluB+Xfix8ELKqPRljmskYQq18
         5XswexffGFF8qllDTQBt9Ya26H2qfbTHz9+3SDooyvzz9KGdlHMv2Hf8nVGIXGY8B2ii
         4cVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4Zzx8lYa2Y/09HpSPPqn9yavNI2zy494jaT/sLt/RTJpaQJmBFsg14oT/cCAxQuFBl+J3UW1K4no=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzG7Dt21ls7nd+WC1dNR7fqWlhlxDn6IZBRy63nCKvgbi7aLVUO
	d9IP4Jqfl5V8tjH1oCScw7bvHRh+LatQeu1EAQJbhcQ/g3ra+D6gJynr7n/2UE2jnuI=
X-Gm-Gg: ASbGncsAhNYmlMMQtd5HEP8IqKk2rcK3S9ZxdiXYfIQXwK8+r/UJOUJJWetBvzF0QML
	kjnPXNtS7E4Wyh9uoGm40BhpiIV2dD8w0oJ8V8mbcj3FqMRc5ckGbIqlu0yyD54Azuhee+ziCoc
	Yt9qjwYLBV8UwnrOTeKE0KQi9LSUjd7SKRyN4uRoZNjlDCzxAJKKELlGU87tbnzCsfsVZgaFFl9
	3wJr+nmxiVNF79GhzFLaZl0Lmi7Ezkww7hAHbRACieozVdhblLAzzY/ACdWr91aUfpSMHtPunUz
	PUebiatAilCrBxrQdddNoUK+wdMxVdch4C2fjL/Yh+hvswMQJMJXF4mA/CWmxkaUFfCtwDVCWGP
	UTj7in1Uf7AA0bym5Hd4p+znWwGpMSw==
X-Google-Smtp-Source: AGHT+IEcl6uxqmbauJ9/VpdWI0a4BkY1cBa7klEKA+fULonAOoPCL1Z3WH1WJxAv4gEhY1b3MAbFLQ==
X-Received: by 2002:a05:6000:290c:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3a531cea375mr1994138f8f.48.1749201241284;
        Fri, 06 Jun 2025 02:14:01 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:14:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Message-ID: <aEKxWLdDDyzmNvGF@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-5-Jiqian.Chen@amd.com>
 <aEGSp-LKerGb-wIW@macbook.local>
 <BL1PR12MB58497C341C79658B7221A67FE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <752cff02-cef6-4a4c-80b9-eba3bbf9b264@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <752cff02-cef6-4a4c-80b9-eba3bbf9b264@suse.com>

On Fri, Jun 06, 2025 at 09:05:48AM +0200, Jan Beulich wrote:
> On 06.06.2025 08:29, Chen, Jiqian wrote:
> > On 2025/6/5 20:50, Roger Pau Monné wrote:
> >> On Mon, May 26, 2025 at 05:45:53PM +0800, Jiqian Chen wrote: 
> >>> +  }; \
> >>> +  static vpci_capability_t *const finit##_entry  \
> >>> +               __used_section(".data.vpci") = &finit##_t
> >>
> >> IMO this should better use .rodata instead of .data. 
> > Is below change correct?
> > 
> > +    static const vpci_capability_t *const finit##_entry  \
> > +        __used_section(".rodata") = &finit##_t
> 
> No, specifically because ...
> 
> >> Not that it matters much in practice, as we place it in .rodata anyway.  Note
> >> however you will have to move the placement of the VPCI_ARRAY in the
> >> linker script ahead of *(.rodata.*), otherwise that section match will
> >> consume the vPCI data.
> > I am sorry, how to move it ahead of *(.rodata.*) ?
> > Is below change correct?
> > 
> > diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> > index 793d0e11450c..3817642135aa 100644
> > --- a/xen/include/xen/xen.lds.h
> > +++ b/xen/include/xen/xen.lds.h
> > @@ -188,7 +188,7 @@
> >  #define VPCI_ARRAY               \
> >         . = ALIGN(POINTER_ALIGN); \
> >         __start_vpci_array = .;   \
> > -       *(SORT(.data.vpci.*))     \
> > +       *(.rodata)             \
> 
> ... this isn't - you'd move _all_ of .rodata into here, which definitely
> isn't what you want. What I understand Roger meant was a .rodata-like
> section, e.g. .rodata.vpci.* (much like it was .data.vpci.* before).

Indeed, my suggestion was merely to use .rodata instead of .data, as
that's more accurate IMO.  I think it should be *(.rodata.vpci) (and
same section change for the __used_section() attribute.

Thanks, Roger.

