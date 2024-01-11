Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678C782B041
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 15:05:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666289.1036816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvfw-0004lY-8z; Thu, 11 Jan 2024 14:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666289.1036816; Thu, 11 Jan 2024 14:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvfw-0004j8-5a; Thu, 11 Jan 2024 14:04:52 +0000
Received: by outflank-mailman (input) for mailman id 666289;
 Thu, 11 Jan 2024 14:04:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+ne=IV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNvfu-0004j2-Tw
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 14:04:50 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62801d24-b08a-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 15:04:50 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e613b6afbso5192835e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 06:04:50 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c4ece00b0040d5f3ef2a2sm5898691wmq.16.2024.01.11.06.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 06:04:49 -0800 (PST)
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
X-Inumbo-ID: 62801d24-b08a-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704981889; x=1705586689; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rsh8ufam+lEkXNzvVt6lxhdKuz68UHhAlMWHMZBNSjk=;
        b=orsHOw31ABNrda0VFCNhHCqd72/KjLvQe0iOM8TVU40yUN17Y/R8MmaKDzoGl+iJ8d
         iNICrgX9ZKvyKx4d2o66/BC4GAdFEVfH61KJEab+TXbMn008LRBXZc91yK0PMJj9BcEn
         DVaOWrhPwKws+ZM0YdC6db1zcg5rU4VhACDmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704981889; x=1705586689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rsh8ufam+lEkXNzvVt6lxhdKuz68UHhAlMWHMZBNSjk=;
        b=t5yYAyvlATf4HuiMoxsu4AaJ60xQU7vYfl95koWwxmeVHk85U9Hzu6Qot2cEiXv1ia
         qjMKbUqhbjyH1ucehB6rm2ODu6ZjCUi21D4QpiCqh7sNxesdfZMb8WAK0l6OFc2j8fdM
         fb520FErKHgtq4G7du1GDXm8x8+zwTQCWCkKAkpSACoXoCFDLOO5FEGrQctXev+qEyfQ
         s4krY0/gw5ba+b0M3bTWMdd/WeOL39pH/8YfX5tWHBWnV69TXaSbbzT1tJhpQkKfK9zl
         G23SDwLz1Gdeg5yI2qh/0Lm3mzv2OLLShCBy4FI0kZpzIgz6iGXcUwcLVyN21W83DABv
         H1cA==
X-Gm-Message-State: AOJu0YyYOybsJj2a6cQfyqLLfhMWxqDTwhFePLWjZVMSONB/AhFjfDJn
	nMfRYxyWIJ6gbAgtWnPrHbBH7nqv5xIYqA==
X-Google-Smtp-Source: AGHT+IFmAhrwOYvbZhYS9aQ3IAjgfdr/Fg2FqsD2GJDPx5qw2p0D58sxWNvKf0kQXHRcYUmpny0ofA==
X-Received: by 2002:a05:600c:4b1f:b0:40e:43dc:3e35 with SMTP id i31-20020a05600c4b1f00b0040e43dc3e35mr469718wmp.57.1704981889649;
        Thu, 11 Jan 2024 06:04:49 -0800 (PST)
Date: Thu, 11 Jan 2024 15:04:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 1/5] x86/HVM: split restore state checking from state
 loading
Message-ID: <ZZ_1gKoqua6Pha5k@macbook>
References: <8110e31e-5411-467e-9c59-06751902853a@suse.com>
 <88437dea-8448-4420-a608-957f3d861bba@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88437dea-8448-4420-a608-957f3d861bba@suse.com>

On Wed, Jan 10, 2024 at 03:57:06PM +0100, Jan Beulich wrote:
> ..., at least as reasonably feasible without making a check hook
> mandatory (in particular strict vs relaxed/zero-extend length checking
> can't be done early this way).
> 
> Note that only one of the two uses of "real" hvm_load() is accompanied
> with a "checking" one. The other directly consumes hvm_save() output,
> which ought to be well-formed. This means that while input data related
> checks don't need repeating in the "load" function when already done by
> the "check" one (albeit assertions to this effect may be desirable),
> domain state related checks (e.g. has_xyz(d)) will be required in both
> places.
> 
> With the split arch_hvm_{check,load}(), also invoke the latter only
> after downing all the vCPU-s.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

