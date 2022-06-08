Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84E5543A8F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 19:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344304.569829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyzbg-0005eB-4T; Wed, 08 Jun 2022 17:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344304.569829; Wed, 08 Jun 2022 17:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyzbg-0005bo-1P; Wed, 08 Jun 2022 17:36:36 +0000
Received: by outflank-mailman (input) for mailman id 344304;
 Wed, 08 Jun 2022 17:36:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nyzbe-0005bi-Km
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 17:36:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nyzbd-0002SD-AI; Wed, 08 Jun 2022 17:36:33 +0000
Received: from [54.239.6.189] (helo=[192.168.10.106])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nyzbd-00028x-2W; Wed, 08 Jun 2022 17:36:33 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=a82r2Ro6l8h74jW9DtjQZO0KTBfnwv/++8Mmg07eTP8=; b=YB9GGqYQHWtr6gX/F94blAB2ek
	SGKk10DvojIQa783lbU0vFxMG+WSVWoeCWPrlinWMXYviLnmldqdLX959H7oqrukS835VMb/V5qBe
	+3XkmU3pG8hYkYyYYAoPeaa1ql4cLsYQq/Ed8Oq04X9VrgfQWQi8PA08bN7//a2bRSI4=;
Message-ID: <4c0d7d61-4c58-6aec-c653-997a2fb87282@xen.org>
Date: Wed, 8 Jun 2022 18:36:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v3] SUPPORT.md: extend security support for x86 hosts to
 12 TiB of memory
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <873890bc-e5fd-a9ed-77ff-7bd06d390ae9@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <873890bc-e5fd-a9ed-77ff-7bd06d390ae9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 02/06/2022 09:43, Jan Beulich wrote:
> c49ee0329ff3 ("SUPPORT.md: limit security support for hosts with very
> much memory"), as a result of XSA-385, restricted security support to
> 8 TiB of host memory. While subsequently further restricted for Arm,
> extend this to 12 TiB on x86, putting in place a guest restriction to
> 8 TiB (or yet less for Arm) in exchange.
> 
> A 12 TiB x86 host was certified successfully for use with Xen 4.14 as
> per https://www.suse.com/nbswebapp/yesBulletin.jsp?bulletinNumber=150753.
> This in particular included running as many guests (2 TiB each) as
> possible in parallel, to actually prove that all the memory can be used
> like this. It may be relevant to note that the Optane memory there was
> used in memory-only mode, with DRAM acting as cache.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

