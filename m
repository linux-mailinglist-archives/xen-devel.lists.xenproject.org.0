Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D51ACCBD2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 19:13:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004729.1384451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMVCm-0001it-Vi; Tue, 03 Jun 2025 17:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004729.1384451; Tue, 03 Jun 2025 17:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMVCm-0001gS-SL; Tue, 03 Jun 2025 17:13:40 +0000
Received: by outflank-mailman (input) for mailman id 1004729;
 Tue, 03 Jun 2025 17:13:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMVCm-0001gM-1d
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 17:13:40 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 157342de-409e-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 19:13:35 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ad89f9bb725so1174831866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 10:13:35 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5e2befaesm995164666b.104.2025.06.03.10.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 10:13:34 -0700 (PDT)
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
X-Inumbo-ID: 157342de-409e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748970815; x=1749575615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fgAdH6z/B6I/QpF7fBowdts0/hFtO2fb+8/ioZpDhJo=;
        b=ArJ/z4V4dDVMtCPxQyHdh4hI5wqO9CJrGuQ2tCd6SpZue+HtZLabkABukCesfXG3EE
         uKzD8SaOvUtTL8h1w6pAgAKflDq1kLm0beLGctpr492mJ3Fe0UN6ALDSUlGX/tQiSZAM
         L+mzOFy4heAjh1M+osmqc7RrVk0zLqHnsvUcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970815; x=1749575615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgAdH6z/B6I/QpF7fBowdts0/hFtO2fb+8/ioZpDhJo=;
        b=CeHhaK5/oHZjI1Y2iVdGkaUyn2wrBU6TxPJyRZmCF6MH9N33slSJGWJvZUPXuiAYKc
         5FjExdcwfFZZjcSkRXNtM3LKUb5iqiaE7MdwxxgH1vnrrHnxSV8fmnWWCPBHjVtzw71J
         gGtd8l7dIuoHc4jyWlCmBtPSh2iE2rr80+r5c4kdv/wWAs6E4hVg3RMooEEGHKk+Hky0
         i1nZV/XXgMtCacRBxRoGKLv/Y6jDPuahjRKDo9Wq7wwHi3BagRKVtUYfJmb/OmRGfidP
         PsgPbx5p/ZD7065ITcmk5Svlqv1F7IyUBkYaOi+L48k12PZXBMcVjA4TQkwFvTb5fiTP
         +3yw==
X-Gm-Message-State: AOJu0YzvZ4zfWkzfGQZk/R7o9/0nM8ZtLfTGEgwrQBXSHvG1i4EHITfg
	siOY0KDjj5AMVLpdd9StHyvGr+W0Hyy/hPgt9zAQBvS8M/DVJcj5svyMjNq5422n544=
X-Gm-Gg: ASbGncuPum9VQ6MARTm1YzND7qOHWfKp/MPG1kGNq+PuPGgYNH455/lphATdVioCRsN
	m2urZ/FGOsXJ2cA2gv9TrlwOFAKsTbXjGjpOfasbsWnHIihGmGJfcNPxFueuX552WTfUKyNnNIQ
	K1eHqM5B6CSK8mDxdt1TQ7q6EU9rl+dpHP4GMu3nFDFLtiljNOlkyFIZFZYuryC1f9/rYHNA2pi
	ygxFhQQ2Oo+2DyFR+3YicnTdAQmuZjkaYA0f93hJ7H+eZxpo0AnZO0V3eVuosS/MCs6HY2u4pQH
	5DcDD0W4Kt3YS2lIeUsG77qe26sqjna9XwQBgZ9t7eZJKDtzbJenxrZHNZ+Vvm9F4XVKxVnXuUQ
	2/B2PWFCmcsria7+O
X-Google-Smtp-Source: AGHT+IFwYO0C5AbbIbylKNhqlfdmNNZCInj6oz7DJIvhVa++O9eKAUIitnEMwGTtHockAgP5Hj2IJg==
X-Received: by 2002:a17:907:971c:b0:adb:2ef9:db38 with SMTP id a640c23a62f3a-adb36be2060mr1697004966b.36.1748970815044;
        Tue, 03 Jun 2025 10:13:35 -0700 (PDT)
