Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74731467980
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 15:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237731.412319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt9dp-0006HR-IS; Fri, 03 Dec 2021 14:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237731.412319; Fri, 03 Dec 2021 14:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt9dp-0006FN-FH; Fri, 03 Dec 2021 14:34:25 +0000
Received: by outflank-mailman (input) for mailman id 237731;
 Fri, 03 Dec 2021 14:34:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mt9do-0006FF-6W
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 14:34:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mt9dm-0006N9-0n; Fri, 03 Dec 2021 14:34:22 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.21.218]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mt9dl-0008OS-QI; Fri, 03 Dec 2021 14:34:21 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=eRvzrfBk6CIpwOvSbfQcW4y46M5tUBQDWJUOBJotQMc=; b=gwwChUyy84EIEreTddi4wNrxpB
	zrBGCToL20eMfoS/94JzM2H4dYQyvqZKNJ4CBAp3LZVDsiWEYC/Z/bj4/U8zw5shH0uhkrzIitud+
	2GaK8B92la8YB45W+1LpXntA95RW9otXcOJLzPseJ4XgojRCS+YDFYqaBqd3R1M6TMPQ=;
Message-ID: <eae1afb7-e101-c833-3ad9-7f3b8015cc3b@xen.org>
Date: Fri, 3 Dec 2021 14:34:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: xen: linker symbol mess, and freeing errors
To: Andrew Cooper <amc96@srcf.net>, xen-devel
 <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <115c178b-f0a7-cf6e-3e33-e6aa49b17baf@srcf.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <115c178b-f0a7-cf6e-3e33-e6aa49b17baf@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/12/2021 13:34, Andrew Cooper wrote:
> Hello,

Hi,

> On ARM, the embedded dtb support wants a rethink, because it was placed
> after BSS, rendering any space-saving null and void in the compiled (and
> loaded) image. 

While I understand the compiled/loaded image are going to be bigger, I 
think this is correctly place it is going to be relocated by Xen during 
the boot process. So I don't think it should be placed in the middle of 
Xen binary.

Furthermore, IHMO, this is a legacy/development feature because one 
should really use the DT provided by the firmware.

So I am not convinced this is worth to spend time re-ordering things 
around (and potentially breaking more stuff).

> There is also nothing which checks the BSS is correctly
> aligned for the zeroing loops (which I do have fix for).

AFAICT, the worse things that could happen is Xen will crash at boot 
when zeroing which is easily noticeable and reliable. That said,
it would be good to make it a compiler error to save time.

Cheers,

-- 
Julien Grall

