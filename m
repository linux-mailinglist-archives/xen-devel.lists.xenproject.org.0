Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF54B751B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 21:41:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273548.468779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK4dD-0005UN-Ll; Tue, 15 Feb 2022 20:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273548.468779; Tue, 15 Feb 2022 20:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK4dD-0005S4-Hr; Tue, 15 Feb 2022 20:41:03 +0000
Received: by outflank-mailman (input) for mailman id 273548;
 Tue, 15 Feb 2022 20:41:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nK4dC-0005Ry-5w
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 20:41:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nK4dB-0001g1-LZ; Tue, 15 Feb 2022 20:41:01 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[192.168.8.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nK4dB-0003c9-FT; Tue, 15 Feb 2022 20:41:01 +0000
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
	bh=neE5Po6dmyyh3tBfWfFJ6iGtraldi78Vot66mEQEMC0=; b=LuV5qMexY28ChRPBh5Z+24cbuN
	p2XTyJOjYuduXp7mxPRHXOJvOJEhGBxM1EyX1b7D41P23fmXoI1RohG0Z0KQlH6wDAnF8sDf2PHDs
	Ag2MOnE7IMdJxGZrlGULuXISzqG4al7dhh6yEVokkuk7y/gYJl0F5y6kQ8JL0a5m4zq4=;
Message-ID: <6dd022ea-192b-3a5b-e02c-2368e769339f@xen.org>
Date: Tue, 15 Feb 2022 20:40:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH] docs: add some clarification to xenstore-migration.md
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220210112652.6237-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220210112652.6237-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/02/2022 11:26, Juergen Gross wrote:
> The Xenstore migration document is missing the specification that a
> node record must be preceded by the record of its parent node in case
> of live update.
> 
> Add that missing part.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   docs/designs/xenstore-migration.md | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
> index 5f1155273e..39e31c984b 100644
> --- a/docs/designs/xenstore-migration.md
> +++ b/docs/designs/xenstore-migration.md
> @@ -316,6 +316,10 @@ a _committed_ node (globally visible in xenstored) or a _pending_ node (created
>   or modified by a transaction for which there is also a `TRANSACTION_DATA`
>   record previously present).
>   
> +In the live update case the _committed_ nodes must be in a top-down sequence,
> +i.e. the first node needs to be `/`, and each other node in the stream must
> +come _after_ its parent node.

I would actually expect the same restriction to apply for the 
non-liveupdate case. I.e. we want the parent to either exist in the tree 
or the record for the parent to be before in the stream.

Cheers,

-- 
Julien Grall

