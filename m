Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD45F8445DC
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 18:18:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674121.1048852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVEDl-0005nl-2J; Wed, 31 Jan 2024 17:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674121.1048852; Wed, 31 Jan 2024 17:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVEDk-0005lm-Ul; Wed, 31 Jan 2024 17:17:56 +0000
Received: by outflank-mailman (input) for mailman id 674121;
 Wed, 31 Jan 2024 17:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6GWq=JJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rVEDj-0005lg-4Z
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 17:17:55 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab3c5897-c05c-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 18:17:54 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40fb804e4deso290485e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 09:17:53 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j38-20020a05600c1c2600b0040ee8765901sm2128985wms.43.2024.01.31.09.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 09:17:53 -0800 (PST)
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
X-Inumbo-ID: ab3c5897-c05c-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706721473; x=1707326273; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FcFkuI7zGF0EPNfPUj20h0jehmcy6uMUzMm53BQ3VP0=;
        b=P9gKixSdCLabrjpFmRitx/bxfr5yDovQ6y26bJqjauw3QpWHe/4QdnMRmKCpFEDAaL
         fXxEc9d02uOV16v87ApMHljUMRqrNEblpdi08X1DfNhDDMGhHO/SC9AvhKwPZ6IloOcm
         tMPtuQ7/sEJ/a5GIE/LgXbsr0MGFMBxT8IZAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706721473; x=1707326273;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcFkuI7zGF0EPNfPUj20h0jehmcy6uMUzMm53BQ3VP0=;
        b=afspuzrZI05ANIn0nMBrlg+lr5/gjLl6R1KNDhLfkKf3iYHYpRO+rdBqVIRkemimeT
         V0I3Q26e1mV5l24bmQaXL1WInLxwA7VJHcbveEXf2/q/zxcuD7nWHmo1rjAvFeItUtCJ
         wwFg/bcpgw+x1035hTJj7bxrCoVzIj+nHeGU+GRDrCSGlZV8HaEDZOERJckvsazDnzTk
         UYitEKE8iBS+lPjdlETDfiQjisFd4k5B8xU1LGerzVzlLqcOR718oQSkJv06PM8C7YcT
         H2hFB9lFWicbgINfH+fgCUoE6WoiHkVtiHItlY2gvWmOFy1yORBeKLFtsymwTux5LvRS
         AZOg==
X-Gm-Message-State: AOJu0YxA93z84diNkqvI9yRmKN3K9x3ZJlkM1FExmyCG4yiuS0TTRKlx
	XZPwiNyqWVJ+O/etvlnpXBaVSGLeldDaV6WGu49mQrpWsv6hF91qqk8oSe7h5eI=
X-Google-Smtp-Source: AGHT+IH0KhfzjFkmcK0swx/Yp6gV9nHY10dSDYIXgccXgrtiq2pigZuSd1EWwxiur5gub6THwd6Big==
X-Received: by 2002:a05:600c:a39e:b0:40f:b680:3e84 with SMTP id hn30-20020a05600ca39e00b0040fb6803e84mr985982wmb.2.1706721473221;
        Wed, 31 Jan 2024 09:17:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXaYUWftrvMOihUnuNrZUT+q7yNLT8r1+A3dzg4YtTw/4wxSfxAlMnB3t3wMRmB+p2ZuC7VcrvLDRm8DKQjz1V297Qwrma8mqUivjhsqTBKO0k=
Message-ID: <2b912ae7-b102-4d05-9095-9505c869d1d0@citrix.com>
Date: Wed, 31 Jan 2024 17:17:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] tools/ocaml: bump minimum version to OCaml 4.05
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1706697216.git.edwin.torok@cloud.com>
 <11cc8480e6e52d5c2dccc7d8d65e1362c7fba685.1706697216.git.edwin.torok@cloud.com>
 <6cf32d7b-043e-458e-b73b-68899b6303a8@perard>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6cf32d7b-043e-458e-b73b-68899b6303a8@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/01/2024 4:36 pm, Anthony PERARD wrote:
> On Wed, Jan 31, 2024 at 10:42:49AM +0000, Edwin Török wrote:
>> We tried bumping to 4.06.1 [1] previously, but OSSTest was holding us
>> back.
>> So bump to OCaml 4.05 instead, which should match the version on
>> OSSTest?
> Yes, it's looks that's the version osstest can currently use.
> I've started an osstest flight with this patch series and your other
> ocaml patch series, and so far osstest seems happy with it. The flight
> isn't finished but all build jobs succeed, and a lot of the tests jobs
> as well.
>
> So:
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

A question, while I think about it.

I understand why we want patch 1.  The 4.02 -> 4.03 bump is necessary to
also compile with 5.0

But why this 4.03 -> 4.05 bump?  There is no other change in this patch.

If it's "just because", then why should we take it?  All it's doing is
moving a baseline which doesn't need appear to need to move.

~Andrew

