Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C36A3F456
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 13:31:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894434.1303142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlSB9-0004oy-4g; Fri, 21 Feb 2025 12:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894434.1303142; Fri, 21 Feb 2025 12:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlSB9-0004mu-10; Fri, 21 Feb 2025 12:30:51 +0000
Received: by outflank-mailman (input) for mailman id 894434;
 Fri, 21 Feb 2025 12:30:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TFm=VM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tlSB8-0004mk-FS
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 12:30:50 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae54fa5e-f04f-11ef-9aa9-95dc52dad729;
 Fri, 21 Feb 2025 13:30:49 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4398e3dfc66so17760015e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 04:30:49 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b0371c67sm15801955e9.34.2025.02.21.04.30.47
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 04:30:47 -0800 (PST)
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
X-Inumbo-ID: ae54fa5e-f04f-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740141048; x=1740745848; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Os+9Iy+AgZAp4Q80x0RKseiptTUr8EADufut3MTGsm0=;
        b=eGYVYrtgffMd/cGjUh18XWzbu5eav0n76XoFpW5FdtPYr091HDBjiR9kgAonZgkcvd
         te0DcRgGGqJX/m+siJD2hPPLgYlMj1EPA9MmV95Zc2OWaMdXJGpfv9Ub+VKReQXdgw5s
         Iyil3WH/Xif6PSgnnfbufSSCLmLWdb4eEJ/bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740141048; x=1740745848;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Os+9Iy+AgZAp4Q80x0RKseiptTUr8EADufut3MTGsm0=;
        b=tbdTexjMR6uAqtjXw/i6EsbJqw7zQ2tJWuZYyUMQ2zqP1Jy00I/i7n2zzg/AfpTNaW
         3hcFfTgjqQTLRaQCxAq/IRP4zKSc0B+V46dAbawenj167kEQJbWK6uXp2VhgniVyGP5D
         YlVysJ5aMtEqVnjzaRDl84UyBLblixgN0QLy6f05soikpMV15/IfHGyVKLSb9SziFDEM
         rQWEyUv0jM5+aQ4aDvc7QiovtffCkoP4LOloPxtIxzlbHfHBD5R9812v+vX2jvEOROUI
         +WGzKCRCBemDh/vvnF245Ao10ogaRyGY+K4PkSQy0Mp7an6R+35+aTwNwSGm/aro7RY4
         6Izg==
X-Gm-Message-State: AOJu0YyRsg+qE2YpWYM5jz2JTHru6Bt6xr8QEH4usdbBScxUABE2W30T
	2tYH9lXIBS4FoVQtb12YtycOxJJODVQA24EcEcC/2E1P827PjTZspVbnnYaf5fzJkcXyz9aV5LN
	4
X-Gm-Gg: ASbGncskgU6FzRUC33yV4ZTVMOKc1XMDMKRf3DPFj1M9+rrAJHNpmI0OxxnR4eskcK2
	rissaZEG8CX0SQ++lRJcCfeDzqwtrsxYhxxeThoXxST39eyyd7YudeLHBNFhgG6fJ+5AXUxGI7K
	i5yZ3BHsHW2olOYqFhdYMDI2KDzFKkc2j9EjGufeZ//yO8ZDo8bJq9MZz/Ghkf+18UyatzdMCLS
	7RMaSAf7ATacBPTaURwT07DkOf0yZWVy2pKbKbZ5En5aqcOJTT85jFb3wCll4+AqEqNUrdhU31O
	vm9QBWi9FyPr3bSoyDIFFlVSLq0FAG8k4G0+ApImn/xQpz57HG/xxkaXp2O5C+phWQ==
X-Google-Smtp-Source: AGHT+IGz6rm3ZoPy5RAn1srvabu6bS+sAZIf+e5WKh0ckL7cxHKi9UDQWoLroCgMWy7GUa36mRofyQ==
X-Received: by 2002:a05:600c:4f91:b0:439:98b0:f8db with SMTP id 5b1f17b1804b1-439ae1f1903mr30713225e9.16.1740141048261;
        Fri, 21 Feb 2025 04:30:48 -0800 (PST)
Message-ID: <ae4ea824-e2a8-4963-a830-748f3a421e7d@citrix.com>
Date: Fri, 21 Feb 2025 12:30:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] eclair: mark R16.6 as clean
To: xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2502201354410.1791669@ubuntu-linux-20-04-desktop>
 <60a5d6be-ba39-468c-9e4f-dc363f0d80f4@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <60a5d6be-ba39-468c-9e4f-dc363f0d80f4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/02/2025 11:52 am, Oleksii Kurochko wrote:
>
>
> On 2/20/25 10:54 PM, Stefano Stabellini wrote:
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>> This is possible thanks to "resolve the last 3 MISRA R16.6 violations"
>> being committed.
>>
>> Requesting a release ack. Successful pipeline:
>> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1681379131
> Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

