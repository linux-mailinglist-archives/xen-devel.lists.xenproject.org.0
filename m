Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC1C4168ED
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 02:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194665.346822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZ5U-0005ee-OW; Fri, 24 Sep 2021 00:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194665.346822; Fri, 24 Sep 2021 00:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZ5U-0005c7-Jr; Fri, 24 Sep 2021 00:29:12 +0000
Received: by outflank-mailman (input) for mailman id 194665;
 Fri, 24 Sep 2021 00:29:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTZ5T-0005c0-SE
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 00:29:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 772e1a43-bce3-47df-945d-2b7b4497395e;
 Fri, 24 Sep 2021 00:29:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BC9460E05;
 Fri, 24 Sep 2021 00:29:10 +0000 (UTC)
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
X-Inumbo-ID: 772e1a43-bce3-47df-945d-2b7b4497395e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632443350;
	bh=yHeTVy0YzXfruYnPoeScn+anwdCo/tra59HjVLEhVgo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WcczVfSxpQJCEmxyNdaQqG2dkpQWAzF2rQjdFo36JlV29gnRSO9LeNojRcok739a9
	 0598gyWjxupGxlvKlL+wET93p+saP23MfdQyEh2qIT88T9iYWHc9L2oVKrE2GsIFWA
	 qvTYIqShLGbEtrSc5ecmXt3xKvzzJKOdA9F9A29WWavK83h5TacmVjC7wYS3ql8P+9
	 mZvdu1IokGk9K/uJ8HCVUQwRhrdtqSx48k/rA4ks40aK9n+DFZnuL26X2nAAICezuO
	 XMZy0yFRg/ovDo4dP63QIUhCxyv3eie/of3jXe796/JxD6sRwSw4xWR3OM/mQHr0w4
	 g5Cqq/eUqN1zg==
Date: Thu, 23 Sep 2021 17:29:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, wl@xen.org
Subject: Re: [PATCH 09/37] xen/x86: introduce two helpers to access memory
 hotplug end
In-Reply-To: <20210923120236.3692135-10-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231727560.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-10-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+x86 maintainers

On Thu, 23 Sep 2021, Wei Chen wrote:
> x86 provides a mem_hotplug to maintain the end of memory hotplug
                            ^ variable

> end address. This variable can be accessed out of mm.c. We want
> some code out of mm.c can be reused by other architectures without
                       ^ so that it can be reused

> memory hotplug ability. So in this patch, we introduce these two
> helpers to replace mem_hotplug direct access. This will give the
> ability to stub these two API.
                            ^ APIs


> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/include/asm-x86/mm.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
> index cb90527499..af2fc4b0cd 100644
> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -475,6 +475,16 @@ static inline int get_page_and_type(struct page_info *page,
>  
>  extern paddr_t mem_hotplug;
>  
> +static inline void mem_hotplug_update_boundary(paddr_t end)
> +{
> +    mem_hotplug = end;
> +}
> +
> +static inline paddr_t mem_hotplug_boundary(void)
> +{
> +    return mem_hotplug;
> +}
> +
>  /******************************************************************************
>   * With shadow pagetables, the different kinds of address start
>   * to get get confusing.
> -- 
> 2.25.1
> 

