Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554EC423B43
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 12:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202650.357634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY3tD-0001H3-90; Wed, 06 Oct 2021 10:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202650.357634; Wed, 06 Oct 2021 10:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY3tD-0001FC-5u; Wed, 06 Oct 2021 10:11:07 +0000
Received: by outflank-mailman (input) for mailman id 202650;
 Wed, 06 Oct 2021 10:11:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZr5=O2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mY3tB-0001F6-B7
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 10:11:05 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3986fbd-6f1f-4fa5-8d49-c9f83aa4ba7e;
 Wed, 06 Oct 2021 10:11:04 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u18so8068687lfd.12
 for <xen-devel@lists.xenproject.org>; Wed, 06 Oct 2021 03:11:04 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h10sm2226396lft.15.2021.10.06.03.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 03:11:02 -0700 (PDT)
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
X-Inumbo-ID: e3986fbd-6f1f-4fa5-8d49-c9f83aa4ba7e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1mXps78xtQVA4oyAJgDfQqCsJ6bmS0UpCW1znquadlg=;
        b=VL/DZd2PyE/7x6V2vz3SjbEHlotDkniCLUXLwH9I1KYWcuH6AXi2/wMEx3FMbGvpmA
         LGgVDdS9XW7INTaOOBcvgm6CiZBLrqfu4KXcPwFDSkY1vKD4as48+D5QXxiIfZdceV0W
         irGNrO4U58aEelOBVzAUkLgLggRP3yQkvKFJjHDfydHEVjKpwqwKSthF0sUMepqgs96z
         FX0ChNAR0AVAAjA0I56si+nZvTFQBWLPmiEZrwF7dLnn6k91a4IQ06T7o2n2vKv5Ghi8
         8Hhp0Hb+urYM58q39EdaIoRNMj9D+b1xUliOOqvWdYHb2m7g6Mcl/xmmOCaVvnUql42O
         xYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1mXps78xtQVA4oyAJgDfQqCsJ6bmS0UpCW1znquadlg=;
        b=XawE7fKrXxtpwvgSZf3GYkHPhEaHYaCpGm03rjpwNRDSryHylNpM62eu0ohDoX+GZK
         XczCNaGq6c4eb2CILGVWuTEIr+Lq/BDz88/n8lP7ju2JWRTCjhJWXsx0NCqYpzzTB9qx
         JkUWdQfiN1v9mGnfFiOuGh/yJDgmopQdTZ7gaNhxXVPswuKlKwbpUaDWA9UBAuC3Wx1P
         pQjhAKU4xM0dnFurr4lBjNUIu/UAMSz2snBg/5wJnoyTyKBPiQOjriVj7m113Qm7FGET
         B6x2jMngbFPnsUeCHtFMwe+TpedBJzFx8nVI0ms9pt0K7r3J3AKZjPZt0a3q2d5lnN2l
         5HwQ==
X-Gm-Message-State: AOAM532ZnzH96cvlQKQvXuwNgdhnSvN/BxHKaPIOSl0qzkpnjQrGigmK
	DIMe4baMlyg99fsBW8xywbw=
X-Google-Smtp-Source: ABdhPJw4YpcUOZ/9t6aRzho3ql0DlUOFCuzp4GcFut5DBCtseB2kzHmW5z3UjmAgsrciuvMzUEdNfw==
X-Received: by 2002:a05:651c:1505:: with SMTP id e5mr27872758ljf.102.1633515063238;
        Wed, 06 Oct 2021 03:11:03 -0700 (PDT)
Subject: Re: [PATCH V4 3/3] libxl/arm: Add handling of extended regions for
 DomU
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com>
 <1632955927-27911-4-git-send-email-olekstysh@gmail.com>
 <c0184478-4af1-d9e8-a527-49ae7eebcc70@gmail.com>
 <alpine.DEB.2.21.2110051435200.3209@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b9635e32-3969-8408-01d2-8f2574d32c4f@gmail.com>
Date: Wed, 6 Oct 2021 13:11:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110051435200.3209@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 06.10.21 00:36, Stefano Stabellini wrote:

Hi Stefano

> On Tue, 5 Oct 2021, Oleksandr wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> The extended region (safe range) is a region of guest physical
>>> address space which is unused and could be safely used to create
>>> grant/foreign mappings instead of wasting real RAM pages from
>>> the domain memory for establishing these mappings.
>>>
>>> The extended regions are chosen at the domain creation time and
>>> advertised to it via "reg" property under hypervisor node in
>>> the guest device-tree. As region 0 is reserved for grant table
>>> space (always present), the indexes for extended regions are 1...N.
>>> If extended regions could not be allocated for some reason,
>>> Xen doesn't fail and behaves as usual, so only inserts region 0.
>>>
>>> Please note the following limitations:
>>> - The extended region feature is only supported for 64-bit domain
>>>     currently.
>>> - The ACPI case is not covered.
>>>
>>> ***
>>>
>>> The algorithm to choose extended regions for non-direct mapped
>>> DomU is simpler in comparison with the algorithm for direct mapped
>>> Dom0. As we have a lot of unused space above 4GB, provide single
>>> 2MB-aligned region from the second RAM bank taking into the account
>>> the maximum supported guest address space size and the amount of
>>> memory assigned to the guest. The maximum size of the region is 128GB.
>>> The minimum size is 64MB.
>>>
>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Acked-by: Ian Jackson <iwj@xenproject.org>
>>> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
>>> Tested-by: Michal Orzel <michal.orzel@arm.com>
>> I though a bit more on this and decided to make a patch more functional by
>> trying to also allocate extended region below 4GB, I think we could do with
>> it.
>> Actually if guest memory size is less than GUEST_RAM0_SIZE, we are able to
>> provide unused space. I have tested with with various guest memory sizes and
>> it worked fine. Also I decided to drop limit for maximum extended region size
>> (128GB), we don't apply this limit in Dom0 and I don't see why we need it
>> here, moreover the calculation became more obvious. I will drop all acks and
>> send updated version. Are there any objections?
> I am OK with it; it looks like you made good improvements. One caveat is
> that I volunteer to review again no problem,

Great, thank you.


> but we'll need a new ack
> from Ian Jackson to commit.

Yes, I know that.


-- 
Regards,

Oleksandr Tyshchenko


