Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2620B369253
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 14:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116279.221941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZv7n-0008LX-7T; Fri, 23 Apr 2021 12:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116279.221941; Fri, 23 Apr 2021 12:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZv7n-0008L8-4J; Fri, 23 Apr 2021 12:41:35 +0000
Received: by outflank-mailman (input) for mailman id 116279;
 Fri, 23 Apr 2021 12:41:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZv7m-0008L3-5g
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 12:41:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8e91387-2ff0-456f-9102-d8a6a9ba9337;
 Fri, 23 Apr 2021 12:41:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FDE2AEE6;
 Fri, 23 Apr 2021 12:41:32 +0000 (UTC)
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
X-Inumbo-ID: c8e91387-2ff0-456f-9102-d8a6a9ba9337
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619181692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BVXqAVlxN1DIDsUMgbfYFCdB+fBZrqicM6ufIbegZZU=;
	b=JeSOKFR/XMYtvEStzDY9K6yBYiJf3US6LS8r3aZRfCFFqOyHAb8pRM6toLBo59FADDK+io
	Xjukt13/nS0/kzJ+hoGjaEow5JuUUcLwAGVq/idwo8km+FOea8v3vnwIaNTk8FcVVVRsvK
	J/LCvq/qWDXnZFl0lrwZm4EdDQ8rmE8=
Subject: Re: [PATCH] x86/cpuid: do not expand max leaves on restore
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20210423105408.7265-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <91a32d56-c0cd-f883-eee5-de2691417703@suse.com>
Date: Fri, 23 Apr 2021 14:41:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423105408.7265-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.04.2021 12:54, Roger Pau Monne wrote:
> When restoring limit the maximum leaves to the ones supported by Xen
> 4.13 in order to not expand the maximum leaf a guests sees. Note this
> is unlikely to cause real issues.

Why 4.13 (and not 4.12) here when ...

> Guests restored from Xen versions 4.13 or greater will contain CPUID
> data on the stream that will override the values set by
> xc_cpuid_apply_policy.

... 4.13 already communicates the values?

> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -510,6 +510,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>          {
>              p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
>          }
> +
> +        /* Clamp maximum leaves to the supported ones on 4.13. */

Same aspect here then. (While not being a native speaker, it
would still seem to me that flipping "supported" and "ones"
would read slightly more clearly.)

> +        p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
> +        p->feat.max_subleaf = min(p->feat.max_subleaf, 1u);
> +        p->extd.max_leaf = min(p->extd.max_leaf, 0x1cu);
>      }

With this I think the comment ahead of the enclosing if() wants
either amending or moving immediately inside the if()'s body.

Jan

