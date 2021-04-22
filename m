Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DFD36828D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115453.220276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaTa-0002CH-8I; Thu, 22 Apr 2021 14:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115453.220276; Thu, 22 Apr 2021 14:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaTa-0002Bs-4d; Thu, 22 Apr 2021 14:38:42 +0000
Received: by outflank-mailman (input) for mailman id 115453;
 Thu, 22 Apr 2021 14:38:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZaTY-0002Bn-JN
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:38:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a935ce5-05ef-4160-8ce5-d5645f5f2597;
 Thu, 22 Apr 2021 14:38:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75DD7AF5B;
 Thu, 22 Apr 2021 14:38:38 +0000 (UTC)
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
X-Inumbo-ID: 2a935ce5-05ef-4160-8ce5-d5645f5f2597
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619102318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zWuit8EpcJtCqyUSXuyn07q39WIqpJSHBL0C7kUAPB8=;
	b=B6jUv23cQ2vZLiGaK9NZf0YUjPAofYqtEYQMZnOSFTAX5SPAierMatOTzCcosndjI/IO8U
	0d/tQK2oq59WhTA+Jad/FMIRh+OUzPBe253AOLOMUVgNwijgGYx4N6rdKVQoWCjszML2EG
	VugMN3YtpTMlm9hgMlqbijTizMz4XyA=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 00/22] xvmalloc() / x86 xstate area / x86 CPUID / AMX+XFD
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Date: Thu, 22 Apr 2021 16:38:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While the sub-groups may seem somewhat unrelated, there are inter-
dependencies (logical, functional, or contextual). The majority of
the patches are unchanged in v3, but there are a few new ones. See
individual patches for details.

The first patch here depends on "gnttab: defer allocation of status
frame tracking array", which sadly is still pending (with the
discussion, as so often, stalled).

Similarly the discussion on whether to introduce xvmalloc() in its
presented shape, or what alternative would be acceptable, has stalled.
The Working Group, so far, hasn't really helped make progress here.
One thing I was wondering whether it would help, and which I had come
to consider while seeing something similarly named elsewhere: What
about naming the new functions xnew() and xdelete() and alike? To me
this would make it more natural to suggest that new code use them in
favor of xmalloc() or vmalloc(), and that we'd (slowly) transition
existing code to use them.

01: mm: introduce xvmalloc() et al and use for grant table allocations
02: x86/xstate: use xvzalloc() for save area allocation
03: x86/xstate: re-size save area when CPUID policy changes
04: x86/xstate: re-use valid_xcr0() for boot-time checks
05: x86/xstate: drop xstate_offsets[] and xstate_sizes[]
06: x86/xstate: replace xsave_cntxt_size and drop XCNTXT_MASK
07: x86/xstate: avoid accounting for unsupported components
08: x86: use xvmalloc() for extended context buffer allocations
09: x86/xstate: enable AMX components
10: x86/CPUID: adjust extended leaves out of range clearing
11: x86/CPUID: move bounding of max_{,sub}leaf fields to library code
12: x86/CPUID: enable AMX leaves
13: x86: XFD enabling
14: x86emul: introduce X86EMUL_FPU_{tilecfg,tile}
15: x86emul: support TILERELEASE
16: x86: introduce struct for TILECFG register
17: x86emul: support {LD,ST}TILECFG
18: x86emul: support TILEZERO
19: x86emul: support TILELOADD{,T1} and TILESTORE
20: x86emul: support tile multiplication insns
21: x86emul: test AMX insns
22: x86: permit guests to use AMX and XFD

Jan

