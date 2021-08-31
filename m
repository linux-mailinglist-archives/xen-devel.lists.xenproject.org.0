Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A60D3FC399
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 10:14:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175548.319761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKyuP-00079S-73; Tue, 31 Aug 2021 08:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175548.319761; Tue, 31 Aug 2021 08:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKyuP-00076p-32; Tue, 31 Aug 2021 08:14:17 +0000
Received: by outflank-mailman (input) for mailman id 175548;
 Tue, 31 Aug 2021 08:14:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vpuq=NW=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mKyuO-00076j-63
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 08:14:16 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 344a5e61-40cd-4d31-8413-5511fc36e22a;
 Tue, 31 Aug 2021 08:14:15 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b4so36720537lfo.13
 for <xen-devel@lists.xenproject.org>; Tue, 31 Aug 2021 01:14:14 -0700 (PDT)
Received: from [192.168.10.179] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id y5sm2091547ljd.38.2021.08.31.01.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 01:14:13 -0700 (PDT)
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
X-Inumbo-ID: 344a5e61-40cd-4d31-8413-5511fc36e22a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kwICElKfsHEoEJbxVvlIdSVEF8VKH7JIroTurxB76OU=;
        b=LW1McmcPJgNmBPA6i6zuaWLJ2Td3vbxPQZRb02pxcr9JEVFxsrxh6Q+Nu0L8A5DJ5k
         Onc9vr2zxM2Fbm6dObDkWNtxiH5oa5uKkgM2OT1x6NHKOElyk8f3PReO0p7irjOtSPQq
         Awn6HLmTSNRgk6Cf5abR7y7KhITS39rA19yDz6ne2oQRSvqdyIkGrRTht4d09rJI38ui
         bxH8lnbITSm0EsNPBDPLZsuXXSz+gtQfBRbCpFo/I+2Z1hH8s1NZd3mhjwFpZ8zx08GV
         qs7twzNA0Q/vTrLjmIWEoS2wyHIKEirgTK8U2n5RRNZ99Ivft1+ygKuDI/AGCDV/wf1O
         +3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kwICElKfsHEoEJbxVvlIdSVEF8VKH7JIroTurxB76OU=;
        b=VOlllwxGxQuX85/bG6FHTmmoCZz9vH8ECPssNaxWRD+x4LkfXd401wcex91Zt72y+l
         Qpyhep3Pz6MzDTA5ZFNYdDU/682tzq6olyzMTjy9/bkbGluOJmegRolHyYTrB0FX+RMo
         5LLh2QcunFWd+d9VkzCCoTYGbgsluqfzsOB9V8geXGE9Rz/FdkqDiL9JFdVbu5JLfXKv
         KPMrTuJwkbFxM/S5o9JoWeMhsosim+UH2ZS9MWRHEBTNBkxkO2akWh4ErkfUuYdYYMKo
         pYYg6Hzz2VFd+w20Os3HD1BHe0l7i0pbK+XzNrSn1UIZv+iXdKCvTqnDRnrKqAhuR/wi
         GESA==
X-Gm-Message-State: AOAM531g6EHWREGnbu4gE7wSmBTivtOlZS/aYF/y8yV9Qt2ayicZx+or
	n3T6Ls6nCHnf6a6gbIPvLm5QtQ7GRonhrg==
X-Google-Smtp-Source: ABdhPJyWHc+S45V7x/EfZA5ariz/JgqDb3a4SuSoZ8ws4kFLYa/QHOLgwN7MA7S5S6CoqVLeeB2K3Q==
X-Received: by 2002:a05:6512:1043:: with SMTP id c3mr17857914lfb.358.1630397653546;
        Tue, 31 Aug 2021 01:14:13 -0700 (PDT)
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
 <b2e8863d-217a-fc0e-3176-a20ef5ad0872@gmail.com>
 <e87ad2a2-7ee0-a2e7-7bab-0c332aca7aec@suse.com>
 <3a6ca3ac-8771-2a80-285e-701c5c1b8343@gmail.com>
 <956dd02c-553e-6aa2-eedf-28703a6ded32@suse.com>
 <13eb638e-c3c5-6794-c828-04c66bb2bd2f@gmail.com>
 <8295cd88-4e4e-4189-cf27-ce83823357df@suse.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <1f571749-5d41-7c4d-8ca0-afc91d2f83fe@gmail.com>
