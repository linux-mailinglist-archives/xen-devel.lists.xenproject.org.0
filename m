Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D4235F569
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 15:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110658.211232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWftB-0005RF-3e; Wed, 14 Apr 2021 13:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110658.211232; Wed, 14 Apr 2021 13:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWftA-0005Qq-WE; Wed, 14 Apr 2021 13:49:05 +0000
Received: by outflank-mailman (input) for mailman id 110658;
 Wed, 14 Apr 2021 13:49:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWftA-0005Qj-6l
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 13:49:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37e6e066-d268-4e71-ba80-bba9dd57ddc6;
 Wed, 14 Apr 2021 13:49:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62BD3AFD2;
 Wed, 14 Apr 2021 13:49:02 +0000 (UTC)
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
X-Inumbo-ID: 37e6e066-d268-4e71-ba80-bba9dd57ddc6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618408142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oRPq2/vYACH6nua6suekQSNoK5M+eBcLDGoKFsrwq/4=;
	b=ggzKMge9FhetJABKNbrMfpDUJxjKIztlro9o0P63vN1EPku6lU6ByDgTc/7r85H1H2Cl5x
	5yQjS8PX6ZrFJcEdxKuD+LGqy+dK/YbA0TEgS+u61ai7uXfNSv+qqbWGukdq61phjJF5pC
	lAo1U01NQuio7mSfxlrD7WptuH5t2Fg=
Subject: Re: [PATCH v2 15/21] libs/guest: obtain a compatible cpu policy from
 two input ones
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-16-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <391b56d0-bb4d-8d3c-231c-e2e3ad7e2f42@suse.com>
Date: Wed, 14 Apr 2021 15:49:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210413140140.73690-16-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.04.2021 16:01, Roger Pau Monne wrote:
> @@ -944,3 +945,130 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
>  
>      return false;
>  }
> +
> +static uint64_t level_msr(unsigned int index, uint64_t val1, uint64_t val2)
> +{
> +    uint64_t val = val1 & val2;;

For arbitrary MSRs this isn't going to do any good. If only very
specific MSRs are assumed to make it here, I think this wants
commenting on.

Also, nit: stray semicolon.

> +    switch ( index )
> +    {
> +    case MSR_ARCH_CAPABILITIES:
> +        /*
> +         * Set RSBA if present on any of the input values to notice the guest
> +         * might run on vulnerable hardware at some point.
> +         */
> +        val |= (val1 | val2) & ARCH_CAPS_RSBA;
> +        break;
> +    }
> +
> +    return val;
> +}
> +
> +static bool level_leaf(xen_cpuid_leaf_t *l1, xen_cpuid_leaf_t *l2,

const (twice)?

> +                       xen_cpuid_leaf_t *out)
> +{
> +    *out = (xen_cpuid_leaf_t){ };
> +
> +    switch ( l1->leaf )
> +    {
> +    case 0x1:
> +    case 0x80000001:
> +        out->c = l1->c & l2->c;
> +        out->d = l1->d & l2->d;
> +        return true;
> +
> +    case 0xd:
> +        if ( l1->subleaf != 1 )
> +            break;
> +        out->a = l1->a & l2->a;
> +        return true;

Could you explain your thinking behind this (a code comment would
likely help)? You effectively discard everything except subleaf 1
by returning false in that case, don't you?

> +    case 0x7:
> +        switch ( l1->subleaf )
> +        {
> +        case 0:
> +            out->b = l1->b & l2->b;
> +            out->c = l1->c & l2->c;
> +            out->d = l1->d & l2->d;
> +            return true;
> +
> +        case 1:
> +            out->a = l1->a & l2->a;
> +            return true;
> +        }
> +        break;

Can we perhaps assume all subleaves here are going to hold flags,
and hence and both sides together without regard to what subleaf
we're actually dealing with (subleaf 1 remaining special as to
EAX of course)? This would avoid having to remember to make yet
another mechanical change when enabling a new subleaf.

> +    case 0x80000007:
> +        out->d = l1->d & l2->d;
> +        return true;
> +
> +    case 0x80000008:
> +        out->b = l1->b & l2->b;
> +        return true;
> +    }
> +
> +    return false;
> +}

Considering your LFENCE-always-serializing patch, I assume
whichever ends up going in last will take care of adding handling
of that leaf here?

Jan

