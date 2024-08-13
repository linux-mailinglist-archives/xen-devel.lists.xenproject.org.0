Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D485C9508BC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 17:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776405.1186560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdtGl-0001cZ-Vw; Tue, 13 Aug 2024 15:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776405.1186560; Tue, 13 Aug 2024 15:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdtGl-0001b1-Si; Tue, 13 Aug 2024 15:17:07 +0000
Received: by outflank-mailman (input) for mailman id 776405;
 Tue, 13 Aug 2024 15:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ynFR=PM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sdtGk-0001av-Jy
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 15:17:06 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15de13c6-5987-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 17:16:59 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52efc60a6e6so7455340e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 08:16:59 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c7fab973sm139802975e9.43.2024.08.13.08.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 08:16:58 -0700 (PDT)
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
X-Inumbo-ID: 15de13c6-5987-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723562219; x=1724167019; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P/6wPJg8aqBR+MdWID8Uj7flyU4c/Mk7eHRI0AvcN2U=;
        b=c6ih0Zn0w9udjoJeQuc5R4p6PS/lzyByIXoLAxnhsa/94NZ7WjBkCtk4MI+/246yR9
         SMMu1WS2JS7b9I6sgT+Y8A7lMaWSXJerOiOEkTaGpmi8r/RmdigDJiXyV8pSvLeLZLLj
         d1gevl2X5i8xMuFNx3RzAFDXapFv7whg7IIB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723562219; x=1724167019;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/6wPJg8aqBR+MdWID8Uj7flyU4c/Mk7eHRI0AvcN2U=;
        b=d0k0faoN2o204ji9d7tlVK2WfWW/1hWURMKCwPSfuK5iN/Kjdn4fLMgqXIM6j4tWMI
         6qK9CEBsnyUSaRngQ7h2u87qKNXnuLegRiOPOscPTIEsXy+47P4h2B6tuZFhG5BEUg3j
         fAHhkKuEz2ekTSboP/WzCAcEOk8HY06OpOSdDIJ4TaZ0V3YhygS+EyLnFvG9yIZrZ7Kt
         KSo3jyriHWQJQOb60TlLLU+7WIN5g17oqZQ49d7H6F6676AcicrI06sSeksOIJe+QHho
         nfxEZBqFQDpK4LYuaZpRfEtXD+YygKdEodZ1IGlsDpUhsTUeLduaju/M8UGMXKNjOscU
         Ot5g==
X-Forwarded-Encrypted: i=1; AJvYcCVtCG8hTI8GbvjD+GBOlWRkK58lsDblSqrkzEFBm7ZixTLWX5M9rhfwDliDZtY7fdJ5/MASn0JGE539Ii/KkhnlPnrw3Sg1OTO7WBBuoUM=
X-Gm-Message-State: AOJu0YxGQ3w+Y16edsRbdhDRkFoK4BJn5cCPPaokppnyE9r1xPSuS9t7
	s1ICDeCalNrlqh7YEAZp2mvaw+r+DW4GJOY/G1MjjugJw1rZU8uFot66Vd0G3DU=
X-Google-Smtp-Source: AGHT+IHEpXOthdbTqmOZyH+h7Xc/lrvYXocF95uysip0fR8mJ1LDsm96ua4rrhVIwcFUc1Z/fFM4Gw==
X-Received: by 2002:a05:6512:b94:b0:52c:dba6:b4cb with SMTP id 2adb3069b0e04-53213657bc6mr2499399e87.13.1723562218734;
        Tue, 13 Aug 2024 08:16:58 -0700 (PDT)
Message-ID: <e4f923c9-5b30-4876-bcf1-7a229b59fb21@citrix.com>
Date: Tue, 13 Aug 2024 16:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: fix UB multiplications in S/G handling
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7c4cb0ee-cddf-434a-95d9-58cec0efd976@suse.com>
 <56e05b29-0fad-426b-bfec-60080e83b3ca@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <56e05b29-0fad-426b-bfec-60080e83b3ca@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/08/2024 2:19 pm, Andrew Cooper wrote:
> On 13/08/2024 1:43 pm, Jan Beulich wrote:
>> The conversion of the shifts to multiplications by the commits tagged
>> below still wasn't quite right: The multiplications (of signed values)
>> can overflow, too. As of 298556c7b5f8 ("x86emul: correct 32-bit address
>> handling for AVX2 gathers") signed multiplication wasn't necessary
>> anymore, though: The necessary sign-extension (if any) will happen as
>> well when using intermediate variables of unsigned long types, and
>> excess address bits are chopped off by truncate_ea().
>>
>> Fixes: b6a907f8c83d ("x86emul: replace UB shifts")
>> Fixes: 21de9680eb59 ("x86emul: replace further UB shifts")
>> Oss-fuzz: 71138

It's too late on this one, but it occurs to me that we probably want

Link: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=71138

rather than an abstract Oss-fuzz number.  The bugtracker entry becomes
public after 90d or when ClusterFuzz thinks we've fixed the bug, and the
full link will be more useful to anyone interested.

~Andrew

