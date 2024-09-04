Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF4796B661
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 11:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789941.1199607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmCK-0001IG-An; Wed, 04 Sep 2024 09:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789941.1199607; Wed, 04 Sep 2024 09:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmCK-0001Gk-84; Wed, 04 Sep 2024 09:21:08 +0000
Received: by outflank-mailman (input) for mailman id 789941;
 Wed, 04 Sep 2024 09:21:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slmCJ-0001GO-C8
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 09:21:07 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 038a1d27-6a9f-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 11:21:06 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so733896966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 02:21:06 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898922276asm783889566b.204.2024.09.04.02.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:21:05 -0700 (PDT)
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
X-Inumbo-ID: 038a1d27-6a9f-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725441666; x=1726046466; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yvbBPy55F6+C55LFn36cXGk6iGW7NET8ApS9e3VIaKA=;
        b=kYUx408NAVdo43Kl+7ouSwzSjaSkLVue3Ivqm5Ovkp9SzwT+4AQTX1HI4LB5QgkOjU
         dJXlJDSddR+FJ79DB2B8YpDLEEfcX+HwC6qzDOhTuni4Qzya4nsR5sjn2WW2LjYPkNmA
         42+pKDFbJWv5+w66w6KOz4pBzzV7cg/d6fheE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725441666; x=1726046466;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvbBPy55F6+C55LFn36cXGk6iGW7NET8ApS9e3VIaKA=;
        b=gb12U+gB/fl3oK/b7denMVX7QEs5mgtWbA7twhXX+Rg9g7HnvrgSqHiSG4nw+Wm5/V
         3+DshOQreq9lz09dyNE09DUEqz+ReEkM5ErcngYGRlgytPJubz2B63uY8esofW6PCl+J
         cWYxPy3RsLjhHXmvN+hTd9gtSipZFwEy+M+n614fFeAOTM+LTAlqzEXKkBtCqUWUiEMC
         rzvFWH5HOKlEJFJd/KMRcHkgAFU/HPKKEfX2PxjJdgp+lFd2aKCi3TSAQBcIo16A6RHZ
         pmWhKizBdOsIxWBTY0cQmCb+0+exEdrad1uxDzTcgLZ2SvBI+151PaGEXferMg8xpWqJ
         iCew==
X-Gm-Message-State: AOJu0YxTfUnLWBCNSMAdwYmZD4wSdHacfWuP+Q5iVCSwu1iU7mQnyZAq
	yRwJ1f5WZFt2OcNb6cbfGOcUIZasT3c/CxjQc78Q8dCu47G4iUqJhzfzMlNCZXE=
X-Google-Smtp-Source: AGHT+IGXWnQ1WbmQQseyyHtrttXyk3f/cqun2X+YQeHz3j8Pz8KdI7tvHZEyVz5nS7PCXB8qkUqI5A==
X-Received: by 2002:a17:907:7206:b0:a86:a5a0:7613 with SMTP id a640c23a62f3a-a8a1d4c2db0mr587225066b.55.1725441665610;
        Wed, 04 Sep 2024 02:21:05 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:21:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3] SUPPORT.md: split XSM from Flask
Message-ID: <ZtgmgL1g_IW2JWUv@macbook.local>
References: <c648bfe1-6ab0-4429-ab8a-b452ad2359ff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c648bfe1-6ab0-4429-ab8a-b452ad2359ff@suse.com>

On Wed, Aug 14, 2024 at 09:44:11AM +0200, Jan Beulich wrote:
> XSM is a generic framework, which in particular is also used by SILO.
> With this it can't really be experimental: Arm mandates SILO for having
> a security supported configuration.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v3: Add explanations. Another terminology adjustment.
> v2: Terminology adjustments. Stronger description.
> 
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -769,13 +769,21 @@ Compile time disabled for ARM by default
>  
>      Status, x86: Supported, not security supported
>  
> -### XSM & FLASK
> +### XSM (Xen Security Module) Framework
> +
> +XSM is a security policy framework.  The dummy implementation is covered by this
> +statement, and implements a policy whereby dom0 is all powerful.  See below for
> +alternative modules (FLASK, SILO).
> +
> +    Status: Supported
> +
> +### FLASK XSM Module
>  
>      Status: Experimental
>  
>  Compile time disabled by default.
>  
> -Also note that using XSM
> +Also note that using FLASK
>  to delegate various domain control hypercalls
>  to particular other domains, rather than only permitting use by dom0,
>  is also specifically excluded from security support for many hypercalls.
> @@ -788,6 +796,13 @@ Please see XSA-77 for more details.
>  The default policy includes FLASK labels and roles for a "typical" Xen-based system
>  with dom0, driver domains, stub domains, domUs, and so on.
>  
> +### SILO XSM Module
> +
> +SILO implements a policy whereby DomU-s can only communicate with Dom0, yet not
> +with each other.

Might be good to clarify SILO is just like the dummy XSM
implementation without allowing inter-domain communication, ie:

"SILO extends the dummy XSM policy by enforcing that DomU-s can only
communicate with Dom0, yet not with each other."

Or similar.

Thanks, Roger.

