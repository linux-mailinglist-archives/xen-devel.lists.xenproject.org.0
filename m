Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DACEFB405C7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 15:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106565.1457219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRWR-0006LW-Jr; Tue, 02 Sep 2025 13:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106565.1457219; Tue, 02 Sep 2025 13:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRWR-0006Ir-Gz; Tue, 02 Sep 2025 13:58:07 +0000
Received: by outflank-mailman (input) for mailman id 1106565;
 Tue, 02 Sep 2025 13:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4ch=3N=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1utRWQ-0006Il-Ok
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 13:58:06 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8b7d70e-8804-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 15:58:04 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45b804ed966so17909955e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 06:58:04 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d6cf485eb7sm9324065f8f.3.2025.09.02.06.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 06:58:03 -0700 (PDT)
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
X-Inumbo-ID: d8b7d70e-8804-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756821484; x=1757426284; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ek1y9al2DZguhIYvsCvBZB3FqsxkmpgZmJHzBGcOgQ=;
        b=etMVtFpzlauYxtcvjrmsjSH0vOFMUJUmsq38BHlmZH1qO093H0T5mL73WorKWgev3r
         Fr/6X69TpPEEcMHiWdtm7+O27d9D8qra9SYsjz3uaGeKrTLkhuLteC7DK0TREHzH8//u
         J15WhjXM/JPDoFfSAl1UsTFqc3qyiDKKv3G/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821484; x=1757426284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ek1y9al2DZguhIYvsCvBZB3FqsxkmpgZmJHzBGcOgQ=;
        b=KIna33FvV4WTKsGyNphvekczwwHa9IML/pqtNKBzkb0k4Lb2UGyYxUla8vG3MkaU7X
         dEVNurL1urlLEgE+2szah9xjrWz93kDTXoM12F8rXBzA5FAfmHg9rhOpbUGeDl/WhWx7
         b78PUJambHO6GHw11IsLjdbThwnYTxmBIbUJ5pbveaUDXuLDVCZxzoJJXuNgXfq6BPBH
         Y/uh1EQtQM/abwb8DgEc2yOHbLBF9AMt6qw6xxQeiy7cX/+ptnspqTSJpBTgEnKm3ZQA
         MMyHGBfftIxioeO7I9Y4idS3W5Bg1AMnGf8CmFU9/ctNgT5t9xR6/+rxJTZB2kHABuJ7
         ns9A==
X-Gm-Message-State: AOJu0YzluylzcCW/Jg3S3WNE/fBaq+G7Rvnxl9/2/9BlLfD8gvZzfjDN
	gLpheaTR1j/v+OVam51OO/sde0Lm20aCCBT61Ivu3Sde1GczF3/PwiTffF4ufW1xGoM=
X-Gm-Gg: ASbGnctNjrGMrHPAg6abKGWh2B03029nTc/xp7inFepcylTkuw9t502XBDjOKaMH7sE
	mwfwYANrjLenqRH3UB6txPKgdQQs/Lco30720BTmF7OBhZ8Yzhc7JZXa8r092oKUcWAqygTZb0s
	3Ii+qBNuHtWS9czOnlbP129ygv3so/LZD9itNrDDotAC0vHG/V72IsbFPbEF+WYUCKkwWvCSawm
	f22p44u7Jm7Ldk0M8QRBhr/NvSWy3++2rcmhMt80qeUteFKnQ1fhSiWZkWdFGUXfjN0DoJbivnr
	4nffQL6NDxcBCKlFJZfGnW/ZJqPDQ1RbT8Hrbj7gtN8Ut1U83z7T2jJNrcol+I7ZN1OIt+YzD+V
	1YsHtbx5fbkEPRbVffAXUUi7mo9g7G690YWcHe97btefPT9UgLSt4Spu92PzErdWIoRJxw8urFH
	KF6PA=
X-Google-Smtp-Source: AGHT+IFoAvGo536LZVpcDkyVeZyZFLfvz4UuJrZRJm1Rvw3vVhxsWZznkeq3xm0xhnlGcxaZnIgn7Q==
X-Received: by 2002:a05:600c:3b19:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-45b9a466c97mr19900485e9.31.1756821484042;
        Tue, 02 Sep 2025 06:58:04 -0700 (PDT)
Message-ID: <9f63274c-12d3-48a0-a53d-79e6106fbb53@citrix.com>
Date: Tue, 2 Sep 2025 14:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue with dom0_pvh on Xen 4.20
To: Manuel Bouyer <bouyer@antioche.eu.org>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
 <2ad255ea-6c5e-4e9a-a821-db7449432399@suse.com>
 <aLb0I01WASpFremM@mail.soc.lip6.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aLb0I01WASpFremM@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2025 2:41 pm, Manuel Bouyer wrote:
> On Tue, Sep 02, 2025 at 02:28:27PM +0200, Juergen Gross wrote:
>>> What puzzles me is that:
>>>
>>> - %cr2 is 0, so probably the first fault wasn't a page fault
>>> - RIP is %ebx + 8, so maybe the code was just clobbered by the loop?
>>>
>>> Could it be the code has been moved to this location, or is about to
>>> be moved away afterwards?
>> And indeed: from the full boot log I can see:
>>
>> (XEN)     virt_base        = 0x0
>> (XEN)     elf_paddr_offset = 0x0
>> (XEN)     virt_offset      = 0x0
>> (XEN)     virt_kstart      = 0x200000
>> (XEN)     virt_kend        = 0x17bab90
>> (XEN)     virt_entry       = 0x20e4d0
>>
>> So virt_kentry is very near to the RIP.
> thanks to this, I think I found the issue:
> with Xen 4.18, the kernel is started with ebx=17bb018; with 4.20 it's
> 100018.
>
> The bootstrap code assumes that the kernel is after the kernel,

kernel after kernel?

>  and the
> kernel symbol table. That seems to be no longer true with Xen 4.20 and a
> PVH dom0 (but probably still true in all other cases).
>
> I can deal with that, but with the new layout how do I get the end of the
> symbol table ?

ebx points to the PVH info.  This is arbitrary, like multiboot info, and
you shouldn't make assumptions about it's position relative to the other
modules loaded.

~Andrew

