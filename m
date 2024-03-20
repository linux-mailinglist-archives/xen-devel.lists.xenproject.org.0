Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2018812EE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 15:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695939.1086294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwaP-0004Md-Ub; Wed, 20 Mar 2024 14:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695939.1086294; Wed, 20 Mar 2024 14:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwaP-0004JG-Ri; Wed, 20 Mar 2024 14:06:33 +0000
Received: by outflank-mailman (input) for mailman id 695939;
 Wed, 20 Mar 2024 14:06:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FoSn=K2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmwaO-0003uK-6h
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 14:06:32 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d31de53-e6c3-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 15:06:31 +0100 (CET)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-690caa6438aso39482686d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 07:06:31 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gw15-20020a0562140f0f00b00690c14810c2sm7923491qvb.126.2024.03.20.07.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 07:06:29 -0700 (PDT)
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
X-Inumbo-ID: 0d31de53-e6c3-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710943590; x=1711548390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BkBnxVF0udR67jOfrrXIuKFXssEKOQ+DddsXbOEkiYY=;
        b=l8ubKoRBkRDSNZMrK45yBt4hVC4jImdt4Xx1XSXCNIQTDSVFktAmPGAysMiMlQdHJb
         plsEH3GGtNvn/9aHXOj26qFQV3YV7GTMX83bz6JG10VLJM8lXw9peUsRRHTwA8/4cx3w
         EQ6ODxwfolsTgCz3Jk3SRs7em4o7cRhEmol8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710943590; x=1711548390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BkBnxVF0udR67jOfrrXIuKFXssEKOQ+DddsXbOEkiYY=;
        b=GFHfu+/Gbm3beq7P/uxcN1ykxsHRdQjcI4cbeThXbFKLENrSIt1VK1gpm6YRJS2Hlj
         jE91qkzaSUz07leSprRZmH2XbO+LjxiyEbVsRR/SdDd/+di4DFM1aRfwMnQUcwkDgV16
         J/PPVJvtJkl2rUAiS8rYPtENEZP158z89zYqaRcgNbYh9n+3mv0+MQ81tlTxbU5L21T2
         WhRslPHmsGIQ39IAURFWqdCCpgTAOfRWjVMAkdp8jnOrZEwsnOyckRa96PHxkJnkE3RB
         HGQDplXkB5EDwb0OyXxJPq0XCuQZjZYVpFTmatJ0wPnUVhFyBwGGPGMCuL5nI3SFDeR9
         +U3w==
X-Forwarded-Encrypted: i=1; AJvYcCUsIYoSggvBO5bAar1ZPKzRDomKIHEKFkJfP9a/MjGx3pmf4MTC5hx1n24NgBDKFS0e3tTSkPYXnUMBekCoGL+15Bm08vULhX71QhdgJSI=
X-Gm-Message-State: AOJu0YwRe9locwWcV0CRSHw6jfDOcno/9dityOlDjqIeRQSTXrFSmd4/
	fxpl7NWwC7ijw9T35hxKj9COWQFyKcKfJ0RmUXi90JBRjlYOI8ylwU6ckzR2A80=
X-Google-Smtp-Source: AGHT+IEL/0diGZvBoMG3uEAC4L7D/n9IgLs4z0Xtv2oxKRWVCmRQdRWgQFg7uG2DCiddYPkWzFLNSA==
X-Received: by 2002:a05:6214:88a:b0:691:2356:e82f with SMTP id cz10-20020a056214088a00b006912356e82fmr18925824qvb.54.1710943590302;
        Wed, 20 Mar 2024 07:06:30 -0700 (PDT)
Message-ID: <1304a0d2-ff17-4823-9d31-c32eb7b79f30@citrix.com>
Date: Wed, 20 Mar 2024 14:06:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240320135720.68894-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240320135720.68894-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2024 1:57 pm, Roger Pau Monne wrote:
> There's no reason to force HVM guests to have a valid vcpu_info area when
> initializing a vCPU, as the vCPU can also be brought online using the local
> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
> of the bring up.  Note an HVM vCPU can operate normally without making use of
> vcpu_info.
>
> Restrict the check against dummy_vcpu_info to only apply to PV guests.
>
> Fixes: 192df6f9122d ('x86: allow HVM guests to use hypercalls to bring up vCPUs')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks for looking into this.  But, do we actually need to force this on
PV either?

The only interesting user of dummy_vcpu_info now is vcpu_info_populate()
which can cope with any arbitrary vCPU.

I have a suspicion that we can (now) delete these two checks, delete the
dummy_vcpu_info object, and use a regular NULL pointer in
vcpu_info_{populate,reset}(), and in doing so, remove one of the bigger
pieces of PV-absurdity from Xen.

I can entirely believe that this is only safe to do with Jan's physical
registration changes in place.

~Andrew

