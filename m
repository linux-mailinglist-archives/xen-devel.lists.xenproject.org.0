Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCF12F8061
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 17:15:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68417.122516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Rkl-0000ji-Pz; Fri, 15 Jan 2021 16:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68417.122516; Fri, 15 Jan 2021 16:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Rkl-0000jJ-MX; Fri, 15 Jan 2021 16:15:11 +0000
Received: by outflank-mailman (input) for mailman id 68417;
 Fri, 15 Jan 2021 16:15:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0Rkk-0000jE-8Z
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 16:15:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 157e5e0a-4fc8-447a-996c-e17602671bf4;
 Fri, 15 Jan 2021 16:15:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6CA20B746;
 Fri, 15 Jan 2021 16:15:08 +0000 (UTC)
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
X-Inumbo-ID: 157e5e0a-4fc8-447a-996c-e17602671bf4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610727308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nCoqWbT4N5D9TGFOzIXT7SexmYg2waTav+5OFQ38hEU=;
	b=vXs28Pla88UCXx0AvzvQ2yh3Nb+LAPdyanWhVB80RNDoADdTwU5b1L8Qvi5qxAKc8YJYgb
	Seqxavs76i98iaI7LdW3JTz05hRdi9B1pUekg2munwQayOpxcvc4RHRfzWpt9plySpzNdH
	vCLGhJ2xtw0Y+Jdp+fDanpdzLEW6J50=
Subject: Re: [PATCH v2 1/2] gnttab: adjust pin count overflow checks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <43168334-20af-a0ed-95ec-8eef5200877b@suse.com>
 <d37ac49d-5e36-6f35-be73-83f8e1e8f23e@suse.com>
 <5268886e-8b21-db35-9183-887570c0cb14@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08365945-4ba9-4835-cfa9-8eb14ec7a0ae@suse.com>
Date: Fri, 15 Jan 2021 17:15:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <5268886e-8b21-db35-9183-887570c0cb14@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.01.2021 16:38, Andrew Cooper wrote:
> On 15/01/2021 15:14, Jan Beulich wrote:
>> It's at least odd to check counters which aren't going to be
>> incremented, resulting in failure just because prior operations may
>> have left an entry in an unusual state.
> 
> I wouldn't say it's an unusual state.  It can happen legally when you
> map the same gref 128 times
> 
> Why a guest would do this in normal operation is a different question.

Hence the "unusual".

> Perhaps "prior operations may have reached the refcount limit" ?

Fine with me.

>>  And it's also not helpful to
>> use open-coded literal numbers in these checks.
>>
>> Calculate the increment values first and derive from them the mask to
>> use in the checks.
>>
>> Also move the pin count checks ahead of the calculation of the status
>> (and for copy also sha2) pointers: They're not needed in the failure
>> cases, and this way the compiler may also have an easier time keeping
>> the variables at least transiently in registers for the subsequent uses.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

