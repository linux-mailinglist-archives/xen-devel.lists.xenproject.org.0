Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8912F2E9648
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 14:46:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61218.107515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQCA-00036g-Ap; Mon, 04 Jan 2021 13:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61218.107515; Mon, 04 Jan 2021 13:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQCA-00036H-7K; Mon, 04 Jan 2021 13:46:50 +0000
Received: by outflank-mailman (input) for mailman id 61218;
 Mon, 04 Jan 2021 13:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwQC8-00035t-BG
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 13:46:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25610ac8-3dda-497d-9374-1f8ea5d7a411;
 Mon, 04 Jan 2021 13:46:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D920EACBA;
 Mon,  4 Jan 2021 13:46:46 +0000 (UTC)
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
X-Inumbo-ID: 25610ac8-3dda-497d-9374-1f8ea5d7a411
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609768007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9o8dH433pfBgJxB0qeppxn1TznMf0MjElBpYXXNViBc=;
	b=dsE+pe5D+yZgvxw/CqO8OHZP0rHeuGeRcRmDMqOiFwPqYO4T6zsVMypPPpPJiW3Fr0v2Bo
	bxcedtNmnwAncsqY/kiBuYrpTXFFy9YwZAX0WBm5qk/YL4h0Da4eKMQQvb3HynejlaxdXm
	wBa6woOB+BiPgtglrxM4K7oWR3Sl7kA=
Subject: Re: [PATCH 1/5] x86/build: limit rebuilding of asm-offsets.h
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d437bdbf-3047-06ad-2fe8-f445cf8b3240@suse.com>
 <20201228120028.f5clmk4jr3jrlo7b@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d9334cb3-5b89-0a79-5a90-d313bdee43f7@suse.com>
Date: Mon, 4 Jan 2021 14:46:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201228120028.f5clmk4jr3jrlo7b@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.12.2020 13:00, Roger Pau Monné wrote:
> On Wed, Nov 25, 2020 at 09:45:56AM +0100, Jan Beulich wrote:
>> This file has a long dependencies list (through asm-offsets.s) and a
>> long list of dependents. IOW if any of the former changes, all of the
>> latter will be rebuilt, even if there's no actual change to the
>> generated file. This is the primary scenario we have the move-if-changed
>> macro for.
>>
>> Since debug information may easily cause the file contents to change in
>> benign ways, also avoid emitting this into the output file.
>>
>> Finally already before this change *.new files needed including in what
>> gets removed by the "clean" target.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> Perhaps Arm would want doing the same. In fact perhaps the rules should
>> be unified by moving to common code?
> 
> Having the rule in common code would be my preference, the
> prerequisites are slightly different, but I think we can sort this
> out?

Well, that's the nice thing about make rules: Dependencies / prereqs
and the actual rule can be specified independently. I.e. I'd envision
per-arch dependency specifications and a common rule (with common
dependencies of course living there as well).

Jan

