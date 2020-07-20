Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D2F22687C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 18:21:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxYWz-0000as-7C; Mon, 20 Jul 2020 16:20:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Eely=A7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxYWx-0000an-IJ
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 16:20:43 +0000
X-Inumbo-ID: f54ee9c6-caa4-11ea-84a5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f54ee9c6-caa4-11ea-84a5-bc764e2007e4;
 Mon, 20 Jul 2020 16:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ony7tRUDmnp2M52H4Ead1BQvn2JkncG8N5OVB64bMsY=; b=HOKayEJ1n057vGkk1yfnFbgCPP
 oowFgCkZRD+PT0r4IUz6MpShYfuIRqyLEQpZQWdIiOelj+Wd37Ti1h1VJE0hW6/7+hgxWuVvLJFhl
 UKampjDMDUiXG1MmIByyVn9YMllfQ2QoY2ihshFTcHSm5RDkAe5f2mpTRFVRP6vmTgxg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxYWv-0002N1-Uk; Mon, 20 Jul 2020 16:20:41 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxYWv-0005lr-NQ; Mon, 20 Jul 2020 16:20:41 +0000
Subject: Re: [PATCH 5/8] bitmap: move to/from xenctl_bitmap conversion helpers
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
 <5835147f-8428-1d74-7d6e-bbb5522289c7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fef25c94-a3ce-c17e-966c-a7e479566fc5@xen.org>
Date: Mon, 20 Jul 2020 17:20:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5835147f-8428-1d74-7d6e-bbb5522289c7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 15/07/2020 11:40, Jan Beulich wrote:
> A subsequent change will exclude domctl.c from getting built for a
> particular configuration, yet the two functions get used from elsewhere.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -9,6 +9,9 @@
>   #include <xen/errno.h>
>   #include <xen/bitmap.h>
>   #include <xen/bitops.h>
> +#include <xen/cpumask.h>
> +#include <xen/domain.h>

The inclusion of xen/domain.h in common/bitmap.c seems a bit odd to me. 
Would it make sense to move the prototype of 
bitmap_to_xenctl_bitmap()/xenctl_bitmap_to_bitmap() to bitmap.h?

Cheers,

-- 
Julien Grall

