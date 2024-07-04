Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2725C926F26
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 07:55:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753518.1161700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPFQP-00054G-S1; Thu, 04 Jul 2024 05:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753518.1161700; Thu, 04 Jul 2024 05:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPFQP-00052U-PT; Thu, 04 Jul 2024 05:54:33 +0000
Received: by outflank-mailman (input) for mailman id 753518;
 Thu, 04 Jul 2024 05:54:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8exS=OE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sPFQO-00052O-EF
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 05:54:32 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1358b5d-39c9-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 07:54:30 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a72b3e1c14cso27011566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 22:54:30 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab08fe92sm564774366b.167.2024.07.03.22.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 22:54:29 -0700 (PDT)
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
X-Inumbo-ID: e1358b5d-39c9-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720072470; x=1720677270; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHTP9Pb69J4FJa1GFtxUQaE5wBMKsB5TTew6MzAdF3A=;
        b=JY5iV9rQzJtkvpXTrqtAOVty45cu0Z0X2m9mHHkegyQsdVMJq9/QL8VVa10teks80c
         xRLQpRiwH9d1Mjcf8UzbgkB+jKRkzEz3/xEdbqh0PSLydO4Ja3SMGkwOx5weNKjZzlXk
         WwFdr+WSwLudOPGK1Ua0Gsuu3DoSZdtxGcU20VOSix7Phmtlw08wpTVy7OfUUEH1566d
         5eK/X447iDgI35D1wNxV+eIO1YNGZqf2Snn3CWFfZ0BBr9ptR0Pybcyec5inPauLza0F
         zhhdgwYJqANozBwb/aswm9X9itWIJsSF+FZqCdJgNvBffza9RVzQ0QfLtF0YHV2pxOzI
         a0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720072470; x=1720677270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHTP9Pb69J4FJa1GFtxUQaE5wBMKsB5TTew6MzAdF3A=;
        b=Ii4P5h4qZ8Eq4EFjpvdlyPD4aa0QgAkh+dfnFeR5hoO5AI30DbF08Fz7URBioJBFxM
         J8q422QJr7F0QeOPgac75Y7oh6Ic2+Lvs9pIDj8OH7Y2barTMg1Ppqd4X1+N5ZoZz3Ml
         ZAZzxroS7ZUSPeWxOxWok+q5YBcCTFSUdmwXrd/w5Sh2QfU12EW8IS2n0U0kpaiKZQZM
         f7bF1M7tu88li9Q14Q4a2P+cJ+PLy/vYO+O3guLuE1xE9LXgVS0+f0R8R2lmrkF45cQn
         5bCxckI8xgIPPiUpkBHOVgDL78lajKgZofJZdveeeqx3b5rGElmsY3O3kj3VbULV51mk
         LJpA==
X-Forwarded-Encrypted: i=1; AJvYcCXnkfaMpg9HMkJT/xx+dN9zjWUkKDoUkLL1NzpMgC34uSQHIdut232yA9Z4Iu3bK9QGY0uum6XQSVOPI+pMdWiZ4+0fLZfrupCscSApKgk=
X-Gm-Message-State: AOJu0YyocwDrGVzopzpTAE+Dps9VG+G7PWta1gdsJS4l2ZAN44blTKT/
	oRaCqguhQBzvmFQXat8d2tmy3XVYUUXfsdnoFmt40Suhv2ov8QkzyDTtEEAOo0rxEtkmkcpbCtm
	X
X-Google-Smtp-Source: AGHT+IECblegWoH+FIegRrtHQ1K81nXXK8wGwkjKX8MvGeZeDNhTgV+tsEWI9RgpMLosZOS6RVvdpA==
X-Received: by 2002:a17:907:3d9f:b0:a75:410c:ecb0 with SMTP id a640c23a62f3a-a77ba72d72cmr44123966b.67.1720072469672;
        Wed, 03 Jul 2024 22:54:29 -0700 (PDT)
Message-ID: <bef12206-8cf3-45dc-896d-53b6c3d28c68@suse.com>
Date: Thu, 4 Jul 2024 07:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] tools/xs-clients: Fix `make clean` rule
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240703223611.1754927-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240703223611.1754927-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.07.24 00:36, Andrew Cooper wrote:
> Prior to the split, "the clients" used tools/xenstored/Makefile.common whose
> clean rule includes *.o whereas after the split, the removal of *.o was lost
> by virtule of not including Makefile.common any more.
> 
> This is the bug behind the following build error:
> 
>    make[2]: Entering directory '/local/xen.git/tools/xs-clients'
>    gcc     xenstore_client.o    (snip)
>    /usr/bin/ld: xenstore_client.o: relocation R_X86_64_32S against `.rodata' can not be used when making a PIE object; recompile with -fPIE
>    /usr/bin/ld: failed to set dynamic section sizes: bad value
>    collect2: error: ld returned 1 exit status
>    make[2]: *** [Makefile:35: xenstore] Error 1
> 
> which was caused by `make clean` not properly cleaning the tree as I was
> swapping between various build containers.
> 
> Switch to a plain single-colon clean rule.
> 
> Fixes: 5c293058b130 ("tools/xenstore: move xenstored sources into dedicated directory")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


