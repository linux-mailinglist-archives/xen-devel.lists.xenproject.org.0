Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A89319C45
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 11:05:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84183.157872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAVJj-0001w5-Co; Fri, 12 Feb 2021 10:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84183.157872; Fri, 12 Feb 2021 10:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAVJj-0001vg-9G; Fri, 12 Feb 2021 10:04:51 +0000
Received: by outflank-mailman (input) for mailman id 84183;
 Fri, 12 Feb 2021 10:04:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aDps=HO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lAVJi-0001vb-6h
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 10:04:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e113424-8bbc-4c53-adb8-9159cae6f91a;
 Fri, 12 Feb 2021 10:04:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39AC9AD62;
 Fri, 12 Feb 2021 10:04:48 +0000 (UTC)
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
X-Inumbo-ID: 7e113424-8bbc-4c53-adb8-9159cae6f91a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613124288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmqpPX+DR/iDGR2SbURgyzodLSeFR0CivBL/vqX8vw8=;
	b=bKYws4UbV2h2BuEIeewK23BraG2q8qjq5lxO4sHOB9cmbvoo5WyIWnbw3/zD/Zpgal1l4H
	YF7jDp6o+HAwO5y3e8aGuPWjk018Vr5Mv5+5MPJm2pT+60iIAidmik0QoxfSzCmyIOHubQ
	+MP1sHWIM50+M7de7UfkYrCR8rq9CfI=
Subject: Re: [PATCH HVM v2 1/1] hvm: refactor set param
To: Norbert Manthey <nmanthey@amazon.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20210205203905.8824-1-nmanthey@amazon.de>
 <edf1cd78-2192-2679-9a34-804c5d7b75c5@suse.com>
 <ba146cd6-fd5a-78d8-40bc-59885d265f5f@amazon.de>
 <b8529792-3d99-2e0d-7ebe-31c2c406145f@suse.com>
 <9f753ee9-73c5-aa2c-3c68-eed7e0c2608b@amazon.de>
 <a52cb2ac-fa85-73cd-0c53-3ee002d6b3ea@suse.com>
 <adee7548-0a60-d7d1-731f-474a585edf6c@amazon.de>
 <1a50a8c3-44f5-9ea9-7ff1-0d716bc05ebd@suse.com>
 <d2a5c3a5-d163-3ee9-50ff-0083bd52c374@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a48464da-659a-1dea-0b1f-fdd264b1db69@suse.com>
Date: Fri, 12 Feb 2021 11:04:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d2a5c3a5-d163-3ee9-50ff-0083bd52c374@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.02.2021 21:46, Norbert Manthey wrote:
> I agree with the symmetry for get and set. This is what I'd aim for:
> 
>  1. hvmop_set_param and hvmop_get_param (static) both check for the
> index, and afterwards use the is_hvm_domain(d) function with its barrier
>  2. hvm_set_param (static) and hvm_get_param both call their allow
> helper function, evaluate the return code, and afterwards block speculation.
>  2.1. hvm_get_param is declared in a public header, and cannot be turned
> into a static function, hence needs the index check

But both further call sites are in bounded loops, with the bounds not
guest controlled. It can rely on the callers just as much as ...

>  2.2. hvm_set_param is only called from hvmop_set_param, and index is
> already checked there, hence, do not add check

... this.

>  3. hvm_allow_set_param (static) and hvm_allow_get_param (static) do not
> validate the index parameter
>  3.1. hvm_allow_set_param blocks speculative execution with a barrier
> after domain permissions have been evaluated, before accessing the
> parameters of the domain. hvm_allow_get_param does not access the params
> member of the domain, and hence does not require additional protection.
> 
> To simplify the code, I propose to furthermore make the hvmop_set_param
> function static as well.

Yes - this not being so already is likely simply an oversight,
supported by the fact that there's no declaration in any header.

Jan

