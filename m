Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3677B3565D4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 09:55:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106450.203558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU31T-0002MK-BI; Wed, 07 Apr 2021 07:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106450.203558; Wed, 07 Apr 2021 07:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU31T-0002Lv-7Z; Wed, 07 Apr 2021 07:54:47 +0000
Received: by outflank-mailman (input) for mailman id 106450;
 Wed, 07 Apr 2021 07:54:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU31R-0002Lq-6I
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 07:54:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0af082a5-4b7c-48b6-bf0b-c729fe319e15;
 Wed, 07 Apr 2021 07:54:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5BF30AF39;
 Wed,  7 Apr 2021 07:54:43 +0000 (UTC)
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
X-Inumbo-ID: 0af082a5-4b7c-48b6-bf0b-c729fe319e15
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617782083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trqA/CX1H2/rPui5/OkyYkNberezRL+pK08vzT5qvKM=;
	b=URorqoJSrfEAww9xnNhy9OcPYhXkg1Ep4KJL86SvKOHM6JqNbdxL7DbaKmBG227tGEzyqE
	MeCU/Rrzs/nhEji39fMgMUreobWZ4uVJlHyPjWeTMPW3xNj4gvTrU0gjly70V5gcrLK7Cm
	euow5NvC/C8+rxrodApVc8T++xjLuVs=
Subject: Re: [PATCH 5/5] x86: don't build unused entry code when !PV32
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
 <eea7162f-bbf8-bce9-b989-2a44fe10fa99@citrix.com>
 <ba34f9cf-0815-9671-a59d-04f16397ad90@suse.com>
 <e34f599a-689c-6116-989f-407789e004f9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cda3a94e-33f6-8c38-2dde-795cef3fbc83@suse.com>
Date: Wed, 7 Apr 2021 09:54:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <e34f599a-689c-6116-989f-407789e004f9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 06.04.2021 19:34, Andrew Cooper wrote:
> On 01/04/2021 15:37, Jan Beulich wrote:
>> On 01.04.2021 16:31, Andrew Cooper wrote:
>>> On 25/11/2020 08:51, Jan Beulich wrote:
>>>> @@ -102,19 +102,21 @@ void __dummy__(void)
>>>>      BLANK();
>>>>  #endif
>>>>  
>>>> -#ifdef CONFIG_PV
>>>> +#ifdef CONFIG_PV32
>>>>      OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);
>>> Even if PV32 is compiled out, the is_32bit field still exists, and is
>>> still necessary for crash analysis.  XCA parses this offset information
>>> as part of dissecting /proc/vmcore.
>>>
>>> It's one single bool in a fixed size allocation which we've got plenty
>>> of room in.  It can and should stay to avoid impacting the existing
>>> diagnostic tools.
>> I'm afraid I don't understand at all: I'm not removing the field.
> 
> You talked about removing it in the commit message.

Oh, in a post-commit message TBD remark, yes. Is your objection here
then merely to this possible further plan of removing that field, but
not against the changes in this patch?

>> All I'm removing is the entry for it in asm-offsets.h.
> 
> Yes, and that will break XCA, which is used by several downstreams, not
> just XenServer.
> 
> For RPM package reasons, you can't use debuginfo packages, because
> what's on disk doesn't match what's in memory until you've rebooted. 
> Livepatching adds an extra dimension of fun here.  There's not enough
> space in the vmcoreinfo page to pass enough structure information, so
> asm offsets is appended to the symbol table.  Yes its a gross hack, but
> its how things currently work.

Would you mind pointing me at where this appending is happening? You
can't mean the ELF symbol table in xen-syms - there's no entry for
DOMAIN_is_32bit_pv there. Plus I don't see the problem here, as the
asm-offsets entry already is conditional - it's merely the condition
which gets changed. Or if you mean the is_32bit field - there's no
representation there either in xen-syms (except, when enabled, in
debug info).

Jan

