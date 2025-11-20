Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D89C73DE8
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167116.1493483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3Ou-0004vo-9m; Thu, 20 Nov 2025 12:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167116.1493483; Thu, 20 Nov 2025 12:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3Ou-0004tf-76; Thu, 20 Nov 2025 12:04:36 +0000
Received: by outflank-mailman (input) for mailman id 1167116;
 Thu, 20 Nov 2025 12:04:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amKt=54=ventanamicro.com=dbarboza@srs-se1.protection.inumbo.net>)
 id 1vM3Os-0004tZ-3r
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:04:34 +0000
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [2607:f8b0:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11b547ee-c609-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 13:04:31 +0100 (CET)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7c701097a75so377595a34.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 04:04:31 -0800 (PST)
Received: from [192.168.68.110] ([177.188.133.235])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7c78d302329sm924384a34.6.2025.11.20.04.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 04:04:27 -0800 (PST)
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
X-Inumbo-ID: 11b547ee-c609-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763640270; x=1764245070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HarGE69Xcqz4hsoJV05tBZlKbKycWI9YTMfsZh37Imo=;
        b=j/gmgp+tfUNOPy/cAq627OwATFnbxmLHSyXl2Mkk8r236mQgksgA3XAMEdvA5rPmKf
         QqUeuzZnpQHbK1STpihFf3q2rXXmqykR/7cNvnjEAqlDHXdYhAQqEqS6Elemsbtn50Vz
         oBm0Y6xECMxIdTRMwWpMUIBn/Qpx8H/AxNiTo7ngFUpn/GXC5nqpbQY1Pq2drpCwkxbg
         GRImTZWgln5g63qvjNeUi0Ch4EsYZN5Bkw24CpeVSrhW3wTS1ivrQo4xzm3i10wUs9iW
         5jZcxTbc/1t2hf8N00FNwnmgY780NJMRg+PT9sc9wPGWeg+v7FHdE8jaA3W/LYbHfj7y
         HukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763640270; x=1764245070;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HarGE69Xcqz4hsoJV05tBZlKbKycWI9YTMfsZh37Imo=;
        b=uuWjLXhaYE+YYuIcc9B0Ra81ihJXrkUh4G8FIH4zq1nLmQchGfoLwXxRrcXpH5x+lA
         D/gR0ZDxbrYpORRmwFYuu5ZGj2qKQwZ6B06jXBcPnD4U71sL4fd68mITMHK3DYNlgWyF
         +cgeg/AnCZUPGmMbqt6qGHkAaoRa0uMlXTiNkR86AcV0jdD6KLBEwf30OdpdLjX5AR0S
         GBvcX07CmEj8IjSQcpE9HABZlPikOxVCA1nh200sXd7Mt0htqhRYFzMFebrcxsTQ/hsy
         CYaJ+IA0o6E4qqizW+N9ln9sCp2VwGvLEeA2d9E0EYeR/+/2+Nf5LIyhPO3/UqfgX+2O
         80Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUbsiUaKpTQDbPgucbPwBc+GI7JPewq5dNYrEjfhCMA3UfgLwvXiM3C8nkS1H1QrslsqHGHLyTtIeI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJrK97I6Oe15FQGv2+GXqQ23Ro6ouROdtVxAEvZV3ll61oPBdP
	AFQgJkkBAwkZHh51s2jDm/YZ/gq4PiBc7a8caMjMqzvzEvsSpcOPHejDWPbf+pDHy2k=
X-Gm-Gg: ASbGncsBCSx24VNqu9T/AfKmpOlZV3aliyj9t93ORlSWXXxvzgqtFFGyLfvatRJFVjd
	DaI2yaUkYFMy1JE79zFX7R5j9L4rXcvMSbFi1lKsMdlNCEiqnEck+9SFiW3sJvcgSRdKNCFu22F
	IdbqBPawEqJR0RkAfFPe3MH5MKl5RKMA/DAwKOwQDPk3zUXN6tobUgERjFV80dDplagsKYVf7pU
	vQGQNfmWqBR3BgJPEiNOxVGRpVoA4bgrgqxBFetKXpxR6MPaRzIXOZxag2OKrpuICt3SfuHutuq
	6VrAxGZFXMX5JtFROfY+8gm7I3guFkRdAvF5SOFrHxKRwcxAlWpBNeyCc4nlFGVGiPCxaya7E9u
	E+O4+b7yLw6yj4SXlzJDeuYXmHf6C7mopG9AeRRkA9CS4UrR47qVpsAcN1WuiG05sgyKzFh3QFY
	LgCDH0SnvrSqLEnu6IYK2z5osqauQ=
X-Google-Smtp-Source: AGHT+IE7T3zLtJLZzoLsBItMOrBxunHBl1jg9y/7kshJBu9cagdI0RFnANqpM80LeRmUMaqt6X37qA==
X-Received: by 2002:a05:6830:7187:b0:7c7:59a1:48d7 with SMTP id 46e09a7af769-7c78f381e2bmr1004247a34.2.1763640269622;
        Thu, 20 Nov 2025 04:04:29 -0800 (PST)
Message-ID: <4fb0a736-4450-47c0-9f9e-6cb86a3b28ea@ventanamicro.com>
Date: Thu, 20 Nov 2025 09:04:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hw/core/loader: Make load_elf_hdr() return bool,
 simplify caller
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com,
 harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, sstabellini@kernel.org,
 anthony@xenproject.org, paul@xen.org, berrange@redhat.com,
 peterx@redhat.com, farosas@suse.de, eblake@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, zhao1.liu@intel.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-2-armbru@redhat.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251119130855.105479-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/19/25 10:08 AM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Nice cleanup


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   include/hw/loader.h |  4 +++-
>   hw/arm/boot.c       |  6 +-----
>   hw/core/loader.c    |  8 ++++++--
>   hw/riscv/spike.c    | 10 +---------
>   4 files changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index d035e72748..6f91703503 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -188,8 +188,10 @@ ssize_t load_elf(const char *filename,
>    *
>    * Inspect an ELF file's header. Read its full header contents into a
>    * buffer and/or determine if the ELF is 64bit.
> + *
> + * Returns true on success, false on failure.
>    */
> -void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
> +bool load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
>   
>   ssize_t load_aout(const char *filename, hwaddr addr, int max_sz,
>                     bool big_endian, hwaddr target_page_size);
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index b91660208f..06b303aab8 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -766,16 +766,12 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
>       int data_swab = 0;
>       int elf_data_order;
>       ssize_t ret;
> -    Error *err = NULL;
>   
> -
> -    load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, &err);
> -    if (err) {
> +    if (!load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, NULL)) {
>           /*
>            * If the file is not an ELF file we silently return.
>            * The caller will fall back to try other formats.
>            */
> -        error_free(err);
>           return -1;
>       }
>   
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 590c5b02aa..10687fe1c8 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -364,8 +364,9 @@ const char *load_elf_strerror(ssize_t error)
>       }
>   }
>   
> -void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
> +bool load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
>   {
> +    bool ok = false;
>       int fd;
>       uint8_t e_ident_local[EI_NIDENT];
>       uint8_t *e_ident;
> @@ -380,7 +381,7 @@ void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
>       fd = open(filename, O_RDONLY | O_BINARY);
>       if (fd < 0) {
>           error_setg_errno(errp, errno, "Failed to open file: %s", filename);
> -        return;
> +        return false;
>       }
>       if (read(fd, hdr, EI_NIDENT) != EI_NIDENT) {
>           error_setg_errno(errp, errno, "Failed to read file: %s", filename);
> @@ -415,8 +416,11 @@ void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
>           off += br;
>       }
>   
> +    ok = true;
> +
>   fail:
>       close(fd);
> +    return ok;
>   }
>   
>   /* return < 0 if error, otherwise the number of bytes loaded in memory */
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index b0bab3fe00..8531e1d121 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -180,15 +180,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>   
>   static bool spike_test_elf_image(char *filename)
>   {
> -    Error *err = NULL;
> -
> -    load_elf_hdr(filename, NULL, NULL, &err);
> -    if (err) {
> -        error_free(err);
> -        return false;
> -    } else {
> -        return true;
> -    }
> +    return load_elf_hdr(filename, NULL, NULL, NULL);
>   }
>   
>   static void spike_board_init(MachineState *machine)


