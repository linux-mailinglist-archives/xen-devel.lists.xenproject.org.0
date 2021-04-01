Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735B835149A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 13:54:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104392.199667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRvtw-0004JF-PJ; Thu, 01 Apr 2021 11:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104392.199667; Thu, 01 Apr 2021 11:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRvtw-0004Iq-LO; Thu, 01 Apr 2021 11:54:16 +0000
Received: by outflank-mailman (input) for mailman id 104392;
 Thu, 01 Apr 2021 11:54:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lRvtv-0004Ik-OZ
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 11:54:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRvtt-00051I-QW; Thu, 01 Apr 2021 11:54:13 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRvtt-0006da-DH; Thu, 01 Apr 2021 11:54:13 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=iZ8kWEzj82J/Y8VRVzECs94V676ffQnEAzBnIRCm5cQ=; b=ADKL9IjxNp9azuHp+xvyBKxSSw
	QZWb6PGyYalr67zu+7gvlh9kin+FT3Uxhk0NApePaCtngYkM98/xYGizWZbf6XlOwL3nhduZ31Xo1
	asZA8tQidKbElGj5JweFBdZmKEwVw3nROnNVaMbX2VOvBCN/m5bVArstrq4LVurAkIbY=;
Subject: Re: [PATCH 00/23] further population of xen/lib/
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <27916fa0-9ebd-a49a-bbb9-1ef47c2b5bf6@xen.org>
Date: Thu, 1 Apr 2021 12:54:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/04/2021 11:14, Jan Beulich wrote:
> This is to dissolve / move xen/common/lib.c and xen/common/string.c.
> One benefit of moving these functions into an archive is that we can
> drop some of the related __HAVE_ARCH_* #define-s: By living in an
> archive, the per-arch functions will preempt any loading of the
> respective functions (objects) from the archive. (Down the road we
> may want to move the per-arch functions into archives as well, at
> which point the per-arch archive(s) would need to be specified ahead
> of the common one(s) to the linker.)

While I think it is a good idea to move code in xen/lib, I am not 
convinced that having a single function per file is that beneficial.

Do you have numbers showing how much Xen will shrink after this series?

Cheers,

-- 
Julien Grall

