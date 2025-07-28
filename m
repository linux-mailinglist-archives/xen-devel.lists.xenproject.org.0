Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB04B13728
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 11:05:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061125.1426619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugJn2-0007LZ-3p; Mon, 28 Jul 2025 09:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061125.1426619; Mon, 28 Jul 2025 09:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugJn2-0007JC-06; Mon, 28 Jul 2025 09:05:00 +0000
Received: by outflank-mailman (input) for mailman id 1061125;
 Mon, 28 Jul 2025 09:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44Jj=2J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ugJn0-0007J6-F5
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 09:04:58 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec98509d-6b91-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 11:04:53 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so33898825e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 02:04:53 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4586ec77799sm119842575e9.2.2025.07.28.02.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 02:04:52 -0700 (PDT)
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
X-Inumbo-ID: ec98509d-6b91-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753693493; x=1754298293; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GZ+NKV29cwjI/OGH57eWUT2ruLlgPihBKof3f/T7Wwg=;
        b=TLGeVhd9EwUrjHPY6n1C2c5PSChzanTvlXxLvzEBTRTBC6YNwzeXdI0IGFpdtkHvaB
         4kB0u1+UfPfLKHwELSqTUJUsYC6QLQfhOq0l23DySmhM/gurzZvD9HOvZHz05CAthGOF
         Ya3ei4BngNrYLGbGIAnFwI0y3QMmhAx7bFy3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753693493; x=1754298293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ+NKV29cwjI/OGH57eWUT2ruLlgPihBKof3f/T7Wwg=;
        b=gkdOcW5fnQxxSTc1qat4jAS0gdptPj3oZsjOPG8eUSM6kzZM3b7NUQyiV6TAPOTmZL
         BHWnO7t17TxjJ1/Xo5jl9b+fyIAC7bNn5I6BARVfkMA5VR2fJPnAXC2j0i7yGkjGS1s4
         L9k7727iCokf1tJJG59uSSBhSQtNgj8KLbAhE6BfOcGHIMvc+kM/A8sSUMFOmYrzcfdS
         doiaEzJ2MzKOayE+Bx/Sig77h+gy0elymvirDDhH0ySjgW+iHG8c055hYp2hqaxQCMt0
         y9SUB0mt+RApoDYNpP9qR2ZDYHQsHbYhBJ6hqt+6spWom7xIbzTwaPfPMs4kql8WDTVd
         x4Qw==
X-Gm-Message-State: AOJu0Yyq7FCCc+ToeXfOGS1FC57eJJfJq4/YKxF1924tUpvPwKi+JDsB
	GoTR0Vr2gdrC5Y/Ou7qcGcN70h+yPde/MejIiX0EmhZaxLaMz7XLyUlUT21iDX4+co4=
X-Gm-Gg: ASbGnctxn4zaSpJ114psJKJqhwLQ2vepW3WCNzGFDOt1EVC04KJ8mS8o4tqMwEiQgxR
	wN7aU/M7h6yWzbXrux8HuHcEcfwFUtH2lq9Y7bS19SP8vIrPYO20VbSvBqNMWMb3I2l/urV5o5+
	5oRuyZALgBaUQEmW4+NbP32w7o4dDd3l/vzhyK5wwf0TLlDB5FQwRHhbCktHbQpOLIMVcE7Rq4B
	T5Sk3mNGFoGEM686j86pKyCJ2br7Dx69jB8Qza8Rc9AvxbmJ65EuZ9nY6/7W+VkfR8N3fgudyCC
	vNdRzxgZkvubh69vVbm/ye/7Vb8qeEklM5tHpHD0HouY5NilKGhkh222CrJvt+dWUMB0q7dAiIT
	LdmUNOtwomRPDHeW1TzfpnRPdfIjozaUyU5sNNz2SRC6avugtiiIxZnZ7a2ftu8hSsQ==
X-Google-Smtp-Source: AGHT+IGskrcAxYWuD1UaxOxszCEZ+F/TKlF63RgAz7RbYXoOOw+YtpfsZJZ2Pf1S22dZZGMY9uwTkg==
X-Received: by 2002:a05:600c:c4a5:b0:456:1006:5418 with SMTP id 5b1f17b1804b1-458763179bcmr74807195e9.13.1753693492728;
        Mon, 28 Jul 2025 02:04:52 -0700 (PDT)
Date: Mon, 28 Jul 2025 11:04:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 0/6] Implement SR-IOV support for PVH
Message-ID: <aIc9Mwalh2n8-Clb@macbook.local>
References: <cover.1753450965.git.mykyta_poturai@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1753450965.git.mykyta_poturai@epam.com>

On Fri, Jul 25, 2025 at 02:24:31PM +0000, Mykyta Poturai wrote:
> This series enables support for PCI SR-IOV capabilty for PVH domains.
> It allows Dom0 to enable and use SR-IOV virtual functions and for this
> functions to be passed to guests.
> 
> To achieve this, handlers for SRIOV_CONTROL register and simplified handlers
> for VFs header were implemented.
> 
> Core functionality is based on previous works [1] and [2].

References here have been lost?

Thanks, Roger.

