Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F49A87DCB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 12:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949656.1346144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HCh-0007FL-BH; Mon, 14 Apr 2025 10:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949656.1346144; Mon, 14 Apr 2025 10:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HCh-0007Dt-7E; Mon, 14 Apr 2025 10:38:15 +0000
Received: by outflank-mailman (input) for mailman id 949656;
 Mon, 14 Apr 2025 10:38:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4HCg-0007Dl-Cg
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 10:38:14 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 907a8081-191c-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 12:38:12 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so2099984f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 03:38:12 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338d802sm180872195e9.1.2025.04.14.03.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 03:38:11 -0700 (PDT)
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
X-Inumbo-ID: 907a8081-191c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744627092; x=1745231892; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Acx+KO/gVIk6/mm+QAT0M8yMwsFMyYGRi1702nboM5E=;
        b=sknx1taDTMpKYaEsg7sn0VXY8YZwC/55FqKZQLRMuynhA0RI6FgGCnS7fZwGZ8/4Ew
         0hm1xbTMNN73aF5jKU3GVzQlwKGlwLvQt1KvtwfQnioAMY5UWNoKLqdp5mpqs5wBvjpo
         8CWFkpI2dUMh6inOAQi/F1dKb8DESBc0F0sP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744627092; x=1745231892;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Acx+KO/gVIk6/mm+QAT0M8yMwsFMyYGRi1702nboM5E=;
        b=KOidZErVFTUbU/pyTqPhPMH5cOo7Be6XvXchlaItPuhs+75IuxryewSF4b9T1IWZr3
         bNzePshUwhV+edvZ+D10ziBeecW/sm5ruNmrMBgNX2XxAWE6KrEgRi+6Q4FlYTNsXZDO
         P3snSmNf7U3ue87k4gJfF496q70X5f28NKYi/CXoTiYsmu7Z8tsu9qOgu/nbK2yee/EC
         1tMIiSgLfaOtwIdNmQTLB7JFGVkafakpWNpR+cE0nV/VXKSZz87/htYQQrbSCVq7AoKg
         jnTVOhXXGb/iXIngE4eeeXnQ55Rmfl7UvPBMIkTmJFLwQp/IKFOR+bzuJkjQMxwvLce1
         7x8A==
X-Gm-Message-State: AOJu0Yy0V24Ywt6dfeIBnoHN6JaS6HRTWuCZHHTay0alXBc3DOXOBSwL
	SZWR5GT4cVwkoFTCjHtMOWprBKWwGozDp7c9VoC2HAZdPFMO0xF+rDYgE4BLCIQ=
X-Gm-Gg: ASbGncu3Lz4yhy2o4+W0H9aoueWNwepU+dlRqXRDhXahD/DFdBGepGx/uMG8ItwS2SD
	SNnr2wxb+8zHyYuH4ayuDvOsrreTktkVm62gZENYgpzjEmBlftQMrbSuerEkgIAStsXQ9+KEZ3I
	jsZryhp7/N5eBcfkuggjo3dTBEF/z/sdFlwrPx5vPBLdI1IZirc8KUKXxdnjrVHrlZL0gIUJHzM
	ETiNQZRA9WMT7gCmvOY25JTqrfxnuDQq9q9eklFsvSjcEDM5DKq+yzAbpYqoP31GIPKgUnOBCV5
	yXfWnahc86Ez8PdAns+DaUTjqYGAyP/xsHJMEpeWyYlKIiX7ySFcW1u5mVoWdJboP4N8m2CoCl7
	JXRcefg==
X-Google-Smtp-Source: AGHT+IFv6v3JPss2LbXIo/+KKQ5Ay5Z7CpxAV4j3OH0aMSt6mnYCgNmZCGkIofJh+LQ05uRvUfZvNw==
X-Received: by 2002:a5d:584a:0:b0:391:ab2:9e80 with SMTP id ffacd0b85a97d-39ea52176ccmr8556666f8f.24.1744627091710;
        Mon, 14 Apr 2025 03:38:11 -0700 (PDT)
Message-ID: <f556fcc3-463d-4e3d-af41-335841a44c12@citrix.com>
Date: Mon, 14 Apr 2025 11:38:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] Overhaul how Argo is built and packged
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
 <20250414101843.2348330-3-andrew.cooper3@citrix.com>
 <Z_zlAKOMjbrw_5bS@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z_zlAKOMjbrw_5bS@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/04/2025 11:35 am, Marek Marczykowski-Górecki wrote:
> On Mon, Apr 14, 2025 at 11:18:38AM +0100, Andrew Cooper wrote:
>> --- a/scripts/build-linux.sh
>> +++ b/scripts/build-linux.sh
>> @@ -8,7 +8,7 @@ fi
>>  set -ex -o pipefail
>>  
>>  WORKDIR="${PWD}"
>> -COPYDIR="${WORKDIR}/binaries/"
>> +COPYDIR="${WORKDIR}/binaries"
> Is this change intentional? It has worse failure mode if "binaries" dir
> wouldn't exist for some reason...

Yes it is intentional.  It causes problems when we derive new variables
from COPYDIR.

binaries/ always exists.  It's in the base repo.

~Andrew

