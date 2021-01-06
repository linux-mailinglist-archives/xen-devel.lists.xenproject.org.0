Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC832EBCF6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 12:05:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62416.110522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6cW-0000ZV-Qe; Wed, 06 Jan 2021 11:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62416.110522; Wed, 06 Jan 2021 11:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6cW-0000Z6-Mg; Wed, 06 Jan 2021 11:04:52 +0000
Received: by outflank-mailman (input) for mailman id 62416;
 Wed, 06 Jan 2021 11:04:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eU9S=GJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kx6cV-0000Z1-D5
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 11:04:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cd812ad-9e83-4c85-b817-9e5e383c50b9;
 Wed, 06 Jan 2021 11:04:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 736F5AE39;
 Wed,  6 Jan 2021 11:04:49 +0000 (UTC)
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
X-Inumbo-ID: 8cd812ad-9e83-4c85-b817-9e5e383c50b9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609931089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HVh2TutAC5qujROS4NmOJjcEGV3c1ZqHwgWRbsEBB2s=;
	b=d9yr3tpREWXkYCvvGjnw/erLQ8/Yh0gYwuHVP0tVAtUIpv9wHnkYBG0daBN7P2GqPCu0mn
	m3ub5Ikj+G6I3bR5cUxsleCA/tMHkKqvMeJTiqISpHxNiPpWPYeNiu1shlJRvlgA7Uxc7n
	bHNNXdCQ3MDTA2i4Qz7GZWAyu2S7kQI=
Subject: Re: [PATCH v3] x86/intel: insert Ice Lake-X (server) and Ice Lake-D
 model numbers
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 jun.nakajima@intel.com, kevin.tian@intel.com, xen-devel@lists.xenproject.org
References: <1608755520-1277-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b0c7ccb7-32b8-a022-72ad-274e0a0c6dca@suse.com>
Date: Wed, 6 Jan 2021 12:04:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1608755520-1277-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 21:32, Igor Druzhinin wrote:
> LBR, C-state MSRs should correspond to Ice Lake desktop according to
> External Design Specification vol.2 for both models.
> 
> Ice Lake-X is known to expose IF_PSCHANGE_MC_NO in IA32_ARCH_CAPABILITIES MSR
> (confirmed on Whitley SDP) which means the erratum is fixed in hardware for
> that model and therefore it shouldn't be present in has_if_pschange_mc list.
> Provisionally assume the same to be the case for Ice Lake-D.

I did find Ice Lake D EDS, and it confirms the respective additions.
In the course I also found the "plain" Ice Lake EDS, and it seems to
contradict SDM vol 4 in that it doesn't list CC3_RESIDENCY (0x3FC).
For now I guess we can consider this a doc error.

I didn't find Ice Lake-X EDS, though.

Jan

