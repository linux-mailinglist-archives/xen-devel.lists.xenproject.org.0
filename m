Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15B12FBAB6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 16:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70462.126460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sZo-0002q8-QL; Tue, 19 Jan 2021 15:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70462.126460; Tue, 19 Jan 2021 15:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sZo-0002pj-Mh; Tue, 19 Jan 2021 15:05:48 +0000
Received: by outflank-mailman (input) for mailman id 70462;
 Tue, 19 Jan 2021 15:05:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1sZm-0002pd-Ou
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 15:05:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52ff3055-82c5-4f57-9b4a-4e3bbf2ab1de;
 Tue, 19 Jan 2021 15:05:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D826B73F;
 Tue, 19 Jan 2021 15:05:44 +0000 (UTC)
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
X-Inumbo-ID: 52ff3055-82c5-4f57-9b4a-4e3bbf2ab1de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611068744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1s7T9s3ogXOgVYnB4auG5/oRmlZEx+9Nf3rz4OSI14c=;
	b=ai7Extt+SlHx+zMuyevMMpZ/M/RERVris5tD9FUE6v4w1T4iL5xgKPMe+Uh3KhsaPWWQof
	afz8TbLbYEcW4gTc2G00gZzFGbRGWWQiJVIdLQCui/ZqwykCGXoHOKTqUJLCJGTKO8AeJs
	8ZucHlMn5OFXbpTYtFX4ZP/Q6gAlA1Y=
Subject: Re: [PATCH v2] x86/CPUID: unconditionally set
 XEN_HVM_CPUID_IOMMU_MAPPINGS
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210119130759.98296-1-roger.pau@citrix.com>
 <064729d2-1fe2-3169-4f4f-7c04a73e3984@suse.com>
 <20210119143146.ktr4fh66x6cmwqbv@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <58a5bb86-c73f-f1f8-6416-a29fcb5f0536@suse.com>
Date: Tue, 19 Jan 2021 16:05:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210119143146.ktr4fh66x6cmwqbv@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.01.2021 15:31, Roger Pau Monné wrote:
> On Tue, Jan 19, 2021 at 03:26:22PM +0100, Jan Beulich wrote:
>> On 19.01.2021 14:07, Roger Pau Monne wrote:
>>> This is a revert of f5cfa0985673 plus a rework of the comment that
>>> accompanies the setting of the flag so we don't forget why it needs to
>>> be unconditionally set: it's indicating whether the version of Xen has
>>> the original issue fixed and IOMMU entries are created for
>>> grant/foreign maps.
>>>
>>> If the flag is only exposed when the IOMMU is enabled the guest could
>>> resort to use bounce buffers when running backends as it would assume
>>> the underlying Xen version still has the bug present and thus
>>> grant/foreign maps cannot be used with devices.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> This time for real, I suppose.
> 
> Won't believe it until it hits the repo ;).

There you go. But well, we can always revert ... ;-)

Jan

