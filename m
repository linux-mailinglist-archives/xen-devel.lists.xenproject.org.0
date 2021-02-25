Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E033252A3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 16:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89839.169624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIpK-0000lx-Lt; Thu, 25 Feb 2021 15:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89839.169624; Thu, 25 Feb 2021 15:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIpK-0000lY-I2; Thu, 25 Feb 2021 15:45:18 +0000
Received: by outflank-mailman (input) for mailman id 89839;
 Thu, 25 Feb 2021 15:45:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFIpJ-0000lS-2U
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:45:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a748a975-f9b6-4137-be63-5a6ca38ff5ca;
 Thu, 25 Feb 2021 15:45:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DC26AC1D;
 Thu, 25 Feb 2021 15:45:15 +0000 (UTC)
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
X-Inumbo-ID: a748a975-f9b6-4137-be63-5a6ca38ff5ca
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614267915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7RyTHr5dCnuLgWH3gPD0y8ZfhP7p0lH8Dt7rn8C4M4=;
	b=e6hrKJhYOyA6AG2uR5MBY6n05MdVGOyLyE80DKJNCd9D/l0ISCGg27tnMh3v4tPkrwDr7n
	auT82+kg3tZ4f52r5/oarETqdsQ3/ualAAZM2vEH0CmRYu1/iiuc4IQpgNj9dj/acHSLNa
	v5MWc5rq1vpHDPjaaD3A4YCZks9M5TY=
Subject: Re: [PATCH for-next 2/6] xen/common: Guard iommu symbols with
 CONFIG_HAS_PASSTHROUGH
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1614265718.git.connojdavis@gmail.com>
 <444658f690c81b9e93c2c709fa1032c049646763.1614265718.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <02f32a31-1c23-46af-54a7-7d44b5ffb613@suse.com>
Date: Thu, 25 Feb 2021 16:45:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <444658f690c81b9e93c2c709fa1032c049646763.1614265718.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 16:24, Connor Davis wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -501,7 +501,9 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>              return -EINVAL;
>          }
>  
> +#ifdef CONFIG_HAS_PASSTHROUGH
>          if ( !iommu_enabled )
> +#endif
>          {
>              dprintk(XENLOG_INFO, "IOMMU requested but not available\n");
>              return -EINVAL;

Where possible - to avoid such #ifdef-ary - the symbol instead should
get #define-d to a sensible value ("false" in this case) in the header.
The other cases here may indeed need to remain as you have them.

Jan

