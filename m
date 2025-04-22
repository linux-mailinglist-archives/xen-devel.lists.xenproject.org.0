Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AECA97363
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 19:15:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963353.1354374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7HCi-0008CQ-Gl; Tue, 22 Apr 2025 17:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963353.1354374; Tue, 22 Apr 2025 17:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7HCi-00089U-E4; Tue, 22 Apr 2025 17:14:40 +0000
Received: by outflank-mailman (input) for mailman id 963353;
 Tue, 22 Apr 2025 17:14:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7HCg-000880-OW
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 17:14:38 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41df46ad-1f9d-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 19:14:32 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-440685d6afcso51508865e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 10:14:32 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5aced6sm31818805e9.16.2025.04.22.10.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 10:14:31 -0700 (PDT)
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
X-Inumbo-ID: 41df46ad-1f9d-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745342072; x=1745946872; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gGthYO2s59y3+AtQUrxBgwnBHEE+YlwhZq/V8D0EEB0=;
        b=RyGB0FQPO4wX+xZDbFaIj4T8qriS2Em9Br/xtDIsK+iUjVNGzUu9VcEux6Q8QwFvzW
         sy70R8ydJCkotFczppBN8l6C/wv5o3mgFYYFdEjaxAN2sYL9UgKznP8tH3MKouAav05q
         UP3N/q6ASMvz75kTa9tc/jN4V/iYRyG8WmIWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745342072; x=1745946872;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGthYO2s59y3+AtQUrxBgwnBHEE+YlwhZq/V8D0EEB0=;
        b=w+tsu9R2uIDad/3+/5U8tk+6NABmiI2XcH1DmB/5TkvEYgpXV8Ay6MojgxoSuqES1B
         h5FQjyXBjA0quRA9wbjZMN3m7ZQERlUdE9/2Qt+5/Nyv9g+pQLGMAa2eEp8I9sXcxFzM
         MXi2T56whFQQM9+lg+oQZS1gWGVwveIgTK6JPfVPPdCOj/7Ju7rjI9NQTQmxrlpix+4U
         HfvqL5xi7ZC8VzGd77CU+/TbmSZxhkm8L2GNrJMMTuYCcB7+tyhmO8RNYNf01jcbQhzG
         6dRNAl/BmN5e28aCqoEToQIVKGe7RV4bVf87UQc7YpFl2oYz7u20xIjnMVwRi2AHCSfd
         nWXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSo/tWfAuhIzQY5rVFUhtUOLKA3p30NcFFrEEb9TsKMpX60i8HEK+7VQ/XFxa8MjjC/DQJCyc8IDo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzl0xpxNwX4u7NXD55Cmm3hJGs2WoO0wBxzm2KaZ7rr/EFPiLUU
	04m4Ak540KxCZKDK3eycRz9kBe17oiY5W9H8HmSMn4xu6n0CKbVj1dj0t18nF2I=
X-Gm-Gg: ASbGncvzt9ebxyFg6cVt7ZvpN6v+B2k7oa1gquxgLdAREq8J5v/fh7gWPjewYezJoNt
	sy/rD7of7Y5yzKlxVBT52bGm6lA0Vwb/PMTymaAbhfdpDathRLZaZCP3WQeI7jb4iXtAiyElJbB
	tNeGqsw1ZIG8TN/vTiYrz4RNSI2w28+ZNcdUKLKzILaAkAbUyrTpzabhnx7eHwHrCHCES7pSr+j
	DiTnGzM6xt0VHyHZe7ivUXuWJfQ4Le74Vl12q7FlEwgN05BPfJWRXr2QQHAQpOQgk2GZlMct3pU
	0GEL9VIezVDwE8cyMbwLZhUZ6bmOU8cGT6M0akGTiwbdMTN/g0r+ag==
X-Google-Smtp-Source: AGHT+IEuLPqjMZ43+RYFFC1f5W+4Pgvd5Q4aVBATCksa1deGx6/BzaIaMFoA6ZZE8Z1virNbG6ZQaA==
X-Received: by 2002:a05:600c:350a:b0:43c:e7ae:4bc9 with SMTP id 5b1f17b1804b1-4406ab7a56dmr114884225e9.1.1745342071986;
        Tue, 22 Apr 2025 10:14:31 -0700 (PDT)
Message-ID: <744934f4-f56f-4dc7-bccb-c32f2829d1da@citrix.com>
Date: Tue, 22 Apr 2025 18:14:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] x86: Trenchboot Secure Launch DRTM (Xen)
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, trenchboot-devel@googlegroups.com
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/04/2025 4:06 pm, Sergii Dmytruk wrote:
> The aim of the [TrenchBoot] project is to provide an implementation of
> DRTM that is generic enough to cover various use cases:
>  - Intel TXT and AMD SKINIT on x86 CPUs
>  - legacy and UEFI boot
>  - TPM1.2 and TPM2.0
>  - (in the future) DRTM on Arm CPUs
>
> DRTM is a version of a measured launch that starts on request rather
> than at the start of a boot cycle.  One of its advantages is in not
> including the firmware in the chain of trust.
>
> Xen already supports DRTM via [tboot] which targets Intel TXT only.
> tboot employs encapsulates some of the DRTM details within itself while
> with TrenchBoot Xen (or Linux) is meant to be a self-contained payload
> for a TrenchBoot-enabled bootloader (think GRUB).  The one exception is
> that UEFI case requires calling back into bootloader to initiate DRTM,
> which is necessary to give Xen a chance of querying all the information
> it needs from the firmware before performing DRTM start.
>
> From reading the above tboot might seem like a more abstracted, but the
> reality is that the payload needs to have DRTM-specific knowledge either
> way.  TrenchBoot in principle allows coming up with independent
> implementations of bootloaders and payloads that are compatible with
> each other.
>
> The "x86/boot: choose AP stack based on APIC ID" patch is shared with
> [Parallelize AP bring-up] series which is required here because Intel
> TXT always releases all APs simultaneously.  The rest of the patches are
> unique.

I've stripped out the sha2 patch and fixed up to use the existing sha2,
then kicked off some CI testing:

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1780285393
https://cirrus-ci.com/build/5452335868018688

When the dust has settled, I'll talk you through the failures.

~Andrew