Date: Tue, 31 Aug 2021 11:14:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8295cd88-4e4e-4189-cf27-ce83823357df@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 31.08.21 11:05, Jan Beulich wrote:
> On 31.08.2021 09:56, Oleksandr Andrushchenko wrote:
>> On 31.08.21 10:47, Jan Beulich wrote:
>>> On 31.08.2021 09:06, Oleksandr Andrushchenko wrote:
>>>> On 31.08.21 09:51, Jan Beulich wrote:
>>>>> On 31.08.2021 07:35, Oleksandr Andrushchenko wrote:
>>>>>> On 30.08.21 16:04, Jan Beulich wrote:
>>>>>>> @@ -265,7 +266,8 @@ static int modify_bars(const struct pci_
>>>>>>>           * Check for overlaps with other BARs. Note that only BARs that are
>>>>>>>           * currently mapped (enabled) are checked for overlaps.
>>>>>>>           */
>>>>>>> -    for_each_pdev ( pdev->domain, tmp )
>>>>>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
>>>>>> I am not quite sure this will be correct for the cases where pdev->domain != dom0,
>>>>>> e.g. in the series for PCI passthrough for Arm this can be any guest. For such cases
>>>>>> we'll force running the loop for dom_xen which I am not sure is desirable.
>>>>> It is surely not desirable, but it also doesn't happen - see the
>>>>> is_hardware_domain() check further down (keeping context below).
>>>> Right
>>>>>> Another question is why such a hidden device has its pdev->domain not set correctly,
>>>>>> so we need to work this around?
>>>>> Please see _setup_hwdom_pci_devices() and commit e46ea4d44dc0
>>>>> ("PCI: don't allow guest assignment of devices used by Xen")
>>>>> introducing that temporary override. To permit limited
>>>>> visibility to Dom0, these devices still need setting up in the
>>>>> IOMMU for Dom0. Consequently BAR overlap detection also needs
>>>>> to take these into account (i.e. the goal here is not just to
>>>>> prevent triggering the ASSERT() in question).
>>>> So, why don't we set pdev->domain = dom_xen for such devices and call
>>>> modify_bars or something from pci_hide_device for instance (I didn't get too
>>>> much into implementation details though)? If pci_hide_device already handles
>>>> such exceptions, so it should also take care of the correct BAR overlaps etc.
>>> How would it? It runs long before Dom0 gets created, let alone when
>>> Dom0 may make adjustments to the BAR arrangement.
>> So, why don't we call "yet another hide function" while creating Dom0 for that
>> exactly reason, e.g. BAR overlap handling? E.g. make it 2-stage hide for special
>> devices such as console etc.
> This might be an option, but is imo going to result not only in more
> code churn, but also in redundant code. After all what modify_bars()
> needs is the union of BARs from Dom0's and DomXEN's devices.

To me DomXEN here is yet another workaround as strictly speaking

vpci code didn't need and doesn't(?) need it at the moment. Yes, at least on Arm.

So, I do understand why you want it there, but this then does need a very

good description of what is happening and why...

>
>>> The temporary overriding of pdev->domain is because other IOMMU code
>>> takes the domain to act upon from that field.
>> So, you mean pdev->domain in that case is pointing to what?
> Did you look at the function I've pointed you at? DomXEN there gets
> temporarily overridden to Dom0.

This looks like yet another workaround to me which is not cute.

So, the overall solution is spread over multiple subsystems, each

introducing something which is hard to follow

>
>>>    This could have been
>>> solved without override, but then much heavier code churn would have
>>> resulted.
>>>
>>>> Otherwise it looks like we put some unrelated logic into vpci which is for hiding
>>>> the devices (on x86).
>>> Hiding devices is in no way x86-specific.
>> I mean that the use-case you have, e.g. a *PCI* console you want to hide,
>> is definitely not something used on Arm at least.
> Not yet, that is? Why would - in the long run - somebody not want to
> put in a PCI serial card in a system that supports PCI and has no
> (available) other serial port? And if you have looked at the commit
> I did point you at
I did
> , you will also have found that it's more than just
> the serial device that we hide.
Serial was just an example from the list
>
> Jan
>

