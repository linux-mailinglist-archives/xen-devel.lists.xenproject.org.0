Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74317F6478
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 17:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639940.997612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6D0k-0002Ak-B6; Thu, 23 Nov 2023 16:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639940.997612; Thu, 23 Nov 2023 16:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6D0k-00028P-8J; Thu, 23 Nov 2023 16:57:06 +0000
Received: by outflank-mailman (input) for mailman id 639940;
 Thu, 23 Nov 2023 16:57:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVVO=HE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r6D0i-0001fL-87
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 16:57:04 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 539628fd-8a21-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 17:57:03 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32dc9ff4a8fso703111f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 08:57:03 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 df2-20020a5d5b82000000b0032fbe5b1e45sm2089010wrb.61.2023.11.23.08.57.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 08:57:03 -0800 (PST)
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
X-Inumbo-ID: 539628fd-8a21-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700758623; x=1701363423; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nL9Lrzli2/83sINQl90CXNfa5qp0gGlv9hp0GrRE4N8=;
        b=KWCPfrV6Tgt9vVa4bxejJSEI2knJlSPQtUyHpC8uKNtdlvq5rkF1I8DHEZqM6QdLTH
         NeojDa6pRzWpl43KgV/EjanKnQWgkHrQVcTngqGrHx5WBNBpwqyIkGV9XLzLo52wpcGf
         B3blSNNdxDK0jVb3gDHfKNjVYdfgV8zyjMY/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758623; x=1701363423;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nL9Lrzli2/83sINQl90CXNfa5qp0gGlv9hp0GrRE4N8=;
        b=Sf1WZLqywtQVban8b+AHr1qv6ALwrVYTkgc7Ymf0GFZRbV03ia+8tzqm1fbHCApUc1
         7dV33zs8zJBKsuqj5DtGL2kdO4Eh7D9TULBVw002kx6Gn1ppJTuHussWJcdiwK8uTlRp
         qXv/ucNznItFeGWJqFTTidAFkXiKkh031P3UykAPa6TtDKQNmbqvrHkf1p0PiGOzXPyx
         qP5rzhQuH5eTlihuzw1J07cISmyT/1ww9jx7pUR364Q10QE1QoEi1FAN40pWxxorUkeU
         9x3iEY+zZNT2wYBKDCajuRGr2+te1A4KuuA3ffeyhOsZmtfmT0iiWapbjU8yN4LQJIxk
         8Okg==
X-Gm-Message-State: AOJu0YwSabx2cfRENfQA4lWy3Ag2BIHG3/KQ+dGBHMMCQSGrs9xJQxWu
	W+I1at+6y3loLNqSkNtVO4TUeA==
X-Google-Smtp-Source: AGHT+IFNLCZEJISWHAujthmyH7HyNTzACUbz+tnKpm59of71nm6Po4wKqVhQ+xGSsL3yu0ylo83RHA==
X-Received: by 2002:adf:ef46:0:b0:332:ced7:56cf with SMTP id c6-20020adfef46000000b00332ced756cfmr25671wrp.48.1700758623205;
        Thu, 23 Nov 2023 08:57:03 -0800 (PST)
Message-ID: <420cffb8-96f7-43f2-9ba2-019eb4abf49d@citrix.com>
Date: Thu, 23 Nov 2023 16:57:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2.5/6] tools/pygrub: Fix expression before it's copied
 elsewhere
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231106150508.22665-3-alejandro.vallejo@cloud.com>
 <20231122200702.1874420-1-andrew.cooper3@citrix.com>
 <90f63f30-38d3-4d70-aae3-1ec3a307c4c1@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <90f63f30-38d3-4d70-aae3-1ec3a307c4c1@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/11/2023 4:50 pm, Alejandro Vallejo wrote:
> On 22/11/2023 20:07, Andrew Cooper wrote:
>> This has an identical meaning, and is the more pythonic way of
>> writing it.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Wei Liu <wl@xen.org>
>> CC: Anthony PERARD <anthony.perard@citrix.com>
>> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>>   tools/pygrub/src/pygrub | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
>> index 327cf51774fc..2c06684d6532 100755
>> --- a/tools/pygrub/src/pygrub
>> +++ b/tools/pygrub/src/pygrub
>> @@ -88,7 +88,7 @@ def downgrade_rlimits():
>>       # filesystem we set RLIMIT_FSIZE to a high bound, so that the file
>>       # write permissions are bound.
>>       fsize = LIMIT_FSIZE
>> -    if "PYGRUB_MAX_FILE_SIZE_MB" in os.environ.keys():
>> +    if "PYGRUB_MAX_FILE_SIZE_MB" in os.environ:
>>           fsize = int(os.environ["PYGRUB_MAX_FILE_SIZE_MB"]) << 20
>>         resource.setrlimit(resource.RLIMIT_FSIZE, (fsize, fsize))
>
> LGTM.

Can I take that as a R-by then?

~Andrew

