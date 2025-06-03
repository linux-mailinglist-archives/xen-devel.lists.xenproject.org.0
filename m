Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C285CACC90F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 16:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004542.1384271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSar-0002am-F8; Tue, 03 Jun 2025 14:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004542.1384271; Tue, 03 Jun 2025 14:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSar-0002ZL-CL; Tue, 03 Jun 2025 14:26:21 +0000
Received: by outflank-mailman (input) for mailman id 1004542;
 Tue, 03 Jun 2025 14:26:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMSap-0002Z9-Te
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 14:26:19 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b666289d-4086-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 16:26:18 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-442f9043f56so34808225e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 07:26:18 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00971e4sm18765109f8f.65.2025.06.03.07.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 07:26:16 -0700 (PDT)
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
X-Inumbo-ID: b666289d-4086-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748960777; x=1749565577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c1d7pHUH7DhuO7y/k5Cv73v2UJqOlyFolZ+8cHMZUDI=;
        b=Xmi5Ela1ezP5sg0vt5IMTwPy7d60lr9f2Qpc5yvk28WfjiBvxOHtFvWVoUumUPKWrK
         lttuL6g9/TDiK7ankl0u6NeuETIucIfEZ96kK4g7r2OtB6bLumTFK0HLUC70IzWRFcpI
         rA24AEkBhzLeIQ9GBd4rgAKM83Xg9S+PVY560=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748960777; x=1749565577;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1d7pHUH7DhuO7y/k5Cv73v2UJqOlyFolZ+8cHMZUDI=;
        b=W3KAMcl7IxuoPIWyMJeGlJ1CyGwWjv2xgOK4bsS6QjWwAm9HyYWHMUFe61aUhar8Qu
         5rQgTusHGGiNdL9Rsov3jPdt+deiJlkZLMwkZ6yNiTR8cAd1wwrlvYN83OfagMRVHbWt
         trabRUmkJkBvNnB2zGJO23X5dg+jpyZxRndI9HpudRfPnGi4CW9IA7OJAACKV98b4rLp
         8V30yL6n4jBt4nvC0zLFJ6xMOaw2Bp4h92zRzIuZD2kg4TZ69MDPN743Oy1vBMe+T5Ud
         iSKqyHfcGmF5o43xTDWdN7x1DO0m57UTG3TNsRyw3T3RVqRDcgF1HuoIeK9Oy5dnIiyq
         obYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrS9P1Fl3AFp8NiRA2ULsmFLXiSsxFO92UVAKVtJX0G2mQfDpeZcmkS5ckN20N4vXl3MXl8QqWqXc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMu0cdfHeBVxmPcleKD+q0HTok3vuD3jpGGefZkD9EpuEIeaQP
	7HIjTKcN+SguFy1ZgAvX17aYbm1grl9dZzBxldxr1TgE2vNZg/qxwLG8gFzx8Tx205Q=
X-Gm-Gg: ASbGncsnnSDkFZZcQXGk2VZRGMxNImaw37SAgPycuNmZlo4Mlwqz8gEUj6/y+zRhJa+
	0YfPg/9mnQLw8lmrU2cmS6YLEIWf7GWSFUkNwG5mC8ozOHXv14wHBEsYtujp4HOSeWovIidm4za
	QCtibH8tv5iQOc0/qiiFw0KdNGe9ffCxhXKJM8nWhlq3EtlE/foZ7AV0kNXHdA/g3qnG+7K2zBi
	vLgzkLAUAPg0BsYJ/nytvuCYwyK8QxGO04klRI3zqDi2tFY1jTsvVf24+RaB/zaziNpK58EgElC
	kYfpOvx3u6sRmKBsgEBs7oA8w3XpZQxS5JKGLmiZi2H3P0weXbsAFZxS3n+eE9kFsuRND/Pj93Q
	NkI1fOochmLmnT6xR
X-Google-Smtp-Source: AGHT+IEp19aI7RJE6Gq625SPmnCewdA0ZEC7ow8HeR+xdftPOToxUin/ix9i4CGY4WPAiMJcJBKXaA==
X-Received: by 2002:a05:6000:178e:b0:3a4:ed1e:405b with SMTP id ffacd0b85a97d-3a4fe39909bmr9843888f8f.46.1748960777242;
        Tue, 03 Jun 2025 07:26:17 -0700 (PDT)
