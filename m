Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B8758661
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 23:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565495.883667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLroO-0008Dh-Vg; Tue, 18 Jul 2023 21:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565495.883667; Tue, 18 Jul 2023 21:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLroO-0008Ac-Sx; Tue, 18 Jul 2023 21:00:48 +0000
Received: by outflank-mailman (input) for mailman id 565495;
 Tue, 18 Jul 2023 21:00:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLroN-0008AW-C4
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 21:00:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLroM-0004KX-GY; Tue, 18 Jul 2023 21:00:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLroM-0007Ts-Bf; Tue, 18 Jul 2023 21:00:46 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=iJHvsMxMbfc3habtfVBOzObgmi2C0sv1/i66HS1c+YI=; b=s+lGq9XeZrbEmHFFPfo0bOCQJk
	XH2k3SB9Dp/0B465L0qRqKwO5wSWASSrdf+ENb7AzKUu2cn5jeIU+MrSJAcs2g9mvdtjyb2NxLgrJ
	wlAYIIi1tFqi1zHc2gR94Chx85qWlcNKFn5AUB4Wn9vKE7agMg6H0IelODtrkK3HvLJ4=;
Message-ID: <47c36d64-3161-cfb5-a34a-7abcf253113b@xen.org>
Date: Tue, 18 Jul 2023 22:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-12-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 11/18] tools/xenstore: drop use of tdb
In-Reply-To: <20230710065947.4201-12-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/07/2023 07:59, Juergen Gross wrote:
> -	return (struct xs_tdb_record_hdr *)data.dptr;
> +	*size = sizeof(*hdr) + hdr->num_perms * sizeof(hdr->perms[0]) +
> +		hdr->datalen + hdr->childlen;
> +
> +	p = talloc_size(NULL, *size);
> +	if (!p) {
> +		errno = ENOMEM;
> +		return NULL;
> +	}
> +
> +	trace_tdb("read %s size %zu\n", db_name, *size + strlen(db_name));
> +
> +	/* Return a copy, avoiding a potential modification in the DB. */
> +	memcpy(p, hdr, *size);

The talloc_size() + memcpy() seems to be an open-coded version of 
talloc_memdup(). Can you use it?

The rest looks good to me.

Cheers,

-- 
Julien Grall

