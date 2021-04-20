Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7E365C92
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 17:48:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113887.216988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsbR-0003IQ-D2; Tue, 20 Apr 2021 15:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113887.216988; Tue, 20 Apr 2021 15:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsbR-0003I1-A0; Tue, 20 Apr 2021 15:47:53 +0000
Received: by outflank-mailman (input) for mailman id 113887;
 Tue, 20 Apr 2021 15:47:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYsbP-0003Hw-Cf
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 15:47:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77b032fb-fb18-4f72-bd04-415397e7bce8;
 Tue, 20 Apr 2021 15:47:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BBA35B4B1;
 Tue, 20 Apr 2021 15:47:49 +0000 (UTC)
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
X-Inumbo-ID: 77b032fb-fb18-4f72-bd04-415397e7bce8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618933669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5fxugZuTImhiQsv8DmDNU1HZA2gMgWqPfo2rpD0EcpU=;
	b=jK1E3zsF1vpkzU94HF2WS32feZNXge/XPi9MovmYnvr4uxIYE5+wuXmEo2TQq7/dSE4DzT
	BTRpTWD296wq143onZfkwHEiRpHf4xhCFd1fkNU8YOuYxxCiMvKft2F2T/k2sRMBLnLJCM
	ctn4WUaM3AmC2Yicb1LEyQtURQTCQC0=
Subject: Re: [PATCH] build: centralize / unify asm-offsets generation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
 <YH7zXpPz03+kLzEr@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9de883b-604b-1193-b748-5a59795a9f31@suse.com>
Date: Tue, 20 Apr 2021 17:47:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YH7zXpPz03+kLzEr@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.04.2021 17:29, Roger Pau Monné wrote:
> On Thu, Apr 01, 2021 at 10:33:47AM +0200, Jan Beulich wrote:
>> @@ -399,7 +399,11 @@ include/xen/compile.h: include/xen/compi
>>  	@sed -rf tools/process-banner.sed < .banner >> $@.new
>>  	@mv -f $@.new $@
>>  
>> -include/asm-$(TARGET_ARCH)/asm-offsets.h: arch/$(TARGET_ARCH)/asm-offsets.s
>> +asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
>> +	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
>> +	$(call move-if-changed,$@.new,$@)
> 
> Won't it be more natural to keep the .s file in arch/$(TARGET_ARCH)?

Yes and no: Yes as far as the actual file location is concerned.
No when considering where it gets generated: I generally consider
it risky to generate files outside of the directory where make
currently runs. There may be good reasons for certain exceptions,
but personally I don't see this case as good enough a reason.

Somewhat related - if doing as you suggest, which Makefile's
clean: rule should clean up that file in your opinion?

Nevertheless, if there's general agreement that keeping the file
there is better, I'd make the change and simply ignore my unhappy
feelings about it.

Jan

