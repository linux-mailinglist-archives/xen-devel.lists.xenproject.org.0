Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8770174788E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 21:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558640.872937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGlOR-0005q7-0i; Tue, 04 Jul 2023 19:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558640.872937; Tue, 04 Jul 2023 19:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGlOQ-0005o0-U1; Tue, 04 Jul 2023 19:08:54 +0000
Received: by outflank-mailman (input) for mailman id 558640;
 Tue, 04 Jul 2023 19:08:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGlOO-0005nt-UA
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 19:08:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGlOO-0008TC-J7; Tue, 04 Jul 2023 19:08:52 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGlOO-0001J8-Cd; Tue, 04 Jul 2023 19:08:52 +0000
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
	bh=NTvo+K6TduOWV9YLgixUkb08O76KTZtshY5sqLOTJmE=; b=WxOnRYNJO+YpJNW01wSTSaVTqk
	Fyk/K6sL15UFYTDpcrf10sRTX4WWDMaYtr1D0Q0tWeYsyCr7s/snHFSxEsKBj0er5Go3sf3Kwq9xY
	GXMjDlJhZA/WDP1KvZd5TWPqqGoQI/o+0qYt5Drdt+s2yzQjHdrf/4higclALXyDmkBI=;
Message-ID: <979f0580-1217-deb4-f2ba-0d7e3b015a25@xen.org>
Date: Tue, 4 Jul 2023 20:08:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 0/7] xen/arm: Add some missing ISBs after updating the
 PTEs
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, michal.orzel@amd.com, Henry.Wang@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230619170115.81398-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230619170115.81398-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/06/2023 18:01, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> The main goal of this series is to add some missing ISBs after update
> the PTEs.
> 
> The last patch is re-ingesting a patch that was reverted
> due to a boot failure on the Arndale. This has now been fixed by patch
> #2.
> 
> Cheers,
> 
> Julien Grall (7):
>    xen/arm32: head: Add missing isb in setup_fixmap()
>    xen/arm32: head: Add mising isb in switch_to_runtime_mapping()
>    xen/arm64: head: Add missing isb in setup_fixmap()
>    xen/arm: page: Consolidate write_pte() and clarify the documentation
>    xen/arm: pmap: Add missing ISB in arch_pmap_map()
>    xen/arm: mm: Add missing ISB in xen_pt_update()

I have committed the first 6 patches.

>    xen/arm32: head: Widen the use of the temporary mapping

This patch has non trivial clash with the USBAN series which has been 
recently committed. So I will send a new version.

Cheers,

-- 
Julien Grall

