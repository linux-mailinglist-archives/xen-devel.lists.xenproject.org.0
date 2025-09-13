Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B61B56094
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 13:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123184.1466405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxOrQ-0005HI-PO; Sat, 13 Sep 2025 11:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123184.1466405; Sat, 13 Sep 2025 11:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxOrQ-0005Fp-L9; Sat, 13 Sep 2025 11:56:08 +0000
Received: by outflank-mailman (input) for mailman id 1123184;
 Sat, 13 Sep 2025 11:56:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oBHe=3Y=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uxOrO-0005FN-JM
 for xen-devel@lists.xenproject.org; Sat, 13 Sep 2025 11:56:06 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a09abb86-9098-11f0-9d13-b5c5bf9af7f9;
 Sat, 13 Sep 2025 13:56:05 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45de56a042dso17216085e9.3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Sep 2025 04:56:05 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f29174de1sm10869425e9.2.2025.09.13.04.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Sep 2025 04:56:04 -0700 (PDT)
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
X-Inumbo-ID: a09abb86-9098-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757764565; x=1758369365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YVwhMoFe1PU4VrHRnseDMYfClY1TX/o63ebu+sBig8s=;
        b=bU4n1px1Wf1HqR0kHYHYxmXTfZQ37/JBfxZiifxBZfVCM0yWR2M+evidYdt3M2E5aD
         fRm294NQhZPOpM5JZVaopBXufJBU6INSz/RTKx5KgxlkT/vSTYPvDDt9C9hEfNRMnDa8
         TFsXZbTmHhc6XqKY/elUYUwEqd5J4441pjzWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757764565; x=1758369365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVwhMoFe1PU4VrHRnseDMYfClY1TX/o63ebu+sBig8s=;
        b=waTNVquDMbXkgg7s5KM/+z7X05LCXf9ZcqsYuC9RoxIoMKfARrI/1NHYYc4QLGEpTq
         jvYDoU3nDCZcrgiY1SnSa7l1WKS47nM/rbFDZhLP6NINjX9KA2uO9u2xBEoO0kg3eANO
         eeCkmBYAvXtTAu9knw7EPEQtpsLEPVvOfsTs+9bWifrQhPSurYaD6bX92IDIJkY3yP/J
         l+zm1e90Dcs8biUn1/9mijX4N7XYkNAU7IXfiKpKGNCPYCnsd/AnufSG+q7mc1Ac+Zs8
         DchrTukBeLOb0zcdIYYanDB01eEH1jcbK43Cu3Q5nMhU6nF/xnL1oGIN/Ozirsz8YXVk
         /pMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfI1hRJ2QIdkBgL9+hYjD7G1wQjwujypGZsdNLXwPrX0wti0QgaOQE4elPny5OpI0eAsnj9e+dmP0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWkyTbJrwm+ESz7KO0SE9OsoRvmFuOgfKOCmWxd1wKQVEJnyTg
	vOIZdAeZl5PjcxGtrI0JomKSCs24jeH02pyIlRd0RuaE90SEhyRZCjc7qydqCqyJCPM=
X-Gm-Gg: ASbGncv217rYm18Jf+pzoQzNMW583TUmd1zTz0R0Tych2N8Eu09NbPuUVNt8nQ8yCC4
	leOACJHLcjag6XDl11QipD8IFC5Xd4SHjYFfH0xKL3NT+Y6CYEPYaRfGBKQofrJ5OvjDTE/S6by
	2qxX4huY5Ffa0bdQ1GbGhwTycXEHz7uYc+Uf5SJgichADiro2i4+2c3Wjx7aqr1I/pawreCK2PM
	2jg1z34iAeo8jV2EnB1pxUBrW7tFZmUbwcd5zpUZu6DZ5cjKLLSqlMYqKqEiVbyEJEpXj2ohsfo
	uc2jbO5TUBY3CZuxHRYzPjNVbU2QduxeRoGVyBCybB+tmQkecNySw0Q2Zc+jOsmO9SswFvuocnR
	bD+nnx7M+eaJAnU7Ofudjwps40mMvLD3OqbGhusdNilKmZt4azEvgZdV5fSTadsKmOF2I
X-Google-Smtp-Source: AGHT+IFMpVubaQB1SxParmZlHPl++SyKaXtezFsGGOZXZj/NAFjcZbavjHGLfPGVnddGQZXaBWVC6g==
X-Received: by 2002:a05:600c:4691:b0:45f:28d5:fae with SMTP id 5b1f17b1804b1-45f28d511f7mr10557045e9.4.1757764564593;
        Sat, 13 Sep 2025 04:56:04 -0700 (PDT)
Message-ID: <3ba29020-3a9b-4e10-8523-82bfb63482f6@citrix.com>
Date: Sat, 13 Sep 2025 12:56:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domctl: Fix double domid_free in
 XEN_DOMCTL_createdomain error path
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <37561a9a3b6000502bb1a43651f6ddc49cd9149c.1757759941.git.oleksii_moisieiev@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <37561a9a3b6000502bb1a43651f6ddc49cd9149c.1757759941.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/09/2025 11:44 am, Oleksii Moisieiev wrote:
> Remove redundant domid_free() call in the XEN_DOMCTL_createdomain error
> handling path to prevent a double-free condition.
>
> When domain_create() fails, it internally calls _domain_destroy() during
> its cleanup routine, which already invokes domid_free() to release the
> allocated domain ID. The additional domid_free() call in the domctl error
> path creates a double-free scenario, triggering an assertion failure in
> domid.c:
>
>     Assertion 'rc' failed at common/domid.c:84
>
> The domain creation flow is:
> 1. domid_alloc() allocates a domain ID
> 2. domain_create() is called with the allocated ID
> 3. If domain_create() fails:
>    a) domain_create() calls _domain_destroy() internally
>    b) _domain_destroy() calls domid_free() to release the ID
>    c) domctl incorrectly calls domid_free() again
>
> This double-free violates the domain ID management invariants and causes
> system instability. The fix ensures domid_free() is called exactly once
> per allocated domain ID, maintaining proper resource cleanup
> semantics.

Fixes: 2d5065060710 ("xen/domain: unify domain ID allocation")

> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

the tl;dr is that domain_create() either inserts the domain into the
domlist, or cleans up after itself.

The domid alloc infrastructure is problematic in multiple ways, not
least because it now means there are two sources of truth for which
domain's exist, and they are not interlocked.

I would have blocked this from being committed if I'd had any time to
look at it.  It will need remediating one way or another before 4.21
goes out.

~Andrew

