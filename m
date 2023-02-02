Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A43F6885F7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 19:02:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488895.757189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNdue-0002wE-6m; Thu, 02 Feb 2023 18:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488895.757189; Thu, 02 Feb 2023 18:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNdue-0002uU-3z; Thu, 02 Feb 2023 18:02:20 +0000
Received: by outflank-mailman (input) for mailman id 488895;
 Thu, 02 Feb 2023 17:56:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f7LH=56=tibco.com=bkaindl@srs-se1.protection.inumbo.net>)
 id 1pNdpJ-0001od-RG
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 17:56:49 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f70843aa-a322-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 18:56:48 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id u21so2869944edv.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Feb 2023 09:56:48 -0800 (PST)
Received: from ?IPV6:2a02:1748:dd5e:b8b0:bc6e:d792:9ad3:1d92?
 ([2a02:1748:dd5e:b8b0:bc6e:d792:9ad3:1d92])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm23081edc.19.2023.02.02.09.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 09:56:48 -0800 (PST)
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
X-Inumbo-ID: f70843aa-a322-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4GgxUxw9KMCr0wz/MFIVAHr9FdS7DQ9h69clpzs9jI=;
        b=ZdysDnzdji44j6CWIqd2NjTZpjgOCKNuGArUFc8TGjZppxK7Xa79hGaXS0n48AbPGR
         xniDlrX/pwTXNRaA4J5bzQAE8Zt4rguwHfjscshljX8qjjgDUSC2O2e/Aepx29+R7aag
         pgGz46psRrC8Sts9qZLl/sltcgp5EkWgdugqrmbjTKDTsM0g1En0SbYFHdvKdF0MY7BJ
         tZ2M5IhJvY1NAq0/+E05S34ToOYVgBGgOde31lV4nMWuB6cSxOJg5rqlwKrJlsffSTMp
         twl34HqLBbk5ni1xKDzPKsJCtZl6of5/K1aWA05jt5npXIaZ0L1K3fYyduT0arkywlXD
         fzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z4GgxUxw9KMCr0wz/MFIVAHr9FdS7DQ9h69clpzs9jI=;
        b=nrbIoVFDHFh0rxMH/ngISky2rkdKMxnPBCC1yv+JEn4JECKp7Fr24by4vagFGxSYRj
         FOGu7WTAjBuU/OUcJAFy0hPyIXTyXYGrmoZllpcBC6FcVygbI4EwbIVu6aa9afW5fi2t
         aIQkrzBnd4m9FfQXcdvvY2W6ZHbvmT2wqV2O2+8Q3yOz9W1MYgpLhBhG16WilCW05Mad
         6ko+6M7EfuR9ChUdMU/xf7tb6jGvz+4krPWnglltJW4+sMX1rafX1orbOzgc425Otf8B
         gwHgoTRpvY4rbRKaoiwh3JV2SRdwbTDqHphwhg9LdulmR0il7GnPK12pFwKs+yTHAVWx
         StSg==
X-Gm-Message-State: AO0yUKUnYl1rzZfNIfQcwWiTtyXLpq6WOR0IlE2qR1uZ8uDZYR5BXDmY
	kGEgiwjwc9nBIbBI+JIy4eImDg==
X-Google-Smtp-Source: AK7set8iLm6kNp3xelQIOqEJzN3TOCOe/6K0mo8vGsfI8W9Kz68jh62SxcSe7AqAjDRSecIUlcjuTw==
X-Received: by 2002:a05:6402:a56:b0:49e:baf:f6e9 with SMTP id bt22-20020a0564020a5600b0049e0baff6e9mr6671726edb.9.1675360608399;
        Thu, 02 Feb 2023 09:56:48 -0800 (PST)
Message-ID: <07f4fc06-be3f-b286-d964-9f6bb3b7cc1b@tibco.com>
Date: Thu, 2 Feb 2023 18:56:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN PATCH] tools/xenmon: Fix xenmon.py for with python3.x
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bernhard Kaindl <bernhard.kaindl@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230202171319.285548-1-bernhard.kaindl@citrix.com>
 <3412a0d5-899b-4db8-b6bd-9c532e9f84eb@citrix.com>
 <dc998c29-6f21-b471-82a5-f64a80c0da4e@citrix.com>
From: Bernhard Kaindl <bkaindl@tibco.com>
In-Reply-To: <dc998c29-6f21-b471-82a5-f64a80c0da4e@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/02/2023 6:34 pm, Andrew Cooper wrote:
> On 02/02/2023 5:18 pm, Andrew Cooper wrote:
>> On 02/02/2023 5:13 pm, Bernhard Kaindl wrote:
>>> Fixes for Py3:
>>> * class Delayed(): file not defined; also an error for pylint -E
>>> * Inconsistent use of tabs and spaces for indentation (in one block)
>>>
>>> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> I'll add this to my pending queue while staging is blocked.
> Actually, on second thoughts.  Class DomainInfo and Delayed need to
> inherit from object for Py2 reasons.  Inheriting from file did this
> previously.
>
> I can fix up on commit, if you're happy.
Yes, thanks!
-- 
cu, Bernhard

