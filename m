Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DC47E7F4B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 18:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630731.983870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Vfn-0005vB-0J; Fri, 10 Nov 2023 17:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630731.983870; Fri, 10 Nov 2023 17:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Vfm-0005sV-Tx; Fri, 10 Nov 2023 17:52:02 +0000
Received: by outflank-mailman (input) for mailman id 630731;
 Fri, 10 Nov 2023 17:52:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r1Vfl-0005sP-TM
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 17:52:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1Vfk-0005Rq-4Q; Fri, 10 Nov 2023 17:52:00 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.148.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1Vfj-00055Z-Su; Fri, 10 Nov 2023 17:52:00 +0000
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
	bh=m1gXPrPvm3abV11bhMe1c0pV7Yz/P4ApuiuTzy3eCZs=; b=Sz8K5NaHRF3xmbPFUnnpk48j9R
	1mIN2SgXTzzGnsKZ2qjlbBsbOxWdv4Xr7HcDLpWFp+fhsg9rhXb1LWmoSjG5uhjy5G/PSWizPx4QR
	ox0kpsBgYkwWHmwPyp11+Tiz2NcQf8mmObfeDAiWBXbuqGkQdcrZ4veyNoo28sHj9w3I=;
Message-ID: <d132e578-398f-42e4-bb0c-7a52cf11c226@xen.org>
Date: Fri, 10 Nov 2023 17:51:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/29] tools/xenstored: rework ring page (un)map
 functions
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-24-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231110160804.29021-24-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/11/2023 16:07, Juergen Gross wrote:
> When [un]mapping the ring page of a Xenstore client, different actions
> are required for "normal" guests and dom0. Today this distinction is
> made at call site.
> 
> Move this distinction into [un]map_interface() instead, avoiding code
> duplication and preparing special handling for [un]mapping the stub
> domain's ring page.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

