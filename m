Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDB7382F43
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 16:14:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128315.240919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lie0N-0005Sg-9C; Mon, 17 May 2021 14:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128315.240919; Mon, 17 May 2021 14:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lie0N-0005Q6-6E; Mon, 17 May 2021 14:13:59 +0000
Received: by outflank-mailman (input) for mailman id 128315;
 Mon, 17 May 2021 14:13:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lie0L-0005Ps-Qb
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 14:13:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3bc33be9-2541-4f64-ad84-1a677bb6e092;
 Mon, 17 May 2021 14:13:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BF45B231;
 Mon, 17 May 2021 14:13:56 +0000 (UTC)
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
X-Inumbo-ID: 3bc33be9-2541-4f64-ad84-1a677bb6e092
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621260836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwE+T0c+xlHjc49FEylrM2BvekW9eKLArf9QaPrjeEw=;
	b=MWgi0KHh0Jd9DgsygqlTrv7WF3mMH+tR979KiKRtH17JWUc0vjATnRHwRxkz7WqJdOap+b
	gDoh6thuXBQePPtv7wwg2NWmEnhuBeBhzRWG89YqvaBML/HVasdng0lVHp1Ff7jBJ4yMWg
	mOhDSclmEAjvafp9vOBWrPvrvpMt/nY=
Subject: Re: [PATCH v2 1/4] usb: early: Avoid using DbC if already enabled
To: Connor Davis <connojdavis@gmail.com>
Cc: Jann Horn <jannh@google.com>, Lee Jones <lee.jones@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1620950220.git.connojdavis@gmail.com>
 <d160cee9b61c0ec41c2cd5ff9b4e107011d39d8c.1620952511.git.connojdavis@gmail.com>
 <8ccce25a-e3ca-cb30-f6a3-f9243a85a49b@suse.com>
 <16400ee4-4406-8b26-10c0-a423b2b1fed0@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ddb58cbd-0a72-f680-80f4-ce09b13a2cee@suse.com>
Date: Mon, 17 May 2021 16:13:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <16400ee4-4406-8b26-10c0-a423b2b1fed0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.05.2021 15:48, Connor Davis wrote:
> 
> On 5/17/21 3:32 AM, Jan Beulich wrote:
>> On 14.05.2021 02:56, Connor Davis wrote:
>>> Check if the debug capability is enabled in early_xdbc_parse_parameter,
>>> and if it is, return with an error. This avoids collisions with whatever
>>> enabled the DbC prior to linux starting.
>> Doesn't this go too far and prevent use even if firmware (perhaps
>> mistakenly) left it enabled?
> 
> Yes, but how is one supposed to distinguish the broken firmware and 
> non-broken
> 
> firmware cases?

Well, a first step might be to only check if running virtualized.
And then if your running virtualized, there might be a way to
inquire the hypervisor?

Jan

