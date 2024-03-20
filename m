Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306C18815AA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 17:30:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696048.1086593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmypD-0006Bd-OM; Wed, 20 Mar 2024 16:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696048.1086593; Wed, 20 Mar 2024 16:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmypD-00068F-Ju; Wed, 20 Mar 2024 16:29:59 +0000
Received: by outflank-mailman (input) for mailman id 696048;
 Wed, 20 Mar 2024 16:29:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmypC-000689-Th
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 16:29:58 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 170721cd-e6d7-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 17:29:58 +0100 (CET)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-78a16114b69so8092085a.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 09:29:57 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 l9-20020ae9f009000000b0078861edc3bdsm6711040qkg.2.2024.03.20.09.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 09:29:56 -0700 (PDT)
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
X-Inumbo-ID: 170721cd-e6d7-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710952197; x=1711556997; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7r5Q7B8bIUOlAyeCcnPEwggJ2q1S0IrMTxc9KNn6ilU=;
        b=KdyO7vidIZit2E3TsJE8o8VgCWrTJ703t1RNvtZ0SY1E5lZAtCxsYwX7SsEgqs8JJg
         0+L/EjI8a8tB1bzLEuBrhSZkhJRCX52duQMnZAkQ3NLNsgt5UeVgPb3rXJd3E8ObKiQg
         WdPP2J+iJFw9HqarKBx0g9qNk/yLX2vt+TX14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710952197; x=1711556997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7r5Q7B8bIUOlAyeCcnPEwggJ2q1S0IrMTxc9KNn6ilU=;
        b=E3G8MVMOD9ijY2QaS3Xlubh+1ClK+Gscf8zHZEf0u6KRiiJOcTJ/FywFGcoyGs3KWE
         pX832xuC7mAjm3X5h/8ObmSsJNoypit8A9p/g2OrNaXRAPceQlLqSwLGFJuByFgbK0JK
         G530wc4qx4grmiiz6e3EfbP+ODovwcgy8CozzCT6nJ3fqQ7BgfxH4rDxJu1RYYnL+Zaq
         37nzu1hI1MYsnD4WfBQHYUGAcfUovBC81duzRyTv9OtwVcscbjNgCayc2RFlLRCbc/Fo
         fYhy0vauFLD2sPQB7GSZubOrsMM51yn99L0jH5TZSzcLLU8zyOBBHA0oo4kY48by5IsI
         BFMw==
X-Forwarded-Encrypted: i=1; AJvYcCVO9aj1VHSqcEUK69zfOZSB6G6XhQstYS08Rynp/irt1DKTUMtaZJf/F1pmZv7ckjJ0ugR/ueK4MSTP8Iz8rmXANaIS6xxj35C08/iFmr8=
X-Gm-Message-State: AOJu0Yx8V5606KuBPWyzx6WgV+1uqYsU5GSTYeexZy5+gYUBxPPjnq/K
	EaVz9BuRks2aantU2HeAXVa1mj6RuMW9cziCt6hxaAYmYLvJyyaYxAa8NYg6+Ng=
X-Google-Smtp-Source: AGHT+IGflJ6/PjoGnpk2VtQ6G8sI57xM+h5WcOO0OrGdwwLunWMGSKcbU0NJcYUySiRw4WTbmZpnUA==
X-Received: by 2002:a05:620a:7f1:b0:78a:1fda:7f1d with SMTP id k17-20020a05620a07f100b0078a1fda7f1dmr243172qkk.29.1710952196690;
        Wed, 20 Mar 2024 09:29:56 -0700 (PDT)
Date: Wed, 20 Mar 2024 17:29:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Message-ID: <ZfsPAj-ggY6unQef@macbook>
References: <20240320135720.68894-1-roger.pau@citrix.com>
 <73314dc5-0145-4aa7-a3cd-23c943235392@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <73314dc5-0145-4aa7-a3cd-23c943235392@suse.com>

On Wed, Mar 20, 2024 at 04:09:33PM +0100, Jan Beulich wrote:
> On 20.03.2024 14:57, Roger Pau Monne wrote:
> > There's no reason to force HVM guests to have a valid vcpu_info area when
> > initializing a vCPU, as the vCPU can also be brought online using the local
> > APIC, and on that path there's no requirement for vcpu_info to be setup ahead
> > of the bring up.  Note an HVM vCPU can operate normally without making use of
> > vcpu_info.
> 
> While I'd agree if you started with "There's no real need to force ...", I
> still think there is a reason: If one wants to use paravirt interfaces (i.e.
> hypercalls), they would better do so consistently. After all there's also
> no need to use VCPUOP_initialise, yet you're not disabling its use.
> 
> As said in reply to Andrew's reply, besides acting as a sentinel that
> structure instance also acts as a sink for Xen accesses to a vCPU's
> vcpu_info. By removing the check, you switch that from being a safeguard to
> being something that actually has to be expected to be accessed. Unless
> you've audited all uses to prove that no such access exists.

I'm kind of lost in this last paragraph, how is that different than
what currently happens when an HVM vCPU >= 32 is brought up using the
lapic and has no vpcu_info mapped?

Also, from a quick look it seems like sites do check whether vcpu_info
== dummy_vcpu_info, otherwise we would already be in trouble.

Thanks, Roger.