Message-ID: <70df2eac-0b82-4f9f-9235-95d42e412e82@citrix.com>
Date: Tue, 3 Jun 2025 18:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/9] CI: Have the gitlab job fail on tools/tests
 failure
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-6-anthony@xenproject.org>
 <ba57188a-77b9-4386-bd5a-073903062864@citrix.com> <aD8btMPtrwT2d7sS@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aD8btMPtrwT2d7sS@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/06/2025 4:58 pm, Anthony PERARD wrote:
> On Tue, Jun 03, 2025 at 02:41:50PM +0100, Andrew Cooper wrote:
>> On 03/06/2025 1:42 pm, Anthony PERARD wrote:
>>>  if [ -n "$retrieve_xml" ]; then
>>>      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
>>> +    # Findout if one of the test failed
>>> +    if ! grep -q '</testsuites>' tests-junit.xml; then
>>> +        echo "ERROR: tests-junit.xml is incomplete or missing."
>>> +        TEST_RESULT=1
>>> +    elif grep -q '</failure>' tests-junit.xml; then
>>> +        TEST_RESULT=1
>>> +    fi
>>>  fi
>>>  
>>>  exit "$TEST_RESULT"
>> A couple of things.
>>
>> From my experimentation with junit,
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1849342222/test_report?job_name=kbl-xtf-x86-64-gcc-debug
>> we can also use </error> for classification.  I'm also very disappointed
>> in Gitlab classifying <warning> as success.
> According to the documentation [1] which point to this junit xml format [2]
> the only elements (and path) are:
>     testsuites.testsuite.testcase.failure
> "error" or "warning" don't exist.
> There's the attributes `type` in <failure> but this isn't explained how
> it's used.
>
> But I guess if we follow the link in [2], go through web.archive.org, we
> can find [3] which has "skipped", "error", "failure", but still no
> "warning".
>
>
> [1] https://docs.gitlab.com/ci/testing/unit_test_reports/#unit-test-reporting-workflow
> [2] https://www.ibm.com/docs/en/developer-for-zos/16.0?topic=formats-junit-xml-format
> [3] https://github.com/windyroad/JUnit-Schema/blob/master/JUnit.xsd

I was also very disappointed with the documentation, which seems to be
almost non-existent.

But after some source diving:
https://gitlab.com/gitlab-org/gitlab-foss/-/blob/master/lib/gitlab/ci/parsers/test/junit.rb#L69-83

So anything which isn't recognised is deemed to be success.  Lovely :(

I'm also still none the wiser as to why Skip's system_out is a formatted
json blob, unlike the others.


>
>
>> Not for this patch, but for XTF I need to be able to express "tolerable
>> failure".  (All branches of Xen will run the same tests, and we don't
>> have OSSTest to deem "fail never passed" as non-blocking.)
> According to [1], there's a notion of "Existing failures", but that
> might show up only on merge request.
>
>> Even if the job passes overall, I want tolerable failures to show up in
>> the UI, so I have to use <failure> in junit.xml.  But that means needing
>> to be more selective, and I don't have a good idea of how to do this. 
>> (I have one terrible idea, which is </failure type=tolerable"> which
>> will escape that grep, but it feels like (ab)buse of XML.)
> At the moment, `run-tools-tests` write '<failure type="failure"' on
> failure, so we could grep on that instead event if it is sligtly more
> fragile. I've choosen to grep on '</failure>' at first because that's
> much less likely to be written differently, while the attributes in the
> tag could be written in a different order.
>
> Then, we can always use `sed` and extract the "type" to check it:
> sed -n 's/.*<failure \(\|.* \)type="\([^"]\+\)" .*/\2/p' tests-junit.xml | while read type; do
>   case $type in
>     failure) echo fail;;
>     tolerable) echo ok;;
>     *) echo error unknwon type $type;;
>   esac
> done
> But that maybe going a bit too far :-)

There's xq which might be able to do this more nicely, and is packaged
in alpine.

~Andrew

