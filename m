Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B2C4E2749
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 14:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292989.497621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWHq7-0001VU-FB; Mon, 21 Mar 2022 13:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292989.497621; Mon, 21 Mar 2022 13:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWHq7-0001Se-Bh; Mon, 21 Mar 2022 13:12:51 +0000
Received: by outflank-mailman (input) for mailman id 292989;
 Mon, 21 Mar 2022 13:12:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWHq5-0001SY-Qn
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 13:12:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWHq4-0007Hf-Ox; Mon, 21 Mar 2022 13:12:48 +0000
Received: from [54.239.6.185] (helo=[192.168.25.135])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWHq4-00022R-J3; Mon, 21 Mar 2022 13:12:48 +0000
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
	bh=G52NjuOokmzxQanTNHKDpwNGo/eqNJPL/jz/AqVX/N4=; b=xUpIY03iss7DqFrx5i2iYpMJcW
	ngPy2InQfR3Q5k4ow+LvCRQmGg21O6+Pejdw1dvf1EPA5ijI/7RihBdlkIUOkC88hPcEbjIl3KL6L
	BE54uA7pwO3xromNKiD6GUCfgASbLlOSTuDx6rHdmlkCIy+8X57rh1GHaj3p8y2JwdUo=;
Message-ID: <86794137-4409-cd1d-b1c9-a01b37b0c02f@xen.org>
Date: Mon, 21 Mar 2022 13:12:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/build: work around older GNU ld not leaving .got.plt
 empty
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <057172d5-437a-347b-b5bb-d102b6b37f0a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <057172d5-437a-347b-b5bb-d102b6b37f0a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 21/03/2022 11:46, Jan Beulich wrote:
> The initial three entries in .got.plt are "static", i.e. present
> independent of actual entries allocation of which is triggered by
> respective relocations. When no real entries are needed, halfway recent
> ld discards the "static" portion of the table as well, but older GNU ld
> fails to do so.
> 
> Fixes: dedb0aa42c6d ("x86/build: use --orphan-handling linker option if available")
> Reported-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Thanks for the patch. I applied the patch and can confirm the build 
issue is gone.

Tested-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

