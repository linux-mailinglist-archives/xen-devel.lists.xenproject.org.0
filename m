Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4B8C14B2B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 13:49:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152117.1482649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDj8L-0008UE-3z; Tue, 28 Oct 2025 12:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152117.1482649; Tue, 28 Oct 2025 12:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDj8L-0008SR-0a; Tue, 28 Oct 2025 12:49:05 +0000
Received: by outflank-mailman (input) for mailman id 1152117;
 Tue, 28 Oct 2025 12:49:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGJv=5F=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vDj8K-0008RS-6C
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 12:49:04 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b9f7ded-b3fc-11f0-9d16-b5c5bf9af7f9;
 Tue, 28 Oct 2025 13:49:03 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-57bd482dfd2so6517698e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 05:49:03 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41bf3sm3007997e87.20.2025.10.28.05.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 05:49:01 -0700 (PDT)
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
X-Inumbo-ID: 7b9f7ded-b3fc-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761655743; x=1762260543; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t6l883tFJpAQf8YAlHanMOkQlY/AtsD2XxeUSoX88Sc=;
        b=VrJbGIxbhiJ0wXIfKrDcSYU+t27rV0ue22MPol1ooWEUGgnCg8hjZeEkPpsYm/9hyo
         xv4gSuRj9dpU2bqsn22ySGAZyf5wr3Wd/2VAOyIjT94MQwfDMTandaHp1KsyhiFQvMZC
         M9TTeBT3jgbmnAaX73yYyk5mKkw/R6e7tYnG1DHnaN7VhXTjJ4mQbYaUmLz+zlq93pqZ
         vb9iWeJPeZS1oYi8T3/WExaDQMXdHsYQBfYNQUcsft9oemEgYjii9beZY5fkiMQ/rZLD
         ReBEw+TX1AUmzw0M/WHqCXBZLpbFnHscSzLcqV1SfpC6FdxUDSf+P1yWh95lt4LwAXQo
         hCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761655743; x=1762260543;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6l883tFJpAQf8YAlHanMOkQlY/AtsD2XxeUSoX88Sc=;
        b=udJ5XK8S6OnvZak1PxnF5ELd/5Tgm5xp072QrMpK9T9a/tBOCchJlChxldrfFfMgt9
         OvayMH0Zrvt1Svx5PrJmtShJGesELPrUPxywTHit5t9b4KL5OavAmtQkGnycgFq2E/5z
         M1JWoFO07dQDlO0b0lC8ST3qjXyMYVysTlPBu+6Qd1zVlOlltaW6puLEbdL7K4NivCL/
         ti/aS1mWTEnulgRVxM5er3aZJlaOvHZtv1HlTSLThQFjgGXGcfDfkXSo36L2T4oTPB9i
         pRdfSFhM1KbbNwPUC3cjYdGoAUoSraiZ8/gEr+dOxdeqsAVuxUYSWaDIF34FYLENn67G
         c0sA==
X-Forwarded-Encrypted: i=1; AJvYcCW/tumh4TFV/ar3hojdyBjlma4+2WHxg+ScV7waR75NPZYI39uiKFv9IcoWpwink8ZPgN/e64Ym4Ik=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhWJZNkaBJJBM/qx43eu8Fe36XH9uPio6adFj1qWhptQA9rM+p
	cwIGh2baYC97busQuxXqy9sNQ+orLg3hJUSbNs0sUSSu9QJfObIomO/C
X-Gm-Gg: ASbGncsib241EqtnoYDadGJXEsltH32jaVTxdD2w+VNiOeVgCrYoZfPjdVNQry+q7n0
	rRKOE60Vw49HWeSeveG0o1Qd1pd35yyUEeXvjsXS9INtJKb+pAGagPJc6WsiOnQlx8ctEOAE3iw
	7I5gvz5+PlVToDLMp+E9FRMW7LiSEgcprp+0LobosyQtP0vkmIKr+Fzj1KUskWu2N5R1Xj37L23
	s93rUOUDwT06HZtbg2b+IZiqu7cJ/15+yAajxbd0y7Jd/fTyJy3RGQcNYPYSFUr/R12+JefvMgz
	WUhErmXwY+dVwYoMiZPQVWjuztWgMcSNmpactpTxF1Y70U+erXlo535Le8H7ve9lKgcLUsUhVYj
	jl4L6OJtDdOGtxeCNLS6W1V53upEUc8fMVXmHVpGTcmYtDR3bBE+WFZHKLJk5Xrmj+1W6+J9xpU
	nFgdpjZ2kNj87dk+zpBKh273kdqiKb6sYjJNAA
X-Google-Smtp-Source: AGHT+IHC3k1jTGxJ5IBzuBvL4mcg9tubmk9jzGOT+Qf3FcXQ/5a9ChnBIHTlFax2lPAaLyfudoR2Rg==
X-Received: by 2002:a05:6512:3b10:b0:592:fcf7:a178 with SMTP id 2adb3069b0e04-5930e997c5bmr1359279e87.6.1761655742772;
        Tue, 28 Oct 2025 05:49:02 -0700 (PDT)
Date: Tue, 28 Oct 2025 13:49:00 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anton Johansson <anjo@rev.ng>
Subject: Re: [PATCH 2/3] hw/xen: Replace target_ulong by agnostic
 target_long_bits()
Message-ID: <aQC7vCX4OHElpfDD@zapote>
References: <20251022140114.72372-1-philmd@linaro.org>
 <20251022140114.72372-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022140114.72372-3-philmd@linaro.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)

On Wed, Oct 22, 2025 at 04:01:12PM +0200, Philippe Mathieu-Daudé wrote:
> Both are equivalent:
> 
>   target_long_bits()
> 
>   sizeof(target_u?long) * BITS_PER_BYTE
> 
> Prefer the former which is target-agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> ---
>  hw/xen/xen-hvm-common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index 258014370e1..b40ae0b3af0 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -2,8 +2,8 @@
>  #include "qemu/units.h"
>  #include "qemu/bitops.h"
>  #include "qemu/error-report.h"
> +#include "qemu/target-info.h"
>  #include "qapi/error.h"
> -#include "exec/target_long.h"
>  #include "exec/target_page.h"
>  #include "trace.h"
>  
> @@ -455,7 +455,7 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
>                         req->addr, req->data, req->count, req->size);
>  
>      if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
> -            (req->size < sizeof (target_ulong))) {
> +            (req_size_bits < target_long_bits())) {
>          req->data &= MAKE_64BIT_MASK(0, req_size_bits);
>      }
>  
> -- 
> 2.51.0
> 

