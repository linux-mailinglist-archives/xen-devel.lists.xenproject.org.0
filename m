Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C9ABABD9B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 09:39:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133804.1471859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Uwp-0007yP-BQ; Tue, 30 Sep 2025 07:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133804.1471859; Tue, 30 Sep 2025 07:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Uwp-0007wr-7n; Tue, 30 Sep 2025 07:38:55 +0000
Received: by outflank-mailman (input) for mailman id 1133804;
 Tue, 30 Sep 2025 07:38:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Uwn-0007wl-VF
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 07:38:53 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82e1f413-9dd0-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 09:38:52 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so3272313f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 00:38:52 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602efdsm22464734f8f.34.2025.09.30.00.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 00:38:51 -0700 (PDT)
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
X-Inumbo-ID: 82e1f413-9dd0-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759217932; x=1759822732; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qE2E68kg55lkWKGNUPUbXEU5stTPqSQmthsm27d4faI=;
        b=qYT9/Ti6kdEBs0fWf+e3tCR3MnshPbHf8Y56HV77AY9zFKECTWI0DQzOGjEsol4VZe
         +UpnopCvrPg9yJZqZntH+WVNZ1pQFqbPX822Pas8EmW3BZokr+GBict8sK0sbMjhrZPX
         wz3iBzTsxX4ptrJiP1BLjMWfP/v3WCXdwKq1VW1K+Kolg0drWQ8BVTzyszbb6osWZtML
         2wMLuyIpZDqIyC3jxFYpH8fMDTN/W8zj7Tk2SyHwq0Y23HegjOJ/mK3tKzkCutGA9L6l
         T3Fnu8Mp4lqgToKmnYKOe2bri4w2bnSotCTEqrIrdIfH/rATPQXka+SrpI747Y5P/39H
         QEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759217932; x=1759822732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qE2E68kg55lkWKGNUPUbXEU5stTPqSQmthsm27d4faI=;
        b=Udbijg/fCbxTyteajJG/HH5QLNHxO3lspEoqNhcNISxJWzIASsPrOrXeimHaHgsmES
         uXpal37OGrpfLFyDfYPCuLPBLaK1fnEU3pBB7n0vDnvO4b8HnjSmr7Urd1+fbxRGMbMf
         vUXMoUQjbcGDUOGz3hHu01Oxo6fdBhKQ4ovfs0v4Hb9PMlzdBHZnTkdoHglD2/KETxfh
         V1mXZ433uEaENg7HY642xLcOhnBdhd3Tvq6qIMIuqrdGo/dHprMArOifhflURbMetV0J
         AQZQlFJCSQ1gNeTWwL0Vv5tuoXUYlwooT8dXvj5UJAG7dyNRZ+sR99VdCvvfroNa3C0F
         pmsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4iqxFFnbatlAJlOEZyZEy/uet7WDWzobcGwZ4ROCIYcUGGbDqwRHuo3tRbRHZXZJBjrPSufjnEgo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzymrWhjLzz4Ham4ih7F71+W3T23FbCirZzBZn1bmeHWylGKN4c
	ynGk2MbwNmBFJaza3KAvqpKmI39b7t3MAmdBRiw9bb0uKAjBMqfBBOu/+kHzmUAi10s=
X-Gm-Gg: ASbGncsceehSztGWqTMNLK72R6EIqDRGBFjNg5Jxe4Uazofe/r60rME+nleMy55H0bM
	aP18xk4ZLgDCziwuC0J5w2wdYz7SlLJHS/RENgJgabX2umcAm1Wqz4d7AJQCy5bvOEvggiKphEc
	qcFvrSKlndNFE67uYc42pMQxAcj62qtSisivpLdfLs8R+3131JSmgQKnRtE4yDBSO9XcaPzSQRA
	FJgZQYFbN1wl7k/bHvSU0kUwlBUofInp/T/F9De9Oe8xY/dwLPkksV+lihXFJet8Mm7ucQSw29X
	XNuuYauGeNJQ+j1sYEIhWDNsTgLUoKJTfiAnPk9MlknuDYAFe1o3p1UujSLE21r9O9l0t0YdtJT
	njjQad+rS1ybIYi+Ifx49qwwCZO2SOZ5m1/c7WGyV0P3uQLQC4A1lMDX71rwxywvCDrrcfNnmB+
	PF4bdx2ryq+KfDf0THM3wHSho3
