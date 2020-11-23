Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F46E2C0D24
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:21:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34424.65464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCir-0006go-Tm; Mon, 23 Nov 2020 14:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34424.65464; Mon, 23 Nov 2020 14:21:41 +0000
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
	id 1khCir-0006gP-Qc; Mon, 23 Nov 2020 14:21:41 +0000
Received: by outflank-mailman (input) for mailman id 34424;
 Mon, 23 Nov 2020 14:21:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCiq-0006gA-Im
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:21:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d513835-2e39-4bab-9ec9-afc2661fe1a7;
 Mon, 23 Nov 2020 14:21:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B225DAF54;
 Mon, 23 Nov 2020 14:21:34 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCiq-0006gA-Im
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:21:40 +0000
X-Inumbo-ID: 3d513835-2e39-4bab-9ec9-afc2661fe1a7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3d513835-2e39-4bab-9ec9-afc2661fe1a7;
	Mon, 23 Nov 2020 14:21:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606141294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZoKvCu5J16lRfvmkYOYXSTPWjH5bbUhuTfmyeH+XFCc=;
	b=ms4yIJIYbnZicKngg8mNcwOmI85jFX+bn2nf41GnObWH5IOOo5Ua9O9W5uFsU2MqW8Wmg8
	rxXJCx167MXz+WJCemb3tOIqZ0J8/NmjuWFi8JsbcXL7bJ5EJ0tj/mB/0KpfK5DEFdjvBF
	FDynt3bi7e7k0MNQe11UMvwRD+IkjYU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B225DAF54;
	Mon, 23 Nov 2020 14:21:34 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 00/17] xvmalloc() / x86 xstate area / x86 CPUID / AMX
 beginnings
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Date: Mon, 23 Nov 2020 15:21:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While the sub-groups may seem somewhat unrelated, there are inter-
dependencies (logical, functional, or contextual). The majority of
the patches is new in v2; one previously standalone patch has been
integrated into here.

01: mm: check for truncation in vmalloc_type()
02: mm: introduce xvmalloc() et al and use for grant table allocations
03: x86/xstate: use xvzalloc() for save area allocation
04: x86/xstate: re-size save area when CPUID policy changes
05: x86/xstate: re-use valid_xcr0() for boot-time checks
06: x86/xstate: drop xstate_offsets[] and xstate_sizes[]
07: x86/xstate: replace xsave_cntxt_size and drop XCNTXT_MASK
08: x86/xstate: avoid accounting for unsupported components
09: x86: use xvmalloc() for extended context buffer allocations
10: x86/xstate: enable AMX components
11: x86/CPUID: adjust extended leaves out of range clearing
12: x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents
13: x86/CPUID: move bounding of max_{,sub}leaf fields to library code
14: x86/CPUID: enable AMX leaves
15: x86emul: introduce X86EMUL_FPU_tile
16: x86emul: support TILERELEASE
17: x86emul: support {LD,ST}TILECFG

Jan

