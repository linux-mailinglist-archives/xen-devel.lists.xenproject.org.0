Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E443AACC8D3
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 16:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004513.1384240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSKe-0006VU-KY; Tue, 03 Jun 2025 14:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004513.1384240; Tue, 03 Jun 2025 14:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSKe-0006TC-Hl; Tue, 03 Jun 2025 14:09:36 +0000
Received: by outflank-mailman (input) for mailman id 1004513;
 Tue, 03 Jun 2025 14:09:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMSKc-0006T5-Sz
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 14:09:34 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fa1c73c-4084-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 16:09:33 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso1163244f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 07:09:33 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe5b92bsm18151905f8f.9.2025.06.03.07.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 07:09:31 -0700 (PDT)
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
X-Inumbo-ID: 5fa1c73c-4084-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748959773; x=1749564573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=28wcA/4J7tuGdXetpGefwBKi0uYNHb5+EE/7GG8Imj0=;
        b=MbqkfODwgUCnFtCkcvS4n5m1wFA8M1vdtA2lJfEvAqeOZOGasvMDzkK/VlhUfCgEiU
         FW0pxdVbSZvK7dNqj5NuY6839m+AO/YSXaIcOM/Xe1jK4A90yZnZNTxT0UKuY1beo8a/
         1XY8XCD84Dddt+2SiYBl1UQdmozFmYCgfmoks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748959773; x=1749564573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28wcA/4J7tuGdXetpGefwBKi0uYNHb5+EE/7GG8Imj0=;
        b=oB72jb1kdXUGSQEXEj8nql1j5yNMdLZvxOMH4lNjmG7FWlrHUhE6TukuLUME75sDZh
         ZmfqF/uDwhP2v+f0i9VvnkcXNkZY+2i6h7jYyBNLz3vyLPlAQSBNY0YcLiAWnwiisA0Q
         RT0sVzsHUalgU31CrDhkTSNxzuRTrfc/ALCN26KqdgS0/E7eD6MQZKm76G9nMAdEx75L
         FsN3ksenm8ivOU0P/2wSxbyGK8uYNyfw6sdhzB4xkyJGVntg+6xIJP+ZPQYH7d13H//A
         0Z18wTgsl/sudYbPP2XUG84u2xC27EJvBTnnn2En1auq/3xk31M5/9fEb0t8rfJmFwrx
         nQiw==
X-Forwarded-Encrypted: i=1; AJvYcCUdBZQWHBWzjJIF8+Wh/szjldf12eOonvcm6NsdlLyLdt/LJx9QUHeNR8MBr5dHSZ7s5uetqd2LWMg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzu+FCC8pthwa2wmnwTFbaRxKlCbegP638eI54+wPfLGTYt3dHb
	Xn7lbtr46LHYuUOWtPPUgEom7uEeX+nwM3deU5cTcmInaLyiB+u1YfQsNcB6wMeLtBk=
X-Gm-Gg: ASbGncvbGIZ+m2638lrlLrT0h3Ci5sFB1CAcEHzj+zvnSYAK1N1YQ68ELypcdBFpKCs
	LZacHIip4dDcuWQUZ48cqmAA8zJq+hDvfx9gBqNwP1ZV8X+4BmnHuO2q6tBvM7uK4XC50M1/JHx
	pGqpAU6kfBW10ukKpWgLtGELv3ToX9wAi+n7yev11B5p04pWFt48gIroP1a2mxlT3sQsf4YDsKE
	bmg0YEZKwAnaurhfeQzszK++3zRcyiZn56g7wu42x8Zk+F1DPEb2/cwZYZ4l/tZDX5h7kEi2Ap7
	yTnAyOvtsAXPKxptTMf8Dx6sODuCSQbbqH4khi+6pyEN7yKwNEm9hRjAR/rN0DatqDLyp1eCAIQ
	26xEKp0XGr8p0vRD0
X-Google-Smtp-Source: AGHT+IEXVckzvDFeMXZzOyfMLkFnVv3w3pscZKorSjZrTDx/Sb0dbtMLfPyNqiRj4TFLxJz6rbQbVA==
X-Received: by 2002:a05:6000:288c:b0:3a4:dd02:f724 with SMTP id ffacd0b85a97d-3a4f7a9d48amr14467649f8f.43.1748959772695;
        Tue, 03 Jun 2025 07:09:32 -0700 (PDT)
Message-ID: <7e545be5-bcfa-46f7-b2b6-bee8c258f91c@citrix.com>
Date: Tue, 3 Jun 2025 15:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/9] CI: Have the gitlab job fail on tools/tests
 failure
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@vates.tech>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-6-anthony@xenproject.org>
 <ba57188a-77b9-4386-bd5a-073903062864@citrix.com> <aD78OU9fF5rqbHBh@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aD78OU9fF5rqbHBh@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/06/2025 2:44 pm, Marek Marczykowski-Górecki wrote:
> On Tue, Jun 03, 2025 at 02:41:50PM +0100, Andrew Cooper wrote:
>> On 03/06/2025 1:42 pm, Anthony PERARD wrote:
>>> From: Anthony PERARD <anthony.perard@vates.tech>
>>>
>>> We can't rely on an exit value from `run-tools-tests` since we only
>>> have the console output. `console.exp` only look for success or it
>>> times out. We could parse the console output, but the junit is more
>>> concise. Also check if we have it or fail as well.
>>>
>>> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
>>> ---
>>>  automation/scripts/qubes-x86-64.sh | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
>>> index 046137a4a6..7a4c5ae489 100755
>>> --- a/automation/scripts/qubes-x86-64.sh
>>> +++ b/automation/scripts/qubes-x86-64.sh
>>> @@ -298,6 +298,13 @@ TEST_RESULT=$?
>>>  
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
>>
>> Not for this patch, but for XTF I need to be able to express "tolerable
>> failure".  (All branches of Xen will run the same tests, and we don't
>> have OSSTest to deem "fail never passed" as non-blocking.)
>>
>> Even if the job passes overall, I want tolerable failures to show up in
>> the UI, so I have to use <failure> in junit.xml.  But that means needing
>> to be more selective, and I don't have a good idea of how to do this. 
>> (I have one terrible idea, which is </failure type=tolerable"> which
>> will escape that grep, but it feels like (ab)buse of XML.)
> But that automation/ dir (including the run-tools-tests script) is
> per-branch, so you can specify there which tests should be considered
> failure and which just warning, no? It will require few more bits in the
> script, but fundamentally shouldn't be a problem?
>

XTF is in a separate repo and does not have branches.

Now consider
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=d965e2ee07c56c341d8896852550914d87ea5374,
and testing it.

Anything I put into XTF to test it will pass on staging but fail on the
older stable-* trees.  In due course it will get backported to the
bugfix branches, but it likely won't get fixed on the security-only
branches.

Furthermore, I need to not change xen.git to make this work, and older
branches need to pick up newer XTF automatically.  (XSA tests *are*
expected to pass everywhere once the issue is public.)

My current plan is to have logic of the form:

if ( xenver >= $STAGING )
    xtf_failure(...);
else
    xtf_success("Expected Failure:" ...);

where $STAGING moves when backports get done.  I still want the failures
to show up in the Tests UI.

~Andrew

