Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAB79D9E3A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 21:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844019.1259575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG1qr-0001ZK-2U; Tue, 26 Nov 2024 20:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844019.1259575; Tue, 26 Nov 2024 20:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG1qq-0001Wy-Vh; Tue, 26 Nov 2024 20:08:00 +0000
Received: by outflank-mailman (input) for mailman id 844019;
 Tue, 26 Nov 2024 20:07:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdLj=SV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tG1qp-0001Ws-TG
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 20:07:59 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f49fcb8-ac32-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 21:07:54 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d036963a6eso4682166a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 12:07:54 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b28f8casm625419366b.18.2024.11.26.12.07.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 12:07:53 -0800 (PST)
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
X-Inumbo-ID: 1f49fcb8-ac32-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFmNDlmY2I4LWFjMzItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjUxNjc0LjY3MzUyOSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732651674; x=1733256474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ypYgXA2l9Tk9ltBtd6JPkdonSt4sBhtj+zOsPTroiyw=;
        b=lJosnw7jS2eztCMUgtlRp6lCFuPv5md/uHMYOehP3e3rG9ZAW60TjJcBOI4A4WEHUc
         MhdEQodQM3RXLUF75LrTkznVQ9b26JDyXWrar8PVtlEhrbg9ajn+sG5jUCnMdDZkwtqe
         7q9zZvrAvBmApuzglDL4upWIteWTbC9Me+YQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732651674; x=1733256474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypYgXA2l9Tk9ltBtd6JPkdonSt4sBhtj+zOsPTroiyw=;
        b=ICh/1Djd7xnIYUDwojcBXbbYZWC5qeNmmc6AQVbzqG/cLrBtUlWPdHGSsNo64cvJ9p
         v7Q0LjTBKNpoiNtMx+U4g8AhbVcPEc+Pn3vqs0unxF9KIeCrdQ+6aPKet2G5Tx1tpygF
         hzeMglox1a69hQ2Hy0ypoBuipuHzit1BxoSdTFIYwZkewj3HMtjX5vrmt3BohRDkc4Yv
         U4+eG7zT5Z5klza6NJz/IqczGRdrkuFi4ysDI1DpWNYgruz76SmyrGi3dweKhCAH5pOv
         Pi48JGdVynSuCU2owb2m/ZFjRFursAAjlGAd9X6UQiri2aIaruUFYRVvLmyn0jVt7/u+
         LafA==
X-Forwarded-Encrypted: i=1; AJvYcCV6RTzoHz6l8m2CnDHD5XWmSsvv5I6FASz/Iy9Io3r9m5Dk4/zcMciyU5nT24kxdaECTPviDJBjGTE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywnka4y5hlzrAvsp50evp1Uv/CXdaafS5mAe3T4XzLJlbe96mV6
	a1pMI1gRNDUKIeQgiZM9/Rz5UDGJ27TPjA4dfGdcAHMBuUNa4lW7gFpS9Qr755bi6LHskcub282
	9
X-Gm-Gg: ASbGncvxqfEpQ9p3Utybhy6S24r0CyiCP9hPLBFsS9VrGdv3tFErPucaSoPW9N0AP8U
	W5vD9yC5n4vEpu0r7QMhF2dIX6puKu0F53IzHvMaS5E8chaZEqV/znAK8EHEOtF44pXF2OPwNgq
	FabMM2J5M61N0+XrIQlbCqCMXT7vHyBv6H8QY74I+MykPkPBgYaRW53HArLXMt89TbQpLzJwJPX
	O6iTlCHzuFd+IsBHGYITAKpfa1Y85aTaQLUv7QCstk3KEepMvRrOL6UNE41ZP0=
X-Google-Smtp-Source: AGHT+IHfWMdZFb4djGcEg7ZWieIJ8+qmQckCBfwI+AOuSqeURcRfHegRSY+Mjzzp4CFUzJeIaHtHPg==
X-Received: by 2002:a05:6402:1bcf:b0:5d0:8106:aaf4 with SMTP id 4fb4d7f45d1cf-5d08106af00mr223880a12.21.1732651673993;
        Tue, 26 Nov 2024 12:07:53 -0800 (PST)
Message-ID: <46949b57-242b-4724-8e81-62d205233829@citrix.com>
Date: Tue, 26 Nov 2024 20:07:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] x86/APIC: Read Error Status Register correctly
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/11/2024 5:06 pm, Javi Merino wrote:
> The logic to read the APIC_ESR was copied from linux in a commit from
> 2002: 4676bbf96dc8 (bitkeeper revision
> 1.2 (3ddb79c9KusG02eh7i-uXkgY0IksKA), 2002-11-20).  In linux 3.14,
> this logic was fixed to follow the Intel SDM (see commit
> 60283df7ac26 (x86/apic: Read Error Status Register correctly,
> 2014-01-14) in the linux kernel).  The Intel(r) 64 and IA-32
> Architectures Software Develover's Manual currently says
> in Volume 3, Section 12.5.3:
>
>   Before attempt to read from the ESR, software should first write to
>   it. (The value written does not affect the values read subsequently;
>   only zero may be written in x2APIC mode.) This write clears any
>   previously logged errors and updates the ESR with any errors
>   detected since the last write to the ESR. This write also rearms the
>   APIC error interrupt triggering mechanism.
>
> Update error_interrupt() to remove the first read and follow the Intel
> manual.
>
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

In Linux, this bugfix was further corrected with
https://lore.kernel.org/lkml/alpine.LFD.2.11.1404011300010.27402@eddie.linux-mips.org/

However, Xen being 64-bit only doesn't care about the Pentium 3AP errata
with writing to ESR.

I'm tempted to take this patch as-is, then do a followup on top to
remove the remnants of the Pentium errata from Xen.  I don't think it's
interesting to take bugfixes to bugfixes simply to delete them right after.

Thoughts?

~Andrew

