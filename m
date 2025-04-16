Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFBA8B3D8
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 10:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955315.1349116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4y9g-000215-Kk; Wed, 16 Apr 2025 08:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955315.1349116; Wed, 16 Apr 2025 08:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4y9g-0001yW-HW; Wed, 16 Apr 2025 08:30:00 +0000
Received: by outflank-mailman (input) for mailman id 955315;
 Wed, 16 Apr 2025 08:29:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4y9f-0001yQ-ES
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 08:29:59 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb100600-1a9c-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 10:29:58 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso48304565e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 01:29:57 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b54579fsm14079415e9.40.2025.04.16.01.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 01:29:56 -0700 (PDT)
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
X-Inumbo-ID: fb100600-1a9c-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744792197; x=1745396997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YVid2WeVnAjBzMSJ0mKNpFLIYiLYOG1PPV7THfdvBCI=;
        b=DBoCCXzlUTU9RaILaallE4vydmGp78Td5pQEazTy1zuFFCwh+jNZXVO4eQGc08K2sD
         qkZ44i4ETObS/1/BjZaYYNDiipeGSpQI8U6PgWTcUtnZq9CSyd4cDx282NNScZX+6pmN
         DSS4EybJ3EFPHbbzwqOneq7A/pEppURudnvG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792197; x=1745396997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVid2WeVnAjBzMSJ0mKNpFLIYiLYOG1PPV7THfdvBCI=;
        b=JC4bkpzJV5EhG+atY9OkbOxyvvkXpwGB5tDBYRVH35fhI4ZCuQ29hPD1X4mgMxx/s6
         JQIpzCow4yE1qiCTq4GXd+6t4nW9OFd9ROO36NW6kSrYV5kAMor3NmWU16p25FAkBIRL
         ti3WMKH14ylJEXlPGD628ZRqUK68VR8bbz62rWTHSOGOus+CVnmeAzJKo1KTJpWdHGXo
         JQK6VJ/FGLlEpdnLzczK5QGk0B71j43CViIdWmivG8Ld4e3zKSTRvRC3dK9KlhU0WBp2
         riYrPsqIMd8oED4sHbws0NzG37Xrn7ErbPBsQbXcD61SsmusZnSOXL056nccmevnlEUH
         c4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQU+nBWgjTDazlruBClF3Ij1itZoOf0GMbfnFSGknQz9MI00akB2fTR3y8oCBQIPnJRf/0BuPe2rE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXzjzM/f2M3fia0exGcLYccq/khyod6DT/qR753jy2zBdoBLI+
	obBCl7QtphtT6xXQI/+Eef657/aI9XTWoOUMtHOyCzT7mZpTdDbqHXdBtR5cBJA=
X-Gm-Gg: ASbGnct9Wtj8AHvVmeaAuSEz1/IUVqGB0CD7try/wiPF7p1WoAUnTx90XhNhiCmMJMR
	kVxhDP2iY0B/SJDGleH1pIcywHYavp6dvx1qTIBXoRLPOpvUoiwxlg+z2PkPCImf15A5QJtC69E
	UKOWb3o3iQeQMY/gFBnRWUIP+6AYZwYuyFwOcBxcE2nlDNQ3EMGMymS4MKiRyWN4LvAxo7sL5Tp
	fhKxHxO3U1GKGvZakOVhpmUdg42WJy5RrA5jUDrbxnSVhY/YmP3JXE9yIWRLpxmQ0PpHJBHVq+6
	pauAhtVfc2dBkavHpmOt/MvmXAgVBrCZRGGU4JxgeNXSOi5zK3wGKOB6X7hUillXxDFNIhrgsJv
	eC+5PSw==
X-Google-Smtp-Source: AGHT+IFmfn4wJ8o/kqMGspMwPVCD91TcD4q18Rdwl5SJAonnb3xzQtRIcgdLo812kSZAKUqj8ueP/Q==
X-Received: by 2002:a05:600c:1c22:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-4405d62a53fmr9496095e9.17.1744792197354;
        Wed, 16 Apr 2025 01:29:57 -0700 (PDT)
Message-ID: <fdfed991-d95b-4290-ad98-025a789eecc2@citrix.com>
Date: Wed, 16 Apr 2025 09:29:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/io: provide helpers for multi size MMIO
 accesses
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250415153246.81688-1-roger.pau@citrix.com>
 <20250415153246.81688-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250415153246.81688-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/04/2025 4:32 pm, Roger Pau Monne wrote:
> diff --git a/xen/include/xen/io.h b/xen/include/xen/io.h
> new file mode 100644
> index 000000000000..4495a04c403e
> --- /dev/null
> +++ b/xen/include/xen/io.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * IO related routines.
> + *
> + * Copyright (c) 2025 Cloud Software Group
> + */
> +#ifndef XEN_IO_H
> +#define XEN_IO_H
> +
> +#include <xen/bug.h>
> +
> +#include <asm/io.h>
> +
> +static inline unsigned long read_mmio(const volatile void __iomem *mem,

void *__iomem.  (i.e. without the __iomem in the middle of the type). 
It seems most examples of this in Xen are wrong.

~Andrew

