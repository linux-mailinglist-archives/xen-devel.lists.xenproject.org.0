Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851635B19B4
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 12:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403055.645019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWEWD-0007FH-Ih; Thu, 08 Sep 2022 10:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403055.645019; Thu, 08 Sep 2022 10:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWEWD-0007Co-G3; Thu, 08 Sep 2022 10:12:21 +0000
Received: by outflank-mailman (input) for mailman id 403055;
 Thu, 08 Sep 2022 10:12:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWEWC-0007CS-Lw
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 10:12:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWEWC-0004T7-7u; Thu, 08 Sep 2022 10:12:20 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.18.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWEWC-0001Qj-12; Thu, 08 Sep 2022 10:12:20 +0000
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
	bh=jfY3c+BScsYCDnTHX+QvmSNT2wm5sthPxky+CvivK1A=; b=oVXrll4dEpkOWWZIz2sWdptxVn
	p5TyHzPyQv56fqcK/hyuESuuxlbAgu/qGtOQEZ4bu1B2M/iySpHhNxuzYg3UZ7CN5C/vAQ1yH9VAC
	CKz8MBd6lk8lyq7IrgJkSG/v5TcDRoacihhUuHLfrl7/sBfZsKYaznQs7f2RekKnB/tE=;
Message-ID: <168bd423-aa3a-ead6-4a00-0f540ae3c15f@xen.org>
Date: Thu, 8 Sep 2022 11:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v5] tools/xenstore: add migration stream extensions for
 new features
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220908081552.19889-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220908081552.19889-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 08/09/2022 09:15, Juergen Gross wrote:
> Extend the definition of the Xenstore migration stream to cover new
> features:
> 
> - per domain features
> - extended watches (watch depth)
> - per domain quota
> 
> Some of those additions (per domain features and extended watches)
> require bumping the migration stream version to "2", as usage of those
> features will require to transport mandatory new information in the
> migration stream.
> 
> One note regarding the GLOBAL_QUOTA_DATA record: the split of quota
> between global and per-domain ones is meant to support the possibility
> to pass on unknown quota settings for newly created domains to other
> Xenstore instances:
> 
> Imagine Xenstore A knows about global quota g and domain quota d, while
> Xenstore B doesn't know both. Initially I'm running Xenstore A on a
> host, then I'm live-updating to B.
> 
> B gets the information that g is global, and d is per-domain, but has
> no other idea what to do with the values of g and d. OTOH it knows that
> each new domain should get d with the related value, so it can set d
> for each newly created domain.
> 
> When B is either downgraded to A again, or a domain is migrated to
> another host running A, B can add the quota information of d for all
> domains.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

