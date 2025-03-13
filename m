Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598B1A5FAC8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:07:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912734.1318946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsl5a-0002go-AZ; Thu, 13 Mar 2025 16:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912734.1318946; Thu, 13 Mar 2025 16:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsl5a-0002eB-6x; Thu, 13 Mar 2025 16:07:18 +0000
Received: by outflank-mailman (input) for mailman id 912734;
 Thu, 13 Mar 2025 16:07:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsl5Z-0002e5-CM
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:07:17 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bb366f3-0025-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:07:16 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so10656305e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:07:16 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8c5cf7sm60272015e9.29.2025.03.13.09.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:07:15 -0700 (PDT)
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
X-Inumbo-ID: 3bb366f3-0025-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741882036; x=1742486836; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZneD6VcGUopBQWhwzYjMP+/HE5ihvm3CickRHK7Qcs=;
        b=gDlSxKhlDoo/u7HfvvDH7k6Fu5MZ+fQwcJuZGnbDNVNsHP4xU7YAk46bLMcuoEb87Y
         YU9UjrAaySeynOt8whdFsgyp1Y5dSkINqQtqSm11xfppZR1IIBnphtHYSibxPRH0hG3X
         X8yweqEjE4T62Egv1PpEyJPtTZ/Ord3lIMjh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741882036; x=1742486836;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZneD6VcGUopBQWhwzYjMP+/HE5ihvm3CickRHK7Qcs=;
        b=H4EfDyAV5yqhoJNqPR5nKjk7qGy0QtHNutOkhcvUAis6VsVFDhayDRW2Sgf/P56942
         dZzh0cCcXi/8BsRrU11bfpIll+X+HAr7JMwGeWviPShnagDkKiXufCvR62ADv3acD0Zm
         FvRIR7FsDyCvpBxzCi4HjrfV5NL1di1PVMzwCf20NE3/MvEk/XjIeOuLDbdHcxD7IYrF
         fJGSAbStLWQSFXod5dFxIVfaW0tGjuJOCv4UVXOzfUuRyLd5LVvH36o/C45shV/Nsaiy
         4CdcpRWq+nU6UudFal8GZv9itO1QY1ansk1mnMl8idF9Nmi4V+sh6HnsQfgsALHBebpQ
         bJjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaZD6zEHHjiv/jmQmUHJkxs+3JlaFO5xohRoYSiQwM+20YjuoU/bOGxhD+kxNXwcPOQNjY31om7ow=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYCX6HhMxDIBNbB3MV3m456zpyVEtgd5ZphxiVkpOgnyrEi7gl
	ZZLm43DZ/1neTZbShDJH77l+BgeE4FZy45YlxdDNFf8Wiz5OyNhGwv1AnMUNbvc=
X-Gm-Gg: ASbGncuHtp6MFlJaM71IPXE+EHrvbULzbDVYBcjg7pSd/2lx/yUWrFamca183MEhE6O
	Bq6A3MpwZ+H1pTzapAMayAlMKbJiSGDXgvwBa53oolL3yWuZtFCihpJEBXFYW05HftZaZH1irCu
	waaq+WgI65hi+I0qqBPeRwOFvdeHVoPhPfX4tlOdxflXkAp32gGsFL/ScJP3pC8r+MyjpXXe4Ad
	bIDkhxKk4W91Ebz1wcS29No4dnVvvrzkfeAMjBbdklMNycXbd9h1b5kKQ+r01TvQo9fCPgS8sLp
	tXWHAWhucl9yMK0/lCYRMU9Arz9rfN5J8Imr1+F/HUvYuj6xxP5RC+bfBnS5FLdjuNJVuDeTeIR
	Uo5zZO/bY
X-Google-Smtp-Source: AGHT+IGeC7EfQnhXysmrsaQJtuumvDVfKQSrCjD2s1pAhigFvkVwJuAM2VyriTo7c/KMj1FeG4W9Dw==
X-Received: by 2002:a05:600c:3502:b0:43c:eb63:415d with SMTP id 5b1f17b1804b1-43d1d8c34ffmr2555885e9.14.1741882035895;
        Thu, 13 Mar 2025 09:07:15 -0700 (PDT)
Message-ID: <748ebdd6-9518-4c6b-9dd3-7ffd13ea08c7@citrix.com>
Date: Thu, 13 Mar 2025 16:07:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] symbols: don't over-align generated data
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
 <816a0320-d229-4f7e-b1b5-51dbb640c5c8@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <816a0320-d229-4f7e-b1b5-51dbb640c5c8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/03/2025 1:53 pm, Jan Beulich wrote:
> x86 is one of the few architectures where .align has the same meaning as
> .balign; most other architectures (Arm, PPC, and RISC-V in particular)
> give it the same meaning as .p2align. Aligning every one of these item
> to 256 bytes (on all 64-bit architectures except x86-64) is clearly too
> much.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Even uniformly aligning to 4 (x86, Arm32) or 8 bytes is too much imo,
> when some of the items require only 1- or 2-byte alignment.

It matters about the largest item, not the smallest.

>
> Is there a reason only x86 defines SYMBOLS_ORIGIN, to halve the address
> table in size? (Arm32 and other possible 32-bit ports of course have no
> need for doing so, but for 64-bit ones that can make quite a bit of a
> difference.)

I think the likely answer is that noone really understands how the
symbol generation works, and didn't know that setting SYMBOLS_ORIGIN
would be relevant.

I had a nasty interaction with the symbol code for the IDT-gen work, and
it took a while to even get this intermediate file out.

~Andrew

