Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B685C1B702B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 10:59:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRuBR-00078s-Mc; Fri, 24 Apr 2020 08:59:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WQMg=6I=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRuBQ-00078h-25
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 08:59:40 +0000
X-Inumbo-ID: ee1868d8-8609-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee1868d8-8609-11ea-9e09-bc764e2007e4;
 Fri, 24 Apr 2020 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l9hYPuC1aPcKdkz4teGV0XrjqcxoMQyZm3WpG2h4448=; b=EXEM0Fdo0ejY6vq/SHetM604eu
 9S2GDR/juXFhe8zz3WN3vXRq15YgOOcsJAWLG1BFZMov2gTyNwV8eeS0Rw4EJ4QnyLsLoaxvcR8CQ
 /a7t9EsWt0nsi+d4cinY1t5aRRT5PJnc62SJjSROXk6uOGlR7LeSEmEjcIn71LKI/OIs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRuBO-0003Nn-82; Fri, 24 Apr 2020 08:59:38 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRuBN-0003cO-WB; Fri, 24 Apr 2020 08:59:38 +0000
Subject: Re: [PATCH 1/6] x86_64/mm: map and unmap page tables in
 cleanup_frame_table
To: Hongyan Xia <hx242@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1587116799.git.hongyxia@amazon.com>
 <12c4fe0c0c05b9f76377c085d8a6558beae64003.1587116799.git.hongyxia@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ca9b1554-2c91-35f4-2e6b-b7d4985b638d@xen.org>
Date: Fri, 24 Apr 2020 09:59:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <12c4fe0c0c05b9f76377c085d8a6558beae64003.1587116799.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(resending)

On 17/04/2020 10:52, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Also fix a weird indentation.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> ---
>   xen/arch/x86/x86_64/mm.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
> index e85ef449f3..18210405f4 100644
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -737,8 +737,8 @@ static void cleanup_frame_table(struct mem_hotadd_info *info)
>   
>       while (sva < eva)
>       {
> -        l3e = l4e_to_l3e(idle_pg_table[l4_table_offset(sva)])[
> -          l3_table_offset(sva)];
> +        l3e = l3e_from_l4e(idle_pg_table[l4_table_offset(sva)],
> +                           l3_table_offset(sva));

This macro doesn't exist yet in the tree. It would be good to spell out 
the dependencies in the cover letter so this doesn't get merged before 
the dependency is merged.

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

