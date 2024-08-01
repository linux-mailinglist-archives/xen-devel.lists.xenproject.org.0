Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B594463F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 10:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769446.1180353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZQvw-0007ki-Qo; Thu, 01 Aug 2024 08:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769446.1180353; Thu, 01 Aug 2024 08:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZQvw-0007iU-NH; Thu, 01 Aug 2024 08:13:12 +0000
Received: by outflank-mailman (input) for mailman id 769446;
 Thu, 01 Aug 2024 08:13:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xSmm=PA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sZQvv-0007i5-Fr
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 08:13:11 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e347fa00-4fdd-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 10:13:09 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5af326eddb2so3199489a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 01:13:09 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63590d81sm9883008a12.23.2024.08.01.01.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 01:13:08 -0700 (PDT)
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
X-Inumbo-ID: e347fa00-4fdd-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722499989; x=1723104789; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M/mJS9h82p54uLSSBVmHoxv9n2rzlaKYIk+BGzaOG8U=;
        b=O5OiwSf6pS1HybruCvDf76slJ4FAKm+9iUv0r+wxPP9eOEL6P7yhy8ESsMfTIhcugD
         7mcqPTSXu6A1/L9x0eq2GWpzSBXbe3MfQyO+qSBxNFMo8QfSHvLC2QskMBHrsTkzgtSB
         8gcV9llIun1v1Ry0d+BOi+q0CQUmf4JHVTgaOC70CeTuoGpi8KqMAgeqp9bPHyBfFpPV
         Vh6xdonID4cRcOYqfLL5FR/e5oIaBoSo2Fi2r8JH+1aeysIkhquBX1wci0+XBQnEQSQc
         zXaXu6+ztYQAdml3cgDTktSdBQMy6Tvj7P9EkjhnleltyVnKg9396/NAJv+M/YnP+M6W
         R3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722499989; x=1723104789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/mJS9h82p54uLSSBVmHoxv9n2rzlaKYIk+BGzaOG8U=;
        b=lnYxToX5xx8UT5CvETM56DKgkJhK/sVH+OFD0j9Ca+X/uS9UwA3kQmhS5LZHFtKbRH
         +4GlIvYtSNp52b1rxabK+rQXSqLdX5zMxauuATZXJZTgst1iWKk69yEpP9AaxRdDQ1nx
         xcuUi6lM/j9FU9KA0EeE6yIqWsOA0L5j14I5tRapfaC/eVWc2KAWvmoXf8VOIk5ibUpJ
         HrfMRtG7yY/d+2i+RFMtqBnLcfqtzjGgojHHCfudbE6xf3kueIgJlvYjDLOngDXH6ZJi
         mQcPL45MvlluDy0OsnyWhiHdHT5cYxoXIkKbcQrwGRgYoitereYTPPb57L0AC7O6t0/r
         pF8w==
X-Forwarded-Encrypted: i=1; AJvYcCUV5cObR0Rr7py9EPJUeSJBKciqy2txb0TZ8xgLO+3/HO9Uvx5E7GkqYO8RlTygQcqTHs7GlTUpBUSJ2QWNDNLuvLcZfidrgLj/qHgCCFY=
X-Gm-Message-State: AOJu0Yx+Pj1DHfR4rcOrq7Qv8VdbBZfWltBqKc9df9tVk/lQScGlPjYR
	C5k105GNWB+m48UYheb93L8jD+yls6HcoYXrVF4eyNKomZusNUMdpiB6pYv4NVavSWbvEbfrlzT
	S
X-Google-Smtp-Source: AGHT+IHMYcpXa4CVg65aTj1rbaNI790f2Sz+h8yluHqRP/gwsIrXc/ADGOrHP0eFajzRrNOSNpLSCA==
X-Received: by 2002:a05:6402:74b:b0:57d:3e48:165d with SMTP id 4fb4d7f45d1cf-5b77bd9cbf7mr472457a12.4.1722499988447;
        Thu, 01 Aug 2024 01:13:08 -0700 (PDT)
Message-ID: <7fa3bca4-1ef4-4c95-bf92-de87c7c8fc96@suse.com>
Date: Thu, 1 Aug 2024 10:13:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mini-os: mm: switch need_pgt() to use walk_pt()
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20240731130026.8467-1-jgross@suse.com>
 <20240731130026.8467-3-jgross@suse.com>
 <20240731212752.zd5njpd7kgoc433d@begin>
 <8fef9511-c5d0-49a9-a800-6087f03b3199@suse.com>
 <20240801073923.32s6i4enoq6qafa5@begin>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240801073923.32s6i4enoq6qafa5@begin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01.08.24 09:39, Samuel Thibault wrote:
> Jürgen Groß, le jeu. 01 août 2024 07:56:36 +0200, a ecrit:
>> On 31.07.24 23:27, Samuel Thibault wrote:
>>> Hello,
>>>
>>> Juergen Gross, le mer. 31 juil. 2024 15:00:25 +0200, a ecrit:
>>>> -pgentry_t *need_pgt(unsigned long va)
>>>> +static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
>>>> +                         pgentry_t *pte, void *par)
>>>>    {
>>> [...]
>>>> +    if ( lvl == L1_FRAME || (*pte & _PAGE_PRESENT) )
>>>
>>> Did you mean (*pte & _PAGE_PSE)?
>>
>> No.
> 
> I don't understand: it doesn't map what I know of need_pgt and what the
> existing code is doing.
> 
> AIKI, the point of need_pgt is to make sure there is a L1 page table
> entry for a VA, and return it, so the caller can put in it at pte for a
> mfn or such. In the case a PSE is met, we don't go further, and it's up
> to the caller to decide what it wants to do (most often it's actually
> unexpected and asserted out). In both cases, the PRESENT bit of the
> pte whose address is returned does not matter, most often it's the
> caller which will set it.
> 
> The existing code for need_pgt thus always adds page table entries down
> to level1 (except if _PAGE_PSE is met, i.e. a large page was already set
> up): the termination was:
> 
> [... walk down to level 2]

You have omitted:

        ASSERT(tab[offset] & _PAGE_PRESENT);

> -    if ( tab[offset] & _PAGE_PSE )
> -        return &tab[offset];
> [... walk down to level 1]
> -    return &tab[offset];


Juergen

