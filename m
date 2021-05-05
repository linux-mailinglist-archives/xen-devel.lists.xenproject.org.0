Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80800373AC3
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 14:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123074.232150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGOu-0008WN-Nw; Wed, 05 May 2021 12:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123074.232150; Wed, 05 May 2021 12:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGOu-0008UH-Kk; Wed, 05 May 2021 12:13:12 +0000
Received: by outflank-mailman (input) for mailman id 123074;
 Wed, 05 May 2021 12:13:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1leGOs-0008UB-Eg
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 12:13:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leGOr-0000to-0A; Wed, 05 May 2021 12:13:09 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leGOq-0006sx-PX; Wed, 05 May 2021 12:13:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=tqhIAv4pX6PBB5WS4GGoRGak1M8/u1BgecNF+D+R/Kg=; b=c3ymz6Z/UD6sR3brUXBjmGWpbI
	/fxQaSO0NN+l/Lgsp0APPPRg1c0fVlkHbS3qg8UlOcFzX6cgunZYE9UvMM8edN09ETRb910HmCQrs
	aBFHS7izP4cHC1jE6K7vIXLwKeOcHNI4jqo0mAONgNluhq1W6wxZJw4T/MOkNwGuAuT0=;
Subject: Re: [PATCH v4] gnttab: defer allocation of status frame tracking
 array
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <74048f89-fee7-06c2-ffd5-6e5a14bdf440@suse.com>
 <4450085e-be97-a1ba-dbd8-c72468406fd5@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <af447491-c0bd-6fce-3c21-df4af95a1273@xen.org>
Date: Wed, 5 May 2021 13:13:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <4450085e-be97-a1ba-dbd8-c72468406fd5@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 05/05/2021 11:49, Andrew Cooper wrote:
> On 04/05/2021 09:42, Jan Beulich wrote:
>> This array can be large when many grant frames are permitted; avoid
>> allocating it when it's not going to be used anyway, by doing this only
>> in gnttab_populate_status_frames(). While the delaying of the respective
>> memory allocation adds possible reasons for failure of the respective
>> enclosing operations, there are other memory allocations there already,
>> so callers can't expect these operations to always succeed anyway.
>>
>> As to the re-ordering at the end of gnttab_unpopulate_status_frames(),
>> this is merely to represent intended order of actions (shrink array
>> bound, then free higher array entries). If there were racing accesses,
>> suitable barriers would need adding in addition.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Nack.
> 
> The argument you make says that the grant status frames is "large
> enough" to care about not allocating.  (I frankly disagree, but that
> isn't relevant to my to my nack).
> 
> The change in logic here moves a failure in DOMCTL_createdomain, to
> GNTTABOP_setversion.  We know, from the last minute screwups in XSA-226,
> that there are versions of Windows and Linux in the field, used by
> customers, which will BUG()/BSOD when GNTTABOP_setversion doesn't succeed.

Unfortunately, my reply to this on the v2 was left unanswered by you. So 
I will rewrite it here with more details in the hope this can lead to a 
consensus now.

 From a discussion during January's community call, the behavior was 
related to an old version version of Windows PV drivers. Newer version 
will not use Grant Table v2.

However, your comment seems to suggest that GNTTABOP_setversion will 
never fail today. AFAICT, this is not true today because Xen will return 
-ENOMEM when trying to populate the status frame (see the call to 
gnttab_populate_status_frame()).

Therefore...

> 
> You're literally adding even more complexity to the grant table, to also
> increase the chance of regressing VMs in the wild.  This is not ok.

... I am not sure why you are saying this is a regression.

> The only form of this patch which is in any way acceptable, is to avoid
> the allocation when you know *in DOMCTL_createdomain* that it will never
> be needed by the VM.  So far, that is from Kconfig and/or the command
> line options.

I can see how allocating memory upfront is easier for accounting 
purpose. However, it also means we may not be able to reduce the 
footprint if we don't know what the guest OS will use it.

This can happen for instance, if you let your customers to run random 
OSes and never restrict them to v1.

I believe that in most of the cases v1 will be used by the guest. But we 
technically can't restrict it after the fact (e.g. on reboot) as this 
may regress customers workload.

That's where the current approach is quite appealing because the 
allocation is done a runtime. So it does cater a lot more uses cases 
than your suggestion.

Cheers,

-- 
Julien Grall

