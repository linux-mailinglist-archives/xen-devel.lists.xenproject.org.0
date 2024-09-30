Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC0A98A86A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807489.1218985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIIs-0002PK-MI; Mon, 30 Sep 2024 15:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807489.1218985; Mon, 30 Sep 2024 15:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIIs-0002NR-JL; Mon, 30 Sep 2024 15:27:14 +0000
Received: by outflank-mailman (input) for mailman id 807489;
 Mon, 30 Sep 2024 15:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Bw3=Q4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svIIr-0002Lr-4t
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:27:13 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 760be887-7f40-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 17:27:10 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c896b9b3e1so2002429a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:27:10 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2775cfdsm542311066b.23.2024.09.30.08.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 08:27:04 -0700 (PDT)
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
X-Inumbo-ID: 760be887-7f40-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727710030; x=1728314830; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bBl9XnT5sz70/xbZOiGKCvvV21GsjFxdel4CurJrVhs=;
        b=Sry7Txo1XX661JBF45ZVshNbTIRnMB2AMfcN1SIqqAmcL3+V/iXI6sHu1TA7fMxOgh
         rhH1YHHOCsSCSCfuSdzmVGE2HbFtgcX64uosOftii5D5R1RJkBtPmsoSJjHdCFTmlqV4
         hLunHp+o2R0abRxTIJ+hrRBrLtB9ifERdynEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727710030; x=1728314830;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBl9XnT5sz70/xbZOiGKCvvV21GsjFxdel4CurJrVhs=;
        b=CRsPP+72sC/zAVOqBt/qZIbAUoDnORrHTrjHeb46ySe3711FMNv+H5xYWxJYRoRVgI
         t3JSS3Hg6GqbLaKWk1N9/gmT8FuQMe2RrzetkfbqO8YDWo7m+Qw3n/NjZAXSBiEs++h7
         r/ABOolEl/Jq/h3aShSTwkuu3SsZqYLkJxGKIm+ERkGZ+IB76KKVzIsjAT9GJsWDNMB/
         NP7l58R5t8oIXmRs7+aqjtksmpGLVw3xww5Llje0HJIMDbwqwlruw9MCTZidJuK3a2Bm
         KvAMMI8obt52IY+ghY1v4SzG6MniKcFokVPWrC0XCGdUnnx9ZgN63vESJKq+Db5CFU0J
         Rnsg==
X-Forwarded-Encrypted: i=1; AJvYcCWiT2eEe1hhV1XIRtNCNz4kLyeyj2k6JI9Zeno4rb2mrQhac5o68zvtkONQYyoTfZqT1mboZPTZVBQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxb98XbBW+qMKu+pblPPj04u54wjYPqzSUAojecx7nqZmm2BNg7
	WSX80Ijp0q53wL22IXXryrPVn/6YiH7wq30s3RGTpL/RUf7zb3KmqMkd38V25tYyxVc/58lF6KM
	m2Gw=
X-Google-Smtp-Source: AGHT+IEn0U4IpjfVKrquKPBO3bmXDwLCHuJTZy0CM79WRokS8ULoYGsh4xdf0D3/RJulYLGQMFCeCQ==
X-Received: by 2002:a17:907:a4e:b0:a90:b73f:61d1 with SMTP id a640c23a62f3a-a93c4a4e0damr1439041066b.51.1727710024477;
        Mon, 30 Sep 2024 08:27:04 -0700 (PDT)
Message-ID: <ec956d90-0ee6-43a6-9c6d-0f8b97a7c570@citrix.com>
Date: Mon, 30 Sep 2024 16:27:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: use alternative_input() in cache_flush()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <60fb1103-aef3-40dd-afd0-44f594753165@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <60fb1103-aef3-40dd-afd0-44f594753165@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/09/2024 4:09 pm, Jan Beulich wrote:
> There's no point using alternative_io() when there are no outputs.
>
> No functional change.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/flushtlb.c
> +++ b/xen/arch/x86/flushtlb.c
> @@ -286,11 +286,10 @@ void cache_flush(const void *addr, unsig
>           * + prefix than a clflush + nop, and hence the prefix is added instead
>           * of letting the alternative framework fill the gap by appending nops.
>           */
> -        alternative_io("ds; clflush %[p]",
> -                       "data16 clflush %[p]", /* clflushopt */
> -                       X86_FEATURE_CLFLUSHOPT,
> -                       /* no outputs */,
> -                       [p] "m" (*(const char *)(addr)));
> +        alternative_input("ds; clflush %[p]",

Drop the ; as you're altering the line anyway?

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

However, switching to ds ds will avoid a trailing nop, so will be
marginally better.

> +                          "data16 clflush %[p]", /* clflushopt */
> +                           X86_FEATURE_CLFLUSHOPT,
> +                           [p] "m" (*(const char *)(addr)));
>      }
>  
>      alternative_2("",