Message-ID: <a08c9407-c6cf-40ef-b337-9a4f4b244683@citrix.com>
Date: Tue, 3 Jun 2025 15:26:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/9] CI: Have the gitlab job fail on tools/tests
 failure
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@vates.tech>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-6-anthony@xenproject.org>
 <ba57188a-77b9-4386-bd5a-073903062864@citrix.com> <aD78OU9fF5rqbHBh@mail-itl>
 <7e545be5-bcfa-46f7-b2b6-bee8c258f91c@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7e545be5-bcfa-46f7-b2b6-bee8c258f91c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/06/2025 3:09 pm, Andrew Cooper wrote:
> On 03/06/2025 2:44 pm, Marek Marczykowski-Górecki wrote:
>> On Tue, Jun 03, 2025 at 02:41:50PM +0100, Andrew Cooper wrote:
>>> On 03/06/2025 1:42 pm, Anthony PERARD wrote:
>>>> From: Anthony PERARD <anthony.perard@vates.tech>
>>>>
>>>> We can't rely on an exit value from `run-tools-tests` since we only
>>>> have the console output. `console.exp` only look for success or it
>>>> times out. We could parse the console output, but the junit is more
>>>> concise. Also check if we have it or fail as well.
>>>>
>>>> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
>>>> ---
>>>>  automation/scripts/qubes-x86-64.sh | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
>>>> index 046137a4a6..7a4c5ae489 100755
>>>> --- a/automation/scripts/qubes-x86-64.sh
>>>> +++ b/automation/scripts/qubes-x86-64.sh
>>>> @@ -298,6 +298,13 @@ TEST_RESULT=$?
>>>>  
>>>>  if [ -n "$retrieve_xml" ]; then
>>>>      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
>>>> +    # Findout if one of the test failed
>>>> +    if ! grep -q '</testsuites>' tests-junit.xml; then
>>>> +        echo "ERROR: tests-junit.xml is incomplete or missing."
>>>> +        TEST_RESULT=1
>>>> +    elif grep -q '</failure>' tests-junit.xml; then
>>>> +        TEST_RESULT=1
>>>> +    fi
>>>>  fi
>>>>  
>>>>  exit "$TEST_RESULT"
>>> A couple of things.
>>>
>>> From my experimentation with junit,
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1849342222/test_report?job_name=kbl-xtf-x86-64-gcc-debug
>>> we can also use </error> for classification.  I'm also very disappointed
>>> in Gitlab classifying <warning> as success.
>>>
>>> Not for this patch, but for XTF I need to be able to express "tolerable
>>> failure".  (All branches of Xen will run the same tests, and we don't
>>> have OSSTest to deem "fail never passed" as non-blocking.)
>>>
>>> Even if the job passes overall, I want tolerable failures to show up in
>>> the UI, so I have to use <failure> in junit.xml.  But that means needing
>>> to be more selective, and I don't have a good idea of how to do this. 
>>> (I have one terrible idea, which is </failure type=tolerable"> which
>>> will escape that grep, but it feels like (ab)buse of XML.)
>> But that automation/ dir (including the run-tools-tests script) is
>> per-branch, so you can specify there which tests should be considered
>> failure and which just warning, no? It will require few more bits in the
>> script, but fundamentally shouldn't be a problem?
>>
> XTF is in a separate repo and does not have branches.
>
> Now consider
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=d965e2ee07c56c341d8896852550914d87ea5374,
> and testing it.
>
> Anything I put into XTF to test it will pass on staging but fail on the
> older stable-* trees.  In due course it will get backported to the
> bugfix branches, but it likely won't get fixed on the security-only
> branches.
>
> Furthermore, I need to not change xen.git to make this work, and older
> branches need to pick up newer XTF automatically.  (XSA tests *are*
> expected to pass everywhere once the issue is public.)
>
> My current plan is to have logic of the form:
>
> if ( xenver >= $STAGING )
>     xtf_failure(...);
> else
>     xtf_success("Expected Failure:" ...);
>
> where $STAGING moves when backports get done.  I still want the failures
> to show up in the Tests UI.

P.S. I'm planning to teach ./xtf-runner how to write out a junit.xml
directly.  I'm not interested in interpreting python's stdout and
writing xml in shell...

~Andrew

