Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EE78739EE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 15:57:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689354.1074225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhsht-00045U-P1; Wed, 06 Mar 2024 14:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689354.1074225; Wed, 06 Mar 2024 14:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhsht-00042I-M2; Wed, 06 Mar 2024 14:57:21 +0000
Received: by outflank-mailman (input) for mailman id 689354;
 Wed, 06 Mar 2024 14:57:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KzOk=KM=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rhshs-0003UR-II
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 14:57:20 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4a8e4a3-dbc9-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 15:57:19 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d26227d508so11848141fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 06:57:19 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r20-20020a2e9954000000b002d0c639e0cesm2642861ljj.6.2024.03.06.06.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 06:57:18 -0800 (PST)
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
X-Inumbo-ID: d4a8e4a3-dbc9-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709737039; x=1710341839; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7/XM4P7Alhhd7zvbUIu8Gj2raXXBnYs05DM7NQFx5MM=;
        b=dZIlBbqlB9GwP9zOieORvITTwlmcRWs2hrcG4Z+nlCiiFPhymYydNNIrBKD1/wniU+
         /u4KKJ9Wm8RbMzG4jqfcYq2cB/mchhwVzWqVsJuX1E6IpezQ908kLEULzu7NONtnQlA9
         I126pXqN6VEDLr9AmCKWmJe887Wk4KbPXAf/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709737039; x=1710341839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/XM4P7Alhhd7zvbUIu8Gj2raXXBnYs05DM7NQFx5MM=;
        b=aeecx84tcwEAZiPgAXMI1TPHLQ85gdttepQ8mywcO6qgsmgKtG4RdJsov69Ym4MNly
         nKvNMQatkHEiNyiR8VF+sm0rM/49TaPOeoQwvIru66sfwgKfjSjZPhJWV15GJBKrvEiC
         f7Piw1Prv49LoFBF0qtBs3s0jnZaxCqOsvCTDTJWHQ0bj6NcvXWmcY3ELFArbRX6FV+K
         0PzAfXFNIJ35D81KYOgEqpAzSqY9canv1P56UYBgE92OCuMNhL4OJF4hO2U9h6gil87y
         wKZo+/HuWvoJ3URqUWyYyAnyLRKjgYbtGK0mr2F0LnaVdhYqU3iJjkEbyEb5ocJjW8Yd
         wZ4w==
X-Gm-Message-State: AOJu0YzFL0ZGjaa57688yC4bvXleZBf/XxjJrdd/nANPbF7toJSUaG4R
	jKdl+TW64s02NRM6JTVMfTMEb4UdFeUTc9LR95dp6eLzHYi+/NtcRS/+G1v0Ips=
X-Google-Smtp-Source: AGHT+IGtvwiwfwdF+WjLiGUe2rUDed0eMWODyVNEtdnjb7iwzddijS9zgTAj2V+jfK+gpkFH8RJ0sA==
X-Received: by 2002:a2e:9f48:0:b0:2d2:66bf:2c1d with SMTP id v8-20020a2e9f48000000b002d266bf2c1dmr3848771ljk.2.1709737039235;
        Wed, 06 Mar 2024 06:57:19 -0800 (PST)
Date: Wed, 6 Mar 2024 14:57:16 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] x86/EFI: correct compiler probing
Message-ID: <9e26c1f2-add7-430b-9ba7-cce54d863955@perard>
References: <089964f2-1b2c-4ee7-92cf-f50f2e967d5b@suse.com>
 <7f0d8e16-c580-4dba-a81a-72d5334052dc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f0d8e16-c580-4dba-a81a-72d5334052dc@suse.com>

On Thu, Dec 07, 2023 at 11:48:12AM +0100, Jan Beulich wrote:
> Passing in $(CFLAGS) means also requesting inclusion of certain headers
> (via -include command line options). That's particularly xen/config.h,
> which in turn requires generated/autoconf.h. This has not caused any
> problems so far only because arch.mk is processed twice, and the missing

The first pass is ignore because "include/config/auto.conf" is missing,
and generating that will also generates "generated/autoconf.h" I think.
So result don't matter, and make restart from scratch once "auto.conf"
is generated.

> header on the 1st pass would be there on the 2nd. Having added an
> inclusion of asm/asm-macros.h to x86'es asm/config.h, the 2nd pass then

I don't see asm-macros.h been included in asm/config.h, is this
in a pending patch?

> also fails on an initial, pristine build.
> 
> As per dd40177c1bc8 ("x86-64/EFI: add CFLAGS to check compile") dropping
> the use of $(CFLAGS) altogether isn't an option, though. Hence remove
> the problematic options only.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

In any case, patch looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

> ---
> This is now the 3rd place where the -include needs dropping. I was half
> decided to introduce a new lazy-expansion variable, yet it's not
> consistently $(CFLAGS) that the options need purging from. Thoughts?

Something like that I guess, we probably want to avoid the "-include"
while testing the compiler. I guess introducing "-include config.h" once
we have all CFLAGS might make more sense, that is at about the time
where XEN_CFLAGS is currently introduced, but I haven't checked if
that's fine to do.

Cheers,

-- 
Anthony PERARD

