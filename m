Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76049A46470
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 16:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896866.1305613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJDE-00046e-N7; Wed, 26 Feb 2025 15:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896866.1305613; Wed, 26 Feb 2025 15:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJDE-00043z-K1; Wed, 26 Feb 2025 15:20:40 +0000
Received: by outflank-mailman (input) for mailman id 896866;
 Wed, 26 Feb 2025 15:20:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnJDD-00043t-8n
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 15:20:39 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b1bcf3a-f455-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 16:20:37 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43998deed24so66580135e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 07:20:37 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86d1d5sm5958522f8f.39.2025.02.26.07.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 07:20:36 -0800 (PST)
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
X-Inumbo-ID: 3b1bcf3a-f455-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740583237; x=1741188037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O+04dclAowzRUmxAgq3iQvJpk/QZT9q5bUMq3VHQ1Wk=;
        b=uyOrt2kMQzzxcTJQ39sDeDYePeoaLuNxK8Pl4GzpT/5BlW8LLxmQo5xQXtj5lVoekA
         WpOj/WSCSHLUJFDpkPn1QLPXRAQ4eVNkx+1aih4mGAOQVVbv5911lggaBHBKDZM30V8O
         HK/vFBTHD0HjNUfmVyJjBX3rBq59ZuHT18UN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740583237; x=1741188037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+04dclAowzRUmxAgq3iQvJpk/QZT9q5bUMq3VHQ1Wk=;
        b=WH9CEuo6e9+UzOfJM/4+Vg62pAgUCAFmOBcaY48Tslg3vCURUQ/ZMrqwaSA1v9f5MX
         gO0ewiK5uPtRRH1k6flDIM+dz55oYc/C77Px23zP2a7LxaIYYZidgiZuxBlFUdvj58ev
         6Q5TgZnvJQgzkvhsZbwyOJ2kDijAYTDB2jPnuV0dvwkAzeY9frKVb590ucgKTf8ZvTdP
         hpc3kOOlgaiNLfbvgMguxmpU1KqaE7MPFQHzgk1uRBHyr53V32cH1FatSAuIYzZ1cNwE
         tSZ/sOelFJclkMA934ZuSStbTHPL/Dr04YpINdYszbZvUb1BGRMhS0DX9NYksRMTkTX8
         3BPA==
X-Forwarded-Encrypted: i=1; AJvYcCW7HvlETI+6Y5fNYl1iiOnRUNYkeJ6aKt3j82RpOkteHK4ava209avXtXrnkQbKJd4h5NmxodLxaAg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWaVwVu4hfbwrxDKn8wOcvc5eYzu9BUpREtn6ju65Ophzqbj5E
	KIioLgFCGOb1bPvLLu2bNNGqqw6vhQQszezbxHV/T1dWK+qWK+Sv5x9GBUw6Xwg=
X-Gm-Gg: ASbGncsfcjJFIC/zx28wN6DnqNyREBaZhKDQBptcBxcvYAEFAJTP723mNmpPBzURTUJ
	TXT9aQtIeTVsqEmNvsbmAGdLFVpqVNQhUf54NZn3PaGTOZptFOR6Oua28zNW6LP13hp6r6EwhYM
	xYJjrRtXkqrbpjifpwblCjCye9Da7mxQAW+ZLV1dJxn+I6Xb7JSpzTgknwyk+qIiiTVwWeWsayn
	dplzXUTSRQUEgSUjE283vJz4zjX6A4FdthpcaKJSYd0cLFWaedFM4hDkkkLqHJgLXxxbwUfXECL
	byrOKNqb3cH1dsOrFAcgZpHyo+DrYw4DlQbMgzuD6l8BAPJyjgEmmBkdwhWcjw1QzA==
X-Google-Smtp-Source: AGHT+IHkVmfV0CRp2KSbuUsn6xzjti9fMxcOXDJmd+GnGbuAVS6bQ5om9XeO/JpiMVOIMlzMMr+0Tw==
X-Received: by 2002:a05:6000:1847:b0:388:c61d:43e0 with SMTP id ffacd0b85a97d-38f70855a84mr19140997f8f.48.1740583236679;
        Wed, 26 Feb 2025 07:20:36 -0800 (PST)
Message-ID: <8a64a0a4-7e6a-4503-ac96-0b9c5d18b197@citrix.com>
Date: Wed, 26 Feb 2025 15:20:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20 v2] CHANGELOG.md: Finalize changes in 4.20
 release cycle
To: Juergen Gross <jgross@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>
References: <20250226104556.36324-1-oleksii.kurochko@gmail.com>
 <5e917a68-c350-4d98-aa66-840d678486d6@citrix.com>
 <9d024b2f-32cc-4a22-8b45-0811ae4e07f7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9d024b2f-32cc-4a22-8b45-0811ae4e07f7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2025 3:17 pm, Juergen Gross wrote:
> On 26.02.25 16:12, Andrew Cooper wrote:
>> On 26/02/2025 10:45 am, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in v2:
>>>   - Drop "Support device passthrough when dom0 is PVH on Xen" from
>>>     CHANGELOD.md becuase it isn't really ready:
>>>    
>>> https://lore.kernel.org/xen-devel/31db7d34-3338-4d88-8721-f2cd4b68f3b9@gmail.com/T/#m725b559864e5ed6163b59a088b437aa10c36ff16
>>> ---
>>>   CHANGELOG.md | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 1979166820..5f5a40855a 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -18,6 +18,11 @@ The format is based on [Keep a
>>> Changelog](https://keepachangelog.com/en/1.0.0/)
>>>    - Fixed blkif protocol specification for sector sizes different
>>> than 512b.
>>>    - The dombuilder in libxenguest no longer un-gzips secondary
>>> modules, instead
>>>      leaving this to the guest kernel to do in guest context.
>>> + - Reduce xenstore library dependencies.
>>
>> What is this in reference to?  I don't think all of Juergen's series has
>> been merged yet.
>
> Not all of the series has been merged, but some library dependencies have
> been dropped already (e.g. to libxenguest). This is especially affecting
> the build of xenstore-stubdom positively.

Oh, that's good to hear.

~Andrew

