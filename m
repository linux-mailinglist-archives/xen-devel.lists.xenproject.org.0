Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60582938BA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 12:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9065.24360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUoSF-0003Xf-Hw; Tue, 20 Oct 2020 10:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9065.24360; Tue, 20 Oct 2020 10:01:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUoSF-0003XG-Ea; Tue, 20 Oct 2020 10:01:19 +0000
Received: by outflank-mailman (input) for mailman id 9065;
 Tue, 20 Oct 2020 10:01:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kUoSE-0003XB-74
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:01:18 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bee38097-a65c-4440-9d9d-d9ff51422cb0;
 Tue, 20 Oct 2020 10:01:16 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUoSA-0007HD-A0; Tue, 20 Oct 2020 10:01:14 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUoSA-0002rF-0a; Tue, 20 Oct 2020 10:01:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kUoSE-0003XB-74
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:01:18 +0000
X-Inumbo-ID: bee38097-a65c-4440-9d9d-d9ff51422cb0
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bee38097-a65c-4440-9d9d-d9ff51422cb0;
	Tue, 20 Oct 2020 10:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=bElc4AckwBa4LOpKqtZoTyUlEwTZQqk23g9/WLIMdSk=; b=VOFC38vLlDMd9HLCAroF/4CrK0
	CzVufYd5Lf1Va9fSRR1wjjjcqfU0CoVo5iPcxFY49spCKOANH3OaelJ5XW5hkjNfwM9cpPiG7X+Ff
	qHGXOIfYXD2Euoo/5U+xxr0SJBmg23GdpY3BKjWtz0Is+LKHfcSYzzmqR/NAU7PK0NQk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUoSA-0007HD-A0; Tue, 20 Oct 2020 10:01:14 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUoSA-0002rF-0a; Tue, 20 Oct 2020 10:01:14 +0000
Subject: Re: [PATCH v2 1/2] xen/events: access last_priority and last_vcpu_id
 together
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-2-jgross@suse.com>
 <9485004c-b739-5590-202b-c8e6f84e5e54@suse.com>
 <821a77d3-7e37-d1d2-d904-94db0177893a@suse.com>
 <350a5738-b239-e36b-59aa-05b8f86648b8@suse.com>
 <548f80a9-0fa3-cd9e-ec44-5cd37d98eadc@xen.org>
 <4f4ecc8d-f5d2-81e9-1615-0f2925b928ba@suse.com>
 <4b77ba6d-bf49-7286-8f2a-53f7b2e7d122@xen.org>
 <4eb073bb-67ca-5376-bae1-e555d3c5fb30@suse.com>
 <2eb42b0e-f31e-2c1e-28bf-32c366fb1688@xen.org>
 <abaf4b52-df8d-6df0-9100-a4c9884c09da@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <244a4487-044b-5813-dd03-fe4ff5aac3b3@xen.org>
Date: Tue, 20 Oct 2020 11:01:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <abaf4b52-df8d-6df0-9100-a4c9884c09da@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 20/10/2020 10:34, Jan Beulich wrote:
> On 20.10.2020 11:25, Julien Grall wrote:
>> Given that evtchn->last_vcpu_id and evtchn->last_priority can only be
>> modified in evtchn_fifo_set_pending(), this suggests that it is expected
>> for the function to multiple called concurrently on the same event channel.
>>
>>> I'm unconvinced it was really considered
>>> whether racing sending on the same channel is also safe this way.
>>
>> How would you explain the 3 try in lock_old_queue then?
> 
> Queue changes (as said by the gprintk()) can't result from sending
> alone, but require re-binding to a different vCPU or altering the
> priority. 

I agree with that. However, this doesn't change the fact that update to 
evtchn->last_priority and evtchn->last_vcpu can only happen when calling 
evtchn_fifo_set_pending().

If evtchn_fifo_set_pending() cannot be called concurrently for the same 
event, then there is *no* way for evtchn->last_{priority, vcpu} to be 
updated concurrently.

> I'm simply unconvinced that the code indeed fully reflects
> the original intentions. 

Do you mind (re-)sharing what was the original intentions?

Cheers,

-- 
Julien Grall

