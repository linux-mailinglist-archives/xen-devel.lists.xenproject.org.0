Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813FE99D158
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 17:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818731.1232018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Mlq-0007ep-Bc; Mon, 14 Oct 2024 15:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818731.1232018; Mon, 14 Oct 2024 15:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Mlq-0007bG-7p; Mon, 14 Oct 2024 15:14:06 +0000
Received: by outflank-mailman (input) for mailman id 818731;
 Mon, 14 Oct 2024 15:14:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QJ8R=RK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t0Mlo-0007bA-5Z
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 15:14:04 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1c45b9c-8a3e-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 17:14:02 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c42e7adbddso5838486a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 08:14:02 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a0b25226esm200650866b.59.2024.10.14.08.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 08:14:01 -0700 (PDT)
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
X-Inumbo-ID: f1c45b9c-8a3e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728918842; x=1729523642; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=otp/AbDR7UioIS7zJZCnX6rhbv6c9VLsR0yLTMR+l5w=;
        b=Zj4zK7T2D5bzcoGmMVrDiVlQ46F23cuDBqQOYGy967HJBrFtcImjQwseZwTfax9uy7
         s0zmYNRkavjqJFFIXEpu0WbSCYU7dZlVkLGFBmast09/nxPxI5uIQO9ldUzLq56KrxMw
         DUZRlgFxMNtML+Wk8eqyQAgttR5wyOEiB18JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728918842; x=1729523642;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otp/AbDR7UioIS7zJZCnX6rhbv6c9VLsR0yLTMR+l5w=;
        b=COMbnTv3kjzbt/eIoE8c0iCj1h4sCJyUccA7f3bow+cwz79eMdmzW/IcSJOhm4QsBT
         +zZZnjXZYJyFNs4QUTs0VacXvDpWo+Q45U+oCS/6Ye0Q1Hx8fp4mRZWiZm9SAWuRjm3T
         OR8v4SwovhAd7DEGIkmKgJOKjmk9NFVj4EZI1umkIZlKzDWF6l52FmoMIAkxHjl9SU3A
         hjDASQdjWTWzb+SMXakCaNp/jAROsp2wlCTDUsLxU0uy1alt6zg0d0tYC7l8maiU0418
         YvJaeh+j0pH/AgdDgtXvoBQEmRtdgB3ePbkShbXZujA6Dx7kAuiW5jGrYgkGWAFQOKH4
         T9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCU9nudcCTBnOn4RKoy2yfnCpUCi/ll2gl2ZCdzX1EiFRbGlL35X0DNXfv2wguDDO/xjrWQTf2LIIOw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyN0DFV6S/WAsYN1wGSKguRMOnPEpvMevnkSgf3eln8ehR/Ao8
	yGpIGyO6g6cm+eeSQrpS3L4Vcf9mFfuJ54RuvorhqdGC33h3FLzLLb0Y/pVUCts=
X-Google-Smtp-Source: AGHT+IG8Qq5+e6fik3J48bqEzBQ7p7/+n3xESp+iX2NH2+HzNgtnMkLW/jIRFhiSoFF29Syt1I8pOg==
X-Received: by 2002:a17:907:1a50:b0:a9a:a5a:1d47 with SMTP id a640c23a62f3a-a9a0a5a9419mr280287866b.2.1728918841552;
        Mon, 14 Oct 2024 08:14:01 -0700 (PDT)
Message-ID: <db56d29a-5ef5-4d0c-a693-307e51d769e5@citrix.com>
Date: Mon, 14 Oct 2024 16:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/spinlock: Fix UBSAN "load of address with
 insufficient space" in lock_prof_init()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241014145710.3295232-1-andrew.cooper3@citrix.com>
 <7dc142bb-d664-4401-9dbf-37931fe4e346@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7dc142bb-d664-4401-9dbf-37931fe4e346@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/10/2024 4:12 pm, Jürgen Groß wrote:
> On 14.10.24 16:57, Andrew Cooper wrote:
>> UBSAN complains:
>>
>>    (XEN)
>> ================================================================================
>>    (XEN) UBSAN: Undefined behaviour in common/spinlock.c:794:10
>>    (XEN) load of address ffff82d040ae24c8 with insufficient space
>>    (XEN) for an object of type 'struct lock_profile *'
>>    (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y ubsan=y  Tainted:  
>> C    ]----
>>
>> This shows up with GCC-14, but not with GCC-12.  I have not bisected
>> further.
>>
>> Either way, the types for __lock_profile_{start,end} are incorrect.
>>
>> They are an array of struct lock_profile pointers.  Correct the extern's
>> types, and adjust the loop to match.
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks, and I've got proper Reported-by tag from the conversation on Matrix.

~Andrew

