Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40C631646D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 11:57:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83515.155626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nA5-0005bx-Mx; Wed, 10 Feb 2021 10:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83515.155626; Wed, 10 Feb 2021 10:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nA5-0005bY-Jw; Wed, 10 Feb 2021 10:55:57 +0000
Received: by outflank-mailman (input) for mailman id 83515;
 Wed, 10 Feb 2021 10:55:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9nA4-0005bT-LY
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 10:55:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3c4871c-146c-4887-be25-b11a40a2fbe6;
 Wed, 10 Feb 2021 10:55:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C203AD29;
 Wed, 10 Feb 2021 10:55:54 +0000 (UTC)
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
X-Inumbo-ID: d3c4871c-146c-4887-be25-b11a40a2fbe6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612954554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pJlrZxV5uLKWdS54+s0REJOsOKX7+hJYzquZXRubllI=;
	b=Hy+R/SqvMSf9zxjrNKxVldv9DFrpKUqkc0WP3sVXgOfYA86jtyVhd7tCTIrQQzK7VYI4DW
	qUZWxJHxIORUPNZwYp1uX5LB+a51QmmnjLnto/ZbtiA1Bb0mTT1OQTZOUTnsCbaO51PzWJ
	uq8W8YQNUxiDa1pLYXAFSZyddFIY6Y0=
Subject: Re: [PATCH for-4.15] x86/ucode/amd: Handle length sanity check
 failures more gracefully
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210209214911.18461-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <87d6982a-00d9-3daa-ebd7-9afb8ee60126@suse.com>
Date: Wed, 10 Feb 2021 11:55:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209214911.18461-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.02.2021 22:49, Andrew Cooper wrote:
> Currently, a failure of verify_patch_size() causes an early abort of the
> microcode blob loop, which in turn causes a second go around the main
> container loop, ultimately failing the UCODE_MAGIC check.
> 
> First, check for errors after the blob loop.  An error here is unrecoverable,
> so avoid going around the container loop again and printing an
> unhelpful-at-best error concerning bad UCODE_MAGIC.
> 
> Second, split the verify_patch_size() check out of the microcode blob header
> check.  In the case that the sanity check fails, we can still use the
> known-to-be-plausible header length to continue walking the container to
> potentially find other applicable microcode blobs.

Since the code comment you add further clarifies this, if my
understanding here is correct that you don't think we should
mistrust the entire container in such a case ...

> Before:
>   (XEN) microcode: Bad microcode data
>   (XEN) microcode: Wrong microcode patch file magic
>   (XEN) Parsing microcode blob error -22
> 
> After:
>   (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa000
>   (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa010
>   (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa011
>   (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa200
>   (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa210
>   (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa500
>   (XEN) microcode: couldn't find any matching ucode in the provided blob!
> 
> Fixes: 4de936a38a ("x86/ucode/amd: Rework parsing logic in cpu_request_microcode()")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

After all we're trying to balance between detecting broken
containers and having wrong constants ourselves. Personally
I'd be more inclined to err on the safe side and avoid
further loading attempts, but I can see the alternative
perspective also being a reasonable one.

Jan

