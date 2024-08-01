Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333E944B92
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 14:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769683.1180580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZV7P-0006Zp-Vr; Thu, 01 Aug 2024 12:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769683.1180580; Thu, 01 Aug 2024 12:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZV7P-0006Wm-TE; Thu, 01 Aug 2024 12:41:19 +0000
Received: by outflank-mailman (input) for mailman id 769683;
 Thu, 01 Aug 2024 12:41:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8r7L=PA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZV7O-0006Wf-RG
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 12:41:18 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 582fffa9-5003-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 14:41:16 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so12546245e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 05:41:16 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282b8addd6sm56459325e9.20.2024.08.01.05.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 05:41:15 -0700 (PDT)
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
X-Inumbo-ID: 582fffa9-5003-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722516076; x=1723120876; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c0KA4laWBsCxag7t4EtP7W7Ugka2Ljaoh+/g4/ICyt8=;
        b=TAhSlhH9fgQlNY2D6F3ZLyEXc7ZzR+BVUsxoqbFoEZ+MMYjeC3n0T/EvmunOyycO7k
         1Hy45fXDZJ7y1ZL9EAJGc3K4WS/vi2KmY0rIGTbziuOMqAFR4nvqU4VYyx2kksv0FRuC
         bOD7ilpZ4xH5RTjNZfToA9Iz7iHij8eiNieis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722516076; x=1723120876;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0KA4laWBsCxag7t4EtP7W7Ugka2Ljaoh+/g4/ICyt8=;
        b=tKRbu4uBwRBobwhxNKzs7s/O0Yid16n0ivMvb/0DAIbT0oPcQSkrwe3Cm2SfZ//r6i
         4UFBeS5XBSyUNKHVM54FpkHWbGb1COCyCq5Vzzsa30pRbUf1FfKqOgEkqkG2lF6dycnM
         rfSfUHpvoc4X9T7Ip/Ex9htMnAWTfgVMuBA5IYL/Zmns5ZanWf2IFNxsu0hedV7LDGlA
         DCMikW3zbrLEZfHDQAD+bRfcewWak5cFYtOYTbL22icixkv5nKbP5dmrrdgOKLoluRfb
         1r1HopjQTbJ0WoSlYoWVLYkMwUk+JJS1orOBMqxWyEa2TJTghBFEDQjolS0Q1/VLicWD
         5Gxg==
X-Forwarded-Encrypted: i=1; AJvYcCVI3+aosx+6iEnyXpsyckpxuuVHPOvm+ZQsXDXNyqNOehxSluQ91MeQQOPYgDaK7RTPDsLVBbRH/cdzhUK/iK2ei9Gn8UDLXPYQ07XeKT0=
X-Gm-Message-State: AOJu0YzCyCUgbTlDeO0JV+mnPiKMKHs1FIkDNgnWNd2XB94OqFW4+Bs6
	gqwz8ERz6+0V+IcPPgambmRojHBKo3tJaHKTYvIVqqy6/bLl3I1KuWmP0casrF4=
X-Google-Smtp-Source: AGHT+IHATgLBjKMEVMlwRZV7uf0w44ZjAsE4Ckk/sFDp44O4gIVsZH6Dk379b/mL+SiIlkpJRQyUWw==
X-Received: by 2002:a05:600c:35d5:b0:426:5c36:f57a with SMTP id 5b1f17b1804b1-428e474bb69mr12839135e9.14.1722516075712;
        Thu, 01 Aug 2024 05:41:15 -0700 (PDT)
Date: Thu, 1 Aug 2024 14:41:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Message-ID: <ZquCatoi50cNI3qR@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com>
 <ZqtsQwZNyFzflDQt@macbook>
 <ec95b413-519d-46a4-be41-ebb6a375612a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec95b413-519d-46a4-be41-ebb6a375612a@suse.com>

On Thu, Aug 01, 2024 at 01:36:16PM +0200, Jan Beulich wrote:
> On 01.08.2024 13:06, Roger Pau Monné wrote:
> > On Mon, Jul 08, 2024 at 07:41:21PM +0800, Jiqian Chen wrote:
> >> Remaining comment @Daniel P . Smith:
> >> +        ret = -EPERM;
> >> +        if ( !irq_access_permitted(currd, irq) ||
> >> +             xsm_irq_permission(XSM_HOOK, d, irq, access_flag) )
> >> +            goto gsi_permission_out;
> >> Is it okay to issue the XSM check using the translated value, 
> >> not the one that was originally passed into the hypercall?
> > 
> > FWIW, I don't see the GSI -> IRQ translation much different from the
> > pIRQ -> IRQ translation done by pirq_access_permitted(), which is also
> > ahead of the xsm check.
> 
> The question (which I raised originally) isn't an ordering one, but an
> auditing one: Is it okay to pass the XSM hook a value that isn't what
> was passed into the hypercall?

But that's also the case with the current XEN_DOMCTL_irq_permission
implementation?  As the hypercall parameter is a pIRQ, and the XSM
check is done against the translated IRQ obtained from the pIRQ
parameter.

Not saying you question is not relevant, but we already have at least
one very similar instance of doing the XSM check against a value
derived from an hypercall parameter.

Thanks, Roger.

