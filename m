Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD863582F7
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107225.204956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTXV-0003DM-Mf; Thu, 08 Apr 2021 12:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107225.204956; Thu, 08 Apr 2021 12:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTXV-0003Cx-JQ; Thu, 08 Apr 2021 12:13:37 +0000
Received: by outflank-mailman (input) for mailman id 107225;
 Thu, 08 Apr 2021 12:13:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUTXU-0003Cs-8O
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:13:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 788afef9-2a46-4f2a-9aa7-2b6937f6155c;
 Thu, 08 Apr 2021 12:13:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 95082B114;
 Thu,  8 Apr 2021 12:13:34 +0000 (UTC)
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
X-Inumbo-ID: 788afef9-2a46-4f2a-9aa7-2b6937f6155c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617884014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C6FEdpeBiU/t9GXqV6uttJH+IyUVBgrvKvQ3hj+wMmY=;
	b=VYRmgUBWFPUE+BTKs4atX5RvrHwkLjUWYz2tL9wLpvaLQumyDtH7Vp95C2rE6dIWPZEUq1
	hD3opG4Fk2Y34qoP/gsPx281j4VI0gyQCbULNFH8Xl+kgEo2cF6Qn7RO93YcSFV7M0wiam
	OkBRkXNZ3NCLfjKn7CMQuwcX20lT6pw=
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/11] assorted replacement of x[mz]alloc_bytes()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Date: Thu, 8 Apr 2021 14:13:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In the long run I think we want to do away with these type-unsafe
interfaces, the more that they also request (typically) excess
alignment. This series of entirely independent patches is
eliminating the instances where it's relatively clear that they're
not just "blob" allocations.

01: x86/HVM: avoid effectively open-coding xzalloc_flex_struct()
02: x86/vPMU: avoid effectively open-coding xzalloc_flex_struct()
03: x86/MCE: avoid effectively open-coding xmalloc_array()
04: x86/HVM: avoid effectively open-coding xmalloc_array()
05: x86/oprofile: avoid effectively open-coding xmalloc_array()
06: x86/IRQ: avoid over-alignment in alloc_pirq_struct()
07: EFI/runtime: avoid effectively open-coding xmalloc_array()
08: hypfs: avoid effectively open-coding xzalloc_array()
09: kexec: avoid effectively open-coding xzalloc_flex_struct()
10: video/lfb: avoid effectively open-coding xzalloc_array()
11: Arm/optee: don't open-code xzalloc_flex_struct()

Jan

