Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9CAB1B7EB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 18:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070718.1434345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKAa-0006UW-4u; Tue, 05 Aug 2025 16:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070718.1434345; Tue, 05 Aug 2025 16:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKAa-0006Sg-0w; Tue, 05 Aug 2025 16:05:44 +0000
Received: by outflank-mailman (input) for mailman id 1070718;
 Tue, 05 Aug 2025 16:05:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yoJv=2R=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujKAY-0006SK-QM
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 16:05:42 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06d65ecf-7216-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 18:05:37 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-458ba079338so185255e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 09:05:37 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e6214640sm2883005e9.1.2025.08.05.09.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 09:05:36 -0700 (PDT)
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
X-Inumbo-ID: 06d65ecf-7216-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754409937; x=1755014737; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iomsWgcklMta5jk+zcDV2STtNifIaXuiNXNCW/qes5g=;
        b=mrlsGZms64gAGqRiMXgmxr71pFK2RYoJJDNb9GiPWCAo8DEIU+F2VHLqaIzntDtgPh
         JTrdH8AnA0/+Pl0+PzSNVRN8xMb9i/fAlprvDhsBZzWehEB7zC7M6lijrVMDUuyUJonb
         u2ZClKVSU5a7BCH3kWIxATKm2+Zr5S6sRgO0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754409937; x=1755014737;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iomsWgcklMta5jk+zcDV2STtNifIaXuiNXNCW/qes5g=;
        b=ghTE4NyiTtr3q+56tEmM1moD6poHizCvzdt1jDiG8deGugz12rAB/FLDtebFpq5yUM
         Gd4f39fLAj0LRdiKmpkGPEjaeoCTk0yZbJPFTMW/3owL6qSdpKBHEdDto8goo+Hr5vm2
         d4yv4i+iQ3agUGOLD1yBjAoTPSmujifXZun0dc4+qaqKgLuEOTXP4Z2F89NM57RfsQdc
         EAyheoMXX32I4TQ5Rt2aC96XTFYPNXuML7i0tKEtGvL3Emz9HNY5tCwT4lwhpjsQe9Td
         pfdRfoVMAvzkC8i1kiJvbWnhSvQjf3InRSMInLgS1zzmCxsXTOJpBCZXwaYGNR+4OdxK
         PidA==
X-Forwarded-Encrypted: i=1; AJvYcCVCTkCBNNkryyZM53M1c1FjVjAnkfPRuhxGCDea6UhFsF7D/8jjXf5/jBQUzzg9B2DhUh50H/mSfRI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzD3xB0ErDnskF1gIlEiQHAEi6/8R2GFgZ4T8psLei3M23jc/Dy
	r5op5PTl/IVbIDExqOMGc7G8IKhJuzGfD4HiSAkoIliq+Vxyf3hx1qFSXae81hefJCQ=
X-Gm-Gg: ASbGncuRrW+n7TqRDvD7JMR0st0HcBzdLZTdkEk6BPhH1nU1DTFEqPG0nUNBwISaZJD
	ZwZChIbLUYrRFjEqFMgMNARUrfaZJEb5olDVRZzvEJc1xb3qThB/rkSFCBPoKMNas4kEJQMpdCQ
	yXBaEZBtUTNkuA5YleqF8O80sRF//C9XIY/h1mcRlte/SAdp/8K7dDaSQ3tyop/lcohJxpznF8u
	BgZzepS6JlGFQPxTFrQQ0T7HKrreOfgvtmyLoPD2ZeDpsZw6KQGcgOv/HZVv9hg2z0QB35ttDkw
	8BcOjmBYQbL498O6Nr+9ZQ9XFMdS9vgQ+8/8om+T6hurPev6QtONsCXqZw+N5ZFtyaqe05D0gWJ
	jo/xS2cZoCjtfw50M7OvRoCj4hQMnaaG1msscDeiv+ky33G2K+HDePt5VpjawaNsxzxmT
X-Google-Smtp-Source: AGHT+IFBmq60J+l+DOXX1mTr+io9rzRXeiwmIR2j0vf1G7sviA2M6Z0id2EYvSuuhOYoOyN/rkK19w==
X-Received: by 2002:a05:600c:5009:b0:455:f7d5:1224 with SMTP id 5b1f17b1804b1-459e0cb8c2fmr37611625e9.9.1754409937340;
        Tue, 05 Aug 2025 09:05:37 -0700 (PDT)
Message-ID: <641a944b-ed71-49f3-aa3e-e92f4ee06508@citrix.com>
Date: Tue, 5 Aug 2025 17:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hpet: do local APIC EOI after interrupt processing
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250805160326.78837-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250805160326.78837-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/08/2025 5:03 pm, Roger Pau Monne wrote:
> The current logic in the HPET interrupt ->ack() hook will perform a local
> APIC EOI ahead of enabling interrupts, possibly leading to recursion in the
> interrupt handler.
>
> Fix this by doing the local APIC EOI strictly after the window with
> interrupt enabled, as that prevents the recursion, and would only allow for
> interrupts with higher priority to be serviced.
>
> Use the generic ack_nonmaskable_msi_irq() and end_nonmaskable_irq()
> functions, removing the need for hpet_msi_ack().
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Fixes: 3ba523ff957c ('CPUIDLE: enable MSI capable HPET for timer broadcast')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Good riddance to the mess in our patchqueue cased by this.

