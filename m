Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7F998F4D1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 19:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809662.1222100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swPIK-0006Zh-NS; Thu, 03 Oct 2024 17:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809662.1222100; Thu, 03 Oct 2024 17:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swPIK-0006YA-Kl; Thu, 03 Oct 2024 17:07:16 +0000
Received: by outflank-mailman (input) for mailman id 809662;
 Thu, 03 Oct 2024 17:07:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muWb=Q7=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1swPIJ-0006US-5h
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:07:15 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeeb6089-81a9-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 19:07:13 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so12952941fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:07:13 -0700 (PDT)
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
X-Inumbo-ID: eeeb6089-81a9-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727975232; x=1728580032; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ypgCN7X3Tp1ClBP+wNOOozvav5VEYC8sq6Nl8zmhF9Y=;
        b=xQ1fUlAgjQ/1ImY4p/x0EryzFXT7c1NeGhp+EGK2kdeYrma07NJ+zuLS7E0ehZw6xq
         38IxvSnKoGyPIf/V1gZC1lSvbedqAQcK49vZ+bZ5ySh41Tr1lKFjxJeEi6tQ5ySKlYhm
         0Z4z5P2JsB84fQx1XfhAxbcXR3L7Mb2X/uln7BA5wCtRr/Npv5eQLKX+d1+Of9No2tAb
         DklLq/TQRmt9Ujj83x0Z0xXahcuMKm3A81GqcELS8eLMlgQ9x+OH51uCteSVfkjuSNC/
         qKgrWonDWwjO84+AAzLZaYhn9ejLas/NFazADtKvWPQnUC/cNJaJpOIUgHHhgz71NTlJ
         vc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727975232; x=1728580032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypgCN7X3Tp1ClBP+wNOOozvav5VEYC8sq6Nl8zmhF9Y=;
        b=msO0oFtHqa93V9VHN0p51rG3+FW9yGFi/b63/AYW8oHQ82ek6H9lJNIeWrA961DODh
         i2DB5yFetqGzyMiD4BrA8BZyQu0ud7JESbQ8ZZxkm6tJaHp+4e8on3KHcUnolL8RvJN6
         vXZTFaCaO/Hy0oPTylreMv6uo4M7T5CRLP9/uxv4R0aYDUmLXzVm65ZzIBzUbHy88pFj
         st3KJPObtY5D0cTNRfcwZP7ENvZxcnjV6LmI9ePBvXgN7MI4bI6N2vqZ9uYPfLmxlIFf
         NALkiy65ATgXICIezdyjX4AJ0dV6y1ZKNJZZb/nOdJTl4xUCUCRNY/Jcd1HBXo5GbdI/
         R7bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN2zYa8mWnJGBOzuzaZC0yajqR5dhJiGuM5Wc3APIGxxV0Hg/DVFxT/YyQPmz8JeC2uaz5wsoEcwE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOiejQmdF/Jil5j/MuUC9cYL5ILpIwSok7QqgN7/Jja3zWfthU
	bBgaN3YOZdGPJLWuyqWs609/c8F37W5K3/phUllbVbe5sqyzwYq1ARK1nFzBJ6AJCnMxwUiTsKl
	vnVchUm9d4xSaKNjb67l8UUkpkUfjpa0OmADZkA==
X-Google-Smtp-Source: AGHT+IEjaRr1MVAuuZhPyS6nHjR7OmrTiZ3hOaG5K16qWrzZDv7Ce52sQ7+eSCIr3FBf8S0Ed2Ky22MwxS6vYEwm5ug=
X-Received: by 2002:a2e:a983:0:b0:2f4:3de7:ac4c with SMTP id
 38308e7fff4ca-2fae1023128mr47777331fa.8.1727975232264; Thu, 03 Oct 2024
 10:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
In-Reply-To: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Oct 2024 18:07:00 +0100
Message-ID: <CAFEAcA9tST+-mZTcdBtwVOeVmxnBDrO=VJBMj=C0iFw5GAojLw@mail.gmail.com>
Subject: Re: [PULL v1 0/5] Xen Queue
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
	paul@xen.org, edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Oct 2024 at 15:31, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> The following changes since commit 423be09ab9492735924e73a2d36069784441ebc6:
>
>   Merge tag 'warn-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2024-10-03 10:32:54 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/edgar.iglesias/qemu.git tags/edgar/xen-queue-2024-10-03.for-upstream
>
> for you to fetch changes up to 507118c2a066b70e8069702c120461ad8c98ccd5:
>
>   hw/arm: xenpvh: Enable PCI for ARM PVH (2024-10-03 15:24:42 +0200)
>
> ----------------------------------------------------------------
> Edgars Xen Queue.
>
> ----------------------------------------------------------------
> Dr. David Alan Gilbert (1):
>       hw/xen: Remove deadcode
>
> Edgar E. Iglesias (4):
>       hw/xen: Expose handle_bufioreq in xen_register_ioreq
>       hw/xen: xenpvh: Disable buffered IOREQs for ARM
>       hw/xen: xenpvh: Add pci-intx-irq-base property
>       hw/arm: xenpvh: Enable PCI for ARM PVH

Hi; this failed the tsan-build CI job:

https://gitlab.com/qemu-project/qemu/-/jobs/7986783747

../hw/xen/xen-hvm-common.c:711:48: error: variable 'ioreq_pfn' is
uninitialized when used here [-Werror,-Wuninitialized]
trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
                                       ^~~~~~~~~
../hw/xen/xen-hvm-common.c:667:24: note: initialize the variable
'ioreq_pfn' to silence this warning
xen_pfn_t ioreq_pfn;
                   ^
                   = 0


thanks
-- PMM

