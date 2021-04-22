Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C6F367EE5
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 12:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115260.219796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZWnJ-0002Ou-Ug; Thu, 22 Apr 2021 10:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115260.219796; Thu, 22 Apr 2021 10:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZWnJ-0002OV-RC; Thu, 22 Apr 2021 10:42:49 +0000
Received: by outflank-mailman (input) for mailman id 115260;
 Thu, 22 Apr 2021 10:42:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZWnH-0002OQ-JA
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 10:42:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99e84c49-b934-4c92-8994-f70f93ff9f35;
 Thu, 22 Apr 2021 10:42:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70222B0B6;
 Thu, 22 Apr 2021 10:42:44 +0000 (UTC)
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
X-Inumbo-ID: 99e84c49-b934-4c92-8994-f70f93ff9f35
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619088164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=45FTwVYKH95AzB1dsK0EwocVtsI0g2dqmq3noSQHh7M=;
	b=Kkr82tK7dzfE7E1BM4O+W+RYeqRIanLM79ykdfYHp/RPDx7hXrZgEGG1jJrnOb8bZ0kcng
	lo7T7Rx/NiBL6WLoCQmbKhyVSXuOX8tCcZl8BcQERlxm/42Pk8LUKZ9v1PMbfqPHItmtKn
	Bqjjr1odGDWxSwC2RtWus7O+/M99mTg=
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
 <fa822374-ce07-473d-b6b6-2d8073ff83a6@suse.com>
 <YIEkPorW1vEibACD@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e102d7d-d633-7865-ea03-5d56238fb3c3@suse.com>
Date: Thu, 22 Apr 2021 12:42:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIEkPorW1vEibACD@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.04.2021 09:22, Roger Pau Monné wrote:
> On Wed, Apr 21, 2021 at 05:34:29PM +0200, Jan Beulich wrote:
>> On 21.04.2021 17:20, Roger Pau Monné wrote:
>>> On Wed, Apr 21, 2021 at 02:03:49PM +0200, Jan Beulich wrote:
>>>> On 21.04.2021 12:21, Roger Pau Monné wrote:
>>>>> On Thu, Apr 01, 2021 at 11:46:44AM +0200, Jan Beulich wrote:
>>>>>> @@ -189,7 +208,11 @@ EFI_LDFLAGS += --no-insert-timestamp
>>>>>>  endif
>>>>>>  
>>>>>>  $(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
>>>>>> +ifeq ($(MKRELOC),:)
>>>>>> +$(TARGET).efi: ALT_BASE :=
>>>>>> +else
>>>>>>  $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
>>>>>
>>>>> Could you maybe check whether $(relocs-dummy) is set as the condition
>>>>> here and use it here instead of efi/relocs-dummy.o?
>>>>
>>>> I can use it in the ifeq() if you think that's neater (the current way
>>>> is minimally shorter), but using it in the ALT_BASE assignment would
>>>> make this differ more from the VIRT_BASE one, which I'd like to avoid.
>>>
>>> Sorry, I think I'm slightly confused because when the linker can
>>> produce the required relocations relocs-dummy variable is left empty,
>>> so it won't be added to $(TARGET).efi.
>>>
>>> But we still need to generate the efi/relocs-dummy.o file for the ELF
>>> build I assume?
>>
>> Not anymore (after "x86/EFI: redo .reloc section bounds determination").
>> We need it, as said, to fish VIRT_BASE out of it. It indeed wouldn't get
>> linked into any of the final binaries anymore.
> 
> Could you please add some text to the commit message to note that
> while relocs-dummy is not linked into the final binary it's still
> needed to get VIRT_BASE?

I've added

"Note that in the case that we leave base relocation generation to ld,
 while efi/relocs-dummy.o then won't be linked into any executable
 anymore, it still needs generating (and hence dependencies need to be
 kept as they are) in order to have VIRT_BASE pulled out of it."

> With that:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> FWIW, it would also be nice to add some comments to the $(TARGET).efi
> target commands, as it's quite impenetrable right now.

Well, my preferred plan was to pull it (and $(TARGET)-sym's) apart
into separate steps, suitably linked together via dependencies. This
may not eliminate altogether the need for some comments, but we then
may get away with brief ones.

Jan

