Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23710A64EE9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916801.1321832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9dv-0002wn-HW; Mon, 17 Mar 2025 12:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916801.1321832; Mon, 17 Mar 2025 12:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9dv-0002uN-Ep; Mon, 17 Mar 2025 12:32:31 +0000
Received: by outflank-mailman (input) for mailman id 916801;
 Mon, 17 Mar 2025 12:32:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoqB=WE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tu9dt-0002uF-VZ
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:32:30 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2c4ec05-032b-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 13:32:28 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-223594b3c6dso84112065ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:32:28 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7371157369bsm7416386b3a.75.2025.03.17.05.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 05:32:26 -0700 (PDT)
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
X-Inumbo-ID: e2c4ec05-032b-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742214746; x=1742819546; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oyp/sXA6zm/jIFx5SAtvaTM9xGR+yh+TpAnhYSQJpn0=;
        b=to+yIxF6UU9JfxexCcfnMCg9jhIzyElNShNUUPow9FDPTOcGr5mNz1vUJT4lSsu8/z
         UC4lhlSEFowR7uR64yAwylViZSoC46Ry1K43cosXtZLPCtFWC3oQojuBwidSrTT80jW8
         U6uV41ulqcfU41d761k4p2h00ive8OnPpYT5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742214746; x=1742819546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oyp/sXA6zm/jIFx5SAtvaTM9xGR+yh+TpAnhYSQJpn0=;
        b=Oh9VcOD+Oa6E1eZzn0poOgxDa+DM5MxRlEB70u4VkzCpPFGEySMHFhv/FSEHCp4VG4
         5T15QkKNNjclwv6iCc/ZWIu1/XJhlVeau9tAEzFvPYvd0poWR/5ch9GNx2LPFcrC7Z7w
         kTBCEjOWIe3/asXKE1yDDxZQGx1R9hJTbLa8VXhjwlxQKazFkSiwuwPCVrMuHf+WcP6+
         t1SIJ5UllJavqX2b9WseHuWA/y/HpiNVY1WxeJ/+MDm7Pgye10ZME9O0U+ZicJVe2veJ
         1LYWnVwLlpcbmd6UqCWm/6T2WWIir1rYFNfrPk/hgkJrzCcWpiI4uJRvhRQ6fHTle+om
         Rjtg==
X-Forwarded-Encrypted: i=1; AJvYcCVApt3cfzsVaDGJqx/tNOmNlkIOMMxhEhID27sN05kOkvxenagLxonjYWh5WDg+cfln+6yWdgHKlug=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfV7wutaC0PDd5/8IKS9yStdK5uvNp6X06scYMR9jyBsLLAhgk
	dG7mcePgNJUNbxL0qNGG38ixrd60yPMOXqwHjorpnpJyuEBzPfTUY2BlcKdbpr0=
X-Gm-Gg: ASbGnctKp7YFvu1tNGvdwpB/TG24T/6GdbLyM8YYH3gwHcon1vqtOpF8zui1WXJzK7/
	Mloh9g5ZFllKdmAfTbpCxVU9BaQUDidCEaH+YwYg7CPxMUN4YywSn+Rn8dE32NexZfkcyAYKtl+
	AIbrk0S/k5Ejc8sF8iP7SDtKzQxxejG2UQRa+zvnUzmOIDL91UCcSJYLT/NoL0NMk9T6a9EaY7t
	36YntkeZNAmhQPCkw+7ZJEVAMTLf2+TAn1pQA6KbbrRz5ulIJfylWPbu9OA5/sfRRwf0V3mi8cX
	Y2ekl07SYEGleiE0v5lh8s9XpiAPEljMeoxs8xZvHiLj68yjQUe/+7s=
X-Google-Smtp-Source: AGHT+IF0488juA/8ZcyXts4gUE/gxnJtyZJNyLNF44xKoaryRB6HfUeBFXrbpmzfis3i6kPJCzSn6w==
X-Received: by 2002:a05:6a21:3992:b0:1f5:7c6f:6c8b with SMTP id adf61e73a8af0-1f5c11711b3mr16721212637.10.1742214746553;
        Mon, 17 Mar 2025 05:32:26 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:32:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] [RFC] vpci: allow BAR write while mapped
Message-ID: <Z9gWVThk_OFhlzW1@macbook.local>
References: <20250312195019.382926-1-stewart.hildebrand@amd.com>
 <D8F8IW559J11.2G40MDQH23I44@cloud.com>
 <7b4f47c2-ce03-44e9-907a-acd56e56a9ff@amd.com>
 <D8FXALVEWMGZ.2C16ABCKLKQRY@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D8FXALVEWMGZ.2C16ABCKLKQRY@cloud.com>

On Fri, Mar 14, 2025 at 10:39:04AM +0000, Alejandro Vallejo wrote:
> On Thu Mar 13, 2025 at 5:43 PM GMT, Stewart Hildebrand wrote:
> > I think this just reinforces the need to rework the BAR mapping
> > machinery.
> 
> Right. The most delicate part is dealing with races with another vCPU when the
> unmap-then-map operation does not complete in a single taking of the vpci lock
> I'd say. And that much is unavoidable, I think, because either unmapping or
> mapping might take a while.

The original code was put together for dom0, I bet there are some
races that can lead to incomplete p2m mappings if the domain attempts
parallel manipulation of the BARs and memory decoding bits.  However
there should be no case where an unexpected mfn gets mapped into the
p2m as a result of such races.

It's fine for a domain to shot it's own foot if it attempts to do
concurrent PCI accesses to explicitly trigger races in the MMIO
mapping handling, as long as this doesn't cause issues to other
guests, and doesn't leak memory.

Regards, Roger.

