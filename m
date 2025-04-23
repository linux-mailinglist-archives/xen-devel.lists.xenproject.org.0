Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 338B1A99B9C
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 00:44:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965643.1356113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ioN-0007My-RV; Wed, 23 Apr 2025 22:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965643.1356113; Wed, 23 Apr 2025 22:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ioN-0007KA-O2; Wed, 23 Apr 2025 22:43:23 +0000
Received: by outflank-mailman (input) for mailman id 965643;
 Wed, 23 Apr 2025 22:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7ioM-0007K4-NK
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 22:43:22 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a64df6c-2094-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 00:43:19 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso2326765e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 15:43:19 -0700 (PDT)
Received: from [192.168.1.23] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092b0a4b5sm40350275e9.0.2025.04.23.15.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 15:43:17 -0700 (PDT)
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
X-Inumbo-ID: 5a64df6c-2094-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745448199; x=1746052999; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lF1GosE/h6pbu6VJCuXLrvMwE0dEA9d3yyBrJB/Ryp0=;
        b=ViDY+R1/I8sK617clCzaBb+qV1W3GBkaBatb2g5uz/Er18TO4L2gc0nIi+2P4K/PJG
         Ze2CmMsm3lzLCk2xTSei7huWXQod0UANSrhvLvJWndsU7FLXtgHbZLCXrxPNan/flgNg
         M+By3jnFGaFio+5qm2icIwFbQ5Yz5iaXaYp1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745448199; x=1746052999;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lF1GosE/h6pbu6VJCuXLrvMwE0dEA9d3yyBrJB/Ryp0=;
        b=QLYnGBTMjcLkGt1pLx4zHxsCVTwqJN9qduG2tj9B3vGY1ZmF6rwJSghtVonZjmnRrH
         l9ckhhdCxGfQbPZ3DREJ/k9A20SM5rWQORrtLxgfTLTWC54W4yyckZwTEa63r9L1FxHj
         2NoB7QlsbLJzqB0IulqxhpM2YfPEnMG72ngOs/utgBYshQtD5aVKWjeV32MzhTSx3Svv
         g519v8jdEQcZYA15mO5L+JT07f3INnQDxat/sypR7d8/4J9O7h22KGiav2+Jkk99NdpW
         HtpbSA/hAui2dFYJ8x3n3J1xFHWr/VFrBMx/bCuU9k9h/iiypxJULGrqGExEpk7m0r80
         QPPg==
X-Gm-Message-State: AOJu0YyqSk8llu3YPsVNhmsVpr47zLL6VLrqRgNAuG7oPfe84+1ux8PW
	xFDDW+TYCIL3nlsDdc8bOV1QPICTGFM6Rfk2TatfWjgVIR2UvCVEF34tEbV/ook=
X-Gm-Gg: ASbGnctjFCO5faDhtT8RCuRDVXSVsrU5SRT7iarvtt4GNrVCQi7/Mr97lPp+F3RiyNq
	KAZrD98QxjxBExFMX2K2ARBpuGWCCsv231No7haOlbf8xirfF45bZSfSULT9i2wuWbAUye0L2J2
	Q+Ujyqhq19f2fVUy+jeUUZdZG5OxNIo83GpjsBR3MwEDw4fyGtL0+OAaDnJVUuFGLPH2d/sJEXV
	FDjE+phiDsyzOXu24+VOtS9nONRgAVfndR5Vfg3YOthxYXUmGQtMstkbx46wjrTBRiQsy24rKTo
	1G3cZCVmft5PY4OTbE5AJ6t4T3xzeoIYCSnlxIyuMeRzDCq22Ma3NShpix9grWsCAD+kNeVifR6
	dL7IW
X-Google-Smtp-Source: AGHT+IEX0+tz08KYOOtrsF4uh2qRfc3YehT0TEHSwI9PuldMYUqPTfY5eDhr1F9vkB55QMr9YUeurg==
X-Received: by 2002:a05:600c:4e0c:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-4409bd86819mr2051225e9.25.1745448198716;
        Wed, 23 Apr 2025 15:43:18 -0700 (PDT)
