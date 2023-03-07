Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F283A6AE218
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507440.780932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYCl-000483-2q; Tue, 07 Mar 2023 14:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507440.780932; Tue, 07 Mar 2023 14:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYCl-00046A-05; Tue, 07 Mar 2023 14:22:15 +0000
Received: by outflank-mailman (input) for mailman id 507440;
 Tue, 07 Mar 2023 14:22:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZYCi-000464-S4
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:22:12 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72cd7106-bcf3-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 15:22:10 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id e13so12265602wro.10
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 06:22:10 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a5d40c3000000b002ce37d2464csm8961236wrq.83.2023.03.07.06.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:22:09 -0800 (PST)
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
X-Inumbo-ID: 72cd7106-bcf3-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678198930;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e1T7dwTAFynIqBbDPT+25OMILowKxuyALasx/unKD6A=;
        b=ah0BH9g0PDl8+P8TM81AODYdMIlTRJ3nnN0V7sjJDQSQMmrCv9UMlkpayOW/ccFnT8
         onwTS+v1PIqriHeg+o0DpY5tr76TiqqDmNJiMp8/eE+v6u21l/c7aKzBZ5ESCGslkDWq
         OYdTK+WRTpJgYiSazr7hKDujqNlGiOsURSHcy16/YhbmK2YWOk3eekUs+SNnC9aH4qBC
         QBglJlQ7L64P5Xq+zMhiCjv0t942LBdpQKFJ71Kzf8oFh9BU1wbBnzw2iNW6W5kKwbty
         k6oL1wod4Er9MfGf2cBWyApGLT/7JBbXETySYfZxVS9+GoNPTiIXg/H4PsIKrvQdrazf
         fsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678198930;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1T7dwTAFynIqBbDPT+25OMILowKxuyALasx/unKD6A=;
        b=G5b8ajAILBH+yMgimXmvDeLB+IrpS5mlxv6NK6CVI752uUhZTebWDN4ZVRa5HDUsGZ
         ZkJp8nE3B/oA0P7+3GAxSfEjemPjemDRpbS7Wvw3wMTAQbQmWjFgG4hgqhzH42oBYBHZ
         AKnJrKcJ9bJKoBpPj138sC+COSBHVe7uuO63ZXo6FNhKYoBR9dyNMxbN3TyDtjWuEYeL
         8O8+DLojbmJjTwiQZbvhF5NHWw43W7qqoFDV6lhuovK3L8m67uc2RNeEuPkzFxFPDxXm
         xtefwpQMRvlN0L0Jc1LAgE9b3Q9qq+1Zwley0k7OBBiHJn4N17v+KGVqFX5vt0bD/Wov
         fyvg==
X-Gm-Message-State: AO0yUKVttvRsob4WziwycYMr0TCgGUKRlw+pz2GVqvOQQftU0SYHwjpL
	9I/Hv4/c/3fJDXpeWrv6udM=
X-Google-Smtp-Source: AK7set+/tlPexfD8420vsP0Uvu9OA/xu7ONG39HFE1Bfdz8z05dvKTOFlcpJ8UPQ5E/Xu1PKDjW+ng==
X-Received: by 2002:adf:eed1:0:b0:2c5:4c9f:cf3b with SMTP id a17-20020adfeed1000000b002c54c9fcf3bmr11972241wrp.7.1678198930253;
        Tue, 07 Mar 2023 06:22:10 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <fb9c8676-75b9-85c3-2eac-4cf7d31cd894@xen.org>
Date: Tue, 7 Mar 2023 14:22:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 10/25] hw/xen: Add gnttab operations to allow
 redirection to internal emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-11-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-11-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Move the existing code using libxengnttab to xen-operations.c and allow
> the operations to be redirected so that we can add emulation of grant
> table mapping for backend drivers.
> 
> In emulation, mapping more than one grant ref to be virtually contiguous
> would be fairly difficult. The best way to do it might be to make the
> ram_block mappings actually backed by a file (shmem or a deleted file,
> perhaps) so that we can have multiple *shared* mappings of it. But that
> would be fairly intrusive.
> 
> Making the backend drivers cope with page *lists* instead of expecting
> the mapping to be contiguous is also non-trivial, since some structures
> would actually *cross* page boundaries (e.g. the 32-bit blkif responses
> which are 12 bytes).
> 
> So for now, we'll support only single-page mappings in emulation. Add a
> XEN_GNTTAB_OP_FEATURE_MAP_MULTIPLE flag to indicate that the native Xen
> implementation *does* support multi-page maps, and a helper function to
> query it.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
[snip]
> @@ -65,7 +195,34 @@ struct evtchn_backend_ops libxenevtchn_backend_ops = {
>       .pending = xenevtchn_pending,
>   };
>   
> +static xengnttab_handle *libxengnttab_backend_open(void)
> +{
> +    return xengnttab_open(NULL, 0);
> +}
> +
> +
> +static struct gnttab_backend_ops libxengnttab_backend_ops = {
> +    .features = XEN_GNTTAB_OP_FEATURE_MAP_MULTIPLE,
> +    .open = libxengnttab_backend_open,
> +    .close = xengnttab_close,
> +    .grant_copy = libxengnttab_fallback_grant_copy,
> +    .set_max_grants = xengnttab_set_max_grants,
> +    .map_refs = xengnttab_map_domain_grant_refs,
> +    .unmap = xengnttab_unmap,
> +};
> +
>   void setup_xen_backend_ops(void)
>   {
> +#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40800
> +    xengnttab_handle *xgt = xengnttab_open(NULL, 0);
> +
> +    if (xgt) {
> +        if (xengnttab_grant_copy(xgt, 0, NULL) == 0) {
> +            xen_gnttab_ops->grant_copy = libxengnttab_backend_grant_copy;

As we found out, this ^^^ is dereferencing a NULL pointer. Switching 
'xen_gnttab_ops->' for the obviously intended 
'libxengnttab_backend_ops.' fixes the problem.

> +        }
> +        xengnttab_close(xgt);
> +    }
> +#endif
>       xen_evtchn_ops = &libxenevtchn_backend_ops;
> +    xen_gnttab_ops = &libxengnttab_backend_ops;

With that rectified...

Reviewed-by: Paul Durrant <paul@xen.org>

>   }


