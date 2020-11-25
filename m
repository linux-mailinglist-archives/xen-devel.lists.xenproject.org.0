Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A22C3F77
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 13:00:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37628.70092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khtT2-0006Gv-KV; Wed, 25 Nov 2020 12:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37628.70092; Wed, 25 Nov 2020 12:00:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khtT2-0006GZ-HH; Wed, 25 Nov 2020 12:00:12 +0000
Received: by outflank-mailman (input) for mailman id 37628;
 Wed, 25 Nov 2020 12:00:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1khtT1-0006GO-2s
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:00:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khtSy-00062C-QA; Wed, 25 Nov 2020 12:00:08 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khtSy-0002Ck-Ia; Wed, 25 Nov 2020 12:00:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khtT1-0006GO-2s
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=DY/vjFFbJ1KS+p1DZR/X4EeyTXxWNEKcF+8YdkY1NE8=; b=JTCeJx0L2EiS//O1Nwts3yTz5i
	4s2KwW50O4YZq1HbeukKMu8qZSJVToIoQYPwG+lk8awf+my3S+Hqf7OGf+qEye+c9dvtBEMF/sPSm
	XgmZnuQva28DZxegYsWOCnqLDUfyDXZV1H1sC2vByV6O7pLiumEhGCb4E6GQmvc4iY0k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khtSy-00062C-QA; Wed, 25 Nov 2020 12:00:08 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khtSy-0002Ck-Ia; Wed, 25 Nov 2020 12:00:08 +0000
Subject: Re: [PATCH v2 01/17] mm: check for truncation in vmalloc_type()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
 <5adb0089-ef9b-cfe2-db0d-7142eccc914f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8669e32e-fd23-1425-a9c5-7837a6d63ad6@xen.org>
Date: Wed, 25 Nov 2020 12:00:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5adb0089-ef9b-cfe2-db0d-7142eccc914f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 23/11/2020 14:23, Jan Beulich wrote:
> While it's currently implied from the checking xmalloc_array() does,
> let's make this more explicit in the function itself. As a result both
> involved local variables don't need to have size_t type anymore. This
> brings them in line with the rest of the code in this file.
> 
> Requested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

