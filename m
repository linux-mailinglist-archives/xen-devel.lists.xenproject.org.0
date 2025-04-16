Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE12A8B661
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 12:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955408.1349193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4zeQ-000606-QE; Wed, 16 Apr 2025 10:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955408.1349193; Wed, 16 Apr 2025 10:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4zeQ-0005xE-LG; Wed, 16 Apr 2025 10:05:50 +0000
Received: by outflank-mailman (input) for mailman id 955408;
 Wed, 16 Apr 2025 10:05:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4zeP-0005x8-DP
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 10:05:49 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e5b1c55-1aaa-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 12:05:48 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so60396715e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 03:05:48 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9797aasm16837498f8f.56.2025.04.16.03.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 03:05:46 -0700 (PDT)
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
X-Inumbo-ID: 5e5b1c55-1aaa-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744797947; x=1745402747; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IkbvnXU5NNRoFxPT9gxqvG86YAELyV+PlP/FaUD+EBI=;
        b=mKoK95f3RXw3+Bnuiph5KUwpGIBM++BhIxBJ4Oks616No+xz9gE6SuZPFKDxc+vLw1
         MGWtLix6MLnP1cqXejfqWVhFh5px01IhAbbP5lYB49THDKJKiGGOsOifGIpsSl0dGNGu
         qj/YUgBhXvpHOjQASr9bI4iY48v8u9Xi3wbHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744797947; x=1745402747;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkbvnXU5NNRoFxPT9gxqvG86YAELyV+PlP/FaUD+EBI=;
        b=SRd9DnGNibMvxCwkL9tt7YycrQFph68AhJuXJgmslZ0sTLpkvaFxSk02YQ2DSpf5DN
         ehAgsdbgULKzW9I+QZjZSNAiyXitKwkJkaUng5Xi+/Frk6xfgIFY6Z33GThFgR9lkHqT
         XfDH8X5c0LKVrYU4t6E6yK166wTVTsl9QHr3xHAgNaEYVOrU1KDAM8KK2pumpb5282xp
         9QJsV399/gWyelvdHit3YlILcd/DmHahEPollJaQMEXilDOR5Ods61za2OMYEg7orbIS
         nPrVzl4iHrqTTQz0guCxr3VI8ZhQ+zaKKwTF1n9RygHdJ3wU45r6UrBtdyRoBwdoT1JY
         HQCA==
X-Gm-Message-State: AOJu0YyiBYST+BzZh2m/dDEPiw5/G0So0u4llljEBaG8KYS31IeeEzKz
	i6cS4t00967ZZdxUpzpH+CIxjdSr7mHz1T5yKIhegi/y6+8Nnz3IHvhKVpK8I5M=
X-Gm-Gg: ASbGncvcnXQNjVfEL2WYNbg6uRk0PAv+dTOgG2is/bO3VMuLcAjamyNvE3Kuw+QHxuD
	gEjZQaMr29dZcLzShvMxbIlrmn0SojxeffdwmMSOI5k9+1q5yHoH+TZGwdAC20ctxxqvBz7qkz5
	sxCweJOrSkRZwGpu5cgEv2epuZsxmvzKGHIJaRIIhRPzRY2Y3wOJmxFugESRsJQ1zl7QqU7PHNq
	2ToWGgeNybwjptet2EiiAPpc7ibtFed/BkA4X6yy5vlMQRLuC6ZxudCluUuk8zzKs/fi7NVynTc
	aJuoOlt5H2bpS4C1iP4W4ceT8D4EDWhgT6/ep5hsUWii0LcjM7r2KPP7u1A9qu6CJdPhThjD1nz
	IrtBnpg==
X-Google-Smtp-Source: AGHT+IHqfHgurAAogrNZDGgncHeT4ywevh0Vl8LOS24CssZE5hdHcOvz/GnQNKdCB1rq0FxcG87kzQ==
X-Received: by 2002:a05:600c:3b91:b0:43c:fbe2:df3c with SMTP id 5b1f17b1804b1-4405d69b737mr9429775e9.26.1744797947319;
        Wed, 16 Apr 2025 03:05:47 -0700 (PDT)
Message-ID: <2e2156cc-1bf0-4585-bb31-faca5321fec3@citrix.com>
Date: Wed, 16 Apr 2025 11:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] CI: avoid repacking initrd as part of the test job
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
 <20250414110903.2355303-3-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2504151637100.8008@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2504151637100.8008@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/04/2025 12:48 am, Stefano Stabellini wrote:
>> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
>> index c4be71464246..e2376cb51cb4 100755
>> --- a/automation/scripts/qubes-x86-64.sh
>> +++ b/automation/scripts/qubes-x86-64.sh
>> @@ -164,16 +164,13 @@ ${domU_extra_config}
>>  "
>>  
>>  if [ -n "$domU_check" ]; then
>> -    # DomU
>> +    # DomU rootfs
>> +    cp binaries/rootfs.cpio.gz binaries/domU-rootfs.cpio.gz
>> +
>> +    # test-local configuration
>>      mkdir -p rootfs
>>      cd rootfs
>> -    # fakeroot is needed to preserve device nodes in rootless podman container
>> -    fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
>> -    mkdir proc
>> -    mkdir run
>> -    mkdir srv
>> -    mkdir sys
>> -    rm var/run
>> +    mkdir -p etc/local.d
>>      echo "#!/bin/sh
> I am worried about the drop of fakeroot because the newly created dirs
> and files we'll have user as owner instead of root.
>
> I suggest we fix this for consistency, and cpio -R 0:0 might suffice.

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/9737393986#L1087

It seems to be all root anyway.  I'm not entirely sure why, but it does
explain why everything is working, given the attempt to have non-root
containers.

~Andrew

