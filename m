Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B495A8B2BA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 09:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955284.1349084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xbT-0003yL-KK; Wed, 16 Apr 2025 07:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955284.1349084; Wed, 16 Apr 2025 07:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xbT-0003vU-Hi; Wed, 16 Apr 2025 07:54:39 +0000
Received: by outflank-mailman (input) for mailman id 955284;
 Wed, 16 Apr 2025 07:54:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2d3P=XC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4xbS-0003vO-E9
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 07:54:38 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ac3a66c-1a98-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 09:54:37 +0200 (CEST)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-22c33ac23edso4300855ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 00:54:37 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22c33fc4b72sm7752535ad.185.2025.04.16.00.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 00:54:35 -0700 (PDT)
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
X-Inumbo-ID: 0ac3a66c-1a98-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744790076; x=1745394876; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cxBeQlU/4Ucx5Rc4SqEhe9d3OszPzWpJEviYeymmVr4=;
        b=gDkhermgpU024EjWLxbhd5dq36Fq2pww9StkrLwCyQ4tguFs2tHNhlkG22+a0J5aym
         nBwAMrJuyT8eCebKn2twO5r3Co6OsIELQBqAcwHXidE7UaOpv9U357S2Y7Inemo+wImy
         5BCm0j/DulADcEMuCu4bSRPibpUricV5hQetM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744790076; x=1745394876;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxBeQlU/4Ucx5Rc4SqEhe9d3OszPzWpJEviYeymmVr4=;
        b=W4Mq6ehncl/Krgn7fqGtETHeJzEZXUVN/SpjdOCTXaoJJ5cBKuIaDRniq4bqkY8jjd
         nPUDHQEmDMvT4a4RS9MFOJ7zCbQxdWnabyUgTGdPFDXf6pMBVabmLg6IDhCkVczk4Php
         6KvuPg80AeU1Pt2B6bn2GKo/6RT6Vq6SxSS/7+y9UhnZvXYVtdKt1sIc4wn/58rnoUv4
         0ptU7hPf0Oy/K0NI7WDzfpW3+YBJaLSgYLiMDFjdvEL5X6H4Mcoxrvzzv4T8ijpOb9a+
         HGepOxtIfBBONZQXKZs5KM5uDjvF8uIQzYeYcYPtH7Tu1B4z28oOSVlGZGMGjS1EVTdL
         s1uA==
X-Gm-Message-State: AOJu0YxaVw5iQg0kHgRcaEQOTvTDmFpR29sOwtruajGxYbrcOPIBAFH3
	VkHXaDbNCsq7x2EnnSTvdIdaZcl7xvGlOSAeP8TuBVmpZ4eYpbL/2LY/GOhOF1SonHMb6HbLOPP
	X
X-Gm-Gg: ASbGnct//NTJcOnoKPcZNA5MT/f4RNhkvkD45KS3TtkDoZFKiePb+tFNUPc1p1DqFmt
	k8VjOg7m9mKjlfj3qTnnlt2I0mtrFthl16UjY953P85ENqpumkRhRSk1/cpnOd4pVCx1kDs6qnS
	A1z0RL+32cz7tiBALz8ona5bFpTJKoCADsKkNYfWM2YbAhEDkPPuPPRVE6N9qSs2RPkNLMr6SrU
	UOUFfjZwNKUwrhF9I9CpzwFB26Fx6zgdyc3tKw+0UhKf4TTPxb8YBtDetYykunakKdbSTB7RIen
	J5gJ1Zwi9XUfIbzJMlkxACoKqHjIhzwms/wwJ8tS1y+gNQ==
X-Google-Smtp-Source: AGHT+IFuZ7VF05S/eL7jv+2lr4l538olk/iAYLKrxKMfSEbutgd3YQdX3741nKgwq4iIuZmoTAE+mQ==
X-Received: by 2002:a17:902:e542:b0:224:249f:9734 with SMTP id d9443c01a7336-22c358c5261mr15163195ad.4.1744790076105;
        Wed, 16 Apr 2025 00:54:36 -0700 (PDT)
Date: Wed, 16 Apr 2025 09:54:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 8/8] vpci/msix: Add function to clean MSIX resources
Message-ID: <Z_9iNjQxTy9RcDq0@macbook.lan>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-9-Jiqian.Chen@amd.com>
 <Z_5i7zZJ7lRjFr7G@macbook.lan>
 <BL1PR12MB5849577B78D50821733B6D6BE7BD2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849577B78D50821733B6D6BE7BD2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Apr 16, 2025 at 06:20:50AM +0000, Chen, Jiqian wrote:
> On 2025/4/15 21:45, Roger Pau Monné wrote:
> > On Wed, Apr 09, 2025 at 02:45:28PM +0800, Jiqian Chen wrote: 
> >> +
> >> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
> >> +        if ( vpci->msix->table[i] )
> >> +            iounmap(vpci->msix->table[i]);
> > 
> > The MSI-X init function never maps tables, so the code here (given
> > it's current usage) will also never unmap anything.  However I would
> > also like to use this code for vPCI deassing, at which point the logic
> > will get used.
> So, I still need to keep this part, right?

Yes, I guess leave it for now, we can always rip it later.  I would
like to see how doing the cleanup in the caller in case of failure
looks.

Then we can likely extend such cleanup to be done in the deassign case
also.

Thanks, Roger.

