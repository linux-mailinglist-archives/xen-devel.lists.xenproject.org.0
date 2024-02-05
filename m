Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7977984A1B8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 19:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676473.1052612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX3IF-0005Bf-Ei; Mon, 05 Feb 2024 18:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676473.1052612; Mon, 05 Feb 2024 18:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX3IF-00059F-Ay; Mon, 05 Feb 2024 18:02:07 +0000
Received: by outflank-mailman (input) for mailman id 676473;
 Mon, 05 Feb 2024 18:02:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3Sh=JO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rX3IE-000599-71
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 18:02:06 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab3d377e-c450-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 19:02:04 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40f02b8d176so41439265e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 10:02:04 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d5610000000b0033b3ca3a255sm153245wrv.19.2024.02.05.10.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 10:02:03 -0800 (PST)
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
X-Inumbo-ID: ab3d377e-c450-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707156124; x=1707760924; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JT0xhifb6Bu8lOtIVAFqbBuPV+JGQAed1+MCbSuzUDw=;
        b=b1IC2KVV3nEOOWp1AF73nWVMSbv+VnR6GwGVTra54+iiv4uhFJWZ9vdxS+4zARpnIW
         ZC+s6wGZizURPM043Vflpqsp6uvjhls7GQk6zwCVRpTGNSh7V0etVueQ70lMTDvCDMLj
         qF4a0MRvQ5+nbDd9hWtqwHNpj1rfLha9Gk6QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707156124; x=1707760924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JT0xhifb6Bu8lOtIVAFqbBuPV+JGQAed1+MCbSuzUDw=;
        b=QlP14G9XpHSoFPEk2MBf2ZwKeHqNfvP0c1aTSE3Ur18ullO+MppYDUVdv3Wt/hBynN
         QBKwsgkEmmNjDjYDBQabKCHOVyvAbuzUl0foXT+BZYWV6RiLS+r+v20/3TbVVgmOtrzK
         N4wNu6EmwaPGnUdlXNtEbUSxyS4kudRKxUI8IVAG5fRoKq7r4TCPFvHNXoGPXpyeER5l
         jt6OVDOaQtWJ45qvwQPjZmXd+E91fqoDgwff0TBflQAtHqbBITl7zHfYp8YUvygBeX3n
         cztApAXFn7Eqq6StVoUsc7deB9foq96m21pMHuza9Ds0T37nLUiZL0Ua3qgyJVd7Aau9
         BaoQ==
X-Gm-Message-State: AOJu0Yy1rq4DOI0rhfa40RMiVri+ZLJ9/PYmUNSKIAzDO8Hv7CBZweJA
	A2tMh/EcCs+b/MofH6wsu73FMWY7CgN1iTg6HPgJ0pOcNsWfaeKs2yP5C7B1B2s=
X-Google-Smtp-Source: AGHT+IFJIoUb6GxISdeBrVOcE3YOOS0kiKAeGweSNj9mS8qaSOWuAmVFkXw9nv9C+TApSzXocVNb4A==
X-Received: by 2002:a5d:4b8b:0:b0:33b:1588:2250 with SMTP id b11-20020a5d4b8b000000b0033b15882250mr203618wrt.8.1707156123931;
        Mon, 05 Feb 2024 10:02:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVoD7l6baA8cvFKfdwmGrCVXMtbh/DS6Yk5dNoOu/PcHiITV0JHP6wj29Yeda/wLE0l4plMFES1Os0ev0rYpQt8t2W9j5rOl1c9xf0=
Message-ID: <8aab5e27-8b87-43bc-9d53-5af7df37118c@citrix.com>
Date: Mon, 5 Feb 2024 18:02:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xentop: fix sorting bug for some columns
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?zithro_/_Cyril_R=C3=A9bert?= <slack@rabbit.lu>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <1bb93dbf9d09091fa36a3966ad8ffbccdb742166.1707041980.git.slack@rabbit.lu>
 <e8e56c7f-4181-4ad0-8eab-8369dccf9f28@perard>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e8e56c7f-4181-4ad0-8eab-8369dccf9f28@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/02/2024 5:37 pm, Anthony PERARD wrote:
> On Sun, Feb 04, 2024 at 11:19:40AM +0100, zithro / Cyril Rébert wrote:
>> From: Cyril Rébert <slack@rabbit.lu>
>>
>> Sort doesn't work on columns VBD_OO, VBD_RD, VBD_WR and VBD_RSECT.
>> Fix by adjusting variables names in compare functions.
>> Bug fix only. No functional change.
>>
>> Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>
> Looks like this wants:
> Fixes: 91c3e3dc91d6 ("tools/xentop: Display '-' when stats are not available.")
>
> Otherwise, patch looks fine:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Committed, thanks.

~Andrew

