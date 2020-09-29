Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9098E27CB66
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 14:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156.339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEjV-0007KT-Lh; Tue, 29 Sep 2020 12:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156.339; Tue, 29 Sep 2020 12:27:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEjV-0007K2-IS; Tue, 29 Sep 2020 12:27:49 +0000
Received: by outflank-mailman (input) for mailman id 156;
 Tue, 29 Sep 2020 12:27:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hLWn=DG=gmail.com=yefremov.denis@srs-us1.protection.inumbo.net>)
 id 1kNEjT-0007Jx-QR
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:27:47 +0000
Received: from mail-lj1-f195.google.com (unknown [209.85.208.195])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc2d691e-8f25-4d90-8c0e-9779dae4b258;
 Tue, 29 Sep 2020 12:27:46 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id u4so3836455ljd.10
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 05:27:46 -0700 (PDT)
Received: from [10.68.32.147] (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.gmail.com with ESMTPSA id v10sm3226620lfq.196.2020.09.29.05.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 05:27:44 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hLWn=DG=gmail.com=yefremov.denis@srs-us1.protection.inumbo.net>)
	id 1kNEjT-0007Jx-QR
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:27:47 +0000
X-Inumbo-ID: dc2d691e-8f25-4d90-8c0e-9779dae4b258
Received: from mail-lj1-f195.google.com (unknown [209.85.208.195])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id dc2d691e-8f25-4d90-8c0e-9779dae4b258;
	Tue, 29 Sep 2020 12:27:46 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id u4so3836455ljd.10
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 05:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5LpzM4vQoobc9kaCYMhDB7F4zI869dTRYnaefSpEwvU=;
        b=jIDAXZ8gJ1qhi83KKh2z5USB8Vi80Nak/VFokHMyJEpqyuJccVTAI/in8jphBoUs9c
         fNcZs8Bwr9TnXemjNR/O7utZWBbkzNO8QkeoSTbmPqvUpKe/vDAoo/hbY969oG7GWbfp
         wMkYHExadl71D7dMzBlCDrrMwY26rzrELR3kdE1ivULLj6SCtbquZlnyfmkQ5R9t6G8k
         PsFZ+UId4IDFrInht6OGNx+4KKwV5duCijxisvpTpAuNyL1GKEqC5qSFjBQOV+IRw8qZ
         zOK7KSDPL8jkBt6WnBWboN8HxR0C5csZkLJUtVA2hydGXWKCAfxTy6mm8sWwkEfwnhC1
         TzHw==
X-Gm-Message-State: AOAM531troqCj641CxE24HgUA0GGvhbR4N4uDuJajvaBoYlsHzn1qpuk
	TQqYjvHplG+bMOlPrxjOPak=
X-Google-Smtp-Source: ABdhPJzCrn356v9FzA3ljB34RJfimgF9EhAZtlLm1zG27/cSwulZvycvVthcrxnz8c0lGmK4rjbB4w==
X-Received: by 2002:a2e:3a10:: with SMTP id h16mr1031044lja.193.1601382465482;
        Tue, 29 Sep 2020 05:27:45 -0700 (PDT)
Received: from [10.68.32.147] (broadband-37-110-38-130.ip.moscow.rt.ru. [37.110.38.130])
        by smtp.gmail.com with ESMTPSA id v10sm3226620lfq.196.2020.09.29.05.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 05:27:44 -0700 (PDT)
Reply-To: efremov@linux.com
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roman Shaposhnik <roman@zededa.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20200927111405.GJ3962@mail-itl>
 <26fe7920-d6a8-fb8a-b97c-59565410eff4@suse.com>
 <20200928093654.GW1482@mail-itl>
