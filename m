Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDFCA60CE7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 10:14:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914168.1319962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt17i-0003VB-KV; Fri, 14 Mar 2025 09:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914168.1319962; Fri, 14 Mar 2025 09:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt17i-0003Sp-HA; Fri, 14 Mar 2025 09:14:34 +0000
Received: by outflank-mailman (input) for mailman id 914168;
 Fri, 14 Mar 2025 09:14:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt17h-0003Se-Jr
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 09:14:33 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd1cc05f-00b4-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 10:14:31 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so1058477f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 02:14:31 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb8c2sm4788701f8f.85.2025.03.14.02.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 02:14:30 -0700 (PDT)
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
X-Inumbo-ID: bd1cc05f-00b4-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741943671; x=1742548471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a6GN2JQ3U6QyEYcwf68xoJJXul8QuyV9fat4upYkDTI=;
        b=L3uFHMAwLgyHunbTnRLHuYjZtGmYzxQKzSEJFlykljBEyS/z7tnkPjiC/SKbU4uKR8
         CQgPMZMcEX5zLXXVdwQbKunfMMnWPouf620JPb1aHmP3RomZZFdBe311TfMDgkKZBPxf
         vQ+GkeSjKNzW4ANyB33KgI19IYie5Ls2qf3Ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943671; x=1742548471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6GN2JQ3U6QyEYcwf68xoJJXul8QuyV9fat4upYkDTI=;
        b=BkArdpBhYU/EnXaSTnqA5VgUPXwu8f40z3fo3SOvcfHwzILHcyWbk7j21j5t1WIoX9
         hx/j6Al29IjGBCN1ysFk9CzVHtrsefz3RQvd5G5U5aCsqHFQ2Cmc3ErO2YBKrYlnHLto
         kmjtXQNoxPCo/qjBd8oRfYm3WeU1dKXnO51yVnBLeEGR4vDPKY7c/sRog1+XTDKemgId
         KUGRQkiQBxrKWLRagNFw1TG5LBpck0Ch6ndzVgORrnzTni5WLWh+gZfOIXMJkAD/XTlg
         lF5SmePpOiMZhwoM9d4rN0R17ZKv0EPQ4HxYCLLBoUzugNXwWdMAAMkdVoeVYWXluh37
         RpmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDc1zE0NXn60WYAmRIlyBNfmzyP0mzgNS3ZyBlt1D67lYUrZguWWJ/4mLTV4VLokcAO+sWcChGSBc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVvgWVWa6KJz9bgZmJuL11Akfdjmb4QVttfsRL9ZtWe8qIpM/h
	sQwXpCoymOn8QTuuvJ0pLL+UEU94CilYPYmokID1GrmpUewZN/0sLBw0rUOITME=
X-Gm-Gg: ASbGncvoJIpXNtkQZ4r8Bo1ff3Skz5eRKWoTZDiFp1lRWJQwy2gI0MBAdGdB2G+FIC1
	3J2eufuwqw++CcA/MgCyqiOPphPhZAvMgBS2gRMmOOJ5ryhkH4DHYL9q9fEG45cSkZ2Ct8vn0ze
	5i0MxU/4utQHcHZYvH2xjym0/ihsBfR7pCePLUK9q++Wb1S88jVLVKoNAq2gElaYjeS4lnvbB03
	3gg61YafaOFWaLlW4zjkmMPyyZO6GthTLi+jaFMkcIiqotL2hex3F+hEUJYp4QbQMbUOvmqd3gQ
	Hw5ynxobwitYiQ6PNcBOBrVJz/Jmbiexf/+FqCp+6tv3mafGwp+q515iC6lEtFWt96BWvNhVZfE
	t7oXaY6u7
X-Google-Smtp-Source: AGHT+IEJv+DFmvwYUy6fZJAIZVi8lLYOUolYeW9YUGpAXDcteKD+h0q6Fgu/ge77yEupOXn+xPIQgg==
X-Received: by 2002:a05:6000:178c:b0:390:e8d4:6517 with SMTP id ffacd0b85a97d-3971d9f1c77mr2122388f8f.21.1741943671096;
        Fri, 14 Mar 2025 02:14:31 -0700 (PDT)
Message-ID: <94879059-1a38-45e3-ab3a-4f8eacd885cf@citrix.com>
Date: Fri, 14 Mar 2025 09:14:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/irq: use NR_ISAIRQS instead of open-coded value
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250314011528.2608217-1-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250314011528.2608217-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/03/2025 1:20 am, dmkhn@proton.me wrote:
> Replace the open-coded value 16 with the NR_ISAIRQS symbol to enhance
> readability.
>
> No functional changes.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

There are currently very few uses of NR_ISAIRQS, and you're about
tripling that.

Please could you do a prep patch renaming to NR_IRS_IRQS first for
legibility?

~Andrew

