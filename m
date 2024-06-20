Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50660910416
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 14:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744452.1151491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKGun-0004Bv-N4; Thu, 20 Jun 2024 12:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744452.1151491; Thu, 20 Jun 2024 12:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKGun-00049O-Jj; Thu, 20 Jun 2024 12:29:21 +0000
Received: by outflank-mailman (input) for mailman id 744452;
 Thu, 20 Jun 2024 12:29:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WCyn=NW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKGul-00049D-U4
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 12:29:19 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6cba318-2f00-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 14:29:18 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57d20d89748so749858a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 05:29:18 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d2376ccb3sm696836a12.74.2024.06.20.05.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 05:29:17 -0700 (PDT)
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
X-Inumbo-ID: b6cba318-2f00-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718886558; x=1719491358; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nXwHOZ/PDUZeUlO/aEowJKfxsvzpMKteBsTpJA/SLCY=;
        b=cmI9sXxhtSbwEHrIZepNFoSDp1xa/uppqqa6DoJXVfkJATr6fSuW5JIm5MtUpWFgNo
         DkelAD0MJVWwg2JHrqm8e3XWv4ZD/zL0ai/AfjASuidfIHJ208NpvSA69mX2k75RADXJ
         lNigb/254Nyo+X5NfMEmXBxKjoHQ9O0RBs4oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718886558; x=1719491358;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXwHOZ/PDUZeUlO/aEowJKfxsvzpMKteBsTpJA/SLCY=;
        b=ELxVIMuUTr4mIjpHEIc2zsaTiyRg2Aepl7zIwG+zjzYbkiZxyNPquVYDL/EMjvEjfL
         9jkO7tKiI1amyVMXuuaxd1kMhSMQgZem+BJj3o490CiuyLXnYvjETUSDhopMk/EDPgr3
         wfGNPBJ+cnPtPINAqBpA+lu2DZrh+yGaGCqbEQkuMkLF18mNEUsxxFX1Hs3tOqrOoddT
         0e4G7xqwCZubz93Fs/1W0Lz1dUgKM8xlHtEp/AEQB06OEZjptXbSf6IBxoBUG7RU9F8S
         z6vtX3Kk90cnK2t0RBN/YVPZwqXbaU+jLR33rYnmorwLTz1QuLXJclxbTwxn4NbJIMOY
         nU+Q==
X-Gm-Message-State: AOJu0YxXBiQHWgyLDZlyuitJ1TCOzWXNayyzT1Eg+tWFsRHSHxjEpnLo
	P1y/KAaCZcd+0juyH2kXjKU06zC6sxBAC6GdieAQJ6KeDbSl0MANGZNUPneq/Vs=
X-Google-Smtp-Source: AGHT+IFMg46g6J8I5fKSoMJjQ4tNuG1avYq0+ygm4sofWn9UPfamr+IcpHIW+hPlmGkYUTEkqc4g3A==
X-Received: by 2002:a50:d543:0:b0:57c:a7dc:9d6e with SMTP id 4fb4d7f45d1cf-57d07ee31d0mr3665339a12.39.1718886558149;
        Thu, 20 Jun 2024 05:29:18 -0700 (PDT)
Message-ID: <fa700afd-c9dc-4bae-bf9f-0b2504b6252b@citrix.com>
Date: Thu, 20 Jun 2024 13:28:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18] x86/cpuid: Fix handling of XSAVE dynamic leaves
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20240620111438.2666922-1-andrew.cooper3@citrix.com>
 <4b8d9881-48b4-4600-897d-da8684b10132@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4b8d9881-48b4-4600-897d-da8684b10132@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/06/2024 1:10 pm, Jan Beulich wrote:
> On 20.06.2024 13:14, Andrew Cooper wrote:
>> [ This is a minimal backport of commit 71cacfb035f4 ("x86/cpuid: Fix handling
>>   of XSAVE dynamic leaves") to fix the bugs without depending on large rework of
>>   XSTATE handling in Xen 4.19 ]
>>
>> First, if XSAVE is available in hardware but not visible to the guest, the
>> dynamic leaves shouldn't be filled in.
>>
>> Second, the comment concerning XSS state is wrong.  VT-x doesn't manage
>> host/guest state automatically, but there is provision for "host only" bits to
>> be set, so the implications are still accurate.
>>
>> In Xen 4.18, no XSS states are supported, so it's safe to keep deferring to
>> real hardware.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> I'll try to not forget to include this in my next backporting batch. Thanks
> for getting this sorted so quickly.

No problem.  If you're intending to commit this, could you fix:

  "depending on large" => "depending on the large"

in the first sentence please.  Only just spotted it.

~Andrew

