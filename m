Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781CB281206
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 14:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2005.5942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJs8-0007if-Ms; Fri, 02 Oct 2020 12:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2005.5942; Fri, 02 Oct 2020 12:09:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJs8-0007iG-Jk; Fri, 02 Oct 2020 12:09:12 +0000
Received: by outflank-mailman (input) for mailman id 2005;
 Fri, 02 Oct 2020 12:09:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOJs6-0007iB-V6
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:09:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 065e8ae6-58c7-47e1-bf9d-e337fad4b2f5;
 Fri, 02 Oct 2020 12:09:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E43CFB453;
 Fri,  2 Oct 2020 12:09:08 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOJs6-0007iB-V6
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:09:11 +0000
X-Inumbo-ID: 065e8ae6-58c7-47e1-bf9d-e337fad4b2f5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 065e8ae6-58c7-47e1-bf9d-e337fad4b2f5;
	Fri, 02 Oct 2020 12:09:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601640549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eWzi5sBq03i78dd13VMcr/YCIEfgD99M/BA7lsnrOy4=;
	b=AEQuF+O/8NhXCph2hbwxHL226XTk1wSAz3BDTwA2FoaNVdcfWUy8slItD0NX9s8i3nc54d
	gWs725DMP0j+TzK+Dp+nLzAh/tcQ4qjedQV1NGEyaXM3zoRIDfhHKYmXHA+I2JYv5/hwAX
	LK1xfCxzWHhxQ7DMAho7Ks8/OZUWL+E=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E43CFB453;
	Fri,  2 Oct 2020 12:09:08 +0000 (UTC)
Subject: Re: [PATCH] x86/hvm: Correct error message in check_segment()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201002113012.29932-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <986e7bdf-1ba3-3f6f-fdfb-e8ab23afbc6f@suse.com>
Date: Fri, 2 Oct 2020 14:09:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201002113012.29932-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.10.2020 13:30, Andrew Cooper wrote:
> The error message is wrong (given AMD's older interpretation of what a NUL
> segment should contain, attribute wise), and actively unhelpful because you
> only get it in response to a hypercall where the one piece of information you
> cannot provide is the segment selector.
> 
> Fix the message to talk about segment attributes, rather than the selector.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/arch/x86/hvm/domain.c
> +++ b/xen/arch/x86/hvm/domain.c
> @@ -39,7 +39,7 @@ static int check_segment(struct segment_register *reg, enum x86_segment seg)
>      {
>          if ( seg != x86_seg_ds && seg != x86_seg_es )
>          {
> -            gprintk(XENLOG_ERR, "Null selector provided for CS, SS or TR\n");
> +            gprintk(XENLOG_ERR, "Empty segment attributes for CS, SS or TR\n");

... may I suggest "Null" or "Zero" instead of "Empty"?

Jan

