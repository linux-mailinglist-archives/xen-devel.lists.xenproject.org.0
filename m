Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540B549B56E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 14:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260369.449725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCMI9-0002Vd-FW; Tue, 25 Jan 2022 13:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260369.449725; Tue, 25 Jan 2022 13:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCMI9-0002SH-B6; Tue, 25 Jan 2022 13:55:25 +0000
Received: by outflank-mailman (input) for mailman id 260369;
 Tue, 25 Jan 2022 13:55:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAYL=SJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nCMI8-0002Rb-3E
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 13:55:24 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70a85d17-7de6-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 14:55:23 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id v123so25422723wme.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jan 2022 05:55:23 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id p17sm16319687wrf.112.2022.01.25.05.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 05:55:22 -0800 (PST)
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
X-Inumbo-ID: 70a85d17-7de6-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6EJNmViF+HBybLCJxBBkQKt7yPxgwq5NZNFhjZnZK3I=;
        b=qKq04QsqZXmb9epEdgKocCid6isDpmZdZHvrngDN3zu12YRVRrxasClgp3c0im4JNz
         NRovbe1Zqpx+9esQJvQ15J3I8dRkdLnkiV5o2oK8KDnqL8ROhI/Af7yE1gtrt37h0Tlv
         DRu935UXPyZyVFtTHKyZR85p1BJ4vUJQgU1LZdJC4sQM8waYePLmmqFuj8IdUa6mSl2Y
         e5xGABibr078we5nQjLbxKzq7R5Qp/sbwHVAYLph2HRjoB5V2C8tZtIscBtSJaigqCDz
         KyIrTmQdDH5t/Rfpl3dHuFd6REAsA0c72hwlnjZZjBTxsq7EcUrwdWmwcnxgcKQ4z2UG
         HJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6EJNmViF+HBybLCJxBBkQKt7yPxgwq5NZNFhjZnZK3I=;
        b=HDOi2+PHAefo/1gaY2OL/ZLxpZKhmLd21ebhv48sOBnrh6TUmIHIKiNZ+RMWZKwE8k
         dUOZ35hw6hwCpSGE2Hi8IERxu3VkPLxRJEwgtkr729b+tigIMeNlV6f9MG/WYZhZdwe/
         GyPqiVY1BUBMBux2C8l9qHYe/iuQQsG3umXuDlnP56mqGiMGjgVSXOT5XBX2U2uHFeWS
         5vxKFCx5KpPldkKQ5sY6FCMeFIK+QJCGjHQcHR+WOkJ7s10uW/nNr5T5vmtYdspZG0d7
         HXmAKeS/UsY2w8ZIcPN0FmgyWVLOeXcRSXjwRR7hvzfhnamf6aLAqOuXN0upKosTT+L6
         IHnA==
X-Gm-Message-State: AOAM531vjdAfbmp2O4r7xFTzS1EJ2/NAQRi/enn+6QSR0kpfQ3mAb36j
	bYxNScn68rS2fsJOcTMR5o0=
X-Google-Smtp-Source: ABdhPJwPRU8u3j94OQtF7wTRh9feVaxTmZqsL3D4HbIxOPsEKNx0H0A5j/+TEbClEDLoBMTWKvTDsA==
X-Received: by 2002:a05:600c:3641:: with SMTP id y1mr3103373wmq.44.1643118922489;
        Tue, 25 Jan 2022 05:55:22 -0800 (PST)
Message-ID: <2da0075f-4a6f-b196-6ae7-73c0df66e437@gmail.com>
Date: Tue, 25 Jan 2022 13:55:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2] xen-mapcache: Avoid entry->lock overflow
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
References: <20220124104450.152481-1-ross.lagerwall@citrix.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220124104450.152481-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/01/2022 10:44, Ross Lagerwall wrote:
> In some cases, a particular mapcache entry may be mapped 256 times
> causing the lock field to wrap to 0. For example, this may happen when
> using emulated NVME and the guest submits a large scatter-gather write.
> At this point, the entry map be remapped causing QEMU to write the wrong
> data or crash (since remap is not atomic).
> 
> Avoid this overflow by increasing the lock field to a uint32_t and also
> detect it and abort rather than continuing regardless.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> Changes in v2: Change type to uint32_t since there is a hole there
> anyway. The struct size remains at 48 bytes on x86_64.
> 
>   hw/i386/xen/xen-mapcache.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
> index bd47c3d672..f2ef977963 100644
> --- a/hw/i386/xen/xen-mapcache.c
> +++ b/hw/i386/xen/xen-mapcache.c
> @@ -52,7 +52,7 @@ typedef struct MapCacheEntry {
>       hwaddr paddr_index;
>       uint8_t *vaddr_base;
>       unsigned long *valid_mapping;
> -    uint8_t lock;
> +    uint32_t lock;
>   #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
>       uint8_t flags;
>       hwaddr size;
> @@ -355,6 +355,12 @@ tryagain:
>       if (lock) {
>           MapCacheRev *reventry = g_malloc0(sizeof(MapCacheRev));
>           entry->lock++;
> +        if (entry->lock == 0) {
> +            fprintf(stderr,
> +                    "mapcache entry lock overflow: "TARGET_FMT_plx" -> %p\n",
> +                    entry->paddr_index, entry->vaddr_base);
> +            abort();
> +        }
>           reventry->dma = dma;
>           reventry->vaddr_req = mapcache->last_entry->vaddr_base + address_offset;
>           reventry->paddr_index = mapcache->last_entry->paddr_index;


