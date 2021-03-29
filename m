Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B67734D4D7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 18:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103160.196881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQufm-0000Hp-NK; Mon, 29 Mar 2021 16:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103160.196881; Mon, 29 Mar 2021 16:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQufm-0000HJ-Ji; Mon, 29 Mar 2021 16:23:26 +0000
Received: by outflank-mailman (input) for mailman id 103160;
 Mon, 29 Mar 2021 16:23:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lQufl-0000HB-Pn
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 16:23:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e78dafc2-1c7d-4337-b163-6b11f6dc4188;
 Mon, 29 Mar 2021 16:23:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6001EAFC1;
 Mon, 29 Mar 2021 16:23:24 +0000 (UTC)
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
X-Inumbo-ID: e78dafc2-1c7d-4337-b163-6b11f6dc4188
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617035004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MHfMOSSABEXyWDNhveuRdZyJpT9NE+ZmQyutBw5Vut8=;
	b=BJHEclaIzKJf5icxelU+t3zsIOcKtLk/KalKcaskzDx2jfF0FmvWNyFYXxebm1Yw0ShIBT
	Z8om2wZTTHPoBQLzYgWO5g/8kkV5/5cy+yjuzWi6/kLVR2PGYeC6VeUYhuuHdNyCKBh5rk
	h4oEbLiI+0MM9X8H3qETUDw1XGrlaQs=
Subject: Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210324172608.302316-1-george.dunlap@citrix.com>
 <f41680a0-9415-ea2e-c1e3-db8b0552823c@suse.com>
 <FB9CBC51-5793-41DD-A331-5274E6A82AF4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <23461afc-c0e0-eb33-9ed3-52f050b6aef0@suse.com>
Date: Mon, 29 Mar 2021 18:23:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <FB9CBC51-5793-41DD-A331-5274E6A82AF4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.03.2021 18:12, George Dunlap wrote:
>> On Mar 25, 2021, at 7:08 AM, Jan Beulich <JBeulich@suse.com> wrote:
>> On 24.03.2021 18:26, George Dunlap wrote:
>>> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>>> ---
>>> Missed one from my list when creating the other series
>>>
>>> CC: Ian Jackson <ian.jackson@citrix.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Roger Pau Monne <roger.pau@citrix.com>
>>> ---
>>> CHANGELOG.md | 1 +
>>> 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 15a22d6bde..49832ae017 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -18,6 +18,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>  - x86_emulate: Expanded testing for several instruction classes
>>>  - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
>>>  - CI loop: Add dom0less aarch64 smoke test
>>> + - Factored out HVM-specific shadow code, allowing PV shim to be slimmer
>>
>> But shadow code doesn't get included by default in shim-exclusive
>> builds (and others are unlikely to disable HVM).
> 
> Can you propose some better text please?

Does this need mentioning here in the first place?

Jan

