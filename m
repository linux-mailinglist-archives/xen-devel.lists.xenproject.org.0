Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B2F79A966
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 17:06:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599549.935018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfiUO-0003ot-Qf; Mon, 11 Sep 2023 15:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599549.935018; Mon, 11 Sep 2023 15:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfiUO-0003mE-NP; Mon, 11 Sep 2023 15:06:12 +0000
Received: by outflank-mailman (input) for mailman id 599549;
 Mon, 11 Sep 2023 15:06:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5ji=E3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qfiUN-0003m8-C4
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 15:06:11 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdba4fff-50b4-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 17:06:10 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31f915c3c42so1978176f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 08:06:10 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s1-20020a5d69c1000000b0031aef72a021sm10260907wrw.86.2023.09.11.08.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 08:06:09 -0700 (PDT)
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
X-Inumbo-ID: bdba4fff-50b4-11ee-8785-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694444770; x=1695049570; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I1wFqZ0vUhQ3Kw2y9Y4Xy6M8x6wwmZgiqaLjaUHvpUk=;
        b=DnbVFWMA7WWXQPR3AttzxTD1F5ffFe2X9JUFa/t74q4Zc+m41/IAGY8tXQni2tho2L
         euU/QQRMq0FdKD1wG7MxvKOYn+9gdlnp996t/bZA53Mjs6ECPmrSlJEc0DJAtFqf9tfX
         bS2QqjBMwckevVdETsNO3Ms6CN729b1fcCBBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694444770; x=1695049570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1wFqZ0vUhQ3Kw2y9Y4Xy6M8x6wwmZgiqaLjaUHvpUk=;
        b=PnqaqSV3884ZNdJquWytTTWtQoW+6a1ktFRK+r5coaBu0ymFEAqvow1K3HHXqPaIXJ
         +WdRAIj5ofobT+TTehVO6/7AS16GKyGd3KwDT7HNfhFSmIxHsD7/YP4+4fvn2fCBA0UK
         SiAzeS7WsskwRloIJrBAoCM1K1tdS9bvGEINKCLpeGeJoB1pTZzCZ9qBXGUFyEykrh08
         DKsIJxhGji88f/0x1fgR/21UuDqMIjnMNDWbwhIfGSV/JR7emJIgKX87v1Mh4TuIqXH1
         F6WFHcgPnvGxX+BGm5CE/OQCsBbX81yBNuVbT9hav6nMiXk1VD3PbXDlVc2TT/L01heJ
         nH/Q==
X-Gm-Message-State: AOJu0YzsWU7frc+4WOBi1+n/OFqoREIAAJVm9Wi+ch6pG0yx92DQxII3
	rqhZxbbEQndxSMrMeVki6SpmlQ==
X-Google-Smtp-Source: AGHT+IEmgAXs2aL7elMYfw6W9wTLP6J07I0er+xVJTkxxHHVUCnEuFlA97JWfQV7runl7zQa8dBs6A==
X-Received: by 2002:a5d:63c3:0:b0:31a:d266:3d62 with SMTP id c3-20020a5d63c3000000b0031ad2663d62mr7614224wrw.54.1694444769716;
        Mon, 11 Sep 2023 08:06:09 -0700 (PDT)
Date: Mon, 11 Sep 2023 16:06:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: devel@edk2.groups.io, Ard Biesheuvel <ardb+tianocore@kernel.org>,
	Jiewen Yao <jiewen.yao@intel.com>,
	Jordan Justen <jordan.l.justen@intel.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Julien Grall <julien@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] OvmfPkg/OvmfXen: Fix S3
Message-ID: <2811343a-555b-491a-8bcf-15b4bb218749@perard>
References: <c79e568e0d1c85bef9a2efc4c854de8f80ea1487.1689244868.git.xenia.ragiadakou@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c79e568e0d1c85bef9a2efc4c854de8f80ea1487.1689244868.git.xenia.ragiadakou@amd.com>

Hi Xenia,

On Thu, Jul 13, 2023 at 01:47:12PM +0300, Xenia Ragiadakou wrote:
> Currently, resuming an S3 suspended guest results in the following
> assertion failure:
> ASSERT MdePkg/Library/PeiResourcePublicationLib/PeiResourcePublicationLib.c(41): MemoryLength > 0
> This happens because some parts of the S3 suspend and resume paths
> are missing in order for S3 to work. For instance, the variables
> mS3AcpiReservedMemoryBase and mS3AcpiReservedMemoryBase are not
> initialized, regions that are used on S3 resume are either missing
> or not marked as ACPI NVS memory and can be corrupted by the OS.
> This patch adds the missing parts based heavily on the existing S3
> implementation of other virtual platforms.
> 
> For S3 support, the provision of fw_cfg is required in order for
> suspend states to be retrieved.

Is it possible to have S3 work without fw_cfg? We normally disable
fw_cfg in QEMU when using it to start a Xen guest. We only enable fw_cfg
if we want to boot a kernel directly in HVM (like PV guest, called
Direct Kernel Boot in xl.cfg(5)).

But even trying the direct kernel boot method, I've got issue trying to
resume a suspended guest. I ran into:
    ASSERT /root/build/ovmf/UefiCpuPkg/Library/MpInitLib/MpLib.c(2093): (LibPcdGet64(9U) & (0x00000001 | 0x00000002)) == (0x00000001 | 0x00000002)

By the way, I'm using `xl` to boot a guest to test this patch.

So, I've got some question, which version of QEMU do you use, which work
with this patch?
What toolstack do you use to boot a guest?


Thanks,

-- 
Anthony PERARD

