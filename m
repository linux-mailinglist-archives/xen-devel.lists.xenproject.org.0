Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1627780C29
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 14:54:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586188.917406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWyzR-0006Wr-B6; Fri, 18 Aug 2023 12:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586188.917406; Fri, 18 Aug 2023 12:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWyzR-0006TW-8F; Fri, 18 Aug 2023 12:54:09 +0000
Received: by outflank-mailman (input) for mailman id 586188;
 Fri, 18 Aug 2023 12:54:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWyzP-0006TQ-By
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 12:54:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWyzP-00011A-3K; Fri, 18 Aug 2023 12:54:07 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWyzO-0007WS-Sc; Fri, 18 Aug 2023 12:54:06 +0000
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
	bh=+bNIGPNHvQ27fEWOQ3+fqi9IE4zKJPpMcP9VxxW+uic=; b=Nvw/z3LydCikekf9b8ph8MFjmm
	NvVyOWIRtYUcYEeIFeEG321bYeWWB5TDWz86R8VdA3gu8nPovkda+KIEz0A6IErgyJkTFfhW7YOIn
	0m9bhitqS6h0PlGDgwDc0UMQDs+ZqeJLeydX6FKcy8GqL9Srtt7skT2yJXQLl/aKtNqY=;
Message-ID: <7b3fb909-d3c6-45aa-9c1a-9f15ef44a9a5@xen.org>
Date: Fri, 18 Aug 2023 13:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/19] tools/xenstore: drop TDB
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20230814074707.27696-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814074707.27696-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/08/2023 08:46, Juergen Gross wrote:
> Juergen Gross (19):
>    tools/xenstore: make hashtable key parameter const
>    tools/xenstore: let hashtable_add() fail in case of existing entry
>    tools/xenstore: add hashtable_replace() function
>    tools/xenstore: drop use of tdb
>    tools/xenstore: remove tdb code
>    tools/xenstore: let db_delete() return void
>    tools/xenstore: change talloc_free() to take a const pointer
>    tools/xenstore: move copying of node data out of db_fetch()
>    tools/xenstore: rework struct xs_tdb_record_hdr
>    tools/xenstore: don't use struct node_perms in struct node
>    tools/xenstore: use struct node_hdr in struct node
>    tools/xenstore: alloc new memory in domain_adjust_node_perms()
>    tools/xenstore: introduce read_node_const()
>    tools/xenstore: merge get_spec_node() into get_node_canonicalized()
>    tools/xenstore: merge is_valid_nodename() into canonicalize()
>    tools/xenstore: rework get_node()
>    tools/xenstore: introduce get_node_const()
>    tools/config: add XEN_RUN_STORED to config.h

I have committed up to this patch.

Cheers,


-- 
Julien Grall

