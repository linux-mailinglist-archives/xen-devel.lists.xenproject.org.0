Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D6F3515AC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:38:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104557.200116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRySF-0005V6-Ie; Thu, 01 Apr 2021 14:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104557.200116; Thu, 01 Apr 2021 14:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRySF-0005Uh-FU; Thu, 01 Apr 2021 14:37:51 +0000
Received: by outflank-mailman (input) for mailman id 104557;
 Thu, 01 Apr 2021 14:37:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRySE-0005Uc-BS
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:37:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e281673a-7101-4cf3-854e-da29a638444f;
 Thu, 01 Apr 2021 14:37:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63CB9B270;
 Thu,  1 Apr 2021 14:37:48 +0000 (UTC)
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
X-Inumbo-ID: e281673a-7101-4cf3-854e-da29a638444f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617287868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSntaQihOmKqz4Namw9j0NVOsW9jyy3UTXyERn521pU=;
	b=QBirR6L3b4FkkZWtnd9p6sYpq54TR10QYxuBVXvWiJQ/PBLNP7KJ0//RxNDk6WpkYHConO
	YOciCzF0wpBUtPiuhNtqkwbvu2pUtZAj6IFJToCYjZO3uTxMQOUYp6tMBeaRr45wAieA8r
	WkPniQ6z8s4YkzjD3ClKq09kcRlQ6es=
Subject: Re: [PATCH 5/5] x86: don't build unused entry code when !PV32
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
 <eea7162f-bbf8-bce9-b989-2a44fe10fa99@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ba34f9cf-0815-9671-a59d-04f16397ad90@suse.com>
Date: Thu, 1 Apr 2021 16:37:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <eea7162f-bbf8-bce9-b989-2a44fe10fa99@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.04.2021 16:31, Andrew Cooper wrote:
> On 25/11/2020 08:51, Jan Beulich wrote:
>> @@ -102,19 +102,21 @@ void __dummy__(void)
>>      BLANK();
>>  #endif
>>  
>> -#ifdef CONFIG_PV
>> +#ifdef CONFIG_PV32
>>      OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);
> 
> Even if PV32 is compiled out, the is_32bit field still exists, and is
> still necessary for crash analysis.  XCA parses this offset information
> as part of dissecting /proc/vmcore.
> 
> It's one single bool in a fixed size allocation which we've got plenty
> of room in.  It can and should stay to avoid impacting the existing
> diagnostic tools.

I'm afraid I don't understand at all: I'm not removing the field.
All I'm removing is the entry for it in asm-offsets.h. I'm also
unaware that the offset information gets added anywhere in the
binary, except encoded in instructions. If a tool needs to know
the offset, it ought to parse debug info?

Jan

