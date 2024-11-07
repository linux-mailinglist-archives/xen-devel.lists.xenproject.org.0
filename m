Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72299C0150
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 10:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831579.1246903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8z04-00010Y-Ed; Thu, 07 Nov 2024 09:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831579.1246903; Thu, 07 Nov 2024 09:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8z04-0000yS-Bl; Thu, 07 Nov 2024 09:40:24 +0000
Received: by outflank-mailman (input) for mailman id 831579;
 Thu, 07 Nov 2024 09:40:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8z02-0000yM-VJ
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 09:40:22 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4db1141e-9cec-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 10:40:20 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a99f3a5a44cso91203966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 01:40:20 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a17651sm68457366b.38.2024.11.07.01.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 01:40:19 -0800 (PST)
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
X-Inumbo-ID: 4db1141e-9cec-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRkYjExNDFlLTljZWMtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTcyNDIwLjMwMDg1Mywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730972420; x=1731577220; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3qMWNJHmcQtwiQmVgOTvSVZFEo9XJVvsxTt8A5Dc2kc=;
        b=o25+pjj7X8DqHzZ+RyiUCF/5YmkikQBjv4EZJyJt7GaMZYBeUXtTlkmTMt9GyDz/w0
         e53EvJ0FRJMygPxlUKtoJN7sLuqUvM6Kp0GvGHUbWKn3jzxDy+1ArPw8/zEwyodchoTg
         PBjD/tvDoaOBLuKfDvqwwAoVP4FJAFsKayyXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730972420; x=1731577220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qMWNJHmcQtwiQmVgOTvSVZFEo9XJVvsxTt8A5Dc2kc=;
        b=RbcdVsiRNdMGrS1jjvcu9ChmxQwiMGuTM1lglHVPvPrVtC7ZKvSPkRIba74rN9tJ3c
         JvEgiU7PFg+4gd/U4vRp2FoFe8fKgbHuO0fqTpafoM9KE6kkZ1c1eM1cVFHNQoAV2cja
         xxTulgnMb9bH5O8tACsB35Gj+7FuQpvEvU6qIID44Weqoxu5+0bT9c74iJ6WP0xifFSE
         AI5Jz3hbrIniUdoo9l4+/E0heXIeLuzhjPbdHKQohNk1xSOFMRqbWNFt7CcnhjJFtdfO
         TB9D77aogK1Nbg7+jBI/qskPfnDYj07ztGggJPI4rFqxgFoEjjOS7zSEnR0DNlrEJjia
         T+jA==
X-Gm-Message-State: AOJu0YzCne+nsM4rb0Mi5qd8i+alENFc/eWI0cSFGHfs0Fv6MDp/jt0t
	UfJWOsPLhfWMSlaMmCBratNtBPGsSRxaVd4tQMXdGc+3TNMKzK70NB6/g/cv1cGMK90w6yO1Ymt
	K
X-Google-Smtp-Source: AGHT+IG2MI2CD4nzB8EXfyw7RJ/l7husDsFjajiS/iK+HiAy+yKiiaJR2i19dB8MmbNXko0Gr4FaZQ==
X-Received: by 2002:a17:907:7fa6:b0:a9e:c2b5:198d with SMTP id a640c23a62f3a-a9ec2b51c03mr673296566b.42.1730972419652;
        Thu, 07 Nov 2024 01:40:19 -0800 (PST)
Date: Thu, 7 Nov 2024 10:40:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/Kconfig: livepatch-build-tools requires debug
 information
Message-ID: <ZyyLAj6MZ3fvOFBC@macbook>
References: <20241107084927.37748-1-roger.pau@citrix.com>
 <66fd7b53-25f5-459b-8563-e33fccba90ef@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66fd7b53-25f5-459b-8563-e33fccba90ef@citrix.com>

On Thu, Nov 07, 2024 at 09:21:26AM +0000, Andrew Cooper wrote:
> On 07/11/2024 8:49 am, Roger Pau Monne wrote:
> > The tools infrastructure used to build livepatches for Xen
> > (livepatch-build-tools) consumes some DWARF debug information present in
> > xen-syms to generate a livepatch (see livepatch-build script usage of readelf
> > -wi).
> >
> > The current Kconfig defaults however will enable LIVEPATCH without DEBUG_INFO
> > on release builds, thus providing a default Kconfig selection that's not
> > suitable for livepatch-build-tools even when LIVEPATCH support is enabled,
> > because it's missing the DWARF debug section.
> >
> > Fix by forcing the selection of DEBUG_INFO from LIVEPATCH.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Oops, yes.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Fixes tag ?

Was borderline on adding one, but wasn't sure since it's strictly
livepatch-build-tools that requires the DWARF data, but custom made
livepatches (like the examples in tests) do not require such
information.

Possibly:

Fixes: 11ff40fa7bb5 ('xen/xsplice: Hypervisor implementation of XEN_XSPLICE_op')

Which is the commit that originally introduced the CONFIG_XSPLICE option.

Thanks, Roger.

