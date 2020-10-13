Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3CB28CF80
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 15:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6218.16512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKgS-0005O7-HV; Tue, 13 Oct 2020 13:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6218.16512; Tue, 13 Oct 2020 13:49:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKgS-0005Nm-E1; Tue, 13 Oct 2020 13:49:44 +0000
Received: by outflank-mailman (input) for mailman id 6218;
 Tue, 13 Oct 2020 13:49:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSKgQ-0005Ne-Ca
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:49:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f3379ea-6274-4702-80ad-45795359687f;
 Tue, 13 Oct 2020 13:49:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7CC0AC82;
 Tue, 13 Oct 2020 13:49:39 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSKgQ-0005Ne-Ca
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:49:42 +0000
X-Inumbo-ID: 0f3379ea-6274-4702-80ad-45795359687f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0f3379ea-6274-4702-80ad-45795359687f;
	Tue, 13 Oct 2020 13:49:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602596979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gh5NjLwGrLknJvHV0EAb87hhejiY3zlRt/0QE1JSreE=;
	b=BnwCodKQqaYBbFDYUrhB61BrkCAYGLLVE0Q9OJqtXh76DraiPpfTIIYUHyMnf3sT9ry1sw
	njyke3+1jbcDlX3owZ4VB4n/dKwGpWHaYFUA0y8Mk5jdI+z3lvKOJqGC0ehJAuW0bzHs0i
	vR7wXExVab5+mBRYSfqLtKNawaaVIww=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B7CC0AC82;
	Tue, 13 Oct 2020 13:49:39 +0000 (UTC)
Subject: Re: [PATCH] x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201006162327.93055-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <edc93f6b-4770-baed-9d00-428bce47e30b@suse.com>
Date: Tue, 13 Oct 2020 15:49:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201006162327.93055-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 06.10.2020 18:23, Roger Pau Monne wrote:
> Currently a PV hardware domain can also be given control over the CPU
> frequency, and such guest is allowed to write to MSR_IA32_PERF_CTL.
> However since commit 322ec7c89f6 the default behavior has been changed
> to reject accesses to not explicitly handled MSRs, preventing PV
> guests that manage CPU frequency from reading
> MSR_IA32_PERF_{STATUS/CTL}.
> 
> Additionally some HVM guests (Windows at least) will attempt to read
> MSR_IA32_PERF_CTL and will panic if given back a #GP fault:
> 
> vmx.c:3035:d8v0 RDMSR 0x00000199 unimplemented
> d8v0 VIRIDIAN CRASH: 3b c0000096 fffff806871c1651 ffffda0253683720 0
> 
> Move the handling of MSR_IA32_PERF_{STATUS/CTL} to the common MSR
> handling shared between HVM and PV guests, and add an explicit case
> for reads to MSR_IA32_PERF_{STATUS/CTL}.
> 
> Restore previous behavior and allow PV guests with the required
> permissions to read the contents of the mentioned MSRs. Non privileged
> guests will get 0 when trying to read those registers, as writes to
> MSR_IA32_PERF_CTL by such guest will already be silently dropped.
> 
> Fixes: 322ec7c89f6 ('x86/pv: disallow access to unknown MSRs')
> Fixes: 84e848fd7a1 ('x86/hvm: disallow access to unknown MSRs')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I would have given this my R-b, but Andrew's "straight up broken"
comment needs resolving first, one way or another.

Jan

