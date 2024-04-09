Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DA689DC57
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 16:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702475.1097527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCVj-0007y4-8k; Tue, 09 Apr 2024 14:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702475.1097527; Tue, 09 Apr 2024 14:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCVj-0007vL-5V; Tue, 09 Apr 2024 14:31:43 +0000
Received: by outflank-mailman (input) for mailman id 702475;
 Tue, 09 Apr 2024 14:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mUTu=LO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ruCVi-0007vF-6u
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 14:31:42 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0ed7330-f67d-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 16:31:40 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-346406a5fb9so329410f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 07:31:40 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r12-20020a056000014c00b00346406a5c80sm893404wrx.32.2024.04.09.07.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 07:31:38 -0700 (PDT)
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
X-Inumbo-ID: e0ed7330-f67d-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712673099; x=1713277899; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oU8cB650JDaWg09dhytPehC+d6uZFyQIz1ZV2q/jBIk=;
        b=J2mnpB054UTNnfn6NJqZi/iZDKQ22mbAZ3BNXb7ihgRkHKKwzOqXA0M9pwD7rEKEwx
         +W/hhT73g2VkjlJk3/codPM0xsonrjUJeo7beiZp2TtRwd1PtWFqFd/ToRyoPnx12R+Z
         1E4t9pEfvmoqjtgd/5RbFa/wKw22Slnlq6U4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712673099; x=1713277899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oU8cB650JDaWg09dhytPehC+d6uZFyQIz1ZV2q/jBIk=;
        b=mJ8v9z63uRIbRGBjP0znTVNHS6B++Ji893aNhNNVPCiyxhTGBAPO8IbSMz8TUtIHZh
         fh5x/De5hAXxOV11i49BVPR8y0RUQa8zcm69V0t2C3GF1SPPeJEuCeq7a0jpbNzHiCr8
         Y/JQk91oYIPJkOrEZmk9PJv/g/UQR6yFOABbNxyXa7NyG+3RpxnQr2X3DU1LxwBbaR2F
         2bjg16tWttj9P9BiRpCtjT91+0I4I9q2Nn+gQdLXz9cQdbKbZbETQbiQIZXenr/eXYHU
         dhT6or3USzcxsGZ+XeNlV00/42ioTPVoCdwzmMPglj57ZY1/9+QorByif3PmuWlzaUnd
         jtZQ==
X-Gm-Message-State: AOJu0YynEF0q/Sy/PM/10Y2SfE9NH5DxUjRDVocS5uae4jvjrrRMSKWu
	w9J8yJfcg8rQf30soxglg4HQZXz7Iv4JZ1qnivMtPx9nF6AnvQ56tMM0UlnywXY=
X-Google-Smtp-Source: AGHT+IGLKiEu24hi791vfokjn1Ssk/9rC0MaRHPUSsMUyQgeJ2hsBHsKQ69PuxtBAGVJggjb8fOKtw==
X-Received: by 2002:adf:f6cd:0:b0:343:81ea:c534 with SMTP id y13-20020adff6cd000000b0034381eac534mr8205366wrp.64.1712673099594;
        Tue, 09 Apr 2024 07:31:39 -0700 (PDT)
Date: Tue, 9 Apr 2024 15:31:36 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: leigh@solinno.co.uk
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	slack@rabbit.lu
Subject: Re: [PATCH v2 3/6] tools/misc: xenwatchdogd: add static qualifier
Message-ID: <ff5915d2-1024-4a52-9771-d265b64f5858@perard>
References: <20240329111056.6118-1-leigh@solinno.co.uk>
 <20240329111056.6118-4-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329111056.6118-4-leigh@solinno.co.uk>

On Fri, Mar 29, 2024 at 11:10:53AM +0000, leigh@solinno.co.uk wrote:
> From: Leigh Brown <leigh@solinno.co.uk>
> 
> Make all functions except main() static in xenwatchdogd.c. Also make
> the remaining global variable static.
> 
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

