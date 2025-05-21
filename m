Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424AFABEC50
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 08:47:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991518.1375354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdEv-0006c9-Ub; Wed, 21 May 2025 06:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991518.1375354; Wed, 21 May 2025 06:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdEv-0006a6-Rj; Wed, 21 May 2025 06:47:45 +0000
Received: by outflank-mailman (input) for mailman id 991518;
 Wed, 21 May 2025 06:47:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHdEu-0006Zw-Fc
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 06:47:44 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e7b9f03-360f-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 08:47:42 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad5a11c2942so174545866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 23:47:42 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d443a0fsm862394366b.97.2025.05.20.23.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 23:47:40 -0700 (PDT)
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
X-Inumbo-ID: 7e7b9f03-360f-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747810062; x=1748414862; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8oIyxLaLhYf99A7W6NRo575+3iDSO5yqjANehu8DAw=;
        b=cKhULXh7mp63uoKafnxliVFgnG9oFTX+peZzMiA0O0IA5BkYldbRmD921kD+pF2FN1
         7acKy8PK1I13HEPtu5eSebXniphkO78ngQwbpZ4l8OR2VC7+mIOtETMUU/z0YOepZxHf
         QWwg9u9M8bEXr5VE5/5I5uCfbVcI59BDP2pkKsDqcfRL8kgjwprWIp36QaprZ+vAhEaK
         bkhSZrC0hWq1N/fBWUSwR+WiS1VO/L/3L0RB12R45e8nBR7yjpEROIruerm0d0+hFtJw
         0aQH3feBn/U4Z/iPtNWG3lu9lBhQdP+qcGefjiQi0cG/dE2PulbML81NOBHqXvXtAcog
         Nj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747810062; x=1748414862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8oIyxLaLhYf99A7W6NRo575+3iDSO5yqjANehu8DAw=;
        b=NJCMRXceSPacSh5+wCuppYAE6ct6Q/7CmzmVOf38MHEeKcagEXO9rID6i7l4bZRoLq
         Eav49GN+PLban8rN26lm74J/VadbnQHH+vFqMvuRmQUXFXvgv1NCxleaULNiYy6SKVXL
         azNhVzD5gj3YoiDQ3xG0Lw5MOzYuNEkAlbpNcH5J8cQRTbDbMwtVHDVUxWYgArkPEurP
         K/8VCk2NiIMAehfJVG5WbogyRqsFyJkS1sjLRVbcukus5vWVP7pC4yNoM+kdrsQCeuBY
         TghMtXpWb2R4ZCZsCF1hUwJ9RwBrh903q9oO9Jogf1xfWBgs/XdMyOEuvOPI+nfARhyv
         p88w==
X-Forwarded-Encrypted: i=1; AJvYcCUYIXrBqgjiR1/ZJNEcJfoGtDoPQ/NMJUlvoNZD7qsWNpyHK9ILfUROIb0bhBM+Saaa9hqi0ODsa5I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbUXxnU16mVbdwp8flwLuxpq9W7cVVtP12ekDo/1dAnHT3BBLh
	spf4NnAYMAumtZbFQjYrtzw/TYNs59Vb/KM9JtuTrSmXZ6RjrTYXbM8CkNQfCe5REg==
X-Gm-Gg: ASbGnctP3hasnsAyMEzqKtIaHrBNN/94BJX9PkzSH2U8q5a6dWXLxCfOCZniGZ+4jex
	tGT0i5KWtbDQw1moc6eA1JIuICxej2nsSdPv+um0K3FCLcxLQuA2+HUt812NWwchSNKo9WI+oLH
	oQza0kBFinz2iCJwUwNw6kG7sFshe1hX3ElXb6wUNzJC8AtM38aUwhirHjGG7Vb0qTyP02TBc2f
	qnPd9sm8MiTGPh6zpBDvmdTqm8KqE7FDZQ6lIoxQi2S2+ylb/pkFJ0tTwshV5Kx9HrZ16/o3ImP
	hOCuRD0C/MwYfni13TEwwYsK498LEatwxfchHuNf5Lr8Shw6e0jGkWbvzb9x9nUbYRMBe0gu
X-Google-Smtp-Source: AGHT+IFstWEh1wuLAoJaB/z3Qwc1Zk14lGFniVKzYgMAlaMFsKSwRQpjWYtVpgf94y/FbOTJfvBo8g==
X-Received: by 2002:a17:907:930b:b0:ad2:2e99:8d9b with SMTP id a640c23a62f3a-ad5370339c4mr1997903066b.58.1747810061846;
        Tue, 20 May 2025 23:47:41 -0700 (PDT)
Message-ID: <11021b35-826c-4e41-ad31-d6966dd0431b@suse.com>
Date: Wed, 21 May 2025 08:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/argo: Command line handling improvements
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Denis Mukhin <dmkhn@proton.me>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250520141027.120958-1-andrew.cooper3@citrix.com>
 <2a92e866-543e-404d-be34-d58cf5d51aec@apertussolutions.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2a92e866-543e-404d-be34-d58cf5d51aec@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.05.2025 20:45, Daniel P. Smith wrote:
> On 5/20/25 10:10, Andrew Cooper wrote:
>> Treat "argo" on the command line as a positive boolean, rather than requiring
>> the user to pass "argo=1/on/enable/true".
>>
>> Move both opt_argo* variables into __ro_after_init.  They're set during
>> command line parsing and never modified thereafter.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Christopher Clark <christopher.w.clark@gmail.com>
>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>> CC: Denis Mukhin <dmkhn@proton.me>
>>
>> Found while
>> ---
>>   xen/common/argo.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/common/argo.c b/xen/common/argo.c
>> index cbe8911a4364..027b37b18a6c 100644
>> --- a/xen/common/argo.c
>> +++ b/xen/common/argo.c
>> @@ -79,8 +79,8 @@ DEFINE_XEN_GUEST_HANDLE(xen_argo_unregister_ring_t);
>>   DEFINE_COMPAT_HANDLE(compat_argo_iov_t);
>>   #endif
>>   
>> -static bool __read_mostly opt_argo;
>> -static bool __read_mostly opt_argo_mac_permissive;
>> +static bool __ro_after_init opt_argo;
>> +static bool __ro_after_init opt_argo_mac_permissive;
>>   
>>   static int __init cf_check parse_argo(const char *s)
>>   {
>> @@ -92,7 +92,10 @@ static int __init cf_check parse_argo(const char *s)
>>           if ( !ss )
>>               ss = strchr(s, '\0');
>>   
>> -        if ( (val = parse_bool(s, ss)) >= 0 )
>> +        /* Intepret "argo" as a positive boolean. */
>> +        if ( *s == '\0' )
>> +            opt_argo = true;
>> +        else if ( (val = parse_bool(s, ss)) >= 0 )
>>               opt_argo = val;
>>           else if ( (val = parse_boolean("mac-permissive", s, ss)) >= 0 )
>>               opt_argo_mac_permissive = val;
>>
>> base-commit: 293abb9e0c5e8df96cc5dfe457c62dfcb7542b19
> 
> While it is logical, this does technically change the behavior of the 
> command line flag. Should there be an update to xen-command-line.pandoc 
> to clarify that the list is optional?

I'd view it the other way around: If you look at the neighboring doc
entries, we uniformly say

> `= <boolean>`

when the options can appear all by themselves. This would therefore be
the expected behavior for "argo" alone, too.

Jan

