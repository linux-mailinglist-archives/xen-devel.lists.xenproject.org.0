Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C18520438
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 20:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324714.546878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no7qW-0002vi-KI; Mon, 09 May 2022 18:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324714.546878; Mon, 09 May 2022 18:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no7qW-0002u8-Fx; Mon, 09 May 2022 18:11:00 +0000
Received: by outflank-mailman (input) for mailman id 324714;
 Mon, 09 May 2022 18:10:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1no7qU-0002u2-Sk
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 18:10:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no7qU-0002w9-FL; Mon, 09 May 2022 18:10:58 +0000
Received: from [54.239.6.187] (helo=[192.168.22.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no7qU-0004YM-8v; Mon, 09 May 2022 18:10:58 +0000
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
	bh=hOKnFSgeeaBsBQW9p5fEs6SznPvPnPosq2qduJAVSKg=; b=rBP+K7RXuxn/cUFqfdQBmdxHcy
	D6mCLZCvhGdlsjAUztjT8DzRWr9gZB9raIX5wqbG8wcdk4qUvBO1/ukynrA6RTeRvSLLw7OnRde/O
	QIXo8p4wJtQH8eT/4UZQmcMFwq029wCfXxbuiXxAlW2WHShiUa5zX2CxKcMwFZnbgXbU=;
Message-ID: <ca568f1c-f4ce-303c-6e20-d902602e2f53@xen.org>
Date: Mon, 9 May 2022 19:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] docs: Fix SUPPORT matrix generation after a5968a553f6a
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220509080707.50926-1-julien@xen.org>
 <A57E9481-97D6-451D-BB5F-DA36B36F9320@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <A57E9481-97D6-451D-BB5F-DA36B36F9320@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/05/2022 09:42, George Dunlap wrote:
> 
> 
>> On May 9, 2022, at 9:07 AM, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit a5968a553f6a "SUPPORT.MD: Correct the amount of physical memory
>> supported for Arm" added a support statement split over two lines.
>>
>> Unfortunately, docs/support-matrix-generate throw an error for it:
>>
>>     Generating support matrix (origin/stable-NN )
>>     + docs/support-matrix-generate HEAD https://xenbits.xen.org/docs/unstable/SUPPORT.html origin/stable-NN https://xenbits.xen.org/docs/NN-testing/SUPPORT.html
>>     Status, x86: Supported up to 8 TiB. Hosts with more memory are
>>                  supported, but not security supported.
>>     Status, Arm32: Supported up to 12 GiB
>>     Status, Arm64: Supported up to 2 TiB
>>     ^ cannot parse status codeblock line:
>>                  supported, but not security supported.
>>      ? at docs/parse-support-md line 172, <F> chunk 1.
>>
>> It would be good to allow split support statement (to keep lines below
>> 80 characters) but my knowledge of the script is very limited.
>>
>> Therefore, workaround the error by describing the support statement
>> in one long line.
>>
>> Fixes: a5968a553f6a "SUPPORT.MD: Correct the amount of physical memory supported for Arm"
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Acked-by: George Dunlap <george.dunlap@citrix.com>

Thanks! I have committed it.

Cheers,

-- 
Julien Grall

