Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407B6C14B08
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 13:48:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152107.1482640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDj7i-0007zi-Rg; Tue, 28 Oct 2025 12:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152107.1482640; Tue, 28 Oct 2025 12:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDj7i-0007wb-Os; Tue, 28 Oct 2025 12:48:26 +0000
Received: by outflank-mailman (input) for mailman id 1152107;
 Tue, 28 Oct 2025 12:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGJv=5F=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vDj7h-0007wT-Pz
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 12:48:25 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 642027ef-b3fc-11f0-9d16-b5c5bf9af7f9;
 Tue, 28 Oct 2025 13:48:24 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-592fa38fe60so7025214e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 05:48:24 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f5098bsm3042698e87.40.2025.10.28.05.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 05:48:21 -0700 (PDT)
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
X-Inumbo-ID: 642027ef-b3fc-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761655704; x=1762260504; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pucb64fBJWr4+y9UVYKlttRFUeMCsZ8bQOysNcf5NkE=;
        b=SWIQjghOTqzXCL+zMR7FMOEucGT6OY8GPYfhAkN0jX6Ew5WvpxckcyBW0++OzuOMzP
         QXmw+8TnAfmfdYh1igbpZRT8gblKG+w1mwh1Tw4L/BM+mSNLGRT8035wCdicpZMjOGwJ
         Eh2uxWp9+hXTuZzBj+l+Q0HNHsL0v5dFE2E34/oMaUh8gZcEp+FuDTjd1Mp8FQGxCszH
         VsNwQ6RW+IEVpbufy69d3RJXKyworqymlumNvwzzoaADaYPPo5jaJeeHekHTNSb3QCK+
         1NmxhQWVs3FbVDHnzuFTwHR+LVajzZrDThZfII6ueG08cmPGfcZDMfygVafHMdzaGGNI
         ri5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761655704; x=1762260504;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pucb64fBJWr4+y9UVYKlttRFUeMCsZ8bQOysNcf5NkE=;
        b=OlP3Hgq1V2sKZAmbCnNVglMzkor+WXrE/G0tyYYZbcgAYwVmdav/D1rDah2kSrK8Cw
         5axHC60bR3TEB/srBIcsBrlkJTdhuU+VTTz4y7JjMONHyp+Jt8sHfsXN2EamBAgm4lHl
         TetYMLQ81NfombWpBsqYvzDlrthYRKmmlP2k1pQHTJxoPuWTvXt9Hr5TDB2phHgDWPY/
         xSn38uLXu2Fd19ro8iyAoEdHwsclpR/5xfENPIJamUwKlQYduTCCb6IJxEgoRVm0vDVM
         z/Xyibx6wJRFi6FbJQEvmBJPSBk21NvROS+RQg6+I6bUNYljr0R39Pp0CeF7N+sCl93O
         DcRA==
X-Forwarded-Encrypted: i=1; AJvYcCX/7D77tS3OgEmYK6rgt8caen6sc3t1U/N8/ZjaUcx10csBckp+AcBpqVJLBAOiFS0WQu8vQWNXN2k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4uN7Lbt4A6B+FaOTQNUzr7fAyyf8KADP0/4Nl+az91Lgohzox
	uebaSMUM+uBeK6cNTspN61PsrvpXPvJ+7DyQATqw3MoN1yM+8NyGFPCs
X-Gm-Gg: ASbGnctxBo66EXFef/CQt75Wd9anAmB1C4a/nBgtli22kX8D2hVC/RJF3jIiqAhh2yG
	z39FHXsQnPksLe01SDxfXOE9i6Njq0+bSpodzMO/x7ezPm7CUbdZfHVS4Hbmcs+5GA7bHE84Vmk
	8XVoqjV8i5wW4M2k347nje+Hh7XrSm4jm7FFEao7sC5LHcjFzhEZJIM8p2noCeNY/TEJ3iWD5aq
	PgZMZOBmv/rbIx2a1VhtCvN5rr+xdbc2HS2PWW/bJocBtY6zBRJ0ebi5Rvy3Z0uGU31Wg1J/W2Q
	2x82/QlsEB4YZoJl3F9J6A3JpgLlw2GYDQhFyQjoCf+F8qC+mey+pPMzAGjpxzmI4z/Dyp45rGd
	965a749XcrW4GPGyyBN/vM0s9eByJe8AMVMoDgNzlE275LTB6/N3fZbf/ceHzJMj1r1MP1ABraX
	16S15QJ0bRYjnSHebycVhgARhQokgACbYt/z/hMoCdwH5nCJM=
X-Google-Smtp-Source: AGHT+IF6ccHGzuzxNm7+bHl7g/7fMJDKTL+xoHfyAW6ncH9aLVAwNW32+RfTkPnTLRjRK6Csu5NkiQ==
X-Received: by 2002:a05:6512:238a:b0:592:fc21:bc15 with SMTP id 2adb3069b0e04-5930e9dd032mr1404878e87.45.1761655703317;
        Tue, 28 Oct 2025 05:48:23 -0700 (PDT)
Date: Tue, 28 Oct 2025 13:48:20 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anton Johansson <anjo@rev.ng>
Subject: Re: [PATCH 1/3] hw/xen: Use BITS_PER_BYTE & MAKE_64BIT_MASK() in
 req_size_bits()
Message-ID: <aQC7lEwW9pSmCtIx@zapote>
References: <20251022140114.72372-1-philmd@linaro.org>
 <20251022140114.72372-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022140114.72372-2-philmd@linaro.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)

On Wed, Oct 22, 2025 at 04:01:11PM +0200, Philippe Mathieu-Daudé wrote:
> Replace magic 8 by BITS_PER_BYTE, use MAKE_64BIT_MASK()
> instead of open coding it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> ---
>  hw/xen/xen-hvm-common.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index 52e2cce397a..258014370e1 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -1,5 +1,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> +#include "qemu/bitops.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "exec/target_long.h"
> @@ -448,12 +449,14 @@ static void cpu_ioreq_config(XenIOState *state, ioreq_t *req)
>  
>  static void handle_ioreq(XenIOState *state, ioreq_t *req)
>  {
> +    size_t req_size_bits = req->size * BITS_PER_BYTE;
> +
>      trace_handle_ioreq(req, req->type, req->dir, req->df, req->data_is_ptr,
>                         req->addr, req->data, req->count, req->size);
>  
>      if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
>              (req->size < sizeof (target_ulong))) {
> -        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
> +        req->data &= MAKE_64BIT_MASK(0, req_size_bits);
>      }
>  
>      if (req->dir == IOREQ_WRITE)
> -- 
> 2.51.0
> 

