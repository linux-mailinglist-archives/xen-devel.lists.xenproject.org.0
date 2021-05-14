Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E09380B4A
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 16:13:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127394.239437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYZD-0001yz-D3; Fri, 14 May 2021 14:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127394.239437; Fri, 14 May 2021 14:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYZD-0001x8-9x; Fri, 14 May 2021 14:13:27 +0000
Received: by outflank-mailman (input) for mailman id 127394;
 Fri, 14 May 2021 14:13:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhYZC-0001x2-AV
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 14:13:26 +0000
Received: from mail-io1-xd29.google.com (unknown [2607:f8b0:4864:20::d29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40054e21-1838-49ff-9f20-688efc4ae478;
 Fri, 14 May 2021 14:13:25 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id i7so20752140ioa.12
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 07:13:25 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id g20sm415084iox.44.2021.05.14.07.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 07:13:24 -0700 (PDT)
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
X-Inumbo-ID: 40054e21-1838-49ff-9f20-688efc4ae478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=o70sDiQtQ+dDfpZ+eU3QLQfUt2kO/ieBAaoM5zoEMRk=;
        b=I3oDkRj7N+G8uClJphH8sp3CphcAUJHuonMpStGeC7ZOtm5DueOr2UWwz1mk4VOVFJ
         hgjz9Jo3qcPm2tLziHJGrWfMJJK5WEfWxJ6oSzqQrvqgB22wiU7t/PR+45R6N3AWzhTI
         LSVyMAwFfx6JGpM4fEMFFCmJh7hq6aQ7vwlZB2R+iXmYYujHjEgp+YsbeouvNMq1qIm1
         ls965ce58FGjCDQXbhYO3JzOMH7/U5HaObkgrv6Wzl29/c0uCUQun4+/5sS1S7/OkUAS
         iOPitaLnFGZnEkd/2iHcKNemDb786ayavYewJhOm8exZxB10NYkhOQk561Yxal3mNC/T
         HeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=o70sDiQtQ+dDfpZ+eU3QLQfUt2kO/ieBAaoM5zoEMRk=;
        b=VZZCm53kjB0KDQEtcJSj/2++yAHPzCUoksEgR5mA9Uj3LZ53pFMdwURTsxgG2bR6yy
         uD/Ox5rEKSRWbBrY//Lk4svK2WucfAPYYKCMVjbGtnTU7dOzYVz6VYPvcMP1RFGDNn61
         AQkDUmiJkojtYbnS5DiZZgQACZbfOXazDyABhEueHOoXxUiOBrj7oJwScvxxLW3luk1m
         IQY8G11vSkYgcYgq5uf3Zr5xDaz4Rq2GQkboLmYfsvH9J64X7A5aAeaLbFwn+eMRG3Jm
         uGiwnOHOY52l/rmaNrs4LI3V3f4TDKDZ8UwjHd92BAzH9ossWhIF1X8+An+wxHSaWdJ2
         tlfg==
X-Gm-Message-State: AOAM531bD/HKyg2beKkTcLMaVblkrztVPesFCpaWkL1//q6pvffm1f+B
	ROLqKtDsQMOvkdk7YnDk7X4=
X-Google-Smtp-Source: ABdhPJxcba5H+VgtPFTRDUwwnpPXcXTlpl/P5iX1tSlcrlDbT8KuB2zaA6XFPrNnA/+pl4Sjn0Q9gA==
X-Received: by 2002:a6b:4e15:: with SMTP id c21mr31591852iob.116.1621001605156;
        Fri, 14 May 2021 07:13:25 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] xen/char: Default HAS_NS16550 to y only for X86
 and ARM
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <cover.1620965208.git.connojdavis@gmail.com>
 <3960a676376e0163d97ac02f968966cdfaccbf75.1620965208.git.connojdavis@gmail.com>
 <YJ4LzUcajOJncKUP@mattapan.m5p.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <e597d3cf-39c4-bfaa-f0dd-ea9c84b0a178@gmail.com>
Date: Fri, 14 May 2021 08:13:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJ4LzUcajOJncKUP@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/13/21 11:34 PM, Elliott Mitchell wrote:
> On Thu, May 13, 2021 at 10:17:08PM -0600, Connor Davis wrote:
>> Defaulting to yes only for X86 and ARM reduces the requirements
>> for a minimal build when porting new architectures.
>>
>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
>> ---
>>   xen/drivers/char/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
>> index b572305657..b15b0c8d6a 100644
>> --- a/xen/drivers/char/Kconfig
>> +++ b/xen/drivers/char/Kconfig
>> @@ -1,6 +1,6 @@
>>   config HAS_NS16550
>>   	bool "NS16550 UART driver" if ARM
>> -	default y
>> +	default y if (ARM || X86)
>>   	help
>>   	  This selects the 16550-series UART support. For most systems, say Y.
> Are you sure this is necessary?  I've been working on something else
> recently, but did you confirm this with a full build?
>
> If you observe the line directly above that one, `_if_ARM_`.  I'm pretty
> sure this driver will refuse to show up in a RISC-V build.
>
It isn't visible in Kconfig, true, but it will still be built because of

the unconditional "default y"


Thanks,

Connor


