Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E25E98A1ED2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 20:45:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704155.1100355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruzPs-0005Dl-9y; Thu, 11 Apr 2024 18:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704155.1100355; Thu, 11 Apr 2024 18:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruzPs-0005Aw-6G; Thu, 11 Apr 2024 18:44:56 +0000
Received: by outflank-mailman (input) for mailman id 704155;
 Thu, 11 Apr 2024 18:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ruzPq-0005Aq-Vr
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 18:44:54 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9570c50e-f833-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 20:44:53 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-417d0194705so1082695e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 11:44:53 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b00417e134dd2dsm2074654wms.37.2024.04.11.11.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 11:44:51 -0700 (PDT)
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
X-Inumbo-ID: 9570c50e-f833-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712861092; x=1713465892; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FadbIeaKr5CBjX43cBX0jigbXTRjsc3nGNIOIB+LeIo=;
        b=ikgM0LBWCtlcLSpPJJ/BCnAG/xW/Z7rcOsIvtGYvwBr/4r3SRNLiR93k/oj1oeyvLh
         Xm4/7VbqyZvSr2rTQYPDhCbKRBZZWGkUQpNTrkC5unVikbQzNjGYNIJfVTtrDD8QkLOc
         06ncPP1Kq5APMV8e6Pmb/0+Tqs/7wsojrhecQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712861092; x=1713465892;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FadbIeaKr5CBjX43cBX0jigbXTRjsc3nGNIOIB+LeIo=;
        b=fB33iO4x4WZ4h8VhtNppcr2o+m02JAP5qdI1MJbPeWdoh1W2xHUSg6WoRRea9T1+lz
         2dk+fd7+hJzd3mlscSjyHfrvRkEiFV9gnGpZHUu+6V/N5ZZZsX7sZQ5bCtiCJ84zvdWk
         i6MJBg13BNYcB49liV1wUvjBPX6+GDUFjzcTIhWK4pCqrIE7j3MuBaltwNqiwyzsXBa+
         chElU8XSvLxUvGq/GjD3kT6bCNkWSfjGtTXNkwiQi93sIdUJimDUVyJLMSl9tva4ONIE
         6n/hyg8c9wSXRL2vuxGkrhn3+NherKgVjoJQA0TJR3mdh360QAxFIvWKZYSaNB9keNpS
         eS9A==
X-Gm-Message-State: AOJu0YzTTEQtJc8gJKEtHGnd1uBuAMAtDjbT6uHbg6DiovOoHZvodmRW
	EFWBWmeVJRfV6aaymfC7jqxPVbLMuyO7bBXDd4yzvFDRwqhMj19/+wXuIDIgs2U=
X-Google-Smtp-Source: AGHT+IGJzpAyWa3NOIWX7KzZX2EV4KLBP+3w7hImEG48H1g1ijhxeeGtGfuvAMQUmki+PEFacVZbDg==
X-Received: by 2002:a05:600c:3482:b0:417:bbb3:ce4a with SMTP id a2-20020a05600c348200b00417bbb3ce4amr422018wmq.37.1712861092466;
        Thu, 11 Apr 2024 11:44:52 -0700 (PDT)
Message-ID: <1552c28a-9c31-4771-94d1-20a51b2c641f@citrix.com>
Date: Thu, 11 Apr 2024 19:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] gzip: colocate gunzip code files
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-2-dpsmith@apertussolutions.com>
 <AA1FBA57-A643-4758-B99A-B59181B6329A@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <AA1FBA57-A643-4758-B99A-B59181B6329A@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2024 5:00 pm, Luca Fancellu wrote:
>> On 11 Apr 2024, at 16:25, Daniel P. Smith <dpsmith@apertussolutions.com> wrote:
>>
>> This patch moves the gunzip code files to common/gzip. Makefiles are adjusted
>> accordingly.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> xen/common/Makefile             | 2 +-
>> xen/common/gzip/Makefile        | 1 +
>> xen/common/{ => gzip}/gunzip.c  | 0
>> xen/common/{ => gzip}/inflate.c | 0
>> 4 files changed, 2 insertions(+), 1 deletion(-)
>> create mode 100644 xen/common/gzip/Makefile
>> rename xen/common/{ => gzip}/gunzip.c (100%)
>> rename xen/common/{ => gzip}/inflate.c (100%)
> For inflate.c you will need to update also docs/misra/exclude-list.json

Something like this?

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 36bad9e54f7d..095636415897 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -118,7 +118,7 @@
             "comment": "Imported from Linux, ignore for now"
         },
         {
-            "rel_path": "common/inflate.c",
+            "rel_path": "common/gzip/inflate.c",
             "comment": "Imported from Linux, ignore for now"
         },
         {

I can fold on commit.

~Andrew

