Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AA689C0AC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 15:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701960.1096640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtolm-00058U-1v; Mon, 08 Apr 2024 13:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701960.1096640; Mon, 08 Apr 2024 13:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtoll-000568-VX; Mon, 08 Apr 2024 13:10:41 +0000
Received: by outflank-mailman (input) for mailman id 701960;
 Mon, 08 Apr 2024 13:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b+ji=LN=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rtolk-000561-7T
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 13:10:40 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64927772-f5a9-11ee-b7f7-5d6b493b22b9;
 Mon, 08 Apr 2024 15:10:38 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-343e46ec237so2483294f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 06:10:38 -0700 (PDT)
Received: from [10.95.144.96] (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id
 l10-20020adfe58a000000b003434f526cb5sm8864955wrm.95.2024.04.08.06.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 06:10:37 -0700 (PDT)
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
X-Inumbo-ID: 64927772-f5a9-11ee-b7f7-5d6b493b22b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712581837; x=1713186637; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uCYE8xHgHv3RcgiFcSFtZmnhxxPV5TSVgjoL4tMGUrM=;
        b=W9wE2FUDsiRgusNCRoFyX/5jhk4e8xNewSOKLlb6UUGxMUqaukdo/+FWhDQ9BmeiTE
         aIWj3R3jlOVEMEI3G9tVR5DLPNE3iRJlSG3wlSP6wUpCixQWxcewdbB2MYPsIwDXqd40
         9f8avktjSVAwTkpwxIN42arasxTfJGJq5kJaREi5Y7bYjjM+VMw20EZE/AXGqWdCVL0a
         VNzsJDgHPimvmxhyJq0Zk05ttdtNqXUY1sJX2a/84sXeOj5wJlJ93c5/pvwYFJRKeFsj
         QZdYmiaTxPE6jFTuIhsWgWYaMp0diQ6zlN12/1jkzXVvF10zjjW6GQcKYBFwLcCHYvWL
         6MJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712581837; x=1713186637;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCYE8xHgHv3RcgiFcSFtZmnhxxPV5TSVgjoL4tMGUrM=;
        b=mEq1o2qGcsdYLzZjDn3fa9gY3AcIEkCUdpuC3FfvAhL8ruaxNCtCqPebNI9uJdRzoP
         lHDJGNCyCkuYOq0dtgWBp4/R74ISPP1Zsas4Zw1mbIeB36U7yEBmRRAL5U3nU8k2SGy7
         tkge8K9jL6dBRYjxT9F6gG/k1QFCGVprHgQyzJQOca3LwEuJdbY4PPrv0YLGRY/i6LC1
         tEptYpWJWFzArE7bTWMgZ/xXxSZxDqTGEk0e/Z2gBktvKifPKq8RP5ITWc0zajI7NTik
         bcvggXaLcFD+KlBBDEsvtvUMyTIhPEqxL2md25yzz4G8fdm+P/u1OLNEeHkrvrFMWTPc
         aNlw==
X-Forwarded-Encrypted: i=1; AJvYcCXXcpBMtqiM5tXNHLhKtfsY4NygSbQpgpYDX9bfnDw9rcW4hQmDhxmSL7H8lJCNYjfl6YmoRbFld6Ovn3JMUpi/p3A8d7trvzxZOiJc1XM=
X-Gm-Message-State: AOJu0YwuA4R6m4GbxyRRY2ROYt9mK+8g4tCgzanYaldYrBKkMM+8ACzg
	XcBFfkCUi75IyNOfD7rl/ydyC5GntTdjC3hBFaIh9lRp0oM/3iDl
X-Google-Smtp-Source: AGHT+IEXihybdhoq2l1gCTzovksly8MYwR0Z5sdElOesgg8KOFT8b0nCRPZjcio6D209ehLk+1Q7Tg==
X-Received: by 2002:a5d:64ec:0:b0:343:84a8:5d7 with SMTP id g12-20020a5d64ec000000b0034384a805d7mr8088499wri.49.1712581837256;
        Mon, 08 Apr 2024 06:10:37 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <60c49e27-1275-411e-9cda-8405ca0ce010@xen.org>
Date: Mon, 8 Apr 2024 14:10:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen-hvm: Avoid livelock while handling buffered ioreqs
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 qemu-devel@nongnu.org
References: <20240404140833.1557953-1-ross.lagerwall@citrix.com>
 <6fad8151-4bde-4a02-96fb-27b99d93757f@gmail.com>
 <CAG7k0EqEwfS75n8FCncrr_VzPtJZk46KrLiYaMDfWfrZ6CEApg@mail.gmail.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <CAG7k0EqEwfS75n8FCncrr_VzPtJZk46KrLiYaMDfWfrZ6CEApg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/04/2024 14:00, Ross Lagerwall wrote:
> On Sat, Apr 6, 2024 at 11:58 AM Durrant, Paul <xadimgnik@gmail.com> wrote:
>>
>> On 04/04/2024 15:08, Ross Lagerwall wrote:
>>> A malicious or buggy guest may generated buffered ioreqs faster than
>>> QEMU can process them in handle_buffered_iopage(). The result is a
>>> livelock - QEMU continuously processes ioreqs on the main thread without
>>> iterating through the main loop which prevents handling other events,
>>> processing timers, etc. Without QEMU handling other events, it often
>>> results in the guest becoming unsable and makes it difficult to stop the
>>> source of buffered ioreqs.
>>>
>>> To avoid this, if we process a full page of buffered ioreqs, stop and
>>> reschedule an immediate timer to continue processing them. This lets
>>> QEMU go back to the main loop and catch up.
>>>
>>
>> Do PV backends potentially cause the same scheduling issue (if not using
>> io threads)?
>>
> 
>  From what I can tell:
> 
> xen-block: It reads req_prod / req_cons once before entering the loop
> so it should be fine, I think.
> 
> xen_console: Same as xen-block
> 
> xen_nic: It reads req_prod / req_cons once before entering the loop.
> However, once the loop ends it checks for more requests and if there
> are more requests it restarts from the beginning. It seems like this
> could be susceptible to the same issue.
> 
> (These PV backends generally aren't used by XenServer's system QEMU
> so I didn't spend too much time looking into it.)
> 
> Thanks,

Ok. Thanks for checking.

   Paul


