Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B0C8B221
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 18:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173263.1498324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJ0C-0001uZ-1P; Wed, 26 Nov 2025 17:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173263.1498324; Wed, 26 Nov 2025 17:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJ0B-0001sQ-Uy; Wed, 26 Nov 2025 17:08:23 +0000
Received: by outflank-mailman (input) for mailman id 1173263;
 Wed, 26 Nov 2025 17:08:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YY09=6C=gmail.com=groeck7@srs-se1.protection.inumbo.net>)
 id 1vOJ0A-0001sK-Bv
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 17:08:22 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8123c798-caea-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 18:08:19 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-297d4a56f97so103137845ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 09:08:19 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b2a155fsm201208015ad.88.2025.11.26.09.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 09:08:17 -0800 (PST)
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
X-Inumbo-ID: 8123c798-caea-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764176898; x=1764781698; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=H70tQVp0jdRu6yLi1ZHSywEXJI9fMFla6cCqq4jxfcs=;
        b=kK00+BrEomWPQ99reWcOHDnX3jg4HK7Y5b7/x2AQY9vvspgKOHiDkwERaG/Is99YvC
         4WE4cv4vkG6G5+vF8wO09DNILNA5V/iRjN1vXe4yDB++WmDPqmlerNLcxgF1tMITe9IX
         6Yqo1DNeUUgfKgJKhZxGMQa6YCitzd+v/p7xzIEcIMw/3qqzWIvBOqFkshGrs1V6qHTl
         a7j8/lJWRiMLJoMzq2xq0wKdokMDmMuoezeb65wV/hSS1zdOnCo+sQbenJynqraPyL3U
         99ASYb4X+TaUbiikaqtTVi2r70Dbji6NS631cGF9KGQu3m3Ln7/fK5ZhbHKybL35RoFJ
         lBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176898; x=1764781698;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H70tQVp0jdRu6yLi1ZHSywEXJI9fMFla6cCqq4jxfcs=;
        b=Zys33ysoEF3xRC9RyMX8VDzD3kXgfmJSSR6Y/ruyLx6W179ZHPsIpJ27mkb/B/Lag9
         bA8v4vX35H94bxbHl5LAscOZ0+HrL0WANMtMNwTEnPbXcmBAzvT2CSq0zbFz970KGn34
         AksusrLxSQdZ3zNwTyWD7zgq7Cg5ppSZED+pK4KhzH67bLkHsI81AAN/m3c3kzlBHhDB
         dwx39K+BZARsljHMVW/5yxe+uKO08KdQ5BhyDqNy7H/SLkbQWIMOrUzLBHIMvRJh/fZe
         p/LiwL89Fk2LpF/SgDX+L9qnGKpRjDy15rc9urEsgHWGfsJVgg8KCBl8cT1SkLzpODHO
         j4QA==
X-Forwarded-Encrypted: i=1; AJvYcCVUA8gHBD6Bw/dLjSmWUdLQ99ads34mV7gR5FCBJFhOKEGCK6TQZh8MzsmttVF/loYkxl1/bRcSdl8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYJtpNZfwXpQWes7Qrhft1xn9/tL6JB7AeOSetIdOUa9xdguHJ
	NZqjuYwu48+zBELH8fiojw54bacrsr60gneXB5IM2VWCsO61Pczou4/Q
X-Gm-Gg: ASbGncv5YRbX+kvlqzp6iKILih1TZ/E3jfzndKCEGYmMr1qzobvdl1sb54lTpoikC2d
	3ef4VRydsGxIkUjyPAuDLsoNBFb+TfiQp1Lt06jCHCXn23C2NyK8uIe3yV2+y1DVnBF7vgl/vTV
	NLRQAnf+VCFKRi+3D0woUZNfuXInqvK9PSTwE091ymUlqiKXkUPsBMmKnJIXgR/32TjBk2sxKDc
	JZJ3tIVLlBuObaujGn4jvc2fFX6C1SSPtUTkM5AQe5vdPgtL0pAlMM3jq86MTfRUxuuOX6sGhMV
	iia9ehUkzYuhuPlJfKyTtzBYfT14u2coImbK0176Sk7PUs4oa8x2ifVhGnn6RTrlLqfdFf+w4oF
	SvRJmibAWU8jGYwK7BdXmhLOfqxooqyKEpDDTPxqA3OjfO10ZKIzIhl5hG3/P8Tn1HIiq0GgROQ
	NHw2uv66JE9b6pg3+Asi8ligmlfeRerzD0ckot0b+wR59Whwlyp2KRdSA09lQ=
X-Google-Smtp-Source: AGHT+IEm/eX5yuwpOzoClbM8zcPawe2/xqTQQviecb25Bk40JcOnKIa/X4pWfDT/0x83wWLQHNhjCg==
X-Received: by 2002:a17:903:234a:b0:298:55c8:eb8d with SMTP id d9443c01a7336-29b6c575114mr249233285ad.35.1764176897825;
        Wed, 26 Nov 2025 09:08:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <55bedecf-a4ab-445d-b6b2-c6dcbcd5bd95@roeck-us.net>
Date: Wed, 26 Nov 2025 09:08:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] x86: Cleanups around slow_down_io()
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, virtualization@lists.linux.dev, kvm@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-block@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Jean Delvare <jdelvare@suse.com>,
 Denis Efremov <efremov@linux.com>, Jens Axboe <axboe@kernel.dk>
References: <20251126162018.5676-1-jgross@suse.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251126162018.5676-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/25 08:20, Juergen Gross wrote:
> While looking at paravirt cleanups I stumbled over slow_down_io() and
> the related REALLY_SLOW_IO define.
> 
> Especially REALLY_SLOW_IO is a mess, which is proven by 2 completely
> wrong use cases.
> 
> Do several cleanups, resulting in a deletion of REALLY_SLOW_IO and the
> io_delay() paravirt function hook.
> 
> Patches 2 and 3 are not changing any functionality, but maybe they
> should? As the potential bug has been present for more than a decade
> now, I went with just deleting the useless "#define REALLY_SLOW_IO".
> The alternative would be to do something similar as in patch 5.

Maybe, but as you point out there has not been a report of a problem
for a long time (who knows if any of the affected systems still exist).
We can apply always apply a fix if it turns out that someone does run
into a problem.

Thanks,
Guenter


