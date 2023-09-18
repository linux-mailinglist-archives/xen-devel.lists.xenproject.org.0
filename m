Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B2E7A55A4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 00:13:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604257.941515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiMUk-0004Cy-Oq; Mon, 18 Sep 2023 22:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604257.941515; Mon, 18 Sep 2023 22:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiMUk-0004AX-Lz; Mon, 18 Sep 2023 22:13:30 +0000
Received: by outflank-mailman (input) for mailman id 604257;
 Mon, 18 Sep 2023 22:13:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCDX=FC=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qiMUj-0004AR-N0
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 22:13:29 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96baf8b0-5670-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 00:13:26 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-403012f27e1so53806485e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 15:13:26 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (cpc92302-cmbg19-2-0-cust781.5-4.cable.virginm.net. [82.1.211.14])
 by smtp.gmail.com with ESMTPSA id
 hn40-20020a05600ca3a800b003fef19bb55csm13447199wmb.34.2023.09.18.15.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 15:13:25 -0700 (PDT)
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
X-Inumbo-ID: 96baf8b0-5670-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695075205; x=1695680005; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VufNTtcC8A50tBzWsfIQvIez/o1cGVdBWLqR6oYxSyA=;
        b=Ruos52wFaW1MiwuxE4QutMCdyNqqFT7CQ+vIDt8n0s5o+A8VrIS57/2ZYydPMTDurq
         4hq7KrtDinIuEbVXox0ZEMwCNPcQjcic/JUKwbdC7Sp9dacjcDStQktjKu08H+HMRGB8
         MVcJZ7ZBZm/qlOtEBu7/5Pe5mXnVvVJEexbtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695075205; x=1695680005;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VufNTtcC8A50tBzWsfIQvIez/o1cGVdBWLqR6oYxSyA=;
        b=RdXiZdozn/kINhCF+sawGNw+mMmax8UZJWRNNLjqH2XewBSDv8wnBOKqsHCjgLXVB/
         PHR/hU0S26wVKDgjiAIRrcbeidjHq4ZV8egC7jgDZ3kIyF6AxjT14k7MrZsAOEIDw5rv
         pFugrneW1J2yaE3llyxrQh1/j7SaR4wYacp/YOVShiXsrQZctzJzSOEjAxNuC9GKVL7T
         M87gkzVb8d5Ntp2OPBjJ/ZVHTnRvtUgI02hnVvx4/3hE5p0oBNS2n1EcEZXzvgARFwNG
         4UwI0MP8Ra/ih6BPzptg09f84KMSLFfL2ugdO2NQZnF4dbMB0i2ZbtkVIU4rhkb/anEg
         QQ0A==
X-Gm-Message-State: AOJu0YyEGULvDKGfDpgudNSSAilLH17eBd79XVOh3/5wD3ehkKwELb8D
	DPwFmoZElMqDupB24acVcx5Qwg==
X-Google-Smtp-Source: AGHT+IFkszWcElams76AAS21twN4oRF11GGiBy2fp1HfCFrGJVMDbluyo0tFm+SouqSMX5p1b27NWA==
X-Received: by 2002:a05:600c:152:b0:400:57d1:4913 with SMTP id w18-20020a05600c015200b0040057d14913mr8988867wmm.9.1695075205535;
        Mon, 18 Sep 2023 15:13:25 -0700 (PDT)
Date: Mon, 18 Sep 2023 23:13:23 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, 
	George Dunlap <george.dunlap@cloud.com>, Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH v2 2/5] tools: convert setup.py to use setuptools
Message-ID: <6qtmcuwngc2edlvyrx5zokr7vscktqptirbi7igvvgrgpvm52b@eyzjhtk73y5k>
References: <cover.1694450145.git.javi.merino@cloud.com>
 <9bbf71efc710dc869baf0c5ba926630e81181620.1694450145.git.javi.merino@cloud.com>
 <93ef8146-c8f5-586f-b754-b28b2b733222@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93ef8146-c8f5-586f-b754-b28b2b733222@citrix.com>

On Tue, Sep 12, 2023 at 11:22:56AM +0100, Andrew Cooper wrote:
> On 11/09/2023 5:51 pm, Javi Merino wrote:
> > From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> >
> > Python distutils is deprecated and is going to be removed in Python
> > 3.12. Migrate to setuptools.
> > Setuptools in Python 3.11 complains:
> > SetuptoolsDeprecationWarning: setup.py install is deprecated. Use build and pip and other standards-based tools.
> > Keep using setup.py anyway to build C extension.
> >
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Throughout the commit message, s/use/support/ seeing as we're not
> removing distutils.

Ok.

> Next, this needs a SoB from you because you've changed the patch from
> what Marek originally wrote.

Done

> > diff --git a/tools/pygrub/setup.py b/tools/pygrub/setup.py
> > index 502aa4df2d..f9e8feb2e6 100644
> > --- a/tools/pygrub/setup.py
> > +++ b/tools/pygrub/setup.py
> > @@ -1,5 +1,9 @@
> > -from distutils.core import setup, Extension
> > -from distutils.ccompiler import new_compiler
> > +try:
> > +    from setuptools import setup, Extension
> > +except ImportError:
> > +    # distutils was removed in Python 3.12.  If this import fails,
> > +    # install setuptools.
> > +    from distutils.core import setup, Extension
> 
> Finally, this feels a little unnecessary.  How about just:
> 
> # Prefer setuptools, fall back to distutils
> try:
>     from setuptools import setup, Extension
> except ImportError:
>     from distutils.core import setup, Extension

Done

