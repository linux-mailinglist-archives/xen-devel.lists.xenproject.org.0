Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691579883FD
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 14:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806265.1217608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su9rf-0006Ur-EO; Fri, 27 Sep 2024 12:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806265.1217608; Fri, 27 Sep 2024 12:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su9rf-0006Ss-BP; Fri, 27 Sep 2024 12:14:27 +0000
Received: by outflank-mailman (input) for mailman id 806265;
 Fri, 27 Sep 2024 12:14:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vzYf=QZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1su9rd-0006Sm-55
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 12:14:25 +0000
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [2a00:1450:4864:20::641])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0848854f-7cca-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 14:14:23 +0200 (CEST)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-a8b155b5e9eso298927166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 05:14:23 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2979d88sm127679566b.156.2024.09.27.05.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2024 05:14:22 -0700 (PDT)
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
X-Inumbo-ID: 0848854f-7cca-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727439263; x=1728044063; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PE+BZlV167dqOaqqagcFWYnTg3ynlX8ami1pqkJU0Is=;
        b=Mz72tc3ZdcIkmJxzoBvthVjVkWRf5zdyO94ei1Jvhhv6Uc/Ta4PHY5V4J0s43P0/mu
         EpKptWpGkqMsdb58e0wxVn26UMIfgSRCXxvaR6VJzrj4O9nXUcMKrpD6GlrVTjl31cgs
         mOpbVTUMKJaW2f0qRr1BpxUGaFDrH+6lCwils=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727439263; x=1728044063;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE+BZlV167dqOaqqagcFWYnTg3ynlX8ami1pqkJU0Is=;
        b=Y4+3VKXQhE14Lzud7pmLzymHDMrLhPMt4E3oqnbnPDQzRTQ12fqnhc0OUdzFI/Kn+F
         hWHGs8Zx4XUUEwdogWNYcIBLC0fT3rjZL9RhRJZQxmVbxSrJJEOIiYtisjgF4NcSOx0R
         E0lJFIKIyKUNkBiE7YumaoY+86eq6H5Zm1LW3xAFMYX//BfpCE+g8fJIiWIrC05RBPcI
         hkr7iesYwsAtFXdya5UuxOsc4uZZ602u5RKbrvOTgjtQjNpQHcrH/Y3D+0IE7231oKO7
         Ei73qg38Cb82QeuWX+cmB3V1Cach2B+hvUmjX7/sXlDUXwWOKcXT8KsXIljX0J0VeTpn
         909g==
X-Forwarded-Encrypted: i=1; AJvYcCVJnGn6hx5h0VKgLWzY4EmFZs/t0FcWmp97irIe1yU11SVub3xDImj72FChXyLjzVDIC0IpxfzWCUA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXujYqmMfhsLRjUKfI/VC8W7srynRTZIakJ0L+IgqelgW3IZub
	jCOBSAsHGFT7TL5kj6hi1IPnEeb/6a91tJ0PsEcMi5vdpV0uxKqoKBSjRqsxOkY=
X-Google-Smtp-Source: AGHT+IHrdQfZme0ruPOLyynqo+sKovzxEYw+xvfcyFQkaaLDxBLIKwf2xyLQAqlxO7HDn4+9f16G8Q==
X-Received: by 2002:a17:907:3e1c:b0:a8d:495b:c52d with SMTP id a640c23a62f3a-a93c4969f43mr254094066b.33.1727439263060;
        Fri, 27 Sep 2024 05:14:23 -0700 (PDT)
Message-ID: <fe90d65b-ba86-4c3b-ba7c-1eca17993618@citrix.com>
Date: Fri, 27 Sep 2024 13:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/video: Convert source files to UTF-8
To: Jan Beulich <jbeulich@suse.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240926134823.688372-1-frediano.ziglio@cloud.com>
 <63129694-ace9-4b55-92c2-7cfb8a2c1386@suse.com>
 <CACHz=Zj0K+uYt7h80p3Crkom-VNoLbH_4Wt04jdNDYs28tApdg@mail.gmail.com>
 <2f13ea6d-adeb-49b4-80f7-415d9503c7c7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2f13ea6d-adeb-49b4-80f7-415d9503c7c7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/09/2024 7:25 am, Jan Beulich wrote:
> On 26.09.2024 18:03, Frediano Ziglio wrote:
>> On Thu, Sep 26, 2024 at 3:46 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> On 26.09.2024 15:48, Frediano Ziglio wrote:
>>>> --- a/xen/drivers/video/font_8x14.c
>>>> +++ b/xen/drivers/video/font_8x14.c
>>>> @@ -2059,7 +2059,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
>>>>      0x00, /* 00000000 */
>>>>      0x00, /* 00000000 */
>>>>
>>>> -    /* 128 0x80 'Ÿˆ */
>>>> +    /* 128 0x80 'ÂŸÂˆ */
>>> I'm unconvinced this representation is any better. The data that follows
>>> right here clearly means 'Ç', not 'Ÿ'. Which is U+00c7, not U+0080. I
>>> don't have my Unicode manual to hand, but I seem to vaguely recall that
>>> U+0080 doesn't really have a glyph associated with it.
>>>
>>> Of course I'm also uncertain whether my mail UI actually correctly decoded
>>> the transfer encoding (base64) that you now used. In any event I'm unsure
>>> of associating the upper 128 code points with any particular characters
>>> (glyphs). We don't render UTF-8 to the console, and what those code points
>>> mean is unknown until code page information is provided. I see the
>>> following options:
>>> 1) The glyphs represent what the bit patterns encode, encoded as UTF-8.
>> That was what I was trying to do.
>> I wrongly thought it was latin1, in reality looking at the font (why
>> not?) it's code page 437, so this commit is doing the right thing
>> https://gitlab.com/xen-project/people/fziglio/xen/-/commit/7ca512e8ae21bb02339ed7a1a78409827a08aea4.
> Yes, this looks good (after looking at just a few entries).
>
>> Now... I'm trying to send the patch to the mailing list, which seems
>> easy, but I have to find the right combination of options, tools get
>> very easily confused about (that's why I send the link of the commit,
>> at least people can take a look and see that is correct)
> Maybe this is a case where, besides inlining, it would help to also
> attach the patch, to remove any possible ambiguity due to back and
> forth en-/decoding?

I'm just going to take it straight from git.  That has the least chance
of errors.

~Andrew

