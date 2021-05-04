Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71E93729DF
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122230.230502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtv4-0002OW-Sk; Tue, 04 May 2021 12:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122230.230502; Tue, 04 May 2021 12:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtv4-0002O7-PL; Tue, 04 May 2021 12:12:54 +0000
Received: by outflank-mailman (input) for mailman id 122230;
 Tue, 04 May 2021 12:12:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldtv2-0002O2-Tm
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:12:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 332afec1-6c43-47ce-94f9-2da946c419d1;
 Tue, 04 May 2021 12:12:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B77BB2DC;
 Tue,  4 May 2021 12:12:51 +0000 (UTC)
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
X-Inumbo-ID: 332afec1-6c43-47ce-94f9-2da946c419d1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620130371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Etumk9WiYOFtAAaAsfCpzSWRkB+mKLAtUDQEeNVOb4A=;
	b=sO+iz23Thm2R9P14oMqplr62s963f6FfQGdcqcBDUjP/9pOufmbOKrMV4f6m2vmgH7PmUv
	SeBxCWhYSIXtLH6/NP72a2dX2mH0O+rQ9fO063dSDc2pegfF1eWM3ggu9ZC4eAOet7zgop
	EEUeJ/ms29/NllkTPYn6YKbEG/ZjgTY=
Subject: Re: [PATCH v3 07/13] libs/guest: obtain a compatible cpu policy from
 two input ones
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-8-roger.pau@citrix.com>
 <838e358d-5707-0f34-c8fe-64e29f000a69@suse.com>
 <YJE2hxPYq2kGrOwV@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0fa9652d-2b38-516d-a371-df90943d93a3@suse.com>
Date: Tue, 4 May 2021 14:12:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YJE2hxPYq2kGrOwV@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.05.2021 13:56, Roger Pau Monné wrote:
> On Mon, May 03, 2021 at 12:43:08PM +0200, Jan Beulich wrote:
>> On 30.04.2021 17:52, Roger Pau Monne wrote:
>>> +/* Only level featuresets so far. */
>>
>> I have to admit that I don't think I see all the implications from
>> this implementation restriction. All other leaves get dropped by
>> the caller, but it's not clear to me what this means wrt what the
>> guest is ultimately going to get to see.
> 
> This aims to be based on what XenServer does, which I was told is to
> level the featuresets. I think the caller of the function will have to
> fill the part of the policy that cannot be leveled. It's likely new
> helpers will be added to do that as required.
> 
> One option would be to get the default policy for the guest and then
> use xc_cpu_policy_update_cpuid to apply the leveled one.

Could such further plans perhaps be outlined (to a degree at least)
in the description?

Jan

