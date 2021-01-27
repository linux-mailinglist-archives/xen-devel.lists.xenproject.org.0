Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B438F305F32
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 16:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76142.137263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4mVt-0008AY-Pb; Wed, 27 Jan 2021 15:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76142.137263; Wed, 27 Jan 2021 15:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4mVt-0008AB-MT; Wed, 27 Jan 2021 15:13:45 +0000
Received: by outflank-mailman (input) for mailman id 76142;
 Wed, 27 Jan 2021 15:13:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4mVs-0008A6-Ga
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:13:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d09673f-5e76-4b3e-bb26-3aa2daf7ee9d;
 Wed, 27 Jan 2021 15:13:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0FA06B9A4;
 Wed, 27 Jan 2021 15:13:42 +0000 (UTC)
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
X-Inumbo-ID: 4d09673f-5e76-4b3e-bb26-3aa2daf7ee9d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611760422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XMef36u5sVK24Kk9AzAkvymgk7DihkA8Kmk+XWGlGoo=;
	b=PKJzhD6ywoZMupVMnC1ewtHqUQ9PcMIHKetfK6ie+eZ+rj7km9TamgJYBtSsJCKJOYkbG0
	XB362e04k1dlcntXvkpQvqqldhkADzkkUFSIS2z02vGT/EqBsBXf1ZcGxFohOEP201T2PT
	GIWwkGadB5kQAPpKt5X1lpQgFWYYYRQ=
Subject: Re: [PATCH] x86/shadow: replace stale literal numbers in
 hash_{vcpu,domain}_foreach()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <035e3959-d15b-e897-1c57-9ff713d64da3@suse.com>
Message-ID: <070fc354-258b-6a93-34fe-af3dcece3be1@suse.com>
Date: Wed, 27 Jan 2021 16:13:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <035e3959-d15b-e897-1c57-9ff713d64da3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 12:07, Jan Beulich wrote:
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -1623,6 +1623,9 @@ void shadow_hash_delete(struct domain *d
>  typedef int (*hash_vcpu_callback_t)(struct vcpu *v, mfn_t smfn, mfn_t other_mfn);
>  typedef int (*hash_domain_callback_t)(struct domain *d, mfn_t smfn, mfn_t other_mfn);
>  
> +#define HASH_CALLBACKS_CHECK(mask) \
> +    BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)

Sadly at least with Clang5 this doesn't work for some of the uses
further down, e.g. ...

> @@ -2009,6 +2012,7 @@ int sh_remove_write_access(struct domain
>          perfc_incr(shadow_writeable_bf_1);
>      else
>          perfc_incr(shadow_writeable_bf);
> +    HASH_CALLBACKS_CHECK(callback_mask);

... this one. I've made it

#ifndef __clang__ /* At least some versions dislike some of the uses. */
#define HASH_CALLBACKS_CHECK(mask) \
    BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
#else
#define HASH_CALLBACKS_CHECK(mask) ((void)(mask))
#endif

for the time being - if anyone has any better idea, I'll be
happy to take suggestions.

Jan

