Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DB13608AE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 13:58:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111084.212367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0dn-0007eH-9T; Thu, 15 Apr 2021 11:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111084.212367; Thu, 15 Apr 2021 11:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0dn-0007dr-47; Thu, 15 Apr 2021 11:58:35 +0000
Received: by outflank-mailman (input) for mailman id 111084;
 Thu, 15 Apr 2021 11:58:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX0dl-0007dm-0c
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 11:58:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX0dj-0007JF-BW; Thu, 15 Apr 2021 11:58:31 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX0dj-00023S-3a; Thu, 15 Apr 2021 11:58:31 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=CqdkjC25UykkGQLczqtnl9eBgTTm5LetzIlumNnw4LI=; b=dv8prgrtF3NtAkgCYU1TPfkXZU
	u6GSOQoW5TjMLkgt6QHV7hVDrpY/2eFHIqO7H6cfFeCI8wVorSjFUBGDVr/eROdnrs6jesVvCMUFl
	r+R/Zkr9VYrF1Dvj/T6Gywc5d1gbi5J78oC71OVJuXzOEkUBUSF4Ef6uHTazzo9BjRIE=;
Subject: Re: [PATCH v3 12/15] unxz: replace INIT{,DATA} and STATIC
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <4e0a0db2-db34-a738-2f5e-1d5cd2c37e19@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c52c9670-d87e-79f9-0104-e6e074419c31@xen.org>
Date: Thu, 15 Apr 2021 12:58:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <4e0a0db2-db34-a738-2f5e-1d5cd2c37e19@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/01/2021 09:52, Jan Beulich wrote:
> With xen/common/decompress.h now agreeing in both build modes about
> what STATIC expands to, there's no need for this abstraction anymore.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: New.
> 
> --- a/xen/common/decompress.h
> +++ b/xen/common/decompress.h
> @@ -9,7 +9,6 @@
>   
>   #define STATIC static
>   #define INIT __init
> -#define INITDATA __initdata
>   
>   #define malloc xmalloc_bytes
>   #define free xfree
> @@ -21,7 +20,6 @@
>   
>   #define STATIC static
>   #define INIT
> -#define INITDATA

Shouldn't the two changes be part of patch #14?

Cheers,

-- 
Julien Grall

