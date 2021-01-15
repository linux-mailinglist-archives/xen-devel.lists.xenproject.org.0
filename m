Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CFD2F7710
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 11:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67933.121459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Mn3-0001bp-J2; Fri, 15 Jan 2021 10:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67933.121459; Fri, 15 Jan 2021 10:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Mn3-0001bQ-Fq; Fri, 15 Jan 2021 10:57:13 +0000
Received: by outflank-mailman (input) for mailman id 67933;
 Fri, 15 Jan 2021 10:57:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0Mn1-0001bL-IZ
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 10:57:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb7f680a-8705-4714-a8bf-c76c171f741e;
 Fri, 15 Jan 2021 10:57:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 24A80B818;
 Fri, 15 Jan 2021 10:57:10 +0000 (UTC)
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
X-Inumbo-ID: cb7f680a-8705-4714-a8bf-c76c171f741e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610708230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZY+OKNAB9OEjlGFT4uEWAZwVhfFnoTfhQixgbGPRxk=;
	b=Hnd4hxeGVVmBIYNLlcNOP8o4w6nLtDc3X4WFd2sU2f5CSQfJmu7zzELvm+xBLulMvPkkvW
	WBqsqFYJKdGJztptXorUo6RrMnK8S9E8KojUNqIoUwuKzpnHiRB9SZ8npHvBJKPp0bfajd
	6rNJHFOSt7XW5ew7nksgAibsal+XMxg=
Subject: Re: zstd compressed kernels
To: Michael Young <m.a.young@durham.ac.uk>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <1abcd9d-428f-93d-b63d-996ef4592723@austen3.home>
 <71d36766-1258-0a79-02ff-d888a41e431e@citrix.com>
 <6edb6c99-4289-b991-c767-333e376ce66@austen3.home>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e500ee3a-01fb-ac1b-5ea2-47fd0f2a67db@suse.com>
Date: Fri, 15 Jan 2021 11:57:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <6edb6c99-4289-b991-c767-333e376ce66@austen3.home>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.11.2020 00:01, Michael Young wrote:
> On Tue, 17 Nov 2020, Andrew Cooper wrote:
> 
>> If you're willing to have a go:
>>
>> For dom0 support, port Linux's decompressor into xen/common/ and plumb
>> it into xen/common/decompress.c
>>
>> For domU's, tools/libs/guest/xg_dom_bzimageloader.c and
>> xc_dom_probe_bzimage_kernel()
> 
> Here is what I have so far. It works for me with a dom0 boot, though only 
> after I reduced the the setting of the maximum decompressed size (out_len) 
> from LONG_MAX to INT_MAX. The patches aren't intended to be final, and I 
> suspect there may need to be adjustments for guest support.

As you will have seen, I've posted a series apparently doing this a
little differently, in particular without said LONG_MAX -> INT_MAX
transformation. While it works fine this way for me, it would be
nice if you could double check it also does for you.

Jan

