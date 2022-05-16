Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909AF5281B4
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 12:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329745.552999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqXpO-0003HW-Ch; Mon, 16 May 2022 10:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329745.552999; Mon, 16 May 2022 10:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqXpO-0003Ek-9d; Mon, 16 May 2022 10:19:50 +0000
Received: by outflank-mailman (input) for mailman id 329745;
 Mon, 16 May 2022 10:19:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqXpM-0003Ee-LZ
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 10:19:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqXpM-0007dE-AA; Mon, 16 May 2022 10:19:48 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.22.38]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqXpM-0006KH-3j; Mon, 16 May 2022 10:19:48 +0000
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
	bh=LW1Uy44cWeC43GMwBsY2AIcFSPQday21mLwPMx971P4=; b=14U9uwp0VPT4Xr/zyn7dy45KO3
	MLg6ID47ewR21xzazCeiE0jOi8YJlE5kb2SHkAJiRgP6ImC1u1eeU0oT48dlqZjC2W0Vb9usfL4P4
	eKalGpz/n0/3qmTPtbd22a7RSBWVzraKh3UD5okur8ST/rKCLjj+DcJUvjIPtbr8+/TI=;
Message-ID: <ed8e9d16-56ea-68ab-8221-d654e15b40a0@xen.org>
Date: Mon, 16 May 2022 11:19:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/2] xen/arm: gnttab: modify macros to evaluate all
 arguments and only once
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20220506094225.181815-1-michal.orzel@arm.com>
 <20220506094225.181815-3-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220506094225.181815-3-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 06/05/2022 10:42, Michal Orzel wrote:
> Modify macros to evaluate all the arguments and make sure the arguments
> are evaluated only once. Introduce following intermediate macros:
> gnttab_status_gfn_, gnttab_shared_gfn_ that do not take domain as a
> parameter. These are to be used locally and allow us to avoid passing
> NULL from gnttab_get_frame_gfn to the respective macros (without _ suffix).
> Make use of a domain parameter from gnttab_shared_gfn and gnttab_status_gfn
> by adding an ASSERT.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Most of the helpers below are going to disappear with Oleksandr latest 
work (see [1]).

Looking at Oleksandr's patch, I think only gnttab_set_frame_gfn() would 
end up to use one of the macro parameters twice. So I would like to 
suggest to chat with Oleksandr if we can tweak his patch (can be done on 
commit) or we rebase this patch on top of his work.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/1652294845-13980-1-git-send-email-olekstysh@gmail.com/

-- 
Julien Grall

