Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B080FA784D5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 00:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934926.1336478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzkPc-0008Ph-UM; Tue, 01 Apr 2025 22:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934926.1336478; Tue, 01 Apr 2025 22:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzkPc-0008N7-QS; Tue, 01 Apr 2025 22:48:52 +0000
Received: by outflank-mailman (input) for mailman id 934926;
 Tue, 01 Apr 2025 22:48:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZod=WT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzkPb-0008Mz-9B
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 22:48:51 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aa76cd7-0f4b-11f0-9ea7-5ba50f476ded;
 Wed, 02 Apr 2025 00:48:50 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so66663135e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 15:48:50 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb5eb1d18sm2731625e9.0.2025.04.01.15.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 15:48:48 -0700 (PDT)
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
X-Inumbo-ID: 7aa76cd7-0f4b-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743547730; x=1744152530; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kkDE9LRh8C/HTprHzpu94nPRwBvjfgP2IHUdRGgltP4=;
        b=ksScTNWtLT1TBLhD8e402UcWDHOvQqTlWjgg8LK2xjyKg2LGbkiYf+NjF7ZRIrRvrC
         jA1VodDzlf+QffI2H+g7lCzzUvtoJ6L4COum3MKpkgYVX6MoUCSUpUOjUCp1Mu/Nzx7m
         o38Lo5E8dV6dw/GpY0pS81MFWonDsJnB+fZU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547730; x=1744152530;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkDE9LRh8C/HTprHzpu94nPRwBvjfgP2IHUdRGgltP4=;
        b=XlHAnWgRdbqxH/VQkOucHh9c5Ne8OZejgYpGbCicsk0hHC0JR0VWpAlBOcJfrfzXsW
         TbKID+JTtx8DEUCc+U32w+Pp845Hopthp6YIB9A3/4YS2OETTn4ziAgiVU6A4ijXF+u8
         QiFG222g5c1e/T7fQuQVVs6vn9nF+vJDcEa57tToKnGAos+tmfY7Y7hKLS35tcLpFvMv
         eAYG0teudQxMz3XaBKNmtTsu+Z/sNkM/ZBfXieKXM/LMD0GcIE0EtwxVvKBgdr9GsLVs
         usf6LRa7HG4xPnXaef5nmw6tUafQwhPR/9YAPks3T//w/QspM2/oWa1qk4m0iGNefmCy
         +iyA==
X-Forwarded-Encrypted: i=1; AJvYcCWnVrxQUYGZZWtpq0tb3j/Em2eePHGrgVeVM7dOsFy/EO3UsYLwlJTDHIp9pblhYXceSfxDOFfiOCA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlSMjc50jIzcVOU8nVJGC3yeja+gaYrsaZSfHwZDr1fmU/dhnq
	WUr+itwf4urr8JKm+IjY3osM2DiT4GN4RhgyLpEMR+fJ0RN50IqRBtzICPiQvnU=
X-Gm-Gg: ASbGncuuH40tg+jFH8JjT1/Z/kx7DvQQ0vrDSYV3YS3mKLkfVPOBB22FGEnD1QZnDqr
	BN/1gadzQ609hGLZGbWgoHb9mqRDVCJ0KN+tUYl0xd7gIyG77wbCuSb+03Im6ZMVuyGDCRDc997
	zn1yYZkKrA/al1kz9E4kFYPmqrKVWLvzYoSIOUDjA6zUGHm2Z2sbSxnzwnQ7Atv1BYXJo/Allv4
	2JxUiHa+Evj7+25KbAAB0aZn65PfXy9qRoc3jaPOAG/TEhkMzdjpueE0KRXhmb4vWuCNN7hDTnP
	qG2yv5U/QrOJ8BMp2e54b7aTX1lrNRCbhchSlfGesHG1aw8Qea9ZytewvK/zxiZs3pO8eCorO+3
	Y54Ih9+rBayrotX6pKlL2
X-Google-Smtp-Source: AGHT+IG5v/k5FTfTRq4uGdjfI/Wrl+hKomAcp9MRFWnRy5/FghsnZ8vEVNBi8g8zzDsSLIJKBY8EWg==
X-Received: by 2002:a05:600c:a49:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43e8e3d008dmr121571465e9.11.1743547729915;
        Tue, 01 Apr 2025 15:48:49 -0700 (PDT)
Message-ID: <df1091ad-6054-4527-91ce-56dae103c5c2@citrix.com>
Date: Tue, 1 Apr 2025 23:48:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] x86/asm: cleanups after toolchain baseline upgrade
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250401222105.79309-1-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250401222105.79309-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/04/2025 11:21 pm, dmkhn@proton.me wrote:
> Patches 1-4 remove various compiler workarounds in the hypervisor code
> for Intel's VMX instructions.
>
> Patch 5 removes compiler workaround for missing clac/stac instructions.
>
> CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1747394875
>
> Denis Mukhin (5):
>   x86/vmx: remove HAVE_AS_VMX
>   x86/vmx: remove HAVE_AS_EPT
>   x86/vmx: remove GAS_VMX_OP()
>   x86/vmx: remove *_OPCODE

These are fine, but probably ought to be merged because they're all
really one thing.

When you've pulled the __vmx{on,off}() cleanup into a separate patch,
the remains of patch 4 becomes straight deletion, which also means that
Resolves: https://gitlab.com/xen-project/xen/-/work_items/202 is the
commit with almost all of the work in it.

~Andrew