X-Google-Smtp-Source: AGHT+IE+CAzuCcPF3rL8oHgsDWK0spr1fitX6ekcCdqYoQO8jnWYejdEAIaIwc3jMgWkxQsuV9mqBA==
X-Received: by 2002:a05:6000:2f87:b0:3e9:2fea:6795 with SMTP id ffacd0b85a97d-40e4b389223mr19891217f8f.53.1759217931688;
        Tue, 30 Sep 2025 00:38:51 -0700 (PDT)
Message-ID: <b06323d4-96e8-41c2-b437-ea27b2952e7a@linaro.org>
Date: Tue, 30 Sep 2025 09:38:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] hw/virtio/vhost: Replace legacy
 cpu_physical_memory_*map() calls
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Herne <jjherne@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Garzarella <sgarzare@redhat.com>, xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 Eric Farman <farman@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Zhao Liu <zhao1.liu@intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20250930041326.6448-1-philmd@linaro.org>
 <20250930041326.6448-17-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250930041326.6448-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/9/25 06:13, Philippe Mathieu-Daudé wrote:
> Use VirtIODevice::dma_as address space to convert the legacy
> cpu_physical_memory_[un]map() calls to address_space_[un]map().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/virtio/vhost.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 6557c58d12a..890d2bac585 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -27,6 +27,7 @@
>   #include "migration/blocker.h"
>   #include "migration/qemu-file-types.h"
>   #include "system/dma.h"
> +#include "system/memory.h"
>   #include "trace.h"
>   
>   /* enabled until disconnected backend stabilizes */
> @@ -455,7 +456,8 @@ static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
>                                 hwaddr *plen, bool is_write)
>   {
>       if (!vhost_dev_has_iommu(dev)) {
> -        return cpu_physical_memory_map(addr, plen, is_write);
> +        return address_space_map(vdev->dma_as, addr, plen, is_write,
> +                                 MEMTXATTRS_UNSPECIFIED);
>       } else {
>           return (void *)(uintptr_t)addr;
>       }
> @@ -466,7 +468,7 @@ static void vhost_memory_unmap(struct vhost_dev *dev, void *buffer,
>                                  hwaddr access_len)
>   {
>       if (!vhost_dev_has_iommu(dev)) {
> -        cpu_physical_memory_unmap(buffer, len, is_write, access_len);
> +        address_space_unmap(vdev->dma_as, buffer, len, is_write, access_len);
>       }
>   }
>   

Forgot to squash:

-- >8 --
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 890d2bac585..acd359bdb3f 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -456,7 +456,7 @@ static void *vhost_memory_map(struct vhost_dev *dev, 
hwaddr addr,
                                hwaddr *plen, bool is_write)
  {
      if (!vhost_dev_has_iommu(dev)) {
-        return address_space_map(vdev->dma_as, addr, plen, is_write,
+        return address_space_map(dev->vdev->dma_as, addr, plen, is_write,
                                   MEMTXATTRS_UNSPECIFIED);
      } else {
          return (void *)(uintptr_t)addr;
(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,p,?]? y
@@ -468,7 +468,8 @@ static void vhost_memory_unmap(struct vhost_dev 
*dev, void *buffer,
                                 hwaddr access_len)
  {
      if (!vhost_dev_has_iommu(dev)) {
-        address_space_unmap(vdev->dma_as, buffer, len, is_write, 
access_len);
+        address_space_unmap(dev->vdev->dma_as, buffer, len, is_write,
+                            access_len);
      }
  }

---

