Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E05823D880
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 11:22:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3c6r-00028h-8R; Thu, 06 Aug 2020 09:22:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTjn=BQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3c6p-00028U-RM
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 09:22:47 +0000
X-Inumbo-ID: b88acdc7-d9ec-4d48-9f23-7750deab8776
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b88acdc7-d9ec-4d48-9f23-7750deab8776;
 Thu, 06 Aug 2020 09:22:46 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v9so16475731ljk.6
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2020 02:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=V5VGMK+6XYnjTworljWPVg5y65/T5eBThBfgObSPij8=;
 b=VFtMT4pLZY0A+hDD1z7wT3BhGaR5KORHbJlTl8u5Rr+nn8ZRQta4vqSCs8C6AyceRr
 3q9vEq61PuUX/izqc+PAlomAS986fuZiIaOTLl6T28lp9l4WX3YEvTViAG3LXkp8Tm6m
 KqHrbg8gaySIL3THPiM7uBmqtEmXU1Ps1uUL/z5ChxThnNIpCWHVzqFnzkjscv9aSTWW
 eaD9O7HDa8WEKU0mvUSCjLZAmIGWfSAssByjQ8eNDFOZT2FBdsjkH/RhHMF+i5/NOP5A
 QWvMAdIJo/yyvwHvnslGhvMCAgOdg4PdfEfBGFHVkpCMWe76yRRpWpxmPaProPb53N6/
 3IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=V5VGMK+6XYnjTworljWPVg5y65/T5eBThBfgObSPij8=;
 b=g2EcUzqd5P8QzU3IUXZZ5iYiOsMiwrXYmVlYOtbQpvP8cm19kJ+Q101kInQwf6X0+G
 cjVIHPHfG7dv3I4zdTdDX2q2+VTmqD+yKpDgHE3DSaDppA9KGlOldnswF3gLjNhKNZXz
 DsY/2ZBPqKsjWrMnE/B0fd5tR/0wMM4ytQnnNh06+VxQAaeYtb4XRPCM2XLHTu6g6gws
 Y+eyFAfuMrEPL/Hb5DwRgq1onUaTZFW1hQL8nkxlEPoz29cVR7ucPOf1n+5bVkqieXjM
 nItr/0lMldjD1ANKkDYdifFO1MeWu+rjIzzawcdRvQ1j5a51TW+i/s6dJbjIdWnnoVXq
 b+GQ==
X-Gm-Message-State: AOAM533v0ZX00aKz1iMfI5X8fnH1u9E+NS4EQO+3/KxC2bfzPLhp/shk
 bwDVhoPfEC1QRRW18XvzaIs=
X-Google-Smtp-Source: ABdhPJxwafOxxZsJNrQkXWC3YT7Ml9rHQf/0Xsrq92lv9g+ByL0YmwhqUkgctOutuKFrQYsZw18zxw==
X-Received: by 2002:a2e:8804:: with SMTP id x4mr3378619ljh.328.1596705765714; 
 Thu, 06 Aug 2020 02:22:45 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d15sm2124101ljl.32.2020.08.06.02.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 02:22:45 -0700 (PDT)
Subject: Re: [RFC PATCH V1 07/12] A collection of tweaks to be able to run
 emulator in driver domain
To: paul@xen.org, 'Jan Beulich' <jbeulich@suse.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-8-git-send-email-olekstysh@gmail.com>
 <4ffa6434-3ad6-04dc-bfde-f75196930fb4@suse.com>
 <005f01d66b47$1c58ccc0$550a6640$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a9a8a3fb-10ad-96f7-651b-9bed46310ba2@gmail.com>
Date: Thu, 6 Aug 2020 12:22:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <005f01d66b47$1c58ccc0$550a6640$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 05.08.20 19:40, Paul Durrant wrote:

Hi Jan, Paul

>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 05 August 2020 17:20
>> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; Paul Durrant <paul@xen.org>
>> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew
>> Cooper <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson
>> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Daniel De Graaf <dgdegra@tycho.nsa.gov>
>> Subject: Re: [RFC PATCH V1 07/12] A collection of tweaks to be able to run emulator in driver domain
>>
>> On 03.08.2020 20:21, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Trying to run emulator in driver domain I ran into various issues
>>> mostly policy-related. So this patch tries to resolve all them
>>> plobably in a hackish way. I would like to get feedback how
>>> to implement them properly as having an emulator in driver domain
>>> is a completely valid use-case.
>>  From going over the comments I can only derive you want to run
>> an emulator in a driver domain, which doesn't really make sense
>> to me. A driver domain has a different purpose after all. If
>> instead you mean it to be run in just some other domain (which
>> also isn't the domain controlling the target), then there may
>> be more infrastructure changes needed.
>>
>> Paul - was/is your standalone ioreq server (demu?) able to run
>> in other than the domain controlling a guest?
>>
> Not something I've done yet, but it was always part of the idea so that we could e.g. pass through a device to a dedicated domain and then run multiple demu instances there to virtualize it for many domUs. (I'm thinking here of a device that is not SR-IOV and hence would need some bespoke emulation code to share it out).That dedicated domain would be termed the 'driver domain' simply because it is running the device driver for the h/w that underpins the emulation.

I may abuse "driver domain" terminology, but indeed in our use-case we 
pass through a set of H/W devices to a dedicated domain which is running 
the device drivers for that H/Ws. Our target system comprises a thin 
Dom0 (without H/W devices at all), DomD (which owns most of the H/W 
devices) and DomU which runs on virtual devices. This patch tries to 
make changes at Xen side to be able run standalone ioreq server 
(emulator) in that dedicated (driver?) domain. Actually the virtio-mmio 
PoC is based on IOREQ/DM features and emulator (based on demu) acting as 
a virtio-mmio backend. But it may be various use-cases for that (some 
mediator for sharing specific H/W resource between Guests or custom PCI 
emulator for example). If this is valid from Xen PoV I would be happy to 
get feedback how to transform tweaks (hacks) in current patch into the 
proper support.


-- 
Regards,

Oleksandr Tyshchenko


