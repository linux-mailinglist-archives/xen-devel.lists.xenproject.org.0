Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA23337EE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 09:56:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95910.181102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJucO-0000aE-P6; Wed, 10 Mar 2021 08:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95910.181102; Wed, 10 Mar 2021 08:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJucO-0000Zp-Ln; Wed, 10 Mar 2021 08:55:00 +0000
Received: by outflank-mailman (input) for mailman id 95910;
 Wed, 10 Mar 2021 08:54:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W5NQ=II=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJucN-0000Zk-N7
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 08:54:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05d5a3d3-fe23-40cf-993b-8a7b725c8e73;
 Wed, 10 Mar 2021 08:54:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1160AD74;
 Wed, 10 Mar 2021 08:54:57 +0000 (UTC)
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
X-Inumbo-ID: 05d5a3d3-fe23-40cf-993b-8a7b725c8e73
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615366498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0LTtDPgjAu1AKLTSf2rfs4Wlipb/s589qLDfrqxtEA=;
	b=ZdbGwPNeXOhQzuDyCEwvAqIUAfVrmxlTcC4OaVRBrPfXP2DAljHTkdROjaUqRxK1HxFaUr
	NvHin0MKnKtZbZ2zve5mHHXiB3G3xaWN/BVDGPznHnxL+70Yy9Ua3cZsxUMHKs5ctPP+Ph
	36sO3LSTJ4wlC/j9EE4jtmkp59obH9Y=
Subject: Re: [PATCH for-4.15] arm: replace typeof() with __typeof__()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Elliott Mitchell <ehem+xen@m5p.com>
References: <202103092114.129LEgZp059925@m5p.com>
 <eaef1b6d-db89-945a-e8be-2b3f9145780c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e8c826f7-8bf5-fb5d-c1ec-97d8ba1d79d0@suse.com>
Date: Wed, 10 Mar 2021 09:54:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <eaef1b6d-db89-945a-e8be-2b3f9145780c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.03.2021 22:27, Andrew Cooper wrote:
> On 08/03/2021 13:36, Elliott Mitchell wrote:
>> typeof() is available in Xen's build environment, which uses Xen's
>> compiler.  As these headers are public, they need strict standards
>> conformance.  Only __typeof__() is officially standardized.
>>
>> A compiler in standards conformance mode should report:
>>
>> warning: implicit declaration of function 'typeof' is invalid in C99
>> [-Wimplicit-function-declaration]
>>
>> (this has been observed with FreeBSD's kernel build environment)
>>
>> Based-on-patch-by: Julien Grall <julien@xen.org>, Sun Oct 4 20:33:04 2015 +0100
>> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> 
> s!arm!xen/public! in the subject seeing as two thirds of the
> modifications are in non-ARM headers.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> This wants backporting as a build fix, so should be considered for 4.15
> at this point.
> 
> I wonder why our header checks don't pick this up.  Do we need to throw
> a -pedantic around?

That's a long-standing issue with the checking: For issues to be
found in macros, the macros would actually need to be used.

Jan

