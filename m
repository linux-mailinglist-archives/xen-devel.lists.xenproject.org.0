Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091537E296F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 17:10:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628201.979398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r02B7-0000O2-2y; Mon, 06 Nov 2023 16:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628201.979398; Mon, 06 Nov 2023 16:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r02B6-0000Kd-Vg; Mon, 06 Nov 2023 16:10:16 +0000
Received: by outflank-mailman (input) for mailman id 628201;
 Mon, 06 Nov 2023 16:10:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jw9=GT=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r02B5-0000KX-Tj
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 16:10:15 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f754955b-7cbe-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 17:10:14 +0100 (CET)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1efa01323b4so3009375fac.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 08:10:13 -0800 (PST)
Received: from [10.95.110.31] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 d31-20020ab014a2000000b007b0f0d45133sm1599687uae.25.2023.11.06.08.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 08:10:12 -0800 (PST)
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
X-Inumbo-ID: f754955b-7cbe-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699287012; x=1699891812; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o9tVeKqMjlN1sJbwbYzCcGCuISPVc7ZyUOuNd53U1po=;
        b=XukNM3MfQE4oY/nBxbhPQFtqHLbTqAFbyfzTtc9JmeUaETTOKlwZCJRghbND7yYI43
         n41CMnWh3OQybSVMg3y3iOZRfniTAxdTi97EpK41Oz3RuuuoAOMRv2BG5tjDXIlNGsZw
         P3qWYa9vOV9OrCOgh+yjxVXfhrKJ9K+DjBlvUBnFw43XtOIKzUxD+UhKjmaxUCfY3+0M
         alp7ErY/tKlCIBAdmyGTe2xAj182gm3/SbuPOyX75SbABpDAGYp1A8GGqWF/AD8uacZc
         ypEP9Eb63fslZ0ELmdqv5Y8eZhhg1XjgMa0FyzHx9In4Z19qsoMkb2QLQIVcWL0Hk7DH
         ZnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699287012; x=1699891812;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9tVeKqMjlN1sJbwbYzCcGCuISPVc7ZyUOuNd53U1po=;
        b=sWyylSjEqNEGuhBJ+MH0CPygXUcWPRrT4lRv5Z5eGHcH4z4/g/HkZJg9LJ20SKWIdF
         FsEMO8gC+PVLZbyNYmbPT4UwiuQYQhzT5apf1xuhdUbIZoeCeFjdvsvCTh0T+KmSlSWy
         UuKXhfuLUQBFkjYrDzq7CZztYktuJ7nQKGPVjGoXdaX1Cc9zj6xF8/quvb2mrZnthOto
         dSfdXhmE1DxaUa+KeSMJ0j4rXO5e2tWheEDcgw1DMentBoKlMxNoDO4Fil9RWvNfLmWU
         skLCQB0A6KJlUye/reMLPCecMQ5atp0SdfBRwRzgDT8PoVJsHrJHIdeI99N5a4xnxXHC
         g/LQ==
X-Gm-Message-State: AOJu0YyLBGNliT3mzEa8xUnGyIzqG6q3ccdOcjJosYDYw/glu8qZUpcX
	tEJwWV2lWzMdjDcWGcxdnK0=
X-Google-Smtp-Source: AGHT+IE/sRaTmVzjjCiO2dK5s1AvjHxOUyoPSJxnyNWlqiA3OF+6Q3xTw5HxTC+nzv/U1i2QoMa6WQ==
X-Received: by 2002:a05:6870:788:b0:1e9:c7cc:df9a with SMTP id en8-20020a056870078800b001e9c7ccdf9amr148125oab.11.1699287012406;
        Mon, 06 Nov 2023 08:10:12 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9f15534c-8b79-4127-9b91-0dc449547833@xen.org>
Date: Mon, 6 Nov 2023 16:10:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v4 17/17] docs: update Xen-on-KVM documentation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-block@nongnu.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231106143507.1060610-1-dwmw2@infradead.org>
 <20231106143507.1060610-18-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231106143507.1060610-18-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2023 14:35, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Add notes about console and network support, and how to launch PV guests.
> Clean up the disk configuration examples now that that's simpler, and
> remove the comment about IDE unplug on q35/AHCI now that it's fixed.
> 
> Update the -initrd option documentation to explain how to quote commas
> in module command lines, and reference it when documenting PV guests.
> 
> Also update stale avocado test filename in MAINTAINERS.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   MAINTAINERS              |   2 +-
>   docs/system/i386/xen.rst | 107 +++++++++++++++++++++++++++++----------
>   qemu-options.hx          |  14 +++--
>   3 files changed, 91 insertions(+), 32 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


