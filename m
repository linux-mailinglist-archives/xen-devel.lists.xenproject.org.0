Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AA834A840
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:39:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101814.194973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmgL-0007Lf-PN; Fri, 26 Mar 2021 13:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101814.194973; Fri, 26 Mar 2021 13:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmgL-0007LG-M1; Fri, 26 Mar 2021 13:39:21 +0000
Received: by outflank-mailman (input) for mailman id 101814;
 Fri, 26 Mar 2021 13:39:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G+eI=IY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPmgJ-0007L9-JQ
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:39:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0a66730-7d1a-4491-9e7d-496f160e9dd1;
 Fri, 26 Mar 2021 13:39:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A66E2AB8A;
 Fri, 26 Mar 2021 13:39:17 +0000 (UTC)
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
X-Inumbo-ID: e0a66730-7d1a-4491-9e7d-496f160e9dd1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616765957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pCPWJcbclaFj04/M+Oba/L/qqLt0wmssGdbyv9KnPQM=;
	b=nJCEIAWeWxzRj484pWXdzZcU+8se59RN8CsQ63aViDlUAnCYYxfXckIqscIvZA7tY67MDS
	Mw2EzAqyZUxVmVCEkyiGlMXGJGVfh5yCMrF1ukqpCOcW1APcd9iBXgj2h8VQXY/OMHaoYC
	ebcq79IKQuWia1fZukBqv/T3I0brEbY=
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
To: Ian Jackson <iwj@xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com>
 <24669.52641.499147.88002@mariner.uk.xensource.com>
 <24669.54213.173154.400771@mariner.uk.xensource.com>
 <CABfawh=O1hdycEr0+=JXU6USZ8DAzQvKoXQOnRnoWL643FTa+g@mail.gmail.com>
 <24669.56958.383583.53595@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be87024c-3079-1b4f-5053-bb40bfab406a@suse.com>
Date: Fri, 26 Mar 2021 14:37:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <24669.56958.383583.53595@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.03.2021 14:15, Ian Jackson wrote:
> Tamas K Lengyel writes ("Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally"):
>> The problem from my perspective is that the end-users have no way to
>> determine when that boot option is needing to be set. Having an
>> installation step of "check if things explode when you reboot" is just
>> plain bad. Many times you don't even have access to a remote serial
>> console to check why Xen didn't boot. So that's not a realistic route
>> that can be taken. If Jan's patch is applied then the only thing I'll
>> be able to do is make all installations always-enable this option even
>> on systems that would have booted fine otherwise without it. It is
>> unclear if that has any downsides of its own and could very well just
>> kick the can down the road and lead to other issues.
> 
> Thanks for the clear explanation.
> 
> I think our options are:
> 
>  1. What is currently in xen.git#staging-4.15: some different set of
>     machines do not work (reliably? at all?), constituting a
>     regression on older hardware.
> 
>  2. Jan's patch, with the consequences you describe.  Constituing a
>     continued failure to properly support the newer hardware.
> 
>  3. Andy's patches which are not finished yet and are therefore high
>     risk.  Ie, delay the release.
> 
> Please let me know if you think this characterisation of the situation
> is inaccurate or misleading.
> 
> This is not a good set of options.
> 
> Of them, I still think I would choose (2).  But I would love it if
> someone were to come up with a better suggestion (perhaps a variant on
> one of the above).

TBH delaying the release for this specific problem should be seriously
considered imo. In principle I'm in favor of (3) of the above, if there
weren't the downsides I did mention in prior mails.

Jan

