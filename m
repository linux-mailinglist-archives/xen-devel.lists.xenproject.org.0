Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02FACF493
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 18:43:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007187.1386496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNDgD-0005s3-Ua; Thu, 05 Jun 2025 16:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007187.1386496; Thu, 05 Jun 2025 16:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNDgD-0005pm-Ra; Thu, 05 Jun 2025 16:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1007187;
 Thu, 05 Jun 2025 16:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNDgC-0005pg-FC
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 16:43:00 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23768184-422c-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 18:42:59 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451d54214adso10551825e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 09:42:59 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a526057278sm3275358f8f.63.2025.06.05.09.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 09:42:58 -0700 (PDT)
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
X-Inumbo-ID: 23768184-422c-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749141778; x=1749746578; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jS5ousCDstlmnF7/5OSdRCNjs1Jf2SFLpZF6K4Qv/2A=;
        b=ujzpC09fULOULxDs93CXsb/jLswQTJ3QGsUXFbdYnB91lCzM4VFlxRSeiT3LU575+S
         AfFw9ilsbF+9uAI2BmVlWJe50GndLtYI5be44a4OBQJI3fuSx8EYsAt02EZiyh5Mxjk6
         MtXirI9ODe/3lar6ILC9ud4RwKB7ZfyJ5x0C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141778; x=1749746578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jS5ousCDstlmnF7/5OSdRCNjs1Jf2SFLpZF6K4Qv/2A=;
        b=luWUmZPrFOnfVrEHx6FuAft++GPEPSiMWIvKntoVcmiiZ1//9GqDi1S1uFTXuOmfEm
         VE2ragBqvUJwEGWnVlUD90ty/rW1qCgJvLbcO3/qJvvmVXw2zswCpx8reWFvmMsWreqK
         BP0tSEuomICaUUuTU/Bva7bWJJdA+Djrb1gjPI3xoNpG0gksH4h86iehZklKECt+sRqo
         +A4VqjdJeTiYC5zdeHepL+TGJGzZkRg9FOcm/+osO2ERwrM123MsR7msFZQRbGbICcXV
         BNx2ljbevzmZO7V16RCCXivv6oalnryJpi5gY0Rj+MYKtn0GDla10Nz3UrFRVeth+qbJ
         L+sw==
X-Gm-Message-State: AOJu0YywxOAS2fu8LgUW1zyQOeNcWHWd90PqFk4MGXC09XpnmmFkS3nA
	dP3xPGnmxYUu9fFWjeMjjF+u/+224BEOX90yvv2wKdi1dqVvGskftYk8QueG0a+bnpE=
X-Gm-Gg: ASbGncvx7CZxxumLiNNSFQbE3luElHiJydSp76TchCg61yffFKKTI9hxVbPARyNEUaT
	8X2p/mFt7/DkYsp1L+0vNr5muhygD0W6D6MO+/F9NBFuQZY+2m32g6b45I1E/ESvYP8SPjeLzAj
	QKBt+z75NDR+ZdUqT1M3KBJc7U+PQ/D/RnQWS/U8yzE85+Xk+hofvf76tIdK5cMB+zkcrkb/6Nr
	93PULKnj39Khn3nxgTOxzkKkFNp736Vtph3q6faO1BVWLCPm+DKIdSkSoHlpOxSjs3Xhkoh98Iw
	iz44+sPV2DSKtJFyE7+62in7XulaQMCDnudlTP28LA8vQoiZ9laUUoOqhly/jW/bAh/exYwdGBi
	CEfwI/2inMm458qmZ/l0=
X-Google-Smtp-Source: AGHT+IGW4zfyxVASdZjZXU2t5k0+1CB0DezzCdUkhzOB1D2Oso+yde2xrRETt41dj3ttXfPLUOCJ5w==
X-Received: by 2002:a05:600c:3b2a:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-451f0a76e2dmr75227615e9.11.1749141778497;
        Thu, 05 Jun 2025 09:42:58 -0700 (PDT)
Date: Thu, 5 Jun 2025 18:42:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 02/11] xen/page_alloc: Remove `claim` from
 domain_set_outstanding_pages()
Message-ID: <aEHJEc5Pht5xcMfO@macbook.local>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-3-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314172502.53498-3-alejandro.vallejo@cloud.com>

On Fri, Mar 14, 2025 at 05:24:53PM +0000, Alejandro Vallejo wrote:
> With a single global count for the claims it's easy to substract
> domain_tot_pages() from the claim so the number given in the hypercall
> is the real reservation of the domain. This is the current behaviour.
> 
> However, a later patch introduces exact-node claims and those interact
> very poorly with such a scheme. Since accounting domain_tot_pages() in
> one case but not the other seems strictly worse than not accounting them
> at all (which is at least consistent), this patch stops substracting
> tot_pages from the claim and instead checks that claimed memory +
> allocated memory don't exceed max_mem.

Hm, while I don't have any specific interest in keeping the current
behavior, XENMEM_claim_pages is part of the stable ABI (it's not a
domctl), and hence should be stable.  Note also the comment above the
definition of XENMEM_claim_pages how it states the specific behavior
that you are trying to change (and which should have been adjusted as
part of this change).

I have no idea why this was made a xenmem rather than a domctl
hypercall, but if you want to change the semantics I think the only
option is introducing a new hypercall.

Thanks, Roger.

