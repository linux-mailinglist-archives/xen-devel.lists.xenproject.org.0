Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C850AAF6F5
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 11:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979138.1365835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCxmf-0008VA-Ub; Thu, 08 May 2025 09:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979138.1365835; Thu, 08 May 2025 09:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCxmf-0008T3-Rf; Thu, 08 May 2025 09:43:17 +0000
Received: by outflank-mailman (input) for mailman id 979138;
 Thu, 08 May 2025 09:43:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5q/z=XY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uCxmd-0008Sx-U4
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 09:43:15 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd22bf5c-2bf0-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 11:43:15 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so8556715e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 02:43:15 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a0b7fc0f41sm3214151f8f.74.2025.05.08.02.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 02:43:13 -0700 (PDT)
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
X-Inumbo-ID: dd22bf5c-2bf0-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746697395; x=1747302195; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g7XJZtX7d2fBhCQyjmnC3NIGfpgEqEEMYg24s+N/lO0=;
        b=ejm6OK63YJw9+F6nDuBxfOq7yONKzc2N4kuzpY/rC10OX+kfPkmsRWNe2vxjzGnnJE
         TvrQiVwW1UZ+01ny2IMupYh0Y+H+Vfbb0gFUARSNIRksljaCJMZ0QXbYn9JaXln4i6gQ
         CrR7wb+WdigX/338KGElG0XcSY7dGPK2FyHxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746697395; x=1747302195;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7XJZtX7d2fBhCQyjmnC3NIGfpgEqEEMYg24s+N/lO0=;
        b=uVDaHRbIveZUG5f7TEl8Oi1rHG3iyDhbHH2YV/Z5d2wbh12TxhlM3JHsGi5mnM/bd0
         z09IVsWPEiHlLyv7uUDbtfSQy0FwJX29v6zOjvJcw1ANxXY0DmuCxdYGiCGowaKY+Ioa
         M+yGMfYiuNxYLKt3sFidROQ+p1kjexoFR9/ExSIZRFKn6TvwHBF3EhiU6wO8MIX82TQT
         fkWI54zT/I+r6X0xMTSeVyR3pXdRPzjLMDveI/YsjQunG7bds8bLPKvEgHGnyR/Y6jNW
         ImsTixxQybGVSZAbFd5QQmbszLIcbXbu6Wb46sI/AHeZ1nzTmwulWxTp2gnOgHq9nE6R
         U1+w==
X-Forwarded-Encrypted: i=1; AJvYcCVDhBrtbPwyBYXM6J4urdEvISdMgLCXbF7o1dNw4+YgB1yR10CZ7PCdXr60PF2PvkVXq7SxEsqZQ/M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjrJdcLrrMWWRk65gy8odMowN19Qu4ar1XeQV23paUoLY9aPrg
	xDk/FsN1aw/mAMaB0RcdzQCabwKxL/5J+5XlEIQtov1X4QE5ghVWu1R65OAYNvI=
X-Gm-Gg: ASbGncsb58+sCGGmdZKRir3eE8U3J88AYeonv8e94DMYVEFBo45cNKZLkChLTasUM8J
	tnrTfBlmPtCe98DyMF3UEjaJO7prJdUWnaHPBThhT3Z1MxnPqLD9pg8UZBDsZ/F9ED+UwwUiA7r
	3jtk/c94lKPsYPO4QDXx1ZKreaJh4yDdQG2NYUoU9N8sQacXLgS6cmu4OCpQN0zriVvmFKPFzQU
	Bdzbbxb/qGufekttIe6ncXM6AUYEDnqraURMC1LuDuY71FvaLD9UHkWthoFymK47zfZkX/a1ZjA
	6KYrOUtaXQvdFAnr07z5xMNdDyT6YJ92kpObDM1AtP1gg17iPXrObOmAiQSE6uviPMZ+W8O7lGa
	KAsa59w==
X-Google-Smtp-Source: AGHT+IFA01GxMlFDu/gLMDoqYtB9BrskE+3+TATZV+DCqF7GSNJkW1lA5yPWHsEnbHlwIHRmGTA3LA==
X-Received: by 2002:a05:6000:4312:b0:3a0:ac3f:cdb3 with SMTP id ffacd0b85a97d-3a0b4a1cc14mr6265004f8f.22.1746697394705;
        Thu, 08 May 2025 02:43:14 -0700 (PDT)
Message-ID: <1aefa7da-7f90-4163-b9bb-78b9f98099bd@citrix.com>
Date: Thu, 8 May 2025 10:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib: Add strcspn function
To: Kevin Lampis <kevin.lampis@cloud.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <50a2737a-611a-4d83-aee6-de23619b0b6b@citrix.com>
 <20250507144515.1704100-1-kevin.lampis@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250507144515.1704100-1-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/05/2025 3:45 pm, Kevin Lampis wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> This will be used by future patches.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

