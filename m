Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B77333BB5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 12:45:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96028.181469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJxGp-000279-Vl; Wed, 10 Mar 2021 11:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96028.181469; Wed, 10 Mar 2021 11:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJxGp-00026k-Sj; Wed, 10 Mar 2021 11:44:55 +0000
Received: by outflank-mailman (input) for mailman id 96028;
 Wed, 10 Mar 2021 11:44:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W5NQ=II=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJxGn-00026c-Vq
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 11:44:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fee16196-7ccc-43c5-923e-22017c082c88;
 Wed, 10 Mar 2021 11:44:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EAE3BAE84;
 Wed, 10 Mar 2021 11:44:51 +0000 (UTC)
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
X-Inumbo-ID: fee16196-7ccc-43c5-923e-22017c082c88
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615376692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hOEQCkeJ/+/P2yPKGORkXNcw/ht/1JPJikJ4OWj8K4=;
	b=vFyLWrzKR0sbJOr2/Hi9nfFjOY1mB0bsRQtCb6EsYiVsry3wdzkyckAylIa/zP48/h5slX
	f3dmNOpCdPWzTsQS14oTvZFUkAVDFLpMQ/YxBPoWzADY6WC5qHfEhNbzAeNZjHGoU7MRi3
	LPvfDMfubCAD6heKzSYdT5g+A8lEx8Q=
Subject: Re: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible
 MSR behavior selection
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210309105634.7200-1-roger.pau@citrix.com>
 <37e82170-8097-1eda-95d9-23d235075a67@suse.com>
 <4da62f0b-8a08-dd84-2040-fd55d74fd85a@citrix.com>
 <YEip7rg+AGCXF69j@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <184dbf6f-ddc7-b4aa-eee0-de35197283ef@suse.com>
Date: Wed, 10 Mar 2021 12:44:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEip7rg+AGCXF69j@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.03.2021 12:13, Roger Pau Monné wrote:
> On Tue, Mar 09, 2021 at 07:57:42PM +0000, Andrew Cooper wrote:
>> On 09/03/2021 11:36, Jan Beulich wrote:
>>> So what are your thoughts wrt my change to this file? Drop it
>>> altogether and require people to use this new option? Or do you
>>> see both coexist? In the latter case, since you had suggested
>>> that I drop the write side of my change - does your changing of
>>> the write path indicate you've changed your mind?
>>
>> I don't think we should legitimise buggy PV behaviour, either by
>> codifying in the ABI, or providing a knob beyond this one.
> 
> In that case - can we try to figure out which MSRs is PV Linux trying
> to access without having the #GP handler setup?
> 
> Maybe we can try to handle the ones we know the buggy Linux versions
> will try to access without having #GP setup?
> 
> I know it's not possible to test all possible Linux versions, but we
> could at least try to get the ones we know about fixed. Is the only
> offending one we know about MSR_K8_HWCR?

No, that was the secondary observation. The crash was when reading
MSR_K8_TSEG_ADDR. See my patch'es description.

Handling this on an MSR-by-MSR basis is what Andrew suggested when
I first posted that patch. I continue to not agree, because even if
we limited our auditing to just a single Linux version, how could
we be sure to catch all cases (including rarely taken paths)? IOW I
think auditing isn't a workable approach, and waiting for bug
reports isn't one either.

Jan

