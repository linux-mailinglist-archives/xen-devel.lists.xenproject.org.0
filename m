Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA2E443128
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220335.381563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvH0-0004TN-Mo; Tue, 02 Nov 2021 15:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220335.381563; Tue, 02 Nov 2021 15:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvH0-0004Rb-Jk; Tue, 02 Nov 2021 15:00:26 +0000
Received: by outflank-mailman (input) for mailman id 220335;
 Tue, 02 Nov 2021 15:00:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mhvGy-0004RV-Qw
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:00:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mhvGv-0007bD-RN; Tue, 02 Nov 2021 15:00:21 +0000
Received: from [54.239.6.184] (helo=[192.168.7.68])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mhvGv-0007VN-Kx; Tue, 02 Nov 2021 15:00:21 +0000
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
	bh=TAm3Jt6zRQo7Lr3i5Zye2iD7SiafJaPanO5ZKAcddLA=; b=kWlZlPbeyNmvPmOyP+JqK/wi6v
	MHBgNZfW7Ly1qe1S6bk9mSJqsxt4K40ksZd+1C73a5B4SXFkYVjMYFUW6Vz5hXZ3DMw7pYFx5XNOs
	PPuRLxT0FjW3PGmgfPHqK1dKU5WKjeS8s3mt2SDTD6Ykzoy7Baf1DgAzdB6P7K8IAPBM=;
Message-ID: <4dccbbc9-0235-5cd5-1670-13bd51fc8b6a@xen.org>
Date: Tue, 2 Nov 2021 15:00:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>
References: <20211029075956.1260-1-roger.pau@citrix.com>
 <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
 <YXz579WNpHe7aO91@Air-de-Roger>
 <3715026d-b8e4-9940-6cfe-0ccf042cd07c@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3715026d-b8e4-9940-6cfe-0ccf042cd07c@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andree,

On 02/11/2021 14:34, Andrew Cooper wrote:
> Same too for
> evtchn, but we've already taken a patch to knobble fifo support.

I know that Amazon submitted a patch to allow disabling FIFO [1]. But 
AFAIK, this is not yet merged because of disagrement (?) on the approach.

Cheers,

[1] https://lore.kernel.org/xen-devel/20201203124159.3688-2-paul@xen.org/

-- 
Julien Grall

