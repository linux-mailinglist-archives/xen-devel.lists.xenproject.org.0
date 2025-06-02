Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3290ACBA53
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 19:30:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003727.1383326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8yk-0001KN-MX; Mon, 02 Jun 2025 17:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003727.1383326; Mon, 02 Jun 2025 17:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8yk-0001I0-Ji; Mon, 02 Jun 2025 17:29:42 +0000
Received: by outflank-mailman (input) for mailman id 1003727;
 Mon, 02 Jun 2025 17:29:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKOU=YR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uM8yk-0001Hu-2x
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 17:29:42 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29dbd978-3fd7-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 19:29:40 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so50944225e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 10:29:40 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00a017esm15241435f8f.89.2025.06.02.10.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 10:29:39 -0700 (PDT)
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
X-Inumbo-ID: 29dbd978-3fd7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748885380; x=1749490180; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8EysBdXhVRcuwATGtq5Z+vV7iT4lpqk0/v0j0Cc1ok4=;
        b=s0XNaPXpE+2G1t++chQBIa1livncLr2x9gluBrw9E8Bea6ZmpwmfLthBhgiSLttD/C
         B2gYhbtWPIcISgC5cqSoHbpxS7nv1rlxYGCa2Nd0nQYXIgfpFXYOkEVFywCec8JIGM5g
         4CqEprEezpoujXP0r86i/9YuWjbQObmPTOT9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748885380; x=1749490180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EysBdXhVRcuwATGtq5Z+vV7iT4lpqk0/v0j0Cc1ok4=;
        b=hwN5IqXD6hkkHLW5z+OFfhpC3EJZvg19LX+W+uKaNmZkolkPYBRwKh1G/h8iZlsdIM
         JfWuAy6B/cQ+Q3v9tdrOvP5mvyaW2k1i9H6qz2DFry0uYby/TX66S7GimfF02+38SUPR
         77hblwij0xJlnfJQMaZdSKFKGkGtQskJ4rdefR1q6QJJJloj4rm6/Rlpwfq7H0gHkSI8
         LR0UvfXrtbd/6gIXzeecuYkluVBM4pwamAfHQmq+8Z+z0adDrrO3d0plo/TinKrFZIrp
         TCdoM1tXDXpZq0DHEfIfHdMaoE5LG11x3XUKgsVgxGEepa6L7cQ+RO0JwZ/8/i0Jj4h+
         /Ucg==
X-Forwarded-Encrypted: i=1; AJvYcCXx8VdDzDBlR+oC2Is38auy+R4W+eKVBelIg/dcCvB/BYTDMRFnmmeQjkTyVuS2lB7IcD1BFsvk4io=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVbYeM7SOtqAW0Y9tGSxdM1O1zO9IrmZYxeilk0BnmPsa2WNeK
	K/gcHD9bjJ5yqzM7M2Uv+fhUvK61yYJULYKKL5w8K6v54F7UCcuOgbjnlhREGS81R2w=
X-Gm-Gg: ASbGncvH1WcU5nQhVVpn0j09KsCQ2mvgP+aAyqEzn4MFRlWfJGiY/XZEc7j3Hgy2gSM
	VwuOkp3yCBnIb6sgBcxJqG+KUx7+gi+6WkBSlFgtzTKrmQ35+ZaRDTx9kijPWjpXQTl5lr1YSCr
	6tzWcB3xj6L410hRhB3QytlSP59YeR1C41dfHpxvN36iF9vFOXABCEH/xd58eumWE+naevTwTZV
	+/mGV47un3FkRrxAdk+XWCYIyeaV/2lE7ORrumEz4G+htQuw/qsIlGLOVBoaDHqfkLjkq+zjCen
	sID7Sat+P32tQ8yzTipwD6x9Ckv83M6mzM9bic0/CjxpDtGUyaYLMTNq/Ebp4Z0OLlYRkWELock
	+JPklw9yoDyWg3OfDjhNqkpKai5FVkP+j4KC+2Q==
X-Google-Smtp-Source: AGHT+IGDctUQKiOKTosx4cih6zUBkhvYMnID3FemRn49+9EeLGa3AFkxRBWp4DJWHtpX+ZS8x5HO2Q==
X-Received: by 2002:a05:6000:3112:b0:3a0:7f9c:189a with SMTP id ffacd0b85a97d-3a4f799acd4mr11101980f8f.0.1748885379610;
        Mon, 02 Jun 2025 10:29:39 -0700 (PDT)
Message-ID: <bf038fe7-c3b4-435b-8f02-94d8ea337e9e@citrix.com>
Date: Mon, 2 Jun 2025 18:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vVMX: adjust VMPTRLD error handling
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Manuel Andreas <manuel.andreas@tum.de>
References: <421e2f85-c1ed-4989-b8db-36e261826fa0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <421e2f85-c1ed-4989-b8db-36e261826fa0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/06/2025 4:37 pm, Jan Beulich wrote:
> There are two issues there: When hvm_map_guest_frame_rw() yields a r/o
> page mapping, we fail to indicate the failure to the guest, and we fall
> over the NULL pointer in nvcpu->nv_vvmcx when subsequently invoking
> nvmx_set_vmcs_pointer() (if no earlier VMPTRLD put in place a valid
> value).
>
> Fixes: 5dbbaa0fe121 ("x86/vvmx: fix I/O and MSR bitmaps mapping")
> Reported-by: Manuel Andreas <manuel.andreas@tum.de>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -1820,7 +1820,7 @@ static int nvmx_handle_vmptrld(struct cp
>                  vvmcx = NULL;
>              }
>          }
> -        else
> +        if ( !vvmcx )
>          {
>              vmfail(regs, VMX_INSN_VMPTRLD_INVALID_PHYADDR);
>              goto out;

To go back to one of Manuel's original questions, there is no such thing
as a read-only page in real hardware (write ignore is the closest), but
I'm certain that hardware will give us VMPTRLD_INVALID_PHYADDR for e.g.
trying to overlay the APIC MMIO page, so I think it is a reasonable to
use for this purpose.

But, please insert a blank line.  I've spent 5 minutes thinking this
patch was broken and trying to figure out how you'd covered the r/o case
before realising I was reading it wrong.

With that, Reviewed-By: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew

