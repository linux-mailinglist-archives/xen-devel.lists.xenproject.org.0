Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBFB2F77A4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 12:29:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67988.121579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0NIL-0005hH-Nm; Fri, 15 Jan 2021 11:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67988.121579; Fri, 15 Jan 2021 11:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0NIL-0005gq-KG; Fri, 15 Jan 2021 11:29:33 +0000
Received: by outflank-mailman (input) for mailman id 67988;
 Fri, 15 Jan 2021 11:29:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0NIK-0005gl-K8
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 11:29:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84aa086e-2585-4ae5-a6e5-df0b625f1f3b;
 Fri, 15 Jan 2021 11:29:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25E82AC95;
 Fri, 15 Jan 2021 11:29:31 +0000 (UTC)
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
X-Inumbo-ID: 84aa086e-2585-4ae5-a6e5-df0b625f1f3b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610710171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ECPRqwozacYdPeXhV3VGEcOFjF3X9wY7d51Ez0mZcsU=;
	b=Rxcs/2FcQswcztQ6owIVaFqktbUTPoDr6GX924jf2J4+ip7wMIroYYCF01TgVKKV8z/lQ7
	pHQk9+/cAfOQ9OFAHAfTTw0uDcCNFDgMtW0bUo1z8ni3ypxOmrqg88aroGC8lykPk6JPMP
	4LjeVid53JongaqRwgmV2mCCsyDBiZc=
Subject: Re: [PATCH 1/3] introduce unaligned.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 M A Young <m.a.young@durham.ac.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
 <12f26ab9-8a8c-19f0-ea65-8b354bd326a6@suse.com>
 <8c459039-a27a-01e5-0143-7c9b6e019e42@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4b4b02b-f6d0-06b5-d65b-3693e16f266d@suse.com>
Date: Fri, 15 Jan 2021 12:29:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <8c459039-a27a-01e5-0143-7c9b6e019e42@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.01.2021 12:13, Andrew Cooper wrote:
> On 15/01/2021 10:05, Jan Beulich wrote:
>> Rather than open-coding commonly used constructs in yet more places when
>> pulling in zstd decompression support (and its xxhash prereq), pull out
>> the custom bits into a commonly used header (for the hypervisor build;
>> the tool stack and stubdom builds of libxenguest will still remain in
>> need of similarly taking care of). For now this is limited to x86, where
>> custom logic isn't needed (considering this is going to be used in init
>> code only, even using alternatives patching to use MOVBE doesn't seem
>> worthwhile).
>>
>> No change in generated code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Iirc use of include/asm-generic/ was disliked, hence the generic header
>> goes into include/xen/.
> 
> Really?  I think its going to be the only sane way of fixing up some of
> our header tangle.

Should have responded here too: It was me to suggest to put some
header there when reviewing some patches a while ago, and iirc it
was Julien who pushed back.

Jan

