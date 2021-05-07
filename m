Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1C637643E
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 13:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123953.233904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyIV-00024j-2O; Fri, 07 May 2021 11:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123953.233904; Fri, 07 May 2021 11:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyIU-00022t-Vf; Fri, 07 May 2021 11:05:30 +0000
Received: by outflank-mailman (input) for mailman id 123953;
 Fri, 07 May 2021 11:05:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rJTn=KC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leyIT-00022U-0m
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 11:05:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9e669a8-3455-434f-8d5e-3bfbaa0c222d;
 Fri, 07 May 2021 11:05:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3AEECB12E;
 Fri,  7 May 2021 11:05:27 +0000 (UTC)
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
X-Inumbo-ID: e9e669a8-3455-434f-8d5e-3bfbaa0c222d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620385527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vAWwMOVydF5C6C3DO/eQffg1CVqJ31VXlO2j7bmLIZU=;
	b=aGV+bFRiL8P7XGPNKS1XIlBkONvbsQqDl3Gg23QJd1KLUX7FqAiEnamYUTvXDIDPNP6Ulv
	Xw/Z0m/SUhh9d5itnef5AhdU7ztw8Wx9ISp+rb609rVjrqKAsyP0FCkfFHFtuXFihu5ssT
	V0wTQxE8XYMuWN+xmrsSnuWLWtyMr+A=
Subject: Re: [PATCH v2] SUPPORT.md: Un-shimmed 32-bit PV guests are no longer
 supported
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jann Horn <jannh@google.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20210506124752.65844-1-george.dunlap@citrix.com>
 <YJUVx8WMn/4f0gMS@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a61c24d-4bd3-c6af-7297-7a3b7bcd90b8@suse.com>
Date: Fri, 7 May 2021 13:05:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJUVx8WMn/4f0gMS@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.05.2021 12:26, Roger Pau Monné wrote:
> On Thu, May 06, 2021 at 01:47:52PM +0100, George Dunlap wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -55,7 +55,7 @@ config PV
>>  config PV32
>>  	bool "Support for 32bit PV guests"
>>  	depends on PV
>> -	default y
>> +	default PV_SHIM
>>  	select COMPAT
>>  	---help---
>>  	  The 32bit PV ABI uses Ring1, an area of the x86 architecture which
>> @@ -67,7 +67,10 @@ config PV32
>>  	  reduction, or performance reasons.  Backwards compatibility can be
>>  	  provided via the PV Shim mechanism.
>>  
>> -	  If unsure, say Y.
>> +	  Note that outside of PV Shim, 32-bit PV guests are not security
>> +	  supported anymore.
>> +
>> +	  If unsure, use the default setting.
> 
> While not opposed to this, I wonder whether we should give people some
> time to adapt. We have in the past not blocked vulnerable
> configurations by default (ie: the smt stuff for example).
> 
> It might be less disruptive for users to start by printing a warning
> message at boot (either on the serial for dom0 or in the toolstack for
> domU) and switch the default Kconfig slightly later?

But by changing the default we don't disrupt anyone or anything. Or
are you suggesting people really caring about Xen build it with the
default config without even looking?

> Note I don't have any specific interest in 32bit PV, so I'm not going
> to argue strongly against this if everyone else is fine with it.
> 
> I also wonder whether xl shouldn't try to boot PV 32bit guests by
> default using the shim now if the hypervisor has been built without
> CONFIG_PV32, or at least print a message so users know how to deal
> with the fallout.

I, too, have been considering to suggest this. Iirc Andrew did already
point out that the error messages resulting from xl aren't really
helpful to understand what the problem is (iirc he said they claim an
out-of-memory situation).

Jan

