Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D045E79A755
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 12:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599258.934583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeLu-0000vP-9Q; Mon, 11 Sep 2023 10:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599258.934583; Mon, 11 Sep 2023 10:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeLu-0000tW-6k; Mon, 11 Sep 2023 10:41:10 +0000
Received: by outflank-mailman (input) for mailman id 599258;
 Mon, 11 Sep 2023 10:41:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5ji=E3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qfeLr-0000tQ-VJ
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 10:41:08 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3160497-508f-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 12:41:01 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-402cc6b8bedso48621995e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 03:41:01 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 w18-20020a5d6092000000b0031c52e81490sm9741307wrt.72.2023.09.11.03.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 03:41:00 -0700 (PDT)
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
X-Inumbo-ID: b3160497-508f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694428860; x=1695033660; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8DLYROIXyNH9Ci2VtFeUczr8XQ4jCBnRu/iIoSoUgr0=;
        b=W2ok/HikzzvgSyHQI/Rt4WQAJqiQksSh19v0w2ps0bVpvHQB6hBabPTsYfyMhjsNMl
         ocNdhGeSv4nvpla8XoMcllXhIaQ1g88Py8VfS/qQc/4L4jL30f8CNpXUd/16DYGKDAJx
         uIfCajJbnTOLBjLHjf4FT8dEZehXLeURrGJvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694428860; x=1695033660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DLYROIXyNH9Ci2VtFeUczr8XQ4jCBnRu/iIoSoUgr0=;
        b=Lkas+gOAvmSxnNle1Cc4o0fzCsLgZYwAA7v+nGo9kq1ec33i0KEQsiNIRqpWnk/wgO
         EyHpiwC1TL4HlFWrBBW682gEZtzKCnNXD3NRisAKsrNK5j29uxL5+wnDBk76+7iiGPBq
         AG/cS6JGbDkRXvWCk7gXuYhyIVjm/y9yZny09zDhclO7xzNhmdqyxHolqNGpBYhCCNld
         JtJHjMMoUC3rMBhHbia0k7I4cbivefJS0qKI4rRi8uLEmiCsVDaQvZJ2fy8gLigDWtLp
         EvY9Gao1jJ9H+3UhB5jBQ/dvyDT01MlL0rWT2ozdRUeLTFJubABQ5UxPE2Cu3XNglk0F
         RuOg==
X-Gm-Message-State: AOJu0YybAdwp3SoyJfL8Zb5WcLzKEbG1UDcGmUQ1XHo4U4iMlP0KsRC2
	DIt6ABnSvoVIEowuwuIer0go7oQLwgr/tiNv9QE=
X-Google-Smtp-Source: AGHT+IFKDg7yUVa/fCWGxGM/sIW+2D8LvTmw4fuv4ZaAMlLxcUkbmHYI+JYJPmbWy/2xz4xCz9smJA==
X-Received: by 2002:a5d:5f07:0:b0:31f:af30:1bd9 with SMTP id cl7-20020a5d5f07000000b0031faf301bd9mr1043129wrb.44.1694428860597;
        Mon, 11 Sep 2023 03:41:00 -0700 (PDT)
Date: Mon, 11 Sep 2023 11:40:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/misc/xencov_split: Add python 3 compatibility
Message-ID: <4489a5ce-ecd0-49e2-9e47-e621b098c96e@perard>
References: <20230902162246.15672-1-javi.merino@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230902162246.15672-1-javi.merino@cloud.com>

On Sat, Sep 02, 2023 at 05:21:08PM +0100, Javi Merino wrote:
> diff --git a/tools/misc/xencov_split b/tools/misc/xencov_split
> index e4f68ebb6e..8f1271bfe7 100755
> --- a/tools/misc/xencov_split
> +++ b/tools/misc/xencov_split
> @@ -1,5 +1,7 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3

Beside this shebang change, the patch looks good.
With the shebang change reverted: Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

