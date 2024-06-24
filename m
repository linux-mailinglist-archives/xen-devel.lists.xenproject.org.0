Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3262914F8C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 16:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746672.1153793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkL9-00068F-Oj; Mon, 24 Jun 2024 14:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746672.1153793; Mon, 24 Jun 2024 14:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkL9-000667-M9; Mon, 24 Jun 2024 14:06:39 +0000
Received: by outflank-mailman (input) for mailman id 746672;
 Mon, 24 Jun 2024 14:06:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLHn=N2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sLkL8-000661-5p
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 14:06:38 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f78fd6e6-3232-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 16:06:36 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6b5253ffd24so10609166d6.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 07:06:36 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef6e795sm34003766d6.141.2024.06.24.07.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 07:06:34 -0700 (PDT)
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
X-Inumbo-ID: f78fd6e6-3232-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719237995; x=1719842795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=imOiZ7CuJB5aMTBnxc3MrW9G27H52CpIPfYGY0PN8JY=;
        b=cirvNAHBNCIjw+KlqpGtij3PnxPbz4u8gbYLKN2j0ny/jOQ/kQTu5inyQL4JuVUkxf
         EgVdw+VytU9Q3eUOBztCUnmqWw0Ru65lod6wrLFiogrhcQIQMIJ5OPGIa3od7tqYpoVB
         ax0SyqcUDQa6shAeaz+DPNWjYtGfBVPWz8FQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719237995; x=1719842795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imOiZ7CuJB5aMTBnxc3MrW9G27H52CpIPfYGY0PN8JY=;
        b=Y83DqYXqFzEDF6ES6mNPCdP5hM0ps2AFaKZfgwK/GsKq3+dPFTwrphr8j625dF+1Bk
         cEoNgsK4fd0Vq3a+PAdCJqVvirQp0ZugNl9ZKl4kBKEcSSYHRoguZzXfNRzi9ujH4izU
         Sca9GehmHAtEBQNSzK6kPYwQLyS9Y4SgurpT7BoiYotK9dL23ZAsOtKcHLyQ18Us272l
         Ep1fKmhR3pIobJy32nBqpWbhXfZgzsNy4NgRn+uVuRx8iPCOJ3KhZOtbjTC+POg/B+8A
         ExrCTK7xlaHFORx/ZBUIbBsNqAF8UQqlUQcuGiTc1v5O/avZ/vS96q2JdwkZbwpMhRKb
         lB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNnESIsiEiJiMVoLXslpJzObErEPpYSPc1bs8JKAxSApgx0ZddFV1H1SPn8VEWhro8M3Q2/dQKlk0PqBpIQatDKo0RdlZYV0jzalasvNo=
X-Gm-Message-State: AOJu0YwsdcmDECsCxTnONdI+JzxMr8jtBZvagzcXCeaZBwuApktuNUVI
	i8OoFltim9HxOKplPB9hCnU4ZYuAJMc4FJP1tLnY2LtiQMQcQqzk+kGhLr2G30Y=
X-Google-Smtp-Source: AGHT+IE0Lux+2Z+lGwXTmLtrrBF1Fn3tWEl+sNV2yAJiQhnsRn9sF/ZiXuBESXDW6ebSLBVpb2m/PA==
X-Received: by 2002:a0c:f0d3:0:b0:6b4:f6f6:bf39 with SMTP id 6a1803df08f44-6b53635e007mr58818476d6.2.1719237994931;
        Mon, 24 Jun 2024 07:06:34 -0700 (PDT)
Message-ID: <309d5dc1-833c-4f28-8010-b41968942035@citrix.com>
Date: Mon, 24 Jun 2024 15:06:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xen/xlat: Sort structs per file
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
 <20240415154155.2718064-3-andrew.cooper3@citrix.com>
 <21436a56-f9e0-4700-8216-3bfa4094cc01@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <21436a56-f9e0-4700-8216-3bfa4094cc01@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/04/2024 10:00 am, Jan Beulich wrote:
> On 15.04.2024 17:41, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> While I don't mind the change as is, "sort" is ambiguous here in one regard.
> Personally I'd prefer if those parts of the change were dropped, but I can
> live with the sorting criteria being spelled out in the description:
>
>> @@ -40,13 +40,6 @@
>>  
>>  ?	cpu_offline_action		arch-x86/xen-mca.h
>>  ?	mc				arch-x86/xen-mca.h
>> -?	mcinfo_bank			arch-x86/xen-mca.h
>> -?	mcinfo_common			arch-x86/xen-mca.h
>> -?	mcinfo_extended			arch-x86/xen-mca.h
>> -?	mcinfo_global			arch-x86/xen-mca.h
>> -?	mcinfo_logical_cpu		arch-x86/xen-mca.h
>> -?	mcinfo_msr			arch-x86/xen-mca.h
>> -?	mcinfo_recovery			arch-x86/xen-mca.h
>>  !	mc_fetch			arch-x86/xen-mca.h
>>  ?	mc_info				arch-x86/xen-mca.h
>>  ?	mc_inject_v2			arch-x86/xen-mca.h
>> @@ -54,6 +47,13 @@
>>  ?	mc_msrinject			arch-x86/xen-mca.h
>>  ?	mc_notifydomain			arch-x86/xen-mca.h
>>  !	mc_physcpuinfo			arch-x86/xen-mca.h
>> +?	mcinfo_bank			arch-x86/xen-mca.h
>> +?	mcinfo_common			arch-x86/xen-mca.h
>> +?	mcinfo_extended			arch-x86/xen-mca.h
>> +?	mcinfo_global			arch-x86/xen-mca.h
>> +?	mcinfo_logical_cpu		arch-x86/xen-mca.h
>> +?	mcinfo_msr			arch-x86/xen-mca.h
>> +?	mcinfo_recovery			arch-x86/xen-mca.h
>>  ?	page_offline_action		arch-x86/xen-mca.h
> Imo this sorting was fine (at least one further instance below): Whether
> underscore sorts ahead of lower case letters depends on how sorting is done.
> I take you assume sorting as per the C locale,

Indeed.

> when the original sorting was
> considering undercores to be separators, i.e. in a different character class
> (together with e.g. dash or tilde).

If _ is expected to be a separator, then the correct sorting would be:

mc
mc_fetch
mc_info
mcinfo_bank
mcinfo_common
mcinfo_extended
mcinfo_global
mcinfo_logical_cpu
mcinfo_msr
mcinfo_recovery
mc_inject_v2
mc_mceinject

which is definitely not what we want.  This came specifically from
`sort`, not something I did by hand.

`LANG=C sort` gives the ordering presented in this patch.


>
> When using C local sorting, I think arch-x86/xen-@arch@.h also would need
> moving past arch-x86/xen.h (whereas right now all separators are deemed
> equal and hence @ comes ahead of h which in turn is ahead of m).

`sort` agrees, so I'll do this too, and note it in the commit message.

~Andrew

