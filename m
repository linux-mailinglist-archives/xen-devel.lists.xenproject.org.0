Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF3EA97706
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 22:23:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963580.1354549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7K96-00037g-4U; Tue, 22 Apr 2025 20:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963580.1354549; Tue, 22 Apr 2025 20:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7K96-00034Y-1D; Tue, 22 Apr 2025 20:23:08 +0000
Received: by outflank-mailman (input) for mailman id 963580;
 Tue, 22 Apr 2025 20:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7K94-00034S-Ra
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 20:23:06 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 988a84fc-1fb7-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 22:23:04 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so7131443f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 13:23:04 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4330d8sm16695020f8f.33.2025.04.22.13.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 13:23:03 -0700 (PDT)
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
X-Inumbo-ID: 988a84fc-1fb7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745353384; x=1745958184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AIvWt5pMUo6UnScq1FNG6amcll0cAdU9YYX6d0KaakE=;
        b=g7KzW9x6TTMYdUFrDWlIJTa8hEbbpBPIRXPV2F/U7RLVFupmDKKJfXn6ub/CfMEdWx
         fHQkUT9cGs0h/cfpcrfLXF91RFcv6ChHsHTo0uo+T1BuisdXSj7hP2eOgg7YXzxIkjzH
         t3h86mzg/wggdkF0Lc25Q9xcVI+s+7M5rrKzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745353384; x=1745958184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIvWt5pMUo6UnScq1FNG6amcll0cAdU9YYX6d0KaakE=;
        b=lIj7ZuKR1aW48YSxqE9Tg1iThdBtWu42rmBlxLsO3ImUxQ7h6UpRuZm77H2cTlAXlg
         8so9DhtbrHiTApWSKgrsT/38u3bImKrDOuobOZOjZ0+srSgZCkOTUVBnK0c7htOLfF34
         q4TbPtkzJ2nY/4a22A0yfiAU//cHp0yNvyyl46KXeTeTyQdvoA4hYG2l8apTXnp7AkDy
         38PWXCwYV6NPGi4s9bsBdQtYeUY/wtLs0QMXlqLaXEo7r/xLdveKu1ABaO+H1Bp7ks/S
         qKca3mjSjyn+Au1A2kd9R3HSAnjCWnJXMNE2TE4TB4dobFahymWkhE6EXXnhGRWVIqdT
         hhcw==
X-Forwarded-Encrypted: i=1; AJvYcCWQnCDmsL+emmxzqbHQA8zt5oLTUeRQGqaB42PGwh2GzubJJsFkoJc0piHyBzh6Dlgcwby3F8/QVsY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXo4slZOq5xIqzTE0JYSfpfazv8OJ4Shob01Mr5dfjr/8t1lVU
	OZPe3PSCprGw7bcbhPosZzXDcAQZ6o57KEMtZ7BlBE2AMsCZyCsaBiL40FQCbnA=
X-Gm-Gg: ASbGncvPyMwff1C5j3b8Bcn55za8XAD6BKL4Kl4ZcbssS/2QNAy5bItC1sf6MAvub3o
	n/Df6oe2sstUjhVqu+Q4ZVB7QP0/HGkJgFQFcHhaRZgz9ppcJH9ZZC0fE2XFXv6L+BFJuG67amc
	wJxxMgBvLT08SlK62al3kJ/a1taisCnVjhGdbmjdnzXEkK3wmDeJ6yG7eTf/Q4Q/sAVwSiUd6bl
	02dj4hY+dawKtxCpMZhdycptcx4L/6Zq2tqpLnThSym8BhgPE/GbkND9mC5hrTh6jQ4SK7lu5Kp
	wh6bzOfKhlzCFcA3RYhefoMFmAhKtMoNoV583GjJEJzyy174JD3UFTwCV+1DGxz5
X-Google-Smtp-Source: AGHT+IG41MPOMzIk5HtfFxmbe0Xae4oi1gdV7Bni+1G+w4WVtaN4O8FSBhw8BHMPaq4iyw475Y1exQ==
X-Received: by 2002:a05:6000:4029:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-39efba454demr12520039f8f.24.1745353384217;
        Tue, 22 Apr 2025 13:23:04 -0700 (PDT)
Message-ID: <6bd0a24d-4f16-4d21-a660-c29407952bb2@citrix.com>
Date: Tue, 22 Apr 2025 21:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/21] include/xen/slr_table.h: Secure Launch Resource
 Table definitions
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 trenchboot-devel@googlegroups.com
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <1cf5d940e666b2b292fc84ed1fbb8a95cd57f027.1745172094.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1cf5d940e666b2b292fc84ed1fbb8a95cd57f027.1745172094.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/04/2025 4:06 pm, Sergii Dmytruk wrote:
> diff --git a/xen/include/xen/slr_table.h b/xen/include/xen/slr_table.h
> new file mode 100644
> index 0000000000..e9dbac5d0a
> --- /dev/null
> +++ b/xen/include/xen/slr_table.h
> @@ -0,0 +1,274 @@
> +/* SPDX-License-Identifier: GPL-3.0-or-later */

I'm sorry, but we cannot accept this submission.

Xen is GPL-2-only, and can only accept source code compatible with this
license.  Everything else in this series appears to be compatible (and
therefore is fine), but this patch is not.

~Andrew

