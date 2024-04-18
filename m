Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9F58AA217
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 20:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708550.1107550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxWZP-0002W5-5o; Thu, 18 Apr 2024 18:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708550.1107550; Thu, 18 Apr 2024 18:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxWZP-0002TH-21; Thu, 18 Apr 2024 18:33:15 +0000
Received: by outflank-mailman (input) for mailman id 708550;
 Thu, 18 Apr 2024 18:33:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p/a5=LX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rxWZN-0002TB-JP
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 18:33:13 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1aa6b516-fdb2-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 20:33:09 +0200 (CEST)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6ebb815f688so811996a34.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 11:33:09 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q16-20020a0cf5d0000000b0069f4808719csm866011qvm.76.2024.04.18.11.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 11:33:07 -0700 (PDT)
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
X-Inumbo-ID: 1aa6b516-fdb2-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713465188; x=1714069988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=utbWy4T2lpkUvK/Qg78BBLSoUSYS1nJW1HGyJWaw7Lo=;
        b=Nb8JW3t1XIgL4iDW+HHu+0Wdg1Wg3CZJdkrNdvubinhE2pp93OEeY4hP+AxW9x4Sp1
         f5QyFZOb32VVXBOHJGG8dRKsan/BqANvuD4L5EWbi2GXMRL4pcTF6jc89GvfLKX4HgvJ
         Vx+0d2kBwp82jszYBSwpyFIA8QIdtmziRCgMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713465188; x=1714069988;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utbWy4T2lpkUvK/Qg78BBLSoUSYS1nJW1HGyJWaw7Lo=;
        b=ROYqwdWazbfvklPTTz0GtIwKzuLuvj5wzUxc2D3C+vNz5FuneDd3IAdkamUtIc2Wv0
         Gd8OJemo1/RWMtkdVNXR29vc9NiXnxn6dY3XBNaJ7X0pvVMbwGRfp7o5j3P6M/PhgQKn
         3CZkgRxHL4FaUmDCbnpYcfBDd9/6hJYdLf/RMrypt9sQtuDb/IA4ZiJ28zJroeJPjSoi
         BkhjPslYVdVp9jdJFc9D4Rrc1zQo+SaT+JX1RoHfnbWSFSOpMdA5dkbIlZyHIr2V1JBI
         syHTL/kTpe1Z2Ecjc0qwZGQss7npUf4A0lkU61uYMDVjYZdEc1tHk8XfCATncYImlIKi
         Ufhw==
X-Forwarded-Encrypted: i=1; AJvYcCVFTknJ4J9YMkcMTx51oM+eTepDTBwYZBKXZScHq85X9Z3nvpXFw46184o1gj7FyFhaEKClJjpe2HrM/lvWso1mfU+t3smjRJ/CvlpHkMs=
X-Gm-Message-State: AOJu0YwB8QqQaXrrztxN9gU9ywHnEAEO+TqAqMnP8isMcF8znmncU9Lo
	9t751uiRsrRPmDMpgpd9seFFj2WIES+nFEftW9g2YsHacRRcItrgtgU8QyMve/s=
X-Google-Smtp-Source: AGHT+IGEKddhiN8f/dNr9S0dv7P7QboW7/U7frQHwYTUTQC8duyVf1kFW8nKLmVJFb9+jEXjhWAYTg==
X-Received: by 2002:a05:6358:793:b0:17f:8815:ef23 with SMTP id n19-20020a056358079300b0017f8815ef23mr53765rwj.10.1713465188142;
        Thu, 18 Apr 2024 11:33:08 -0700 (PDT)
Message-ID: <e25ae134-a510-432a-a9a3-b6ebac8c31c6@citrix.com>
Date: Thu, 18 Apr 2024 19:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] docs/misra: mark the gzip folder as adopted code
To: Jan Beulich <jbeulich@suse.com>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>
References: <2970c1010e227ca1460c5656d13fb87a05d87f29.1713174475.git.federico.serafini@bugseng.com>
 <d62f622b-65b4-4e37-87db-3cc88c89da67@citrix.com>
 <eb82270c-52f2-49f9-9aaa-72906e5b9b97@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <eb82270c-52f2-49f9-9aaa-72906e5b9b97@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/04/2024 8:39 am, Jan Beulich wrote:
> On 15.04.2024 17:44, Andrew Cooper wrote:
>> On 15/04/2024 10:56 am, Federico Serafini wrote:
>>> Mark the whole gzip folder as adopted code and remove the redundant
>>> deviation of file inflate.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> I hadn't realised that we had a special case like this.  Definitely
>> better to get rid of it.
>>
>> I've pulled this into my `for-next` branch, and will get it committed
>> properly when OSSTest (our non-gitlab CI) is in a happier state.
> Hmm. Considering Daniel's work (which I'll comment on separately), is this
> really going to remain "adopted"? We're about to diverge to a degree where
> simply taking patches from the original source isn't going to work anymore.
> IOW I think we want either Daniel's work (and perhaps follow-on adjustments)
> or marking of that code as adopted.

inflate.c is was from Linux in 2010.  There's only one build fix and one
comment change in Linux since 2010, whereas Xen's copy has seen several
bugfixes and cleanups.

gunzip.c has floated around rather more (it was originally some glue
code in bZImage.c) but it was entirely rewritten first, to support other
types of decompression (we did this differently in Xen), and second to
support KASLR.


In both cases, there's not an upstream to usefully track, and we
probably take ownership.

~Andrew

