Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26292B0A58C
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 15:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048794.1418987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclRh-0004jo-M8; Fri, 18 Jul 2025 13:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048794.1418987; Fri, 18 Jul 2025 13:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclRh-0004hs-JO; Fri, 18 Jul 2025 13:48:17 +0000
Received: by outflank-mailman (input) for mailman id 1048794;
 Fri, 18 Jul 2025 13:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uclRg-0004hm-B2
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 13:48:16 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da50e04f-63dd-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 15:48:15 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-612b67dcb89so2572219a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 06:48:15 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c904049esm1022257a12.34.2025.07.18.06.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 06:48:14 -0700 (PDT)
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
X-Inumbo-ID: da50e04f-63dd-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752846494; x=1753451294; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N66be0Xg207tt/bg6Lpbj+H5PyJV0QkAkMAO5IiJ6c4=;
        b=ePnYj2XKFsxbo/IXkB/sH7pGBNvD+0ISdT1zkkprSlFWGmMVR/pgEABj8cvUEIMFbe
         u71l+sEihBALEq5UMNosBIMavd/l1QWSJPDvoslKT/bS5bRavKkxZWo69Zdig5CGA9nW
         FQ4cAsbc/mNRKWh7QBWzBAX300gvvaX3CZQds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752846494; x=1753451294;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N66be0Xg207tt/bg6Lpbj+H5PyJV0QkAkMAO5IiJ6c4=;
        b=QCV9dVaoCXtRDp5fl7WQDKFUg6AR7e/obuJCZM6B+TVhXWZtIFjrOatbvd3SEiBton
         VZlDLLH/GnCg4ZGoh8y2weQyKk96PT1UdJ+CGrUvLzeTN06B4LHt6MnOsc91ZeNc95mT
         zBWhNz0PcVMZ9IUQtU6S9N4L4TUFNFSVTuUAFji3D7Yu7i+Yk+zPFlSY56Au9zde/vON
         Cf9pMJkzE+wNtH5LmzpkcwBd/kQE+x43cyByoQE9nFqrtPA3ALaI25EVlKZOwAvptRKg
         SKvD7hlamfCWzeVoqlirbD43XPwBejirCnJmb+6f8G13RmOavrVE73PlrwzzF9BBMomc
         SVdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn8V3QLvKCGd007pa+ELQk8/Tfb4cOj84E6XvVbm5GD/NN8e8nNQLlHEPTFWzpPfmT6XNJGroCqKU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlNmmytvlks1j8xBn8E3V2KRO8kULVCq34xrv3PNTmMyl6/b1T
	m7yIOhKN9aHydI0BARRU3JH6rIFBL14yObEXjyrGOutKDW86RwfJMXj7VvHKjIDrcQc=
X-Gm-Gg: ASbGncsug07AE6k10XHREgSI4Lt7Vzz2Y4NJgxgyvQ1jjCSgSewTCCzPFoeZDFpcxXx
	3e6kOeTOubV1UX40LRj19v6Ivegv3ZJ5A8uiXlhMK27RxKuQKOCFPxF/PjZc8eIKcdPFstbOZHM
	IpqQ/9aHF/lCFLO+VLbdsMYEo6beuayNEcIUMyOVvzwPyi5LJswBZouGEmR8Yrxfm7isukSgz4y
	APXwrZOzG6aBp6oNIm3FnfJi3kdZs7ay7ogPboM2kHzQ0e1iaBgH7UtWQU8ZGgdBF4bTtPzV0+9
	pom52RxfNPyppiswy4okj+MijGLO+jZxAtJzM/AagfqqFwnJhn+lW5CO91qH0LDcLSY2qxU9Os/
	yuKFOaD1qCGTVeXblHFmH6alL6ysyPmISi2Ej2HoJ7LzV24fik1xGgIKu9rei17v8iUUdPPp9ZP
	CmQQ0=
X-Google-Smtp-Source: AGHT+IHdpBTcpNNbOS/wHJ5+zNU8Cdar5Ibn2PFVINzZSCLc9rWC9QtAsIaSvdolRnmPxu27G+g+bw==
X-Received: by 2002:a05:6402:34d0:b0:606:c8fa:d059 with SMTP id 4fb4d7f45d1cf-612859304admr9170829a12.14.1752846494531;
        Fri, 18 Jul 2025 06:48:14 -0700 (PDT)
Message-ID: <de067dcd-0464-4df7-b7c3-64acb2c51496@citrix.com>
Date: Fri, 18 Jul 2025 14:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/match-cpu: Support matching on steppings
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-6-andrew.cooper3@citrix.com>
 <a6abcc07-535f-433b-948a-702dc33093fa@suse.com>
 <03ecaa72-2370-47f7-b84b-83831d188f4e@citrix.com>
 <29cb9771-ee2a-4c7d-b661-74b37728bc2f@suse.com>
 <3cefd149-505f-4e29-8018-492886050c6f@citrix.com>
 <48e1c298-0afb-40a3-80a0-a5b97465ce4e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <48e1c298-0afb-40a3-80a0-a5b97465ce4e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/07/2025 2:28 pm, Jan Beulich wrote:
>>>>>>      uint16_t model;
>>>>> Whereas the model is strictly limited to 8 bits.
>>>> There is space in here, if we need it, but you can't shrink it without
>>>> breaking the check for the NULL entry (going back to the first obfuscation).
>>> Breaking? Or merely affecting code generation in a negative way?
>> Shrinking model without adding (and checking) a new field would mean the
>> loop condition no longer covers all metadata.
> And it doesn't strictly need to. It needs to check enough to not mistake a
> valid entry for a sentinel one.

I've found a nicer way of doing this, but it needs another prereq
patch.  I'm preparing a v2 with the remainder.

It also addresses the horrible code generation.

~Andrew

