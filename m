Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F41AAC7D6
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 16:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977393.1364407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCJDt-00071I-S5; Tue, 06 May 2025 14:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977393.1364407; Tue, 06 May 2025 14:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCJDt-0006yA-P7; Tue, 06 May 2025 14:24:41 +0000
Received: by outflank-mailman (input) for mailman id 977393;
 Tue, 06 May 2025 14:24:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lund=XW=flex--seanjc.bounces.google.com=3oBsaaAYKCYc3plyunrzzrwp.nzx8py-op6pwwt343.8py02zupn4.z2r@srs-se1.protection.inumbo.net>)
 id 1uCJDr-0006y4-SR
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 14:24:39 +0000
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [2607:f8b0:4864:20::549])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4c9c7db-2a85-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 16:24:34 +0200 (CEST)
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-af2f03fcc95so5676845a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 07:24:34 -0700 (PDT)
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
X-Inumbo-ID: d4c9c7db-2a85-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746541473; x=1747146273; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GvQ0P+wUKfaLn/ATwLSuvFKy87onNqdIa1sjwEnWlHA=;
        b=W97w3FdelJF9qHAJtJOy3dE8dui9QHrhWYFE+QtCSymT17lNJsmIoEtfbUklnflV2g
         OYKdiMk/zSyH3NYvDSp8fBhrI+y1os9ioPBbje+uDCNxfMvqYMYWlFA2bv6kB7kaO/a1
         UFQKGvaaqrcuF0IXCG5/QcU5yFQw3Fo8M1QrF/YzIAnQSWtyKmRsqn/IAiaQglvEZbmw
         UP3kdWN4EEe3AY9947up8mlVgXjfZPye7aNKaVbdKHpbTn9rQIZfjggl74xnhQW6zYpz
         lgyDlSsvprgcnoizlj0ty1DfUAI5SxQjFEkorakRJzWQmnusclOPCRV/H9gEhwP8EgaR
         1xLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541473; x=1747146273;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvQ0P+wUKfaLn/ATwLSuvFKy87onNqdIa1sjwEnWlHA=;
        b=MVR7Kk57LeVYS+RmBs7QOxYUho6XYfgY0PdJS056KbbinFKyXXhl5qNa+tS7es1M/3
         j9EKNKUq6XMEYZxF2EaeDRIGXk18KZD7ABN1drrq8qoyVouLpKGAWHLagsS/MCVjimJ4
         5PJ8O8ur6TS3ncwIj93nprbraLE5xK4SzZo5RrXBVUVgFfZs9SxxtigjQ1fFGBzHgifh
         tRw+rBugHpTJS/WOw/7Xtx7w9WGzAp4AZKSXngasTWovGmysIArJbF0hNaeGPT3GfZ2Z
         oorpHJj7aqv9BE87ImeLQdXZcO7tcvpSgLqoMEfYjQ5t24m5ghKey98XOz4RFolWcQNo
         86dw==
X-Forwarded-Encrypted: i=1; AJvYcCXn+pOzphPCDkUVJOHT7zEy7ts2ZqgRc0z9JLI7RfJZ6OuFEgGnpw0umgS0cfmjhG9g92JKT3/x4jE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy77/fPhwlqf/FEGpk610q+U+uhCZInYuMlUYG+e8s5tezJyUaq
	UZh5aSLJN5bCL3EuzFAqac+x12sHw5BJnqSirfkKphjX8J9KNj/3iNNj60jocbJwpq0GqmUrY5u
	AVA==
X-Google-Smtp-Source: AGHT+IG+tb6DAqfEkF2OtffXMj0e0GMqYjoEo/yCNWTnFNMEaweQ67wd6DzOO6xB801yCXPJlU9wA/n2y+w=
X-Received: from pfay24.prod.google.com ([2002:a05:6a00:1818:b0:736:b2a2:5bfe])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf42:b0:227:e709:f71
 with SMTP id d9443c01a7336-22e1ea822aemr186821615ad.29.1746541472989; Tue, 06
 May 2025 07:24:32 -0700 (PDT)
Date: Tue, 6 May 2025 07:24:31 -0700
In-Reply-To: <20250506092015.1849-4-jgross@suse.com>
Mime-Version: 1.0
References: <20250506092015.1849-1-jgross@suse.com> <20250506092015.1849-4-jgross@suse.com>
Message-ID: <aBobn8kaiDVCEqK4@google.com>
Subject: Re: [PATCH 3/6] x86/msr: minimize usage of native_*() msr access functions
From: Sean Christopherson <seanjc@google.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-hyperv@vger.kernel.org, 
	kvm@vger.kernel.org, xin@zytor.com, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="us-ascii"

On Tue, May 06, 2025, Juergen Gross wrote:
> In order to prepare for some MSR access function reorg work, switch
> most users of native_{read|write}_msr[_safe]() to the more generic
> rdmsr*()/wrmsr*() variants.
> 
> For now this will have some intermediate performance impact with
> paravirtualization configured when running on bare metal, but this
> is a prereq change for the planned direct inlining of the rdmsr/wrmsr
> instructions with this configuration.

Oh the horror, KVM's probing of errata will be marginally slower :-)

> The main reason for this switch is the planned move of the MSR trace
> function invocation from the native_*() functions to the generic
> rdmsr*()/wrmsr*() variants. Without this switch the users of the
> native_*() functions would lose the related tracing entries.
> 
> Note that the Xen related MSR access functions will not be switched,
> as these will be handled after the move of the trace hooks.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>

