Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F228957E1
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 17:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700199.1092949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfmP-0007LV-QP; Tue, 02 Apr 2024 15:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700199.1092949; Tue, 02 Apr 2024 15:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfmP-0007Jo-NZ; Tue, 02 Apr 2024 15:10:29 +0000
Received: by outflank-mailman (input) for mailman id 700199;
 Tue, 02 Apr 2024 15:10:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l5ae=LH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rrfmO-0007Ji-UC
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 15:10:28 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22d5b6ba-f103-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 17:10:26 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a468226e135so636804666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 08:10:26 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a1709060d9800b00a46be5c78f4sm6713514eji.142.2024.04.02.08.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 08:10:26 -0700 (PDT)
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
X-Inumbo-ID: 22d5b6ba-f103-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712070626; x=1712675426; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DYP8/I4Ll0Z6yAcTc58VN9ImH6/L6Y/xoyTH1SZzcHc=;
        b=gc/tqeztnzahWTimrDovFEqf52RuhEj1R1TnaSbQpO2rRvui92CoZpxWj8gYAq/WN9
         nm/3MIy5mxx1cOnoji4Ysx93L/XNIG8uLhaw6abWiKOi/VaCVgl5RksBV7bwmcCTHPOj
         z6MLgkD6PVQWTkUv6DRQePxVRWXbpZFUjjByTSmdzfeXBILOLIEqN52o0tWBUbbOnyS/
         V/a/Tmafel5a14ED61UvvNR417LEu1uAS3ea5fNvVUiTwgoN/oqr/rH6/TKesC/P/taN
         CRqrRseVDODmm44TPtOdjov4JvK2Y+a2ilQNDP1YRXmt0/3DGC6E2faafNVPlz0c+CKG
         /GDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712070626; x=1712675426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DYP8/I4Ll0Z6yAcTc58VN9ImH6/L6Y/xoyTH1SZzcHc=;
        b=LgKo/6mDNC+3sP19tt+n6SswoyDMhZvI4NG0lOSp+wDV45IRBKN8yKsF9SpDPVGOkI
         xxwRYm8aL4auOW4Gk6/jgA8Hn1xSlY8VeJXO5Z8DGs8CbbscDr3KIex1unhki3GPPEnB
         p6amHyu0PlINSVbd+Xo9SbzkU5kMmMVXHdOaE4a/fCxqethFsLixhO0NuVzya+KFHucd
         mxwYmHUr/eL/X39Tir4glSJbO1qec2qVTqaK5VSiV0ig3FhiwjoOL2nNheFNDjOWS1r4
         j+C4LxOiWFml4w/0yZao/oqE3BpqB3i/lqbUM9+J1jOHVIVA7BsOabAD4QwUPhH6DLYm
         ni2w==
X-Forwarded-Encrypted: i=1; AJvYcCVsA+MC0XhvQZ18ocUQ/zbQ9R1Y/Er4Zvb0vB9BTxympUrgJwznRgVnvxKGBQpN58xXVelSnhh7aCazu8+/pj2BMQh1NNWwf2/vMIz49l4=
X-Gm-Message-State: AOJu0YzCRi5wVsaOMksP2rmsa2/THXOnSKthuqxa3O6VeVrm9e4ew8Eq
	bvMK0tPidueUN2LEUpMTfsMemTfXnBz5R8NUDFGT7eITJSfgtQO/tmFjd+eI2+A=
X-Google-Smtp-Source: AGHT+IEcAOLcnLFzWwWmClsgn9WW7EH5SWQZOfQRqMSxZ6NYBV4tt+1kiLiMaEwzP5EFlpAj/kKl6w==
X-Received: by 2002:a17:906:512:b0:a4d:f98e:dc3e with SMTP id j18-20020a170906051200b00a4df98edc3emr7925616eja.12.1712070626257;
        Tue, 02 Apr 2024 08:10:26 -0700 (PDT)
Message-ID: <b7f0f386-f367-4b76-beac-1521a89c200b@suse.com>
Date: Tue, 2 Apr 2024 17:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] xen/spinlock: support higher number of cpus
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-7-jgross@suse.com>
 <6b5316a3-2920-4589-9e91-2de148c482db@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <6b5316a3-2920-4589-9e91-2de148c482db@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.04.24 16:42, Jan Beulich wrote:
> On 27.03.2024 16:22, Juergen Gross wrote:
>> Allow 16 bits per cpu number, which is the limit imposed by
>> spinlock_tickets_t.
>>
>> This will allow up to 65535 cpus, while increasing only the size of
>> recursive spinlocks in debug builds from 8 to 12 bytes.
>>
>> The current Xen limit of 4095 cpus is imposed by SPINLOCK_CPU_BITS
>> being 12. There are machines available with more cpus than the current
>> Xen limit, so it makes sense to have the possibility to use more cpus.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit I have to say that I'm not entirely convinced of ...
> 
>> --- a/xen/common/spinlock.c
>> +++ b/xen/common/spinlock.c
>> @@ -485,7 +485,9 @@ bool _rspin_trylock(rspinlock_t *lock)
>>   
>>       /* Don't allow overflow of recurse_cpu field. */
>>       BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
>> +    BUILD_BUG_ON(SPINLOCK_CPU_BITS > sizeof(lock->recurse_cpu) * 8);
>>       BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
>> +    BUILD_BUG_ON(SPINLOCK_MAX_RECURSE > ((1u << SPINLOCK_RECURSE_BITS) - 1));
>>   
>>       check_lock(&lock->debug, true);
> 
> ... the two additions here: The two checks we had verify independent
> properties, whereas the new ones basically check that struct rspinlock
> and its associated #define-s were got right. We don't check such
> elsewhere, I don't think.

I think we do.

What about:
   BUILD_BUG_ON(sizeof(hwp_req) != sizeof(hwp_req.raw))
checking that two union elements are of the same size (and both elements don't
contain any other structs).

Additionally it is not obvious at a first glance that SPINLOCK_CPU_BITS defined
in line 11 is relevant for the definition of recurse_cpu in line 217.

Regarding the second added BUILD_BUG_ON() there was a comment by Julien related
to the definition of SPINLOCK_MAX_RECURSE in V4 of this patch. We settled to use
the current form including the added BUILD_BUG_ON().


Juergen

