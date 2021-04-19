Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C912D36479F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 18:01:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113094.215518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYWKY-0002L3-ET; Mon, 19 Apr 2021 16:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113094.215518; Mon, 19 Apr 2021 16:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYWKY-0002Kd-Aw; Mon, 19 Apr 2021 16:00:58 +0000
Received: by outflank-mailman (input) for mailman id 113094;
 Mon, 19 Apr 2021 16:00:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYWKW-0002KS-GA
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 16:00:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ec992a8-9bcc-4739-bfc7-1aab5a54da46;
 Mon, 19 Apr 2021 16:00:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 20672AF35;
 Mon, 19 Apr 2021 16:00:55 +0000 (UTC)
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
X-Inumbo-ID: 6ec992a8-9bcc-4739-bfc7-1aab5a54da46
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618848055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIuELSFZXR96S1oKPJlsusqOvaata/PLNROEUBemQI0=;
	b=vWT7MGFcfjVdSqxs5eXKGvUIxTHlZMJ6+Uv/Uhsc/CvV45jVWRyyMVHyC5PW+B/0lCu8K8
	PTz9NbmN+SgpY3Z9KLKv5SQ0+nbdto3eByLg6ayAh1R6pRf0hPjGMRTwp8lfzImDnubFNu
	YY8RPxg6lqngkqoXKLsgSxHtRwwxGRk=
Subject: Re: [PATCH] x86/shim: Simplify compat handling in write_start_info()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210419144524.32608-1-andrew.cooper3@citrix.com>
 <a048d155-085d-b942-40cc-00624b5bbd11@suse.com>
 <faff3047-66e3-0d6f-1878-e1dac47b7c06@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <398b912d-d19f-8321-815a-362c6da6d70d@suse.com>
Date: Mon, 19 Apr 2021 18:00:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <faff3047-66e3-0d6f-1878-e1dac47b7c06@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.04.2021 17:57, Andrew Cooper wrote:
> On 19/04/2021 16:55, Jan Beulich wrote:
>> On 19.04.2021 16:45, Andrew Cooper wrote:
>>> Factor out a compat boolean to remove the lfence overhead from multiple
>>> is_pv_32bit_domain() calls.
>>>
>>> For a compat guest, the upper 32 bits of rdx are zero, so there is no need to
>>> have any conditional logic at all when mapping the start info page.
>> Iirc the contents of the upper halves hold unspecified contents after
>> a switch from compat to 64-bit mode. Therefore only with this part of
>> the change dropped ...
> 
> But we're shim, so will never ever mix compat and non-compat guests.

That's not the point: A compat guest will still cause the CPU to
transition back and forth between 64-bit and compat modes. It is
this transitioning which leaves the upper halves of all GPRs in
undefined state (even if in reality a CPU would likely need to go
through extra hoops to prevent them from being zero if they were
written to in compat mode).

Jan

