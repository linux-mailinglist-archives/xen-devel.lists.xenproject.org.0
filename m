Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304FA33DDBA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 20:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98457.186786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMFaJ-0005vR-Vt; Tue, 16 Mar 2021 19:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98457.186786; Tue, 16 Mar 2021 19:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMFaJ-0005v2-SN; Tue, 16 Mar 2021 19:42:31 +0000
Received: by outflank-mailman (input) for mailman id 98457;
 Tue, 16 Mar 2021 19:42:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BLMP=IO=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lMFaI-0005uw-S3
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 19:42:30 +0000
Received: from mail-pg1-x52b.google.com (unknown [2607:f8b0:4864:20::52b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cf557f5-2c31-4743-9102-119282c43342;
 Tue, 16 Mar 2021 19:42:29 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id q5so10650831pgk.5
 for <xen-devel@lists.xenproject.org>; Tue, 16 Mar 2021 12:42:29 -0700 (PDT)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id q15sm212165pje.28.2021.03.16.12.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 12:42:28 -0700 (PDT)
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
X-Inumbo-ID: 1cf557f5-2c31-4743-9102-119282c43342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7bidFJbtkCx1tTF0G5sFxG5Z+mLbn55iVfmgjUpLhtQ=;
        b=POwV4Ao5DTgC+rE8etwqrJVWWQlAuvIyTZDsHwRiTpvlhduZ2qqbfNq7RU6sfhkh3y
         RXQvb7xlPEfsso6izSOdNLu4sgKYYx3Odl2m5U8MSlTZWZgEza6/N0Kw+bPwLGBevZLC
         xxpfA/l5A6mVCMRpTn7qFtkditY14J90MGiLRJc/0r2u7fvLcBz/RdLJQNq0Mk4HYPmo
         /vhMmmQuu5CY9yy1WjtbKHYztEEmnRl2zeNGhEYB+HGxpXIGG2Wd7QT3uVdPp3VE3KoM
         DB3e0PwjL+UMtDVTmwv5bjL28RT76dC3CNMi6WEW76wca3ukAbSkWpm8SrcU2YKqNEbK
         Si0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7bidFJbtkCx1tTF0G5sFxG5Z+mLbn55iVfmgjUpLhtQ=;
        b=QUkgAjyenyh1pbsqBgjxTB6ZhfMZ6vxNrY9WT7uqHNAupW02ZmfQurnmCEIngM6bbM
         XPsc7I8V4tV8B1xQvQRAEUm/VzsgCRKoQQ3NMxbClySyLdIANhOD+Xoi7KLbUceSixdr
         v8Cnm+vp2frjiBFlhpEH0ABDZC8G+TxstYggDYAzUAJob1UNTtMinKDjRGelQjsQcnmw
         QoKGHDmfCSNiX2G9rsvltbXX4rRSqaZlt7eMhqQ/8AF6J8LaEcTwwQE15nhdtDoFLx78
         tJAFHCyS8TG0Xi7jsuNknot/LpHY98WgwO7T92G6UzikMCxFef8WGEsVQceWucyVcjVS
         RSJg==
X-Gm-Message-State: AOAM533PotE//e3riSu3A59WWn4EInRGTQycTbJum2mwuJ24j+TektAT
	I4lM94D+DIulm1x4tBptX0I=
X-Google-Smtp-Source: ABdhPJzM37Il9GlMP03Dv+H0xzcvPURkQFFjWlzQYO94vJbuUk96bsyNO4II7kF6HJA13yK+C3vWAg==
X-Received: by 2002:a62:7f45:0:b029:205:9617:a819 with SMTP id a66-20020a627f450000b02902059617a819mr886047pfd.17.1615923749030;
        Tue, 16 Mar 2021 12:42:29 -0700 (PDT)
Subject: Re: Working Group for Secure Boot
From: Bob Eshleman <bobbyeshleman@gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, piotr.krol@3mdeb.com,
 Olivier Lambert <olivier.lambert@vates.fr>, Trammell Hudson
 <hudson@trmm.net>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Roman Shaposhnik <roman@zededa.com>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
 <1039be05-cbf2-95aa-5eba-246fb06be8e5@gmail.com>
Organization: Vates SAS
Message-ID: <e1d7b456-e710-d699-8fcf-234de10e9b36@gmail.com>
Date: Tue, 16 Mar 2021 12:42:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1039be05-cbf2-95aa-5eba-246fb06be8e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hey everyone,

I think most who are interested have acked the thread at
this point and I've CC'd everyone (please add anyone if
I've missed them).

I'd like to suggest we have a first group call to
set out an agenda, define scope, and start identifying
the direction the project would like to go for secure
boot.

I'll prepare the call similar to how
community calls are handled, with a public cryptpad
for agenda items and such.

Which of these dates work best for you? Which absolutely
do not work?

  Mon. March 29th, 16:00 UTC
  Wed. March 31st, 16:00 UTC
  Mon. April  5th, 16:00 UTC

Given the Xen community call is at 16:00 UTC, I figure
that probably best captures our geographic spread.  Feel
free to suggest alternative dates/times if none of the
above work.

We can host the meeting on Jitsi which works quite well
from any web browser.  I'll send out a invite link when
we've decided on a suitable date and time.

Thanks.

-- 
Bobby Eshleman
SE at Vates SAS

