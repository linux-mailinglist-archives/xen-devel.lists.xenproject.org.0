Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFD5B548AD
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 12:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121762.1465871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux0eP-0006xa-3n; Fri, 12 Sep 2025 10:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121762.1465871; Fri, 12 Sep 2025 10:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux0eP-0006vM-0K; Fri, 12 Sep 2025 10:05:05 +0000
Received: by outflank-mailman (input) for mailman id 1121762;
 Fri, 12 Sep 2025 10:05:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ux0eN-0006vG-Ap
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 10:05:03 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f03b5156-8fbf-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 12:04:58 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3dae49b1293so908543f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 03:04:58 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd0a7sm5868898f8f.39.2025.09.12.03.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 03:04:57 -0700 (PDT)
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
X-Inumbo-ID: f03b5156-8fbf-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757671497; x=1758276297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AQYhS7fp5sjFCCrG0LUR3X9Ch1Pl189clAO+Hcfc2ao=;
        b=boyJhpGctuoWIg2/a39R59O1jCniiD75FApdRJA1wk9QlUN2VzJhoqswV7ZHIFQiOU
         0U8X3SqSmQxrE4N9rBA9zKoMwmD7QEKRnKFDwwxnrGSlRLC5rDW1QY1RT9dTKio/UEaK
         eSCO93Mk05Sp6EXvKZ6uQyltaFDlRkDh+2An8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671497; x=1758276297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQYhS7fp5sjFCCrG0LUR3X9Ch1Pl189clAO+Hcfc2ao=;
        b=fPFGEfEvW7ydr1/BzXuWULAP7nYQ+RQqL7mlsCJK/r6t+uFZHWcpdlnDVM0OA7neFJ
         xGL/92KrqQhsoaI4YCZU18Jzi8dfpfjRXRyMaPcrg4ynj0AAYPxLzlHxXJ8JHu1f7O3A
         kEgWk74oGDn17kbRWZc5PJXdyQrLatRxl3IZBWklpiCp6L2/TStitMNx4VpBsvjQ6oEM
         gJrsTckCdBj3v9jADuOIkylq15tRcXl2WfTZJI6537LVszc2GV0BVUpppQ41t2Jc8oFI
         3V6DA2eq0ezPGdFWRmvAWfOhsQOOPD3q2E+WQnQGT7kp6JtipkrM54PrkslpbInOCnee
         Sl4g==
X-Forwarded-Encrypted: i=1; AJvYcCWkaXqT6xrqn+T75n2YwVDuo0IrPPfBhoBS3MqU5hVvGd1Z9HDV12yfiwjKz+w7ALkPvov0lM7Fa8s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzn2MCU/PZrMGnl7w2J/GhkC4KHJf3aL+pMGhVkkYRRtqSPPybZ
	Olsy1M2x/b/b9yCL7fzVdvGz4Rq0EPWoeAptj05xaeBlQscvuUCzAycDtLUhbIukuunXU++prjR
	0JtMd
X-Gm-Gg: ASbGncsls+j/o6Ind8ENh6I6G/B728VNyn82NdvR1AMX744pzubo3Icmc0l57Zit1wE
	4fH9Qzui6ZbZW58xOSWVsVx6XJYsWvliL84I5C5X48jN6Xbk3/rTZw/HmxefuF4oyEAu8TONtu1
	KJqVd1+5lzuAWdwr8MLOLdH8hDsC16RjJKct9UlM+fkaQZaDcQsu7E4Gu19xWf3iTLqs2yRj9CC
	y7/ytUkBnMGL1GDe9zu2+uSuxpvaCmwBmfi8VqeT0S586lAXWyR5v60X/dU25OulzXpPknYPtaH
	SC6+KWdstrPQu9aQH817zZJBQqcr+h18qKfELxft+PdroafXK+XzEsp2GsLYxAuI2uWrlflz/Gi
	yRNRkPYblyOIsOnTphRnmy7+BYAzbmja/zLl/GfIY1zHt5ZgbGgwQnm3sEMjacTuiySxdrdal3j
	2v9V3zwZ/l9e1B8A==
X-Google-Smtp-Source: AGHT+IFvJYoRAgHsJ1qw2gDR6BJxWMXYvjkt0hr0WSyBV/MkZubx3SQQXrk5vJaXNTrCFWBTkk+gFg==
X-Received: by 2002:a5d:5f94:0:b0:3e7:610b:85f6 with SMTP id ffacd0b85a97d-3e765a142cemr2097407f8f.39.1757671497543;
        Fri, 12 Sep 2025 03:04:57 -0700 (PDT)
Message-ID: <66d13154-688f-4a7c-b273-d214c6fcd43b@citrix.com>
Date: Fri, 12 Sep 2025 11:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86: hvm: hypercall: use define instead of const in
 hvm_hypercall()
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250912094702.1654772-1-grygorii_strashko@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250912094702.1654772-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2025 10:47 am, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Use define X86_MODE_64BIT instead of constant in hvm_hypercall() for "mode"
> conditional check to improve code readability.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

but this really needs to wait for 4.22 at this juncture.

~Andrew

