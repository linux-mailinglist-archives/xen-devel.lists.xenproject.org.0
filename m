Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C70193735B9
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 09:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122815.231664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCAe-0003WP-SV; Wed, 05 May 2021 07:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122815.231664; Wed, 05 May 2021 07:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCAe-0003TW-OU; Wed, 05 May 2021 07:42:12 +0000
Received: by outflank-mailman (input) for mailman id 122815;
 Wed, 05 May 2021 07:42:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leCAd-0003TQ-DQ
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 07:42:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25167c04-4e5c-4942-be75-4ae7b7b966ae;
 Wed, 05 May 2021 07:42:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A78B3AF3E;
 Wed,  5 May 2021 07:42:09 +0000 (UTC)
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
X-Inumbo-ID: 25167c04-4e5c-4942-be75-4ae7b7b966ae
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620200529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zWsE1sxa136Lt1kOqw+xOkbfvzZsgPmokPr5KESenI=;
	b=eWj6MqDGg6giYvDvR45i8JPO8Anm/7o+MoNDpR8ilAoZ9hbue3+xXXtL86dEFOrCqlWumA
	JvIkk1r39dzvm7yfoggCDomxjvMA4pVgrMCp9oe9R8paAgtPsqAStOrK/wpQcrtV48RWzc
	ogc+ihj/C4KXMmfRLX36TyQmriIQccE=
Subject: Re: [PATCH v3 08/13] libs/guest: make a cpu policy compatible with
 older Xen versions
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-9-roger.pau@citrix.com>
 <51ee228a-2d53-2dd4-55cf-233d81ba4958@suse.com>
 <YJFpdA8qmYca9bUO@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6a3bc5cd-10a2-1d13-0033-c22d16da25b7@suse.com>
Date: Wed, 5 May 2021 09:42:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YJFpdA8qmYca9bUO@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.05.2021 17:34, Roger Pau Monné wrote:
> On Mon, May 03, 2021 at 01:09:41PM +0200, Jan Beulich wrote:
>> On 30.04.2021 17:52, Roger Pau Monne wrote:
>>> @@ -1086,3 +1075,42 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
>>>  
>>>      return rc;
>>>  }
>>> +
>>> +int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
>>> +                                  bool hvm)
>>
>> I'm concerned of the naming, and in particular the two very different
>> meanings of "compatible" for xc_cpu_policy_calc_compatible() and this
>> new one. I'm afraid I don't have a good suggestion though, short of
>> making the name even longer and inserting "backwards".
> 
> Would xc_cpu_policy_make_compat_412 be acceptable?
> 
> That's the more concise one I can think of.

Hmm, maybe (perhaps with an underscore inserted between 4 and 12). Yet
(sorry) a comment in the function says "since Xen 4.13", which includes
changes that have happened later. Therefore it's not really clear to me
whether the function really _only_ deals with the 4.12 / 4.13 boundary.

Jan

