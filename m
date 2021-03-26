Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC0834A818
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101805.194946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmXa-0006ir-JU; Fri, 26 Mar 2021 13:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101805.194946; Fri, 26 Mar 2021 13:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmXa-0006iS-G0; Fri, 26 Mar 2021 13:30:18 +0000
Received: by outflank-mailman (input) for mailman id 101805;
 Fri, 26 Mar 2021 13:30:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G+eI=IY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPmXZ-0006iN-2b
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:30:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 273889a5-b042-458c-80a1-6e63964ca43f;
 Fri, 26 Mar 2021 13:30:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52C42AB8A;
 Fri, 26 Mar 2021 13:30:15 +0000 (UTC)
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
X-Inumbo-ID: 273889a5-b042-458c-80a1-6e63964ca43f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616765415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kYAGONEfrXOTEzejsd+iopZPq0beT5W/vMevZDvgwvE=;
	b=K6a31O6ITTv7AtGVyFJyrQGuRAD4kqOl7zWK61o8yzWghrQiJO6YYEmxf+yLyWlCG3sIjG
	mHeQd41UdWprkNIxPJieGfmY74Bh80/9X1fOnMg6K2uSOT1SY21S157pB0zhfD+3/rQXsD
	L4hh5pIxeikZb+xgMZOgMkcJHuC316A=
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com>
 <24669.52641.499147.88002@mariner.uk.xensource.com>
 <24669.54213.173154.400771@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e768ad29-55e3-945a-f398-05050b46e927@suse.com>
Date: Fri, 26 Mar 2021 14:30:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <24669.54213.173154.400771@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.03.2021 13:29, Ian Jackson wrote:
> I wrote:
>> I'm sorry, but I think it is too late for 4.15 to do this.  I prefer
>> Jan's patch which I have alread release-acked.
>>
>> Can someone qualified please provide a maintainer review for this,
>> ideally today ?
> 
> I asked Andrew on IRC:
> 
> 12:08 <Diziet> andyhhp__: Are you prepared to maintainer-ack Jan's
>                more-minimal hpet workaround approach ?
> 12:16 <andyhhp__> Diziet: honestly, no.  I don't consider that
>                   acceptable behaviour, and it is a fairly big "f you"
>                   (this was literally feedback I got in private) to
>                   the downstreams who've spent years trying to get us
>                   to fix this bug, and have now backported the first
>                   version.
> 12:16 <andyhhp__> I'm looking into the feedback on my series
> 12:17 <andyhhp__> one way or another, the moment we enter the fallback
>                   path for interrupt routing, something is very broken
>                   on the system
> 12:19 <andyhhp__> so the tradeoff is an unspecified bug on one ancient
>                   laptop which can't be tested now, vs 5 years of Atom
>                   CPUs, 2 years of latop CPUs, and the forthcoming
>                   Server line of Intel CPUs
> 12:19 <andyhhp__> or whatever other compromise we can work on
> 
> I'm sorry that this bug is going to continue to be not properly fixed.

Actually I had another thought here in the morning, but then didn't
write it down: While Andrew's approach indeed would (hopefully)
improve user experience, it'll reduce the incentive of actually
fixing the issue. Normally I might not be that concerned, but seeing
how long it took to even arrive at a workaround, I'm afraid now I am
concerned.

Jan

