Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21AC211DF3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 10:19:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jquQn-0002ef-Mx; Thu, 02 Jul 2020 08:18:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bM0n=AN=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1jquQl-0002ea-CQ
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 08:18:52 +0000
X-Inumbo-ID: a251df2e-bc3c-11ea-bb8b-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a251df2e-bc3c-11ea-bb8b-bc764e2007e4;
 Thu, 02 Jul 2020 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=B95rbPlWjlDan7UytKGhRhe4eiuia9yaCCRRm9SGDcc=; b=0O81avXCjZeiwbdfkjY5QlweSc
 OQ1RJ9hkyqKUbu32+ayp8uy/9wwehfsmaa6JgjzTXqrZDwMe7+J+xA6TVJgyB1IizYyvcg7Uqxa54
 rIfaVVlmjsmzRQNkvd4T961eKkAkBlqBXGyaPKzDdA9vN+hRjG6G7d75lRc5zzbaSch8W70HOCU3Z
 a9agVIRMnyCH4b8YR0I28/x4345sHesBKM1ejKjKjsuqcAqyRZmAENAMwrAm501XiELmJ968TlWC8
 y6LOGcle+GcGrL24+mw6FN7w1VaaDJmgRSs6DJxof8IcowO2aKXxCp/5goZG43+T+9PCAmIBQUNKj
 7F9v0j+Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jquQQ-0005pZ-FU; Thu, 02 Jul 2020 08:18:30 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C53083003D8;
 Thu,  2 Jul 2020 10:18:27 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id AA0AE264F8CB2; Thu,  2 Jul 2020 10:18:27 +0200 (CEST)
Date: Thu, 2 Jul 2020 10:18:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 0/4] Remove 32-bit Xen PV guest support
Message-ID: <20200702081827.GA4781@hirez.programming.kicks-ass.net>
References: <20200701110650.16172-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701110650.16172-1-jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Deep Shah <sdeep@vmware.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 01, 2020 at 01:06:46PM +0200, Juergen Gross wrote:
> The long term plan has been to replace Xen PV guests by PVH. The first
> victim of that plan are now 32-bit PV guests, as those are used only
> rather seldom these days. Xen on x86 requires 64-bit support and with
> Grub2 now supporting PVH officially since version 2.04 there is no
> need to keep 32-bit PV guest support alive in the Linux kernel.
> Additionally Meltdown mitigation is not available in the kernel running
> as 32-bit PV guest, so dropping this mode makes sense from security
> point of view, too.

Hooray!!! Much thanks!