From: Denis Efremov <efremov@linux.com>
Autocrypt: addr=efremov@linux.com; keydata=
 mQINBFsJUXwBEADDnzbOGE/X5ZdHqpK/kNmR7AY39b/rR+2Wm/VbQHV+jpGk8ZL07iOWnVe1
 ZInSp3Ze+scB4ZK+y48z0YDvKUU3L85Nb31UASB2bgWIV+8tmW4kV8a2PosqIc4wp4/Qa2A/
 Ip6q+bWurxOOjyJkfzt51p6Th4FTUsuoxINKRMjHrs/0y5oEc7Wt/1qk2ljmnSocg3fMxo8+
 y6IxmXt5tYvt+FfBqx/1XwXuOSd0WOku+/jscYmBPwyrLdk/pMSnnld6a2Fp1zxWIKz+4VJm
 QEIlCTe5SO3h5sozpXeWS916VwwCuf8oov6706yC4MlmAqsQpBdoihQEA7zgh+pk10sCvviX
 FYM4gIcoMkKRex/NSqmeh3VmvQunEv6P+hNMKnIlZ2eJGQpz/ezwqNtV/przO95FSMOQxvQY
 11TbyNxudW4FBx6K3fzKjw5dY2PrAUGfHbpI3wtVUNxSjcE6iaJHWUA+8R6FLnTXyEObRzTS
 fAjfiqcta+iLPdGGkYtmW1muy/v0juldH9uLfD9OfYODsWia2Ve79RB9cHSgRv4nZcGhQmP2
 wFpLqskh+qlibhAAqT3RQLRsGabiTjzUkdzO1gaNlwufwqMXjZNkLYu1KpTNUegx3MNEi2p9
 CmmDxWMBSMFofgrcy8PJ0jUnn9vWmtn3gz10FgTgqC7B3UvARQARAQABtCFEZW5pcyBFZnJl
 bW92IDxlZnJlbW92QGxpbnV4LmNvbT6JAlcEEwEIAEECGwMFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4ACGQEWIQR2VAM2ApQN8ZIP5AO1IpWwM1AwHwUCXsQtuwUJB31DPwAKCRC1IpWwM1Aw
 H3dQD/9E/hFd2yPwWA5cJ5jmBeQt4lBi5wUXd2+9Y0mBIn40F17Xrjebo+D8E5y6S/wqfImW
 nSDYaMfIIljdjmUUanR9R7Cxd/Z548Qaa4F1AtB4XN3W1L49q21h942iu0yxSLZtq9ayeja6
 flCB7a+gKjHMWFDB4nRi4gEJvZN897wdJp2tAtUfErXvvxR2/ymKsIf5L0FZBnIaGpqRbfgG
 Slu2RSpCkvxqlLaYGeYwGODs0QR7X2i70QGeEzznN1w1MGKLOFYw6lLeO8WPi05fHzpm5pK6
 mTKkpZ53YsRfWL/HY3kLZPWm1cfAxa/rKvlhom+2V8cO4UoLYOzZLNW9HCFnNxo7zHoJ1shR
 gYcCq8XgiJBF6jfM2RZYkOAJd6E3mVUxctosNq6av3NOdsp1Au0CYdQ6Whi13azZ81pDlJQu
 Hdb0ZpDzysJKhORsf0Hr0PSlYKOdHuhl8fXKYOGQxpYrWpOnjrlEORl7NHILknXDfd8mccnf
 4boKIZP7FbqSLw1RSaeoCnqH4/b+ntsIGvY3oJjzbQVq7iEpIhIoQLxeklFl1xvJAOuSQwII
 I9S0MsOm1uoT/mwq+wCYux4wQhALxSote/EcoUxK7DIW9ra4fCCo0bzaX7XJ+dJXBWb0Ixxm
 yLl39M+7gnhvZyU+wkTYERp1qBe9ngjd0QTZNVi7MbkCDQRbCVF8ARAA3ITFo8OvvzQJT2cY
 nPR718Npm+UL6uckm0Jr0IAFdstRZ3ZLW/R9e24nfF3A8Qga3VxJdhdEOzZKBbl1nadZ9kKU
 nq87te0eBJu+EbcuMv6+njT4CBdwCzJnBZ7ApFpvM8CxIUyFAvaz4EZZxkfEpxaPAivR1Sa2
 2x7OMWH/78laB6KsPgwxV7fir45VjQEyJZ5ac5ydG9xndFmb76upD7HhV7fnygwf/uIPOzNZ
 YVElGVnqTBqisFRWg9w3Bqvqb/W6prJsoh7F0/THzCzp6PwbAnXDedN388RIuHtXJ+wTsPA0
 oL0H4jQ+4XuAWvghD/+RXJI5wcsAHx7QkDcbTddrhhGdGcd06qbXe2hNVgdCtaoAgpCEetW8
 /a8H+lEBBD4/iD2La39sfE+dt100cKgUP9MukDvOF2fT6GimdQ8TeEd1+RjYyG9SEJpVIxj6
 H3CyGjFwtIwodfediU/ygmYfKXJIDmVpVQi598apSoWYT/ltv+NXTALjyNIVvh5cLRz8YxoF
 sFI2VpZ5PMrr1qo+DB1AbH00b0l2W7HGetSH8gcgpc7q3kCObmDSa3aTGTkawNHzbceEJrL6
 mRD6GbjU4GPD06/dTRIhQatKgE4ekv5wnxBK6v9CVKViqpn7vIxiTI9/VtTKndzdnKE6C72+
 jTwSYVa1vMxJABtOSg8AEQEAAYkCPAQYAQgAJgIbDBYhBHZUAzYClA3xkg/kA7UilbAzUDAf
 BQJexC4MBQkHfUOQAAoJELUilbAzUDAfPYoQAJdBGd9WZIid10FCoI30QXA82SHmxWe0Xy7h
 r4bbZobDPc7GbTHeDIYmUF24jI15NZ/Xy9ADAL0TpEg3fNVad2eslhCwiQViWfKOGOLLMe7v
 zod9dwxYdGXnNRlW+YOCdFNVPMvPDr08zgzXaZ2+QJjp44HSyzxgONmHAroFcqCFUlfAqUDO
 T30gV5bQ8BHqvfWyEhJT+CS3JJyP8BmmSgPa0Adlp6Do+pRsOO1YNNO78SYABhMi3fEa7X37
 WxL31TrNCPnIauTgZtf/KCFQJpKaakC3ffEkPhyTjEl7oOE9xccNjccZraadi+2uHV0ULA1m
 ycHhb817A03n1I00QwLf2wOkckdqTqRbFFI/ik69hF9hemK/BmAHpShI+z1JsYT9cSs8D7wb
 aF/jQVy4URensgAPkgXsRiboqOj/rTz9F5mpd/gPU/IOUPFEMoo4TInt/+dEVECHioU3RRrW
 EahrGMfRngbdp/mKs9aBR56ECMfFFUPyI3VJsNbgpcIJjV/0N+JdJKQpJ/4uQ2zNm0wH/RU8
 CRJvEwtKemX6fp/zLI36Gvz8zJIjSBIEqCb7vdgvWarksrhmi6/Jay5zRZ03+k6YwiqgX8t7
 ANwvYa1h1dQ36OiTqm1cIxRCGl4wrypOVGx3OjCar7sBLD+NkwO4RaqFvdv0xuuy4x01VnOF
