Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07803366F47
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 17:34:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114862.218982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEs3-0004qp-Vo; Wed, 21 Apr 2021 15:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114862.218982; Wed, 21 Apr 2021 15:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEs3-0004qT-Sh; Wed, 21 Apr 2021 15:34:31 +0000
Received: by outflank-mailman (input) for mailman id 114862;
 Wed, 21 Apr 2021 15:34:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZEs3-0004qO-6B
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 15:34:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7b9b76f-5799-4841-b26b-1d28f7fd7936;
 Wed, 21 Apr 2021 15:34:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9AFABB4F4;
 Wed, 21 Apr 2021 15:34:29 +0000 (UTC)
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
X-Inumbo-ID: e7b9b76f-5799-4841-b26b-1d28f7fd7936
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619019269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hx6gVI3xRsjkXarMiANOTT/HKfqcKKR2dg+OLV983X8=;
	b=e2Cxvdb/e8C0pIv1dbxHXPts2XAsPkEZAZ7f5qpFOYnkrM76G8gATimRxB+jyN5q0zYE17
	5Dw6W7xHijgjLdQh4GXh4NxCTjWYIWa+0UpwGXt9ij1FnqBWtRNqdlkioJXvt3wEJY28pD
	VMb7MKUAQ0khkF9k+h5V1s0sa8opzWw=
Subject: Re: [PATCH 6/8] x86/EFI: avoid use of GNU ld's
 --disable-reloc-section when possible
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <ff15338a-ca10-ff38-3c2a-459303ce9d68@suse.com>
 <YH/8rb0aENMqOLAn@Air-de-Roger>
 <dada98e8-3e4a-94df-0678-bdd2a0e8de04@suse.com>
 <YIBC1XWTQzjykk1k@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa822374-ce07-473d-b6b6-2d8073ff83a6@suse.com>
Date: Wed, 21 Apr 2021 17:34:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIBC1XWTQzjykk1k@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 17:20, Roger Pau Monné wrote:
> On Wed, Apr 21, 2021 at 02:03:49PM +0200, Jan Beulich wrote:
>> On 21.04.2021 12:21, Roger Pau Monné wrote:
>>> On Thu, Apr 01, 2021 at 11:46:44AM +0200, Jan Beulich wrote:
>>>> @@ -189,7 +208,11 @@ EFI_LDFLAGS += --no-insert-timestamp
>>>>  endif
>>>>  
>>>>  $(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
>>>> +ifeq ($(MKRELOC),:)
>>>> +$(TARGET).efi: ALT_BASE :=
>>>> +else
>>>>  $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
>>>
>>> Could you maybe check whether $(relocs-dummy) is set as the condition
>>> here and use it here instead of efi/relocs-dummy.o?
>>
>> I can use it in the ifeq() if you think that's neater (the current way
>> is minimally shorter), but using it in the ALT_BASE assignment would
>> make this differ more from the VIRT_BASE one, which I'd like to avoid.
> 
> Sorry, I think I'm slightly confused because when the linker can
> produce the required relocations relocs-dummy variable is left empty,
> so it won't be added to $(TARGET).efi.
> 
> But we still need to generate the efi/relocs-dummy.o file for the ELF
> build I assume?

Not anymore (after "x86/EFI: redo .reloc section bounds determination").
We need it, as said, to fish VIRT_BASE out of it. It indeed wouldn't get
linked into any of the final binaries anymore.

Jan

