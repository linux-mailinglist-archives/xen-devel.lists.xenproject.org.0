Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877892A7B8A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 11:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19685.44947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kacPJ-0008Rc-D7; Thu, 05 Nov 2020 10:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19685.44947; Thu, 05 Nov 2020 10:22:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kacPJ-0008RD-9f; Thu, 05 Nov 2020 10:22:17 +0000
Received: by outflank-mailman (input) for mailman id 19685;
 Thu, 05 Nov 2020 10:22:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aHwt=EL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kacPI-0008R8-59
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 10:22:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da533cfd-0cc0-45b9-9036-151e8f4005b0;
 Thu, 05 Nov 2020 10:22:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6064CABE3;
 Thu,  5 Nov 2020 10:22:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aHwt=EL=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kacPI-0008R8-59
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 10:22:16 +0000
X-Inumbo-ID: da533cfd-0cc0-45b9-9036-151e8f4005b0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id da533cfd-0cc0-45b9-9036-151e8f4005b0;
	Thu, 05 Nov 2020 10:22:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604571734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PUazweBzSOrJ/GJtnh5fKJx+H3PsKPOK3TrRHz2M8Do=;
	b=g8u4xtmmSxsyeUKapvsSpqJ/z68+O0NRvdXLRN+mLyKJYCu6sMhsKfISkLCUwzWtutQbOK
	HedpTfikP1LfAaH6PKczmrcqCLNHP5WNdT0HAehndnI/r4tAV41aasjw0Ju1/BLSL0gSEK
	s6OlYHhHKKXnroDRu5Lv6NXayNgervI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6064CABE3;
	Thu,  5 Nov 2020 10:22:14 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] xen/x86: add nmi continuation framework
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201016085350.10233-1-jgross@suse.com>
 <20201016085350.10233-2-jgross@suse.com>
 <12640bbf-475c-3d74-9bb0-57befcadd626@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3b260972-4155-6c83-a4c3-21d096346337@suse.com>
Date: Thu, 5 Nov 2020 11:22:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <12640bbf-475c-3d74-9bb0-57befcadd626@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.10.20 15:33, Jan Beulich wrote:
> On 16.10.2020 10:53, Juergen Gross wrote:
>> Actions in NMI context are rather limited as e.g. locking is rather
>> fragile.
>>
>> Add a generic framework to continue processing in normal interrupt
>> context after leaving NMI processing.
>>
>> This is done by a high priority interrupt vector triggered via a
>> self IPI from NMI context, which will then call the continuation
>> function specified during NMI handling.
> 
> I'm concerned by there being just a single handler allowed, when
> the series already introduces two uses. A single NMI instance
> may signal multiple things in one go. At the very least we then
> need a priority, such that SERR could override oprofile.

A different approach could be not to introduce a generic interface,
but to explicitly call the continuation handlers in the interrupt
handler.

Instead of a function pointer, a parameter pointer and a busy
indicator (probably another function pointer) per cpu, we'd need for
now only a parameter value per cpu (for the oprofile case) and a
global flag (for the SERR case).

The downside would be having to add additional fields for other
use cases, but for now I think this could be the better way,
especially as this would remove the theoretical case of multiple
issues overwriting one another.

Thoughts?


Juergen

