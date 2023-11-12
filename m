Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6447E92C3
	for <lists+xen-devel@lfdr.de>; Sun, 12 Nov 2023 21:44:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631219.984267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2HJN-0006RR-Pj; Sun, 12 Nov 2023 20:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631219.984267; Sun, 12 Nov 2023 20:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2HJN-0006Of-Ms; Sun, 12 Nov 2023 20:44:05 +0000
Received: by outflank-mailman (input) for mailman id 631219;
 Sun, 12 Nov 2023 20:44:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mXgX=GZ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r2HJM-0006OZ-5E
 for xen-devel@lists.xenproject.org; Sun, 12 Nov 2023 20:44:04 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35db95eb-819c-11ee-9b0e-b553b5be7939;
 Sun, 12 Nov 2023 21:44:01 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32deb2809daso2203002f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Nov 2023 12:44:01 -0800 (PST)
Received: from [192.168.199.91] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d4f8b000000b0032d829e10c0sm3912544wru.28.2023.11.12.12.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Nov 2023 12:44:00 -0800 (PST)
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
X-Inumbo-ID: 35db95eb-819c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699821841; x=1700426641; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nuKkz7mQOq17IJaC3wVcZl5PT7A/RGnCalTk1Z6cm4k=;
        b=d05ImZkgOHE2x0oeAQ2tcKQt7RZdReotSLUcxG0OOyx0aCtw4QJ3JM/Vm2i8LluqpA
         cwzQER3CCcuzXW6lnA0V2FvvidduzqPiO76KeT6EVaWGeSWThMBzKqjuoqvLn7vsJVjw
         wprUrWOu+QgFWiIMjbKVrfgd8bSaX6EwBW+D/ubOTY8b73wFoQJcZc9h2vtYD35tem3f
         EL7MY16PiLNIVyVsR66uejaw77UMoIqw6TN0RrYqq1wrKvmhWBU8YufrExUayGv2IfmE
         HAR+9lwTSJqiNy0RM1oc4EA4KFjWwr8HXTDtdDYMmwuH30pd7YE0Uq6MXXSkKvpIrir8
         X5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699821841; x=1700426641;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuKkz7mQOq17IJaC3wVcZl5PT7A/RGnCalTk1Z6cm4k=;
        b=H2hXhAXuSoeaew3bkdT91SmwuZd31H10IdWVPyq9hikuBmz2C0Y/5gcQHKN0DLerrx
         9k1iNikmkyYjTf05vfWJkW5UHPo7GpiaxsbSltBYCfOArebYGp/Y2dh0lHBs0x8AQDP4
         WiI6En2ARNeNsTs7F00ApP5jwJqxXHAPwwMyleCn2PbXle9e3nh1CBH2XdGzaLmaJ+ZO
         YnLulqVmrq5vflvTIxGijHJqqfZbfClKxyZixrhnKj0eCQ8n0xdPhkhvjxLXvEytAsSy
         kJVWFznaGYAV23u/867U2yOG4oP0mX2IuetJNca1bmHE4Ts7SFc6kq+oewca1Nhe9Ern
         hi+A==
X-Gm-Message-State: AOJu0YyXxdsL+Svf+B/cY11aEOKNqN+KghkgLQX/XZcXgtRr7iUa/ZXF
	Lc1pN+SJvhyHHmuOOAUNODs=
X-Google-Smtp-Source: AGHT+IHlMXE6LTQ+BDcUYetES5A5LmqI1g9ZnVfbIqmm9yoH0Db+HlTXJrXAQXM9VNjzLCvl28KiCA==
X-Received: by 2002:a5d:47c2:0:b0:32d:a7c8:eaf7 with SMTP id o2-20020a5d47c2000000b0032da7c8eaf7mr5145496wrc.20.1699821840859;
        Sun, 12 Nov 2023 12:44:00 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <bfa9e029-9d86-4a44-a7d4-c182bf816d84@xen.org>
