Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF13AAB87D
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 08:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976644.1363836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCBu4-0002lq-3N; Tue, 06 May 2025 06:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976644.1363836; Tue, 06 May 2025 06:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCBu3-0002jx-UU; Tue, 06 May 2025 06:35:43 +0000
Received: by outflank-mailman (input) for mailman id 976644;
 Tue, 06 May 2025 02:32:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrwm=XW=uniontech.com=chenlinxuan@srs-se1.protection.inumbo.net>)
 id 1uC86o-0007B0-Al
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 02:32:38 +0000
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b290666-2a22-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 04:32:31 +0200 (CEST)
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 06 May 2025 10:30:59 +0800 (CST)
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
X-Inumbo-ID: 5b290666-2a22-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1746498699;
	bh=RK8CB/ILucoxkojMLroxyaAqpj6rXkr8cb1h0tuO+FM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kafLiDKXS816BmywaQFx+/F9Y6knLlHjegnJC8EOCpdTsnxr/e1yaY6y4wWVWU5Cc
	 pEmJcSIFvrEg1Nxq/uND+kyneyz+lm4cL848VLV2wWlvOab3SEPuOTkyOQdSj+ClQW
	 LZ+Ex6H0L9ikuOIyZud7Tr25Wd3PVQAdT9G4v3o8=
X-QQ-mid: esmtpsz17t1746498663t4c1b9905
X-QQ-Originating-IP: 2vhUXsJq6NqiLO1Htm0IxhFYAPx746WeA0MvTVyM9nk=
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1353101163767275647
EX-QQ-RecipientCnt: 52
From: Chen Linxuan <chenlinxuan@uniontech.com>
To: hch@lst.de
Cc: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
	andreyknvl@gmail.com,
	axboe@kernel.dk,
	boqun.feng@gmail.com,
	boris.ostrovsky@oracle.com,
	bp@alien8.de,
	changbin.du@intel.com,
	chenlinxuan@uniontech.com,
	dave.hansen@linux.intel.com,
	dvyukov@google.com,
	hannes@cmpxchg.org,
	hpa@zytor.com,
	jackmanb@google.com,
	jarkko@kernel.org,
	jgg@ziepe.ca,
	jgross@suse.com,
	justinstitt@google.com,
	kasan-dev@googlegroups.com,
	kbusch@kernel.org,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-nvme@lists.infradead.org,
	llvm@lists.linux.dev,
	masahiroy@kernel.org,
	mathieu.desnoyers@efficios.com,
	mhocko@suse.com,
	mingo@redhat.com,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nicolas.schier@linux.dev,
	paulmck@kernel.org,
	peterhuewe@gmx.de,
	peterz@infradead.org,
	sagi@grimberg.me,
	shameerali.kolothum.thodi@huawei.com,
	surenb@google.com,
	tglx@linutronix.de,
	torvalds@linux-foundation.org,
	vbabka@suse.cz,
	virtualization@lists.linux.dev,
	wentao@uniontech.com,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	yishaih@nvidia.com,
	ziy@nvidia.com
Subject: Re: [PATCH RFC v3 0/8] kernel-hacking: introduce CONFIG_NO_AUTO_INLINE
Date: Tue,  6 May 2025 10:30:53 +0800
Message-ID: <AB2D78307A5FD403+20250506023053.541751-1-chenlinxuan@uniontech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429123504.GA13093@lst.de>
References: <20250429123504.GA13093@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: MIXayioyWBZjdXIIg9vqEFEP1rndaeDbBxgcX+6TdOBY4fgPWBVGCH7p
	2JsHdKJTuNk6u8AM4q4ieHCa2JqpFTHWwRRL4JiA/mhRy6XEomq0Rcxy/vNg3zyQ8FVuKLk
	8u8FKj8M5lKtxCc/AqTb4cgg61ofZ0b0vrixlYN4JBF1kCxPgn8qobIDmHUgdW9IFOYw1+N
	NzCrUuumdTal59UvJXIVIFoyfA9UBsYY3QApHJufslFjIYbt35eMNpV5rvVKf1I/YYKCDNC
	P9yTyAZep/MN4DPY0aYU4VKEhzq4hfUEtrTG+yS8IFi8cu4WnxADpZzlhEfh6sgIPFr9D/5
	LAjp9zJsR/w/WJBlV0/AeccvTg2ivMv8/8ld0KRxxvkD56dIxmj6YXZNshVuONjuE0nJjBO
	/ZkGZ6luDwhjEO+vkDN/jlP28nAAeQhf+qskcK1/Y9pNoGKLQM3DBAIcozpo04ivN/6cYTB
	mj2nrsDyaK1C+tCjVrjTPZFIfhssizrE/gf8iGN1F7O/hmuxJwA/dK3NI1t8SeRqO7lQz4L
	B4hzjQne+6C9oeYpkB+VOOK9PsOSswtEhn02iTK5I9PQ+Ycv7ivq6ZY5n6oWMcqKlxPN7BO
	H5JnZY5xmDNSQq3b5Wuosg7tUvfTmTgSSX4FEIzlh0XnGAcc9uh0LsxhMPWJEoyR1zYtXT8
	wYAyFsEm6cQkmgHkhA1RIcJKVmauWeY1Ior96a9f1buQZB8VVfJt+WJbMtDmDfETYG5hNrJ
	v32eTkTlFFTYKKE7IcWnK/aaTY4CI/qOHh5uVSzxCPgXjhOLX3h3MBL7nZPgOYEiV7v/m1b
	LeNwKkEEMf/YAs1XwZqw6xD/OrRuB9gCzaDRun3T8Eq2tb0DK8XA3tPUX/869R/Ki7azM8P
	ztB3y+QhyBBY/ymt6WbrLX+aRWFcGEL38eFBGQtoKi2UIVz7HU4hJjuodhguJq7uPcST0KO
	L2QyrEpCbzrrs0aGqC9GCbTWQp+Bzf9NeEGo3iubNJE93+fc0YEPkQoz3WNGg0lh7Q8ZEbe
	a4N/7YW8KVwYAvMNJi3geZoASlc1w=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On Tue, 29 Apr 2025 14:35:04 +0200 Christoph Hellwig wrote:

> On Tue, Apr 29, 2025 at 12:06:04PM +0800, Chen Linxuan via B4 Relay wrote:
>
> > This series introduces a new kernel configuration option NO_AUTO_INLINE,
> > which can be used to disable the automatic inlining of functions.
> >
> > This will allow the function tracer to trace more functions
> > because it only traces functions that the compiler has not inlined.
>
> This still feels like a bad idea because it is extremely fragile.

I'm not entirely sure if we're on the same page regarding this issue.
However, I'd like to address the concerns about the fragility of NO_AUTO_INLINE.

Maintaining NO_AUTO_INLINE to function correctly is indeed challenging,
and I share some reservations about whether it should exist as a Kbuild option,
which is precisely why this patch series is submitted as an RFC.
I cannot even guarantee that I've addressed all existing issues in the current
kernel repository with this patch series, as testing all possible compilation
configurations is beyond my capabilities.

Looking at the functions where I've added __always_inline in this patch series,
nearly all of them require inlining specifically because their calls need to be
resolved at compile time.

The fundamental source of this fragility stems from the fact that compiler
auto-inlining decisions aren't well-defined. If these functions were to change
in the future for unrelated reasons - for example, if they became longer - and
the compiler consequently decided not to automatically inline them, these same
issues would surface regardless.

