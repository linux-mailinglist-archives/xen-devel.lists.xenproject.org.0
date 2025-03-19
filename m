Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 908FEA68E58
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 14:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920713.1324799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tutvt-0001Ok-2A; Wed, 19 Mar 2025 13:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920713.1324799; Wed, 19 Mar 2025 13:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tutvs-0001ME-UX; Wed, 19 Mar 2025 13:58:08 +0000
Received: by outflank-mailman (input) for mailman id 920713;
 Wed, 19 Mar 2025 13:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiIg=WG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tutvq-0001M8-VI
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 13:58:07 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2db56ca7-04ca-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 14:58:04 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so5324315e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 06:58:04 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395c7df413esm20631255f8f.20.2025.03.19.06.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 06:58:03 -0700 (PDT)
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
X-Inumbo-ID: 2db56ca7-04ca-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742392684; x=1742997484; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKtd2t8952PTcuVOLwmHDgbG6L5yW0pG/+1vL9SJGDQ=;
        b=apXQ5Roz6Bu7fo9K8YxD5dT60MBuMVEwtFwt/TeqSxnEUm2KAlWVS9gzfP8GAmqVDU
         WlBYlBWTYC/HAptqG+WT8Yv73cIdmBDs2E7yeXurOJPaGB7IACvkUtXgeCto9VjXjw3L
         UBQpN2c9Pcn76/Ly714WrJRHU11g/Y4Lxs8wI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742392684; x=1742997484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKtd2t8952PTcuVOLwmHDgbG6L5yW0pG/+1vL9SJGDQ=;
        b=uhgAk4pVkMlPf2+kEvbQZF6vwGeyd44HODfpuRgFFjaWvrd3fEiHTprIMumh/08wpJ
         wJaPAvLChdo6VcIHoZT+sY3N2iLOF0pRDyjM88Q9G/sjRGSngNiEmYZpt/QzUpL2WK8g
         qHeN2BwzCUqzzIps9yNSFdqEfQNdKgzefC63d7/NAmnImSPegZRP4ntNj6TPgeMG0YTg
         QFBLR7k+EdcqPKN79uU8c+GYMjSrZwxQe6vVrWSLACJaeSw+XAb+k1vIL9oC7QLdTGM/
         Njja2y2H0pmKNAaXzYo8PN11lq3zKFxu0po08Zr0mgWedYP52iJ/7dghA4bLZBv7ff8i
         BQRw==
X-Gm-Message-State: AOJu0YyFwmzJpj7DZHTfXqB15TeGI+4gs+vEylCiIhb8OevhOJSI2BN2
	dK/R1H/qKED54Ak05p2Ds6o5nyIAWv5fUIr7VTuOhZveJGte2PLkGAgMMm3CAJg=
X-Gm-Gg: ASbGncuc43vUaAeIhw/7+he2cLQWTCeg+xi1XyiB+DJvRp3cwGZSA1koQo/arNOL93+
	4niAd22dZtMfspG3+QtgoL9+3S/2Xe/FS4+TfeXXCZiGv5lYK/Xg6WNKTgS0mPRd0I4QBCAoW7L
	QKCjc3JvbYqXDdsCnn2I0ClnUuwoXRbTJrTh9Q+EEvfrUsvDVsRlDsne3+GcpFM8o+kg4Kh+WI2
	lgUFYVVdRXxJV3VbPBbMP9GtJno8eUCmmnI3C6gjR9wWx9AzaPM6hLJJk4+Axw39Hc73nVCT+XF
	KXJZJCt9StJK/6ccIxu4L+0gJzudAyovoVa2HMzJdemSVbEUWgcpFOBINA6K
X-Google-Smtp-Source: AGHT+IGFe/jeaXxH+X4tCUX1vVBAvmULEQ6lRb57Lrvcrvp0B1eijVGHPZgUg0GGxWntK4Nc/vg7CQ==
X-Received: by 2002:a05:600c:1c23:b0:43b:ca8c:fca3 with SMTP id 5b1f17b1804b1-43d4309c349mr25340085e9.11.1742392683952;
        Wed, 19 Mar 2025 06:58:03 -0700 (PDT)
Date: Wed, 19 Mar 2025 14:58:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86/setup: correct off-by-1 in module mapping
Message-ID: <Z9rNaqX-awNOJwSk@macbook.local>
References: <f346b510-dbd1-431a-ad35-3f1b8fe76c58@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f346b510-dbd1-431a-ad35-3f1b8fe76c58@suse.com>

On Wed, Mar 19, 2025 at 12:21:53PM +0100, Jan Beulich wrote:
> If a module's length is an exact multiple of PAGE_SIZE, the 2nd argument
> passed to set_pdx_range() would be one larger than intended. Use
> PFN_{UP,DOWN}() there instead.
> 
> Fixes: cd7cc5320bb2 ("x86/boot: add start and size fields to struct boot_module")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

