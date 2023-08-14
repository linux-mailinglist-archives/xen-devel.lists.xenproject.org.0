Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D829977BF7D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 20:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583791.914108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVbvB-00060A-B9; Mon, 14 Aug 2023 18:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583791.914108; Mon, 14 Aug 2023 18:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVbvB-0005xC-7X; Mon, 14 Aug 2023 18:04:05 +0000
Received: by outflank-mailman (input) for mailman id 583791;
 Mon, 14 Aug 2023 18:04:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qVbvA-0005x6-Iz
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 18:04:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVbv9-000681-RG; Mon, 14 Aug 2023 18:04:03 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVbv9-0006vR-I9; Mon, 14 Aug 2023 18:04:03 +0000
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
	bh=xlFFlRa8B7TpOjz2NjhWBmQaaLHPwgSIgrzbE41K0OQ=; b=6rQZLjnqNxlnpghZPgpx5BJqj9
	hNmiQB5j10/5/1AjxEHrVmHghCvIFA9qHjx2hgsyYtHvqzj9BnvHTZFIOft3yBXelhMHemdVX6ERW
	b6BAd9A9bWstZAOmKrkUyXvLrJhc0wYuLzdKR+/RroZeufJ1vYh90y1lgi1uYBs1afr4=;
Message-ID: <a2dbbe42-b13d-4339-8943-b9fefa76ea7b@xen.org>
Date: Mon, 14 Aug 2023 19:04:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/19] tools/xenstore: rework struct xs_tdb_record_hdr
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-10-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814074707.27696-10-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/08/2023 08:46, Juergen Gross wrote:
> Struct xs_tdb_record_hdr is used for nodes stored in the data base.
> When working on a node, struct node is being used, which is including
> the same information as struct xs_tdb_record_hdr, but in a different
> format. Rework struct xs_tdb_record_hdr in order to prepare including
> it in struct node.
> 
> Do the following modifications:
> 
> - move its definition to xenstored_core.h, as the reason to put it into
>    utils.h are no longer existing
> 
> - rename it to struct node_hdr, as the "tdb" in its name has only
>    historical reasons
> 
> - replace the empty permission array at the end with a comment about
>    the layout of data in the data base (concatenation of header,
>    permissions, node contents, and children list)
> 
> - use narrower types for num_perms and datalen, as those are naturally
>    limited to XENSTORE_PAYLOAD_MAX (childlen is different here, as it is
>    in theory basically unlimited)
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

