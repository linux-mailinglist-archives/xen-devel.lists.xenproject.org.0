Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F25E30886C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 12:44:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78047.141795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SBo-0008Di-DY; Fri, 29 Jan 2021 11:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78047.141795; Fri, 29 Jan 2021 11:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SBo-0008DJ-AK; Fri, 29 Jan 2021 11:43:48 +0000
Received: by outflank-mailman (input) for mailman id 78047;
 Fri, 29 Jan 2021 11:43:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5SBn-0008DE-3g
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:43:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5SBl-0004f2-Ac; Fri, 29 Jan 2021 11:43:45 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5SBl-0008EB-3Z; Fri, 29 Jan 2021 11:43:45 +0000
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
	bh=H+90xG6OaeGaCNyQB3hSXqCGQb3jd2AEJDAagJo2Su0=; b=ehCRTI7nyDKDmv/vO60Jr31iLp
	q8kY6uK5Q8CbQAYYwuDQmnP4BIQiiFId3pNkQYlFIXXSMip88k6L79ngWifTgrI9ACnwV0vTuuD8S
	Rpmnft09cK5B31tQXOBGIBb6Ipu40NPXo+OKnaaG7Qq8tn553+OrmJ26qcl2NU2U1xJY=;
Subject: Re: [PATCH] xen/memory: Reject out-of-range resource 'frame' values
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20210128160616.17608-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5c738446-b279-419b-cb81-ac42873ad740@xen.org>
Date: Fri, 29 Jan 2021 11:43:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128160616.17608-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 28/01/2021 16:06, Andrew Cooper wrote:
> The ABI is unfortunate, and frame being 64 bits leads to all kinds of problems
> performing correct overflow checks.
> 
> Furthermore, the mixed use of unsigned int and unsigned long in the call tree
> is buggy on arm32 where the two are the same size, and certain out-of-range
> combinations will truncated and be permitted.

set_foreign_p2m_entry() always return -EOPNOTSUPP, so I think this would 
not need a backport if the issue is Arm only.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

