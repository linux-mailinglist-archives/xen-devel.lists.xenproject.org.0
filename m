Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAE17DCEF0
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 15:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625825.975508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpeq-0007QJ-Da; Tue, 31 Oct 2023 14:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625825.975508; Tue, 31 Oct 2023 14:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpeq-0007Nc-AS; Tue, 31 Oct 2023 14:23:52 +0000
Received: by outflank-mailman (input) for mailman id 625825;
 Tue, 31 Oct 2023 14:23:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G+CR=GN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxpeo-0007ME-QI
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 14:23:50 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1aaf261e-77f9-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 15:23:47 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53db360294fso9790524a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 07:23:47 -0700 (PDT)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 ks24-20020a170906f85800b009ad8acac02asm1070902ejb.172.2023.10.31.07.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 07:23:46 -0700 (PDT)
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
X-Inumbo-ID: 1aaf261e-77f9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698762227; x=1699367027; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rMX24V579WbzUjzdlj5MNjXK8mZtDjR5iub4cTe8J6s=;
        b=A1LWic0kXdULl0kpIsOxbmIDU9MOm8ahL0vVUyU4jZ0uIUYt7h1zYw1ctd9NyueoQ7
         5FK+hXjAO9dFAW85HBzmOd6VndID3dWRIv000/qgGpspYjjKcUFmIvaNO2fqT0laCp8J
         561XsyvY2afGc5aZrfMNnG9xQZJtfc3TYL5jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698762227; x=1699367027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMX24V579WbzUjzdlj5MNjXK8mZtDjR5iub4cTe8J6s=;
        b=l9sl4EHu2f6nmAZttCLamSp1/kSnPmdBi0hy+tomIgirltMACTN2rJRmrFeV++vN9J
         XrRLghG4H3gNwV5sE9mGiPT9yr5QP0HB29sv1qnAKxAbde3R1IWahdocU8kKSIn9G8jy
         sOBvYpWC+rWRGmFh2ncmcd0WTXwURwxLcpxas7MGSIryu1Wq+RfR/WU/QmptWm/Hlhno
         OZ4tSrl5Im7vX0h4p7ucJDql0I6pJkiyTH+dr2cqbDL/7U/gsv9qZdGnc8LuX760gp7C
         t3KqvIhWruZvyTjfm18tjHB0cgx1qUVCoOXtPXb/Th+ub8qzM32y+kpw/yzXzZZWJpTd
         KVPw==
X-Gm-Message-State: AOJu0Yzu4eDWXqJfHvOn8lrldkSQLgVhjcwLG5Z9FguJgxu+EACjXxrz
	o49LBti3CeyWSERBIadWJNaFyA==
X-Google-Smtp-Source: AGHT+IFtp+W2sycU6mxoNSWSCApiSli55DoVaHclghqxI4+IJBakIIQojuamqrUZigFGckGN7eRHiA==
X-Received: by 2002:a17:907:2d2b:b0:9b2:a7db:9662 with SMTP id gs43-20020a1709072d2b00b009b2a7db9662mr12450264ejc.12.1698762226924;
        Tue, 31 Oct 2023 07:23:46 -0700 (PDT)
Date: Tue, 31 Oct 2023 15:23:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: xen-devel@lists.xenproject.org, Kelly Choi <kelly.choi@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: Re: Cambridge University Talk - 9th November 2023
Message-ID: <ZUEN8cVbNcR0Mo7R@macbook>
References: <CAO-mL=xE=-8RjeAOKumLfcSf=wu0OWLK0X1Lz2JMCefBXbnTfA@mail.gmail.com>
 <03347742-c32d-4fc0-8ad3-f87cf71f20f1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <03347742-c32d-4fc0-8ad3-f87cf71f20f1@amd.com>

On Tue, Oct 31, 2023 at 01:05:11PM +0000, Ayan Kumar Halder wrote:
> Hi Xen Maintainers/developers,
> 
> 
> As part of my talk, I wish to provide some examples of tasks that a newbie
> can easily pick up and contribute.
> 
> This need not be a dedicated project, but something that can be contributed
> on an ad-hoc basis.
> 
> The idea is to get more people interested in Xen project. :)
> 
> 
> I found some examples of this :-
> 
> 1. Misra C fixes - Refer "Misra rule 10.3 violations report script" . Luca
> has provided an awesome script to identify the MISRA violations. This can be
> used to provide fixes.

TBH, I think doing MISRA fixes is not that attractive for a new comer,
as those are (mostly?) non-functional fixes, but I might be wrong.

> 2. https://wiki.xenproject.org/wiki/Outreach_Program_Projects - I think this
> page provides some pointers, but I am not sure if this is up to date.

I'm not sure how up to date this is.

> 
> Please let me know if there are more of these examples.

gitlab contains some:

https://gitlab.com/groups/xen-project/-/issues/?label_name%5B%5D=Difficulty%3A%3A1-GOOD%20FIRST%20ISSUE
https://gitlab.com/groups/xen-project/-/issues/?label_name%5B%5D=Difficulty%3A%3A1-EASY

Regards, Roger.

