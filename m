Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A9C1E29AF
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 20:09:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jde0N-000482-ER; Tue, 26 May 2020 18:08:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfaz=7I=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1jde0L-00047J-Ev
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 18:08:45 +0000
X-Inumbo-ID: f05be670-9f7b-11ea-9dbe-bc764e2007e4
Received: from mail-qt1-x836.google.com (unknown [2607:f8b0:4864:20::836])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f05be670-9f7b-11ea-9dbe-bc764e2007e4;
 Tue, 26 May 2020 18:08:45 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id i68so16927990qtb.5
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2020 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3vq5tAtSjUZ1REBUmxkczwtyXpGOgL9IzAxGNeyIljk=;
 b=O2aM6u6G0kNZGSJoihN+2/JpvbD5Da6615BD8Z11Ng9m/iFuJWVeY6qy5dXN6Xd/1i
 xiGC9Eb24Z1SVjPBT2pzOoa809pn418e4UXxlHCtbbz2S2RRq26j8iK9YEXWMb9Pftw9
 OQ8JOXmGS/rVVZcIhP0QHqARRd3YM+Vtg09DarQ2fAqIdwxdILZVCa5n2XBrZkRvv8FP
 dhlXqe78jA9N/BdciNoqrzRclFK/dRc8JyWQBsgPVs1gJyw2BsjY5WXb0D8oGflKZLxM
 gCaVMMROiKx9qbIhnz5epmcOct8fs1R9puUKId8V45HqBcfS3Y8grXhH2R2+XCDDbvpw
 fzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3vq5tAtSjUZ1REBUmxkczwtyXpGOgL9IzAxGNeyIljk=;
 b=spOkzLY/+Tkkog/h6ianFJfuL4Xrmzc2Ql6F84yIiqQYiIOQ2isaYsTQv9T+edkwJe
 l3M29sZt9Mls2NWYP1dlJ0UfP0fzkpH5nKbH2f1I3Y+zullfp28nu0hMrybN3uZY3DPX
 LGhG8qcMMJ44/4frqUeWi1LDcNWTqHANZJKIzTVvdTEA9cFh9SCM+rpUY3PAvaMlShgZ
 65ahBx/ig+k1Rb1daAl1n7SWkpXx0WhzuIsniDVt2tdn7VBFlxeTKyDldnE8FcBQ0GjW
 8EK0X5qpCEg0/SECKWxzgaKGFrdSGzBMNSYMf9HVf2u9uIHGWbw8MLBPH63bk890lyaa
 1hfw==
X-Gm-Message-State: AOAM532ewctivj1FCiveE74whqgpSaivpyyGQa7uvhd4w9Y2PijuOFfH
 IuymJPORpZ2CEt0DYuGGWnR758lH
X-Google-Smtp-Source: ABdhPJzHVeE7cfrEFHlQyR35IioXLAFWVpeEjmLdCAEuPhUI3MRHXPCBVGnnfGiDJ4LDsR8KvRliKA==
X-Received: by 2002:ac8:1601:: with SMTP id p1mr2600001qtj.311.1590516524381; 
 Tue, 26 May 2020 11:08:44 -0700 (PDT)
Received: from [10.10.1.24] (c-73-129-47-101.hsd1.md.comcast.net.
 [73.129.47.101])
 by smtp.gmail.com with ESMTPSA id h77sm328386qke.37.2020.05.26.11.08.43
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 11:08:43 -0700 (PDT)
Subject: Re: [BUG] PVH ACPI XSDT table construction
To: xen-devel@lists.xenproject.org
References: <17251f968dd.b28c8ebe731955.2247348003729398828@apertussolutions.com>
 <20200526175734.GF38408@Air-de-Roger>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Message-ID: <8c9c4a9a-653e-8a75-bfb3-10d6581831f1@gmail.com>
Date: Tue, 26 May 2020 14:08:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526175734.GF38408@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/26/20 1:57 PM, Roger Pau Monné wrote:
> 
> Keep in mind that strncmp will return 0 if the signature matches, and
> hence doing this won't allow any table, as it would require a
> signature to match both the DSDT and the FACS one (you would require
> strncmp to return 0 in both cases).
> 
> The code is correct AFAICT, as it won't add DSDT or FACS to the XSDT
> (because strncmp will return 0 in that case).
> 
> Roger.
> 

Ugh, your are right. Apologies for the noise.

V/r,
DPS

