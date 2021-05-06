Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8687A37529E
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 12:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123433.232795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lebby-00076C-LE; Thu, 06 May 2021 10:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123433.232795; Thu, 06 May 2021 10:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lebby-00073k-Hk; Thu, 06 May 2021 10:52:06 +0000
Received: by outflank-mailman (input) for mailman id 123433;
 Thu, 06 May 2021 10:52:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EnkQ=KB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lebbx-00073e-ET
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 10:52:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66e85463-ec22-4a1b-a030-17644b6631dc;
 Thu, 06 May 2021 10:52:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A555AB1B9;
 Thu,  6 May 2021 10:52:03 +0000 (UTC)
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
X-Inumbo-ID: 66e85463-ec22-4a1b-a030-17644b6631dc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620298323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zk3yGUXMbAjoQwDbgENX+9tDnv1jIXSwj9GofSbqNjI=;
	b=rDsAM5lu29X0684YZjmZloEu9cQfb8oYPa/3el440JjAzvTHJKzTmW++tS9dq3VSzGsS1I
	vcfHKk8/+6FXzHiLchxn+oaxkZpkBPzctOjDuoRH8CIzQPI6PF5vdVCapqBp2DcAWl/889
	uS5XW7zPiJUiW1m7OSNwwNoJGlc/HkU=
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
 <6a3bc5cd-10a2-1d13-0033-c22d16da25b7@suse.com>
 <YJPDigyn0TFxDLT/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb9d62f1-eaf2-7fb0-2c2b-794317099e71@suse.com>
Date: Thu, 6 May 2021 12:52:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJPDigyn0TFxDLT/@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 06.05.2021 12:23, Roger Pau Monné wrote:
> On Wed, May 05, 2021 at 09:42:09AM +0200, Jan Beulich wrote:
>> On 04.05.2021 17:34, Roger Pau Monné wrote:
>>> On Mon, May 03, 2021 at 01:09:41PM +0200, Jan Beulich wrote:
>>>> On 30.04.2021 17:52, Roger Pau Monne wrote:
>>>>> @@ -1086,3 +1075,42 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
>>>>>  
>>>>>      return rc;
>>>>>  }
>>>>> +
>>>>> +int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
>>>>> +                                  bool hvm)
>>>>
>>>> I'm concerned of the naming, and in particular the two very different
>>>> meanings of "compatible" for xc_cpu_policy_calc_compatible() and this
>>>> new one. I'm afraid I don't have a good suggestion though, short of
>>>> making the name even longer and inserting "backwards".
>>>
>>> Would xc_cpu_policy_make_compat_412 be acceptable?
>>>
>>> That's the more concise one I can think of.
>>
>> Hmm, maybe (perhaps with an underscore inserted between 4 and 12). Yet
>> (sorry) a comment in the function says "since Xen 4.13", which includes
>> changes that have happened later. Therefore it's not really clear to me
>> whether the function really _only_ deals with the 4.12 / 4.13 boundary.
> 
> It should deal with any changes in the default cpuid policy that
> happened after (and not including) Xen 4.12. So resulting policy is
> compatible with the behaviour that Xen 4.12 had. Any changes made in
> Xen 4.13 and further versions should be accounted for here.

I see.

Jan

