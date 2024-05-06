Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B4C8BD190
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 17:34:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717725.1120199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s40LN-0004rL-Kx; Mon, 06 May 2024 15:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717725.1120199; Mon, 06 May 2024 15:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s40LN-0004pK-IJ; Mon, 06 May 2024 15:33:33 +0000
Received: by outflank-mailman (input) for mailman id 717725;
 Mon, 06 May 2024 15:33:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s40LM-0004pE-Fd
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 15:33:32 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe1dd36b-0bbd-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 17:33:31 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41b21ed19f5so13944905e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 08:33:31 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 m37-20020a05600c3b2500b0041816c3049csm16412025wms.11.2024.05.06.08.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 08:33:30 -0700 (PDT)
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
X-Inumbo-ID: fe1dd36b-0bbd-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715009611; x=1715614411; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=snLg2+vaAI3TQzbaqfZHEFjB/gbPR3kotBOnp48T8pE=;
        b=h8nzGGpuj8XsvzVWVugr4ddobdszpJ0Zh1UGv32NbSNZf5yKcgDvUgPU8kkLXqyLNc
         UnANnoeHVOM+XAafwV1KpdPTlgiUnf+GZMq5AWCHmCt53DP6hWFUYhidgqhRmhb014oF
         i1aZ94NK3QmQjFOkiRhWqM2vymLARV4V+fA2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715009611; x=1715614411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snLg2+vaAI3TQzbaqfZHEFjB/gbPR3kotBOnp48T8pE=;
        b=dAlwC7ffDQECk+oaki/fmakmsx6WaVX+aXpQdshBYlEfDM0cL4LtEqis6FyLtlHF+y
         4QaW0yuVmerX4Vb/jvouOrg8qBVvEOvdl9m9kWpkcanTE7lZqh1nGFiZcNGNo3bA72vR
         sB00Os6xOI17aM7ccpaWUgrc7k2vWn0pNUJlJSVm5EFaSNTVvCqU309ZoLBRMFGRll1y
         A0lmI9g1veTbDn5MPc9BMR2/sY4lgOFI1Su8v1OAiK5FUci84B0e+MRfHSMz0iOZy5un
         RiKpueuQlC7+mSwdZ5iBvaJiJK8amwUM9e1hCEPif8RSO9ovNBKJ5fjdTxJvwX2crV4X
         ib3A==
X-Forwarded-Encrypted: i=1; AJvYcCW3GokAji63BGV/FpwkWwdQqzsLaEf5JkswBkF5RE+xKeY7h5Z80/CdTSFFep5zUGtDispAD5I/lvPHYq6ZjbNHPk4UnlOMLCVsKdlT5MI=
X-Gm-Message-State: AOJu0Yy6qw+XIhzHpveO3ffJfxpbXBpMzlf3/BXrcrBSZ+gJAtm1eKiq
	LPuFQaKIFFhHKRLjrO9V/v0m3K8dM7YJOrlS99ONHUfoptCSQsyHRmLL/iLprvM=
X-Google-Smtp-Source: AGHT+IEy9wOLNe44HrklfgjrIgywsx5JALd4urAnXNyYtged7xRQLiBhOy7K0yMM7PmsTDDnpDPWfg==
X-Received: by 2002:a05:600c:4f08:b0:41a:2044:1b3e with SMTP id l8-20020a05600c4f0800b0041a20441b3emr7568873wmq.32.1715009610678;
        Mon, 06 May 2024 08:33:30 -0700 (PDT)
Date: Mon, 6 May 2024 17:33:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19? 1/2] xen/x86: account for max guest gfn and
 number of foreign mappings in the p2m
Message-ID: <Zjj4SQ3r9ZtjjjKn@macbook>
References: <20240430165845.81696-1-roger.pau@citrix.com>
 <20240430165845.81696-2-roger.pau@citrix.com>
 <45c52348-e821-4e36-9bd6-7dda00eeb7d3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <45c52348-e821-4e36-9bd6-7dda00eeb7d3@suse.com>

On Mon, May 06, 2024 at 12:07:33PM +0200, Jan Beulich wrote:
> On 30.04.2024 18:58, Roger Pau Monne wrote:
> > Keep track of the maximum gfn that has ever been populated into the p2m, and
> > also account for the number of foreign mappings.  Such information will be
> > needed in order to remove foreign mappings during teardown for HVM guests.
> 
> Is "needed" the right term? We could e.g. traverse the P2M tree (didn't look
> at patch 2 yet as to how exactly you use these two new fields there), at which
> point we might get away without either or both of these extra statistics,
> while at the same time also not needing to iterate over a gigantic range of
> GFNs. Going from populated page tables would roughly match "max_gfn", with the
> benefit of certain removals of P2M entries then also shrinking the upper bound.

One note about traversing the p2m tree that I forgot to add earlier:
AFAICT we would need one implementation for EPT and one for NPT, as I
expect the different page-table format won't allow us to use the same
code against both EPT and NPT page-tables (I really need to check).

Thanks, Roger.

