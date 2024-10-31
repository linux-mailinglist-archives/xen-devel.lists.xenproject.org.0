Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A816C9B7CB5
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 15:22:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828741.1243751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6W3X-0005Vx-11; Thu, 31 Oct 2024 14:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828741.1243751; Thu, 31 Oct 2024 14:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6W3W-0005UT-Sd; Thu, 31 Oct 2024 14:21:46 +0000
Received: by outflank-mailman (input) for mailman id 828741;
 Thu, 31 Oct 2024 14:21:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hTS=R3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6W3V-0005Tz-JK
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 14:21:45 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72cd7931-9793-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 15:21:41 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-539e7e73740so927933e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 07:21:41 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac789152sm613833a12.43.2024.10.31.07.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 07:21:39 -0700 (PDT)
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
X-Inumbo-ID: 72cd7931-9793-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmYiLCJoZWxvIjoibWFpbC1sZjEteDEyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcyY2Q3OTMxLTk3OTMtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzg0NTAxLjQ2MzQ2OSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730384501; x=1730989301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xcdgomyU3F8z/NntrMSM58zQsgwCn+NZWvvNttM4QiA=;
        b=qrJdR64xoEnriOlY+GX+4SU8QeTr0Lddk3Y9K/OikvyDGqJBs89ddp50ng00YJItoJ
         /liNJA7z6IgEh9RwRaS1ctxgyJl05XOTPp/2mem3L2MwhnKOL/qe8p/JtEGYdzGaw2xx
         5B0Ifcb65byKBx+Gj7qoJfe5lg5eQdi1UzrIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730384501; x=1730989301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcdgomyU3F8z/NntrMSM58zQsgwCn+NZWvvNttM4QiA=;
        b=ByiYynX6ZrzYgvr4mAsU25rM/Rbn2IB8dlWRZOBrQXPAUsiErsXgyt+9Irb5Bu5E38
         7Ro05yCukSYBBEf0vDJ8Udc5J2idALYpJOBvxe6PH1Bj3Ke/2yaFeP2+2vEYWk2Px87m
         94ZRLAeW7vyNeaidejMjaZPOnXTdfsi9BQgZ/PWq/1p49Zmc2h4nDnQf9n4SIcaEWtrJ
         1K7eZXmXuLHGIAUO9/iblWV2MHi0rtr9leJmLUOSozn8tI9tuO+ATEjONZ7/dXFwO2oM
         +AmNgWuNXHTywXXaS/pF7dqjdsCXyss90FI3K0P+xqo3RYzml/v9wF1GddWx1a8OTCSC
         39Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVcjTR3MLXtcDr5Wz45KKORHoORmZTsNdp2cUqxVRmal6rdnfAxG/Zru27dMfl6tquogTNvRp+YeWk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsSC2k03bWWiQhEJQr/0m9AV0cmMiswsVe7BGGpSEQftBf/iok
	JbAMmf464aiy+DMFRKoc1ylu4Pqy1XU9qynFm/kUNvN6WNJhiBf5cDIe9sMlcxW0w08YZqAJmsF
	F
X-Google-Smtp-Source: AGHT+IHjIOf4VwvdQSvXBNvJ3oY2DFzdCu4y/2cc4o/FBto4dc4O2fYk1cAMT7y47lPOZXme9kmV8g==
X-Received: by 2002:a05:6512:130f:b0:539:fbf7:38d1 with SMTP id 2adb3069b0e04-53b7ecd5970mr4368469e87.2.1730384500907;
        Thu, 31 Oct 2024 07:21:40 -0700 (PDT)
Message-ID: <dbf733c0-14a4-40cd-8849-29a87b45c64c@citrix.com>
Date: Thu, 31 Oct 2024 14:21:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts: Refine git-checkout.sh change for different
 branches
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20241031134702.2913536-1-andrew.cooper3@citrix.com>
 <D5A20JD5PC3G.22TWXL5RY7PQD@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <D5A20JD5PC3G.22TWXL5RY7PQD@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/10/2024 2:17 pm, Alejandro Vallejo wrote:
> On Thu Oct 31, 2024 at 1:47 PM GMT, Andrew Cooper wrote:
>> The change works for divergent branches, but doesn't work for explicit SHAs.
>>
>> Instead of passing `-b $TAG` to clone, explicitly fetch the $TAG we want after
>> cloning.
>>
>> Fixes: c554ec124b12 ("scripts: Fix git-checkout.sh to work with branches other than master")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>>
>> Speculative fix, pending CI:
>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1521847529
>> ---
>>  scripts/git-checkout.sh | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/git-checkout.sh b/scripts/git-checkout.sh
>> index 3796cbfe39a7..9f8f2bd04fca 100755
>> --- a/scripts/git-checkout.sh
>> +++ b/scripts/git-checkout.sh
>> @@ -14,9 +14,10 @@ set -e
>>  if test \! -d $DIR-remote; then
>>  	rm -rf $DIR-remote $DIR-remote.tmp
>>  	mkdir -p $DIR-remote.tmp; rmdir $DIR-remote.tmp
>> -	$GIT clone -b $TAG $TREE $DIR-remote.tmp
>> +	$GIT clone $TREE $DIR-remote.tmp
> Can this be shallow (--depth 1) clone instead to avoid pulling for whole
> history in CI? There's probably some ENV variable that  could be recovered
> from.

Maybe, but not here.  One swamp at a time.

More specifically, my first iteration of this fix did use --depth 1, but
it broke QEMU's submodules.  I'm not debugging that as a prerequisite of
fixing other CI breakages.

~Andrew

