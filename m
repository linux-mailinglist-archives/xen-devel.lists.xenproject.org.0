Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF26F843D57
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 11:55:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673910.1048481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8Fg-00070e-NF; Wed, 31 Jan 2024 10:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673910.1048481; Wed, 31 Jan 2024 10:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8Fg-0006y9-KQ; Wed, 31 Jan 2024 10:55:32 +0000
Received: by outflank-mailman (input) for mailman id 673910;
 Wed, 31 Jan 2024 10:55:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6GWq=JJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rV8Ff-0006y3-4L
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 10:55:31 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f2db21d-c027-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 11:55:29 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5101cd91017so5602563e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 02:55:29 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b0040e89ade84bsm1267435wms.4.2024.01.31.02.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 02:55:28 -0800 (PST)
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
X-Inumbo-ID: 3f2db21d-c027-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706698529; x=1707303329; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D+2Nmg0tjrdfbzuhgXQpNM5nYFF8Dz4aRdAKB1FuMxs=;
        b=ZZLq//rSBebahvYB6aBygO4EEmeoBEDI+7rBHEe65t+wnnzPBGBxq62AV18A+uR/6d
         XcCgWOPgVwgbaoe3dneqOssII/aD9A0vrobHk4I/TnZ4faDZm8qzIRFi6To+b5qkW6T1
         2qotrLu6eiOFNt0Sn9JQ8mnIKZ80c0Oeazc78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706698529; x=1707303329;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+2Nmg0tjrdfbzuhgXQpNM5nYFF8Dz4aRdAKB1FuMxs=;
        b=Geg1i3IKpbHSQtYn65kTY97Ljo//FgpcWPxxntEX9g3tt6PUF0/B+zQWTtLrxduvo6
         Wrwuph0Wv5KOpSdWULnNIR+BwyS7fjcglgJWZgxhz6/wmeMYqQjqtFrQjHyxMV6iAhQM
         nypuyPb2bhIGf2EqfwD7i82STCtAaNYqvQkYXW513bemEyAs434AvPmKBEaVt8ze5EfP
         uHCl3rTuZQn+Yh2Ane6ih732e88j8oOkCYvxfp0O6BjYzvU724GwNtCPpu7a/2+iWhzq
         RiZw40w0VDccCavVP4EXB5UEpzuC5axFO9ldhuUKvE1FuVNtaFkIt5MjopAtxnv6uHzq
         6jAA==
X-Gm-Message-State: AOJu0YzsXX/5c0Pv6e0L9but/KaQ1EMtAbJHkiTZbsU8Z/g78qwmuZ1V
	aJXZnn8uzaGbdPCNP2KEo6w5/GjrS4RhZZXv+1KJHUmFF7rP0xR9IF+VQqqgOUI=
X-Google-Smtp-Source: AGHT+IGrhiebKyi1diFxjIRuiKa0enx9+McOlZMy8uXONr3Q+o0ycFresYLE+z6p3vZeQYro47mPvw==
X-Received: by 2002:a05:6512:3b0d:b0:511:1b24:9c29 with SMTP id f13-20020a0565123b0d00b005111b249c29mr1130478lfv.5.1706698528665;
        Wed, 31 Jan 2024 02:55:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU4p3M/ovQS/auBdi9q5W+Yd0m1G9+pv4ZS+8X2iDxQrnd0v+HQgYb7fDt8k8owDlzYHR8y/yt77gbJEr6Z6YKVjq6IatBms2xglVZo5e1Y+yTqUsmIdmH+ZRxXgzG8B7ZqACsBzXHmhIUdSqwBKxQo0M4syTB6WL3hFwpZx0VvJEifYesOXpwkxZW4K+46l46igfjG5UmUNPZk
Message-ID: <b88df473-9a3e-4c83-8629-3b65c6a6190b@citrix.com>
Date: Wed, 31 Jan 2024 10:55:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] tools/ocaml: support OCaml 5.x, drop support for
 <=4.05
Content-Language: en-GB
To: Christian Lindig <christian.lindig@cloud.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <cover.1706697216.git.edwin.torok@cloud.com>
 <4E9A23AB-5745-4A71-9013-156B6648025A@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4E9A23AB-5745-4A71-9013-156B6648025A@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/01/2024 10:44 am, Christian Lindig wrote:
>> On 31 Jan 2024, at 10:42, Edwin Török <edwin.torok@cloud.com> wrote:
>>
>> Fix building oxenstored with OCaml 5.x.
>> OCaml 5.x has removed some functions that have been deprecated for many years,
>> in order to support OCaml 5.x we need to drop support for OCaml 4.02.
>>
>> Tested in gitlab CI (together with my other series):
>> https://gitlab.com/xen-project/people/edwintorok/xen/-/pipelines/1158302827
>>
>> Edwin Török (2):
>>  oxenstored: fix build on OCaml 5.x
>>  tools/ocaml: bump minimum version to OCaml 4.05
>>
>> tools/configure               | 2 +-
>> tools/configure.ac            | 2 +-
>> tools/ocaml/xenstored/disk.ml | 2 +-
>> 3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> -- 
>> 2.43.0
>>
> Acked-by: Christian Lindig <christian.lindig@cloud.com>

It occurs to me that this is the kind of thing which should get a
CHANGELOG.md entry these days.  Something like:

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1f55c9c72d10..fd7c8f5c6b82 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,7 @@ The format is based on [Keep a
Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
  - Changed flexible array definitions in public I/O interface headers
to not
    use "1" as the number of array elements.
+ - The minimum supported Ocaml toolchain version is now 4.05
  - On x86:
    - HVM PIRQs are disabled by default.
    - Reduce IOMMU setup time for hardware domain.


ought to do.

Have we checked to see whether this drops Ocaml from any of the build
containers ?

~Andrew

