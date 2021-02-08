Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6B53134F7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 15:22:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82887.153285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l97QG-0008L8-SK; Mon, 08 Feb 2021 14:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82887.153285; Mon, 08 Feb 2021 14:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l97QG-0008Ki-OP; Mon, 08 Feb 2021 14:21:52 +0000
Received: by outflank-mailman (input) for mailman id 82887;
 Mon, 08 Feb 2021 14:21:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l97QF-0008KZ-2L
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 14:21:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b015e4c-4d40-4fbb-9b25-9866d05e91bd;
 Mon, 08 Feb 2021 14:21:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4039ACBA;
 Mon,  8 Feb 2021 14:21:47 +0000 (UTC)
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
X-Inumbo-ID: 6b015e4c-4d40-4fbb-9b25-9866d05e91bd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612794108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T/tXhAtjyVPDUEpJlzuULewsT31oSoNMA2AySuTm43Q=;
	b=g5Lk1qraSxYF63Nmxkk1TIzRAk+ejM3Z1XIJqkm+08MwNv+LkJohHTwTM0nAvilZK7u50y
	a2srTc0/soeUyjO61jeURD6zb1zMpdDWCW/TwVmuVhk1jVQlOp0qoyA8x98hTl4nG0gr9v
	oYMC7i5UekIj3vTGYyPskNUQciQT32w=
Subject: Re: [PATCH HVM v2 1/1] hvm: refactor set param
To: Norbert Manthey <nmanthey@amazon.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20210205203905.8824-1-nmanthey@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <edf1cd78-2192-2679-9a34-804c5d7b75c5@suse.com>
Date: Mon, 8 Feb 2021 15:21:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210205203905.8824-1-nmanthey@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.02.2021 21:39, Norbert Manthey wrote:
> To prevent leaking HVM params via L1TF and similar issues on a
> hyperthread pair, let's load values of domains as late as possible.
> 
> Furthermore, speculative barriers are re-arranged to make sure we do not
> allow guests running on co-located VCPUs to leak hvm parameter values of
> other domains.
> 
> This is part of the speculative hardening effort.
> 
> Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
> Reported-by: Hongyan Xia <hongyxia@amazon.co.uk>

Did you lose Ian's release-ack, or did you drop it for a specific
reason?

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4060,7 +4060,7 @@ static int hvm_allow_set_param(struct domain *d,
>                                 uint32_t index,
>                                 uint64_t new_value)
>  {
> -    uint64_t value = d->arch.hvm.params[index];
> +    uint64_t value;
>      int rc;
>  
>      rc = xsm_hvm_param(XSM_TARGET, d, HVMOP_set_param);
> @@ -4108,6 +4108,13 @@ static int hvm_allow_set_param(struct domain *d,
>      if ( rc )
>          return rc;
>  
> +    if ( index >= HVM_NR_PARAMS )
> +        return -EINVAL;
> +
> +    /* Make sure we evaluate permissions before loading data of domains. */
> +    block_speculation();
> +
> +    value = d->arch.hvm.params[index];
>      switch ( index )
>      {
>      /* The following parameters should only be changed once. */

I don't see the need for the heavier block_speculation() here;
afaict array_access_nospec() should do fine. The switch() in
context above as well as the switch() further down in the
function don't have any speculation susceptible code.

Furthermore the first switch() doesn't use "value" at all, so
you could move the access even further down. This may have the
downside of adding latency, so may not be worth it, but in
this case at least the description should say half a word,
especially seeing it say "as late as possible" right now.

> @@ -4141,6 +4148,9 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>      if ( rc )
>          return rc;
>  
> +    /* Make sure we evaluate permissions before loading data of domains. */
> +    block_speculation();
> +
>      switch ( index )
>      {
>      case HVM_PARAM_CALLBACK_IRQ:

Like you do for the "get" path I think this similarly renders
pointless the use in hvmop_set_param() (and - see below - the
same consideration wrt is_hvm_domain() applies).

> @@ -4388,6 +4398,10 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value)
>      if ( rc )
>          return rc;
>  
> +    /* Make sure the index bound check in hvm_get_param is respected, as well as
> +       the above domain permissions. */
> +    block_speculation();

Nit: Please fix comment style here.

> @@ -4428,9 +4442,6 @@ static int hvmop_get_param(
>      if ( a.index >= HVM_NR_PARAMS )
>          return -EINVAL;
>  
> -    /* Make sure the above bound check is not bypassed during speculation. */
> -    block_speculation();
> -
>      d = rcu_lock_domain_by_any_id(a.domid);
>      if ( d == NULL )
>          return -ESRCH;

This one really was pointless anyway, as is_hvm_domain() (used
down from here) already contains a suitable barrier.

Jan

