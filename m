Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E046AE381
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507491.781062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYlU-0006HE-QU; Tue, 07 Mar 2023 14:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507491.781062; Tue, 07 Mar 2023 14:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYlU-0006FG-NZ; Tue, 07 Mar 2023 14:58:08 +0000
Received: by outflank-mailman (input) for mailman id 507491;
 Tue, 07 Mar 2023 14:58:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZYlT-0006FA-1s
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:58:07 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77766082-bcf8-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 15:58:06 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id r18so12424845wrx.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 06:58:06 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a5d67d0000000b002c758fe9689sm12716892wrw.52.2023.03.07.06.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:58:05 -0800 (PST)
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
X-Inumbo-ID: 77766082-bcf8-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678201086;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EK/FfNQ9hSqSrJdeG4O9BtBV3bH00pWSvIH5yTiLYo=;
        b=kDk0p3cXqIXD89W5Q2xV+/3i5fgaoiGpWWPOK6yfG5eJlY1TVLDvYcET5PBxeZ3Izk
         YYnrisgj98WxhkjKCeD3qH9AnyqQx5wBS1gPR5SKhEbXIAqYGHCgp8uN/KaYEL2y5PFN
         DYxKJO7S/+d/fEoeVgItedNhgF2H/4Eq0PU3s6dEy8D5Ac1KHdBtlQG3zlwoUf/aU0xr
         5AF+KId1SREYXmzvhkmxmL3Yn/KRC5oCt4EL+83rIMg3drtVwn6vIYA1Rs74PYnVMl3w
         ZTb5lHjSYY81wY52o3KsjP11aED9isw2xPcDujXpxGvDOzW9D2/z7Dp9rcY/V6aV8I0m
         8uKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678201086;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EK/FfNQ9hSqSrJdeG4O9BtBV3bH00pWSvIH5yTiLYo=;
        b=iXriZc1msCoae760u1SW2DLTPHZxdl8tbquxKuE87DqKkyUCTy+2A3sTKyGv9PNy1A
         n/1m+cRRsUuB5pusyYQzRi0aXXBuvqkW8sCQbKGb9GPfgGOuAX5mZMUnRVojOEu/V94R
         Eu4PByLLiOCvhdiU/U74/PDZMv/VMwV9G9VS0FCbYNq9zoXGBZdZNU9Ng9osPlnimpFj
         EoJ1loktZuvD3AOZ4lTtC2Au2VLatckmObiX9y8LbzV1s/V5AIgruUysbGnaWVb9VbGi
         Y2rctQTX8m0mSGnUcB7vYAbU9idJieqADo+5OtUQ+rxlgNzNP3ow3OrAqWNNJBqSigzo
         ojXA==
X-Gm-Message-State: AO0yUKXd6AAKxtgvVqBp2Rnd7wWch2lFI+quPNcQhS3SpUSjHy5UTGjJ
	Yx98OeGIvJzWVChA4Pz37PQ=
X-Google-Smtp-Source: AK7set8qc5MLxUC2qp0SHGgbx9XNWBuLmuOg/Y1NGgjFB32DXHGaB+6VhuUilKhRhyJRAH7lxnStYg==
X-Received: by 2002:a5d:6e42:0:b0:2c5:4c9d:2dab with SMTP id j2-20020a5d6e42000000b002c54c9d2dabmr11004782wrz.10.1678201085713;
        Tue, 07 Mar 2023 06:58:05 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2d59aa7e-16f6-bd47-ef6f-dfd227518406@xen.org>
Date: Tue, 7 Mar 2023 14:58:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 16/25] hw/xen: Rename xen_common.h to xen_native.h
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-17-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-17-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This header is now only for native Xen code, not PV backends that may be
> used in Xen emulation. Since the toolstack libraries may depend on the
> specific version of Xen headers that they pull in (and will set the
> __XEN_TOOLS__ macro to enable internal definitions that they depend on),
> the rule is that xen_native.h (and thus the toolstack library headers)
> must be included *before* any of the headers in include/hw/xen/interface.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/xen/xen-all.c                           |  1 +
>   hw/9pfs/xen-9p-backend.c                      |  1 +
>   hw/block/dataplane/xen-block.c                |  3 ++-
>   hw/block/xen-block.c                          |  1 -
>   hw/i386/pc_piix.c                             |  4 ++--
>   hw/i386/xen/xen-hvm.c                         | 11 +++++-----
>   hw/i386/xen/xen-mapcache.c                    |  2 +-
>   hw/i386/xen/xen_platform.c                    |  7 +++---
>   hw/xen/trace-events                           |  2 +-
>   hw/xen/xen-operations.c                       |  2 +-
>   hw/xen/xen_pt.c                               |  2 +-
>   hw/xen/xen_pt.h                               |  2 +-
>   hw/xen/xen_pt_config_init.c                   |  2 +-
>   hw/xen/xen_pt_msi.c                           |  4 ++--
>   include/hw/xen/xen.h                          | 22 ++++++++++++-------
>   include/hw/xen/{xen_common.h => xen_native.h} | 10 ++++++---
>   include/hw/xen/xen_pvdev.h                    |  3 ++-
>   17 files changed, 47 insertions(+), 32 deletions(-)
>   rename include/hw/xen/{xen_common.h => xen_native.h} (98%)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


