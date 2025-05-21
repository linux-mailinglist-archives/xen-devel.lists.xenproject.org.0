Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA91ABFA15
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 17:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992120.1375900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHliJ-0001A3-GX; Wed, 21 May 2025 15:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992120.1375900; Wed, 21 May 2025 15:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHliJ-00017N-DE; Wed, 21 May 2025 15:50:39 +0000
Received: by outflank-mailman (input) for mailman id 992120;
 Wed, 21 May 2025 15:50:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqa2=YF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHliI-00015Q-2u
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 15:50:38 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 561bdd70-365b-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 17:50:36 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so76987935e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 08:50:36 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f3ce483bsm73019585e9.33.2025.05.21.08.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 08:50:35 -0700 (PDT)
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
X-Inumbo-ID: 561bdd70-365b-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747842636; x=1748447436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yS+eYEND79sXHLH0pfeL2QUeK3wZNWKJtSI1kmxVrxQ=;
        b=aKodymekw4gMipWviUsioYbzorBX8pJAblC1/ydsyZXERMjzBExWkj6PzkvKQfMMF2
         RrlCb7uvFEf1rLSJB9x4/IG0x9FasWVtF6258mCvihOXXcAZTzyxdvCVhyr7Te+LaVfH
         0A5iFJieIkiwlAtqaR8OYekVePfRj1iwrUCRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747842636; x=1748447436;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS+eYEND79sXHLH0pfeL2QUeK3wZNWKJtSI1kmxVrxQ=;
        b=TcyXaMiD+AhhMTwPOfqDm5N5DWlnwUrcpZC8FhJ9xivVvIv0ilWNTxRq5CH0Prlv7E
         h3sW/CuBRjma0gi5dcCfu8zLccS/p+aMwluKgbNCdqV/lBQ148J4kyx7h/hhbjaBiruj
         ihzeka7Sp5ob6XxFI2n508z4Us4Nn3yJy87uemizQi0WlMVbn1J2W/Tyy2Uj6gT2cuPB
         Thq9DGT4LUsLIN7+CKmMgGM9UrQtJ9mCVpR+kX+NZ5RYQLzpUsjP3LFcFtpB05t4mpxg
         CgHzwl+7uwdNXvlkfSK4e/OPl5FTHl99jI3hXhRoOMYXPAU+EyfewgUeUPxzcojfMj1Z
         QJcw==
X-Forwarded-Encrypted: i=1; AJvYcCU+uL9NkFD0a6xudp50aNdlDo9cXI8BKwOHSlS/kUvE6WU5ZhhIdc3YXrFD2DczoZavD15O/kJI4lQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2rNWObbY0IReU7Ose5GMMUaTgb+MY50C13HJqM1QVEA93IZP8
	srG6LwDKFBxz+D6u7rtG9PSm3xbPBC1zJLuSG3sx3+v9RgtOdB8uTXv2S1+Aq9pY/c8=
X-Gm-Gg: ASbGncvMTzjQEJQN6xFixdHq/TVGJYrwlj9RySBsI7Casmg5514zEGpMm6yqhMm3FyV
	897BLTTi3LjfFujP5Aq8JcKZQPtfcaQzc0UfvWlBkmOOJbxiGfKq1hEiT177JR9EOhLa7FJAIf7
	RVtbPWhVbYLPPt0plKkvwFm1DqCW0jszaPR4fCO46+iSyKoq6Bheb/0fSfiaY4kfTbpbxiu/VDG
	hHB13svi+iis2SDpolFMZifMG+IcBHWH8kDD5L5NeLsuRmFEub7SWd3UmABRWrSZvnquZQSVdNP
	U3iSCvDBoZAuPEfSIifEFpzBEnTTaF79aC/Ld5TXbEldJTY98asRu6sl2bIcMsfbqA1vrXOhmpo
	THdKzSxPOvJjLPDPB
X-Google-Smtp-Source: AGHT+IHbtZ7mSQ3tPpaOfil4jJb/yV2RyAMklZLNgTt0HzAPhDBCzr4EL2uLGWv4H5C5gfGlC2nPGA==
X-Received: by 2002:a05:600c:8597:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-442fd780527mr223202855e9.15.1747842635822;
        Wed, 21 May 2025 08:50:35 -0700 (PDT)
Message-ID: <a1b6c2a5-36d4-4ff0-a25a-d38cd74f6387@citrix.com>
Date: Wed, 21 May 2025 16:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/22] include/xen/slr-table.h: Secure Launch Resource
 Table definitions
To: Jan Beulich <jbeulich@suse.com>, Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <cdd7b9ff21c81683ce2245bc2b5e0a7a87e51e3c.1747155790.git.sergii.dmytruk@3mdeb.com>
 <4896ab0b-f45e-43e9-bcee-f5496717eb2a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4896ab0b-f45e-43e9-bcee-f5496717eb2a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2025 4:45 pm, Jan Beulich wrote:
> On 13.05.2025 19:05, Sergii Dmytruk wrote:
>> +/* SLR defined architectures */
>> +#define SLR_INTEL_TXT   1
>> +#define SLR_AMD_SKINIT  2
> These are both x86, yet the header is put in the common include dir?

ARM have a DRTM technology in progress, which will be 3 here in due course.

OpenPOWER and RISC-V are also investigating DRTM.

~Andrew

