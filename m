Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB1EAA6C87
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 10:30:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974527.1362370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAlms-000460-B5; Fri, 02 May 2025 08:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974527.1362370; Fri, 02 May 2025 08:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAlms-00043m-8M; Fri, 02 May 2025 08:30:26 +0000
Received: by outflank-mailman (input) for mailman id 974527;
 Fri, 02 May 2025 08:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k+8a=XS=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1uAlmq-00043e-Ij
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 08:30:24 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b07759f8-272f-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 10:30:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2A018A4BB43;
 Fri,  2 May 2025 08:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BD6C4CEEE;
 Fri,  2 May 2025 08:30:13 +0000 (UTC)
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
X-Inumbo-ID: b07759f8-272f-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746174621;
	bh=XJ/fOLSZPcDhzbn7SBomjY3ra1ercNwGTwdTApCpr4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CsCcumy8yvL+I8c/Q+4FCgid3SiZumzGsXHXwXMdYu5Pb//5a+dPYvjCYyRD0S7xR
	 8OsobySDrVsqsSztegV67tmw+EzZy4UOm+uiwwLSOqz/aq7BngmEF9jCSpd5akyoGf
	 jMaLyfr2RqTyi2jyDa2H7KelSZY5d/1QPDkg1pXrmQa9gQSSLPwb/gIIrSfO435Of0
	 0gqTeWxKfMi1jh6+Z8xUkVFzHKvRcUa/gyVx5VK12AAAxHeKAUA7qDytqmewnPFkw4
	 90zUASti8CLXJfv7JW3XsRHfW5jf8FmECPis1Q3MnBN6EE6TFStJAALK1mkZJmFN08
	 ftBTm+oNzkoJA==
Date: Fri, 2 May 2025 10:30:11 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	acme@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com,
	peterz@infradead.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, wei.liu@kernel.org,
	ajay.kaher@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
	seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
	kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com,
	dapeng1.mi@linux.intel.com, ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v4 10/15] x86/xen/msr: Remove calling
 native_{read,write}_msr{,_safe}() in pmu_msr_{read,write}()
Message-ID: <aBSCk5phiMYO_B6T@gmail.com>
References: <20250427092027.1598740-1-xin@zytor.com>
 <20250427092027.1598740-11-xin@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427092027.1598740-11-xin@zytor.com>


* Xin Li (Intel) <xin@zytor.com> wrote:

> hpa found that pmu_msr_write() is actually a completely pointless
> function [1]: all it does is shuffle some arguments, then calls
> pmu_msr_chk_emulated() and if it returns true AND the emulated flag
> is clear then does *exactly the same thing* that the calling code
> would have done if pmu_msr_write() itself had returned true.  And
> pmu_msr_read() does the equivalent stupidity.
> 
> Remove the calls to native_{read,write}_msr{,_safe}() within
> pmu_msr_{read,write}().  Instead reuse the existing calling code
> that decides whether to call native_{read,write}_msr{,_safe}() based
> on the return value from pmu_msr_{read,write}().  Consequently,
> eliminate the need to pass an error pointer to pmu_msr_{read,write}().
> 
> While at it, refactor pmu_msr_write() to take the MSR value as a u64
> argument, replacing the current dual u32 arguments, because the dual
> u32 arguments were only used to call native_write_msr{,_safe}(), which
> has now been removed.
> 
> [1]: https://lore.kernel.org/lkml/0ec48b84-d158-47c6-b14c-3563fd14bcc4@zytor.com/
> 
> Suggested-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> Sign-off-by: Xin Li (Intel) <xin@zytor.com>

'Sign-off-by' is not a proper SOB tag, I've changed it to Signed-off-by.

Thanks,

	Ingo

