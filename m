Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F769F55ED
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 19:20:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859832.1271930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNcB6-0002cE-Cr; Tue, 17 Dec 2024 18:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859832.1271930; Tue, 17 Dec 2024 18:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNcB6-0002ad-AA; Tue, 17 Dec 2024 18:20:16 +0000
Received: by outflank-mailman (input) for mailman id 859832;
 Tue, 17 Dec 2024 18:20:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DIsX=TK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tNcB4-0002ZT-Oy
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 18:20:14 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8eaee202-bca3-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 19:20:13 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so61253005e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 10:20:13 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801a47csm11911426f8f.44.2024.12.17.10.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 10:20:12 -0800 (PST)
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
X-Inumbo-ID: 8eaee202-bca3-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734459613; x=1735064413; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bMUANBqRM0yAGl6AgHLfacRt4Bq0MyoKLaRuWBwwDxU=;
        b=vBo7kJEURsP7LUk5I9q8r5T3toldI2Zdi8tdBBp9ch83zW+oZjrJyxFp1J1b6Qy/vp
         VwxStnIx1UK3dqR3iAHkbL3cKzSUZwN7ifBqBMw5hqQV6zZh8hqI4e5z7BwoDAXjvbBE
         /9wW8r+Xtvu1oTnS68Nf7JRg8wxALJeYt+/Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734459613; x=1735064413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMUANBqRM0yAGl6AgHLfacRt4Bq0MyoKLaRuWBwwDxU=;
        b=iZ7KEU7JRDIuSAtXCwBcy/rOpzx/oIX5cVm6ye9PUIQMmqp9Mj+8SA/K9HTDM7gxDH
         4HVdlSG6Cu+meyMnBCl/RJhPyQYx/bcA5rUkrIVKPx99TyKzp2sTeXxyTuOTUl+DIabI
         UYLRIvkjXG72hvITEtdHi1dznmuiBD/fWVPYVLxLytS0CYkgZ7FYRm+LpXZObPz/+b6D
         cfG/RbbcmyNmQfDr97A7GEGeoBmecQeQn8o7CYq7z8jCzL6rLKyrnlZNEnQ5QlAe9FVe
         cuJNvx6Xi1GZUaNam2lpoJKH+AzlXrJXu0nuaCfinqD5uXZWDpI4WiIAcUByJtnxsuBm
         iuTw==
X-Gm-Message-State: AOJu0YwuAWeYXbhrPP7v0yIGAPNYF/MaARJIFnmJNOXS+B6tn5tD9/TB
	DhcTVUNXXNHm/e4wA2Ok3++U7EajOYlnII3nQKKzfKVs67ZzrSQsI64eCXZElX8=
X-Gm-Gg: ASbGncsYP+LNgIyKo4UFS2qeZfyR44LH/7guqphaESTlYb3SxERCTb9N+81kXpQEYvD
	X+Ldr964FV8EytPsXCzb5NpActons3bt7pRPfkDTB0qH4f86iGIoe8B61s4zepm9O/H+9D7KsBG
	X33A4mXFWg7IDY/jF4buAkEQrz/dzcqXP9rPv1OvTZihmIStKaFHN5pUauG1Xa5zphoVJi6ScXc
	kxGL3UNedfUUgKT7oyLoQDY1LWHBltUAHanWNuh+0L9zBav4EQUbLFT/eaguAiGyFI=
X-Google-Smtp-Source: AGHT+IFIZTE0jnSsaJe5VKVG8C5So7Oa/HsT8HjigijWiCCgHNRUBhZbRC8tmZzAGuRtn7euDQjDnA==
X-Received: by 2002:a05:600c:c87:b0:431:5df7:b310 with SMTP id 5b1f17b1804b1-4362aa2771fmr140196005e9.8.1734459612671;
        Tue, 17 Dec 2024 10:20:12 -0800 (PST)
Date: Tue, 17 Dec 2024 19:20:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: Re: [PATCH] MISRA: Unmark Rules 1.1 and 2.1 as clean following
 Eclair upgrade
Message-ID: <Z2HA23_k4GFwo7-J@macbook.local>
References: <20241217172950.43626-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217172950.43626-1-andrew.cooper3@citrix.com>

On Tue, Dec 17, 2024 at 05:29:50PM +0000, Andrew Cooper wrote:
> Updating the Eclair runner has had knock-on effects with previously-clean
> rules now flagging violations:
> 
>  - x86:   Rule 1.1, 1940 violations
>  - ARM64: Rule 1.1, 725 violations, Rule 2.1, 255 violations
> 
> Fixes: 631f535a3d4f ("xen: update ECLAIR service identifiers from MC3R1 to MC3A2.")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

