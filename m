Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4A9874E67
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 12:57:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689810.1075136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCNP-0003Mh-JF; Thu, 07 Mar 2024 11:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689810.1075136; Thu, 07 Mar 2024 11:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCNP-0003Ko-GV; Thu, 07 Mar 2024 11:57:31 +0000
Received: by outflank-mailman (input) for mailman id 689810;
 Thu, 07 Mar 2024 11:57:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPn=KN=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1riCNN-0003Ki-Ha
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 11:57:29 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de3d06bb-dc79-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 12:57:27 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33e383546c1so414375f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 03:57:27 -0800 (PST)
Received: from meli.delivery (adsl-101.37.6.0.tellas.gr. [37.6.0.101])
 by smtp.gmail.com with ESMTPSA id
 ck4-20020a5d5e84000000b0033e2b9f647asm14506048wrb.31.2024.03.07.03.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 03:57:26 -0800 (PST)
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
X-Inumbo-ID: de3d06bb-dc79-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812647; x=1710417447; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=57A09yidrpDPUR1r7F8CHS4CvBdl9GurP/NjYKl3Cg4=;
        b=eke7JxnznCc0A/kZKQdl5wxi1VxhfDQJdWJ2ilw3NL3MdP6Pc2tdcOriBRKL8LpiX3
         PXjS3mwH5S2nqc+rc2GV5IwfTBbAi3MdEhva/Sj+vZiwId7E3v18KyCDhGiehZdfK/GM
         wcvjaLyq7dUddhaDM36qerigS0xXo37HjASeX1xFTzuJPZnTSjHBCMCPXn7G9Kenr9lI
         oDjFgXXfvyhbs0AGqqIh7Uu+BtBrxafPD7JrZ6sju6kqFmmg8EZWRjGvdVMj2fKOtvd2
         4famhP7Qh9qRHkah5/DopySo0bnywT85AXBYGnThHpzqlacNyJp2PZ9gENW9ARpVo7XN
         /rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812647; x=1710417447;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=57A09yidrpDPUR1r7F8CHS4CvBdl9GurP/NjYKl3Cg4=;
        b=UMOSgVtRK8q5L+n7SkRs1+cam7fIk5XpYUDW6x4cVJzrguXYJprR8yL3tn4KKQUclM
         7ck7IgyfV6YNtqlJr2d5B+brPvqhYzncYYnho9Xhp69MLNbOjORzNSqQoVjtpqc83NbB
         9TSosDIJhltHFb5PjO3Ely8V7JJUqw2EqjJW5COQY0LXSVBAPuKSgCwnPnvttSp+RsU3
         hJInLDnOX76u8T0vNDLrO57u3ViOd3vTcXDVu+i6yii6z8hwiwup2P+FiUm17XtX5NXr
         7KlQJqDsOBM3J8QwF+KKSzBcBAazrQHwv/GDHo7aZSDDst2+adn+MUXSGgbXHgd9gIaC
         AIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHw9Morm6qkLjNTgzG3MKnqctzsPQvIKAItdYLCKdPqOEY+rFoV+fWnyWr5n/Xs3Eq0kV3/LvPqWB2SnAo94nwk48v5/RV4XpRE3MyD2Y=
X-Gm-Message-State: AOJu0Yza3Y79eERDHtskgiWQuZgpINTWKWIdrglSXxQIPuZVkGudI8X+
	/YgNjNFKclkY0x9HzonbGhniyWdVCnY7Sc/OpU8OaC9f9wyEzFnEsKfNDnWIYDw=
X-Google-Smtp-Source: AGHT+IESCFwpHQmPxOg130/0yHnqMR5/u93SMsub5nGrOR8b42+ayiblaPN9pioxp+dZdBxzB/xsng==
X-Received: by 2002:a5d:6e90:0:b0:33e:d27:4f8c with SMTP id k16-20020a5d6e90000000b0033e0d274f8cmr12927971wrz.6.1709812647026;
        Thu, 07 Mar 2024 03:57:27 -0800 (PST)
Date: Thu, 07 Mar 2024 13:55:56 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH-for-9.0 5/9] hw/xen/hvm: Expose xen_read_physmap() prototype
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-6-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-6-philmd@linaro.org>
Message-ID: <9z7vo.cvkkbfxdigjz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>In a pair of commit we are going to call xen_read_physmap()
>out of hw/i386/xen/xen-hvm.c.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> include/hw/xen/xen-hvm-common.h | 1 +
> hw/i386/xen/xen-hvm.c           | 4 ++--
> 2 files changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
>index 0fed15ed04..536712dc83 100644
>--- a/include/hw/xen/xen-hvm-common.h
>+++ b/include/hw/xen/xen-hvm-common.h
>@@ -97,6 +97,7 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
> 
> void cpu_ioreq_pio(ioreq_t *req);
> 
>+void xen_read_physmap(XenIOState *state);
> void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> void xen_arch_set_memory(XenIOState *state,
>                          MemoryRegionSection *section,
>diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>index a65a96f0de..789779d02c 100644
>--- a/hw/i386/xen/xen-hvm.c
>+++ b/hw/i386/xen/xen-hvm.c
>@@ -525,7 +525,7 @@ static void handle_vmport_ioreq(XenIOState *state, ioreq_t *req)
> }
> 
> #ifdef XEN_COMPAT_PHYSMAP
>-static void xen_read_physmap(XenIOState *state)
>+void xen_read_physmap(XenIOState *state)
> {
>     XenPhysmap *physmap = NULL;
>     unsigned int len, num, i;
>@@ -573,7 +573,7 @@ static void xen_read_physmap(XenIOState *state)
>     free(entries);
> }
> #else
>-static void xen_read_physmap(XenIOState *state)
>+void xen_read_physmap(XenIOState *state)
> {
> }
> #endif
>-- 
>2.41.0
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

