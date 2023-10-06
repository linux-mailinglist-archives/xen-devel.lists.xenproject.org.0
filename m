Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F1B7BB502
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 12:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613491.954032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohxw-0001yq-MN; Fri, 06 Oct 2023 10:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613491.954032; Fri, 06 Oct 2023 10:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohxw-0001vq-IY; Fri, 06 Oct 2023 10:21:52 +0000
Received: by outflank-mailman (input) for mailman id 613491;
 Fri, 06 Oct 2023 10:21:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vVKM=FU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qohxu-0001vd-Po
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 10:21:50 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28539f35-6432-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 12:21:48 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40537481094so17405965e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Oct 2023 03:21:48 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l17-20020a1ced11000000b0040588d85b3asm5651278wmh.15.2023.10.06.03.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 03:21:47 -0700 (PDT)
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
X-Inumbo-ID: 28539f35-6432-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696587708; x=1697192508; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TndpNmy2CTAORG2i4gPyUy2U0CaD/eAnbSkI6S+vIBE=;
        b=scloZyqxUlVb41HTjsoFPPNJda8xLw6+FpY0a4+8EezzE4O8D1Lv2XPj915dTT+3gp
         bkYWi1t0TNFD/lBhc7tcCIXvvghHS51f3QmzC+zu8A/5rOg1SbNlVzl/1fExCciuQruI
         ClBFNKm6ek/+LFM6b1l3pS6R1beVuiYgA1ri0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696587708; x=1697192508;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TndpNmy2CTAORG2i4gPyUy2U0CaD/eAnbSkI6S+vIBE=;
        b=GH5+1AZghjRo4uVnr4n49JiLY60p83JBAG4V6Jwm8rO9/JcCKHzy1+gOZfVy7hsPx/
         iJFwsjHIn3otTmqODq6SZXy93R8L+xxst0ZQUfgtglukKEEnoElS1w/GvIkRu8siX69H
         eoh9co/b5b/GWFbJNWcKdfeLRw6nI22qx9HNXcvfVClBeTDTqQKnRNrn3Gh8PQRsUpjF
         Az37QzVqS4MuA8axW77G/RLa+64J6a45yX9WLZnJ0bQ6a8TTtdf1T5cxVpOXpBq1bqXN
         w/t9E0XAsMe5bFxrottjkqCFcOivZ6KjOSNF7LaXb+yrk1O4nua1nR8lZtSrkaIFbwxK
         5YXw==
X-Gm-Message-State: AOJu0YxtmSkdSq/jdGW04j3WQtKhkPY6q7boujxla3O9sKwZ7y/k7fvL
	JO2CEhpZ/g3Ol91+O4h4QlLXbA==
X-Google-Smtp-Source: AGHT+IEGjQQlujqVaHlnwv03MlQ+PGRubY5/+6DAa+UwZ01yZsDl5ffYn1FibliyPNV6oI4gEYFObQ==
X-Received: by 2002:a1c:7c0b:0:b0:402:8896:bb7b with SMTP id x11-20020a1c7c0b000000b004028896bb7bmr6838016wmc.6.1696587707810;
        Fri, 06 Oct 2023 03:21:47 -0700 (PDT)
Message-ID: <1762e2e9-07a5-4c25-9e72-04e9a93c6ebe@citrix.com>
Date: Fri, 6 Oct 2023 11:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [CRITICAL for 4.18] Re: [PATCH v5 00/10] runstate/time area
 registration by (guest) physical address
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, henry.wang@arm.com,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <ff8994eb-968d-4bbb-a960-e5ca78ef658e@citrix.com>
 <ZR--ozuTl9-CgBqg@MacBookPdeRoger>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZR--ozuTl9-CgBqg@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2023 9:00 am, Roger Pau Monné wrote:
> On Thu, Oct 05, 2023 at 07:58:50PM +0100, Andrew Cooper wrote:
>> Henry: Blocker for 4.18.   The absolutely bare minimum necessary to
>> avoid reversion is some kind of positive enumeration that the two new
>> hypercalls are available.
>>
>> Otherwise I will be #if 0'ing out the new hypercalls before this ABI
>> mistake gets set in stone.
>>
>>
>> If this were x86-only it would need to be a CPUID flag, but it will need
>> to be something arch-agnostic in this case.  The series should not have
>> come without a proper per-domain control and toolstack integration, but
>> everything else can be retrofitted in an emergency.
>>
>> And on a related note, where is the documentation describing this new
>> feature?  Some tests perhaps, or any single implementation of the guest
>> side interface?
> Not that I know, I was expecting Jan to post that once he gets back
> from PTO.
>
> I already noted somewhere that I wasn't able to test myself because I
> couldn't find any Linux side patches to test the feature with, and I
> didn't have time to write ones myself (was expecting Jan to have the
> Linux side done already for testing reasons).

Big new feature, getting merged after RC1 and feature freeze, with no
enumeration and no disable.

How did this not set off massive alarm bells?


I was about to say that this is a disaster waiting to happen, except
OSSTest has beaten me to it.

This "new feature" managed to regress existing behaviour of something it
was trying not to change, and that's in an area that even I wouldn't
expect to put in a disable.


I'm very sorely tempted to insist that this gets disabled by default in
4.18.  It's clear that it isn't in a fit state, and the absence of any
testing whatsoever means it is likely to explode on the first guest
kernel which tries to use the new interface.

And to be clear, disabled-by-default is a question for Henry and Henry
alone, as the person ultimately responsible for 4.18.

~Andrew

