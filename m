Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F903088D6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 13:06:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78100.141910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SXQ-000324-3s; Fri, 29 Jan 2021 12:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78100.141910; Fri, 29 Jan 2021 12:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SXQ-00031h-0n; Fri, 29 Jan 2021 12:06:08 +0000
Received: by outflank-mailman (input) for mailman id 78100;
 Fri, 29 Jan 2021 12:06:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5SXO-00031c-W2
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 12:06:07 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9012517-3d5c-40b7-9058-53fde4bc0fa6;
 Fri, 29 Jan 2021 12:06:06 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id h12so12129242lfp.9
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 04:06:06 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id r1sm2011787lfp.306.2021.01.29.04.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 04:06:04 -0800 (PST)
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
X-Inumbo-ID: d9012517-3d5c-40b7-9058-53fde4bc0fa6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4uMtJnYaBelEijpQjqliZQu7EqBPU6rwdupnY4nf8bk=;
        b=oX9uEGdcsB6YFrIPU9zlL99b3DO+5CPmgmTADvTR+VWioTrY0kaBXCvUmw9vHti5jf
         K6gBuIzlc3b6JBsXp4q7+AcugY0KGkhCfyBic1uxxyKHlI7j5jckyuoLwGlWjCi0B04h
         EmbbHXP3/bxpmPpFGeazv84j6smb8+eV64f+PlBbVYK+4NuTyOaaIT3ztKFx+v7QozZo
         Ixdjpts7ZuGIEAky1G8tBkWY+wdY9oQj400QctdluXAxu8zazLIV1h1r7XRFdsaFF1nL
         eG3VFkjqwNlcirANhpMnKIIbJsfMWWWlYIQvCHI5vYWm5NHMtL4BBpEYQ/IX1YhMKADM
         Qvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4uMtJnYaBelEijpQjqliZQu7EqBPU6rwdupnY4nf8bk=;
        b=Lbb6UzBkH2GAyz6mD2wxMWO6xyDJds6ty0ZUT98sVoeVspl6mmKc88+ptA7jhe4rfv
         mB+O0sZfyCX/bLKI0iRlgnWGSNdzJlsN7JifHAJ5BU0cJy1o2Vqv/U3muD1E/Axixz+b
         VDJGrhTlmwJL0gVqsbbqVP0dnurQ5TLwaqoxAJ8fQca/7HWYhMo1cXTxetNWEMoRqzeN
         Ys7ch6cOmYCoYR7dio88crb5hlvFbsB+AfPFc+0BlcWBJuckdgQPK18tuj3GIz1PmNM4
         NTXwPglHDqVpvOjS8L2VfFvjed7YB8FN+fTROGQCYCJc9aXaXoJgYgqNnYQjEh4OVF2e
         vhcA==
X-Gm-Message-State: AOAM532vHzkm6BgENiWegEwW6bBU4e2qM/nHWpPkE5qpTXaFO2y7ntQx
	5zQ0dMBc3NErce0hNhg0q7Q=
X-Google-Smtp-Source: ABdhPJzTY6PTonnlhngwZCTBu5k1prWS9ksFMnk+A1fcbcPqKrtiEOpz9ffK2BK4ItCP3Wm6ZfeKIQ==
X-Received: by 2002:ac2:418e:: with SMTP id z14mr2079794lfh.126.1611921964707;
        Fri, 29 Jan 2021 04:06:04 -0800 (PST)
Subject: Re: [PATCH V6 24/24] xen/ioreq: Make the IOREQ feature selectable on
 Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <1611884932-1851-25-git-send-email-olekstysh@gmail.com>
 <2d98fd45-a88a-a198-a42d-393a713e1d54@xen.org>
 <433f8d5c-f66f-874e-e08e-83427f9f2a29@suse.com>
 <3fb55faa-8d05-cb8f-f567-4e099347b3e6@gmail.com>
 <e9e9eabc-3925-c402-b7e2-1412b5b6ca8a@suse.com>
 <63d005ce-0993-e604-7b06-fc6603995152@xen.org>
 <4da02c52-1866-6eaa-415b-ddd374edc9d9@gmail.com>
 <645c998c-8a63-7f65-1de1-2c9000da4d69@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <92a8fedc-1837-908f-26e5-a5fd7b867853@gmail.com>
Date: Fri, 29 Jan 2021 14:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <645c998c-8a63-7f65-1de1-2c9000da4d69@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 29.01.21 13:54, Jan Beulich wrote:

Hi Jan

> On 29.01.2021 12:37, Oleksandr wrote:
>> I am wondering do we need to update support.md in the context of IOREQ
>> status on Arm right now or this could be postponed?
> I think so, yes. I have to admit I didn't even realize the whole
> series doesn't make an addition there. I think this wants to be
> part of this patch here, as without it the code can't be enabled
> (and hence can't be used, and hence its support status really
> doesn't matter [yet]).
Thank you for the clarification.
The only mention about IOREQ server I managed to find in support.md is 
"x86/Multiple IOREQ servers"
with Status: Experimental. Does it match the current state on X86? I am 
asking because we are considering Tech Preview (which is higher than 
Experimental)
on Arm. Now I am wondering how could that be... Or I missed something?



>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


