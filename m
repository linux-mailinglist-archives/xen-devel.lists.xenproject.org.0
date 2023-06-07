Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000C1725C0E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 12:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544704.850669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qlY-0002Gw-M8; Wed, 07 Jun 2023 10:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544704.850669; Wed, 07 Jun 2023 10:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qlY-0002EF-IT; Wed, 07 Jun 2023 10:51:48 +0000
Received: by outflank-mailman (input) for mailman id 544704;
 Wed, 07 Jun 2023 10:51:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6qlX-0002E6-9i
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 10:51:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6qlW-0000rl-Ma; Wed, 07 Jun 2023 10:51:46 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.13.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6qlW-0004vy-Fp; Wed, 07 Jun 2023 10:51:46 +0000
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
	bh=bWBQDB6tVxgs+Sxlp6SBaFcE+cI7z8rDEM9UPFrBAm0=; b=18pnDcoxV+FPYrpe+FFMu8AM+N
	Fgy7ksgkYYk53DQWPxDrjRIBTlMeZE1uTTVBIKx5lJ4f7srnS23lLrbb3/c3wMv3cuH8Aj3AK9qMF
	Lv0PkopbrnEGdFziDO1JhqSk7sIsN/ZX9M+yDY84SVWhYcgq3xxNv98p/04+uGpOrN48=;
Message-ID: <ce795a87-0fd1-6d01-ec71-f81a763762eb@xen.org>
Date: Wed, 7 Jun 2023 11:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v6 12/14] tools/xenstore: use generic accounting for
 remaining quotas
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530082424.32126-1-jgross@suse.com>
 <20230530082424.32126-13-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530082424.32126-13-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:24, Juergen Gross wrote:
> The maxrequests, node size, number of node permissions, and path length
> quota are a little bit special, as they are either active in
> transactions only (maxrequests), or they are just per item instead of
> count values. Nevertheless being able to know the maximum number of
> those quota related values per domain would be beneficial, so add them
> to the generic accounting.
> 
> The per domain value will never show current numbers other than zero,
> but the maximum number seen can be gathered the same way as the number
> of nodes during a transaction.
> 
> To be able to use the const qualifier for a new function switch
> domain_is_unprivileged() to take a const pointer, too.
> 
> For printing the quota/max values, adapt the print format string to
> the longest quota name (now 17 characters long).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

