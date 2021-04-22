Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0705C367C95
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 10:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115196.219671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUki-0005mw-Ml; Thu, 22 Apr 2021 08:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115196.219671; Thu, 22 Apr 2021 08:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUki-0005mX-IT; Thu, 22 Apr 2021 08:32:00 +0000
Received: by outflank-mailman (input) for mailman id 115196;
 Thu, 22 Apr 2021 08:31:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZUkg-0005mS-TH
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 08:31:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 664c74df-573b-489b-bd76-7ebe9fee989e;
 Thu, 22 Apr 2021 08:31:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D383AD80;
 Thu, 22 Apr 2021 08:31:57 +0000 (UTC)
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
X-Inumbo-ID: 664c74df-573b-489b-bd76-7ebe9fee989e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619080317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Itmj1dp0jX2qjPeM0M8JlSoAYgWKoD9M1ycMH63OQYY=;
	b=F37WVmwdpCK+X/rQmCbQWirxjRYK9Ed2TOa8K/JvUovkrHiGQKuUHDTqL7asM0CnnkHSdn
	uUyqCgdw3Gg9brY1auKlhPg/2IP1zzEwyGNRcytvGz+AquRqcKqZzyM5oA/Q+UprnhUu65
	zwUs3AMkNPch8cpw5EM08qTUmnjM8Hs=
Subject: Re: [PATCH v2 14/21] libs/guest: introduce helper to check cpu policy
 compatibility
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-15-roger.pau@citrix.com>
 <f20144fb-9ed5-1819-1d00-13506ba2178e@suse.com>
 <YIEyTZ5E1StTMIBk@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9349102e-7019-c6c3-3830-6374b47f314b@suse.com>
Date: Thu, 22 Apr 2021 10:31:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIEyTZ5E1StTMIBk@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.04.2021 10:22, Roger Pau Monné wrote:
> On Wed, Apr 14, 2021 at 03:36:54PM +0200, Jan Beulich wrote:
>> On 13.04.2021 16:01, Roger Pau Monne wrote:
>>> --- a/tools/libs/guest/xg_cpuid_x86.c
>>> +++ b/tools/libs/guest/xg_cpuid_x86.c
>>> @@ -925,3 +925,22 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
>>>  
>>>      return rc;
>>>  }
>>> +
>>> +bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
>>> +                                 const xc_cpu_policy_t guest)
>>> +{
>>> +    struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
>>> +    struct cpu_policy h = { &host->cpuid, &host->msr };
>>> +    struct cpu_policy g = { &guest->cpuid, &guest->msr };
>>> +    int rc = x86_cpu_policies_are_compatible(&h, &g, &err);
>>> +
>>> +    if ( !rc )
>>> +        return true;
>>> +
>>> +    if ( err.leaf != -1 )
>>> +        ERROR("Leaf %#x subleaf %#x is not compatible", err.leaf, err.subleaf);
>>> +    if ( err.msr != -1 )
>>> +        ERROR("MSR index %#x is not compatible", err.msr);
>>
>> Personally I'm against making assumptions like these ones about what
>> (in this case) INIT_CPU_POLICY_ERRORS actually expands to (i.e. three
>> times -1). I can see how alternatives to this are quickly going to
>> get ugly, so I'll leave it to others to judge.
> 
> Would you like me to define a separate POLICY_ERROR? ie:
> 
> #define INIT_CPU_POLICY_ERROR -1
> #define INIT_CPU_POLICY_ERRORS { INIT_CPU_POLICY_ERROR, \
>                                  INIT_CPU_POLICY_ERROR, \
>                                  INIT_CPU_POLICY_ERROR }

I would prefer this; I'm not sure (nit: properly parenthesized)
-1 is  the value to use though, considering the fields are unsigned.
I wonder what Andrew thinks, as he did introduce all of this.

> We already have a bunch of open coded -1 checks anyway, but might
> prevent new ones from appearing.

Indeed.

Jan

