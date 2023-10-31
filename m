Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB207DCE27
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625788.975428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxp5u-00022B-Nx; Tue, 31 Oct 2023 13:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625788.975428; Tue, 31 Oct 2023 13:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxp5u-0001z9-LG; Tue, 31 Oct 2023 13:47:46 +0000
Received: by outflank-mailman (input) for mailman id 625788;
 Tue, 31 Oct 2023 13:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ZX9=GN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qxp5t-0001xt-KM
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:47:45 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10e0718d-77f4-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 14:47:43 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so9812656a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 06:47:43 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l1-20020a50d6c1000000b00540e894609dsm1198479edj.17.2023.10.31.06.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 06:47:42 -0700 (PDT)
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
X-Inumbo-ID: 10e0718d-77f4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698760063; x=1699364863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3itwTcSY7mwRQFXffFODRqrw/oLV8xTehVW3kDr7u8E=;
        b=ku61SfnzlLqrR7kpLRko2K/ZYHos+2c44i44ekpFSu1v5PTN0sJXJbtQjtRvLYhY6o
         DGzR7mRaXMGf/vFaVjqQUtCHFtGipTPj2B1zPNAmcE/igUVFle1K4MMifEOE2kLNG6UM
         n8hFRGPj5W6p98W2hrz5T3S0MixG2nMF5igeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698760063; x=1699364863;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3itwTcSY7mwRQFXffFODRqrw/oLV8xTehVW3kDr7u8E=;
        b=K4sBmEtVWzvL7/aD7lWC6QljAEHlnH3gq1fySf4TEn3PgY3c2JML7eXPjRmeSyZ0O1
         gMxGtPI1jIB5kaMtqORKqF0VQRmtU80oY1HnCaHTIMB2hLrOJDatFfDSDU0oqj7S+LI4
         Ft9yD2hX8IgUFmPO5IlGjRlifQz/Zzf7SHolyOVWCXq2JA7Fzv/jiVwECHVyUs6UAtP9
         gI+fGFZlOPVRn7zrIfasLeO5C7qlqaEStueEA6tsxivN72SSgH7wkb7y/zHgCBG82JhA
         Y9pro3Pp2qgUTZR/AVkFfwP5q1aLqszIWEDiE7g+JpUscto3j7e16FpLCDFbtkep5YIK
         jddA==
X-Gm-Message-State: AOJu0YwIPR86cCojeU2tJpCeur1blwNpRyKuY+gAc2ckZ/MfuPcwBpk8
	7+DSJxjTZZG2gbjmdwR3u6/DLA==
X-Google-Smtp-Source: AGHT+IEReaX8cUD8nYZQsjzcESsXCyFCa4U0aJ9EaskRHBPp2mZGeeXOXUjqTErMorGYjdY7b9hqkg==
X-Received: by 2002:a50:9e81:0:b0:532:bed7:d0dd with SMTP id a1-20020a509e81000000b00532bed7d0ddmr11110883edf.5.1698760063003;
        Tue, 31 Oct 2023 06:47:43 -0700 (PDT)
Message-ID: <d6661159-7066-4473-8362-f9c19ce9c278@citrix.com>
Date: Tue, 31 Oct 2023 13:47:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.18] docs: Fix IOMMU command line docs some more
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>
References: <20231031120215.3307356-1-andrew.cooper3@citrix.com>
 <ZUDx67jQrGQcy68-@macbook> <6f2544e0-3976-4d05-982f-9406acbb207a@citrix.com>
 <ZUEE8o9x9e_Vh7q2@macbook>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZUEE8o9x9e_Vh7q2@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/10/2023 1:45 pm, Roger Pau Monné wrote:
> On Tue, Oct 31, 2023 at 01:29:04PM +0000, Andrew Cooper wrote:
>> On 31/10/2023 12:24 pm, Roger Pau Monné wrote:
>>> On Tue, Oct 31, 2023 at 12:02:15PM +0000, Andrew Cooper wrote:
>>>> Make the command line docs match the actual implementation, and state that the
>>>> default behaviour is selected at compile time.
>>>>
>>>> Fixes: 980d6acf1517 ("IOMMU: make DMA containment of quarantined devices optional")
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Wei Liu <wl@xen.org>
>>>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>> CC: Henry Wang <Henry.Wang@arm.com>
>>>> ---
>>>>  docs/misc/xen-command-line.pandoc | 6 ++++--
>>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>>>> index 6b07d0f3a17f..9a19a04157cb 100644
>>>> --- a/docs/misc/xen-command-line.pandoc
>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>> @@ -1480,7 +1480,8 @@ detection of systems known to misbehave upon accesses to that port.
>>>>  > Default: `new` unless directed-EOI is supported
>>>>  
>>>>  ### iommu
>>>> -    = List of [ <bool>, verbose, debug, force, required, quarantine[=scratch-page],
>>>> +    = List of [ <bool>, verbose, debug, force, required,
>>>> +                quarantine=<bool>|scratch-page,
>>> I think this should be quarantine=[<bool>|scratch-page], as just using
>>> iommu=quarantine is a valid syntax and will enable basic quarantine.
>>> IOW: the bool or scratch-page parameters are optional.
>> =<bool> already has that meaning, and this is the form we use elsewhere.
> I guess I got confused by some other options using `[ ]` to denote
> optional parameters, but I see it's not used by all of them.

Yeah, it's a mess, sadly.  One of many things I've not had time to fix,
but at least this is closer to the normal syntax than before.

~Andrew

