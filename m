Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEC4322D42
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 16:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88823.167156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEZPD-0007iD-D5; Tue, 23 Feb 2021 15:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88823.167156; Tue, 23 Feb 2021 15:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEZPD-0007ho-9w; Tue, 23 Feb 2021 15:15:19 +0000
Received: by outflank-mailman (input) for mailman id 88823;
 Tue, 23 Feb 2021 15:15:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEZPB-0007hi-No
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 15:15:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7010f2bb-2de3-4491-a5bb-116fb016ab13;
 Tue, 23 Feb 2021 15:15:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F685AC1D;
 Tue, 23 Feb 2021 15:15:15 +0000 (UTC)
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
X-Inumbo-ID: 7010f2bb-2de3-4491-a5bb-116fb016ab13
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614093315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t2UA1j/RmVE55nOLziUQOk9xwYCY+H9PjhIvbvQ/JsU=;
	b=TIw0EvIylOOPOOpLu6ZwHp6IHezYq14ATWkdcs9FxQugQFGBrDfbiWqCA1otCoKnzpMcmE
	IV1vF2SKsuQ5o90MdI13KEwyxLdTMK0lkij7JmSIBu1fkQGQ/fjWV2BMHJBFGFe3WpfVU/
	Jir9yIeHsfk/TlVshmm2P7Xwj6Fumuw=
Subject: Re: [PATCH v2 6/8] x86: rename copy_{from,to}_user() to
 copy_{from,to}_guest_pv()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <5104a32f-e2a1-06a5-a637-9702e4562b81@suse.com>
 <YDThIFB7ox6qdfFE@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e4d803c-ab4f-b7f4-c8e7-e7ea450c7921@suse.com>
Date: Tue, 23 Feb 2021 16:15:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDThIFB7ox6qdfFE@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.02.2021 12:04, Roger Pau Monné wrote:
> On Wed, Feb 17, 2021 at 09:22:32AM +0100, Jan Beulich wrote:
>> Bring them (back) in line with __copy_{from,to}_guest_pv(). Since it
>> falls in the same group, also convert clear_user(). Instead of adjusting
>> __raw_clear_guest(), drop it - it's unused and would require a non-
>> checking __clear_guest_pv() which we don't have.
>>
>> Add previously missing __user at some call sites and in the function
>> declarations.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/usercopy.c
>> +++ b/xen/arch/x86/usercopy.c
>> @@ -109,19 +109,17 @@ unsigned int copy_from_guest_ll(void *to
>>  #if GUARD(1) + 0
>>  
>>  /**
>> - * copy_to_user: - Copy a block of data into user space.
>> - * @to:   Destination address, in user space.
>> - * @from: Source address, in kernel space.
>> + * copy_to_guest_pv: - Copy a block of data into guest space.
> 
> I would expand to 'PV guest' here and below, FAOD.

Can do, albeit in the header (in particular also in the two
patches that have gone in already) we also say just "guest".
But since this is a different file, I can make the change
without introducing too much of an inconsistency.

Jan

