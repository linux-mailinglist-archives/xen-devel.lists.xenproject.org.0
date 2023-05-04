Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1C96F71BA
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 20:05:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529871.824786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pudJP-0004nB-EP; Thu, 04 May 2023 18:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529871.824786; Thu, 04 May 2023 18:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pudJP-0004lL-BP; Thu, 04 May 2023 18:04:15 +0000
Received: by outflank-mailman (input) for mailman id 529871;
 Thu, 04 May 2023 18:04:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qVjO=AZ=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1pudJO-0004lF-IJ
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 18:04:14 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12baa79e-eaa6-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 20:04:12 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-306281edf15so749146f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 May 2023 11:04:11 -0700 (PDT)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 q6-20020a5d5746000000b003063db8f45bsm6351649wrw.23.2023.05.04.11.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 11:04:11 -0700 (PDT)
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
X-Inumbo-ID: 12baa79e-eaa6-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20221208.gappssmtp.com; s=20221208; t=1683223451; x=1685815451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPoy7ZjH0Hp3L3NSAKFAvrycApDT8quJeyk+IzfMzr8=;
        b=n740Nn8vCLMkAbNPdJ4Ss/Yj+iwdxeLduFRV5USOrUmS/rvP+eGovQmfo6kDZKkFk+
         RkfGBLKiyFyqTwUTFQVmuYs51Uvfjuu9a1XBmZKadGPoJXjqrR7R9w3WRiVTEmXb191C
         3gQXfFUJMYOYOdrVeuk+TZKTLNRCseERcSdLjCFxijIIr+Q8s5KrVOaURi1qd7dzAeJ3
         CRGrecprB6gOoSXxKKgeCt30UH94YH3nl15ZwKBuk55omYVHA7a5mQ5P2+VU4TEy1z5v
         hm5p5lLC0WhYDQNp3Xp1iI+2vykSpUyh4vX+AWGYFBPiUTY8u6ojDD85i7Pv0bowga2Q
         YYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683223451; x=1685815451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPoy7ZjH0Hp3L3NSAKFAvrycApDT8quJeyk+IzfMzr8=;
        b=S5LGlMmu2bu6l1IPVRnxG8jHi53d/seY9J6Klbb+2LjV777fvSGKqlXWB+nR/JGOnn
         pGmgPmpKF4fVBA/I2xrWeAJ8Dv4Fgh1zDglGwsWIR19vUOCgzDf1eKPhi99/A1ipWSsN
         2rDz/NZpoYadYjTCRgCWVITYGs4DmCiUqW44rZjIX4FBtfDHiYDSgfgzGV55Qt3EZGz6
         3/kWLQ3dBsIdE3fgUr5XI/1cpn/dcce/66XbCw2jdif01Lcu0EW8FQPUPHx1ChhwRT9l
         /mdxTa72m9I4ccBnR/MpkABqCL9ShvpnF2mQ9U1x4sU1j1KBYcgL2yxF/6UGyYhwFYYr
         5vSA==
X-Gm-Message-State: AC+VfDy0CLVE5fYnC6G942T+umybaxt2JmdNYW+G97H2SYwU6IARI9Wu
	S8o2gBdS3DqQf08VNR9v11aUOA==
X-Google-Smtp-Source: ACHHUZ6Mo1nJZkoEy25euN2Nob3Y+z0UQWcQqryc3MNaJrMrtoUE/Nf6NS4SdUF8LM5x7J5pd1tCSw==
X-Received: by 2002:a5d:42cf:0:b0:306:40dc:abd9 with SMTP id t15-20020a5d42cf000000b0030640dcabd9mr3376711wrr.71.1683223451453;
        Thu, 04 May 2023 11:04:11 -0700 (PDT)
Message-ID: <a51e0f7e-aed0-2ec9-f451-2e750636fb78@rabbit.lu>
Date: Thu, 4 May 2023 20:04:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: xenstored: EACCESS error accessing control/feature-balloon 1
Content-Language: en-US
To: Yann Dirson <yann.dirson@vates.fr>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edwin.torok@cloud.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu>
 <474b531f-2067-a5d4-8b01-5b8ef1f7061d@citrix.com>
 <678df1ff-df18-b063-eda3-2a1aed6d40f8@vates.fr>
 <50bf6b82-965b-d17c-7c5a-49c703991504@rabbit.lu>
 <f44261a2-df39-f69a-9798-dc1d656e6dac@vates.fr>
From: zithro <slack@rabbit.lu>
In-Reply-To: <f44261a2-df39-f69a-9798-dc1d656e6dac@vates.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04 May 2023 17:59, Yann Dirson wrote:
> 
> On 5/4/23 15:58, zithro wrote:
>> Hi,
>>
>> [ snipped for brevity, report summary:
>> XAPI daemon in domU tries to write to a non-existent xenstore node in
>> a non-XAPI dom0 ]
>>
>> On 12 Apr 2023 18:41, Yann Dirson wrote:
>>> Is there anything besides XAPI using this node, or the other data
>>> published by xe-daemon?
>>
>> On my vanilla Xen (ie. non-XAPI), I have no node about "balloon"-ing
>> in xenstore (either dom0 or domU nodes, but I'm not using ballooning
>> in both).
>>
>>> Maybe the original issue is just that there is no reason to have
>>> xe-guest-utilities installed in this setup?
>>
>> That's what I thought as I'm not using XAPI, so maybe the problem
>> should only be addressed to the truenas team ? I posted on their forum
>> but got no answer.
>> I killed the 'xe-daemon' in both setups without loss of functionality.
>>
>> My wild guess is that 'xe-daemon', 'xe-update-guest-attrs' and all
>> 'xenstore* commands' are leftovers from when Xen was working as a dom0
>> under FreeBSD (why would a *domU* have them ?).
> 
> That would not be correct: xenstore* are useful in guests, should you
> want to read/write to the XenStore manually or from scripts;

Didn't know that, can you give some use cases (or URLs) for which it is 
useful, with or without XAPI ?
I've read xenstore* man pages and could not infer a use case.
Although I may already see some : updating ballooned memory values, or 
as Julien Grall pointed out, updating "feature-s3/4" values ?

PS: small mistake in "man/xenstore-write.1.html" (from at least 4.14, 
and onward), the synopsis reads "xenstore-read" ieof "xenstore-read".
Also, the -s option disappeared from unstable, although it may be 
expected. I don't know it's purpose either.

> xe-deamon and xe-update-guest-attrs both come from xe-guest-utilities 6.x, which
> is really a domU tool as well, but is there to support XAPI in dom0.

I checked on freshports, this is effectively the last version in 
FreeBSD, hence FreeNAS (although the version number hasn't been updated 
since 2020, despite updates, so it's not clear which version I'm using).

So next question is: shouldn't the installer detect if running on a XAPI 
Xen or not ? I imagine it's feasible, maybe via XAPI-specific xenstore 
nodes ?

Have a nice evening

