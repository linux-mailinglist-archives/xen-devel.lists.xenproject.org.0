Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C50CF325083
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 14:30:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89772.169387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGiW-0002vK-Nx; Thu, 25 Feb 2021 13:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89772.169387; Thu, 25 Feb 2021 13:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGiW-0002uv-KW; Thu, 25 Feb 2021 13:30:08 +0000
Received: by outflank-mailman (input) for mailman id 89772;
 Thu, 25 Feb 2021 13:30:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFGiU-0002r0-Rv
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:30:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 218ba7c9-98c4-4338-8d7d-a02680e17ccb;
 Thu, 25 Feb 2021 13:30:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7349CAFE5;
 Thu, 25 Feb 2021 13:30:05 +0000 (UTC)
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
X-Inumbo-ID: 218ba7c9-98c4-4338-8d7d-a02680e17ccb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614259805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FX88hhTm8JfiZk5Vqt5V+3Je8GJxn5GAdxqDaUUwqbo=;
	b=kahfCopJ8sBjEoty2zW8i6F8rbBQsf2+GS87QbFcSrDjlgAneQZoy1z87sKS8MQ6aUZUwE
	O0wTb5FRmmOBXGwO/jmjDPxew2F0QAVEMmCIAsyiMEKycfuWtFDEPDHgXkXmsF8Fppuwb2
	CeBN5izX9puxys+GBFioGaklk8cqPKg=
Subject: Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization
 without reserved bits
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
 <24631.41819.456811.665249@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1226b860-9027-f0e8-6f90-78ec2b57ca7f@suse.com>
Date: Thu, 25 Feb 2021 14:30:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24631.41819.456811.665249@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 14:17, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
>> When none of the physical address bits in PTEs are reserved, we can't
>> create any 4k (leaf) PTEs which would trigger reserved bit faults. Hence
>> the present SHOPT_FAST_FAULT_PATH machinery needs to be suppressed in
>> this case, which is most easily achieved by never creating any magic
>> entries.
>>
>> To compensate a little, eliminate sh_write_p2m_entry_post()'s impact on
>> such hardware.
>>
>> While at it, also avoid using an MMIO magic entry when that would
>> truncate the incoming GFN.
> 
> Judging by the description I'm not sure whether this is a bugfix, or
> a change to make it possible to run Xen on hardware where currently it
> doesn't work at all.

It's still a bug fix imo, even if the flawed assumption was harmless
so far.

> I assume "none of the physical address bits in PTEs are reserved" is
> a property of certain hardware, but it wasn't clear to me (i) whether
> such platforms currently exists

If they don't exist yet, they're soon to become available afaict.

> (ii) what the existing Xen code would do in this case.

If memory is populated at the top 4Gb of physical address space,
guests would gain access to that memory through these page table
entries, as those don't cause the expected faults to be raised
anymore (but instead get used for valid - from the hardware's
perspective - translations).

Jan

