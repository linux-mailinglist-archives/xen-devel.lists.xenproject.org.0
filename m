Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 370FD382ADC
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 13:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128180.240688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1libJy-00041V-DH; Mon, 17 May 2021 11:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128180.240688; Mon, 17 May 2021 11:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1libJy-0003zS-9n; Mon, 17 May 2021 11:22:02 +0000
Received: by outflank-mailman (input) for mailman id 128180;
 Mon, 17 May 2021 11:22:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1libJw-0003zM-30
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 11:22:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fbc4c5a-d9e1-4eff-9e14-0f1028d77262;
 Mon, 17 May 2021 11:21:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 767D0B077;
 Mon, 17 May 2021 11:21:58 +0000 (UTC)
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
X-Inumbo-ID: 0fbc4c5a-d9e1-4eff-9e14-0f1028d77262
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621250518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JqORidrnXvepoyATdPCMnKUTiaJhRNOhWnYZ8IcDbzI=;
	b=HNrWiRIppa3RD141YkyGccYkkVFB46DBdvuXAWCVFGlOZpPaQ7xNKbLWFYG88u3+mKxsFb
	Yjh/r8gxZe4ySbDbxZRRwQTgfs/k030O3bvnSjUZu8X2S1PcasJG6YJRFoLzJiqJP7b8U5
	5T7bp/6w2b5ALjx1lzOH9Fi9thTq9LM=
Subject: Re: [PATCH v3 3/5] xen: Fix build when !CONFIG_GRANT_TABLE
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621017334.git.connojdavis@gmail.com>
 <834f7995ae80a3b37b6d508d1c989b4ee391f61b.1621017334.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b56a1cfd-46ab-c601-883c-73537dfaac92@suse.com>
Date: Mon, 17 May 2021 13:22:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <834f7995ae80a3b37b6d508d1c989b4ee391f61b.1621017334.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.05.2021 20:53, Connor Davis wrote:
> Move struct grant_table; in grant_table.h above
> ifdef CONFIG_GRANT_TABLE. This fixes the following:
> 
> /build/xen/include/xen/grant_table.h:84:50: error: 'struct grant_table'
> declared inside parameter list will not be visible outside of this
> definition or declaration [-Werror]
>    84 | static inline int mem_sharing_gref_to_gfn(struct grant_table *gt,
>       |

There must be more to this, as e.g. the PV shim does get built with
!GRANT_TABLE. Nevertheless, ...

> Signed-off-by: Connor Davis <connojdavis@gmail.com>

... since the potential of breaking the build is obvious enough,
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

