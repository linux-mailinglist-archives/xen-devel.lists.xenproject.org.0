Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E284FAB3A70
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:24:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981559.1367959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEU5A-0006mk-Ro; Mon, 12 May 2025 14:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981559.1367959; Mon, 12 May 2025 14:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEU5A-0006l4-PA; Mon, 12 May 2025 14:24:40 +0000
Received: by outflank-mailman (input) for mailman id 981559;
 Mon, 12 May 2025 14:24:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSlO=X4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uEU59-0006ku-0g
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:24:39 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5284b35-2f3c-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 16:24:37 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-acae7e7587dso701838466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:24:37 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad2198b68absm615254466b.182.2025.05.12.07.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 07:24:36 -0700 (PDT)
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
X-Inumbo-ID: d5284b35-2f3c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747059877; x=1747664677; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eQBc8XzwFzdX27I59BZQsi2Cmrxq4cC4Tv+THghJyy0=;
        b=AghHX/XpG6R0wXhf2XCWR9kZ2As8yvOaCDF+B0sueHyZ2gKOtJOSmDW12IM526gKSG
         BO0gzvCuK/BRemrRzfDMO4cXNz9Y/d4ANMOwMJy84k+yE45LFc9cxSCNZbPcZKN2ISwo
         5FWOMbY2Umtktr0ttW2I8cF/I3ZwNz0VFKwnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059877; x=1747664677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQBc8XzwFzdX27I59BZQsi2Cmrxq4cC4Tv+THghJyy0=;
        b=iHQv/vqpvcT4oeW6vBQa+wnojhW/NY6NJ+XiafpKAK4uHdZcq8YRqLaNL/PeUcpWvH
         mEwebF6txrod5CWgRAqeFggUnFrTTIM7W3CB2FX7FtQy6qfoybSVqCKl7n/6zKHj9jOA
         Es01z8ioOxbzQGgoQJZUGFpwTvDWKVI+9POf46OPZxwJwKvHf1h567mCFh/KUMYJwUz2
         n2IKUcGCD/GJTlKdUCZxKcPLbj6to0Gro4IQicK3hNwKSA6eP22Qu0DwwOKj1IZjthcd
         1Us1miZ/wiM+D7G3d9lKfAsXg6CcmGfcfpOQw668ZKjSTH6RTKXrXsqp+uqcdyZzZcaq
         dj9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLLwHJz3rea0+lzGvSDaf//gciYA/f0A8KE5w2xPgMGevOc7SbTN2KcBRt0k+xid58D78fK/NmYkw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0PTNSoTh+oibFKdya3YFEvO4xl1EBd20vT3n/jRMAD8kvh6xv
	sSkXX9aS3KidelUZOp1xjzQO6/PQELOWC+4JLkhX9vxpjy9IqJDhG0S7dG3/lRI=
X-Gm-Gg: ASbGncsl3zBOfNiWL48rlviT//YLRqecaztTzbqB8wborPU2rkR+JfcjwaddXhzFnQo
	848qx1wW1RvxVbes9Tbjztwdh6bviyunWtG3feSMtQvnplarpTxS7sdczNF2uIFkfeoNnREAmUx
	t4Z4ShUbF/m8vX6COHC1hhXtI1LGQE038fc4lKfBUmgEqVWQFZ1PssGGUawGf9LsacPa2/0/2jA
	R1uQgYIS7dwZ0XJOCyEnVZ8AHPHQl28mnhP4mU02J/9ZOyvxSpbLE5MJVY3YlGweC+DcjpBFdGw
	ICY88a090J+A6wtYsOH9Qh4s+YPeXNMxtwrJYMwxu3XCgIXijbPit8Wg
X-Google-Smtp-Source: AGHT+IG+kPfnwN5InV0/KtmER+TqBTRl8taDQ6oUhvcxCUXMALbAx+5JAXzdnXuah9sMbPo//ZKFug==
X-Received: by 2002:a17:907:944f:b0:ad2:42f3:86e0 with SMTP id a640c23a62f3a-ad242f389f9mr710138966b.27.1747059876586;
        Mon, 12 May 2025 07:24:36 -0700 (PDT)
Date: Mon, 12 May 2025 16:24:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/9] x86/pv: fix MMUEXT_FLUSH_CACHE to flush all pCPU
 caches
Message-ID: <aCIEo49pgE_5PJh7@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-2-roger.pau@citrix.com>
 <66f5d1f8-7d46-43e8-989a-040c3b1022bc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66f5d1f8-7d46-43e8-989a-040c3b1022bc@suse.com>

On Mon, May 12, 2025 at 04:11:51PM +0200, Jan Beulich wrote:
> On 06.05.2025 10:31, Roger Pau Monne wrote:
> > The implementation of MMUEXT_FLUSH_CACHE is bogus, as it doesn't account to
> > flush the cache of any previous pCPU where the current vCPU might have run,
> > and hence is likely to not work as expected.
> > 
> > Fix this by resorting to use the same logic as MMUEXT_FLUSH_CACHE_GLOBAL,
> > which will be correct in all cases.
> > 
> > Fixes: 534ffcb416bb ("Fix WBINVD by adding a new hypercall.")
> 
> Oh, and: I've looked up this hash, and found a "trivial merge". Are you sure
> here?

Indeed, sorry.  I've made a mistake and copied the wrong hash, it
should be 8e90e37e6db8.  The change subject is correct however.

Thanks, Roger.

