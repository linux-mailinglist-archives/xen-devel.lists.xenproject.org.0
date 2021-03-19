Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7528D341EDF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 14:56:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99283.188702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFc3-0002qr-A5; Fri, 19 Mar 2021 13:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99283.188702; Fri, 19 Mar 2021 13:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFc3-0002qR-6a; Fri, 19 Mar 2021 13:56:27 +0000
Received: by outflank-mailman (input) for mailman id 99283;
 Fri, 19 Mar 2021 13:56:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai2o=IR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lNFc2-0002qF-55
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:56:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce5efbd0-5202-45af-a337-089d63042537;
 Fri, 19 Mar 2021 13:56:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80715AE05;
 Fri, 19 Mar 2021 13:56:24 +0000 (UTC)
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
X-Inumbo-ID: ce5efbd0-5202-45af-a337-089d63042537
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616162184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HAo5E0y/7xOSSY4s+/UThEcv+vl5mdnIlMxGgRH0bWc=;
	b=R5hI7HBo0+dTi0G43BQGWxOCM6ulzqUZFByTBYTWq7Z4Synq6vY3np80pVQyqyucbb+PWS
	4DFZiO835gIA4ys1171is3EMfXpcltU/uc6QtG4ZEms/u7ry3de/UAeqeptCrxMVnZXJ1H
	h36YHCXUU1PmU7nYZq0/bYZbwGivqss=
Subject: Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in
 guest_{rd,wr}msr()"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ian Jackson <iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-2-andrew.cooper3@citrix.com>
 <df7b7faf-ce81-795a-6d8d-29fe967d2d77@suse.com>
 <ce3abf13-66ca-13f1-0b8c-25221cb90c77@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c5f3162-8451-5e6c-e5b3-e5368fc0a871@suse.com>
Date: Fri, 19 Mar 2021 14:56:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ce3abf13-66ca-13f1-0b8c-25221cb90c77@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.03.2021 13:59, Andrew Cooper wrote:
> On 16/03/2021 16:58, Jan Beulich wrote:
>> On 16.03.2021 17:18, Andrew Cooper wrote:
>>> In hindsight, this was a poor move.  Some of these MSRs require probing for,
>>> causing unhelpful spew into xl dmesg, as well as spew from unit tests
>>> explicitly checking behaviour.
>> I can indeed see your point for MSRs that require probing. But what about
>> the others (which, as it seems, is the majority)? And perhaps specifically
>> what about the entire WRMSR side, which won't be related to probing? I'm
>> not opposed to the change, but I'd like to understand the reasoning for
>> every one of the MSRs, not just a subset.
>>
>> Of course such ever-growing lists of case labels aren't very nice - this
>> going away was one of the things I particularly liked about the original
>> change.
> 
> The logging in the default case is only useful when it is genuinely MSRs
> we haven't considered.
> 
> It is very useful at pointing bugs in guests, or bugs in Xen, but only
> when the logging is not drowned out by things we know about.

So would you mind adjusting the description accordingly? Right now, the
way it's written, it reads (to my non-native interpretation) as entirely
focusing on guests' probing needs. Even an adjustment as simple as

"In hindsight, this was a poor move.  Some of these MSRs require probing for,
 cause unhelpful spew into xl dmesg, or cause spew from unit tests
 explicitly checking behaviour."

would already shift the focus imo.

Jan

