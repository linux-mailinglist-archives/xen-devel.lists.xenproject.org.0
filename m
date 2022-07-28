Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBCB58403E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 15:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376795.609799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH3oD-0003mQ-Rp; Thu, 28 Jul 2022 13:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376795.609799; Thu, 28 Jul 2022 13:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH3oD-0003jK-ON; Thu, 28 Jul 2022 13:44:13 +0000
Received: by outflank-mailman (input) for mailman id 376795;
 Thu, 28 Jul 2022 13:44:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZgEr=YB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oH3oC-0003jC-Tm
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 13:44:13 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59b6deb0-0e7b-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 15:44:10 +0200 (CEST)
Received: from [10.10.1.164] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165901584069079.73373381885733;
 Thu, 28 Jul 2022 06:44:00 -0700 (PDT)
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
X-Inumbo-ID: 59b6deb0-0e7b-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1659015846; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GD4tUhfVP2lCne6+H74NmvjGCf7IqGsr4qtgni6GVzMg4SpyMaUIXTDGyIggrS5mv90azfoKjfOE9YkD6slnMv9ykpF4xjgv4oZihA2sD3CNI0iDdnydFyF0SCs8kuvdTHZqjhC1bulYzqcYOCymB9OiJ0uSnEYxbw/vwTHMkIQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1659015846; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=WhkfHmQIFWCfqZmvNGvalf8cSH4ULdgERHVpM9FNsYk=; 
	b=SVHTP9EatwlWwsVEUrzlnzW31DxYp79SAUM4ktYuh5ROuntx3eV4biM/r3HEX1cBeEm5JNQjLr1o6rmCjzUXPUfQT0sC2VboLXlIEiE6SMMIettX1TerKiBIccuH69DPy8Nv2by67yyYQg6+G1NjYcN9RnOfMatrRocvkfaHlh0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659015846;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WhkfHmQIFWCfqZmvNGvalf8cSH4ULdgERHVpM9FNsYk=;
	b=NDCUPS8Ksqp5ruKPqzmiv6ymOP0szvuK4T0CewbkXNHlXJUvhhJRa97nkD1VNgeG
	xKuOQ+0cZw1LjbrEbIsw89ZwJ1ukDdGusuIWARfuVwQIO82cLRY8jPVtLQ2qFgpuQFI
	sSMvvgkRHNguE/SH1ax7oT5XbzLwxL0GoeTeQ8O0=
Message-ID: <472e25cf-79aa-0969-177a-0cf4846d707e@apertussolutions.com>
Date: Thu, 28 Jul 2022 09:42:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7] evtchn: convert domain event lock to an r/w one
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <d6a04eb7-bea7-0757-38da-526ee5d5448b@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <d6a04eb7-bea7-0757-38da-526ee5d5448b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/27/22 11:56, Jan Beulich wrote:
> Especially for the use in evtchn_move_pirqs() (called when moving a vCPU
> across pCPU-s) and the ones in EOI handling in PCI pass-through code,
> serializing perhaps an entire domain isn't helpful when no state (which
> isn't e.g. further protected by the per-channel lock) changes.
> 
> Unfortunately this implies dropping of lock profiling for this lock,
> until r/w locks may get enabled for such functionality.
> 
> While ->notify_vcpu_id is now meant to be consistently updated with the
> per-channel lock held, an extension applies to ECS_PIRQ: The field is
> also guaranteed to not change with the per-domain event lock held for
> writing. Therefore the link_pirq_port() call from evtchn_bind_pirq()
> could in principle be moved out of the per-channel locked regions, but
> this further code churn didn't seem worth it.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v6: Re-vive and re-base.
> v5: Re-base, also over dropped earlier patch.
> v4: Re-base, in particular over new earlier patches. Acquire both
>      per-domain locks for writing in evtchn_close(). Adjust
>      spin_barrier() related comments.
> v3: Re-base.
> v2: Consistently lock for writing in evtchn_reset(). Fix error path in
>      pci_clean_dpci_irqs(). Lock for writing in pt_irq_time_out(),
>      hvm_dirq_assist(), hvm_dpci_eoi(), and hvm_dpci_isairq_eoi(). Move
>      rw_barrier() introduction here. Re-base over changes earlier in the
>      series.
> 

<snip/>

> --- a/xen/xsm/flask/flask_op.c
> +++ b/xen/xsm/flask/flask_op.c
> @@ -530,7 +530,7 @@ static int flask_get_peer_sid(struct xen
>       struct evtchn *chn;
>       struct domain_security_struct *dsec;
>   
> -    spin_lock(&d->event_lock);
> +    read_lock(&d->event_lock);
>   
>       if ( !port_is_valid(d, arg->evtchn) )
>           goto out;
> @@ -548,7 +548,7 @@ static int flask_get_peer_sid(struct xen
>       rv = 0;
>   
>    out:
> -    spin_unlock(&d->event_lock);
> +    read_unlock(&d->event_lock);
>       return rv;
>   }

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

