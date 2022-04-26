Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C73D1510941
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 21:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314120.532048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njR3W-0007mp-EF; Tue, 26 Apr 2022 19:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314120.532048; Tue, 26 Apr 2022 19:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njR3W-0007kF-Au; Tue, 26 Apr 2022 19:41:02 +0000
Received: by outflank-mailman (input) for mailman id 314120;
 Tue, 26 Apr 2022 19:41:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njR3U-0007k9-R1
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 19:41:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njR3U-0003tu-6M; Tue, 26 Apr 2022 19:41:00 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njR3U-0006mY-1F; Tue, 26 Apr 2022 19:41:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=it1Hz+xCN6O26EgCOKuU9vyMbulIsA7t/NkfKbffepE=; b=N7DTjZdhlLDQC2Sy9fRVkS3C7Y
	Ff5ztZI0tX2/gCtmgyDtTXmvnvVCLr6cvrmjJBneYPrN9hBHpXmqXNaT2byn8XM7voJ7GxKR9F8AJ
	T0PypRglxAA1YxDoATOVW85yJqFpZxahC8umPCv3nhfSMNIntlm/pO4/ZZMvT+Zxeabo=;
Message-ID: <f943aff3-4d70-fd30-a981-f4e78ffd363d@xen.org>
Date: Tue, 26 Apr 2022 20:40:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
To: Paran Lee <p4ranlee@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Austin Kim <austindh.kim@gmail.com>, xen-devel@lists.xenproject.org
References: <20220421151755.GA4718@DESKTOP-NK4TH6S.localdomain>
 <a160a77a-1cb2-c7cb-7d93-7334772620fe@xen.org>
 <086069c4-406b-ac33-7c44-8433980026fc@gmail.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: p2m_set_entry duplicate calculation.
In-Reply-To: <086069c4-406b-ac33-7c44-8433980026fc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/04/2022 16:37, Paran Lee wrote:
> Thanks you, I agreed! It made me think once more about what my patch
> could improve.
> patches I sent have been reviewed in various ways. It was a good
> opportunity to analyze my patch from various perspectives. :)
> 
> I checked objdump in -O2 optimization(default) of Xen Makefile to make
> sure CSE (Common subexpression elimination) works well on the latest
> arm64 cross compiler on x86_64 from  Arm GNU Toolchain.
> 
> $
> ~/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-gcc
> -v
> ...
> A-profile Architecture 10.3-2021.07 (arm-10.29)'
> Thread model: posix
> Supported LTO compression algorithms: zlib
> gcc version 10.3.1 20210621 (GNU Toolchain for the A-profile
> Architecture 10.3-2021.07 (arm-10.29)
> 
> I compared the before and after my patches. This time, without adding a
> "pages" variable, I proceeded to use the local variable mask with order
> operation.
> 
> I was able to confirm that it does one less operation.

Well... I don't think the one less operation is because of introduction 
of the local variable (see more below).

> 
> (1) before clean up
> 
> 0000000000001bb4 <p2m_set_entry>:
>      while ( nr )
>      1bb4:       b40005e2        cbz     x2, 1c70 <p2m_set_entry+0xbc>
> {
>      ...
>          if ( rc )
>      1c1c:       350002e0        cbnz    w0, 1c78 <p2m_set_entry+0xc4>
>          sgfn = gfn_add(sgfn, (1 << order));

1 << order is a 32-bit value but the second parameter is a 64-bit value 
(assuming arm64). So...

>      1c20:       1ad32373        lsl     w19, w27, w19   // <<< CES works
>      1c24:       93407e73        sxtw    x19, w19        // <<< well!

... this instruction is extending the 32-bit value to 64-bit value.

>      return _gfn(gfn_x(gfn) + i);
>      1c28:       8b1302d6        add     x22, x22, x19
>      return _mfn(mfn_x(mfn) + i);
>      1c2c:       8b130281        add     x1, x20, x19
>      1c30:       b100069f        cmn     x20, #0x1
>      1c34:       9a941034        csel    x20, x1, x20, ne  // ne = any
>      while ( nr )
>      1c38:       eb1302b5        subs    x21, x21, x19
>      1c3c:       540001e0        b.eq    1c78 <p2m_set_entry+0xc4>  // b.none
> 
> (2) Using again mask variable. mask = 1UL << order
> code show me   sxtw    x19, w19    operation disappeared.
This code is not only using a local variable but also using "1UL". So, I 
suspect that if you were using 1 << order, the instruction would re-appear.

Cheers,

-- 
Julien Grall

