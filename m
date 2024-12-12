Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5C9EE66F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 13:16:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855977.1268749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLi6y-0000l9-Jb; Thu, 12 Dec 2024 12:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855977.1268749; Thu, 12 Dec 2024 12:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLi6y-0000iV-GF; Thu, 12 Dec 2024 12:16:08 +0000
Received: by outflank-mailman (input) for mailman id 855977;
 Thu, 12 Dec 2024 12:16:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLi6w-0000RY-Kd
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 12:16:06 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9390dfe-b882-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 13:16:00 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa692211331so109563666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 04:16:05 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6845ab4absm601774666b.73.2024.12.12.04.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 04:16:04 -0800 (PST)
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
X-Inumbo-ID: d9390dfe-b882-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734005764; x=1734610564; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7V68edYQP2aEXF1VyCS3KEISttMbFwrmg4hxeGHKVek=;
        b=r4MeX4aQz/9VaMQlsR1rZGveFHcL6Eaz6+Oykh54F3bXgiwu0L29e7Bh0kjj4VNMVL
         mr0ZICqNb6NCSj9fyc95wsYkBJ1jmDfEYI5czE6uKLLMFume3pXO5HvBJVyb4qYtVbSy
         EbYo+IwsYDOmowoCKBJmb4C9UvaeO/TtqGnCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734005764; x=1734610564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7V68edYQP2aEXF1VyCS3KEISttMbFwrmg4hxeGHKVek=;
        b=oKiXImlGQ9Q56dyttDtOM7K7bFFJl70VHwFPGCbmDwBkq3mKS22DEsIx7lw1q+LtnX
         bFh+0ij6MCIaRH62C7CysNAdMajO4UAh54dT8dHe5z6N0vb1RKLlTbmA1MxIHqEPepQr
         uf0sIDXRjDHfGV/u+75bpX9MTQBY3uBXkk+qkIbiTZ14APMzGleBXrU3OBUbC0vT4NEQ
         PdJu47gp5KGH2++r8qBFiezpWjknIkjdSh5ZuAXWLaP8xxH6ckpPJoCirz+aRhRexoah
         ADH/ns+djoXHrfOgIlHwTY9fzfFpa7bpHQZRDJtvMVPsXBd0MgsMXlIy7opqGbjH4CXl
         ukTg==
X-Forwarded-Encrypted: i=1; AJvYcCWdoKc+cvdNO+gKj6O1OvDMgsnn3fNVNn6wGdsESnmswJRqdZDHC520Hw6Qiw6Ka3Nyv8DE/crCXf8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjJjl8hoP0JkrZDaI2OFWPB2Y1qqQOT0lttko9BZzBTnJL6H1s
	vJNtj+L7zFgYgc2d3p8/vhEgNzjG4p2jSbSxpoZFIr0hUkXgtMoCy9IhqnTBT0k=
X-Gm-Gg: ASbGncunJLkfMLiREk6yceuS+TdyYhfk/6t3Zp7P9gdsFMmkDNBpJIikHndU8OJLXpG
	b4ljJ5bk1103+PSNJrsGx6841OTP8QhzK34gvkOKnSScbj/lZQ6tyCysG/AWPtx8Ueiy5ZLAgEj
	RjeevA3dB2Gt7WRxFd8bUr5b+kk+UCPz64iQNiSgB6PZNARMqSE3ss9Y0JgMswcFUpx7tUxhk9I
	GeD/DUJ2jZMEso/d+h7xBgTgSUF3AxfPI9TFEdCSAkX+SvcBmFKjcPCe5iC5cF5/g==
X-Google-Smtp-Source: AGHT+IHq4E6eazJeWhzfcEpXvLT1g5EzvyONB8lNUWWrEIweNHOVdUQ7/GhlFWMCtZYP1WRB8Y5ktQ==
X-Received: by 2002:a17:907:7da0:b0:aa5:b1bb:10db with SMTP id a640c23a62f3a-aa6c40bd748mr263706166b.1.1734005764630;
        Thu, 12 Dec 2024 04:16:04 -0800 (PST)
Date: Thu, 12 Dec 2024 13:16:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 19/35] xen/console: introduce console_set_owner()
Message-ID: <Z1rUAwq5kwp1kMWl@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-19-e9aa923127eb@ford.com>
 <Z1q3COsFN3J9G60E@macbook.local>
 <1e36f66b-a423-428c-9b22-8fd58450f119@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e36f66b-a423-428c-9b22-8fd58450f119@suse.com>

On Thu, Dec 12, 2024 at 12:59:30PM +0100, Jan Beulich wrote:
> On 12.12.2024 11:12, Roger Pau Monné wrote:
> > On Thu, Dec 05, 2024 at 08:41:49PM -0800, Denis Mukhin via B4 Relay wrote:
> >> +static struct domain *rcu_lock_domain_console_by_id(domid_t domid)
> >> +{
> >> +    struct domain *d;
> >> +
> >> +    d = rcu_lock_domain_by_id(domid);
> >> +
> > 
> > Nit: I would remove this newline.
> 
> Or even better make the function call the variable's initializer.

Indeed, didn't catch that one.

Thanks, Roger.

