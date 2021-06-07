Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA1539E64C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 20:15:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138135.255795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqJmD-00038z-BR; Mon, 07 Jun 2021 18:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138135.255795; Mon, 07 Jun 2021 18:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqJmD-00036V-7z; Mon, 07 Jun 2021 18:15:05 +0000
Received: by outflank-mailman (input) for mailman id 138135;
 Mon, 07 Jun 2021 18:15:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lqJmC-00036P-6N
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 18:15:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lqJmB-0006EC-A1; Mon, 07 Jun 2021 18:15:03 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lqJmB-0002fS-2o; Mon, 07 Jun 2021 18:15:03 +0000
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
	bh=4pZL2seXSV736s975wjnJUTLCYC0Y6k2UPK2Kwx12pM=; b=u0HI7TbNJZKrXFw/RhcZ29HBnu
	UKK6J943icGkgGWM6RZK4+nKtt7HXegDLJ8SMtjVcoGM8Exf66mlHLDFvwiMVbQZcWTwNHdaLQozM
	2AT2oype6/D0ugE4ICe7N2VK0fAJQUq39ANnywDpQv2cGEcQazON9CCnlPBEq01r0Cxo=;
Subject: Re: [PATCH v6 1/3] evtchn: slightly defer lock acquire where possible
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
 <5939858e-1c7c-5658-bc2d-0c9024c74040@suse.com>
 <938eb888-ec15-feb1-19f7-b90dfee822ae@xen.org>
 <e5e6ab32-815c-49d8-94f3-a75d975465b3@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cd727c23-9433-440c-bbb2-f2b0af61567f@xen.org>
Date: Mon, 7 Jun 2021 19:15:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <e5e6ab32-815c-49d8-94f3-a75d975465b3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/06/2021 12:54, Jan Beulich wrote:
> On 27.05.2021 20:48, Julien Grall wrote:
>> On 27/05/2021 12:28, Jan Beulich wrote:
>>> port_is_valid() and evtchn_from_port() are fine to use without holding
>>> any locks. Accordingly acquire the per-domain lock slightly later in
>>> evtchn_close() and evtchn_bind_vcpu().
>>
>> So I agree that port_is_valid() and evtchn_from_port() are fine to use
>> without holding any locks in evtchn_bind_vcpu(). However, this is
>> misleading to say there is no problem with evtchn_close().
>>
>> evtchn_close() can be called with current != d and therefore, there is a
>> risk that port_is_valid() may be valid and then invalid because
>> d->valid_evtchns is decremented in evtchn_destroy().
> 
> While this is the case for other functions as well (and hence a
> comment along the lines of what you ask for below should have
> been in place already), I've added
> 
> /*
>   * While calling the function is okay without holding a suitable lock yet
>   * (see the comment ahead of struct evtchn_port_ops for which ones those
>   * are), for a dying domain it may start returning false at any point - see
>   * evtchn_destroy(). This is not a fundamental problem though, as the
>   * struct evtchn instance won't disappear (and will continue to hold valid
>   * data) until final cleanup of the domain, at which point the domain itself
>   * cannot be looked up anymore and hence calls here can't occur anymore in
>   * the first place.
>   */
> 
> ...
> 
>> Thankfully the memory is still there. So the current code is okayish and
>> I could reluctantly accept this behavior to be spread. However, I don't
>> think this should be left uncommented in both the code (maybe on top of
>> port_is_valid()?) and the commit message.
> 
> ... ahead of port_is_valid() (and not, as I did intend originally,
> in evtchn_close()). As far as the commit message goes, I'll have it
> refer to the comment only.
> 
> I hope this satisfies the requests of both of you. I'll take the
> liberty and retain your ack, Roger.

Yes, this satistfies my requests. Feel free to add my reviewed-by on the 
patch.

Cheers,

-- 
Julien Grall

