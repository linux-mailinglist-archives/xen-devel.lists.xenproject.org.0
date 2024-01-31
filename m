Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3D7844839
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 20:44:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674164.1048941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVGUm-0005Gh-4B; Wed, 31 Jan 2024 19:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674164.1048941; Wed, 31 Jan 2024 19:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVGUm-0005DU-03; Wed, 31 Jan 2024 19:43:40 +0000
Received: by outflank-mailman (input) for mailman id 674164;
 Wed, 31 Jan 2024 19:43:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6GWq=JJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rVGUk-0005DN-R9
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 19:43:38 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06d7e220-c071-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 20:43:37 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33ae3cc8a6aso91983f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 11:43:37 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 en8-20020a056000420800b0033940016d6esm10205361wrb.93.2024.01.31.11.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 11:43:36 -0800 (PST)
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
X-Inumbo-ID: 06d7e220-c071-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706730217; x=1707335017; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=52O2QyJWuFfL2IsIXIU/w45voWI8oNAVU8X56yO2Hv8=;
        b=KgaXlDzrEtny7k0uOCsTosu13jeQmvIHP9jee6n/2Nj0IqaWz1g1lamc4ndOCS9XCJ
         Fsts6/dRP/rIAEVXM2CkVPH85yT4pdTxaEb6OlWhADTbwt2qREGuFa0S30AIf/Zv0QB+
         X+R8DiW7C3mmrtjdnxsye6GheE1dLfAJfauOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706730217; x=1707335017;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52O2QyJWuFfL2IsIXIU/w45voWI8oNAVU8X56yO2Hv8=;
        b=oag02WM3+hczs1qAkw8h4kjx5detLeXOfFehZPkCVzlQElIrZi2pfDgg7Jm30w0OuA
         f+BMqlg4YEeI8hLHCJlrNPQTWHLrsVH+HrBIQ9A3ajC3DJxJODC4bFG6BqIn/P2le77l
         rnk6CgJOuY9IXuIF8KhL64oPZm8ynVeQgGS/FgZx6drlRsIMy2uu5he4UxigYS2H+aFq
         HEkiJHgINHc0yS0GdL7f0tSn/infgghpAMj7XFfnDI8Plb0euhyu1lGVvFXegkQrh/Nl
         mMmg/fTv4d9Rp8SE63cAuUCtEGWaHEZBmL3qNSaMbPvjEKaBDcUkh2R+pR/NE9zMfN5V
         5keQ==
X-Gm-Message-State: AOJu0Yykrap3F5Y/cnlSydc+LVkoUCWnnzsbbJXBphUAkO5fgxgCki5b
	8DOMFjsLjTI43Km0KuKUrCYmXe4Y4Ot7tA3yDtpxUO50cupWczo1YMPUzC8MXoc=
X-Google-Smtp-Source: AGHT+IEkW9clUFKzilZxpJsWDU6bdxXb/oM9klOtc5N8VM/0fA1yX6KxqkHDu7dLz6YPZoidG3uC/w==
X-Received: by 2002:a5d:6a8a:0:b0:33a:e8b5:28f3 with SMTP id s10-20020a5d6a8a000000b0033ae8b528f3mr93552wru.24.1706730216884;
        Wed, 31 Jan 2024 11:43:36 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUUrEdBRziq//ZHpMIxa2ae9h88V+F+AxrDt76TMBKlXHa+U0JYH5fGRdp8pvfnUT+LiizStgax6NZNW6Gal2V3E+zl8YPInsR2cwVrsCxWrczQuhsy/Qenpeg=
Message-ID: <1b65f692-1112-4c7c-a4f8-116b7116ef53@citrix.com>
Date: Wed, 31 Jan 2024 19:43:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] tools/ocaml: bump minimum version to OCaml 4.05
Content-Language: en-GB
To: Edwin Torok <edwin.torok@cloud.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1706697216.git.edwin.torok@cloud.com>
 <11cc8480e6e52d5c2dccc7d8d65e1362c7fba685.1706697216.git.edwin.torok@cloud.com>
 <6cf32d7b-043e-458e-b73b-68899b6303a8@perard>
 <2b912ae7-b102-4d05-9095-9505c869d1d0@citrix.com>
 <9A7DEFE3-5F71-41FF-9F9C-A3863B553FDC@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9A7DEFE3-5F71-41FF-9F9C-A3863B553FDC@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/01/2024 5:34 pm, Edwin Torok wrote:
>
>
>> On 31 Jan 2024, at 17:17, Andrew Cooper <andrew.cooper3@citrix.com>
>> wrote:
>>
>> On 31/01/2024 4:36 pm, Anthony PERARD wrote:
>>> On Wed, Jan 31, 2024 at 10:42:49AM +0000, Edwin Török wrote:
>>>> We tried bumping to 4.06.1 [1] previously, but OSSTest was holding us
>>>> back.
>>>> So bump to OCaml 4.05 instead, which should match the version on
>>>> OSSTest?
>>> Yes, it's looks that's the version osstest can currently use.
>>> I've started an osstest flight with this patch series and your other
>>> ocaml patch series, and so far osstest seems happy with it. The flight
>>> isn't finished but all build jobs succeed, and a lot of the tests jobs
>>> as well.
>>>
>>> So:
>>> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> A question, while I think about it.
>>
>> I understand why we want patch 1.  The 4.02 -> 4.03 bump is necessary to
>> also compile with 5.0
>>
>> But why this 4.03 -> 4.05 bump?  There is no other change in this patch.
>
>
> The oldest supported Debian has 4.05, and I can’t find a non-EOL
> distro with 4.03 or 4.04 here: https://repology.org/project/ocaml/versions
> I also have another series (that I haven’t sent out yet) which would
> use Dune 1.x in an attempt to use Dune in a way that works on OSSTest,
> and the oldest release I can test this on is Debian 10.
>
> We could keep the minimum at 4.03, but would anything in the CI
> actually be able to test that?

Nah - that's a good enough reason to go to 4.05.

However, the two patches ought to be folded together, with both parts of
the justification given in one commit message.

Otherwise to anyone doing git blame, you've entirely hidden the 5.0
build fix with something that just looks like 4.03->4.05

I can sort this out on commit.

~Andrew

