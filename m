Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5F4AC4378
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 19:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997659.1378479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJbfG-0004ev-0M; Mon, 26 May 2025 17:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997659.1378479; Mon, 26 May 2025 17:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJbfF-0004d2-Sl; Mon, 26 May 2025 17:31:05 +0000
Received: by outflank-mailman (input) for mailman id 997659;
 Mon, 26 May 2025 17:31:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkau=YK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJbfE-0004cw-MM
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 17:31:04 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 324af79c-3a57-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 19:31:03 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so29535195e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 10:31:03 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f1ef0b20sm250860605e9.14.2025.05.26.10.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 10:31:01 -0700 (PDT)
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
X-Inumbo-ID: 324af79c-3a57-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748280662; x=1748885462; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bvNJ+N/BEp5lGbtN6GJv/Y00BO2+ci/AE44x/veE+Pk=;
        b=Z1B8M11LTUHgfJUprSyVK1jo+rI4ORsXyr1wWmPDOusDZo3FpZMasrhFvUMqfTvwcS
         2R9T2z8GVQVjVR1xHH0xX10Qs2snLMli207e98Q63FUmNH9O2X7aB3cv8984+8hlAN3q
         oJXlbyQUyeApr/a725okpjlZhx7vruVDiJt78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748280662; x=1748885462;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvNJ+N/BEp5lGbtN6GJv/Y00BO2+ci/AE44x/veE+Pk=;
        b=WsMON3K3+vOORBc9DpaBG1DUplWO6cN2PzbDG9TAOAnrnSD4v/Xxt/TsexBMIbunUP
         l9mdHGVnwV4vKw0Y1ngA49o1Ur57Pj6NPITrcV0JntFoIfbMgq9K82yg3qNcoYW4xV5k
         mTi3ljak7crp/fKJmg0y9Ziz5FlHYJuXc1eudBSkKhbaNETOLafbbr/zlPzOzY0nwvJF
         gAh1ICvhYDhUqOV725CHQzFrM+b56VCLyFe6VPHf2S3IcvPQAEAth9bqnmP7QOVV+2+Q
         cCoXN0DueByumwYbSmJEUvaR9+24x4bKrjp5kaiOUomLbuWrBJ8x9EsOAPnmwpWrDazG
         Fx1A==
X-Gm-Message-State: AOJu0YwCNbUC7PsyHme9VSafsAv5XRHha2VU9oxH1Pb1VTcGr5TyLyGF
	BnHPUbc06o1yej3uf/oU/dl3iDWg/9ziPq5GnFE4odzpwhFx3Q8sTUKZ5ctk5gtkXoAhlMozZUB
	bf1mX
X-Gm-Gg: ASbGncvfS3vkLpcsFZ5sLAIY/UAJh2pW1fl3Z0/TPG//aekcIwvb43AXeh1Z4coUoPi
	CAwpmOru8uE87Z3BYbRfQw2RqyL4ruZhZyapJ4NRGD+G9IhBbYddVbBEB+A3U4mdirasjmsTk5Q
	RXnHM8ij2rJssbfMUtC8H0fJMMX3CY6bfQ51JtBB1Vn4+2F6KiYbHhMTYodA47JyDEdtGQhc5WO
	+sswRczw2hYykH3q7xBwvRoTuL4mCLEC8j9EKdnacGHvHmGtxd7kPqRN25Ih54ZNDKTlEmmIo0g
	5koUF4LjsDZGLjAjqf0ag3U0YEzg23YOC4rCDjlPKWrYyvaKsblygiMimKUUr5dinlsCFSeEy8a
	wvO6ExpIWN0XrnLW5
X-Google-Smtp-Source: AGHT+IHM8+7w6CK1cXqVSZFKLdG8vy3l0UIlCo4uRq1gi4B1ucEHkrWHkcTwkUY9lg8HRSXUrnkEcA==
X-Received: by 2002:a05:600c:699a:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-44c91dd08c7mr88293095e9.8.1748280662442;
        Mon, 26 May 2025 10:31:02 -0700 (PDT)
Message-ID: <23aeac17-6fd0-4515-8c84-1a867c57a68d@citrix.com>
Date: Mon, 26 May 2025 18:31:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] CI: Drop custom handling of tools/tests
To: Anthony PERARD <anthony@xenproject.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250520205239.203253-1-andrew.cooper3@citrix.com>
 <20250520205239.203253-4-andrew.cooper3@citrix.com>
 <1e690ecb-5060-4dfe-a515-acbbf214bc99@citrix.com> <aDSjaewFMxUj6Tel@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aDSjaewFMxUj6Tel@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/05/2025 6:22 pm, Anthony PERARD wrote:
> On Mon, May 26, 2025 at 05:45:29PM +0100, Andrew Cooper wrote:
>> On 20/05/2025 9:52 pm, Andrew Cooper wrote:
>>> diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
>>> index 770e97c3e943..8d7aa8fa5140 100755
>>> --- a/automation/scripts/run-tools-tests
>>> +++ b/automation/scripts/run-tools-tests
>>> @@ -12,30 +12,25 @@ printf '<?xml version="1.0" encoding="UTF-8"?>\n' > "$xml_out"
>>>  printf '<testsuites name="tools.tests">\n' >> "$xml_out"
>>>  printf ' <testsuite name="tools.tests">\n' >> "$xml_out"
>>>  failed=
>>> -for dir in "$1"/*; do
>>> -    [ -d "$dir" ] || continue
>>> -    echo "Running test in $dir"
>>> -    printf '  <testcase name="%s">\n' "$dir" >> "$xml_out"
>>> -    ret=
>>> -    for f in "$dir"/*; do
>>> -        [ -f "$f" ] || continue
>>> -        [ -x "$f" ] || continue
>>> -        "$f" 2>&1 | tee /tmp/out
>>> -        ret=$?
>>> -        if [ "$ret" -ne 0 ]; then
>>> -            echo "FAILED: $ret"
>>> -            failed+=" $dir"
>>> -            printf '   <failure type="failure" message="binary %s exited with code %d">\n' "$f" "$ret" >> "$xml_out"
>>> -            # TODO: could use xml escaping... but current tests seems to
>>> -            # produce sane output
>>> -            cat /tmp/out >> "$xml_out"
>>> -            printf '   </failure>\n' >> "$xml_out"
>>> -        else
>>> -            echo "PASSED"
>>> -        fi
>>> -    done
>>> -    if [ -z "$ret" ]; then
>>> -        printf '   <skipped type="skipped" message="no executable test found in %s"/>\n' "$dir" >> "$xml_out"
>>> +for f in "$1"/*; do
>>> +    if [ -x "$f" ]; then
>>> +        echo "SKIP: $f not executable"
>>> +        continue
>> This should be ! -x
>>
>> I had that hunk in the wrong patch when posting this series.
> With that fixed:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.

>
> But I think there's an issue with the script...
>
>>> +    "$f" 2>&1 | tee /tmp/out
>>> +    ret=$?
>>> +    if [ "$ret" -ne 0 ]; then
> Is this checking the correct exit value? It seems that without `set -o
> pipefail`, we only have the exit value of `tee` which should never fail.
> But I think we should grab the value of ${PIPESTATUS[0]} to actually
> read the exit value of $f.

Hmm yes, I think this needs adjusting.

It turns out there are multiple problems with junit, including the fact
that putting failures in here doesn't cause the outer job to fail. 

The internet suggest having a 'script: grep "<failure" junit.xml' step
to work around this.

I think that wants to be a separate series.  The question is whether to
do this series first or second.  I expect I'm going to need to backport
all of this work to eventually get XTF back onto the older trees.

~Andrew

