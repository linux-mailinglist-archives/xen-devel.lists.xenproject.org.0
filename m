Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62BFA7AB03
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 21:17:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937200.1338220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Q4C-0001CN-RO; Thu, 03 Apr 2025 19:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937200.1338220; Thu, 03 Apr 2025 19:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Q4C-00019Y-LJ; Thu, 03 Apr 2025 19:17:32 +0000
Received: by outflank-mailman (input) for mailman id 937200;
 Thu, 03 Apr 2025 19:17:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0Q4B-0000eh-4f
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 19:17:31 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4926ddc4-10c0-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 21:17:29 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso9177295e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 12:17:29 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec147c9dbsm30682465e9.0.2025.04.03.12.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 12:17:28 -0700 (PDT)
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
X-Inumbo-ID: 4926ddc4-10c0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743707849; x=1744312649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7huC9wpdmi4acDCzK4IZdRut0j5gQKcaQf00ZnMjeQ0=;
        b=F2RdJDds+4j/DqSqp1EElNppAkswsomNu93dsnYwvDKd6k+0IiRYKb7WOpVe6213vH
         8oACKr5ZWjRb1VGiFMOVdgK4Q9AH5eCvrbJ5EECERqnEZ+oLLat+1U7UfuQ5A5LtZgmG
         I1tXfrLKJ0Qh04wMk8XzGJWwrJIiFZ0w+EQ+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707849; x=1744312649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7huC9wpdmi4acDCzK4IZdRut0j5gQKcaQf00ZnMjeQ0=;
        b=CkwQ5dzAR+O7wlRRBy2ySwOD9iXfF8Ze+GBzCwrd5PBhL48wqzn/vqb5q5OIj2AGv7
         Lz00EGpqQReqzP4lWfOKDzdWN1lecXBLpi+GVqnxXPgcyck+Wjy3RJUv5d+Fr+c+6pIV
         24zbVfLlAKyQQGmm546B2pwmVLBSHA5pg7OkrJTEyunw6LnFokGrvcqzUDEC9rPTGK7C
         rk2Uod/0BRm4wk6nlgeEIo7FbqXt8hlWS1O0JH88m1L6VyeizdVaS68cMC/6zkpLapU7
         auXgpAys3J6k3x/Rgzzy1dyqjRq1UWz4gyd7aTNn+ULaKH8FV0qHUyToBHzZPH6Q3jXB
         adkw==
X-Forwarded-Encrypted: i=1; AJvYcCXjBnBjYqzMI85WB2up5P7uXYrae2kQwWbIv/3ZqYbBJb/E9uAjqykVQ69vWn17okM29eNyq+UkHis=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzwk33GXBRvltjPX9DI5e0IJhaCdCeqr1vm4AvXkQgZ0DXiXVnM
	EzM4GPXG9cJi2lcTXiEjScCug6WC8otDmDo2diYJFiXG4bHpMW3wRT8kKI1345U=
X-Gm-Gg: ASbGncsbh+/ZPQpRnuEG+uIX41t0I4AazgHtrOGEk1fLr21Nc2je9ceNuysWSDb/INy
	6lLl8Y4WApNffpc3uQp3G1tB7dpDuB4QjTnLTNnWx7eCoB2jIqc/fHtgj1DI349uwyXAGdOE5wh
	eYyjfaWOXaHiTUiyx+4u3hGzXtaEsQIxeSyVCuhqa60igrlKy1NR+JnW4TfHkdITafJpRADQVFy
	wSEW5BjvU02f/UI/3glT1+Rx3TnJg16nnn26QaX/xNQVglRM2HT7lIt/gfPyCGlaxEyCjCoCa5P
	asLa/36h4Per5cZtFyanBsiK1tOuZUfPTNcw7ABqqD/KlxClGyPHDiz8fHzqXP4QBX9jzy1DSmB
	KHCTXNKBgbQ==
X-Google-Smtp-Source: AGHT+IHJVvCdMBErkKvPCaMlq2g9fzC6kefN0jKL0+J3ZNxBPpOnZy7Zb9uMHh7AEDSTxS/pZChbMQ==
X-Received: by 2002:a05:600c:500c:b0:43d:bb9:ad00 with SMTP id 5b1f17b1804b1-43ecf8cf6b2mr3646035e9.15.1743707849143;
        Thu, 03 Apr 2025 12:17:29 -0700 (PDT)
Message-ID: <fafcc7f6-3829-4de1-99a0-ddcce33ea526@citrix.com>
Date: Thu, 3 Apr 2025 20:17:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] x86/asm: remove HAVE_AS_INVPCID
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250403182250.3329498-1-dmukhin@ford.com>
 <20250403182250.3329498-4-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250403182250.3329498-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2025 7:23 pm, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> The new toolchain baseline knows the invpcid instruction,
> no need to carry the workaround in the code.
>
> Resolves: https://gitlab.com/xen-project/xen/-/work_items/209
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

