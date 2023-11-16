Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569A07EE1F8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:54:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634248.989663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cpO-0000ks-Gr; Thu, 16 Nov 2023 13:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634248.989663; Thu, 16 Nov 2023 13:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cpO-0000jK-Dw; Thu, 16 Nov 2023 13:54:42 +0000
Received: by outflank-mailman (input) for mailman id 634248;
 Thu, 16 Nov 2023 13:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flNc=G5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3cpN-0000jE-Jn
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:54:41 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af5671b6-8487-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 14:54:39 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40a4848c6e1so5967315e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 05:54:39 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 j33-20020a05600c1c2100b0040772934b12sm3811491wms.7.2023.11.16.05.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 05:54:38 -0800 (PST)
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
X-Inumbo-ID: af5671b6-8487-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700142879; x=1700747679; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xKTzq8QmL5nph3FhIC9HZWC8JtqB3D3C6ffHzchqmkk=;
        b=blilvhxjyuNViquqR5rMeWZibLGuQjMPGfhhfOxW8REa0imRS/MyFTT+taL1iI+iwX
         JGVrJPD3L/7xLQ278ciJ241v+h7b/O9igf8e9TT7FE+TDYL1nePcdc9KW/k2ifMVlIAS
         b3GgjTHqeItz8ndRZe47aa6OWqyYpXvHnFMr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700142879; x=1700747679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKTzq8QmL5nph3FhIC9HZWC8JtqB3D3C6ffHzchqmkk=;
        b=CSmbAkqauRKakD6e1VXOchjc8WoNklhCJaHj+CKoSu3Tn8Cq0VS14XSeZEw1jw6fmW
         SJ+pWYtdKlo21q545Qu3K1U/9llBoCm6F3df6AZ9DSw8nB8fQFXibmbU2gXyoy6w0vG2
         ENdRD/BN+LpLEj4yBJlqP4W9CF27CV3MDQwLeq4gS83kDNwwCPym8OzHpQbtiasUhXFZ
         8Wg8isrBHh5IceFbPy/Gu1SCD+DaaSdaEkOxqNx9Y/7jFqMtK5A2XEmTGWoMyED8IUOY
         1qnYsb2qiuiyISFip8t8SBH6iRCvjHQOaTzqxxg7C01c2qZw7RenI982ehKrP6+SxAJQ
         bD4g==
X-Gm-Message-State: AOJu0YydY+b3o0g3v2z/cby5t50dAwXmHqTIHK8+1EqIefW4r0SVLj5O
	SEhPmntRn61kYdyNXhVkIxQxkg==
X-Google-Smtp-Source: AGHT+IH77B3Q+Kp9bzF8wZ5XOWEF2gQpbnxwyOu5e+1DXEzi/bJLN24ADA+Cuum3N8y4/S4aHQbH2g==
X-Received: by 2002:a05:600c:3596:b0:408:4160:1528 with SMTP id p22-20020a05600c359600b0040841601528mr12847381wmq.30.1700142878772;
        Thu, 16 Nov 2023 05:54:38 -0800 (PST)
Date: Thu, 16 Nov 2023 14:54:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] livepatch: do not use .livepatch.funcs section to store
 internal state
Message-ID: <ZVYfHQD1AEmNVY3h@macbook.local>
References: <20231116115841.71847-1-roger.pau@citrix.com>
 <d6634601-5006-475c-b386-97a1e53c5279@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d6634601-5006-475c-b386-97a1e53c5279@suse.com>

On Thu, Nov 16, 2023 at 01:39:27PM +0100, Jan Beulich wrote:
> On 16.11.2023 12:58, Roger Pau Monne wrote:
> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -991,10 +991,7 @@ struct livepatch_func {
> >      uint32_t new_size;
> >      uint32_t old_size;
> >      uint8_t version;        /* MUST be LIVEPATCH_PAYLOAD_VERSION. */
> > -    uint8_t opaque[LIVEPATCH_OPAQUE_SIZE];
> > -    uint8_t applied;
> > -    uint8_t patch_offset;
> > -    uint8_t _pad[6];
> > +    uint8_t _pad[39];
> 
> Should this be LIVEPATCH_OPAQUE_SIZE+8 and ...

Hm, I'm not sure that's any clearer.  In fact I think
LIVEPATCH_OPAQUE_SIZE shouldn't have leaked into sysctl.h in the first
place.

If we later want to add more fields and bump the version, isn't it
easier to have the padding size clearly specified as a number?

> 
> > --- a/xen/include/xen/livepatch.h
> > +++ b/xen/include/xen/livepatch.h
> > @@ -13,6 +13,9 @@ struct xen_sysctl_livepatch_op;
> >  
> >  #include <xen/elfstructs.h>
> >  #include <xen/errno.h> /* For -ENOSYS or -EOVERFLOW */
> > +
> > +#include <public/sysctl.h> /* For LIVEPATCH_OPAQUE_SIZE */
> > +
> >  #ifdef CONFIG_LIVEPATCH
> >  
> >  /*
> > @@ -51,6 +54,12 @@ struct livepatch_symbol {
> >      bool_t new_symbol;
> >  };
> >  
> > +struct livepatch_fstate {
> > +    unsigned int patch_offset;
> > +    enum livepatch_func_state applied;
> > +    uint8_t opaque[LIVEPATCH_OPAQUE_SIZE];
> 
> ... this use a separate, new (and internal only) constant? Thus also
> elimiating the need to include public/sysctl.h above?

The size of the buffer here is tied to the buffer size in
livepatch_expectation data field, so if using a different size
internally we would still need to ensure that the internal size is >=
LIVEPATCH_OPAQUE_SIZE, not sure there's much benefit in it.

In any case, I would suggest to do this in a followup patch, the
content in this patch is IMO enough.

Thanks, Roger.

