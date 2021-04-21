Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A5D366803
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:30:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114193.217512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9BH-0008LF-OE; Wed, 21 Apr 2021 09:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114193.217512; Wed, 21 Apr 2021 09:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9BH-0008Kq-LH; Wed, 21 Apr 2021 09:29:59 +0000
Received: by outflank-mailman (input) for mailman id 114193;
 Wed, 21 Apr 2021 09:29:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZ9BF-0008Kl-S8
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:29:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18e41fc0-5014-425f-97ce-7c88df90df07;
 Wed, 21 Apr 2021 09:29:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33080AEAE;
 Wed, 21 Apr 2021 09:29:56 +0000 (UTC)
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
X-Inumbo-ID: 18e41fc0-5014-425f-97ce-7c88df90df07
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618997396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7f73emCJKv6X9z3m9bg1w5HSz7hqe1vr4qBQ66u32u8=;
	b=bBx//rE5jBW3I442f7QK+NKC0rDixTWxLuzwdyhxkYm1JQ/XKr7gjPn1NQaeut01Psa7EO
	DDvhBE4lRticzbBfMvUd7cVsi9ounZ1pdcPqNgYDQJsLwswySbn7P8QSt1cTZ39nI90meY
	ZByFUo+KyqPTXH0oh0Je6AS7JCrW5vQ=
Subject: Re: [PATCH v2] x86/shim: Simplify compat handling in
 write_start_info()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210420174118.2731-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7115a38d-6069-a0ad-e8da-eb926db3acde@suse.com>
Date: Wed, 21 Apr 2021 11:29:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420174118.2731-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.04.2021 19:41, Andrew Cooper wrote:
> Factor out a compat boolean to remove the lfence overhead from multiple
> is_pv_32bit_domain() calls.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> v2:
>  * Reinstate the conditional for the start info pointer, in case Intel/AMD
>    can't be persuaded to adjust the architectural guarentees for upper bits in
>    compatibility mode transitions.

As indicated before, with this adjustment
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

