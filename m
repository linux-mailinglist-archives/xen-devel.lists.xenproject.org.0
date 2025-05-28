Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA4FAC5E1B
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 02:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998852.1379555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4Uo-0003PF-He; Wed, 28 May 2025 00:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998852.1379555; Wed, 28 May 2025 00:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4Uo-0003NZ-EJ; Wed, 28 May 2025 00:18:14 +0000
Received: by outflank-mailman (input) for mailman id 998852;
 Wed, 28 May 2025 00:18:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isSc=YM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uK4Un-0003NR-G6
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 00:18:13 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cc33f19-3b59-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 02:18:11 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-601dfef6a8dso6741695a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 17:18:11 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6051795c408sm287640a12.10.2025.05.27.17.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 17:18:08 -0700 (PDT)
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
X-Inumbo-ID: 3cc33f19-3b59-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748391490; x=1748996290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CVenNw4WWospg7BIoIUfh/e5A8VtTGTiLRaONiqwZEA=;
        b=b9zqwgNGIwBzSrJ6hB8spJK1mURaXgRZxwa4lF0DUUAWQqSrh/D0ropas12NSfkiVR
         Q2jc42UKmOb3SIiQmydbH1EdJEQ4rPTofdoZd77de3epd4Lp8YLdoOW7Yqh+p6ed5q9e
         xb9SMvVRCzn/JJ0JryoGgDhH6Xb2vNfC86oOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748391490; x=1748996290;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVenNw4WWospg7BIoIUfh/e5A8VtTGTiLRaONiqwZEA=;
        b=sqD23mlodmRrpIuwAxN0vukln2hO3P5FJ8xLzLQ6D9+bNEweL58SdBHmwdJ+TqgjjL
         lKvV0k71KrYNro9n901b207oKqXCxBSWpqumoCscb+SNMHXb5V6Oa9SQENWTtW+GM6P1
         otxeNnGmQwGqt+E1fIIVq+YgGJJEo2YsgShAUWX9zPriqGtwqh4Wz7V27FMmj9nCxstV
         yOYLWG3OAdhmtNqjl1/fQXc5ToLejLf7g5j6dtQqhr77J8LymqUJcJxya6o6Esqk0DPe
         BG3eMx6xzSwRCIudEXCIFZrtKDtrMI9ylBIbf6bV+0FR+oS98GSDgEFV0wyAmOJjglTV
         jo4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvhb2nYlh5QuXFA4Y4uIraYa3MCIqGSaNskUfgzUP8xLeyT5/+ZlpSFd3vrJ87lLVxaQhfkZgtUgo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyC+rtzfaiavOnYqeZ9y9CFcaKrjg4PqQZMkY4gU+2mUG0QlxJ5
	YJ/C2cy59eqCLFf2xbk7d5Xxkk6dEgz6GjKl3oyGVeYy45a/Gwf+WLCNb+lp3ji0CRWBNHxwMb+
	Y2h4O
X-Gm-Gg: ASbGncs8G1I8+bQu5hJn/t00hUljZ8wZchfN1jDr8HtuHLc65otdlIJb5djlDT2MBnA
	T9DuJZDlscULL/2MnyTK1kEol12CIZjuLHwGhDL/OqFBz5LY/RHz+uwLD4zbWgWs/bpLqvOp+Yw
	gxKtraRzT+VDBs8G1JjnnRwMPtesf9lmjnjF0h6qNdx4WVHHoVX5BlY5kYFo4H1dptoL6YT/YHk
	InbFBpDttr6v57vP3UObTH3aU4q+fJQttgnfFnDfA/BTokMmVjw9vcGoXgkyIJS7bKWUjkrDX44
	X1A0ZkcuVPgRhmt0NBkwXg21PXWcYIzUYEe6FWHS/b+/wbHohN+jswxUXUpHXB6kV94LmZlkvi+
	iV5uLG0k+M1cOmrBV
X-Google-Smtp-Source: AGHT+IHk1JuyknHt1Fc7xo7cB/k8TcJxZ7M3nRcWO4V4b3upJ5hC//I0FMNJMUwrjyUb/IoKDZueDg==
X-Received: by 2002:a05:6402:51d2:b0:604:e6fb:e2e1 with SMTP id 4fb4d7f45d1cf-604e6fbe41cmr5416958a12.33.1748391490118;
        Tue, 27 May 2025 17:18:10 -0700 (PDT)
