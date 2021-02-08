Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA643312B7C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 09:12:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82635.152560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l91d9-0005Lw-2o; Mon, 08 Feb 2021 08:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82635.152560; Mon, 08 Feb 2021 08:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l91d8-0005LX-Vi; Mon, 08 Feb 2021 08:10:46 +0000
Received: by outflank-mailman (input) for mailman id 82635;
 Mon, 08 Feb 2021 08:10:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l91d6-0005LS-VE
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 08:10:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 697bc72d-9360-4730-9d6e-4fb6418fe8d3;
 Mon, 08 Feb 2021 08:10:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CFD21AC43;
 Mon,  8 Feb 2021 08:10:42 +0000 (UTC)
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
X-Inumbo-ID: 697bc72d-9360-4730-9d6e-4fb6418fe8d3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612771842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9syUDH9NP6Li6L1TbJwrwj5Fu3nAKSVDz0SCErkMfXM=;
	b=kFnkqjS7EX6v4T6E4TmrDcQhWjVgvIBeVMOGt8aBl8gxI5p7JW3W41HYItPKCP3N+pRj+D
	xF/QQGDmd+3WFx6ygxhlGi9nyNFFOMQXoUc6ojipTgO3gKhMvS2R5IsVpYaY5Tm2yQWfZm
	g9uTiBKQPzJbWlycrRgP+GQchsHTy1k=
Subject: Re: [PATCH] x86/build: correctly record dependencies of asm-offsets.s
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b3b57f6b-3ed9-18f6-2a87-6af3304c6645@suse.com>
 <c2b857fa-a606-1795-3aaf-a69572c43951@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <304c2f74-40d5-5927-2401-f5d451ff6788@suse.com>
Date: Mon, 8 Feb 2021 09:10:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c2b857fa-a606-1795-3aaf-a69572c43951@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.02.2021 10:09, Julien Grall wrote:
> On 01/02/2021 14:56, Jan Beulich wrote:
>> Going through an intermediate *.new file requires telling the compiler
>> what the real target is, so that the inclusion of the resulting .*.d
>> file will actually be useful.
>>
>> Fixes: 7d2d7a43d014 ("x86/build: limit rebuilding of asm-offsets.h")
>> Reported-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Already on the original patch I did suggest that perhaps Arm would want
>> to follow suit. So again - perhaps the rules should be unified by moving
>> to common code?
> 
> Sorry I missed the original patch. The recent changes looks beneficials 
> to Arm as well.

Okay, I can make a patch then (for 4.16) to make this common
as far as possible.

>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -241,7 +241,7 @@ efi/buildid.o efi/relocs-dummy.o: $(BASE
>>   efi/buildid.o efi/relocs-dummy.o: ;
>>   
>>   asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c $(BASEDIR)/include/asm-x86/asm-macros.h
> 
> On Arm, only asm-offsets.c is a pre-requisite. May I ask why you need 
> the second on x86?

Because this header gets used by the file and hence needs
generating up front? But that's nothing Arm needs to worry
about - I intend to allow extra per-arch dependencies, no
matter that common things are to become common.

Jan

