Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55EC6049F3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 16:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425847.673926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olASK-0000NC-Qm; Wed, 19 Oct 2022 14:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425847.673926; Wed, 19 Oct 2022 14:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olASK-0000Kx-Ma; Wed, 19 Oct 2022 14:54:04 +0000
Received: by outflank-mailman (input) for mailman id 425847;
 Wed, 19 Oct 2022 14:54:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6HZ=2U=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1olASJ-0000Kr-0g
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 14:54:03 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de3cd9f7-4fbd-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 16:54:01 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id bp11so29551537wrb.9
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 07:54:01 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1c7c13000000b003b4868eb6bbsm174007wmc.23.2022.10.19.07.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 07:54:00 -0700 (PDT)
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
X-Inumbo-ID: de3cd9f7-4fbd-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0yRTTVBNbj3XA+3EDNVvotZrJvbU0BGaEmHb8InPfG0=;
        b=E2vxbpUHwX77sZFJL6PBKUbeVbBH7WAAubW+1wsp/BXJgK5iWz2YRxogovWe2aDr0S
         IJFe1A5MdZ1vn1D3jQHVTfyVXPiY1Mx+pxFrno/Q6e27CWXL/O1oCxAnzcnpxfB0hEKX
         GlTQrM4S6Y0MT03oQ8ap3MU/oCZD6jsempzvHA69yS81Y2xaF1+nMdjeOACtnmIQyUR2
         I0ZrXwKrukpYCXzV93rFZkILor8/hDHDBv17SAMW66LXf+tGx0broRsoSqEISdsMuFTU
         Kpg9P+3yFGGQx0o8JxIyoGA/TFIUeoEkp38e/BA5VhKz0zN+txCDQJj4CjBJwsbsqN1e
         G8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0yRTTVBNbj3XA+3EDNVvotZrJvbU0BGaEmHb8InPfG0=;
        b=3YbjAw2wuVEps6PX7YX/6qDRJINlvI2Alrz1RgcvO+g9+52hL9NoFIbOj18deck/mz
         FzBX/nET+Ui/DF0+wRiXAjIjfTFlxGjCxhBG7l7rhqqK2Hr/U6yythMegqyNSqq5ayu7
         62/f01BIrMGBI72RLOvcObDv4leT4P4+WfmK5RKuB+Pla8ugO2axnlkU1G67JDxnWZka
         fTOsaDWBOwjrLy0ZQeFEj90bQFY3EOEeU10cLaW0BHbBX22sJnvgsLlGm2jxNcdf8DT2
         s5m2sbiRp5Xy1NK54DQq7i650FBNNhuwXCzLWzYy6HQUMl4RkT5UIbf8sAyPArHgz0SW
         u+vQ==
X-Gm-Message-State: ACrzQf1h9MOdlRPgDel84DEt6qIfkmDNl8RPcAXyChH0lVBqEZ2suOxG
	FK3BouAkm+eCYB9aSj+hOTE=
X-Google-Smtp-Source: AMsMyM6cYbnQ89uH4UoJ1T55BKD6zyEHstSbXhd0DL+SznmT6uERxps5bwjTk3dmvYSuT212RMynQw==
X-Received: by 2002:a5d:5850:0:b0:234:27c9:8fd8 with SMTP id i16-20020a5d5850000000b0023427c98fd8mr2107984wrf.548.1666191240976;
        Wed, 19 Oct 2022 07:54:00 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f12d712c-dc47-7778-8cf5-cfd621fdb9ad@xen.org>
Date: Wed, 19 Oct 2022 15:53:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 02/12] hw/i386/xen/: move xen-mapcache.c to hw/xen/
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-3-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20221015050750.4185-3-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2022 06:07, Vikram Garhwal wrote:
> xen-mapcache.c contains common functions which can be used for enabling Xen on
> aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen to make it
> accessible for both aarch64 and x86.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   hw/i386/meson.build              | 1 +
>   hw/i386/xen/meson.build          | 1 -
>   hw/i386/xen/trace-events         | 5 -----
>   hw/xen/meson.build               | 4 ++++
>   hw/xen/trace-events              | 5 +++++
>   hw/{i386 => }/xen/xen-mapcache.c | 0
>   6 files changed, 10 insertions(+), 6 deletions(-)
>   rename hw/{i386 => }/xen/xen-mapcache.c (100%)
> 
> diff --git a/hw/i386/meson.build b/hw/i386/meson.build
> index 213e2e82b3..cfdbfdcbcb 100644
> --- a/hw/i386/meson.build
> +++ b/hw/i386/meson.build
> @@ -33,5 +33,6 @@ subdir('kvm')
>   subdir('xen')
>   
>   i386_ss.add_all(xenpv_ss)
> +i386_ss.add_all(xen_ss)
>   
>   hw_arch += {'i386': i386_ss}
> diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
> index be84130300..2fcc46e6ca 100644
> --- a/hw/i386/xen/meson.build
> +++ b/hw/i386/xen/meson.build
> @@ -1,6 +1,5 @@
>   i386_ss.add(when: 'CONFIG_XEN', if_true: files(
>     'xen-hvm.c',
> -  'xen-mapcache.c',
>     'xen_apic.c',
>     'xen_platform.c',
>     'xen_pvdevice.c',
> diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
> index 5d6be61090..a0c89d91c4 100644
> --- a/hw/i386/xen/trace-events
> +++ b/hw/i386/xen/trace-events
> @@ -21,8 +21,3 @@ xen_map_resource_ioreq(uint32_t id, void *addr) "id: %u addr: %p"
>   cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
>   cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
>   
> -# xen-mapcache.c
> -xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
> -xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
> -xen_map_cache_return(void* ptr) "%p"
> -
> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index ae0ace3046..19d0637c46 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -22,3 +22,7 @@ else
>   endif
>   
>   specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
> +
> +xen_ss = ss.source_set()
> +
> +xen_ss.add(when: 'CONFIG_XEN', if_true: files('xen-mapcache.c'))

Curious as to why you couldn't just add this to the softmmu_ss list above?

   Paul

> diff --git a/hw/xen/trace-events b/hw/xen/trace-events
> index 3da3fd8348..2c8f238f42 100644
> --- a/hw/xen/trace-events
> +++ b/hw/xen/trace-events
> @@ -41,3 +41,8 @@ xs_node_vprintf(char *path, char *value) "%s %s"
>   xs_node_vscanf(char *path, char *value) "%s %s"
>   xs_node_watch(char *path) "%s"
>   xs_node_unwatch(char *path) "%s"
> +
> +# xen-mapcache.c
> +xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
> +xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
> +xen_map_cache_return(void* ptr) "%p"
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> similarity index 100%
> rename from hw/i386/xen/xen-mapcache.c
> rename to hw/xen/xen-mapcache.c


