Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06237327A33
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 09:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91364.172681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGeOC-0004Fw-05; Mon, 01 Mar 2021 08:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91364.172681; Mon, 01 Mar 2021 08:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGeOB-0004FX-Sj; Mon, 01 Mar 2021 08:58:51 +0000
Received: by outflank-mailman (input) for mailman id 91364;
 Mon, 01 Mar 2021 08:58:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGeOA-0004FS-P7
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 08:58:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75b847a2-e877-47b2-80bf-d380ccc5da0b;
 Mon, 01 Mar 2021 08:58:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D96AEAAC5;
 Mon,  1 Mar 2021 08:58:48 +0000 (UTC)
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
X-Inumbo-ID: 75b847a2-e877-47b2-80bf-d380ccc5da0b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614589129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VW7aTzKJMG/9lvuNGTCk2tHEC7RSmdSWyonB2EQUG94=;
	b=tyRifih9k6578QYGqPhZDyzNphR6jv667CeJxoIWc8ylzOdYH8no73q+W9/wygWZM0QNll
	m3KzlktGVukzL7bAcZTU1oYOnXE4pBNNqOauo5DT7PPxH2lYM320JIR3P79qZJfNs6Wtve
	DQgPF1ieXDvNc11Mgsj9DtnySy/Pxj0=
Subject: Re: [PATCH for-4.15] automation: Fix the Alpine clang builds to use
 clang
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <iwj@xenproject.org>,
 roger.pau@citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210226110233.27991-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.21.2102261446490.3234@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c08d68a5-3c32-c6f4-dcc4-6fac29795b27@suse.com>
Date: Mon, 1 Mar 2021 09:58:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102261446490.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.02.2021 23:48, Stefano Stabellini wrote:
> On Fri, 26 Feb 2021, Andrew Cooper wrote:
>> Looks like a copy&paste error.
>>
>> Fixes: f6e1d8515d7 ("automation: add alpine linux x86 build jobs")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Thanks for the patch and of course it is correct
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
> However unfortunately it breaks the Alpine Linux gitlab-ci again :-(
> I created a branch with Roger's patches plus this patch. The two clang
> Alpine Linux build jobs fail:
> 
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/1059686530
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/1059686532
> 
> 
> The error is the following:
> 
> <built-in>:3:10: fatal error: 'cstring' file not found
> #include "cstring"
>          ^~~~~~~~~
> 1 error generated.
> make[10]: *** [Makefile:120: headers++.chk] Error 1
> make[10]: *** Waiting for unfinished jobs....

Doesn't this suggest there's a C++ compiler installed without
the headers also being available? The headers++.chk rule
requires neither or both to be present.

Jan

