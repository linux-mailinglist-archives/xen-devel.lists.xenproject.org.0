Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033728D07D4
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 18:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730901.1136183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcyR-0000ec-K8; Mon, 27 May 2024 16:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730901.1136183; Mon, 27 May 2024 16:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcyR-0000cU-Hc; Mon, 27 May 2024 16:13:23 +0000
Received: by outflank-mailman (input) for mailman id 730901;
 Mon, 27 May 2024 16:13:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VIbX=M6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1sBcyP-0000b9-Tu
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 16:13:22 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08e42e38-1c44-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 18:13:20 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-357f1c0b86fso1373853f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 09:13:20 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a0908e4sm9460093f8f.63.2024.05.27.09.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 09:13:19 -0700 (PDT)
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
X-Inumbo-ID: 08e42e38-1c44-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716826400; x=1717431200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfmM0j3HF+vLiXdV40d+v8fDYCHro8ZxhgNASHgkLhU=;
        b=e8O3e1n8bu90OulnfG2zmDriGUuacLyWe9Hx3Em7qWyhyESzr7vem3CHm6fU5up8Y5
         5FizYRkAQBgj/KR/dQHWqslKkREH/Ls2UbNshRdkZ0LDD3CN2HvIpIAbaR6CM7r+Q0iM
         sQntRtLzz7zaHzHNVsBXQ7h8fqnv15KXVIsOUPSgb42jqiCgQRxv1UIt0PY1LIvvlXAo
         mE/Plnal+qvB7CoWOviZAxij0wZQqa04sHvVJXaAlVpAsnYXXZZG1Gv8g56UHlRE1r39
         K86gP9zTFKhUpDQrQCT1AVgrAnYLEmTncBFH2b9kAf8H6Q+5iwOiNm4urAtaDemWHEDU
         1uCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716826400; x=1717431200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfmM0j3HF+vLiXdV40d+v8fDYCHro8ZxhgNASHgkLhU=;
        b=MHFSJhV6HIOIWitPTGA8INqPaARozl4f4op6nqLTXAjWytXQf7hEORzL3+NBfjuPYK
         vFSbmfrlE9s0WTqFPHvN0Ferqo7nPWCDjm+wUF8yQLPLWjCpwKwxH9FVGFC6+PwPVAHV
         MyLWju2gJZd77gwAJgPvaGD8IP/LWmBEdBX2Spd+AnH4GNjlRGpZSIrg+vNIVXpyCWpM
         LAEaQbYL6YuACWi3LC0MGS/wpTXXJ9oGJt9ySG7HoRDhLwyINZWK718LP2PNC5kxoJ4Q
         McPKEZky1cWAE9ILUvEDu3fj5ssU3ZkL8VOsYkroCTqfyeAQxcDeK/fBKigpKmNZRvDB
         zUXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpmBA5zlQB5xJoMB7EJ07UAKxZyWr/8QxhixeHlMHzUi4Ve9kIa4t27jpj5FWU0bVfwOksRHJgJy5Gvu7VL+QUj4adSeagx3+QjC8+1JY=
X-Gm-Message-State: AOJu0YyuZaHeEt8OLBw/HtRcU9P8Oipa3o9gowHoQOM0Y+qQ/AyrCI3D
	J+f6cGUVdKg1rDMMMM32xgJM90VD+Noj9LOJh47+ijp7rhlVCqr+yVm8qtkNJ8Y=
X-Google-Smtp-Source: AGHT+IFPUBbJ4AV9nNMW5an0kxmRJqDQYgV9r0unWjNl5K2YvpMuoRlLjuLz+k0jRnurcN/gTOehvQ==
X-Received: by 2002:adf:dd89:0:b0:354:e021:51ce with SMTP id ffacd0b85a97d-35526c27950mr6660105f8f.12.1716826399989;
        Mon, 27 May 2024 09:13:19 -0700 (PDT)
Message-ID: <f4918050-11f4-4610-bcf3-2cca4ac0f3e4@linaro.org>
Date: Mon, 27 May 2024 18:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] xen: mapcache: Pass the ram_addr offset to
 xen_map_cache()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 David Hildenbrand <david@redhat.com>, Anthony PERARD
 <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 xen-devel@lists.xenproject.org
References: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
 <20240524105152.1301842-7-edgar.iglesias@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240524105152.1301842-7-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/5/24 12:51, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Pass the ram_addr offset to xen_map_cache.
> This is in preparation for adding grant mappings that need
> to compute the address within the RAMBlock.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   hw/xen/xen-mapcache.c         | 16 +++++++++++-----
>   include/sysemu/xen-mapcache.h |  2 ++
>   system/physmem.c              |  9 +++++----
>   3 files changed, 18 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


