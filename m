Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0652BB18007
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 12:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067098.1432068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhmnD-0000XY-HP; Fri, 01 Aug 2025 10:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067098.1432068; Fri, 01 Aug 2025 10:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhmnD-0000Us-Dc; Fri, 01 Aug 2025 10:15:15 +0000
Received: by outflank-mailman (input) for mailman id 1067098;
 Fri, 01 Aug 2025 10:15:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZYZz=2N=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uhmnB-0000Um-Ra
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 10:15:13 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 694d6e7e-6ec0-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 12:15:13 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45617887276so4269715e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Aug 2025 03:15:13 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee4f0f8sm59904655e9.15.2025.08.01.03.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 03:15:11 -0700 (PDT)
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
X-Inumbo-ID: 694d6e7e-6ec0-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754043312; x=1754648112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yidv0Cd3rKy5pI+cfhbX0suUINr7h95CBN5pEZNQxRQ=;
        b=sGAalYJ9PnNH2RN9oUW7ZsSrGQ65uY4Y7tiL7xxJrVd5t56HvtAaqg5ZvPyyF0A5Ln
         sZQI0CVDhOw26mklaqa4m4BkDp396Z75VA/FjZDMmsyuMOgTjWqSwk8Y4e28vtz8cHct
         kt/ggoI2FZjTzoHA/YFSzSqqlfg02pPblsM34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754043312; x=1754648112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yidv0Cd3rKy5pI+cfhbX0suUINr7h95CBN5pEZNQxRQ=;
        b=rp+Ua6r33EjvrDs4EjJVWbrAiYWdKqGxOksUxGDX8XJdw1pMigTyxfJhRzGMX3z569
         9RkEuqfAN0PQKAHjaloZN4k/RnmteHcR6yF6IVzlsJRZxj59Be0di0YIJwwXwuBExiyV
         Pvbk31tgs+SHX4icysANRqnPELH+U/jXvCTCSzZFykxkd6pYb3Hg37kZ3snZS+qGsjMS
         G7uvBoQT+XAi028qMykkqoO9ny5Ayzr3EWUnjs5/D8SrdrjH26NWBNBfni8mRHEcHrzU
         zpM4iUqZVn8PD6tnvx3MfcwzuzVTcC1rAs5rfKW1M6S414yp6/JRra1/KpvZRLRlenlO
         RwGg==
X-Forwarded-Encrypted: i=1; AJvYcCXLyk6iOW1WZD48bgohU7ISLDQ4PPXX7IEWDpHDg/cYK2yGD+aGhcd1un+p7grFbL517LjBvuAjMsQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyw6YpGXAg7UkuQxVAJkqc/i3DAVnrByJoJJVatMtzKlWLJ55aY
	iy3JCwH/A2XEX7/DXRFblfGvk7vci7Rp4zzjQplC5SPC2do4IBrwJt5hQih4SazuJjo=
X-Gm-Gg: ASbGncvkiOridxYpWmPn1ZZu92nyK3A14ZWZkVQL4AGBcG6lJigVhaJduyp8uYyVnLX
	/VUepeHpWuT2pd1gIRepZQzOrTAuSUPx/+lSKnHELP2GN/Ou5q2rqaxdb88Y7tVRyLz7lhbUHt2
	IQVvdMhrWeLo8ZM9wB4j8lwdvPRuC5JsTkw7p0n6Bfy4w/3sqfXQebbi4R+AEo8pyj9jBUQgYEB
	EiR3qDLBxcbF0dUdSp0Q9DbGmYS7SIBzSrvO1OLwbzUWmwu2f5CtqBRZMTywO0m3sPcXXaki6yB
	wEiI4+BRWgzqzV6Boug6nm9fzGMNePF1vWa+mcm4SKq2e4SbeClzbkhyEdqr95TdFK3t5It3J1p
	Oc4kLbVV3fkuMvWxARhaXTyVHy49i086m0ueFIeCfujjd2AFR2c3ILD9iB1uMYfzmoj1G
X-Google-Smtp-Source: AGHT+IGitORPTxo5pokTPaxEDGFbmrVatKtOhwx34IhznsCjQ4f0A7pDjs13xq2uhg/mGNC3jIPYPw==
X-Received: by 2002:a05:600c:138e:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-45892be15d4mr108489475e9.30.1754043312284;
        Fri, 01 Aug 2025 03:15:12 -0700 (PDT)
Message-ID: <090231b0-6fd9-4ad5-a735-aff7a766ddff@citrix.com>
Date: Fri, 1 Aug 2025 11:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 0/3] xen/arch: irq: drop unreachable pirq callbacks
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250801100852.1260544-1-grygorii_strashko@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250801100852.1260544-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/08/2025 11:08 am, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Hence prerequisite patch was merged [1] arch specific pIRQ callback can now
> be dropped for arches without pIRQ support as those callback become unreachable.
>
> [1] commit 341f271cf86f ("xen/evtchn: fully restrict concept of pIRQ for arches with pIRQ support only")
>
> Grygorii Strashko (3):
>   xen/arm: irq: drop unreachable pirq callbacks
>   xen/ppc: irq: drop unreachable pirq callbacks
>   xen/riscv: irq: drop unreachable pirq callbacks

In the individual commit messages, it would be helpful to explicitly say:

Since commit 341f271cf86f ("xen/evtchn: fully restrict concept of pIRQ
for arches with pIRQ support only"), the $ARCH callbacks ...

Having it only in the cover letter is not great for future archaeologists.

With something to that effect, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>.  It's always lovely to see diffstats like this.

~Andrew

>
>  xen/arch/arm/irq.c     | 29 -----------------------------
>  xen/arch/ppc/stubs.c   | 20 --------------------
>  xen/arch/riscv/stubs.c | 20 --------------------
>  3 files changed, 69 deletions(-)
>


