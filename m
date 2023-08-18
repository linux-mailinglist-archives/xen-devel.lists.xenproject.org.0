Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 197E9780AC1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 13:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586061.917277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxKT-0003IB-4T; Fri, 18 Aug 2023 11:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586061.917277; Fri, 18 Aug 2023 11:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxKT-0003Fb-1G; Fri, 18 Aug 2023 11:07:45 +0000
Received: by outflank-mailman (input) for mailman id 586061;
 Fri, 18 Aug 2023 11:07:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWxKS-0003FT-8o
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 11:07:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxKR-00072S-JS; Fri, 18 Aug 2023 11:07:43 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxKR-0003Pk-Es; Fri, 18 Aug 2023 11:07:43 +0000
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
	bh=vMH90Q573Ym0I5ZAyCxYh9Zx5afbmsJTVO52Yzq3TDo=; b=sVc4tzdtjjyuY/ZUZnHUmnHah7
	rQGZs4be1hgKDLnOM3gncYqWHVmgauEcLHqJ7WeJGRe9wNHWVVdh9KhouJH6yjEZkkoQJUQwEQWBX
	iany334jqHhbr5z8iKamaPvIUmROb2MW1y0CWSPQ2ukM7H1I4EUN0lMYwaV+/nzNhsT4=;
Message-ID: <9d7bbb02-3fa5-40b0-a795-05389e9a4a77@xen.org>
Date: Fri, 18 Aug 2023 12:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/19] tools/xenstore: merge get_spec_node() into
 get_node_canonicalized()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-15-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814074707.27696-15-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/08/2023 08:47, Juergen Gross wrote:
> Add a "allow_special" parameter to get_node_canonicalized() allowing
> to merge get_spec_node() into get_node_canonicalized().
> 
> Add the same parameter to is_valid_nodename(), as this will simplify
> check_watch_path().
> 
> This is done in preparation to introducing a get_node() variant
> returning a pointer to const struct node.
> 
> Note that this will change how special node names are going to be
> validated, as now the normal restrictions for node names will be
> applied:
> 
> - they can't end with "/"
> - they can't contain "//"
> - they can't contain characters other than the ones allowed for normal
>    nodes
> - the length of the node name is restricted by the max path length
>    quota
> 
> For defined special node names this isn't any real restriction, though.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

