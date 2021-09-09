Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E2405B28
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 18:45:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183398.331547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONAW-0004ZQ-MB; Thu, 09 Sep 2021 16:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183398.331547; Thu, 09 Sep 2021 16:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONAW-0004Wi-J7; Thu, 09 Sep 2021 16:44:56 +0000
Received: by outflank-mailman (input) for mailman id 183398;
 Thu, 09 Sep 2021 16:44:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNcr=N7=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mONAV-0004Wc-5D
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:44:55 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16e29bf0-368f-4ebc-bef9-f64169265700;
 Thu, 09 Sep 2021 16:44:54 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631205885476839.4236945617671;
 Thu, 9 Sep 2021 09:44:45 -0700 (PDT)
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
X-Inumbo-ID: 16e29bf0-368f-4ebc-bef9-f64169265700
ARC-Seal: i=1; a=rsa-sha256; t=1631205891; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SK4bv8DeioH6F7i7aFydxxpqV1FWfgs3Esu+32B3hrDQsKkjOiCmDbbKZifpdGgaJ3vJzsFNElKx4sRr8spE97PQjv6tepg1o3txzdoBs5VlXPv9bbtgkiUm6J09hu/Mhji8fwAhJ5y66RiQQDFaafKK+TpwziE9krIsEXJUVxw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631205891; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=fjPStVlaqAWOklvbdsZb4F02NclSWm/Ozl/EFyCNWKU=; 
	b=Aru+lYZ8MO0rs2p9iQFc4vjtwU2RXuN9NAw93f4753OhLyDQJAZsDL76/zqwT+j6UyIWzQPflQ0XYb/drsxTCo6L2Bv6mg2TQMn+Y6W/mbNndV2imE+uigaZJyHz9x0Mgdq98WhWUtQCg4pEh8FUH7JAGTESs1731WKkPrMki5g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631205891;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fjPStVlaqAWOklvbdsZb4F02NclSWm/Ozl/EFyCNWKU=;
	b=chsmgXgqVBUdic7ccu1+NuUAdqrr70517xxDfRj9TuzGttFoaZwUdwQqiCCQRyvi
	rCBEKQMKZCr8dbkwtHFRZ+NhV++0DgKCKG691E9QF8O0IsnCKUrxheSY43+FzBfbwe9
	OijEd5BJwAYdI6qgUmAu1Qj7R6PG+QgQYZIfvFks=
Subject: Re: [PATCH v4 08/11] xsm: drop generic event channel labeling
 exclusion
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-9-dpsmith@apertussolutions.com>
 <e920645a-ffda-c8e5-ea81-c5a607e0bcbf@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <ea93a0f6-9b36-10b6-4c10-333b736d2a6c@apertussolutions.com>
Date: Thu, 9 Sep 2021 12:44:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e920645a-ffda-c8e5-ea81-c5a607e0bcbf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/9/21 11:35 AM, Jan Beulich wrote:
> On 03.09.2021 21:06, Daniel P. Smith wrote:
>> The internal define flag is not used by any XSM module, removing the #ifdef
>> leaving the generic event channel labeling as always present.
> 
> Already on v2 I did ask
> 
> "I'm not fully convinced of this removal: Does it get in the way of
>  anything?"
> 
> I have no record of getting reply, so I'm still wondering.

I can't find any email record of it but I know I made this change
because of a request to drop XSM_NEED_GENERIC_EVTCHN_SSID since it is
completely unused. Honestly I am not concerned on whether this
completely unused field is kept or not that is behind a flag that is
never set but it clearly is concerning for you, so I will just drop this
for now.

v/r,
dps

