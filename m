Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD332F4E21
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 16:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66564.118280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzhjS-0004MV-AR; Wed, 13 Jan 2021 15:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66564.118280; Wed, 13 Jan 2021 15:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzhjS-0004M6-71; Wed, 13 Jan 2021 15:06:46 +0000
Received: by outflank-mailman (input) for mailman id 66564;
 Wed, 13 Jan 2021 15:06:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=18+6=GQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzhjR-0004M1-G9
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 15:06:45 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 680531a7-b635-42c4-887b-d38e196bbc48;
 Wed, 13 Jan 2021 15:06:44 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c5so2468683wrp.6
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jan 2021 07:06:44 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z130sm3357385wmb.33.2021.01.13.07.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 07:06:43 -0800 (PST)
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
X-Inumbo-ID: 680531a7-b635-42c4-887b-d38e196bbc48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MeOIDaJKSJSo2RdR4NgmQsM+ZS2NEHjzQQM1jB+2O7Q=;
        b=kcSjvJ86OiYFji/DjfxWgTd82rM9dq1exhxGKcQ2iPlqkMuO3e8RXY9/Xn9ddA7RCC
         c40GMqkg+MWnET1fZ3+3qYDcLPw1O8/nqHL6u/g5s64CbALeAAToqFYmbphJgc3EEp43
         3srx+imRWOGM+wsP2R58WVUc1mawV+DtQtpNzNxBkVs38g72KBCVCal9fO99GYOXF+JM
         hqSfdCyP4O5j0yjum1XC0WD7VbYOMPW2NsQ3dBY2Bub2yKVmwgkLP2D+JBcz+jA9E8gc
         WdIa+HHXyWm71dzw/EwQ1lBHSXAPymZEFXxxXVVb+d1/uRXfmNMsoM2ZKbW4nI7jNZaj
         UHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MeOIDaJKSJSo2RdR4NgmQsM+ZS2NEHjzQQM1jB+2O7Q=;
        b=SoiwF4I8UghUTd9Lfl/ej+uV/on44h/63l5/R8xRNlKa+m9llpZzFSvBRk1jmefzFA
         FiVXgCGCiJxSG52TGXy4eyE3Lrfu/BpoUzuB7C3E6Ms5Iw/ng/Ey9DQzChl1BFxdDVLT
         LH0SzG3VZopLdrnwN6O77keNfJS/0r34o6BwnD08YVgIiETLy+nM6350PC97V9C6IRRM
         21oVNtpViR7BhdqGFb9aR6ICWSaz8U1Vi0QGKUh9Tn1JAyBVRxXbhb6Im0lVO4+UIgcr
         pHYk7YDvn7n5uxKzx9Z8HLtW9/3rOy7VZm5/5IMyLgc6WJ/qd6cLbBOVein96ewn8GYY
         K0ng==
X-Gm-Message-State: AOAM532b+wDOwl2Jt7bRJKtWVPbql3tzJUfcqkZQQGqzInSLEzOrYl3A
	3G5/CJsxhEJMEbiL6pOj2UA=
X-Google-Smtp-Source: ABdhPJy+y+aSwF2JfcTtqJPdSd17wjuNZZpT4CQblvfpCqfWxIasiLYz3Lp2YmOrCspGOij2T40Yrw==
X-Received: by 2002:adf:f891:: with SMTP id u17mr3112015wrp.253.1610550403872;
        Wed, 13 Jan 2021 07:06:43 -0800 (PST)
Subject: Re: [PATCH 2/6] x86/mm: p2m_add_foreign() is HVM-only
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <cf4569c5-a9c5-7b4b-d576-d1521c369418@suse.com>
 <f736244b-ece7-af35-1517-2e5fdd9705c7@citrix.com>
 <e2ee99fc-e3f8-bdaf-fe4a-d048da34731a@suse.com>
 <b4abbe2f-5e3d-5f43-80b8-cfa3fd97061e@citrix.com>
 <CAPD2p-nZyf_i_bGh5sSs2fC4S7nxB1Mk_zbSKtqF=zvBOp3X+Q@mail.gmail.com>
 <2dcbe286-4112-e4b3-dc12-9691154365b3@suse.com>
 <448a6ef3-2cbd-da9c-e4ef-88122d246833@gmail.com>
 <18c21c64-d350-482a-c778-c8478d3daf2c@suse.com>
 <c8315e16-6130-e990-3d16-d0d42b2f92c4@gmail.com>
 <ec041f81-4b80-5ffb-8219-6732f50bef36@suse.com>
 <f6f1ffdd-619d-017e-6820-276814056845@gmail.com>
 <257224ea-4ba3-302e-e198-e92c8c1036b3@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <898d609c-8652-e43d-4400-27986cc37371@gmail.com>
Date: Wed, 13 Jan 2021 17:06:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <257224ea-4ba3-302e-e198-e92c8c1036b3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 12.01.21 13:58, Jan Beulich wrote:

Hi Jan.

> On 11.01.2021 09:23, Oleksandr wrote:
>> On 11.01.21 09:41, Jan Beulich wrote:
>>> If you could also provide your exact .config, I could see whether I
>>> can repro here with some of the gcc5 versions I have laying around.
>> Please see attached
> Builds perfectly fine with 5.4.0 here.

Thank you for testing.


I wonder whether I indeed missed something. I have switched to 5.4.0 
again (from 9.3.0) and rechecked, a build issue was still present.
I even downloaded 5.4.0 sources and built them to try to build Xen, and 
got the same effect.  What I noticed is that for non-debug builds the 
build issue wasn't present.
Then I decided to build today's staging 
(414be7b66349e7dca42bc1fd47c2b2f5b2d27432 xen/memory: Fix compat 
XENMEM_acquire_resource for size requests) instead of 9-day's old one when
I had initially reported about that build issue 
(7ba2ab495be54f608cb47440e1497b2795bd301a x86/p2m: Fix 
paging_gva_to_gfn() for nested virt). Today's staging builds perfectly 
fine with 5.4.0.
It seems that commit in the middle 
(994f6478a48a60e3b407c7defc2d36a80f880b04 xsm/dummy: harden against 
speculative abuse) indirectly fixes that weird build issue with 5.4.0...


-- 
Regards,

Oleksandr Tyshchenko


