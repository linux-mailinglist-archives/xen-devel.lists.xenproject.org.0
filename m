Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C45277BF64
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 19:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583784.914097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVbn4-0004JU-Hl; Mon, 14 Aug 2023 17:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583784.914097; Mon, 14 Aug 2023 17:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVbn4-0004Hp-Es; Mon, 14 Aug 2023 17:55:42 +0000
Received: by outflank-mailman (input) for mailman id 583784;
 Mon, 14 Aug 2023 17:55:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qVbn2-0004Hj-5B
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 17:55:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVbn1-0005u8-Fq; Mon, 14 Aug 2023 17:55:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVbn1-0006ZG-9O; Mon, 14 Aug 2023 17:55:39 +0000
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
	bh=wCOoZTnegoVSQQsBGlBP+woe/MuBy9c7y49RW2e6pew=; b=qd4ZpSbJhZ84snOAWQ/ljklM5b
	cMOVOxnKoom1VgtNDmC42uWgzZkb78VQ0fYBZZHGTi9yMA3WE42s3rRwTbuol1+E5WwlM8wxQZwj6
	OJuXH/l5purtwmVbn3zhuMHvBiG6yH0l4wQkyIDB2HTHQuSWL5Y9luTbvtZHWC20eqLs=;
Message-ID: <8d738d04-9c3d-4374-b511-26df3c6861cb@xen.org>
Date: Mon, 14 Aug 2023 18:55:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/19] tools/xenstore: move copying of node data out of
 db_fetch()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-9-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814074707.27696-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/08/2023 08:46, Juergen Gross wrote:
> Today the node data is copied in db_fetch() on each data base read in
> order to avoid accidental data base modifications when working on a
> node.
> 
> read_node() is the only caller of db_fetch() which isn't freeing the
> returned data area immediately after using it. The other callers don't
> modify the returned data, so they don't need the data to be copied.
> 
> Move copying of the data into read_node(), resulting in a speedup of
> the other callers due to no memory allocation and no copying being
> needed anymore.
> 
> This allows to let db_fetch() return a pointer to const data.
> 
> As db_fetch() can't return any error other than ENOENT now, error
> handling for the callers can be simplified.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

