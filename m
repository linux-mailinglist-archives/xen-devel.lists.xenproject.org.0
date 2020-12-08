Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E1E2D2E29
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 16:24:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47555.84165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmeqy-0000s4-PB; Tue, 08 Dec 2020 15:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47555.84165; Tue, 08 Dec 2020 15:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmeqy-0000re-M9; Tue, 08 Dec 2020 15:24:36 +0000
Received: by outflank-mailman (input) for mailman id 47555;
 Tue, 08 Dec 2020 15:24:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmeqx-0000rZ-6R
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 15:24:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b879cc3a-e829-412f-85c6-cb2acb0a13c4;
 Tue, 08 Dec 2020 15:24:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D7E1AC94;
 Tue,  8 Dec 2020 15:24:33 +0000 (UTC)
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
X-Inumbo-ID: b879cc3a-e829-412f-85c6-cb2acb0a13c4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607441073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0CNlvlWfuIMXpJETN9TGA509zEJLEmh2TLLgOB8iqU=;
	b=NcCKdI0LK/XC/MCNUPGke3wL+QLlaYvQkbtGqLySDu1ls3IDOlY4tzXbANNe4/qzvzt1Bc
	1M+B5FXFzmNb5Uv50uTeJwp1pC419byJZUfMBj6brEQTvb6roOgjBBeUBCszuChw5ASq3n
	YT0fV1O5evPaLkZwdsrASuqrjp8sDSY=
Subject: Re: [PATCH V3 20/23] xen/ioreq: Make x86's send_invalidate_req()
 common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-21-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <acb09993-40fc-2ab0-21b9-5dbe2f061554@suse.com>
Date: Tue, 8 Dec 2020 16:24:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-21-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -552,6 +552,8 @@ struct domain
>          struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
>          unsigned int            nr_servers;
>      } ioreq_server;
> +
> +    bool mapcache_invalidate;
>  #endif
>  };

While I can see reasons to put this inside the #ifdef here, I
would suspect putting it in the hole next to the group of 5
bools further up would be more efficient.

Jan

