Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6629877E96
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 12:05:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691399.1077344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdSV-0006GX-GM; Mon, 11 Mar 2024 11:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691399.1077344; Mon, 11 Mar 2024 11:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdSV-0006E7-Dl; Mon, 11 Mar 2024 11:04:43 +0000
Received: by outflank-mailman (input) for mailman id 691399;
 Mon, 11 Mar 2024 11:04:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0J3=KR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rjdST-0006E1-TB
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 11:04:41 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28907615-df97-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 12:04:41 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5673b5a356eso4379711a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 04:04:41 -0700 (PDT)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a10-20020a17090640ca00b00a4550e8ae70sm2770802ejk.63.2024.03.11.04.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 04:04:40 -0700 (PDT)
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
X-Inumbo-ID: 28907615-df97-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710155080; x=1710759880; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B99vhk+y0uiy3tqw4ypWKDbYu2zT+5lYQQrd1Y678FA=;
        b=lGmImCS4ERud2ii6ZCvuJufakYDT0uDzRkQFHTPOMMFALl/fPnHucE0k1BfYiyx6hU
         jEobgFYSCgFSqfEiCmDebgyqgF09CeU7ICwNrgt6/k+mKVOUnmh+8bUDH+7Rhq5PrQ1K
         PyaBa+nbT+MARgNIK0HEIm/0p9wvRoymbi2lU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710155080; x=1710759880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B99vhk+y0uiy3tqw4ypWKDbYu2zT+5lYQQrd1Y678FA=;
        b=X5Y25cpIOlEspEwZXC2NBW1Iu5Ds9UiMgumoY/RS2iIp+qHPWwoQvgzG4K2rN00RzW
         Axk3y/dtGz0mK5FoQnzbMZIK8B+8+chkU9dWp5cKvBa3TVdk9LPX9fdUQWRPO8Wg9apZ
         YlWWyAk8WFB8xOjtqxSjhHtknF7qxrrHaG44mzjjfwb0GZAaMFJ8Wwtz2qu+IvmDFUH8
         YLjjsug9F4vSnlQkTO810EP7souzoFUhZTGpab8EEd9Dn5uJhP8fBSmIJjj1I9zU1EED
         joFUtq2PeFmHfkYGK3aA3hG/xL/Isml8tGr/GbhzPOSYjAYQji2Db6ivi2kMn9RoxLE1
         HHEA==
X-Forwarded-Encrypted: i=1; AJvYcCXQVbKqTvuuopNqzxVKkgJRpZfQbtI3x5nX9UAI/eR3K3bktyyswChxhrkuVXbmyoWF7BqZF1uU87b0ja1prtFKUfEppcG9vDJpdZTOgaw=
X-Gm-Message-State: AOJu0YyB+WxQRtR5EGJoW7A90r6F6tYJUfZZtvvJoD/ny+N2jks09fLc
	3Y0gbTeoaN7HY8IUR5/tsvUyz+dWojCaibCPDxZeePPWKRM+Oqbhq2M8BVcMGBE=
X-Google-Smtp-Source: AGHT+IH+75W5SD1QjQhmgwUzP9jKVnw+9RIMC8QpF76HlqeJvpOFa5Acso3DIohj66fKLiLxCxkdFQ==
X-Received: by 2002:a17:907:970a:b0:a46:22fc:74d3 with SMTP id jg10-20020a170907970a00b00a4622fc74d3mr2691932ejc.72.1710155080457;
        Mon, 11 Mar 2024 04:04:40 -0700 (PDT)
Message-ID: <b9d1b7a4-9a17-442e-84f8-e2a498f5ec44@citrix.com>
Date: Mon, 11 Mar 2024 11:04:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | e90089db
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65eed65856f57_2c8a520124653@gitlab-sidekiq-catchall-v2-df9f7d5b4-ts6r7.mail>
 <55f7b5f5-0f0d-4c80-aeeb-a2e8f22f1197@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <55f7b5f5-0f0d-4c80-aeeb-a2e8f22f1197@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/03/2024 10:15 am, Jan Beulich wrote:
> On 11.03.2024 11:00, GitLab wrote:
>>
>> Pipeline #1208433952 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
>>
>> Commit: e90089db ( https://gitlab.com/xen-project/hardware/xen/-/commit/e90089db3fab06dc8947fcd64f1ed54569e708a6 )
>> Commit Message: arm/smmu: address some violations of MISRA C Ru...
>> Commit Author: Nicola Vetrini
>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>>
>>
>> Pipeline #1208433952 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1208433952 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>> had 2 failed jobs.
>>
>> Job #6362049499 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6362049499/raw )
>>
>> Stage: build
>> Name: ubuntu-trusty-gcc
> I'm afraid I can't make sense of this supposed failure.

fatal: unable to access
'https://gitlab.com/xen-project/hardware/xen.git/': Couldn't connect to
server

Networking failure.

>
>> Job #6362049553 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6362049553/raw )
>>
>> Stage: test
>> Name: build-each-commit-gcc
> This one simply timed out once again, for it taking too long to build a
> dozen commits in non-incremental fashion.

Irritatingly the timeout is per-repo not a global setting.  I've bumped
this back up to 3h to match the other main repos.

~Andrew

