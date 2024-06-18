Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E48490CF1A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 15:24:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743094.1149992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYox-0002DC-3L; Tue, 18 Jun 2024 13:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743094.1149992; Tue, 18 Jun 2024 13:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYox-0002BX-0L; Tue, 18 Jun 2024 13:24:23 +0000
Received: by outflank-mailman (input) for mailman id 743094;
 Tue, 18 Jun 2024 13:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=An5i=NU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJYow-0002BR-2k
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 13:24:22 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 119eae25-2d76-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 15:24:21 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7955841fddaso442602185a.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 06:24:21 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-444a743c42esm20831cf.79.2024.06.18.06.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 06:24:18 -0700 (PDT)
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
X-Inumbo-ID: 119eae25-2d76-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718717059; x=1719321859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lcFO7b8bjtTpIe4yE5niynAMbFBLfap9jFo4QsJAN/0=;
        b=rzOnbGrqjYosBIAlchDjBVscsXFLlSmg+99p9OsQ9L6owDYBTJqzMuvT9Qu8F+P2Cp
         wG4RT55hpo0CzXKsajt9WcllkUUHGq3DflmXu2jysX8dMEjirPBO2nt/jUp+CBwq9nfg
         JLOt8sK68UEb/7yFLIEzjxyX9FEZu5MIi0dHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717059; x=1719321859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcFO7b8bjtTpIe4yE5niynAMbFBLfap9jFo4QsJAN/0=;
        b=vGfV3eWAKd5Xua4+A0z3ksJTTOTGaI9eivPEmTn+Y/CP2IzZPj0gP6Jop9+Bi55uxO
         +5oYEh/G3/OQzG1lpOMjhzb5g4gK/Oynt4gWjFLwN3tAzX+BySXc0GfsRXKGxb5EvDIj
         x5fY5YsEp90xtXEZKEdy7t69ostR7VcBVtJi8ZCIvhOXC8RqGKhkm/hidEtTaNJHLW/l
         YYPog8X8Pn2BXly1tIyDn4v2mQdwMKVaifR30e+Q78yQ2Px9j0Gryn6JdxXfK03MgiP8
         wbXLrTS59y3QWNCW3lJ+VaM9xKJ3ebEPtZFK0ckIOk0XwwwCSb/bs119MYhfyYKB4uqz
         se3A==
X-Forwarded-Encrypted: i=1; AJvYcCVUIu42eABmLTfMCaayI9vu8zVUkIKmNFrobFFqa1GijiAeadESr+Ma84HpqC7+cX2yV25C05fbWbJV6ZCg/Cfd+yE5+taVGYDSpeaMnIw=
X-Gm-Message-State: AOJu0YwWcAMTrlX0VZBlD7ZGA5yQbd1KJRMqDWiGuKHlFEknp3u/BVo9
	I6ALqiwfPYspD3IUq5CR3oEIm4NbrCxajFbHPTTO0YktY1JSk8b1I7c2Qv18ej0=
X-Google-Smtp-Source: AGHT+IG1BkgppzIm2PDNhGWLdLvFwmDNrCGqrixYYe6BUwlMKwgZsGdfZQfN4SnLjai8q1AtbP6MUg==
X-Received: by 2002:a05:620a:4507:b0:795:5f15:f9e8 with SMTP id af79cd13be357-79ba7738442mr379307885a.31.1718717059160;
        Tue, 18 Jun 2024 06:24:19 -0700 (PDT)
Message-ID: <13a5650d-8623-4fec-9383-ef04023257ff@citrix.com>
Date: Tue, 18 Jun 2024 14:24:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] avoid UB in guest handle arithmetic
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <227fbeda-1690-4158-8404-53b4236c0235@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <227fbeda-1690-4158-8404-53b4236c0235@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/03/2024 1:26 pm, Jan Beulich wrote:
> At least XENMEM_memory_exchange can have huge values passed in the
> nr_extents and nr_exchanged fields. Adding such values to pointers can
> overflow, resulting in UB. Cast respective pointers to "unsigned long"
> while at the same time making the necessary multiplication explicit.
> Remaining arithmetic is, despite there possibly being mathematical
> overflow, okay as per the C99 spec: "A computation involving unsigned
> operands can never overflow, because a result that cannot be represented
> by the resulting unsigned integer type is reduced modulo the number that
> is one greater than the largest value that can be represented by the
> resulting type." The overflow that we need to guard against is checked
> for in array_access_ok().
>
> Note that in / down from array_access_ok() the address value is only
> ever cast to "unsigned long" anyway, which is why in the invocation from
> guest_handle_subrange_okay() the value doesn't need casting back to
> pointer type.
>
> In compat grant table code change two guest_handle_add_offset() to avoid
> passing in negative offsets.
>
> Since {,__}clear_guest_offset() need touching anyway, also deal with
> another (latent) issue there: They were losing the handle type, i.e. the
> size of the individual objects accessed. Luckily the few users we
> presently have all pass char or uint8 handles.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

There wants to be a xen: prefix in the subject.

But as for the UB aspect, I've checked that this does resolve the
failure identified by the XSA-212 XTF test.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

CC'ing Oleksii as this wants to go into 4.19.

~Andrew