Message-ID: <6ae5f0a2-8055-45e1-933c-199d6c6d8626@citrix.com>
Date: Wed, 23 Apr 2025 23:43:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] x86: Trenchboot Secure Launch DRTM (Xen)
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, trenchboot-devel@googlegroups.com
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <744934f4-f56f-4dc7-bccb-c32f2829d1da@citrix.com>
 <010709d8-7784-41bf-bcb6-bf04803a75fc@citrix.com> <aAk1ZBw8GtoVYoL8@MjU3Nj>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aAk1ZBw8GtoVYoL8@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/04/2025 7:45 pm, Sergii Dmytruk wrote:
> On Wed, Apr 23, 2025 at 02:38:37PM +0100, Andrew Cooper wrote:
>> On 22/04/2025 6:14 pm, Andrew Cooper wrote:
>>> I've stripped out the sha2 patch and fixed up to use the existing sha2,
>>> then kicked off some CI testing:
>>>
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1780285393
>>> https://cirrus-ci.com/build/5452335868018688
>>>
>>> When the dust has settled, I'll talk you through the failures.
>> And here we go.  Interestingly, the FreeBSD testing was entirely happy,
>> and that is the rare way around.
>>
>> For Gitlab, there are several areas.
>>
>> First, for MISRA.  In the job logs, you want the "Browse current
>> reports:" link which will give you full details, but it's all pretty
>> simple stuff.
> Thanks, but that link gives me a list of 5096 failures all over the code
> base.  Is there any way to see a diff against master?

No sadly not.  What you see is a mix of the blocking issues, and the "we
want to see these so we can work on them".

Immediately under the link is the one-line tl;dr.  For ARM, it's just a
single:

Failure: 1 regressions found for clean guidelines
  service MC3A2.R7.2: (required) A `u' or `U' suffix shall be applied to
all integer constants that are represented in an unsigned type:
   violation: 1

Clicking through into the R7.2 analysis shows
https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen-staging/ECLAIR_normal/andrew/tb-v1.1/ARM64/9791028027/PROJECT.ecd;/by_service/MC3A2.R7.2.html

This violation is shared with x86 because it's a header pulled into a
common file.

For x86, the list is rather longer.  You've got:

6x D1.1
2x D4.14
1x R5.3
116x R7.2
1x R7.3
12x R8.3
7x R8.4
1x R11.9
87x R20.7

These are the blocking directives/rules.  Others which you see in the
overall report are non-blocking.

>
>> kbl-suspend-x86-64-gcc-debug is a real S3 test on KabyLake hardware,
>> which appears to have gone to sleep and never woken up.  (More likely,
>> crashed on wakeup before we got the console up).  The AlderLake
>> equivalent test seems to be happy, as well as the AMD ones.
> Hm, not sure what that could be, but will try to reproduce/guess.

KBL is unreliable in one specific way, but not with these symptoms.

I reran the suspend test, and it failed in the same way.  I think it's a
deterministic bug.

I can probably dig out my emergency serial debugging patches for S3 if
you want?

>> Other common failures seem to be:
>>
>>     # take image offset into account
>>     arch/x86/efi/fixmlehdr xen.efi 0x200000
>>     Failed to find MLE header in xen.efi
>>     arch/x86/Makefile:220: recipe for target 'xen.efi' failed
>>     make[3]: *** [xen.efi] Error 1
>>
>> ~Andrew
> That seems to be the only reason behind the rest of build failures.
> I was able to reproduce the failure in Fedora 37 docker.  Searching for
> the header in 8KiB instead of 4KiB fixes it.  Looks like large default
> alignment of some toolchains pushes `head.S` to 4 KiB offset.

FYI, you can access all the Xen containers with:

CONTAINER=foo ./automation/scripts/containerize

in the xen.git tree.

Alignment that large is unexpected, and I suspect we want to fix it.  Is
it pre-existing, or something introduced by your series?

~Andrew

