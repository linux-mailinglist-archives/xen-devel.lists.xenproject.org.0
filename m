Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EA1399624
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 01:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136242.252689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loZtE-0008Jc-Rn; Wed, 02 Jun 2021 23:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136242.252689; Wed, 02 Jun 2021 23:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loZtE-0008HJ-O5; Wed, 02 Jun 2021 23:03:08 +0000
Received: by outflank-mailman (input) for mailman id 136242;
 Wed, 02 Jun 2021 23:03:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNUT=K4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loZtD-0008HD-7Z
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 23:03:07 +0000
Received: from mail-ot1-x32b.google.com (unknown [2607:f8b0:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c14716ad-c91b-48dc-91d8-509b9b18b747;
 Wed, 02 Jun 2021 23:03:06 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso3979966otu.10
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jun 2021 16:03:06 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id q63sm305301oic.15.2021.06.02.16.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 16:03:05 -0700 (PDT)
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
X-Inumbo-ID: c14716ad-c91b-48dc-91d8-509b9b18b747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=yMlhmCz+AUe3RoYBIDIG9UWgM5k+DTp0DzTeCajd2K4=;
        b=ZGtfjnNtBOociojIqhH0YEFOQcFx+RgzyN/iQV8hY3IFnPS5XllNv1a3Zkdv41aX3Z
         ynHGbNH0sePXxgNMhorqhzqNp0I62gCT4EkFuUOfZ5vIdQoNYYXhK1tRZrm4uSm7m6lI
         o2RDy9ZBsHHkX4vbBefYlyELzSBRf5hv3wnEHlnkYmFwSUP0GTe89a2wmSKHZLtw8P5L
         tB0yfYsw6s2DJSRvMBMSJ1uzOAafCWMAMAQKN71x17SnN05QhLxdMwB8mUxa6Sl/6yVD
         swTB/ETBsRwwrm/ybJadVDlpqs4p2ZQuQfd4jsbF9hcHCqH+/YG+g78xVf2F6eunY3yQ
         GEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=yMlhmCz+AUe3RoYBIDIG9UWgM5k+DTp0DzTeCajd2K4=;
        b=PPjL6oPij2LfBZH2SV3T8loSqNLA/vCTZ9gM7w4yO4E41CJbeTkYsa8LgyhmfjTJ3h
         /2t8NCXSQH2M6SHaIzgow2qIB8W36HZDWvcapldJMj9hD1CTCrrp0KOK1/73cqNyK41i
         a3nJ3uKa5LZZ2LJnNSLiSHa+Z2M4OPD//XHpM6WeZBMRJ42Kz8eYwKCdRIMUq6Q2kgZj
         QLNZCLr438tJADxnJD4Det0VIH/klL02IItbWcB96Cbb/vVRSagvlSOxnl4jNDoHeHnm
         doTHS1OBLprwtP6lQqN4zhVx7oyKsHYqBkDkHuSHKsgTeic2HWkgxO7U4kkTk9wCRixi
         vbJA==
X-Gm-Message-State: AOAM532nW1+dTjgW3I5MoR54+1cDx8R7kSFpPlICbXUW9lu6hDaz/aAu
	Ead9xfhbvw0f1JyvR3/buLN2q6r6tTHylg==
X-Google-Smtp-Source: ABdhPJwmbbu9XwDQXn6VKH8pidlgSNzOT96qN/zc28stBJz+kFdl1TAHIeRCYVEyUHBesmgku68ZnA==
X-Received: by 2002:a9d:7750:: with SMTP id t16mr27989784otl.135.1622674985524;
        Wed, 02 Jun 2021 16:03:05 -0700 (PDT)
Subject: Re: [PATCH v5 1/2] xen/char: Default HAS_NS16550 to y only for X86
 and ARM
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1622645816.git.connojdavis@gmail.com>
 <2c24cadace47e51e9e3fce6614e0f5e83db6c3af.1622645816.git.connojdavis@gmail.com>
 <161181af-3e92-d5db-9775-048a512499de@suse.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <b132ebe3-f197-7432-d8d7-04d49d4de115@gmail.com>
Date: Wed, 2 Jun 2021 17:03:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <161181af-3e92-d5db-9775-048a512499de@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/2/21 9:52 AM, Jan Beulich wrote:
> On 02.06.2021 17:08, Connor Davis wrote:
>> Defaulting to yes only for X86 and ARM reduces the requirements
>> for a minimal build when porting new architectures.
>>
>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> Please can you accumulate tags you've already got into re-submissions,
> so the status of patches is clear and committers will know what is
> ready to go in without having to hunt down anything? In the case here
> you've lost my A-b.
>
> Jan
Oops, sorry about that. Will resend shortly.

Thanks,
Connor

