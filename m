Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E2BACEE2B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006613.1385829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8FI-00050y-G2; Thu, 05 Jun 2025 10:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006613.1385829; Thu, 05 Jun 2025 10:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8FI-0004xt-Cv; Thu, 05 Jun 2025 10:54:52 +0000
Received: by outflank-mailman (input) for mailman id 1006613;
 Thu, 05 Jun 2025 10:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uN8FH-0004xn-Am
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:54:51 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 801e66ae-41fb-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 12:54:49 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so6875035e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:54:49 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451f99198e1sm20292825e9.33.2025.06.05.03.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:54:47 -0700 (PDT)
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
X-Inumbo-ID: 801e66ae-41fb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749120888; x=1749725688; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hf/pKBiCp9I8X2bZ9V5ACkgefi7T4fobe5MhHs7oYmU=;
        b=rGRLF9shWCQneTMsjdRdtzhfuwrnipitY6jaUiBXtxD08+6diLemk09S6vC+WjRsvY
         GL7m4/anIalX5VzPjVSTpqhO9mqH8wVmwJaL+GLkoNNAove6tC7jg73172e3oryIdhNd
         pu6xq+E/uskzNEN+CbYZ2WA/6AZBHREolRWNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120888; x=1749725688;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hf/pKBiCp9I8X2bZ9V5ACkgefi7T4fobe5MhHs7oYmU=;
        b=tgvmn/Y7I2bO3Hcr0fcB4b00jpZqs7UM8JTIo4Ts46hJVaZGAbvMiy6t5v//HRUQ67
         5QvcebTXjo4bKz6xhIanrd09uNp+l0rNsorUlQObppLze/wTVtqY8qSJVyV/0/viYQdF
         7JqxVoZ7a5aw44Djmo3CwrUxxaWW2TCa6+jLybpyuXezpd9/IrAnpyA72+1tGGll3W5A
         jTLMMRqYkqw3dnqIf8rzL+fjv7VvrF7uIHDYTf3APrbjcCP5Ui360mbLXAMtl8tUB8/4
         sgYQ5iE0mqx2mkcvuQHlNDb7hNQOVeh/ZUeJ14ndXFibEz9feJBNYiK4JklPvm0o4BTh
         53cg==
X-Gm-Message-State: AOJu0Yw1iYhOdx42qjwoXw6N0a7zJ6rxDhhSG/teONORnZM1iIfvLpyC
	ONObkTk7ssWHKVEm3tKEeu9pnxJKfSq6ELSzvz9cXtR3Gid1araUl7z85gXav/+/QMThAdhTFhw
	YEYWn
X-Gm-Gg: ASbGncsI8P50GgSmqaX7gzLIQ6ZV8eZzfetsZqS6GMW4giBKS2DFXYlgFHW4wmokw7w
	F+1s8YhLDY2wEwnxTCqYY+vPViE4xzrPT+fZ39Ueu9yGcRi+PSFNgieiDB68E+TMcW5klKaskhx
	5NYd6e3sAojC6q1sp9OzeBuo0VtpXT5Nuih7ta5oR7l8NdkPwCgFpIA+uVGMJSONCt4v34Lp7cF
	68RVCLCT+XYUSYJ/SclDNPv0NLNEPwIkh48n5DwlgqbLMTTm8ulOqnmv5cQdUiMKm9lUzhOti4Q
	oiWzE5EoSQIJLxBQit6s4RNuAF8KQhKN3pexUMc+PlpcYk8Zkn3ozl8qSu3A54CTE6KtLcv/MPx
	fyI+OsvjbyAxeLaRQ8WgjeJKpHysBKw==
X-Google-Smtp-Source: AGHT+IE5p/JiO4iad9KTLzmgKrt5y15ouaGkSM+9v2bNVpW3SyvhRxap0wrEU/GgZh2aWRliOViIIQ==
X-Received: by 2002:a05:600c:444d:b0:441:bbe5:f562 with SMTP id 5b1f17b1804b1-451f88d8050mr27117755e9.16.1749120888464;
        Thu, 05 Jun 2025 03:54:48 -0700 (PDT)
Date: Thu, 5 Jun 2025 12:54:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v5 02/10] vpci/header: Emulate legacy capability list for
 dom0
Message-ID: <aEF3d8Zd48HRy5wn@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-3-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526094559.140423-3-Jiqian.Chen@amd.com>

On Mon, May 26, 2025 at 05:45:51PM +0800, Jiqian Chen wrote:
> Current logic of emulating legacy capability list is only for domU.
> So, expand it to emulate for dom0 too. Then it will be easy to hide
> a capability whose initialization fails in a function.
> 
> And restrict adding PCI_STATUS register only for domU since dom0
> has no limitation to access that register.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

