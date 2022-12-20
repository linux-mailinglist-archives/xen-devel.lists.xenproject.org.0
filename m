Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6218E6526C5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 20:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467275.726321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7hzB-0005K4-Vb; Tue, 20 Dec 2022 19:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467275.726321; Tue, 20 Dec 2022 19:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7hzB-0005Hs-SY; Tue, 20 Dec 2022 19:09:09 +0000
Received: by outflank-mailman (input) for mailman id 467275;
 Tue, 20 Dec 2022 19:09:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7hzA-0005Hm-Mw
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 19:09:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7hzA-0001eF-0N; Tue, 20 Dec 2022 19:09:08 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7hz9-0005YR-Q7; Tue, 20 Dec 2022 19:09:07 +0000
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
	bh=ikObQ+vHbMBiiMynjLBbqcr7yrHmLjFKWwfTuYbv8oE=; b=edq1iglePr0KDPdCBcOkQlh2zt
	kXqMt7S0XmRdeF2LP68XEorlN0xCoU7NfxbB4WGprpdrss3xJPJRadmSfyURT3Jh4DOLrldlH00Sb
	IwKPXEsfGzn6UwuFmh+HBjpwWv046eZ/qRxdwzFKWCL3d1/kHaGY5JHabe5YPOpyWI1k=;
Message-ID: <06a3f6f9-db66-9523-cee4-fc5986c48841@xen.org>
Date: Tue, 20 Dec 2022 19:09:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 06/19] tools/xenstore: add hashlist for finding struct
 domain by domid
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-7-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221213160045.28170-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 13/12/2022 16:00, Juergen Gross wrote:
> Today finding a struct domain by its domain id requires to scan the
> list of domains until finding the correct domid.
> 
> Add a hashlist for being able to speed this up. This allows to remove
> the linking of struct domain in a list. Note that the list of changed
> domains per transaction is kept as a list, as there are no known use
> cases with more than 4 domains being touched in a single transaction
> (this would be a device handled by a driver domain and being assigned
> to a HVM domain with device model in a stubdom, plus the control
> domain).
> 
> Some simple performance tests comparing the scanning and hashlist have
> shown that the hashlist will win as soon as more than 6 entries need
> to be scanned.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

