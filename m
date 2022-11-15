Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588F962AEB4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 23:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444072.698875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov4rK-00069Q-KY; Tue, 15 Nov 2022 22:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444072.698875; Tue, 15 Nov 2022 22:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov4rK-00066V-H4; Tue, 15 Nov 2022 22:56:50 +0000
Received: by outflank-mailman (input) for mailman id 444072;
 Tue, 15 Nov 2022 22:56:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ov4rI-00066P-Vf
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 22:56:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ov4rI-0001Fh-F3; Tue, 15 Nov 2022 22:56:48 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ov4rI-0005Aa-74; Tue, 15 Nov 2022 22:56:48 +0000
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
	bh=fq4nNfBNqxj8n04a0kntCAL9h5BKL/74tHeb8x8CfeM=; b=ekgyROhEeXhyBDyEacmDBPWGIe
	y/+y7Yrfj+F2f+GQAp1/CrgroPiqq4P6j8QbjmaR5ufKX/+yx0LDT2Ka/+VDc+PXVsZxVelUbUE8c
	wN6DaqRCYlI3+4dXGugnlW8RWwC5vm4k7pGF+j4gsR6yL+x0D2hRa2Md2DpQg1wIiGwY=;
Message-ID: <a1fef484-3b1d-cb1d-3182-3e8e957cd0de@xen.org>
Date: Tue, 15 Nov 2022 22:56:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] xen/notifier: simplify using notifier_[to|from]_errno()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20221028114111.8150-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221028114111.8150-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 28/10/2022 12:41, Juergen Gross wrote:
> Today all users of notifier_from_errno() and notifier_to_errno() are
> Handling the success case the same way, by using
> 
>    !rc ? NOTIFY_DONE : notifier_from_errno(rc)
> 
> or
> 
>    (notifier_rc == NOTIFY_DONE) ? 0 : notifier_to_errno(notifier_rc);
> 
> Simplify the use cases by moving the handling of the success case into
> the functions.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

