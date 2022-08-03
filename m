Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7B9588BD0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379869.613715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDDG-0006jG-Ma; Wed, 03 Aug 2022 12:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379869.613715; Wed, 03 Aug 2022 12:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDDG-0006gv-K4; Wed, 03 Aug 2022 12:10:58 +0000
Received: by outflank-mailman (input) for mailman id 379869;
 Wed, 03 Aug 2022 12:10:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJDDF-0006gp-Hi
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 12:10:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJDDB-0007mk-UA; Wed, 03 Aug 2022 12:10:53 +0000
Received: from [54.239.6.189] (helo=[10.7.237.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJDDB-0001iF-NN; Wed, 03 Aug 2022 12:10:53 +0000
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
	bh=4Unut49enX8bxfMPg6t0yab8a9KB7r7R6tqk4tTVrBQ=; b=14YDOqmP0Z3Z5buqg3uX5b3eDh
	4vTCbxGnaNOt2aNKe2I6U30HBxIdn4+Y/5ejJgRffcXiUQ97b9/GTWWz95HxkkrrJytWTWF4mC9xz
	9DbUIvNqVY9ytPZdCMkMg28FE1BAi1tQQr/CVM6f2l+CysVngjX5aI4t0qhwzJ1y9B/0=;
Message-ID: <07858193-47b0-f1a5-6bdc-4cac4dbe2ed7@xen.org>
Date: Wed, 3 Aug 2022 13:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v2] tools: use $(PYTHON) to call cppcheck tools
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <708f00303d1c370622707866d41a868425a17324.1659527529.git.bertrand.marquis@arm.com>
 <dd4a5616-5c1f-51f2-0bce-3679432dcd58@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dd4a5616-5c1f-51f2-0bce-3679432dcd58@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/08/2022 13:05, Jan Beulich wrote:
> On 03.08.2022 13:57, Bertrand Marquis wrote:
>> When calling python tools to convert misra documentation or merge
>> cppcheck xml files, use $(PYTHON).
>> While there fix misra document conversion script to be executable.
>>
>> Fixes: 57caa53753 (xen: Add MISRA support to cppcheck make rule)
>> Fixes: 43aa3f6e72 xen/build: Add cppcheck and cppcheck-html make rules
> 
> Nit: These two titles would want expressing consistently. If I
> end up committing this, I'll try to remember to adjust.

There are actually a few issues with the Fixes tags. From the doc [1] :
   - the sha1 should be 12 characters (rather than 10)
   - the format should be:
       Fixes: <comidid> ("Commit title")

Cheers,

[1] docs/process/sending-patches.pandoc

-- 
Julien Grall

