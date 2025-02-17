Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8882A3815D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 12:09:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890269.1299267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjz04-0005iK-GU; Mon, 17 Feb 2025 11:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890269.1299267; Mon, 17 Feb 2025 11:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjz04-0005gr-Dr; Mon, 17 Feb 2025 11:09:20 +0000
Received: by outflank-mailman (input) for mailman id 890269;
 Mon, 17 Feb 2025 11:09:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tjz02-0005gl-CS
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 11:09:18 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e60898c-ed1f-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 12:09:13 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso28509165e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 03:09:13 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25915719sm12080371f8f.60.2025.02.17.03.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 03:09:12 -0800 (PST)
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
X-Inumbo-ID: 9e60898c-ed1f-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739790552; x=1740395352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4C+ellxskKER3kTuRs1EcPwk2X1EuNSkjtoz5FBXgV0=;
        b=CtGqiASNK/5wuJWg8Eh9xjzNnCNPT9gj3js3/j35C+tDQcLWthth67l8ZrP0fq4uIi
         ROqORucKZYoQ5dnldH8YTfCEfz3AFVnPHj9OBX2EGEJuiI6W6AH0uCPBQ3I59rjTamEz
         RO5A9Xbi1LaHcv6UnEigyOO6cFxfgkQbJTsjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739790552; x=1740395352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4C+ellxskKER3kTuRs1EcPwk2X1EuNSkjtoz5FBXgV0=;
        b=ZFEJBy429+omDvuCYwlFWfC4kb0kTBtTbqc5qLTk4wf6nhmzF/i/OStfjQEsUZO92B
         +m676otM7Pr7pBQmmLjRJ2cVrlWAMPYyrEJjO/koPNR3jLcH039XPN/eTnge6cvpJ+uo
         WUrGuDygxCQuyT2z2VUrLFKFFJLz0BRRaED5aU7cZdyUxSOT7m+qJ6tmb9Uf+ej09iko
         o6SJ+K8ewqeuJqIumgy5lIpa4vm/rm7lGcVYYKyiKn0/H3l8nBta3J3a0dZ9ds3/nBeu
         lPS8qc1Dma83SXXAWWPYN7Yk6+DWGhuEFEw/xOSQwsOd4w/ns8YE5YsHk+MEYKWi0xlU
         m49A==
X-Forwarded-Encrypted: i=1; AJvYcCW9GADh3/uwfUoGmabP7LqdfxSd9d7cRvZtEQ/WsvRDwhoYXUMVr2O+MVqWv1FgpWytnEH9P1w9Jw0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwE46oVHpXNFBl9ZJa0TxjI2/qBK628y60TCkRGk05fl8pcWqqE
	GVQvlhGIcd9Zy3RZa065vJFhphPObs1Yopi2LqmfPNPtSs/kMQz8882SMu6+qCw=
X-Gm-Gg: ASbGnctzbwHb2YN+1O4cKff0a7fZIe4duFfMNsPqomdZvRDDjIChmb4ommEicc3RPUz
	F8KDnfBnOtamv+cqw4mg3kSAI2BkPtUZs+pojUL27vKCZBJufg0gQ3RDjHoD0NiroOFT02By29D
	n4r69ELTvIVXgl9W7T0+UjvBcqX/Alf5CmObJUMqwP1jLfIxz0RFpEmMGbZztf0+qTFkT3Pqj4m
	BFWA/2ZLefwf8+9+1qwSmLVFXPZyraXFWxXaus/mXkNDJqxAeuvZNy8HtDDDCUnXUxTMvmTdsS5
	E0fImcAAiwwbJtb8Y14zdFBpPyzExWG3i/eiVcpgscJMyBzMHsnEHm0=
X-Google-Smtp-Source: AGHT+IEHJHSJ/qQoO8ehIuw9k0WEegwBEYh/vLLfEDufIV/ypGEaxJKcXZJrsCP6UN59OssBmnU24A==
X-Received: by 2002:a5d:64e6:0:b0:38f:27d3:1b36 with SMTP id ffacd0b85a97d-38f33f11893mr8133675f8f.9.1739790552437;
        Mon, 17 Feb 2025 03:09:12 -0800 (PST)
Message-ID: <24e6c348-a5c3-415e-a5b9-69d948eb15c2@citrix.com>
Date: Mon, 17 Feb 2025 11:09:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/memory: Make resource_max_frames() to return 0 on
 unknown type
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250217102741.4122367-1-olekstysh@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250217102741.4122367-1-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2025 10:27 am, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> This is actually what the caller acquire_resource() expects on any kind
> of error (the comment on top of resource_max_frames() also suggests that).

:(

So it broke somewhere between v3 and v8 of the original patch series,
but I can't seem to find the intervening series on lore.

Given the comment, I suspect I got inadvertently-reviewed into this bug.

> Otherwise, the caller will treat -errno as a valid value and propagate incorrect
> nr_frames to the VM. As a possible consequence, a VM trying to query a resource
> size of an unknown type will get the success result from the hypercall and obtain
> nr_frames 4294967201.

This is one of the few interfaces we have low level testing for.

tools/tests/resource/test-resource.c

Please could you add a step looking for an invalid resource id and check
you get 0 back?


> Also, add an ASSERT_UNREACHABLE() in the default case of _acquire_resource(),
> normally we won't get to this point, as an unknown type will always be rejected
> earlier in resource_max_frames().

Fixes: 9244528955de ("xen/memory: Fix acquire_resource size semantics")

> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

~Andrew

