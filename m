Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCE5329976
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 11:22:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92244.174061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH2AX-0001lY-Fq; Tue, 02 Mar 2021 10:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92244.174061; Tue, 02 Mar 2021 10:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH2AX-0001l9-CE; Tue, 02 Mar 2021 10:22:21 +0000
Received: by outflank-mailman (input) for mailman id 92244;
 Tue, 02 Mar 2021 10:22:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lH2AV-0001l4-TI
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 10:22:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 560dbc99-9b95-4d00-8631-b8ad988b08ec;
 Tue, 02 Mar 2021 10:22:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9783B06A;
 Tue,  2 Mar 2021 10:22:17 +0000 (UTC)
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
X-Inumbo-ID: 560dbc99-9b95-4d00-8631-b8ad988b08ec
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614680538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zgkd6i+z7dykHrVUeaj1fYkOWXNgHv+lvxBNXCbv3Bs=;
	b=iRMhX6NjfuV4y/AAkR2EWecl/lo4kuXw48gA/FN9ic2SyU21iIORonT85ITfzqtoQtywou
	rvcS9xjtmlkORwJAqA/b7iFhOKiPN1ytHZVjG1Fgd/QTZetWGFrfAJKAQZn3wGLhGp6mhs
	uUSWzlEEZZff1lSUGl9YrSqqA5qF/7s=
Subject: Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization
 without reserved bits
To: Ian Jackson <iwj@xenproject.org>
Cc: Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
 <YDkq3KwtfGZZTyLL@deinos.phlegethon.org>
 <72c3c863-7465-ce26-1f57-b71227bb2b19@suse.com>
 <24637.9408.839033.439930@mariner.uk.xensource.com>
 <99db39fd-e479-f71d-9cb9-5903ff6c12f4@citrix.com>
 <24637.10160.977640.808417@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fb542bda-d25e-b286-400f-dfb54bfe55d4@suse.com>
Date: Tue, 2 Mar 2021 11:22:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24637.10160.977640.808417@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.03.2021 18:43, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
>> On 01/03/2021 17:30, Ian Jackson wrote:
>>> Jan Beulich writes ("Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
>>>> On 26.02.2021 18:07, Tim Deegan wrote:
>>>>> Yes, I think it could be reduced to use just one reserved address bit.
>>>>> IIRC we just used such a large mask so the magic entries would be
>>>>> really obvious in debugging, and there was no need to support arbitrary
>>>>> address widths for emulated devices.
>>>> Will cook a patch, albeit I guess I'll keep as many of the bits set
>>>> as possible, while still being able to encode a full-40-bit GFN.
>>>>
>>>> Ian - I don't suppose you'd consider this a reasonable thing to do
>>>> for 4.15? It would allow limiting the negative (performance) effect
>>>> the change here has.
>>> I'm afraid I don't follow enough of the background here to have an
>>> opinion right now.  Can someone explain to me the risks (and,
>>> correspondingly, upsides) of the options ?  Sorry to be dim, I don't
>>> seem to be firing on all cylinders today.

I guess the risk from that patch is no different than that from the
patch here. It would merely improve performance for guests using
very large GFNs for memory areas needing emulation by qemu, which I
suppose originally wasn't expected to be happening in the first place.
In fact if I would have been certain there are no side effects of the
too narrow GFN representation used so far, I would probably have
submitted the patches in reverse order, or even folded them.

>> Intel IceLake CPUs (imminently coming out) have no reserved bits in
>> pagetable entries, so these "optimisations" malfunction.  It is
>> definitely an issue for HVM Shadow guests, and possibly migration of PV
>> guests (I can never remember whether we use the GNP fastpath on PV or not).
>>
>> It is arguably wrong that we ever depended on reserved behaviour.
>>
>> I've got a (not-yet-upsteamed) XTF test which can comprehensively test
>> this.  I'll find some time to give them a spin and give a T-by.
>>
>> Without this fix, some combinations of "normal" VM settings will
>> malfunction.
> 
> Thanks for that explanation.
> 
> I don't quite follow how that relates to Jan's comment
> 
>  >> Will cook a patch, albeit I guess I'll keep as many of the bits set
>  >> as possible, while still being able to encode a full-40-bit GFN.
>  >>
>  >> Ian - I don't suppose you'd consider this a reasonable thing to do
>  >> for 4.15? It would allow limiting the negative (performance) effect
>  >> the change here has.
> 
> I already gave a release-ack for the original patch.  I think Jan is
> asking for a release-ack for a different way of fixing the problem.

Well, I was trying to negotiate whether I should submit that patch
for 4.15, or only later for 4.16.

Jan

