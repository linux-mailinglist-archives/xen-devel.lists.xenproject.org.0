Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 535183264AD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 16:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90401.171116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFezG-0000Vy-6p; Fri, 26 Feb 2021 15:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90401.171116; Fri, 26 Feb 2021 15:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFezG-0000VZ-3B; Fri, 26 Feb 2021 15:25:02 +0000
Received: by outflank-mailman (input) for mailman id 90401;
 Fri, 26 Feb 2021 15:25:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ro2M=H4=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lFezE-0000VT-RT
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 15:25:00 +0000
Received: from mail-pj1-x102a.google.com (unknown [2607:f8b0:4864:20::102a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3a00cfd-a106-4ff8-9a8e-d1edf749c8dc;
 Fri, 26 Feb 2021 15:25:00 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id e9so6302104pjj.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Feb 2021 07:25:00 -0800 (PST)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id o11sm10181377pfp.136.2021.02.26.07.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 07:24:58 -0800 (PST)
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
X-Inumbo-ID: e3a00cfd-a106-4ff8-9a8e-d1edf749c8dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0bWZZkklmiX/hLGaS61TrZAqbCz/hhH6RbD6Omwvgm4=;
        b=AD0lib1g1Bf7ySw3S8Bxi7iBZ15pgJ+PG5Njr0j4i9v7DCSdh3OQFmm0EOSmZVMMBh
         YozfiaP7H0rtIkfPmHNs+tNIfX8/z3outy88bhOJEkaooFZLaV4gY7GpHxLO9gKvcAzx
         KQWAtkXgXi3ZZcLyxEBPP7O+Nl6TfWv4yNdrMJ75CRQJbKxHiAKi/mCEm21eLtfDZSbf
         lY/G8ln1VcWXxta47o+Yv12yzyPiAFgCptiQSNGrvaHhoGZCBknAOCc3FOs8vBMGlpqr
         pX6/YGEW4kVL7kOlVM03KfHm8UUdohivz1hwUEoibLRHeIm5bFSzulw7naHXMcp9T1/G
         9Qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0bWZZkklmiX/hLGaS61TrZAqbCz/hhH6RbD6Omwvgm4=;
        b=oO1f6dVsUZpID6MJ1/LNW7VzgCZ/mTf5QKjAsNEbo1E3a4rzIBxKMAeHo4xKTd/hDz
         R63hEvU7awnPoopMvW2b3W7lRaPmNuZ43BxE6F8Q9MMm69I0VQGMFb7rZzfDTRjXZeIm
         bNFUmZKSmf4peHcyFfaJnKmvITvByfuszJuwBrjYsyc7isqJyJTAZ2EVL2cmRR9rZPKS
         PdKtcwLJ+KQDXE40tE5pmzIUb1WcWNdMZOhAzvI5SqwYfXI9EpAkkBmh2t20TLiMU1MV
         6WzbU/N2kh4Ct+pKjNeH6EQ0qtXyNpPm2RS5vFxuVeZnzpLqwXFytNgrEl5o1YoCUqTX
         oTgQ==
X-Gm-Message-State: AOAM533SdviGaG2sPB82dzGGCca5I6y61er8f2JQpz1e7Y1iYW4PCd+E
	gMNB9JwDgumFUK9qC/iHATM=
X-Google-Smtp-Source: ABdhPJwRlrgxo43PpWA2ePB+f7NmPSPeNg+MzBCsT/PaWEGSoWPPDYqLAZqigxphl4qSxnGDheBGaw==
X-Received: by 2002:a17:902:9b93:b029:e0:a40b:cbd7 with SMTP id y19-20020a1709029b93b02900e0a40bcbd7mr3521638plp.16.1614353099368;
        Fri, 26 Feb 2021 07:24:59 -0800 (PST)
Subject: Re: [PATCH for-next 3/6] xen/sched: Fix build when NR_CPUS == 1
To: Connor Davis <connojdavis@gmail.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <d0922adc698ab76223d76a0a7f328a72cedf00ad.1614265718.git.connojdavis@gmail.com>
 <71840112-790f-24b9-115c-9030c8521b65@gmail.com>
 <20210226030134.lj3zi3duf33shoz7@thewall>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <bbb9415e-65f6-3930-f6c4-055cc5921cb0@gmail.com>
Date: Fri, 26 Feb 2021 07:21:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210226030134.lj3zi3duf33shoz7@thewall>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/25/21 7:01 PM, Connor Davis wrote:
> On Thu, Feb 25, 2021 at 02:55:45PM -0800, Bob Eshleman wrote:
>>   riscv64-unknown-linux-gnu-gcc (GCC) 10.1.0
>>
>> Which version of GCC are you seeing emit this?
> 
> The one from cloned from github.com/riscv/riscv-gnu-toolchain
> in the docker container uses 10.2.0
> 
>     Connor
> 

The commit I pinned in the container is actually for GDB only, since
more recent versions broke when used with QEMU at the time of writing
the dockerfile (this last June).

Since I built the container some months ago and no commit pinning for
the compiler, it still contains 10.1.0 for me.

It _shouldn't_ be necessary...  but since there is a lot of dev done
on riscv-gcc, it might be worth talking about pinning the compiler
version in the container.

-Bob

