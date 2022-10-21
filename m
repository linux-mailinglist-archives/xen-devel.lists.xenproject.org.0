Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3767360814D
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 00:03:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428021.677748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1om06D-0006GQ-Td; Fri, 21 Oct 2022 22:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428021.677748; Fri, 21 Oct 2022 22:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1om06D-0006Dy-Qj; Fri, 21 Oct 2022 22:02:41 +0000
Received: by outflank-mailman (input) for mailman id 428021;
 Fri, 21 Oct 2022 22:02:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1om06B-0006Ds-I8
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 22:02:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1om068-0004mc-Hb; Fri, 21 Oct 2022 22:02:36 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1om068-0008Il-9x; Fri, 21 Oct 2022 22:02:36 +0000
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
	bh=RfGouTLT2U5jEb0lWbfH1vE7DwS/WvTls4YB2mlYxEU=; b=C3euaVH3287MExPCYVyB4aBww5
	awo7hW8jdc27UjrzxzlPM4dU1Udqv4kSCfC/W8L4/nPbCdjHpgWfx0FLqziKynJpF6Pwzgbg+yqKu
	O0Hg91Wi9RQIqdTB/5gUFjUG+w6LnTVtfQBctwT2YpLSKPnc3gthZ7QasLvE30tpetBA=;
Message-ID: <58c2c77a-c61c-fa14-9d92-0dabac814a15@xen.org>
Date: Fri, 21 Oct 2022 23:02:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [for-4.17] automation: Do not use null scheduler for boot
 cpupools test
To: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>, Henry Wang <Henry.Wang@arm.com>
References: <20221021165341.7905-1-michal.orzel@amd.com>
 <b1f7c77b-6e39-85e9-074e-0e31ed9648db@citrix.com>
 <alpine.DEB.2.22.394.2210211211090.3873@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2210211211090.3873@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 21/10/2022 20:36, Stefano Stabellini wrote:
> For the NULL scheduler, it is clearly important to many users so it
> would be valuable to move it to "supported, non security supported" and
> enabling it by default in the build. I don't recall if we still have any
> known outstanding issues with it. I think we need a separate email
> thread for that discussion and I would understand if the decision is not
> to change NULL support status for the 4.17 release (maybe for the 4.18
> release?).

At the moment, I am tracking two major issues for NULL scheduler:
  - ED25BE5E-D695-4763-B97A-78D6040E2341@amazon.com
  - alpine.DEB.2.22.394.2201051615060.2060010@ubuntu-linux-20-04-desktop 
(reported by you)

Have they been fixed? If not, then I don't think can be moved to 
"supported, not security supported" because it would fall over basic setup.

Cheers,

-- 
Julien Grall