Date: Sun, 12 Nov 2023 15:43:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v1 3/7] xen: xenstore: add possibility to preserve owner
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: David Woodhouse <dwmw2@infradead.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
 <20231110204207.2927514-4-volodymyr_babchuk@epam.com>
Organization: Xen Project
In-Reply-To: <20231110204207.2927514-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2023 15:42, Volodymyr Babchuk wrote:
> Add option to preserve owner when creating an entry in Xen Store. This
> may be needed in cases when Qemu is working as device model in a
> domain that is Domain-0, e.g. in driver domain.
> 
> "owner" parameter for qemu_xen_xs_create() function can have special
> value XS_PRESERVE_OWNER, which will make specific implementation to
> get original owner of an entry and pass it back to
> set_permissions() call.
> 

If QEMU is running in a driver domain then it should know whether the 
domid of the domain it is running in and use that. Yes, it is hardcoded 
to 0 at the moment but surely a backend domid (which defaults to 0) 
could be passed on the command line?

   Paul

> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   hw/i386/kvm/xen_xenstore.c       | 18 ++++++++++++++++++
>   hw/xen/xen-operations.c          | 12 ++++++++++++
>   include/hw/xen/xen_backend_ops.h |  2 ++
>   3 files changed, 32 insertions(+)
> 
> diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
> index 660d0b72f9..7b894a9884 100644
> --- a/hw/i386/kvm/xen_xenstore.c
> +++ b/hw/i386/kvm/xen_xenstore.c
> @@ -1572,6 +1572,24 @@ static bool xs_be_create(struct qemu_xs_handle *h, xs_transaction_t t,
>           return false;
>       }
>   
> +    if (owner == XS_PRESERVE_OWNER) {
> +        GList *perms;
> +        char letter;
> +
> +        err = xs_impl_get_perms(h->impl, 0, t, path, &perms);
> +        if (err) {
> +            errno = err;
> +            return false;
> +        }
> +
> +        if (sscanf(perms->data, "%c%u", &letter, &owner) != 2) {
> +            errno = EFAULT;
> +            g_list_free_full(perms, g_free);
> +            return false;
> +        }
> +        g_list_free_full(perms, g_free);
> +    }
> +
>       perms_list = g_list_append(perms_list,
>                                  xs_perm_as_string(XS_PERM_NONE, owner));
>       perms_list = g_list_append(perms_list,
> diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
> index e00983ec44..1df59b3c08 100644
> --- a/hw/xen/xen-operations.c
> +++ b/hw/xen/xen-operations.c
> @@ -300,6 +300,18 @@ static bool libxenstore_create(struct qemu_xs_handle *h, xs_transaction_t t,
>           return false;
>       }
>   
> +    if (owner == XS_PRESERVE_OWNER) {
> +        struct xs_permissions *tmp;
> +        unsigned int num;
> +
> +        tmp = xs_get_permissions(h->xsh, 0, path, &num);
> +        if (tmp == NULL) {
> +            return false;
> +        }
> +        perms_list[0].id = tmp[0].id;
> +        free(tmp);
> +    }
> +
>       return xs_set_permissions(h->xsh, t, path, perms_list,
>                                 ARRAY_SIZE(perms_list));
>   }
> diff --git a/include/hw/xen/xen_backend_ops.h b/include/hw/xen/xen_backend_ops.h
> index 90cca85f52..273e414559 100644
> --- a/include/hw/xen/xen_backend_ops.h
> +++ b/include/hw/xen/xen_backend_ops.h
> @@ -266,6 +266,8 @@ typedef uint32_t xs_transaction_t;
>   #define XS_PERM_READ  0x01
>   #define XS_PERM_WRITE 0x02
>   
> +#define XS_PRESERVE_OWNER        0xFFFE
> +
>   struct xenstore_backend_ops {
>       struct qemu_xs_handle *(*open)(void);
>       void (*close)(struct qemu_xs_handle *h);


