Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED88E30AC34
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 17:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80002.146075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6bfU-00047a-Gk; Mon, 01 Feb 2021 16:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80002.146075; Mon, 01 Feb 2021 16:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6bfU-00047B-DW; Mon, 01 Feb 2021 16:03:12 +0000
Received: by outflank-mailman (input) for mailman id 80002;
 Mon, 01 Feb 2021 16:03:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6bfT-000476-Ht
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 16:03:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42394945-7a1c-4c62-a0f7-2e02ee46fb43;
 Mon, 01 Feb 2021 16:03:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1FCCFAB92;
 Mon,  1 Feb 2021 16:03:09 +0000 (UTC)
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
X-Inumbo-ID: 42394945-7a1c-4c62-a0f7-2e02ee46fb43
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612195389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ffS5DjfBHdCzkAI9Vf/Eo5smSllFsqKw1wxIXYB8H3c=;
	b=JRK7lhYDLR2pezkKNnh19V12njyVIqaNs0YcP0hiqSmP0zOdl/Nzmp9DdcDE2V2BZQpSIO
	4pof5R8Wy1lDVFadUMfKba6XNYS9uMaYtJyYTXLt0I5/NwyFuaoVEkIInUFEamV3X64iTl
	02KOIT7MqixCGTg6JnP606zsU514Vk8=
Subject: Re: [PATCH] ioreq: don't (deliberately) crash Dom0
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1dc6fe4c-3435-462d-a339-085014ae0deb@suse.com>
 <f6c0504f-c83f-5477-0797-d6e6da616fc5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f68a1cf2-1c0a-813e-018e-9f5bda956074@suse.com>
Date: Mon, 1 Feb 2021 17:03:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f6c0504f-c83f-5477-0797-d6e6da616fc5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.02.2021 16:37, Andrew Cooper wrote:
> On 01/02/2021 15:22, Jan Beulich wrote:
>> We consider this error path of hvm_alloc_ioreq_mfn() to not be possible
>> to be taken, or otherwise to indicate abuse or a bug somewhere. If there
>> is abuse of some kind, crashing Dom0 here would mean a system-wide DoS.
>> Only crash the emulator domain if it's not the (global) control domain;
>> crash only the guest being serviced otherwise.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Honestly, I'm -1 towards this.
> 
> Asymmetrically shooting things which aren't dom0 only complicates
> investigations, and doesn't remove the fact that this is an XSA.
> 
> I do not subscribe to the opinion that keeping dom0 running at all
> possible costs is the best thing thing for the system.
> 
> In this particular case, the theoretical cases where it can go wrong
> might not be the fault of either domain.

I agree with "might", but I don't think we should consider buggy
Xen as the first option for what errors mean. As said on another
related thread, failure here could come from the page having got
freed very quickly (by guessing its MFN). If could be guest,
emulator, or yet some other domain's misbehavior. In none of
these cases I consider it appropriate to kill Dom0. The guest
not starting (or crashing, if this is dynamic insertion of an
ioreq server) is a clear enough sign that there's an issue that
needs looking into. No need to also penalize all other domains
running on that host.

Jan

