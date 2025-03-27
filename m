Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E178A73702
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929772.1332521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqGA-0001Mm-V6; Thu, 27 Mar 2025 16:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929772.1332521; Thu, 27 Mar 2025 16:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqGA-0001Kl-S0; Thu, 27 Mar 2025 16:39:14 +0000
Received: by outflank-mailman (input) for mailman id 929772;
 Thu, 27 Mar 2025 16:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txqG9-0001Kf-8A
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:39:13 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02e163ad-0b2a-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 17:39:11 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso9512545e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:39:11 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314b6dbsm44558615e9.36.2025.03.27.09.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:39:10 -0700 (PDT)
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
X-Inumbo-ID: 02e163ad-0b2a-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743093550; x=1743698350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OwtADmZln6SUBU1R3c3bdOUONtfuPmI+Pw8AafFsY7k=;
        b=k2IVScz59Yr/sdqtmWMzMUd/lpWeRgLhxA6HwWDT4mQJOCbLOUtzBkMa/MInrCxNbg
         aWXsohmqSfQbXnBNxgaa8DO55YlvAGwC2inSU24acmza1j6FlN0Ox+2Z1tPTkze6rGMJ
         r9WfIcqJWIRaPT9WH5eqcuVdYYNTwEeYCWE0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093550; x=1743698350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwtADmZln6SUBU1R3c3bdOUONtfuPmI+Pw8AafFsY7k=;
        b=L4VLJ3LGJhiasru40DqH4r4cayYWdPXAsQxMzEWfMvCLPUhZLElZR90H8TQeWV32LR
         INLVgyrxfw9uONR4r8kV3GWX475D7KQIbx4sA+9nlhA24BhNjRprkbGKmBqKJqxCs12h
         0sRsGhkMrQVnUWrQ3WJlM0RLXZkj6ANQmG6lVVBR2aG5DGQfJpkMP2yzVjiNHfbzWYiK
         ubX3fw2ez750Udo4UbdwUqOyftr/UaHbQ0gdXm4PxxLJJgbm8qFLpYdsi4z1yb/W/eVW
         Gol5SYt2//NEUzslp1Ub82WSE7jw1ND8anuU/CPDZ0k/wLHRo0ekQkZeIhmXc4I4QqFx
         dm+w==
X-Gm-Message-State: AOJu0Ywdz6EyvZRexnAJe/57cVwt9lCqaO+eDIJsyEPMPyRWPFO7YIao
	STO8NgcHlT15OxtkHj4RdWQx9k4wCCpsuTxvM1QGKJJeeZcKrY/E45h6Rn7ZeToEvIVsSV9Gz5e
	Cy1g=
X-Gm-Gg: ASbGncutmwtPZzLhPxqUWGl2Yrv/8ZJxbhdEso2BovxaqTpvhAuLP7RQXLAC+mzt69e
	3QM3dHihFLFvM/fJm6rEXYfYiC/UlvMRCbGPFI7Gigi4RcvG3CD+vAWN4sDNnJJQaB+ej5DbZBR
	gDxvaRRouz6WWNJ3efsIpHjsf3CgDRgx6Dqu4081xcLUoZhLs4CmdZc3ZlDxh7B43hAGP7ub3o2
	EcuqvE7jk+9JzVttcNJHwQ1DMDBOQ5lpm7iBWgafATmEA/CnL/GZmRZ9XCL+/XPuwX046AcBEOP
	x4wF2+DQ8MJqtmHcTq2gKw4mpFDpRsj4qFfQRTA25LL+p9zg9mm6mJXlaOPTqxkZoW3TEDjA67H
	1pu8CPDUpX8O6UMvOxZCA
X-Google-Smtp-Source: AGHT+IGVKrjWYhsJ+FmMvD+4+iTnEFuwDUddG7K64BHkYcbeRt9fptwa2DsYMTEXgzi7dwNVR/SUWw==
X-Received: by 2002:a05:600c:2296:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-43d855eee87mr24485475e9.24.1743093550555;
        Thu, 27 Mar 2025 09:39:10 -0700 (PDT)
Message-ID: <5e0c8639-9153-4d9a-9e8e-d321ae8a934f@citrix.com>
Date: Thu, 27 Mar 2025 16:39:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Xen: Update compiler checks
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250327163114.405824-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250327163114.405824-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/03/2025 4:31 pm, Andrew Cooper wrote:
> diff --git a/Config.mk b/Config.mk
> index 8a73f3da62b4..a9d62fc10cfa 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -125,8 +125,18 @@ define cc-ver-check-closure
>      endif
>  endef
>  
> -# Require GCC v4.1+
> -check-$(gcc) = $(call cc-ver-check,CC,0x040100,"Xen requires at least gcc-4.1")
> +# Minimum GCC version: 5.1, except for RISCV which needs 11.1
> +ifeq ($(XEN_TARGET_ARCH),riscv64)
> +check-$(gcc) = $(call cc-ver-check,CC,0x110100,"Xen requires at least GCC 11.1")
> +else
> +check-$(gcc) = $(call cc-ver-check,CC,0x050100,"Xen requires at least GCC 5.1")
> +endif
> +
> +# Minimum Clang version: 11, x86 only
> +ifeq ($(XEN_TARGET_ARCH),x86_64)
> +check-$(clang) = $(call cc-ver-check,CC,0x110000,"Xen requires at least Clang 11")
> +endif
> +
>  $(eval $(check-y))

No, this doesn't work.  Tracing a RISC-V cross-compile, it's invoked
with different $(CC)'s.

+ gcc -dumpversion
+ awk -F. { printf "0x%02x%02x%02x", $1, $2, $3}
+ [ 786432 -ge 327936 ]
+ echo y
+ riscv64-linux-gnu-gcc -dumpversion
+ awk -F. { printf "0x%02x%02x%02x", $1, $2, $3}
+ [ 786432 -ge 1114368 ]
+ echo n

~Andrew

