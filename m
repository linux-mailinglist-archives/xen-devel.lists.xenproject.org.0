Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F737F4DF0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 18:12:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638949.995963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qlU-0005Vc-J7; Wed, 22 Nov 2023 17:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638949.995963; Wed, 22 Nov 2023 17:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qlU-0005U0-GK; Wed, 22 Nov 2023 17:11:52 +0000
Received: by outflank-mailman (input) for mailman id 638949;
 Wed, 22 Nov 2023 17:11:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeb/=HD=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r5qlS-0005Tu-B5
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 17:11:50 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 390bee8d-895a-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 18:11:49 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40b2ad4953cso6541055e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 09:11:49 -0800 (PST)
Received: from [10.95.134.92] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b003fc0505be19sm44748wmq.37.2023.11.22.09.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 09:11:48 -0800 (PST)
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
X-Inumbo-ID: 390bee8d-895a-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700673109; x=1701277909; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wD1Osv68moY2wmNYERX6SE0aq7IXfRHUNiLz0dpPw9w=;
        b=gVuOsBd+LA2SLqEF3HAShijqCSdvJPtwVwjvRxvYkJgyrl3XEAGw5KvJlU486+h2rG
         8op6fMz28nUZgAAV2lORZh305Z1nMMm8wqdhP2O4KBfMGzQc4+Xwgjy9Hp9fkBPkDjSz
         /kPVxfQr8zAIaGcCSJiJ33WBGlOhdTguw9ZOs3ltXDJgVG/TH/YNYAQ8RIF+wklZhqKo
         k5InTmRC5FnU4kXkBAUbCxkc+O8mEqG/fT/AJnHUWsKJPsyq73hxCigPYxX12IayRs6E
         d1Kav+YTm43AQLecJm5Cdn3Q/4lCa9WJ7v2/+ixs+hrK2Hh9GcXrsMOS1DIY4m5ATk1X
         l2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700673109; x=1701277909;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wD1Osv68moY2wmNYERX6SE0aq7IXfRHUNiLz0dpPw9w=;
        b=Lq4jf3hy5e1WW6V0qsq/OxFn6/wr+8sC2H9sn/KaLy0q20ynTJKPyQWJIMFueCJmvH
         /BhDrgrR3FSjYZ3mwFcacrDJpUaLZzYDD9H96fMs66ZSgi9FPPM4WGhELvms1q5DQQTn
         QxLUuPT5qhDVUdyuhU4o7KSp/IMRNrZ1gdmu+jl+T7vxiepSO6HY5MbB8QcQoBw3cT+6
         L8gKqNY4NYTKKJ892UcJ5MQgk7tXJKpFC71PwdfhcQzIaI8Q/SprUn+8A9INgDxgprMA
         RH21wGax1Kds5niUKb6EE5C4qsresDIyBlKb78/Az4/1hD9fPiShx2EeVmsa91r+vmDp
         Gj7A==
X-Gm-Message-State: AOJu0Yw2Zmh9nUc7R+Z1eEZVkccg7gzAbo7QhxAoi7qnxcLVVFeW4TTa
	qca4teMAHOHB9+jD/MQ398M=
X-Google-Smtp-Source: AGHT+IHlFn1oy68B82kGrutJ1vBhDlOH4mto5RqdBz1ZBta1MhC8vRAp0CKHAUcgl2mg05DpKVubbA==
X-Received: by 2002:a05:600c:1c9f:b0:40b:2a08:c45e with SMTP id k31-20020a05600c1c9f00b0040b2a08c45emr104751wms.3.1700673108689;
        Wed, 22 Nov 2023 09:11:48 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org>
Date: Wed, 22 Nov 2023 17:11:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-5-volodymyr_babchuk@epam.com>
Organization: Xen Project
In-Reply-To: <20231121221023.419901-5-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2023 22:10, Volodymyr Babchuk wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Instead of forcing the owner to domid 0, use XS_PRESERVE_OWNER to
> inherit the owner of the directory.

Ah... so that's why the previous patch is there.

This is not the right way to fix it. The QEMU Xen support is *assuming* 
that QEMU is either running in, or emulating, dom0. In the emulation 
case this is probably fine, but the 'real Xen' case it should be using 
the correct domid for node creation. I guess this could either be 
supplied on the command line or discerned by reading the local domain 
'domid' node.

> 
> Note that for other than Dom0 domain (non toolstack domain) the
> "driver_domain" property should be set in domain config file for the
> toolstack to create required directories in advance.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   hw/xen/xen_pvdev.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
> index c5ad71e8dc..42bdd4f6c8 100644
> --- a/hw/xen/xen_pvdev.c
> +++ b/hw/xen/xen_pvdev.c
> @@ -60,7 +60,8 @@ void xen_config_cleanup(void)
>   
>   int xenstore_mkdir(char *path, int p)
>   {
> -    if (!qemu_xen_xs_create(xenstore, 0, 0, xen_domid, p, path)) {
> +    if (!qemu_xen_xs_create(xenstore, 0, XS_PRESERVE_OWNER,
> +                            xen_domid, p, path)) {
>           xen_pv_printf(NULL, 0, "xs_mkdir %s: failed\n", path);
>           return -1;
>       }


