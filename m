Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB56A8D0859
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 18:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730907.1136194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBdAH-00034l-LD; Mon, 27 May 2024 16:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730907.1136194; Mon, 27 May 2024 16:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBdAH-00032B-Hm; Mon, 27 May 2024 16:25:37 +0000
Received: by outflank-mailman (input) for mailman id 730907;
 Mon, 27 May 2024 16:25:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VIbX=M6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1sBdAG-000325-Lx
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 16:25:36 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be5fd511-1c45-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 18:25:34 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-420298ff5b1so111546515e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 09:25:34 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a08a8c9sm9425250f8f.40.2024.05.27.09.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 09:25:33 -0700 (PDT)
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
X-Inumbo-ID: be5fd511-1c45-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716827134; x=1717431934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pHCRB1EKjD0Nhx9Lp4qHLpHLpjYqMbPoKLCmaUHOhBk=;
        b=FZBwif6X1r4eUhmRPQcUb+hT966bGafJBklkOnFdpWyp6RkicmNU1iCm69AAMTrR4E
         d1D9Qu68n6qmZUJwLE8TtPFPuCedkheM0Pbv5Jq9fXLkBsl22w4uTjrzHy8ZobjDXRfh
         Idkb8UW1xaiMfydeDIpxy/TtsAPTtv1+UIyeN8Ea43f/00l6pr7kDPSq9MujCNs0xjUK
         76S+fYJ29jG0CbKdX9dRtUjTMXRTPEQIoLql6/c1BPy9ct0kgDoNuRrMlY25NF8+9+8u
         l891w+rSf/lHfaJWYwOD2jL+j5bSD0ah1VcM3OiT+gH/OSUPQ3UtdlEV5V5Q2V5ahX2K
         CDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716827134; x=1717431934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pHCRB1EKjD0Nhx9Lp4qHLpHLpjYqMbPoKLCmaUHOhBk=;
        b=eGlkFDw0wyVq0oVzFTn4Iq8G7lhZbBFXpcfdT4nT9AhXUSKsm5xqZ2iFjOtIsV3DGS
         pc3JlQjOpKTwHmCM5suwSYCXztfJGRHDiZ1YZguOqSxSyFNwmDw2m4OG5RFWjWvEgYQ7
         DZyhZdLw1mR77Fgf+x8LmZn2vAoo9cpamMNSqO9kSSfTM5C/1rPj7DpnyCE6WKYyc3Sd
         gq4tSMwQo+9jpImhsfLG4pZmuGD2MFRIj2JVnRKH3cczr+e8SXVTBolgMAfOs0Dw792M
         jWGhcJvxnJvLFdc675sUKiz0oNemv8ETZ0by4o0YclU1TVcbpBRz7mLpSayy9DgnDMmh
         VZ0A==
X-Forwarded-Encrypted: i=1; AJvYcCVAPxi6HzKVnBMe5aj5Uf3H0lkC4VR+r0YTSkGUzwYEOBRbByjs3p9WnWD4sXuMb1s/ufgPU+eTVKqm4NOG4OLpuGtbDv+l6RvlE98MPKM=
X-Gm-Message-State: AOJu0YxzYekXDT5rJyEi3KgscrwwqP3tzc34bALsMICHOWuYBpdBQ1gD
	e89hFm60x6RTjROlG8+FB2ABQKd2gtqq7s8GkpZLOK96/ei3gORVMixfU8Ctt4M=
X-Google-Smtp-Source: AGHT+IH6WMXwWBG4+mCGuCUb/g8oSTSVIPe9BmZQhyjU+xKoK4iDxbkQ67gIKHpGtUg5mEm1R3VGJA==
X-Received: by 2002:a05:600c:138e:b0:41b:fa34:9e48 with SMTP id 5b1f17b1804b1-42108a99ea9mr89258365e9.30.1716827133954;
        Mon, 27 May 2024 09:25:33 -0700 (PDT)
Message-ID: <4025f82f-242c-4c3e-952e-8ecf7a66838f@linaro.org>
Date: Mon, 27 May 2024 18:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/8] xen: Add xen_mr_is_memory()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 David Hildenbrand <david@redhat.com>, Anthony PERARD
 <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
 <20240524105152.1301842-4-edgar.iglesias@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240524105152.1301842-4-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Edgar,

On 24/5/24 12:51, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add xen_mr_is_memory() to abstract away tests for the
> xen_memory MR.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/xen/xen-hvm-common.c | 10 ++++++++--
>   include/sysemu/xen.h    |  8 ++++++++
>   2 files changed, 16 insertions(+), 2 deletions(-)

To consolidate we could add:

   static MemoryRegion xen_memory;

   MemoryRegion *xen_mr_memory_init(uint64_t block_len)
   {
      assert(!xen_memory.size);
      memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len, 
&error_fatal);
      return &xen_memory;
   }

and remove the extern declaration.

> diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
> index 754ec2e6cb..dc72f83bcb 100644
> --- a/include/sysemu/xen.h
> +++ b/include/sysemu/xen.h
> @@ -34,6 +34,8 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
>   void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
>                      struct MemoryRegion *mr, Error **errp);
>   
> +bool xen_mr_is_memory(MemoryRegion *mr);
> +
>   #else /* !CONFIG_XEN_IS_POSSIBLE */
>   
>   #define xen_enabled() 0
> @@ -47,6 +49,12 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
>       g_assert_not_reached();
>   }
>   
> +static inline bool xen_mr_is_memory(MemoryRegion *mr)
> +{
> +    g_assert_not_reached();
> +    return false;

No need for the stub, just always declare xen_mr_is_memory() ...
> +}
> +
>   #endif /* CONFIG_XEN_IS_POSSIBLE */

... here.

>   #endif

Removing the stub:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


