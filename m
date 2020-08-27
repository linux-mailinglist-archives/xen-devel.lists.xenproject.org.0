Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7213A2541AB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 11:13:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBDwv-0006Og-WC; Thu, 27 Aug 2020 09:12:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k1Y6=CF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kBDwv-0006Ob-0L
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 09:12:01 +0000
X-Inumbo-ID: 2e5159b4-c48d-4372-acba-ff0f1054c130
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e5159b4-c48d-4372-acba-ff0f1054c130;
 Thu, 27 Aug 2020 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=xce2EgW3HjS952zTmQ6xpWc8FJvV1UKGz5vAFDQ7qAE=; b=4vOGmTXynqK2aLG1xkNVomfIIZ
 7DvNxcYhQJomS4sx6LNPHdnoifeUo5PxTz7NTpawfOJU9XQ5z7Aqz1SLQkLpEvfZR2bu3G9d3CyuU
 /X1VgYHh803fThqWiaxCO+P4wErDU1f96WWszYOWGd/QZHA/DNAk+ddhgE1+YYWO0P4o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kBDwt-0001nq-MY; Thu, 27 Aug 2020 09:11:59 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kBDwt-0007eA-ER; Thu, 27 Aug 2020 09:11:59 +0000
Subject: Re: gcc10 build issue for Arm64
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <be061c98-fad9-c8c0-a858-a65e08fe10ed@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e3309b1e-ae4c-bef0-ea1a-e555db35c27e@xen.org>
Date: Thu, 27 Aug 2020 10:11:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <be061c98-fad9-c8c0-a858-a65e08fe10ed@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/08/2020 09:01, Jan Beulich wrote:
> Stefano, Julien,

Hi Jan,

> since it was touching code potentially also affecting Arm, prior
> to my push of a couple of commits a few minutes ago I also wanted
> to build-test Arm. While as a fallback all went well with gcc
> 9.3, with my first (default) attempt with 10.2 I ran into
> 
> ld: prelink.o: in function `_spin_lock_cb':
> /build/xen/staging-arm64/xen/common/spinlock.c:164: undefined reference to `__aarch64_ldadd4_acq_rel'
> ld: /build/xen/staging-arm64/xen/common/spinlock.c:164: undefined reference to `__aarch64_ldadd4_acq_rel'
> make[3]: *** [/build/xen/staging-arm64/xen/xen-syms] Error 1
> make[2]: *** [/build/xen/staging-arm64/xen/xen] Error 2
> make[1]: *** [install] Error 2
> make: *** [install-xen] Error 2
> 
> I have no idea how recent the introduction of the issue is, but
> I hope you'll be able to pinpoint the offending change (and a
> possible fix) much easier than I would be.

It looks like GCC10 will outline atomic helpers by default. The 
following hack will do the trick:

diff --git a/xen/arch/arm/Rules.mk b/xen/arch/arm/Rules.mk
index e69de29bb2..8dfd9713af 100644
--- a/xen/arch/arm/Rules.mk
+++ b/xen/arch/arm/Rules.mk
@@ -0,0 +1 @@
+c_flags+=-mno-outline-atomics

I will clean it up to check it also works with older GCC.

Cheers,

-- 
Julien Grall

