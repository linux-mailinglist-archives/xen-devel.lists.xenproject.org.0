Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2D38C5903
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 17:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721661.1125265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6uLU-00031t-N0; Tue, 14 May 2024 15:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721661.1125265; Tue, 14 May 2024 15:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6uLU-00030G-KN; Tue, 14 May 2024 15:45:40 +0000
Received: by outflank-mailman (input) for mailman id 721661;
 Tue, 14 May 2024 15:45:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6uLT-000308-KO
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 15:45:39 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02146be8-1209-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 17:45:37 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-78ef9ce897bso455749685a.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 08:45:37 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a354a0a802sm43546d6.81.2024.05.14.08.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 08:45:36 -0700 (PDT)
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
X-Inumbo-ID: 02146be8-1209-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715701536; x=1716306336; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NHQQ0lQFDULRomqg48fqsY1jG2htG1eJGwOYJVORz3g=;
        b=Kv+pPeM+1z2PIHNXpzNXhaqsscOOFHcXTa8NjlJ7r6ooVGLpGkbSPSUtpdAM2aEwEw
         mucu81Iookc8B8C2KFUdZ+aLVGqe+x2B3XgnalIWPwwAba8/W3OGVSj/1L3ipVXzfo2c
         BoB/IGmgWer/9olX+1v9zMs1/paRmd+D1FNBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715701536; x=1716306336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHQQ0lQFDULRomqg48fqsY1jG2htG1eJGwOYJVORz3g=;
        b=VFxWApSRg9Qn/OmBQ79HwLXHNKAnkNRDfRwqbXdhKjtKnHBqAQiarOhExd1JBqq0I9
         CQ0mndYGnYugSQRLKmC5pat+0aa7WKaiQQ0Kz2lVZB7ZyGUlVAZzoi2c8AJjTINIwkOO
         q1NhbUGcF9c7+ZcPCB/wHBpo4qpcTOyF1offuQZMOT1gKQSChFIX+mBp1gbPOq/2zyoU
         nnvHnhyfq9MyOHvaKPro0OvYF/jdJVkDkazKyMg86DbWWNP7Ifzd6Kbrv6Dpknzjh4BB
         b75VV9C0ywaEVOGvd3MmOjsGrreDv201zi6uzqiP3bQXa7jCKPfIRjHU0KzYlqQ010As
         ePQw==
X-Gm-Message-State: AOJu0YwLH3CrvI8Ri4aqdzSrqdg+FX9CkvaSADbRX/+7o+dbjbGP8Noo
	2AwAe9pI5UbI1Y6yD+qfuHHdklBY979xIcy+R7wrHjzCvWeqs3KwSZ2lZvvoIK8=
X-Google-Smtp-Source: AGHT+IHGW1UysBHmMO1yCAkzV9aoPlrXWsZWN4ZZLWv57KtzZTiXpFxdm/WvUHUxdlrrmwE7AMlQ4A==
X-Received: by 2002:a05:6214:3c9c:b0:6a0:ac0f:a59c with SMTP id 6a1803df08f44-6a168258eefmr147035916d6.46.1715701536369;
        Tue, 14 May 2024 08:45:36 -0700 (PDT)
Date: Tue, 14 May 2024 17:45:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>
Subject: Re: [PATCH V3 (resend) 14/19] Rename mfn_to_virt() calls
Message-ID: <ZkOHHtRPTqC4Zvnp@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-15-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513134046.82605-15-eliasely@amazon.com>

On Mon, May 13, 2024 at 01:40:41PM +0000, Elias El Yandouzi wrote:
> Until directmap gets completely removed, we'd still need to
> keep some calls to mfn_to_virt() for xenheap pages or when the
> directmap is enabled.
> 
> Rename the macro to mfn_to_directmap_virt() to flag them and
> prevent further use of mfn_to_virt().

Both here and in the following patch, I'm afraid I'm unsure of it's
usefulness.  I'm leaning towards this being code churn for very little
benefit.

Also, I'm not sure I see how the patch prevents further usage of
mfn_to_virt(), as (for Arm) the existing macro is not removed.  If
anything I would prefer a comment clearly stating that the macro
operates on directmap space, and avoid the name change.

Thanks, Roger.

