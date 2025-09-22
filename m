Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A430B93267
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 21:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127982.1468496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0mcq-00057E-Bm; Mon, 22 Sep 2025 19:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127982.1468496; Mon, 22 Sep 2025 19:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0mcq-00054n-8q; Mon, 22 Sep 2025 19:55:04 +0000
Received: by outflank-mailman (input) for mailman id 1127982;
 Mon, 22 Sep 2025 19:55:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v0mcp-00054h-8X
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 19:55:03 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05ff5217-97ee-11f0-9809-7dc792cee155;
 Mon, 22 Sep 2025 21:55:00 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3f1aff41e7eso3765003f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Sep 2025 12:55:00 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a9b7sm141783005ad.61.2025.09.22.12.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 12:54:59 -0700 (PDT)
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
X-Inumbo-ID: 05ff5217-97ee-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758570900; x=1759175700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kf6fVXTyKM/bSWl10urBHDESq7eI5nKWWBVDyag/ojM=;
        b=eYqTPzgXAAimoK9eH98JukThu8KyC8Lf4GxfA+lwlDTVSvJp7h3gHdyR9H/+4KJgbv
         pGAO7JNk8/YIN4FBTZ+3qrUl8y3G+JRnvX2a6vvzv1fzUKaz0c1VJvG+rDwICX+t8pcy
         t79Ba1BuQAYHrDmCJZF9cbDatdtGb1D4KKBJADXoEfsOgtHmJtpwE5fTJKMe00O5xs+3
         rBfYH3r89cGrovL7YmnruwgaK5/DpQz3+8VYP7yWlQjW0R17ygSGOz7p4egYs9/tU5ns
         YRxaf7LA9a6ZPqUZTei7/TsNVbhcfboygPs2Lui8SQ8fH8T43tuxXk05OacfmkPCiy/v
         3vKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758570900; x=1759175700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kf6fVXTyKM/bSWl10urBHDESq7eI5nKWWBVDyag/ojM=;
        b=WSZPtbuiAj55CRnfLg4z+4lUW8BL9RwG/efDIyr8pex2ExrvlTKyH4nauZ7AqWxkJX
         K4t88OcoaZHyYcK6+0q7EUUA1DvZH6Al+dQPEVVqi+gVg4RXg5O+2+aEDeGWJ8UR9NR5
         QPGpt5Cj6gfFaA8JEXGUIuJkDMxxlZaIWzWkJX7v7CINm4Rv2FD7xZnAQ6LptWwo3qhZ
         mROGtqHSK1NHd0uIfv3tncMH/2aCMgb3h8ejsftIy25BbL1RsYsLxlLGYgRRiANdDVAD
         eDsu0ye7mdpPWskj4fUTZjNXzv5MZ0xFd39onQpSHKPFwmquIC4uwx0wgqfFECOPEsAq
         sLdA==
X-Forwarded-Encrypted: i=1; AJvYcCW2xa1y8Wl32DAg3O0OuP70K0jTB+VLk0hPNk38q+yFJS6sfd5hnOd0bHyyHX/Pj+moEUwgiTjARkk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeU4xFHoJI/Ym+UjMeKzqSh7KbWPAWidJREEIhtx/W9rfhrqXA
	otDC8beTCKLQqSLgcQt2mBK4u0/ZXx8iOgS1sOHooVzbYwy6we1eL3WJQ/GvzWkBHA==
X-Gm-Gg: ASbGncuZ+0XnaYJORUaF+nOJVbZ+LX8lx2I4tx+4GfgzCl13qztlQhs3Bg1uxCiNSnL
	5hUtYRBUV8ElbQb2TSs40ieyS97VL0Y5uZdotLXSGKqd3Kyzv5PDGtXKoqTPT932FBdCHutuX3h
	wtxTxjpbDn6o0rOJQFLmas0l1qq9uEb/C1ypAi5L4MDjVwpO/W15lJZyNNTeseY+qePOiw0kQIp
	uHLnX+XL1eiXvPI7nvtDLCkmPe+YEWo5ULRz6nKFs6t05I+NTiGql2Qy8xhJ1zkk2KwMEJihQbL
	CRycF5gKZvec9uZYLbOcSUsIN1+Z6KH+BDFHaQWZY66/FqPQcZKI+p11oYsUKiOXBdoEhnn/3n7
	5DqQih7qnz6kLD7ocCeoCK+AMYAsq0rtM
X-Google-Smtp-Source: AGHT+IHf9yLkV4eGulB7092KsaIYrAZLwFx0GjyAKX6jZr1m6PnqlpM3W6NITB1mt7+Qv9KR/jAONw==
X-Received: by 2002:a5d:5f48:0:b0:3fa:ff5d:c34a with SMTP id ffacd0b85a97d-3faff5dc8femr6393521f8f.39.1758570900254;
        Mon, 22 Sep 2025 12:55:00 -0700 (PDT)
Message-ID: <085264a3-b42f-47fc-83c9-422854aeef83@suse.com>
Date: Mon, 22 Sep 2025 21:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/18] xen/riscv: implement put_page()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <269250b2b3c62f34446d9e7b9f72dbf2d4eca2e5.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <269250b2b3c62f34446d9e7b9f72dbf2d4eca2e5.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> Implement put_page(), as it will be used by  p2m_put_*-related code.
> 
> Although CONFIG_STATIC_MEMORY has not yet been introduced for RISC-V,
> a stub for PGC_static is added to avoid cluttering the code of
> put_page() with #ifdefs.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> @@ -627,3 +622,23 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>      if ( sync_icache )
>          invalidate_icache();
>  }
> +
> +void put_page(struct page_info *page)
> +{
> +    unsigned long nx, x, y = page->count_info;
> +
> +    do {
> +        ASSERT((y & PGC_count_mask) >= 1);
> +        x  = y;
> +        nx = x - 1;
> +    }
> +    while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );

... style corrected here (just like for "do" the figure brace here also doesn't
want to go onto its own line).

Jan

