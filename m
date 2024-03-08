Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20C58765D1
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 14:59:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690310.1076188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rial1-0007Yd-UD; Fri, 08 Mar 2024 13:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690310.1076188; Fri, 08 Mar 2024 13:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rial1-0007WB-RF; Fri, 08 Mar 2024 13:59:31 +0000
Received: by outflank-mailman (input) for mailman id 690310;
 Fri, 08 Mar 2024 13:59:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8hQF=KO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rial0-0007SX-Db
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 13:59:30 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13f0529a-dd54-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 14:59:28 +0100 (CET)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-42f13eebabbso9799921cf.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 05:59:28 -0800 (PST)
Received: from [192.168.86.29] ([83.104.235.82])
 by smtp.gmail.com with ESMTPSA id
 d17-20020ac85351000000b0042f148f6caasm2453283qto.78.2024.03.08.05.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 05:59:26 -0800 (PST)
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
X-Inumbo-ID: 13f0529a-dd54-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709906367; x=1710511167; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/+37e/CZnsEbkRBexCvC3pluOt7LMrL9B3WZcXqPu4=;
        b=ZgJpWbMYQ3AkFPVYcpH48sEGYqge2O/H3GDnTt1/B3mUidlS1CmBe7XmnzhfR7Rk75
         db0sc4M4WdatOuIlnQ42xRYdNpCfzXfgGiij8/btyA74HP9+mIGZshqMfCDC0U8x7Q8+
         KOO/Y3A+4d1DsU8s4lhHT/eoFYwx5ba0/EvO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709906367; x=1710511167;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/+37e/CZnsEbkRBexCvC3pluOt7LMrL9B3WZcXqPu4=;
        b=QraOCoFc8VsZnzJ8UBVEz5vWHlb1nrEko/ECZmjCMOvqxjB80Q7o2CJAJ5Y2YlOZta
         7Wmrt1c5WTc5F9fUdy6TpkUGDuECbujcVriOjPGMXw0x745Mdt7daNheR32GB0uhvP/V
         LUwvyDxrdlvqEPhQMTcpR2maqjVwCS3tw+1DmaPOPCNg9b13jhm8jvvfww5RJ97GRtww
         spoEHakwuRZ4hyuhNBZx5mVfzHusJ4Tb3+s+M9jQP1sBiUtlEMqA+zZlPXVpDbaiQYd/
         Dpx+JJDV5NZaAYIhtDGewKmkbwWOnjh1uQybibNJLPZVuksmjC8h74gaXRHaJ0HmxAua
         Vu/w==
X-Forwarded-Encrypted: i=1; AJvYcCUKgOQgyrFMe16dJW2iQMXa2/SDo9yjAcyee+zGnhKu0Z+O8svBrjTfAtTR9Ulk8wHlBrp+5ihKPLDo7rHeQ3c2Vb2gzL2QudjvVHmc4NM=
X-Gm-Message-State: AOJu0YxVraLqNaxXIs80rnCTU7OttcQ5EAv3tZAOsXe/wqFuMU8KNMCJ
	aIiZ2AueEgrbNpSTVZkxLPmHdlBlCphfZNXYm/mUFscfUSpLo4WYrKVdvZQsaXU=
X-Google-Smtp-Source: AGHT+IFoPHKtY9ZPxS7YtBzkiGHnX2qzlkS3O+7Gnek0VVottCuWWniwZ/EkS3VOjPN9ra7VGXaR9g==
X-Received: by 2002:a05:622a:118f:b0:42e:d2a7:9eee with SMTP id m15-20020a05622a118f00b0042ed2a79eeemr25173qtk.46.1709906367186;
        Fri, 08 Mar 2024 05:59:27 -0800 (PST)
Message-ID: <b9ecffeb-cbef-4be7-bb85-224cbc11a35b@citrix.com>
Date: Fri, 8 Mar 2024 13:59:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-unstable test] 184940: regressions - FAIL
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-184940-mainreport@xen.org>
 <5c21d349-5021-490f-bc6b-eb5973622688@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5c21d349-5021-490f-bc6b-eb5973622688@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/03/2024 1:56 pm, Jan Beulich wrote:
> On 08.03.2024 14:45, osstest service owner wrote:
>> flight 184940 xen-unstable real [real]
>> flight 184945 xen-unstable real-retest [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/184940/
>> http://logs.test-lab.xenproject.org/osstest/logs/184945/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  test-amd64-amd64-livepatch   13 livepatch-run            fail REGR. vs. 184927
>>  test-amd64-i386-livepatch    13 livepatch-run            fail REGR. vs. 184927
> Hmm, both have "(XEN) common/livep" following the shell prompt,
> i.e. an incomplete hypervisor log message (maybe a failed assertion?),
> suggesting a triple fault may have occurred. While some livepatch
> related changes are under test, I can't (for now) connect any of them
> (or any of the other changes) with such behavior.

Well... that's ominously my changes then, but our testing seems happy
with them.

~Andrew

