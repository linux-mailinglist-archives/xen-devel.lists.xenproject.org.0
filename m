Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5357B14DE0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 14:48:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062632.1428348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjkE-000449-Px; Tue, 29 Jul 2025 12:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062632.1428348; Tue, 29 Jul 2025 12:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjkE-000414-Mj; Tue, 29 Jul 2025 12:47:50 +0000
Received: by outflank-mailman (input) for mailman id 1062632;
 Tue, 29 Jul 2025 12:47:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y9DQ=2K=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ugjkD-00040y-7U
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 12:47:49 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34cdd1b0-6c7a-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 14:47:37 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b78bca0890so1055207f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 05:47:37 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4588e5b7717sm24583825e9.5.2025.07.29.05.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 05:47:36 -0700 (PDT)
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
X-Inumbo-ID: 34cdd1b0-6c7a-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753793257; x=1754398057; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+9dXsSA/SZrMcv1eFYI8BMcOmjl9bd9OUFLVbPOah5o=;
        b=GPP3bHEJgu1skTBlYCewwZHA+SY85hHrwVhVWHydbYtDZPpWx+ZitealhcqiWy4lxa
         /ivFIrvg01oc1XFbAIwX5KXi7/4AtTS9vDUSI1Rt+MvMr04DcCVQXHIR4cDaRBk6JJwV
         LFz0w9Ggw9fkioZmC25CEJxrqXn9lq7GKwTOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753793257; x=1754398057;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9dXsSA/SZrMcv1eFYI8BMcOmjl9bd9OUFLVbPOah5o=;
        b=AejUbK7hkr93sJNnbI1Hq4kezX0gH+UGGoVL8q0cAjdw6KEiw/oQAA8CzMZqKn+ZR+
         EJNQJV+WXSqmWq5WTWNu8jb762/Gact2jobM6G63Gxo0I8m6vQ8Gn4riGCKOkyIxcqzc
         lRrpMdsnKS00KCvPkxk/FGBPjtRTN1dZdbq87yyXyw1BRWTPX+kBNrQ+CZKu2WkJJy60
         dpL5XlFarGGPxnHRDBuSeDwEfCDzIv9OKcVA2fRuc0Sd3VAkmp8cHAm3HGBpk5+LgILk
         e7CHuTDyvr3XlxgCyQjvf3Iu8ZmQolyeDIlSPmBtRe3HbpHzu+psaAX4j1+rF+cmQcCA
         UBFg==
X-Gm-Message-State: AOJu0YwAgvLz8uWgVBduOYBW1oFMDVVk04BYlz3ouUqAKlylCiMklZyy
	FSFPDKQmqYk9M8NcgOKNQgOKhXkN4WaK+dsQUXFlJrb8zlZqZW4zTJjxvqsy7hA5BYg=
X-Gm-Gg: ASbGnctEF4NHimyQ4mVWjcJ1wKPcM2eySQECdUYhYkWRKCnz5GSUw56hv7HXxQOgW7S
	QklRNXdeutXdfTWjQ+deTLUpPcyF03Id4u2I9//t3iIBU1IBHQahMybjDyKXv4ZyuAI6ykyFQ8I
	z5LioaammSS2yxEzPlSOLTi6NIwIsw6j1jlEOVlKzxlTDr7kclMsCdGHCTWc74B2KxNwW6vYOKO
	5Ty5StUilBlvTW00sgCommwVAWXWPfTBut7D9CxKrHoGuWIRwXoOEZHJTsD98Iso0C0QnqGUQ7i
	Vz73ZgY+nTwo1RF0IXTecGMuL2MGrvQAshQzs8Qmceda6M7byl+z61pU4mar3Kj/wSBk8QUzg8A
	3VjWREmVK4UOKmes5LJ6CGz3cFe6Z8yPVrEoz1veM27M21HUV2ee5rzDqkKoffEm0iQ==
X-Google-Smtp-Source: AGHT+IEbOjLedozMGDNSlqqs5BsSXcNowCnzJmo/ndGGD54HUX4NTTgAhB8bYgMxkNBtmQYn33u8fw==
X-Received: by 2002:a05:6000:18aa:b0:3b7:9233:ebb with SMTP id ffacd0b85a97d-3b79233114cmr1250272f8f.6.1753793256946;
        Tue, 29 Jul 2025 05:47:36 -0700 (PDT)
Date: Tue, 29 Jul 2025 14:47:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v9 2/8] vpci: Refactor REGISTER_VPCI_INIT
Message-ID: <aIjC5ybQLz2HJATc@macbook.local>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
 <20250728050401.329510-3-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728050401.329510-3-Jiqian.Chen@amd.com>

On Mon, Jul 28, 2025 at 01:03:55PM +0800, Jiqian Chen wrote:
> Refactor REGISTER_VPCI_INIT to contain more capability specific
> information, this will benefit further follow-on changes to hide
> capability when initialization fails.
> 
> What's more, change the definition of init_header() since it is
> not a capability and it is needed for all devices' PCI config space.
> 
> After refactor, the "priority" of initializing capabilities isn't
> needed anymore, so delete its related codes.
> 
> Note:
> Call vpci_make_msix_hole() in the end of init_msix() since the change
> of sequence of init_header() and init_msix().
> 
> The cleanup hook is also added in this change, even if it's still
> unused. Further changes will make use of it.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

