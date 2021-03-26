Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4006734A5E6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 11:55:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101683.194611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPk7o-0003G8-Ux; Fri, 26 Mar 2021 10:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101683.194611; Fri, 26 Mar 2021 10:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPk7o-0003Fm-Rm; Fri, 26 Mar 2021 10:55:32 +0000
Received: by outflank-mailman (input) for mailman id 101683;
 Fri, 26 Mar 2021 10:55:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G+eI=IY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPk7m-0003Ff-Rl
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 10:55:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9419c948-3b05-460a-ab58-31bf779fe86c;
 Fri, 26 Mar 2021 10:55:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62543AB8A;
 Fri, 26 Mar 2021 10:55:29 +0000 (UTC)
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
X-Inumbo-ID: 9419c948-3b05-460a-ab58-31bf779fe86c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616756129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x4ye35p8iI77ZWL2d2uBi15fDWKhM+M8p1v665Zat/I=;
	b=rDGJe3rsrNqUXrMmdIWQetls3jON4zPUdTBJ4C0uzYuD21ULW7F52GLIk1+84wYZT9Ysz3
	6lh2BVmanig8Iw1wSdnM4ncgd3s3R6yh0le0SsP0ZxUCM+vq3hfJP+aoflJQpQ3h1TKo5W
	HgUyW5AdjGV0oC/Qi/zpSl+naFwaXSM=
Subject: Re: [PATCH 1/2] x86/hpet: Factor
 hpet_enable_legacy_replacement_mode() out of hpet_setup()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210325165224.10306-1-andrew.cooper3@citrix.com>
 <20210325165224.10306-2-andrew.cooper3@citrix.com>
 <3ef41d04-cff0-5828-8373-af5f42a4f857@suse.com>
 <db791e8b-0070-60d4-811a-80004caae1c3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d728e77-e0ff-5b92-e3c9-cfadcdf6380c@suse.com>
Date: Fri, 26 Mar 2021 11:55:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <db791e8b-0070-60d4-811a-80004caae1c3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.03.2021 11:53, Andrew Cooper wrote:
> On 26/03/2021 09:59, Jan Beulich wrote:
>> On 25.03.2021 17:52, Andrew Cooper wrote:
>>> +bool __init hpet_enable_legacy_replacement_mode(void)
>>> +{
>>> +    unsigned int id, cfg, c0_cfg, ticks, count;
>>> +
>>> +    if ( !hpet_rate ||
>> I think you need to also honor opt_hpet here.
> 
> Can't (order of patches), and also no need.
> 
> When opt_hpet is introduced, hpet_rate can't become nonzero without
> opt_hpet being set.

Oh, right, sorry: I did mix up hpet_address and hpet_rate.

Jan

