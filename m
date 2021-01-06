Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A3C2EBC11
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 11:04:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62398.110474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx5ez-0002tq-I2; Wed, 06 Jan 2021 10:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62398.110474; Wed, 06 Jan 2021 10:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx5ez-0002tR-Em; Wed, 06 Jan 2021 10:03:21 +0000
Received: by outflank-mailman (input) for mailman id 62398;
 Wed, 06 Jan 2021 10:03:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QPu5=GJ=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1kx5ex-0002t3-5S
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 10:03:19 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc98718c-3f33-4f8f-a6d2-d84144287cc0;
 Wed, 06 Jan 2021 10:03:16 +0000 (UTC)
Received: from zn.tnic (p200300ec2f09690020b9eee96d74c6dd.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f09:6900:20b9:eee9:6d74:c6dd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CE4281EC04F0;
 Wed,  6 Jan 2021 11:03:15 +0100 (CET)
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
X-Inumbo-ID: dc98718c-3f33-4f8f-a6d2-d84144287cc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1609927395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=iAfpaZseU8rtBfSQH6eBi47GvS0K9Dab1MU6EmvLzI4=;
	b=czQrmcoO22O7xdC9bFE4W9lPaNRZpf1Z2jpKUXdHJyQbbVDKBJGpJS1to4FH6VjI/6Qy6+
	56XCeScS3+yGMxXTpDcmKoGK4EgczE77stbxqRnJWO446dmnV5ONxt9cP+fdM67fBlkYrQ
	aVVK2zT/Xvgpdhch6r6/CPCc140lQtU=
Date: Wed, 6 Jan 2021 11:03:13 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>
Subject: Re: [PATCH v3 06/15] x86/paravirt: switch time pvops functions to
 use static_call()
Message-ID: <20210106100313.GB5729@zn.tnic>
References: <20201217093133.1507-1-jgross@suse.com>
 <20201217093133.1507-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201217093133.1507-7-jgross@suse.com>

On Thu, Dec 17, 2020 at 10:31:24AM +0100, Juergen Gross wrote:
> The time pvops functions are the only ones left which might be
> used in 32-bit mode and which return a 64-bit value.
> 
> Switch them to use the static_call() mechanism instead of pvops, as
> this allows quite some simplification of the pvops implementation.
> 
> Due to include hell this requires to split out the time interfaces
> into a new header file.

I guess you can add Peter's patch to your set, no?

https://lkml.kernel.org/r/20201110005609.40989-3-frederic@kernel.org

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

