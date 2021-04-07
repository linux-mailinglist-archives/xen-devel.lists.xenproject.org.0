Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209EE356CED
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 15:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106645.203907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU7uP-00080H-Lu; Wed, 07 Apr 2021 13:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106645.203907; Wed, 07 Apr 2021 13:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU7uP-0007zu-Ii; Wed, 07 Apr 2021 13:07:49 +0000
Received: by outflank-mailman (input) for mailman id 106645;
 Wed, 07 Apr 2021 13:07:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lU7uO-0007zp-FE
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 13:07:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lU7uK-0005cF-Ok; Wed, 07 Apr 2021 13:07:44 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lU7uK-0003Hy-GR; Wed, 07 Apr 2021 13:07:44 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ZAIMHSNBDtB7mx8wPjOqBQ/ZCYNszxxcKRfktvek5Vw=; b=C4Pj1kR1bf/Vf7v6K/KcoVY3Cr
	5CAUyKLQZ17dWR2xf6FljJsW+QTz2chZKcn+PbiwhVBpm4dnAg4gMuz+TwF7ND+2LA439DcRy533n
	ZYcud/bf4Cqzw+gPackMbUcRV+2J94vYDWI5cBxW2hqeiN7zvQxYpysTKxbRZbecIGwA=;
Subject: Re: [PATCH 0/3] Use Doxygen and sphinx for html documentation
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fe2480f4-954f-3929-be81-5905917275d1@xen.org>
Date: Wed, 7 Apr 2021 14:07:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210406103603.8530-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 06/04/2021 11:36, Luca Fancellu wrote:
> This serie introduce doxygen in the sphinx html docs generation.
> One benefit is to keep most of the documentation in the source
> files of xen so that it's more maintainable, on the other hand
> there are some limitation of doxygen that must be addressed
> modifying the current codebase (for example doxygen can't parse
> anonymous structure/union).
> 
> To reproduce the documentation xen must be compiled because
> most of the headers are generated on compilation time from
> the makefiles.
> 
> Here follows the steps to generate the sphinx html docs, some
> package may be required on your machine, everything is suggested
> by the autoconf script.
> Here I'm building the arm64 docs (the only introduced for now by
> this serie):
> 
> ./configure
> make -C xen XEN_TARGET_ARCH="arm64" CROSS_COMPILE="aarch64-linux-gnu-" menuconfig
> make -C xen XEN_TARGET_ARCH="arm64" CROSS_COMPILE="aarch64-linux-gnu-"
> make -C docs XEN_TARGET_ARCH="arm64" sphinx-html

I have tried this instruction and got:

make: Entering directory '/home/ANT.AMAZON.COM/jgrall/works/oss/xen/docs'
xen.doxyfile
make: xen.doxyfile: Command not found
Makefile:67: recipe for target 'sphinx-html' failed
make: *** [sphinx-html] Error 127
make: Leaving directory '/home/ANT.AMAZON.COM/jgrall/works/oss/xen/docs'

AFAICT, $DOXYGEN will only get defined when sphinx-build is installed.
When sphinx-build is not installed SPHINXBUILD will be equal to 'no', 
but the Makefile check for emptiness.

Cheers,

-- 
Julien Grall

