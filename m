Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74165818BC7
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 17:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657008.1025594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcbL-0003Fh-42; Tue, 19 Dec 2023 16:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657008.1025594; Tue, 19 Dec 2023 16:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcbL-0003Cu-0n; Tue, 19 Dec 2023 16:05:47 +0000
Received: by outflank-mailman (input) for mailman id 657008;
 Tue, 19 Dec 2023 16:05:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rImv=H6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rFcbJ-0003Co-Bg
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 16:05:45 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7617fce5-9e88-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 17:05:43 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d12ade25dso33753245e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 08:05:43 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 hg12-20020a05600c538c00b0040c41846923sm3370070wmb.26.2023.12.19.08.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 08:05:42 -0800 (PST)
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
X-Inumbo-ID: 7617fce5-9e88-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703001942; x=1703606742; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/kSj0FPle71j9+QgIZBI/rTtsRZdkZJUMFrjuLr1lY=;
        b=MVCqRF1jp5MbkNMPThF/Yqa74t3UtlMAdaGD+zhp/sCOBVs8vXxYVONzOVZQWgUAIK
         Ws6t8+Z0CgsrjzAogoFoH8b9O0fQIbVExTNa9rrNhYdVIKVZ0CUtBPnZRx/+kA65arH3
         SIrmscVsduKMqCUbQs2Ga/ST31s8SQYPZizvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703001942; x=1703606742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/kSj0FPle71j9+QgIZBI/rTtsRZdkZJUMFrjuLr1lY=;
        b=sGBJHgBT/tzOsarPVJcZJWxSkejDx6/Hnad9VFbrj0wkl7MDwmEQWpASdfA9I/97i/
         TzFt0j27fyd7Z6eUeqV6irAhVUuM5WFb0bMP1dbMqBdHPQmBM21yovEPYxXph+WUwZ2c
         e7C7Mk3oWl//xGTC9tENX3zrfZiuaa6D37aZEFrtHfnFs+veWmBWPUIe8inDprDfmSwV
         BL9wTZSLvKPgMRWs3774MuF5fTyRauBkmTSygwEne0RdfvRWGp04WjOMD7cm229YI/Ip
         UlwMWVNOiw0eyq5jdUBx74SHk5kLp9PrzRc7nTo7L0Obh1smVFZ8MArY1QYNiLyp0DVs
         RaAA==
X-Gm-Message-State: AOJu0Yyb7AXjmVzsxxOjJBHi2iikMHGbSC70zjm5PpA3saWmVwWL1oW6
	CxI1pMRjE4RiPz/Nd7mXjie0tA==
X-Google-Smtp-Source: AGHT+IFt1F1hm0GN/Z+NeHU04Hl2N/UjDWfBl1ALsrg56lwJgEkTwxmGWPAR5Rni3JBi/NQVExA+rQ==
X-Received: by 2002:a05:600c:35d4:b0:40d:2372:749a with SMTP id r20-20020a05600c35d400b0040d2372749amr698195wmq.95.1703001942633;
        Tue, 19 Dec 2023 08:05:42 -0800 (PST)
Message-ID: <caf76de4-89f5-4ce4-b1e3-1de7a21325dc@citrix.com>
Date: Tue, 19 Dec 2023 16:05:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Possible bug in Xen
Content-Language: en-GB
To: Joe Tretter <j.tretter@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <de8b87e2-a4a2-4e49-80f5-97c745f46500@gmail.com>
 <9cc86706-5791-4967-802c-3e665bc97804@citrix.com>
 <a0aa0326-398f-44a1-a5df-fde3e7fea138@gmail.com>
 <cd153225-5cef-4ff5-97e3-44e485c12305@citrix.com>
 <e787b9ba-7a30-4804-b64e-ef56c71f5ed3@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e787b9ba-7a30-4804-b64e-ef56c71f5ed3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/12/2023 12:32 am, Joe Tretter wrote:
> Hi Andrew.
>
> Yes, running the scrypt unit test twice simultaneously made the error
> occur faster.
> This time, this wasn't required because it failed straight away - the
> boot parameter is present:

Is it always the same test which fails, or is it random?

Looking at https://github.com/Tarsnap/scrypt it's only a trivial piece
of userspace crypto.

The fact that running multiple instances makes it fail more easily
points towards some kind of register handling issue, but the fact that
it repros only under Xen, and even with eager-fpu (which isn't the
default on AMD, sadly), is weird.

Looking at the scrypt source, it has alternative routines for the AESNI
and SHANI instruction groups.  However, because it's a Zen1, we don't
have a useful way of filtering visible for PV dom0 userspace.


First of all, can you get the exact CPU model and microcode version. 
`head /proc/cpuinfo` will be enough.  But while you're at it, can you
include `xl dmesg` too just in case there's something obvious showing up
there too.

Thanks,

~Andrew