Message-ID: <73568a36-8462-4268-93a2-1abf6d168b1a@citrix.com>
Date: Wed, 28 May 2025 01:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] CI: Drop custom handling of tools/tests
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250520205239.203253-1-andrew.cooper3@citrix.com>
 <20250520205239.203253-4-andrew.cooper3@citrix.com>
 <1e690ecb-5060-4dfe-a515-acbbf214bc99@citrix.com> <aDSjaewFMxUj6Tel@l14>
 <23aeac17-6fd0-4515-8c84-1a867c57a68d@citrix.com>
 <alpine.DEB.2.22.394.2505271715450.135336@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2505271715450.135336@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/05/2025 1:16 am, Stefano Stabellini wrote:
> On Mon, 26 May 2025, Andrew Cooper wrote:
>> On 26/05/2025 6:22 pm, Anthony PERARD wrote:
>>> On Mon, May 26, 2025 at 05:45:29PM +0100, Andrew Cooper wrote:
>>>> On 20/05/2025 9:52 pm, Andrew Cooper wrote:
>>>>> diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
>>>>> index 770e97c3e943..8d7aa8fa5140 100755
>>>>> --- a/automation/scripts/run-tools-tests
>>>>> +++ b/automation/scripts/run-tools-tests
>>>>> @@ -12,30 +12,25 @@ printf '<?xml version="1.0" encoding="UTF-8"?>\n' > "$xml_out"
>>>>>  printf '<testsuites name="tools.tests">\n' >> "$xml_out"
>>>>>  printf ' <testsuite name="tools.tests">\n' >> "$xml_out"
>>>>>  failed=
>>>>> -for dir in "$1"/*; do
>>>>> -    [ -d "$dir" ] || continue
>>>>> -    echo "Running test in $dir"
>>>>> -    printf '  <testcase name="%s">\n' "$dir" >> "$xml_out"
>>>>> -    ret=
>>>>> -    for f in "$dir"/*; do
>>>>> -        [ -f "$f" ] || continue
>>>>> -        [ -x "$f" ] || continue
>>>>> -        "$f" 2>&1 | tee /tmp/out
>>>>> -        ret=$?
>>>>> -        if [ "$ret" -ne 0 ]; then
>>>>> -            echo "FAILED: $ret"
>>>>> -            failed+=" $dir"
>>>>> -            printf '   <failure type="failure" message="binary %s exited with code %d">\n' "$f" "$ret" >> "$xml_out"
>>>>> -            # TODO: could use xml escaping... but current tests seems to
>>>>> -            # produce sane output
>>>>> -            cat /tmp/out >> "$xml_out"
>>>>> -            printf '   </failure>\n' >> "$xml_out"
>>>>> -        else
>>>>> -            echo "PASSED"
>>>>> -        fi
>>>>> -    done
>>>>> -    if [ -z "$ret" ]; then
>>>>> -        printf '   <skipped type="skipped" message="no executable test found in %s"/>\n' "$dir" >> "$xml_out"
>>>>> +for f in "$1"/*; do
>>>>> +    if [ -x "$f" ]; then
>>>>> +        echo "SKIP: $f not executable"
>>>>> +        continue
>>>> This should be ! -x
>>>>
>>>> I had that hunk in the wrong patch when posting this series.
>>> With that fixed:
>>> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks.

>
>
>> Thanks.
>>
>>> But I think there's an issue with the script...
>>>
>>>>> +    "$f" 2>&1 | tee /tmp/out
>>>>> +    ret=$?
>>>>> +    if [ "$ret" -ne 0 ]; then
>>> Is this checking the correct exit value? It seems that without `set -o
>>> pipefail`, we only have the exit value of `tee` which should never fail.
>>> But I think we should grab the value of ${PIPESTATUS[0]} to actually
>>> read the exit value of $f.
>> Hmm yes, I think this needs adjusting.
>>
>> It turns out there are multiple problems with junit, including the fact
>> that putting failures in here doesn't cause the outer job to fail. 
>>
>> The internet suggest having a 'script: grep "<failure" junit.xml' step
>> to work around this.
>>
>> I think that wants to be a separate series.  The question is whether to
>> do this series first or second.  I expect I'm going to need to backport
>> all of this work to eventually get XTF back onto the older trees.
>  
> I'll leave the choice to you

In which case I'll get this committed now, because it's one useful step
forward and reduces my queue a bit.

~Andrew

