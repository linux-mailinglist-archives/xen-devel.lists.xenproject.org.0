Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3C354E2F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 09:57:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105669.202110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgaU-0002CU-PE; Tue, 06 Apr 2021 07:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105669.202110; Tue, 06 Apr 2021 07:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgaU-0002C4-M7; Tue, 06 Apr 2021 07:57:26 +0000
Received: by outflank-mailman (input) for mailman id 105669;
 Tue, 06 Apr 2021 07:57:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTgaT-0002Bw-Dn
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 07:57:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b37bdff3-65e0-4534-aad8-72b7a68e097e;
 Tue, 06 Apr 2021 07:57:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC57CB12A;
 Tue,  6 Apr 2021 07:57:23 +0000 (UTC)
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
X-Inumbo-ID: b37bdff3-65e0-4534-aad8-72b7a68e097e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617695843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOsNinbCvHtgx2zCpCcQBiUJ0C9jVc1IKprXgBnJ0Z0=;
	b=HykimJKD4vBf8e7D8flZmBDMyTYStHylthGMsgfZbAFOtX0yCbJRsNbQ8lDMvS0kGttj3n
	EgU8ikQ1lUvtrX5PL9iuDKgec7rcMyMnVPlU4RTadLqVoBeDdySxbgK3AgUBVrKhH9b+iv
	ds8iZFPvjetPcn32d+ZYD/+HuSzQgoY=
Subject: Re: [PATCH 01/14] xen: Constify the second parameter of
 rangeset_new()
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b318ba40-a38a-4120-496d-5adef66c827a@suse.com>
Date: Tue, 6 Apr 2021 09:57:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210405155713.29754-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.04.2021 17:57, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The string 'name' will never get modified by the function, so mark it
> as const.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/common/rangeset.c
> +++ b/xen/common/rangeset.c
> @@ -421,7 +421,7 @@ bool_t rangeset_is_empty(
>  }
>  
>  struct rangeset *rangeset_new(
> -    struct domain *d, char *name, unsigned int flags)
> +    struct domain *d, const char *name, unsigned int flags)
>  {
>      struct rangeset *r;

Remotely along these lines the function also has no need anymore to
use snprintf() - safe_strcpy() very well fits both purposes. But
quite likely for another patch.

Jan

