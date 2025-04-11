Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538C4A85732
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 11:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946868.1344622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3AFk-0005Zj-Bv; Fri, 11 Apr 2025 09:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946868.1344622; Fri, 11 Apr 2025 09:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3AFk-0005Vt-7r; Fri, 11 Apr 2025 09:00:48 +0000
Received: by outflank-mailman (input) for mailman id 946868;
 Fri, 11 Apr 2025 09:00:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3ez=W5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u3AFi-0005UQ-Rr
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 09:00:46 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 730cd568-16b3-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 11:00:43 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so18441045e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 02:00:43 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39eae964048sm1377675f8f.2.2025.04.11.02.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 02:00:42 -0700 (PDT)
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
X-Inumbo-ID: 730cd568-16b3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744362043; x=1744966843; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X/lc/sNSWnsgecAC+1446BWHagN77myPzjR6bOxLtHE=;
        b=blUdUIelRBTlCe1aKZ57zWxSv9FiBm6zUnMJkD3pqhW6ezfd9Ek71ieidayR5L5jsQ
         xZ6I4F+ONqhacSVyFN3LF78qh8kCKVcAMUkO/bvsfkHUFfIzuvU8ntiKym+oaP3A+GX2
         ttTgz2mLLRNT9fuKNe+SCbgDcA5tQSXiDiSW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362043; x=1744966843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/lc/sNSWnsgecAC+1446BWHagN77myPzjR6bOxLtHE=;
        b=hwKJr2thsGp4EJ9jIfuG9JoiGMy6RiUCbnmGlY0+fWwYaxM/LuztDhaxtK1l1CWUl9
         OYYixv+NzLtilaEDF8Fi3zenyTTlxjdMf83M+1Ormeex+nKiszQVUH6PHkFf3EtquTvo
         sW+AX1ZAMDFf7pTEKUbq5WQQC0pr/URmN4uFWvJkIu+jQS9lLOFsoSQ5dXeXMINu1eSt
         Pr/Ko66P56pr1VQJRJNPDsdqSoMuLl9JXoROr7rFxQkGylag4zLUHBNCkQfricONOnac
         yhauueFnkFAsZ1S+ZYdLGzkMcDKXTHMcPaY9WMDR1NmdLorLGTUTUFYSwJ3tpXhP6tHC
         jM7g==
X-Forwarded-Encrypted: i=1; AJvYcCWczwPPxjXLVugS+5qHCDER5JUC8/LSxqv2YgI0Ah+FYhR5lTTHhqrKNgLjKEwFig8WkwpS1Lcizfs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0IzhbM64pFHk52xk2ysR+VvjYDkwT2YyqK6qBRQHLmjXVXvSG
	da2iTEKmxX9I4RzqYJRrrBmh/zPxH78lIH/ES1vD9Ymeii2DEBPpsYj36i+1gzY=
X-Gm-Gg: ASbGncsx73jLgRDtO4xNipdB6zi4ADNtGkRshuj7V3QDjoGFvVsxWVNxDT+EIJiUm6X
	l0rLnZgDzg5WpRHOFbKVTFrwTLRPHLmZXVvKgmJx5c6AuwRUYS4RqcF5la1tgE+dJOYEQr1Svph
	W0WIkgRgD3y1ukvnsZeCoiR+Pv8rm0Ybuw7rz8LNZUkBy8k4wCgM1SQ6mU/jcc7GfL96Va8zPwd
	JQ2cxBPAq/N3rws8E/ubbBoPxyD/g+nJMS0fxUK5ob8RaECjU1vlP0gcBbx1DPfyQkL0DBbhc2q
	WNbhEYnhFyVwkcBcQmvyGf/KW8oA9s94Fwu3P6rT0glXBQ==
X-Google-Smtp-Source: AGHT+IHBEjThBbjdMIZNKwrKuFYFb2iljmI0STguRpnrAHnFkQLZrJVytPww5yetPmjD6rxuju30qw==
X-Received: by 2002:a05:600c:1546:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-43f3a9336e6mr14913525e9.1.1744362042882;
        Fri, 11 Apr 2025 02:00:42 -0700 (PDT)
Date: Fri, 11 Apr 2025 11:00:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] tootls/tests: introduce unit tests for rangesets
Message-ID: <Z_jaOf2oyo3X6Gk8@macbook.lan>
References: <20250411075502.19926-1-roger.pau@citrix.com>
 <20250411075502.19926-3-roger.pau@citrix.com>
 <964624cb-2b21-4228-8774-2fd697ae13e6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <964624cb-2b21-4228-8774-2fd697ae13e6@suse.com>

On Fri, Apr 11, 2025 at 10:21:08AM +0200, Jan Beulich wrote:
> On 11.04.2025 09:55, Roger Pau Monne wrote:
> > --- /dev/null
> > +++ b/tools/tests/rangeset/harness.h
> > @@ -0,0 +1,71 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Unit tests for rangesets.
> > + *
> > + * Copyright (C) 2025 Cloud Software Group
> > + */
> > +
> > +#ifndef _TEST_HARNESS_
> > +#define _TEST_HARNESS_
> > +
> > +#include <assert.h>
> > +#include <errno.h>
> > +#include <stdbool.h>
> > +#include <stddef.h>
> > +#include <stdint.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +
> > +#include <xen-tools/common-macros.h>
> > +
> > +#define smp_wmb()
> > +#define __must_check __attribute__((__warn_unused_result__))
> > +#define cf_check
> > +
> > +#define BUG_ON(x) assert(!(x))
> > +#define ASSERT(x) assert(x)
> > +
> > +#include "list.h"
> > +#include "rangeset.h"
> > +
> > +typedef bool rwlock_t;
> > +typedef bool spinlock_t;
> 
> Are spinlocks really required for the rangeset code?

It's noted a bit below in this same file:

/* For rangeset_domain_{initialize,printk}() */

Otherwise rangeset.c won't build.

Will adjust the rest of your comments before commit, thanks!

Roger.

