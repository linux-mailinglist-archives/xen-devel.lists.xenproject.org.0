Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B536E7D6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 11:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119820.226530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2re-00048h-Cs; Thu, 29 Apr 2021 09:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119820.226530; Thu, 29 Apr 2021 09:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2re-00048K-9t; Thu, 29 Apr 2021 09:21:42 +0000
Received: by outflank-mailman (input) for mailman id 119820;
 Thu, 29 Apr 2021 09:21:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc2rd-00048F-Nr
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 09:21:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efa0eb8d-2f5d-436f-aca0-c8631e464765;
 Thu, 29 Apr 2021 09:21:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BAA2B139;
 Thu, 29 Apr 2021 09:21:40 +0000 (UTC)
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
X-Inumbo-ID: efa0eb8d-2f5d-436f-aca0-c8631e464765
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619688100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpgj3TFsXUoHUD8oolMPIq9zL7H+tsMnvs1tyZlY+zs=;
	b=UOqt0ewcilpZ6C6XOHscUlggywwxXwQN/Jh8PnL4QSPJ+tNchrdOkBrLCVqOq/fPVbkTU3
	oLU1y/M+8D+a0N0qZXyM7EHrgjhA+j8MoB+JreT8X13CmF5fZwCiGaDVOMOMTr2a/s9bXB
	EtlXL4QMvP8PhlLEE/ZhfvBH6gqnWQk=
Subject: Re: [PATCH] x86/AMD: also determine L3 cache size
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7ffeec9f-2ce4-9122-4699-32c3ffb06a5d@suse.com>
 <3ff79e34-da70-85c3-0324-efa50313d5b4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <487bed52-bd1d-ceee-a85a-9bed9aad4712@suse.com>
Date: Thu, 29 Apr 2021 11:21:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3ff79e34-da70-85c3-0324-efa50313d5b4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 16.04.2021 16:21, Andrew Cooper wrote:
> On 16/04/2021 14:20, Jan Beulich wrote:
>> For Intel CPUs we record L3 cache size, hence we should also do so for
>> AMD and alike.
>>
>> While making these additions, also make sure (throughout the function)
>> that we don't needlessly overwrite prior values when the new value to be
>> stored is zero.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I have to admit though that I'm not convinced the sole real use of the
>> field (in flush_area_local()) is a good one - flushing an entire L3's
>> worth of lines via CLFLUSH may not be more efficient than using WBINVD.
>> But I didn't measure it (yet).
> 
> WBINVD always needs a broadcast IPI to work correctly.
> 
> CLFLUSH and friends let you do this from a single CPU, using cache
> coherency to DTRT with the line, wherever it is.
> 
> 
> Looking at that logic in flush_area_local(), I don't see how it can be
> correct.  The WBINVD path is a decomposition inside the IPI, but in the
> higher level helpers, I don't see how the "area too big, convert to
> WBINVD" can be safe.
> 
> All users of FLUSH_CACHE are flush_all(), except two PCI
> Passthrough-restricted cases. MMUEXT_FLUSH_CACHE_GLOBAL looks to be
> safe, while vmx_do_resume() has very dubious reasoning, and is dead code
> I think, because I'm not aware of a VT-x capable CPU without WBINVD-exiting.

Besides my prior question on your reply, may I also ask what all of
this means for the patch itself? After all you've been replying to
the post-commit-message remark only so far.

Jan

