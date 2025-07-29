Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255B9B148BE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 08:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062087.1427702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugeFK-0005zD-03; Tue, 29 Jul 2025 06:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062087.1427702; Tue, 29 Jul 2025 06:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugeFJ-0005xm-TT; Tue, 29 Jul 2025 06:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1062087;
 Tue, 29 Jul 2025 06:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H3U=2K=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugeFJ-0005xg-03
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 06:55:33 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02551555-6c49-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 08:55:27 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so4326753f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 23:55:27 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4588e5b7692sm11622695e9.2.2025.07.28.23.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 23:55:26 -0700 (PDT)
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
X-Inumbo-ID: 02551555-6c49-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753772127; x=1754376927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aQD7OEvC7NdvOZahtnieIQJG0v/62k1GeUJOZ3P3eQY=;
        b=AvjTD+siytuhbATS8LTL2l8Taf8QnhMjKPxdZh7jlSz0qdx7siLOxmiBIK5WTz5BzZ
         Um1JJNZLs9IMOj6xrk4OIN30zBiq05kWvNvzFngA5JY78pNJz0hwWXlhLiqbUvXtJETu
         2yiE3ROpL9glhrQtsNd6hZ4TA+4chqnq8Di74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753772127; x=1754376927;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQD7OEvC7NdvOZahtnieIQJG0v/62k1GeUJOZ3P3eQY=;
        b=vYvwvp066A8hd1k3hAgeUZ6a6VNlzg1KkgehECWTYqEIj2LUODulwcnkRFMlFSuwEI
         y2Or0iWcCR4sGXYBVcxjF+q231QzEmrsoL956CpDbYLhA1FVUz9Dlq02k9m7qCEgRoll
         T6BQFf+b3nFKeqXSDB9Q59fSkjbD1eN35PLYgwVEXWhf85f6ePPovF8YATdB/qDq0uYX
         VviGhPStOM3k9FWxwpAGs6R2Mwk7v97k+sAfyZOHBYOT4Wl+tmrj5ktJn9ndgKA1Zh23
         ifzmiFeSG3w8hxwYk9Cq7I69uzY8a9HRn8qDaBd5qH6CprgaaPz2c6zWhOgS5CZG0Mbb
         XCMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCs/5cIS4BQgnLSiNK2DhpAI9+nV1KjbQKHxy6rpFJJIjQ1xbuGmo5QSaH+zmaPH+n8SBUZBs/dO8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJnGqxMsc2JfaCTqd/SDob/TGLp3D2iI6xdf45nVCw/w91gpHc
	vHF3BUvDEoES/ldOoSShOeD7yUBH4OTl45kumBlIM7cs8JuVkjoQ6zs6I46ueR4Val/rgUirwOb
	Axoquamw=
X-Gm-Gg: ASbGncs2lp97CUZ0w8tE2Pdh5i34ggEYhCjbs4D0AYOu2xQMxN4xBieFtsuh5s7kXTJ
	VEIkAn5Wn2GDn3ZwQh40K7d18Z4AM3txaJmx/nH00R9cGUtGVrHiLTpfezn4K6QuyFG3xhfO73H
	PL0Ft5m1w0k6ZeKzlKg6g5pChl6Qu/GW1LI3O/mR/3eokzw6edPDU7JSXGvSP10zjEF1sHY3XYE
	+GOOFOQoU1XpeJrpo9uUQDbNTV9W9SzDTEHDWiLcPMd9wQCXYcK4sXPvDYxeTE4KFI2/cowTNbl
	iYbrttHTuuOIqAjch5WWVz0PS215MmMflsnm5oJTXpXCgeZA8Z75q0uwHxpRconocR7N4ETRacy
	acSQKyVJ56bJFkUo9t4ahD+cZqFooLqaZm0DPFV/R77s2d4r/dHDW7vhjBhLGdwbhM0uw
X-Google-Smtp-Source: AGHT+IH3ANFHnY6RQCd1xPNC2SJRzuCDT+x8xSzZYlT6QgYPLS4v98r5OFp/FnXAJbbnn/V4wg+qUw==
X-Received: by 2002:a05:6000:26ce:b0:3b7:7c18:c72d with SMTP id ffacd0b85a97d-3b77c18c88bmr6536585f8f.4.1753772127115;
        Mon, 28 Jul 2025 23:55:27 -0700 (PDT)
Message-ID: <feb8a172-e304-4f35-ad6f-cd8ca3b8dac5@citrix.com>
Date: Tue, 29 Jul 2025 07:55:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: don't crash on NULL command line
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20250728102422.2245808-1-marmarek@invisiblethingslab.com>
 <b4e3c287-7847-4cdc-8fbb-bb788a6de8b5@citrix.com>
 <55d8f784-4ad5-4a20-bfb4-ad6219415288@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <55d8f784-4ad5-4a20-bfb4-ad6219415288@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/07/2025 1:29 am, Jason Andryuk wrote:
> On 2025-07-28 06:45, Andrew Cooper wrote:
>> On 28/07/2025 11:24 am, Marek Marczykowski-Górecki wrote:
>>> When running xl in a domU, it doesn't have access to the Xen command
>>> line. Before the non-truncating xc_xenver_cmdline(), it was always set
>>> with strdup, possibly of an empty string. Now it's NULL. Treat it the
>>> same as empty cmdline, as it was before. Autoballoon isn't relevant for
>>> xl devd in a domU anyway.
>>>
>>> Fixes: 75f91607621c ("tools: Introduce a non-truncating
>>> xc_xenver_cmdline()")
>>> Signed-off-by: Marek Marczykowski-Górecki
>>> <marmarek@invisiblethingslab.com>
>>> ---
>>> So, apparently the "No API/ABI change" was a lie... it changed "empty
>>> string" to NULL in libxl_version_info->commandline. Quick search didn't
>>> spot any other (in-tree) place that could trip on NULL there. IMO NULL
>>> value in this case makes more sense. Buf maybe for the API stability
>>> reasons the old behavior should be restored?
>>
>> Hmm, I didn't intend to change things, but I also didn't anticipate
>> libxl__strdup()'s behaviour, or for something to depend on that.
>
> I think it isn't strdup()'s behaviour, but rather the old code:
>
> -    xc_version(ctx->xch, XENVER_commandline, &u.xen_commandline);
> -    info->commandline = libxl__strdup(NOGC, u.xen_commandline);
> +    info->commandline = xc_xenver_commandline(ctx->xch);
>
> No error checking on xc_version(), so strdup() is duplicating whatever
> (stale?) data may be in the union.

Even better...

xc_version(XENVER_commandline) for better or worse couldn't fail in Xen
for anything other than -EFAULT (writing a 1k block of memory), but a
systematic failing with the old ABIs was that nothing caused Xen to
explicitly NUL-terminate the string.

Notice how XENVER_commandline operates on ARRAY_SIZE(saved_cmdline) and
not strlen().

I'll give you 0 guesses what happens when the bootloader passed a
cmdline of >1k, and also 0 guesses for how we stumbled onto this mess.

~Andrew

