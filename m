Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B152E1DA7
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 15:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58420.102708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5b0-0006MN-5g; Wed, 23 Dec 2020 14:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58420.102708; Wed, 23 Dec 2020 14:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5b0-0006Ly-2V; Wed, 23 Dec 2020 14:58:34 +0000
Received: by outflank-mailman (input) for mailman id 58420;
 Wed, 23 Dec 2020 14:58:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks5ay-0006Lt-Lh
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 14:58:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15137570-7931-4f8e-9475-5922694493d1;
 Wed, 23 Dec 2020 14:58:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5F22ACBA;
 Wed, 23 Dec 2020 14:58:30 +0000 (UTC)
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
X-Inumbo-ID: 15137570-7931-4f8e-9475-5922694493d1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608735511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=quMKGo3am2jy/5Nh0ZTO2QZ8bto0eKhMkH6aPQR0Z+4=;
	b=E4a6UL3Tui0hkt6uRrIzD7CwS6D/VGw+5YXyGFwgF8f4iltQrQY0uasHHt9LG4x3P4fa6E
	xC03XuGDRWqkW00dwMJXGTJpr3ZmhgdZUtvQ8oR6HNMP1gZ76ZNyYM6bDxco9VwzFmEsef
	S0j4YUoqBwL0cN0xNxdG5ThyoAde9IM=
Subject: Re: [PATCH for-4.15 1/4] xen/iommu: Check if the IOMMU was
 initialized before tearing down
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-2-julien@xen.org>
 <d9dd2fbc-d4bb-6b12-73e7-52a4fdda9020@suse.com>
 <eaba5e4c-91c9-9341-cc8f-d58aa08358a2@xen.org>
 <6339b4ab-9be3-0b70-a474-14213e8609c0@suse.com>
 <903075fe-6482-0e1b-c124-932db4790382@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51024db6-29df-6d8a-3182-43c9c25440b2@suse.com>
Date: Wed, 23 Dec 2020 15:58:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <903075fe-6482-0e1b-c124-932db4790382@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 15:51, Julien Grall wrote:
> On 23/12/2020 13:59, Jan Beulich wrote:
>> On 23.12.2020 14:50, Julien Grall wrote:
>>> On 23/12/2020 13:27, Jan Beulich wrote:
>>>> And finally "we assume" is in at least latent conflict with
>>>> ->platform_ops getting set only after arch_iommu_domain_init()
>>>> was called. Right now neither x86'es nor Arm's do anything
>>>> that would need undoing, but I'd still suggest to replace
>>>> "assume" here (if you want to keep the comment in the first
>>>> place) and move the assignment up a few lines (right after the
>>>> is_iommu_enabled() check there).
>>> My initial implementation of this patch moved the initialization of
>>> hd->platform_ops before arch_iommu_domain_init().
>>>
>>> However, this is going to lead to some issues with Paul's series which
>>> add an IOMMU page-table pool ([1]).
>>>
>>> The function arch_iommu_domain_init() may now fail. If we initialize
>>> hd->platform_ops earlier on, then the ->teardown() will be called before
>>> ->init().
>>>
>>> This may be an issue if ->teardown() expects some list pointer to be
>>> initialized by ->init(). I am not aware of any today, but this seems
>>> quite risky to me.
>>
>> In such a case the obvious thing is to make the teardown handler
>> check whether its init counterpart has run before. This will then
>> fit our apparently much wider goal of making cleanup functions
>> idempotent.
> 
> I will have a look. This may require another boolean which I wanted to 
> avoid.

I could imagine list_head_is_null() to become handy here.

Jan

