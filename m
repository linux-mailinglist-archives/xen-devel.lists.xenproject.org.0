Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BACB017B2
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 11:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040699.1412051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaA45-0002vG-V9; Fri, 11 Jul 2025 09:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040699.1412051; Fri, 11 Jul 2025 09:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaA45-0002tN-Sc; Fri, 11 Jul 2025 09:29:09 +0000
Received: by outflank-mailman (input) for mailman id 1040699;
 Fri, 11 Jul 2025 09:29:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bgda=ZY=bounce.vates.tech=bounce-md_30504962.6870d960.v1-1f4793f9c09e4329908deb9ec2368d2e@srs-se1.protection.inumbo.net>)
 id 1uaA44-0002tH-3O
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 09:29:08 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d5e31ce-5e39-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 11:29:06 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4bdmcd08DLz8XRv9W
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jul 2025 09:29:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1f4793f9c09e4329908deb9ec2368d2e; Fri, 11 Jul 2025 09:29:04 +0000
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
X-Inumbo-ID: 7d5e31ce-5e39-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1752226145; x=1752496145;
	bh=uAb7gBbLP+dlFQI44CzOBsWMaW6cCWUdSMe2t9rouy8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mRs0/ANQnljarZNjf8bu2ZZGGcwUcrugRE/zDdq0Q2N90RLoIUOxuPeDWK5CovX7R
	 5STqx1fIzqwF2K1y/jQsYRzS3r5omXTjuBOQfQnHVrYzxeukz79saTTwmisy0Gipxw
	 bxwLKtFuWXj7As04s1DxCECAarSGr/wEQIX5wy1kgzExbXhEMWvjtoSY1/WVj3zAwE
	 ZiU0dIK0PvWtESsHFi+QtAugcveMSRmFgV5rxdwcqSEqKJG8DebRsKTWFdxZ3e+E9+
	 ekupJsl58qPw46vJ0OiHGQ+hxIvU2Y2sBlKYPBaaqvH+Ql/OFIXrlnRhXg9QzQ9Aol
	 Y3TPT9DL+8BgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1752226145; x=1752486645; i=teddy.astie@vates.tech;
	bh=uAb7gBbLP+dlFQI44CzOBsWMaW6cCWUdSMe2t9rouy8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KyAajj6SsqLzsd6o+IKhyHryLSR6EwDPWIjrrv92aep4AZGHXcENh2iwAhU2CxnJZ
	 Gne8plJ6zWxxXk8XCc73tYkNR3bAn73/NKqLgFvnnBjLhA8Zr4ppXvmsSCdU2gay6E
	 RCosP/n5luEm43p13u/frIXcyidGMHlo1tPal/BVkPRpWtvTddq0RLz5ztcj9S+f9o
	 E7tO5RWNu2pmc3ZogeVqgip8RfCknLSPi0kqDY3AMZ5sEnjLWoTf02xYdbcconGZr5
	 rwtXkxjTcjACwbSorbthWRVaXoJZgo3VZdknQ7WHWuvEfu/F0nXu0FT1m9yR8/oUYp
	 6bLlZqhDZpbyg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen/netfront:=20Fix=20TX=20response=20spurious=20interrupts?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1752226143810
Message-Id: <6a6b8f95-0407-43ac-925f-d6e8e312a631@vates.tech>
To: "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>, xen-devel@lists.xenproject.org
Cc: "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
In-Reply-To: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1f4793f9c09e4329908deb9ec2368d2e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250711:md
Date: Fri, 11 Jul 2025 09:29:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

You also probably want to send this to linux kernel mailing list too.

Le 10/07/2025 =C3=A0 18:14, Anthoine Bourgeois a =C3=A9crit=C2=A0:
> We found at Vates that there are lot of spurious interrupts when
> benchmarking the PV drivers of Xen. This issue appeared with a patch
> that addresses security issue XSA-391 (see Fixes below). On an iperf
> benchmark, spurious interrupts can represent up to 50% of the
> interrupts.
> 
> Spurious interrupts are interrupts that are rised for nothing, there is
> no work to do. This appends because the function that handles the
> interrupts ("xennet_tx_buf_gc") is also called at the end of the request
> path to garbage collect the responses received during the transmission
> load.
> 
> The request path is doing the work that the interrupt handler should
> have done otherwise. This is particurary true when there is more than
> one vcpu and get worse linearly with the number of vcpu/queue.
> 
> Moreover, this problem is amplifyed by the penalty imposed by a spurious
> interrupt. When an interrupt is found spurious the interrupt chip will
> delay the EOI to slowdown the backend. This delay will allow more
> responses to be handled by the request path and then there will be more
> chance the next interrupt will not find any work to do, creating a new
> spurious interrupt.
> 
> This causes performance issue. The solution here is to remove the calls
> from the request path and let the interrupt handler do the processing of
> the responses. This approch removes spurious interrupts (<0.05%) and
> also has the benefit of freeing up cycles in the request path, allowing
> it to process more work, which improves performance compared to masking
> the spurious interrupt one way or another.
> 
> Some vif throughput performance figures from a 8 vCPUs, 4GB of RAM HVM
> guest(s):
> 
> Without this patch on the :
> vm -> dom0: 4.5Gb/s
> vm -> vm:   7.0Gb/s
> 
> Without XSA-391 patch (revert of b27d47950e48):
> vm -> dom0: 8.3Gb/s
> vm -> vm:   8.7Gb/s
> 
> With XSA-391 and this patch:
> vm -> dom0: 11.5Gb/s
> vm -> vm:   12.6Gb/s
> 
> Fixes: b27d47950e48 ("xen/netfront: harden netfront against event channel=
 storms")
> Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
> ---
>   drivers/net/xen-netfront.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
> index 9bac50963477..a11a0e949400 100644
> --- a/drivers/net/xen-netfront.c
> +++ b/drivers/net/xen-netfront.c
> @@ -638,8 +638,6 @@ static int xennet_xdp_xmit_one(struct net_device *dev=
,
>   =09tx_stats->packets++;
>   =09u64_stats_update_end(&tx_stats->syncp);
>   
> -=09xennet_tx_buf_gc(queue);
> -
>   =09return 0;
>   }
>   
> @@ -849,9 +847,6 @@ static netdev_tx_t xennet_start_xmit(struct sk_buff *=
skb, struct net_device *dev
>   =09tx_stats->packets++;
>   =09u64_stats_update_end(&tx_stats->syncp);
>   
> -=09/* Note: It is not safe to access skb after xennet_tx_buf_gc()! */
> -=09xennet_tx_buf_gc(queue);
> -
>   =09if (!netfront_tx_slot_available(queue))
>   =09=09netif_tx_stop_queue(netdev_get_tx_queue(dev, queue->id));
>   

Is there a risk of having a condition where the ring is full and the 
event channel is not up (which would cause the interrupt to never be 
called, and no message to be received again) ?

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



