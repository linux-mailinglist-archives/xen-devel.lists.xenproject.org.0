Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517C9296F40
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 14:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10950.29098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVwEp-0006ts-6n; Fri, 23 Oct 2020 12:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10950.29098; Fri, 23 Oct 2020 12:32:07 +0000
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
	id 1kVwEp-0006tV-3Q; Fri, 23 Oct 2020 12:32:07 +0000
Received: by outflank-mailman (input) for mailman id 10950;
 Fri, 23 Oct 2020 12:32:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVwEn-0006tP-5V
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 12:32:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64e30598-3705-42d2-9795-46d9ecbeec62;
 Fri, 23 Oct 2020 12:32:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C197EAE1A;
 Fri, 23 Oct 2020 12:32:03 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVwEn-0006tP-5V
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 12:32:05 +0000
X-Inumbo-ID: 64e30598-3705-42d2-9795-46d9ecbeec62
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 64e30598-3705-42d2-9795-46d9ecbeec62;
	Fri, 23 Oct 2020 12:32:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603456323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8FWvXP1rN7ufKIsGtT6ekIiSnsRFQrKSbVD85n1nww=;
	b=UPM7tbPClMwKTPyX6TZCX3wzOHHaIehO9WXUCUzovLvr1/+tM9uH1HDu4NtJdEfsxFHvjd
	LyzgRA1xXttlAzyPyby/UzVIOcGVAtDrUxqn9+6UGjNuWsNXQ7LJLUu8ih7inE/KZXtNJX
	r+Vjvp6qo7k7oAbAYaU6kGmInwLxXhA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C197EAE1A;
	Fri, 23 Oct 2020 12:32:03 +0000 (UTC)
Subject: Re: [PATCH v2 07/11] x86/dpci: move code
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-8-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26aabe08-f44c-95f3-35d9-057abf6fa8ef@suse.com>
Date: Fri, 23 Oct 2020 14:32:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20200930104108.35969-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.09.2020 12:41, Roger Pau Monne wrote:
> This is code movement in order to simply further changes.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/drivers/passthrough/io.c
> +++ b/xen/drivers/passthrough/io.c
> @@ -276,6 +276,92 @@ static struct vcpu *vector_hashing_dest(const struct domain *d,
>      return dest;
>  }
>  
> +static void hvm_pirq_eoi(struct pirq *pirq,
> +                         const union vioapic_redir_entry *ent)
> +{
> +    struct hvm_pirq_dpci *pirq_dpci;
> +
> +    if ( !pirq )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return;
> +    }
> +
> +    pirq_dpci = pirq_dpci(pirq);
> +
> +    /*
> +     * No need to get vector lock for timer
> +     * since interrupt is still not EOIed
> +     */
> +    if ( --pirq_dpci->pending ||
> +         (ent && ent->fields.mask) ||
> +         !pt_irq_need_timer(pirq_dpci->flags) )
> +        return;
> +
> +    stop_timer(&pirq_dpci->timer);
> +    pirq_guest_eoi(pirq);
> +}
> +
> +static void __hvm_dpci_eoi(struct domain *d,

... could I talk you into dropping one of the two leading underscores
while moving the thing?

Jan

