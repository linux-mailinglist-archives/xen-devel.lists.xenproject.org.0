Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E0AAB6F3C
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 17:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984450.1370592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDmd-0004nx-Am; Wed, 14 May 2025 15:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984450.1370592; Wed, 14 May 2025 15:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDmd-0004lB-72; Wed, 14 May 2025 15:12:35 +0000
Received: by outflank-mailman (input) for mailman id 984450;
 Wed, 14 May 2025 15:12:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Q1L=X6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFDmb-0004l5-Ns
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 15:12:33 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da21ec0e-30d5-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 17:12:30 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-72d3b48d2ffso6967291b3a.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 08:12:30 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b2349dd2b3esm9108227a12.17.2025.05.14.08.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 08:12:28 -0700 (PDT)
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
X-Inumbo-ID: da21ec0e-30d5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747235549; x=1747840349; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3kxtWbon+xp78lamArIAzNYIEA5KZzrX4X0Kxp5vIKc=;
        b=DZp2UMnLH9ERFH2kd9g77a9YRLwjsRbF6vRAExj7ASyfMVYC1mra3guu+OTWzOiLRf
         q0tI52Y0a0Etrc1tRLQAf9ksnHy4IoKvMqD0idDrO335hnnt4GLxIHiN+pHEZbLF+29m
         kIgpMV4oTXsxgsB7M3wl/LcPh/KHtaNq3fPaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235549; x=1747840349;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kxtWbon+xp78lamArIAzNYIEA5KZzrX4X0Kxp5vIKc=;
        b=OMpSuLE7IapYoY9sqUl8NqHVoRntOapWP8eUR3w/rYbsw38wW/w4ZOeWSClbiRQgAH
         kKFsbKxgRv+TYErlp5b2t5ga2l8syPZKV0fc6USOVIYGUSsB+IjHgX72dX7fv3S9CE0I
         7LzGdGmA7G1h2viQTFYT+b+Ms61r0wkpzK7KrC//rJ+icyJ7HwbhZQjTDvsSpsPh0iDO
         PBzh0BY/jcsOOoDuvdQsffKrn1mH83XlluZrEK6exc/JImUIihhKXU/3ddU/W56Yhm6T
         ce4qfXogq+efxKD41Egy3pDqXJYt1U4pKL9ZbkFLkROO+f7X6LSCyCy3oaWUrvq52uin
         /rHQ==
X-Gm-Message-State: AOJu0YyAK8M/Ne2UPc2WGxfzQPDhxLEasYYAraNFLHKpbY77ig092h8w
	IbeVyDxDI/xcXcWSOmtdsxhgA54Qi4+v4/27P+AVIhXYAQsJTmP+sM0ZM98bHes=
X-Gm-Gg: ASbGncvg/ZWIAqu11hDEiylXr+CBisE07J0oQBa2nrM9W5LrM9jJdVXk1wpMwWtySK/
	lh1grsLgWi0AKhqf+yy5s1KvWi9gfOdbfMN3ZwH558MdOdd6JMvSaa76M5R6MtJxnu7TeMB4bJ7
	y5Abk8+zbFgGlUtG202oJ+NCQyoieXUOx+J1zkWsnf0CXGpDupnz89R8hpsCYt7kA+qCrkeSjwA
	432ljA1vAyupmeVd8akKWRJ49KYmsfqQKzc9XarnjikCebQt3ZrECvUyY83cQGIy95sWf86CPyO
	vAkGACl7bDW3rrzQgFia8Xiu9dwkna8KYjdApwJz7Q3uzV4bcQFeHZkt
X-Google-Smtp-Source: AGHT+IF9Vg/XQIKNLyhJ1bqekJyy8/rtFAj8uIoUwUfIMNHKXj8w7MCo3imU41keNG3b19sPNd/njQ==
X-Received: by 2002:a05:6a21:6d94:b0:215:f656:6632 with SMTP id adf61e73a8af0-215ff1890d6mr6415706637.29.1747235548687;
        Wed, 14 May 2025 08:12:28 -0700 (PDT)
Date: Wed, 14 May 2025 17:12:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 6/6] x86/HVM: limit cache writeback overhead
Message-ID: <aCSy1sSjZ6MiHOIT@macbook.lan>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <9274fbb1-c1be-9570-ecfc-8f0ac9a1f42b@suse.com>
 <aCST30l2N9X6AOgr@macbook.lan>
 <be7e2d91-69f5-4168-9d2c-57d3f6dac26f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be7e2d91-69f5-4168-9d2c-57d3f6dac26f@suse.com>

On Wed, May 14, 2025 at 03:20:56PM +0200, Jan Beulich wrote:
> On 14.05.2025 15:00, Roger Pau Monné wrote:
> > On Wed, May 03, 2023 at 11:47:18AM +0200, Jan Beulich wrote:
> >> There's no need to write back caches on all CPUs upon seeing a WBINVD
> >> exit; ones that a vCPU hasn't run on since the last writeback (or since
> >> it was started) can't hold data which may need writing back.
> > 
> > Couldn't you do the same with PV mode, and hence put the cpumask in
> > arch_vcpu rather than hvm_vcpu?
> 
> We could in principle, but there's no use of flush_all() there right now
> (i.e. nothing to "win").

Yes, that will get "fixed" if we take patch 2 from my series.  That
fixes the lack of broadcasting of wb{,no}invd when emulating it for
PV domains.

I think this patch would be better after my fix to cache_op(), and
then the uncertainty around patch 2 makes it unclear whether we want
this.

> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> With us not running AMD IOMMUs in non-coherent ways, I wonder whether
> >> svm_wbinvd_intercept() really needs to do anything (or whether it
> >> couldn't check iommu_snoop just like VMX does, knowing that as of
> >> c609108b2190 ["x86/shadow: make iommu_snoop usage consistent with
> >> HAP's"] that's always set; this would largely serve as grep fodder then,
> >> to make sure this code is updated once / when we do away with this
> >> global variable, and it would be the penultimate step to being able to
> >> fold SVM's and VT-x'es functions).
> > 
> > On my series I expand cache_flush_permitted() to also account for
> > iommu_snoop, I think it's easier to have a single check that signals
> > whether cache control is allowed for a domain, rather that having to
> > check multiple different conditions.
> 
> Right, adjustments here would want making (in whichever series goes in
> later).
> 
> For both of the responses: I think with patch 1 of this series having
> gone in and with in particular Andrew's concern over patch 2 (which
> may extend to patch 3), it may make sense for your series to go next.
> I shall then re-base, while considering what to do with patches 2 and 3
> (they may need dropping in the end).

Makes sense, I still need to get over your feedback on my series, I've
been distracted with other stuff.

Thanks, Roger.

