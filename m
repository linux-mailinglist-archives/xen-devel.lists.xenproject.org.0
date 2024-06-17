Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69C890ACD0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 13:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742235.1148991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJARg-0002WX-Ot; Mon, 17 Jun 2024 11:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742235.1148991; Mon, 17 Jun 2024 11:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJARg-0002U8-LQ; Mon, 17 Jun 2024 11:22:44 +0000
Received: by outflank-mailman (input) for mailman id 742235;
 Mon, 17 Jun 2024 11:22:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJARe-0002S7-Tx
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 11:22:42 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8a91a34-2c9b-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 13:22:40 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a6f8ebbd268so52559666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 04:22:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f6b2b04f5sm356461566b.192.2024.06.17.04.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:22:39 -0700 (PDT)
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
X-Inumbo-ID: e8a91a34-2c9b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718623360; x=1719228160; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeL/w+Lw/tfH+gPjLo/DZiUR7+US6eJWedp8tMKIQJI=;
        b=OtSdzJ8g5WSK8ejvStNXssSWXRuEoj3vgRUYUq95ddYmP7tVxqILxt2fdlm9kukrfj
         HdDlgOgtkfcc8aYI10bHghFoftcdYsO1fqd/MLFXk4Jf1LPcTJbUz/qVz8SHB3m7yZJH
         90UVUWbTvsM+8mdZNaxXP+9GRMwdnJARrkRSkJu0opgsU3QIwknQBUxF+4bWp4SazMmD
         HtGyLhmPSKwG1b5i0HjEOqi9RvflTl6Hqg5gdD8cGe+AwPpxNZ/5rfZKRGPNwqw0Lxz3
         oyCi8H/Ox8Bg/5YmVNMt65LcyPVtZa2AOUS8F4Dc4bcV957DHg7u4g3BjUSwTrTUswDr
         Twag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718623360; x=1719228160;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WeL/w+Lw/tfH+gPjLo/DZiUR7+US6eJWedp8tMKIQJI=;
        b=ee2yqlZDkYA8y7ItEoXaO2nqTej49BoHOWW7AGfRga3YFmI3p5Sq26HXmKD5LNHzFw
         reDZYpnuOFCi57cc3g8UAVK3rAk1dGUDfjt99XdyIASWy3cLyEcx0MEWj7A7CS6pQ5qH
         5TntvWYHSfZYS65OUC0KfB/iWsR7oR1Hp3zR3sK405O4jhKgpbghRM8fHVJS/Hke2eqM
         NNft0rbq2x0a5d+O2q2pbctI94+jFZNeQNtslSBMNP9wNkpt0nocNU6LlGu2v502wJST
         cCvJQGdxzIZeDqyVQz81U7qYMa7lsCoej7Pf7wZ9nCrIaC9dc9x7JFniAM3RGMkB33B9
         R2Xw==
X-Gm-Message-State: AOJu0Yz0jXxKVIIJl2V3UoVgoPhUz2xH2lM1+potmwntsEFiEETtrWUd
	qzoiDi0HNBKTvcGxwslLk14bPCx4bgxX79+mfsp74jl+IsztfgfDkT5OyQ3ZIffF4bq5qy1PY4c
	=
X-Google-Smtp-Source: AGHT+IFmKpg4saMv7jrHZDM9iJOTh0sI61WnQiO+PFfwP+GFiamq2KErJ+Xpzud/CEsoLiWUiqgm/w==
X-Received: by 2002:a17:907:6e87:b0:a6f:7707:b846 with SMTP id a640c23a62f3a-a6f7707b91bmr479569966b.15.1718623360213;
        Mon, 17 Jun 2024 04:22:40 -0700 (PDT)
Message-ID: <a5a8a016-2107-46fb-896b-2baaf66566d4@suse.com>
Date: Mon, 17 Jun 2024 13:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: ACPI NVS range conflicting with Dom0 page tables (or kernel image)
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

while it feels like we had a similar situation before, I can't seem to be
able to find traces thereof, or associated (Linux) commits.

With

(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4000000
...
(XEN)  Dom0 alloc.:   0000000440000000->0000000448000000 (619175 pages to be allocated)
...
(XEN)  Loaded kernel: ffffffff81000000->ffffffff84000000

the kernel occupies the space from 16Mb to 64Mb in the initial allocation.
Page tables come (almost) directly above:

(XEN)  Page tables:   ffffffff84001000->ffffffff84026000

I.e. they're just above the 64Mb boundary. Yet sadly in the host E820 map
there is

(XEN)  [0000000004000000, 0000000004009fff] (ACPI NVS)

i.e. a non-RAM range starting at 64Mb. The kernel (currently) won't tolerate
such an overlap (also if it was overlapping the kernel image, e.g. if on the
machine in question s sufficiently much larger kernel was used). Yet with its
fundamental goal of making its E820 match the host one I'm also in trouble
thinking of possible solutions / workarounds. I certainly do not see Xen
trying to cover for this, as the E820 map re-arrangement is purely a kernel
side decision (forward ported kernels got away without, and what e.g. the
BSDs do is entirely unknown to me).

Jan

