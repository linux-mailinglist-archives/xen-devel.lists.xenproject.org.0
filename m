Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B80FA98B5A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 15:37:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964730.1355448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7aHu-0007fc-Hm; Wed, 23 Apr 2025 13:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964730.1355448; Wed, 23 Apr 2025 13:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7aHu-0007eA-F1; Wed, 23 Apr 2025 13:37:18 +0000
Received: by outflank-mailman (input) for mailman id 964730;
 Wed, 23 Apr 2025 13:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Uk8=XJ=flex--seanjc.bounces.google.com=3CO0IaAYKCU07tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@srs-se1.protection.inumbo.net>)
 id 1u7aHs-0007e4-JN
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 13:37:16 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1093e780-2048-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 15:37:14 +0200 (CEST)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-309c6e43a9aso4216054a91.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 06:37:14 -0700 (PDT)
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
X-Inumbo-ID: 1093e780-2048-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745415433; x=1746020233; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QTV99TNe8c9V+BGz9HYw0E5RTZLdGwFx/9m2XgmuzHE=;
        b=uudNqaqXrNN2X9qhpkgLlUa9Tng2cbxikXyJsFGIFzA+GIOPIo/27jJti28xawRige
         z6qGjYKYcOSQVKukFKw25O34G7vbDJ0ePog8ikCQkzLoUwiPwKtNM71Lz0RQ9vbJ5w5c
         WfXgfFhgSsfAVuytJnHz8g567g697PtnHIq9GUZFz297vhHe/iKcLBifXBEtd8GRsOt6
         hNaa3qQeXKW22p8Qz07cLnB5wv7h9+NwnsTxFRoDAN2hTmDhh/GXApXcVC7IBlBpCGZY
         znxh5q8gFvsRrX/GSLx8ouaOSAXLVtw29rUuTHYjKqelpAVJlZTL39dul+VmUBbJkKrw
         of3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415433; x=1746020233;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QTV99TNe8c9V+BGz9HYw0E5RTZLdGwFx/9m2XgmuzHE=;
        b=YEMQ9dLxNHqI95YvQgGx51jqdqdGargcBdXTmLgWEeEApDzhYwKFu90pcxlSEnpQeo
         onhTw3qrPPgs4BixuUIGY1SsqAzYCPrR//tiHXQ/N73gG/sEmGIjRo04kDI7ygiQbQs0
         q+Zv+ThsP2JKbLl28r9lTFdDE8iPg6iVLWllyXXDH7tzQsEs7aAO+3Qkcg85DfwVSTLA
         cH7sVP59b6C+I8QCbvUmf15pdjb5luV/D+VQ+vB2BsNSOfk+Vrd/B740zxvunKKMVoDQ
         L7VPXxDxJ39Q5bb4YEjObz5uDtUch8YF+6T/WvYvPSWzHZsxMDqBFmTOY5BfIV//DJNd
         SxkA==
X-Forwarded-Encrypted: i=1; AJvYcCXamC2BZBQf09GxKJxUaPNY6cKb/v/kaMe863eEFWFwG7Y8P4nHeNb081MKEdSORNpp2XnTyx3zxsU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8yF8vNiRal3gyuiwsXDuAOm715UISxGxcbIyWALogDN+KVKKt
	hj0tTuNdY4FI7xP2G03P9ixW77gr89B/oPlcm541FID7AJc8c/iV94h6MdyTXri/hPZYsyMBCQ/
	2EA==
X-Google-Smtp-Source: AGHT+IEWS42km52dkYFlmcKZWmN1wttg5SPG3JN+o4kIB9LzXEDLrbHh1gdrPp7a64YZSw75FwPTF5N3xvo=
X-Received: from pjur12.prod.google.com ([2002:a17:90a:d40c:b0:308:867e:1ced])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2650:b0:2ee:9b2c:3253
 with SMTP id 98e67ed59e1d1-3087bbc9333mr25668631a91.30.1745415432973; Wed, 23
 Apr 2025 06:37:12 -0700 (PDT)
Date: Wed, 23 Apr 2025 06:37:11 -0700
In-Reply-To: <7527f09c-7163-4276-b9a4-edac6c8217ae@zytor.com>
Mime-Version: 1.0
References: <20250422082216.1954310-1-xin@zytor.com> <20250422082216.1954310-11-xin@zytor.com>
 <aAexLqjhKncFyw2V@google.com> <7527f09c-7163-4276-b9a4-edac6c8217ae@zytor.com>
Message-ID: <aAjtBxzvRgNt4Uzr@google.com>
Subject: Re: [RFC PATCH v2 10/34] x86/msr: Convert __rdmsr() uses to
 native_rdmsrq() uses
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org, 
	jgross@suse.com, andrew.cooper3@citrix.com, peterz@infradead.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, wei.liu@kernel.org, ajay.kaher@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com, 
	pbonzini@redhat.com, vkuznets@redhat.com, luto@kernel.org, 
	boris.ostrovsky@oracle.com, kys@microsoft.com, haiyangz@microsoft.com, 
	decui@microsoft.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 23, 2025, Xin Li wrote:
> On 4/22/2025 8:09 AM, Sean Christopherson wrote:
> > I strongly prefer that we find a way to not require such verbose APIs, especially
> > if KVM ends up using native variants throughout.  Xen PV is supposed to be the
> > odd one out, yet native code is what suffers.  Blech.
> 
> Will try to figure out how to name the APIs.
> 
> One reason I chose verbose names is that short names are in use and
> renaming needs to touch a lot of files (and not fun at all).

Yeah, I've looked at modifying rdmsrl() to "return" a value more than once, and
ran away screaming every time.

But since you're already doing a pile of renames, IMO this is the perfect time to
do an aggressive cleanup.