Subject: Re: Kernel panic on 'floppy' module load, Xen HVM, since 4.19.143
Message-ID: <fc9c3b03-bb2c-f80d-0540-7456fc0821b2@linux.com>
Date: Tue, 29 Sep 2020 15:27:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200928093654.GW1482@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

On 9/28/20 12:36 PM, Marek Marczykowski-Górecki wrote:
> On Mon, Sep 28, 2020 at 07:02:19AM +0200, Jürgen Groß wrote:
>> On 27.09.20 13:14, Marek Marczykowski-Górecki wrote:
>>> Hi all,
>>>
>>> I get kernel panic on 'floppy' module load. If I blacklist the module,
>>> then everything works.
>>> The issue happens in Xen HVM, other virtualization modes (PV, PVH) works
>>> fine. PV dom0 works too. I haven't tried bare metal, but I assume it
>>> works fine too.
>>
>> Could you please try bare metal?
> 
> I don't have any hw with floppy controller at hand...
> Booting on what I have, it works, loading floppy just says -ENODEV.

I saw that the issue was bisected [1] to commit
c330fb1ddc0a ("XEN uses irqdesc::irq_data_common::handler_data to store a
per interrupt XEN data pointer which contains XEN specific information.")

I have hardware, but I've never worked with Xen. It will take me some time
to set it up and reproduce the problem. I think I will do it in a week.

[1] https://github.com/QubesOS/qubes-issues/issues/6074#issuecomment-699636351


Thanks,
Denis

