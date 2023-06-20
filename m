Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626D8736BD0
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 14:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551751.861432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaLl-0007J1-85; Tue, 20 Jun 2023 12:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551751.861432; Tue, 20 Jun 2023 12:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaLl-0007GU-5S; Tue, 20 Jun 2023 12:20:45 +0000
Received: by outflank-mailman (input) for mailman id 551751;
 Tue, 20 Jun 2023 12:20:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBaLj-0007GK-Tr
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 12:20:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBaLj-0005IN-0h; Tue, 20 Jun 2023 12:20:43 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.9.99])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBaLi-00062W-Qs; Tue, 20 Jun 2023 12:20:42 +0000
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
	bh=WahysCeIn1bnizEkQeT54R3dNcwhMTch3dnU0V4BTdU=; b=XHFQPMlwIfU09NDudTWCGemv0d
	2m5MR57w2ePmPizSfnQBBpqS510irSqaYoRRIT6X8U5dfgqtFYvIyXG/6+NxIct+sEgZxV/FPO1PG
	CuIekMjkkJ0gIXycDKi0QgGI+mxhAV1raDKwbRl5nlY2Jxv14+hvkPRPQzrX0qrSu4ws=;
Message-ID: <b555be99-b1b9-af51-98cd-7464e0df4b69@xen.org>
Date: Tue, 20 Jun 2023 13:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 05/11] tools/xenstore: rename do_tdb_write() and change
 parameter type
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-6-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530091333.7678-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 10:13, Juergen Gross wrote:
> @@ -395,18 +393,18 @@ static int finalize_transaction(struct connection *conn,
>   
>   	while ((i = list_top(&trans->accessed, struct accessed_node, list))) {
>   		if (i->ta_node) {
> -			set_tdb_key(i->trans_name, &ta_key);
> -			data = tdb_fetch(tdb_ctx, ta_key);
> +			set_tdb_key(i->trans_name, &key);
> +			data = tdb_fetch(tdb_ctx, key);

This change confused me because you are just renaming the key variable. 
This feels unrelated to this patch (yes, I know that the variable 'key' 
is not used anymore). So I would rather prefer if you don't change the name.

Cheers,

-- 
Julien Grall

