Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4662A0316
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 11:43:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15635.38667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYRsA-0003C1-TY; Fri, 30 Oct 2020 10:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15635.38667; Fri, 30 Oct 2020 10:43:06 +0000
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
	id 1kYRsA-0003Bf-QJ; Fri, 30 Oct 2020 10:43:06 +0000
Received: by outflank-mailman (input) for mailman id 15635;
 Fri, 30 Oct 2020 10:43:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYRs9-0003Ba-HW
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:43:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47e85cac-885d-43bf-a877-71b8481b88d9;
 Fri, 30 Oct 2020 10:43:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4424AB0E;
 Fri, 30 Oct 2020 10:43:03 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYRs9-0003Ba-HW
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:43:05 +0000
X-Inumbo-ID: 47e85cac-885d-43bf-a877-71b8481b88d9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 47e85cac-885d-43bf-a877-71b8481b88d9;
	Fri, 30 Oct 2020 10:43:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604054583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ms46VkNFTYsaIEUeaYqWz9shxarDl+uRmlHR8UyRFuY=;
	b=sjgL6gWPOZMWM2lLTtfwALSMPsZzu5r1WdUtK21l7CCNpBNfaRD4bxxYcSk7iLRzxYvm4/
	Q4Q8ufGNAch2k4YViLmHRSuB61V8hmP2nQIx7gHCZgMYpV7gSGFV4scn4w+Gejk8upm0i7
	M0SYi5DrELWSm2vyMB4pnZL83fB8gA8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A4424AB0E;
	Fri, 30 Oct 2020 10:43:03 +0000 (UTC)
Subject: Re: [PATCH v2 2/8] evtchn: replace FIFO-specific header by generic
 private one
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <3fea358e-d6d1-21d4-2d83-d9bd457ba3b5@suse.com>
 <c330d6e3-04da-9bf2-5634-b6b2961c18db@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <34db0b62-8442-5d3e-3e55-799f8683c8a5@suse.com>
Date: Fri, 30 Oct 2020 11:42:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <c330d6e3-04da-9bf2-5634-b6b2961c18db@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.10.2020 11:21, Julien Grall wrote:
> On 20/10/2020 15:08, Jan Beulich wrote:
>> Having a FIFO specific header is not (or at least no longer) warranted
>> with just three function declarations left there. Introduce a private
>> header instead, moving there some further items from xen/event.h.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks; perhaps you didn't notice this went in already?

>> ---
>> v2: New.
>> ---
>> TBD: If - considering the layering violation that's there anyway - we
>>       allowed PV shim code to make use of this header, a few more items
>>       could be moved out of "public sight".
> 
> Are you referring to PV shim calling function such as evtchn_bind_vcpu()?

Yes.

Jan

