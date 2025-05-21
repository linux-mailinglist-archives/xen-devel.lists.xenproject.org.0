Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B130EABECC6
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 09:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991548.1375384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdXY-0002GG-V7; Wed, 21 May 2025 07:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991548.1375384; Wed, 21 May 2025 07:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdXY-0002Dg-Rk; Wed, 21 May 2025 07:07:00 +0000
Received: by outflank-mailman (input) for mailman id 991548;
 Wed, 21 May 2025 07:06:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHdXX-0002Da-72
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 07:06:59 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eca020f-3612-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 09:06:57 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6020ff8d35dso2939288a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 00:06:57 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac32a7fsm8345571a12.56.2025.05.21.00.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 00:06:56 -0700 (PDT)
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
X-Inumbo-ID: 2eca020f-3612-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747811217; x=1748416017; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CxGiJdansaBYx8iz1FSGBIWSTL36s4XGSNjoYs7TQLk=;
        b=PsLtwzmMbUrYKLZXU3TCOKNh3QwDe66OVmcp98vy2M+8cSaf1K6Hwz7ghAyBCH3kjM
         cCoxouzGopJNEB3XHfSdGeraSzwNu6R1y5lS8QCFxcEEbWOuucDp1ApNw34qTyJYYfpe
         P+QTiu0NnPDZJT6PiuAxYFpHkLIh3j50vxxy8FcLUrOAzHFT/gdvkyxMO+A+TOhQBz3o
         fq+J2pC8wqMeAPL86vJ4JfahR9j/TZqrl0F4q2zvnOGUOR8vxuVcsXUIyhnuTMzQMy3V
         9AE6xyC3jzhNLcpPlDh/VXQxi8v4OMOWMN54vVYzHHYFSib3KT0nmEJvSjIpq6XqSexx
         iVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811217; x=1748416017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxGiJdansaBYx8iz1FSGBIWSTL36s4XGSNjoYs7TQLk=;
        b=uJFgs+ZGJOUIrXrRKDBfOy9L8xFWbht31xg27G9oWnksYq7EaZssoJ/q189Pq1dua1
         BTZEF/zcjmaBx/CIYFrzXXpInKPSG9F3GD+ozBdoOtfkkd6acDb4Ej7zJV6V4LGYjFV4
         ONNwjIRwA32qjjLYWfbkYiUzgSMynvoRNK3kaFn5NdT0yJGaDcNucDPvPJdO83IiDN5v
         kPUHDR0SF0okRMtcfXnJ034d8ehhzKCXuXL1RUrHSLozzsUlsxHwMRxnfXA/qW475vvO
         6uioHpcHlQjeWtATgxgxM5dECN2AFAwXSz3vjVa2QLFx9+4mpGF81aTEjVTjITy7Qmxa
         t2/A==
X-Forwarded-Encrypted: i=1; AJvYcCUJ76013+EoysUUG5FFJ+Gr3AtuVZ9ox6u69O055PCSRm5DP2CWYkaANxNvfL4Al0IjYUF7pqiUqzY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcAfTgDY+2ybr5PtjhywjOtDyAG8ehawxf4Pk5q61NWfoSHQqn
	Kw2w8TON7HEImFTfemDZ3njsIsvaPzzbV5OgE1Ra9UXbW9s1chSqTgLz8+YPv/HDsA==
X-Gm-Gg: ASbGncuz9eLYSBJH6+BIVvQPTP+yfChBDe2Ric5Ft9rJDgkAoO/jGd2/KayTvzBE+vQ
	vRepf9h39j3vzwlzxMpE+Tcv/qXPjOjTywCywmWwWixDQdIhaL0ziM/cCENeXmIObf6u/7KhVDq
	jz3u8OaBQf+s1RNvDnQXik1d0I+OPiHMMPIUJpcu1X2/BIhg9/g/H8n6kCFWDOKEZME1AM9ZT6H
	TkLQU6we3Cs4bM2ATKNtPBwMGeioQMnljfAxvBnvhFGndHxnilQFAbeLQlrEAN8wlgv8N/YbFGQ
	UP5J6f7vFbTRup6k8O+352YMNeW+FapctzZS2eMgUspCkhhGBRLf4/FK+6KUYPIvF+9dtHn6
X-Google-Smtp-Source: AGHT+IEzh0IBqxj45Gg3mmkU9VNY2WLCMboGp8hmwoCBeWcDIYQUdFteM4ab2ZlTjWZKYhAYuWa1wA==
X-Received: by 2002:a05:6402:254c:b0:601:a857:52b8 with SMTP id 4fb4d7f45d1cf-601a857586amr12766410a12.6.1747811216633;
        Wed, 21 May 2025 00:06:56 -0700 (PDT)
Message-ID: <847c263c-1fe1-4a68-9962-8d998a3c272d@suse.com>
Date: Wed, 21 May 2025 09:06:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Add install/uninstall targets to
 tests/x86_emulator
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, Michal Orzel
 <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
 <724b77b5-3b78-436e-bd20-726c34bef03b@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <724b77b5-3b78-436e-bd20-726c34bef03b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.05.2025 23:02, Andrew Cooper wrote:
> On 16/05/2024 12:07 pm, Alejandro Vallejo wrote:
>> Bring test_x86_emulator in line with other tests by adding
>> install/uninstall rules.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>>  tools/tests/x86_emulator/Makefile | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
>> index 834b2112e7fe..30edf7e0185d 100644
>> --- a/tools/tests/x86_emulator/Makefile
>> +++ b/tools/tests/x86_emulator/Makefile
>> @@ -269,8 +269,15 @@ clean:
>>  .PHONY: distclean
>>  distclean: clean
>>  
>> -.PHONY: install uninstall
>> -install uninstall:
>> +.PHONY: install
>> +install: all
>> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
>> +	$(if $(TARGET-y),$(INSTALL_PROG) $(TARGET-y) $(DESTDIR)$(LIBEXEC_BIN))
>> +
>> +.PHONY: uninstall
>> +uninstall:
>> +	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGET-y))
>> +
>>  
>>  .PHONY: run32 clean32
>>  ifeq ($(XEN_COMPILE_ARCH),x86_64)
> 
> [starting a clean thread]
> 
> x86_emulator is not special enough to behave differently to the rest of
> tools/.
> 
> Theoretical concerns over cross compiling test_x86_emulator for non-x86
> can be fixed by whomever first wants to do this.
> 
> The very real problem is that this doesn't run in x86 CI, because and
> only because it doesn't have an install target.

Well, I won't insist on any of the adjustments to be made that previously
were discussed, yet I wonder: Elsewhere you complain (at times loudly)
about (building up) technical debt.

Further, without the compiler overridden to be the absolutely newest one
available, coverage of such testing would be limited (especially if some
of my work there would finally, in part after years, be unblocked). Yes,
that's better than nothing, but still ...

Jan

