Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CEE32970A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 09:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92184.173937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH0mq-0000O4-TX; Tue, 02 Mar 2021 08:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92184.173937; Tue, 02 Mar 2021 08:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH0mq-0000Nf-QQ; Tue, 02 Mar 2021 08:53:48 +0000
Received: by outflank-mailman (input) for mailman id 92184;
 Tue, 02 Mar 2021 08:53:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lH0mp-0000NK-DM
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 08:53:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a212ef9-bd53-4814-9d15-b312a3845a3b;
 Tue, 02 Mar 2021 08:53:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48F3BABF4;
 Tue,  2 Mar 2021 08:53:45 +0000 (UTC)
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
X-Inumbo-ID: 0a212ef9-bd53-4814-9d15-b312a3845a3b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614675225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/FO/OM0qLgcrTjbuqRcnANmHmXtqLBI8kYRJad7qdLo=;
	b=n2oJ0uYfPolJcLE+d2E3GtDUreQ87rD3/TUT0aKWiRpzr3CmeS9t9rB74Ukuzgu2tpZEOi
	zaIBwrs1W9fsdfeetQu1gUNC0lMUcFskRimdOcI2biN4FT9INYn5Toc8D1F6Jh3yVMPfo1
	ih7aSIRX3tg5EKJzYybWckxHiuK+Rvw=
Subject: Re: [PATCH for-4.15] automation/alpine: add g++ to the list of build
 depends
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson
 <iwj@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210301095806.68518-1-roger.pau@citrix.com>
 <a1d8e537-af33-3ef8-412a-6422fb4cf4ea@citrix.com>
 <27ec9db0-69bc-df9a-8511-109f57972046@citrix.com>
 <YD3z9LNpzbOfqmpu@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3912fde-165c-b404-bf1c-46189d0ce766@suse.com>
Date: Tue, 2 Mar 2021 09:53:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YD3z9LNpzbOfqmpu@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.03.2021 09:14, Roger Pau Monné wrote:
> On Mon, Mar 01, 2021 at 06:01:36PM +0000, Andrew Cooper wrote:
>> On 01/03/2021 17:59, Andrew Cooper wrote:
>>> On 01/03/2021 09:58, Roger Pau Monne wrote:
>>>> clang++ relies on the C++ headers installed by g++, or else a clang
>>>> build will hit the following error:
>>>>
>>>> <built-in>:3:10: fatal error: 'cstring' file not found
>>>> #include "cstring"
>>>>          ^~~~~~~~~
>>>> 1 error generated.
>>>> make[10]: *** [Makefile:120: headers++.chk] Error 1
>>>>
>>>> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> ---
>>>> Cc: Ian Jackson <iwj@xenproject.org>
>>>> No real risk here from a release PoV, it's just pulling a package
>>>> required for the Alpine clang build. Worse that cold happen is that
>>>> the Alpine clang build broke, but it's already broken.
>>> Shouldn't this be fixed upstream in Alpine?  Its clearly a packaging bug.
>>
>> Or (thinking about it), we've got a build system bug using g++ when it
>> should be using clang++.
> 
> No, the check is using clang++, the issue is that clang++ doesn't
> install the standard c++ headers, and thus trying to use them (cstring
> in this case) fails. Installing the g++ package solves the issue
> because it installs the headers.

I have to admit that I consider this odd. The g++ package should
neither provide nor depend on the headers. It may recommend their
installation. On my distro (SLES) the headers come from the
libstdc++-devel package, as I would have expected. There
additionally is a dependency of libclang5 (no -devel suffix!) on
libstdc++-devel (I suppose this is an indication that things
aren't quite right here either; I haven't checked an up-to-date
version of the distro yet, though).

Jan

