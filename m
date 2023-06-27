Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD6E74056C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 23:02:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556285.868689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEFog-0002lM-Rd; Tue, 27 Jun 2023 21:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556285.868689; Tue, 27 Jun 2023 21:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEFog-0002iR-Ow; Tue, 27 Jun 2023 21:01:38 +0000
Received: by outflank-mailman (input) for mailman id 556285;
 Tue, 27 Jun 2023 21:01:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZGQ=CP=gmail.com=groeck7@srs-se1.protection.inumbo.net>)
 id 1qEFoe-0002iL-Nk
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 21:01:36 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbdfbd4d-152d-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 23:01:34 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-666ecb21f86so4881823b3a.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 14:01:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 jl3-20020a170903134300b001ac6b926621sm6363521plb.292.2023.06.27.14.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 14:01:31 -0700 (PDT)
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
X-Inumbo-ID: cbdfbd4d-152d-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687899692; x=1690491692;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=P+M7tEnjJDtu150UIK78eMZjmbGUtM7e5Fjt8nWZ0yk=;
        b=EEAFfmkXxvxLQKSckNGd2ZSV3KFogeID+Fu07F5vObGax9BbbGTHMjNPkWpqJAJVcH
         pQvHfFi3MuvS2en7hgib7UJpPWUapwBCg8rlberKLmSq3DFWM7/xIZN7INLmmqEHLsUh
         qitezyDQfhSscafezpHggVgt0WLI8tgIl0uMXCJdPAHvlcj4VIjJKb6j7/ZGCnIDizgv
         wo2zP75PWYpQesW5XMNkIMNlUWOk9aqZVrMomyrANyuVHFRGKdh0f6XzxRPe0kewrYvm
         0KzGKCqgMKcTqBBhxX7lyhj56QxI4SK/fKCSdPeLy85gsmtVFv88cBuoZEpsI4YCe97K
         o/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687899692; x=1690491692;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+M7tEnjJDtu150UIK78eMZjmbGUtM7e5Fjt8nWZ0yk=;
        b=Sl6EFUrPQaEVUQyr1L6qbLP80pX80HPY6clGOBUz1dVkJhdfuh02jtug7kLO9O42Xw
         QyTaNd2sojDTLfHnIeQkKVhYyt6xctp348AE9qPnVILrQ1a5K9AsUBYLx6qExGkd6X7Y
         u54onVY/0AvMfTNy67wsJIybtCGMgtdzG/ALZsiYKtrBG+9WBl0rdUatFZusLC98oZvo
         BUr71n4WAB9FQLYeCZn+P9AVFmUU4ZAoSXQ+VN+GQQjVz1e22PNHAmEEd0JZDMzU8MUX
         NSNn66ZMZVzxKPIUQuszz3CmVR2c51T5k+K9smkVks6KxrDp3NanYzffOcTNoWlbk+nh
         jKbg==
X-Gm-Message-State: AC+VfDwDnMoDo2qxQsjICxYkZ1npbPUTugGxslW3ewViB40726B4Fb7s
	Hhv5K52w3AwQbjHQ6c/WbaU=
X-Google-Smtp-Source: ACHHUZ5Ms+IS+/rtXxolIJxIsutHi1fnnUiL8cEAZTZ1vZL/Fg4JF6S5Mmuw32zf0DumOU0QNMHuig==
X-Received: by 2002:a17:902:f542:b0:1b5:91:4693 with SMTP id h2-20020a170902f54200b001b500914693mr14752161plf.1.1687899692466;
        Tue, 27 Jun 2023 14:01:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2b7e8b1d-1697-6a25-434d-352f95e6fff2@roeck-us.net>
Date: Tue, 27 Jun 2023 14:01:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Content-Language: en-US
To: Dinh Nguyen <dinguyen@kernel.org>, Vishal Moola <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com>
 <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
 <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
 <cc954b15-63ab-9d9f-2d37-1aea78b7f65f@roeck-us.net>
 <b6a5753b-8874-6465-f690-094ee753e038@roeck-us.net>
 <CAOzc2pxdqeaRjYLfOqvMW-AEobTzD9xOP+MyP9nxgEbi1T2r7Q@mail.gmail.com>
 <c3751051-7fc7-7129-b9a7-ead71c576ace@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <c3751051-7fc7-7129-b9a7-ead71c576ace@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/27/23 13:05, Dinh Nguyen wrote:
> 
> 
> On 6/27/23 14:56, Vishal Moola wrote:
>> On Tue, Jun 27, 2023 at 12:14 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On 6/27/23 12:10, Guenter Roeck wrote:
>>>> On 6/27/23 10:42, Vishal Moola wrote:
>>>>> On Mon, Jun 26, 2023 at 10:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>
>>>>>> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote:
>>>>>>> Part of the conversions to replace pgtable constructor/destructors with
>>>>>>> ptdesc equivalents.
>>>>>>>
>>>>>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>>>>>>> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>>>>>>
>>>>>> This patch causes all nios2 builds to fail.
>>>>>
>>>>> It looks like you tried to apply this patch on its own. This patch depends
>>>>> on patches 01-12 of this patchset to compile properly. I've cross-compiled
>>>>> this architecture and it worked, but let me know if something fails
>>>>> when its applied on top of those patches (or the rest of the patchset).
>>>>
>>>>
>>>> No, I did not try to apply this patch on its own. I tried to build yesterday's
>>>> pending-fixes branch of linux-next.
>>>>
>>>
>>> A quick check shows that the build fails with next-20230627. See log below.
>>
>> Ah it looks like this one slipped into -next on its own somehow? Stephen, please
>> drop this patch from -next; it shouldn't be in without the rest of the
>> patchset which
>> I intend to have Andrew take through the mm tree.
>>
> 
> I apologize, but I queue this patch up for Linus and it's been pulled for this merge window. I didn't realize you were going to take this patchset through another tree.
> 
> Sorry about that.
> 

Yes, indeed, I just confirmed that all nios2 builds in the mainline kernel
are now broken.

Guenter


