Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E929BA96FC1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962738.1353893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7F9Q-0007oq-Fo; Tue, 22 Apr 2025 15:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962738.1353893; Tue, 22 Apr 2025 15:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7F9Q-0007kT-Cf; Tue, 22 Apr 2025 15:03:08 +0000
Received: by outflank-mailman (input) for mailman id 962738;
 Tue, 22 Apr 2025 15:03:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cc2d=XI=flex--seanjc.bounces.google.com=3pq8HaAYKCWsbNJWSLPXXPUN.LXVgNW-MNeNUURbcb.gNWYaXSNLc.XaP@srs-se1.protection.inumbo.net>)
 id 1u7F9O-0007ON-Lu
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:03:06 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e404042d-1f8a-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:03:04 +0200 (CEST)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-308677f7d8cso4887708a91.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 08:03:04 -0700 (PDT)
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
X-Inumbo-ID: e404042d-1f8a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745334183; x=1745938983; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR743ev6ExzRYE8cINx+AM9cywgAmFfoIc+SqezuNJU=;
        b=Cr4WTGTdI1iM8gD0wuETgqmcQF0RJ+zv7cz4cOs8MekFEWpKYDr2Za2cQobjSzzt96
         NQwWqpyJnwhizqXVSGR6DUsBXqYmcE7PXjE3EeYJ+Gmeu+ywky9/P6fcd9NcRF78gBaM
         zIftMYo8wE4NOtj6q9HvozvpR7HmxiywnrkaKhYTX4bHzmJLKI8DKS85DUA6v55mtZQo
         j/wBw+jhFcS1kTXuXVoq7ieRr6CXMhCehAV35AZQvupz3cOfgDIbPnJMjo0ChTkogix9
         TpNDhUG1wMNTYdiHl6oTn/c/YnOcBlblXe5Yk/eF2YqsNAxqeXqNlGgQWzzeoGB9k2xy
         a/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745334183; x=1745938983;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR743ev6ExzRYE8cINx+AM9cywgAmFfoIc+SqezuNJU=;
        b=KERXqYF8iz/mZdpQViQLeMwqZn4Mova6J3Gd4Suu+3rZyGa2t7rHi5NFJVGR6FUqS7
         uZcRjrBkCBKH143lCBj5TmmiDTCFqbUzlEt+ntwi3KBeOlcI9Qs4IX9HaKGyUKMQQE/F
         iFXySFfR2l2odavquu1CU5HI98PG2O+kx0jYfJFjPOfaydyrehB1pEE2d3MFbC827GPF
         Uzkg8/Sc/I04eMWJMECgQ0IQvJzo0LkYj9vT5t37AolZrSgEy0Ey6f/55D2k/xixvp9t
         xCOyvesn/I/+ZxWgF8RNDr6OjC/dR3tBNuG8dj0OErp8KpQVDdLzQsQF8grrTCNCvqmQ
         aDqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIof4Is5pKNUGFhcppTChUCrRZ5dnzUB6i7TWIaFRJadqgCybdkXvdoFZ/mnpbxBmirA3f0mYk8so=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDAjF/S7qRMphD9sn3eHk5vIRpCBsNdTvqG7qfqbQlh9CjvVun
	7SrrwmDYneNX9oKUtfoK162s4BJT/WIX4Rs8ey2Q/LJkAjaIRZ2WrZa+GQtWyte3vPXFDSsfdRD
	1ig==
X-Google-Smtp-Source: AGHT+IEIapJZJRM9UWSGs3HX5eEFDXXhucM1QTXJfnPOK/9YTrDfsNmQubNfg9xjcSY4LHTjaYmG0pXn5/g=
X-Received: from pjbsn11.prod.google.com ([2002:a17:90b:2e8b:b0:308:861f:fddb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a0c:b0:2ef:31a9:95c6
 with SMTP id 98e67ed59e1d1-3087bb56439mr25794718a91.14.1745334182926; Tue, 22
 Apr 2025 08:03:02 -0700 (PDT)
Date: Tue, 22 Apr 2025 08:03:01 -0700
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
Mime-Version: 1.0
References: <20250422082216.1954310-1-xin@zytor.com>
Message-ID: <aAevpauKYWwObsB7@google.com>
Subject: Re: [RFC PATCH v2 00/34] MSR refactor with new MSR instructions support
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
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

On Tue, Apr 22, 2025, Xin Li (Intel) wrote:
> base-commit: f30a0c0d2b08b355c01392538de8fc872387cb2b

This commit doesn't exist in Linus' tree or the tip tree, and the series doesn't
apply cleanly on any of the "obvious" choices.  Reviewing a 34 patches series
without being able to apply it is a wee bit difficult...

