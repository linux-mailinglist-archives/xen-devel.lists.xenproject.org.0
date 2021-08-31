Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F593FC309
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 09:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175486.319697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKxr9-0004hL-GJ; Tue, 31 Aug 2021 07:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175486.319697; Tue, 31 Aug 2021 07:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKxr9-0004eo-Cj; Tue, 31 Aug 2021 07:06:51 +0000
Received: by outflank-mailman (input) for mailman id 175486;
 Tue, 31 Aug 2021 07:06:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vpuq=NW=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mKxr7-0004eg-Kw
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 07:06:49 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed79fbfe-1562-4a09-8586-91660880c568;
 Tue, 31 Aug 2021 07:06:48 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id c8so23871748lfi.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Aug 2021 00:06:48 -0700 (PDT)
Received: from [192.168.10.179] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id m1sm975099lfc.144.2021.08.31.00.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 00:06:46 -0700 (PDT)
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
X-Inumbo-ID: ed79fbfe-1562-4a09-8586-91660880c568
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+ifqEG0dqToNH+VM7lR9NzAT93Xb/qNc6QFPNtEMEs8=;
        b=r0V7+BfRqZ3HT+mck3Hb+UqPMsK4HKipU6bAhlfKLf7g4f/1iwVVHkygHpkL/8A3S8
         U7lPZNMPMM5psGrj1d+Mggz4zQQa6WFO6R6+dwgOWW9yeXnI9NYgIjTEOYLntUyXuLvW
         pXm4qGpJMXDEAwBshXHVNvEQLYE98RONQahsjoDG915jxmeXTJKG8TTNKA8txVjUW/2w
         GDJ+74ENmqoftzZHWZErV1QaNhWKuoZip3w9XdqO4zRQsVI+cbvfO7Al+KBDIdeEkERV
         Xd1whQhG2IDdLM0TlIiL4NeSp1zUA48780JDogzwWYgBJDn5nxiWVAQ/B84CF87LdVOd
         emLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+ifqEG0dqToNH+VM7lR9NzAT93Xb/qNc6QFPNtEMEs8=;
        b=FcOxyTh9MbM0xd2EL6an9/ceAKsO1O1ZSNfZEDzS4q+SnWVT+jw8IIGu04dxZ4vtFX
         aPB4D9xQrYgY8SYQH7wrzn7mLxa7LpVd2XTRUourkf3Msh+c+6uHEl8O+v7s3LnmDCN0
         x3YiaVBVak1AnsKGt37URkCn4X4nFJkw3dpC5C8av9zmjXLaxUfeHmAaXmSpCsyZqEXk
         cc9obtV3V/yecpefxPG8ZwNpLl3Z2JlGtLVrvPR4OOpBzBgZ6zZNpRs8rYT7d8ma89yJ
         1+OKnmOBifWTvG9MCNzpp0ynQgj3baAgBmNh0IJsPGOinpxg3hU8HmSiy2R4XP9bn9r3
         hXrA==
X-Gm-Message-State: AOAM53092opiFFjvYYPPmTwdCvozKYnNjt2tItzCx0bV4BBTEDP3f5OH
	qTSpQt/WoJsByO9RMGtBlyajlEaWHJ66Fw==
X-Google-Smtp-Source: ABdhPJwDsYEipFqgau7U2F64s0+TRToj3KLxUwaqZC6tbUxtAAXIk3kl0HrPpl6a2sDEbCU3vh565A==
X-Received: by 2002:a05:6512:3767:: with SMTP id z7mr20559840lft.128.1630393606991;
        Tue, 31 Aug 2021 00:06:46 -0700 (PDT)
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
 <b2e8863d-217a-fc0e-3176-a20ef5ad0872@gmail.com>
 <e87ad2a2-7ee0-a2e7-7bab-0c332aca7aec@suse.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <3a6ca3ac-8771-2a80-285e-701c5c1b8343@gmail.com>
Date: Tue, 31 Aug 2021 10:06:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e87ad2a2-7ee0-a2e7-7bab-0c332aca7aec@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 31.08.21 09:51, Jan Beulich wrote:
> On 31.08.2021 07:35, Oleksandr Andrushchenko wrote:
>> Hello, Jan!
>>
>> On 30.08.21 16:04, Jan Beulich wrote:
>>> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
>>> console) are associated with DomXEN, not Dom0. This means that while
>>> looking for overlapping BARs such devices cannot be found on Dom0's
>>> list of devices; DomXEN's list also needs to be scanned.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> RFC: Patch intentionally mis-formatted, as the necessary re-indentation
>>>        would make the diff difficult to read. At this point I'd merely
>>>        like to gather input towards possible better approaches to solve
>>>        the issue (not the least because quite possibly there are further
>>>        places needing changing).
>>>
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -206,6 +206,7 @@ static int modify_bars(const struct pci_
>>>        struct vpci_header *header = &pdev->vpci->header;
>>>        struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>>>        struct pci_dev *tmp, *dev = NULL;
>>> +    const struct domain *d;
>>>        const struct vpci_msix *msix = pdev->vpci->msix;
>>>        unsigned int i;
>>>        int rc;
>>> @@ -265,7 +266,8 @@ static int modify_bars(const struct pci_
>>>         * Check for overlaps with other BARs. Note that only BARs that are
>>>         * currently mapped (enabled) are checked for overlaps.
>>>         */
>>> -    for_each_pdev ( pdev->domain, tmp )
>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
>> I am not quite sure this will be correct for the cases where pdev->domain != dom0,
>> e.g. in the series for PCI passthrough for Arm this can be any guest. For such cases
>> we'll force running the loop for dom_xen which I am not sure is desirable.
> It is surely not desirable, but it also doesn't happen - see the
> is_hardware_domain() check further down (keeping context below).
Right
>
>> Another question is why such a hidden device has its pdev->domain not set correctly,
>> so we need to work this around?
> Please see _setup_hwdom_pci_devices() and commit e46ea4d44dc0
> ("PCI: don't allow guest assignment of devices used by Xen")
> introducing that temporary override. To permit limited
> visibility to Dom0, these devices still need setting up in the
> IOMMU for Dom0. Consequently BAR overlap detection also needs
> to take these into account (i.e. the goal here is not just to
> prevent triggering the ASSERT() in question).

So, why don't we set pdev->domain = dom_xen for such devices and call

modify_bars or something from pci_hide_device for instance (I didn't get too

much into implementation details though)? If pci_hide_device already handles

such exceptions, so it should also take care of the correct BAR overlaps etc.

Otherwise it looks like we put some unrelated logic into vpci which is for hiding

the devices (on x86).

Thank you,

Oleksandr

>
> Jan
>
>>> @@ -308,6 +311,7 @@ static int modify_bars(const struct pci_
>>>                }
>>>            }
>>>        }
>>> +if ( !is_hardware_domain(d) ) break; }//todo
>>>    
>>>        ASSERT(dev);
>>>    
>>>
>>>

