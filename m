Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83617405FC
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 23:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556293.868710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEGhE-0000Nm-4C; Tue, 27 Jun 2023 21:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556293.868710; Tue, 27 Jun 2023 21:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEGhE-0000M5-1D; Tue, 27 Jun 2023 21:58:00 +0000
Received: by outflank-mailman (input) for mailman id 556293;
 Tue, 27 Jun 2023 21:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZGQ=CP=gmail.com=groeck7@srs-se1.protection.inumbo.net>)
 id 1qEGhC-0000Lz-UT
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 21:57:58 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac5aadf8-1535-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 23:57:57 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b7fb02edfaso26343475ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 14:57:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a17090301d000b001b69303db65sm6438851plh.26.2023.06.27.14.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 14:57:55 -0700 (PDT)
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
X-Inumbo-ID: ac5aadf8-1535-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687903076; x=1690495076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=t1QqN2jdF+WL3G2Fn2F+gnSyyU4sNUKe3JWXuNtILlE=;
        b=g+t5RbdhRiaLoYyDKYrUABIe+H7AyRcVTK6Ps8KX11dLH3rVyHHxTIp4jo1F1MLfJ/
         7iNHUg8lMtHSGaBwqfjHucjm6wwc/jl78+I2QtBt+NVF52zFOTO8iGbXC2EXZcfaizxp
         syPg/dBUX2hToZvcUTpD+czYfrRw5crN2vey7CoePIDlxvhbRn4jKEtVasFgYbYadRKT
         uIII/cayZYqptv+yRMmyM+Wfpd5/UPoabOL1LFJ6elItbp/e6VHQDna35ucIS9DgJdAS
         QwUA3GiJRf5dQk/OTJ3hXfUBDFz7VSwh76MedBtdvOPKN3bvoe9PwVVR6Es4OllczpXD
         WRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687903076; x=1690495076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1QqN2jdF+WL3G2Fn2F+gnSyyU4sNUKe3JWXuNtILlE=;
        b=SK/w6Zcv+jeOOGguFlou3guvCq4I/J6v2Uqw2qnWzvS7CSyHQ2ebSTef3HM7pyHziR
         lc5frr3oksrsZ019ztJ3gU92VLZvI3rFUD58ivp7HPdTK/UO0CtQyoKV+2MdJYdH7d16
         0gWhPExkYxHB28nE/bF4qsgitELAiDRLHaFxTOazU0W55+LGMtFFfuvL6k4IBR9u7lKb
         hYV9Qlib7hvX5Qq3UWgeo81B6TejIB8pvAMEyvjhlXzglCvYwrRF3SW8NPkeEUgS4Ddd
         5hFS8WjzVikiOUks6T40kgapO3Mj0aWPzXJbuL/pcnC9OHta2fsI34tfttiNKTN6m1YZ
         iI5Q==
X-Gm-Message-State: AC+VfDxOprt27FOiBB4o49PPtjkp6e6xW5Am8b/Ll3pTP2TYltSTumBQ
	cYXz+Qs7gsyIdiNToZPve7I=
X-Google-Smtp-Source: ACHHUZ6lN48OedTSkLTDBhYcXWegZDranrwbL7k9xhFTjM3m37Ei4jw/mCpSF8qmoSte/cwaCNHhUw==
X-Received: by 2002:a17:902:c407:b0:1ac:8717:d436 with SMTP id k7-20020a170902c40700b001ac8717d436mr14008978plk.60.1687903075769;
        Tue, 27 Jun 2023 14:57:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a7e61e75-cc94-9771-4b56-d1a7c35c13f2@roeck-us.net>
Date: Tue, 27 Jun 2023 14:57:52 -0700
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
 <2b7e8b1d-1697-6a25-434d-352f95e6fff2@roeck-us.net>
 <70776142-a778-9c20-5594-835ed6f7e7a2@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <70776142-a778-9c20-5594-835ed6f7e7a2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/27/23 14:46, Dinh Nguyen wrote:
> 
> 
> On 6/27/23 16:01, Guenter Roeck wrote:
>> On 6/27/23 13:05, Dinh Nguyen wrote:
>>>
>>>
>>> On 6/27/23 14:56, Vishal Moola wrote:
>>>> On Tue, Jun 27, 2023 at 12:14 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>
>>>>> On 6/27/23 12:10, Guenter Roeck wrote:
>>>>>> On 6/27/23 10:42, Vishal Moola wrote:
>>>>>>> On Mon, Jun 26, 2023 at 10:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>>>
>>>>>>>> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote:
>>>>>>>>> Part of the conversions to replace pgtable constructor/destructors with
>>>>>>>>> ptdesc equivalents.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>>>>>>>>> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>>>>>>>>
>>>>>>>> This patch causes all nios2 builds to fail.
>>>>>>>
>>>>>>> It looks like you tried to apply this patch on its own. This patch depends
>>>>>>> on patches 01-12 of this patchset to compile properly. I've cross-compiled
>>>>>>> this architecture and it worked, but let me know if something fails
>>>>>>> when its applied on top of those patches (or the rest of the patchset).
>>>>>>
>>>>>>
>>>>>> No, I did not try to apply this patch on its own. I tried to build yesterday's
>>>>>> pending-fixes branch of linux-next.
>>>>>>
>>>>>
>>>>> A quick check shows that the build fails with next-20230627. See log below.
>>>>
>>>> Ah it looks like this one slipped into -next on its own somehow? Stephen, please
>>>> drop this patch from -next; it shouldn't be in without the rest of the
>>>> patchset which
>>>> I intend to have Andrew take through the mm tree.
>>>>
>>>
>>> I apologize, but I queue this patch up for Linus and it's been pulled for this merge window. I didn't realize you were going to take this patchset through another tree.
>>>
>>> Sorry about that.
>>>
>>
>> Yes, indeed, I just confirmed that all nios2 builds in the mainline kernel
>> are now broken.
>>
> 
> Please let me know if you need to do anything. I'm going to out for a week starting tomorrow.
> 

Not sure I understand. It seems to me that it would have to be you to do something.
After all, you are the nios2 maintainer, and nios2 builds in mainline are now
broken. Maybe send a revert ? Am I missing something ?

Guenter


