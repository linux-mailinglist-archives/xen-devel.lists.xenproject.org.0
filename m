Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E049254ED
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 09:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752765.1160994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOum4-0005yw-V7; Wed, 03 Jul 2024 07:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752765.1160994; Wed, 03 Jul 2024 07:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOum4-0005x9-SW; Wed, 03 Jul 2024 07:51:32 +0000
Received: by outflank-mailman (input) for mailman id 752765;
 Wed, 03 Jul 2024 07:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=znpO=OD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sOum3-0005x3-7H
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 07:51:31 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e7e898a-3911-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 09:51:29 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-36796bbf687so28200f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 00:51:29 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36783e9faa8sm4024108f8f.64.2024.07.03.00.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 00:51:28 -0700 (PDT)
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
X-Inumbo-ID: 0e7e898a-3911-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719993089; x=1720597889; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w88dUZqiR9ZiZraGVAuwULR3Vj5iSFh61YZSK8mvFTU=;
        b=S9cO7srpOs4Sie1BmMMyZyxP7quviMjWQyEwnm6CjQsvXUxGNYBhKY4kfotif9Vdke
         i5NwqQEy31wusVPoE7osb8p9Q78ds3I2PqlPMWxsTkfMABVQQZRjmzOYNDQxjBThk+pF
         gjfj/u2AkWWJA+hZhUPlNu5AzzPnTSGAUdLjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719993089; x=1720597889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w88dUZqiR9ZiZraGVAuwULR3Vj5iSFh61YZSK8mvFTU=;
        b=D4QjtlS0XNaCue3yAmDWIrgYClJGvwX0t0P+yy37QzIUUUlGwgo8dv6ueQjKXiZ+4V
         82RhBtCCR5HOkYD0D/aA8E2uUxvBIJ8yV0V3G/Mbn4Mtwr6O93pGKTVHa6rNKxZELQNj
         gMkYqJqRYD3olIG1lh79gRTfmhLVGtZqfjlrQIKFFiRP1VDQ2iGdx1nHRD5DPC4M/3pn
         9DqASGMjpP9Aw4fXLI/pkQZtiRZ2gX1hgtm4uoygvZMeVqxVdfTLq94WwvhNZ9sWFSm2
         3AAP2WYjOVyOW7X/yedyR/hYNQoFyDs3ixslmOTGhb6kU3mpC6Y8j+LOuMUEa6YKmjtg
         gZpA==
X-Gm-Message-State: AOJu0Yxk5lBLzDsfOPpdbHUF6ZmugnTqP37aD2b35GUyywP4O4AIcNLK
	WaUGHVFrIBnwW8xEgPKnwyJ/qaRGs2oMFZklD3M4e75ziVzY/4wAEYZwj0qXLJE=
X-Google-Smtp-Source: AGHT+IEj29jTe4DmKJ7WOUHAnoSYS1Cg1Pg5lt1HgxFMsH3eqhi6QPEATx1vuB91C25U7haR7erqmQ==
X-Received: by 2002:adf:f343:0:b0:367:88e8:fed1 with SMTP id ffacd0b85a97d-36788e902demr2457042f8f.25.1719993088535;
        Wed, 03 Jul 2024 00:51:28 -0700 (PDT)
Date: Wed, 3 Jul 2024 09:51:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v4 for-4.19? 2/2] cmdline: "extra_guest_irqs" is
 inapplicable to PVH
Message-ID: <ZoUC_5FuwYLXdfDv@macbook.local>
References: <03f6674c-f2d1-4ec1-995e-a3e25278ceac@suse.com>
 <e95ea1ea-dd11-4994-9d50-308db4c3772e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e95ea1ea-dd11-4994-9d50-308db4c3772e@suse.com>

On Tue, Jul 02, 2024 at 11:52:38AM +0200, Jan Beulich wrote:
> PVH in particular has no (externally visible) notion of pIRQ-s. Mention
> that in the description of the respective command line option and have
> arch_hwdom_irqs() also reflect this (thus suppressing the log message
> there as well, as being pretty meaningless in this case anyway).
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Since the EOI map physdevop-s aren't available to HVM no matter whether
> the PVH sub-flavor is meant, the condition could in principle be without
> the has_pirq() part. Just that there really isn't any "pure HVM" Dom0.
> ---
> v4: New.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1178,7 +1178,8 @@ versa.  For example to change dom0 witho
>  hardware domain is architecture dependent.  The upper limit for both values on
>  x86 is such that the resulting total number of IRQs can't be higher than 32768.
>  Note that specifying zero as domU value means zero, while for dom0 it means
> -to use the default.
> +to use the default.  Note further that the Dom0 setting has no useful meaning
> +for the PVH case; use of the option may have an adverse effect there, though.

I would maybe remove the has_pirq() check and just mention in the
comment added ahead of the is_hvm_domain() check that PVH/HVM guests
never have access to the PHYSDEVOP_pirq_eoi_gmfn_v{1,2} hypercall,
regardless of whether XENFEAT_hvm_pirqs is exposed.

Would that be OK with you?

Thanks, Roger.

