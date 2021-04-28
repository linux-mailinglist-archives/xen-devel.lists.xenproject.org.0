Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F1636D588
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 12:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119184.225577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbhDC-0005wL-6w; Wed, 28 Apr 2021 10:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119184.225577; Wed, 28 Apr 2021 10:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbhDC-0005vw-3Y; Wed, 28 Apr 2021 10:14:30 +0000
Received: by outflank-mailman (input) for mailman id 119184;
 Wed, 28 Apr 2021 10:14:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lbhDA-0005vr-TE
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 10:14:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lbhD8-0002qo-IG; Wed, 28 Apr 2021 10:14:26 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lbhD8-0006hL-2G; Wed, 28 Apr 2021 10:14:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=WwQ0JBul44XZzb6di5GoXeN52HnDI99XCMYHc3FiYss=; b=EQZy+fxzmejz2bJMAQevBPOLpV
	6eCKiiehHnInTM+wjfgKkozQkAwxn8YECMrbABq6YzOjAr+uAip/YzuJkLn1tOAW93U6LiJLc1oBA
	rgFSPV+Z1dvrJCdL4PUWfo7P0+Fsf2wfStOf/S9/iVuuq/PYHUVmsmRmcVf9k5l++z5s=;
Message-ID: <5562d4e4df8a6efc4f74486d24a85339c9803b6f.camel@xen.org>
Subject: Re: [PATCH 00/16] Remove the direct map
From: Hongyan Xia <hx242@xen.org>
To: Wei Liu <wl@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson
 <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>,  xen-devel@lists.xenproject.org, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,  Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Wed, 28 Apr 2021 11:14:21 +0100
In-Reply-To: <20200602090851.hxfxwoiflip6kcym@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <cover.1588278317.git.hongyxia@amazon.com>
	 <20200501120715.hjak2gjp7ialwfq5@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
	 <689a7c860a8a551e3b6009b16590e812dbf21055.camel@xen.org>
	 <20200602090851.hxfxwoiflip6kcym@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-02 at 09:08 +0000, Wei Liu wrote:
> On Fri, May 01, 2020 at 02:53:08PM +0100, Hongyan Xia wrote:

[...]

> Not sure about hiding EPT. I will leave this question to Jan and
> Andrew...

Quick update on performance numbers. I have seen noticeable performance
drop if we need to map and unmap EPT. This translates to up to 10%
degredation in networking and database applications.

With EPT always mapped (not considering it as secrets), I have not seen
any noticeable performance drop in any real-world applications. The
only performance drop is from a micro-benchmark that programs HPET in a
tight loop (abusing MMIO page table walks), and the worst case is
around 10% to 15%.

Note that all above results are based on the mapcache rewrite patch

4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com
to fix the mapcache lock contention first.

Hongyan


