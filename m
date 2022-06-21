Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124C3552E96
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 11:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353117.580023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3aKs-000480-NN; Tue, 21 Jun 2022 09:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353117.580023; Tue, 21 Jun 2022 09:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3aKs-00046F-KF; Tue, 21 Jun 2022 09:38:14 +0000
Received: by outflank-mailman (input) for mailman id 353117;
 Tue, 21 Jun 2022 09:38:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uUKi=W4=gmail.com=mykyta.poturai@srs-se1.protection.inumbo.net>)
 id 1o3aKq-000468-Vq
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 09:38:13 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd8eaa8a-f145-11ec-bd2d-47488cf2e6aa;
 Tue, 21 Jun 2022 11:38:11 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id pk21so3108101ejb.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jun 2022 02:38:11 -0700 (PDT)
Received: from localhost.localdomain (93.75.52.3.lut.volia.net. [93.75.52.3])
 by smtp.gmail.com with ESMTPSA id
 kw10-20020a170907770a00b00722d8f902f2sm1620719ejc.33.2022.06.21.02.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:38:10 -0700 (PDT)
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
X-Inumbo-ID: dd8eaa8a-f145-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I/LeMdrvMGgzKYeanXHZKatWBJ9+aqT42HX6W2qSCpw=;
        b=jBpR63/3wpSzzE27pLIuuSBWQu/1J56e6KN6MNwxf54mQ1rCCxs/wgug3XNnZN2RJr
         7I5vR2dzXW4uR48+jot21JuT5c3JNu9pXvXi4Vk3596Fa0IhV6px8QL7bfSwDp8TWd2H
         Yw0UgUxx83ksbvcKv5SfAZBVf0uSWnxMVBDIOcQuUx9PjuD+AI9wOOmqQ/aGZhphT8l8
         wkNDENclj1yJ/e8XLM+r6HjOSdtzi/CckvrtcyipgK6WiFInGagupWQ2tyjqtTqzgaz0
         d30LqLTO9vb2qGtXjndVgyAMgmzqsXzNvJFmabDXwgJ6XGXZX+GK14JEL4FCdMP+jXOV
         JGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I/LeMdrvMGgzKYeanXHZKatWBJ9+aqT42HX6W2qSCpw=;
        b=2Bdb67B4yrtvL00D3gUDfzPizB2JFXX8UZd5+WrClEj4lydLUVpWL6lrPK4lnpUirf
         1NEBwEfaa8wvUGTdv9soSP1fhoPaMkv7GzPXgigP4IJNGxOPGadI6+Ew1Igbarlok11L
         wqFkbT4AAX6dCbGd0oILr43RYeuz+Uec9dBjF/o3oRXRkhg2Bpk8weV/HjwZKZSUoB8H
         EohPOyPZisTkOgch501XlKjG+ep9E5A/inSOio2liOlZo+/barkx+hADre8Ik19sucpn
         4Rcgt0LCGm3RPTDIDJzEDPPhdE91Ln7NqfIqQfFlur4RZohixe2GnMrHSl4VKx/cIbZb
         7yvQ==
X-Gm-Message-State: AJIora/vpoSl+CKtSvishdlTdh/gbGDj8HPjqYwW0OsvgUDTtH1B4Byi
	nbi50K57BpeDhXU8PwG/zLM=
X-Google-Smtp-Source: AGRyM1tLKPZU3wDVQzHat1EcARc3YFAm5QQeAx4sGkOS6fsGj1ehEKn6dI2CC1F/1jSJrKWASihqIA==
X-Received: by 2002:a17:907:971b:b0:711:dc09:fde1 with SMTP id jg27-20020a170907971b00b00711dc09fde1mr24627616ejc.749.1655804291075;
        Tue, 21 Jun 2022 02:38:11 -0700 (PDT)
From: Mykyta Poturai <mykyta.poturai@gmail.com>
X-Google-Original-From: Mykyta Poturai <mykyta_poturai@epam.com>
To: rahul.singh@arm.com
Cc: Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	julien@xen.org,
	mykyta.poturai@gmail.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a device
Date: Tue, 21 Jun 2022 12:38:08 +0300
Message-Id: <20220621093808.597929-1-mykyta_poturai@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <A53A2C83-BA19-481D-8851-0B0E1A162F4D@arm.com>
References: <A53A2C83-BA19-481D-8851-0B0E1A162F4D@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Thanks for testing the patch.
>> But not fixed the "Unexpected Global fault" that occasionally happens when destroying
>> the domain with an actively working GPU. Although, I am not sure if this issue
>> is relevant here.
>
> Can you please if possible share the more details and logs so that I can look if this issue is relevant here ?

So in my setup I have a board with IMX8 chip and 2 core Vivante GPU. GPU is split between domains.
One core goes to Dom0 and one to DomU.

Steps to trigger this issue:
1. Start DomU
2. Start wayland and glmark2-es2-wayland inside DomU
3. Destroy DomU

Sometimes it destroys fine but roughly 1 of 8 times I get logs like this:

root@dom0:~# xl dest DomU
[12725.412940] xenbr0: port 1(vif8.0) entered disabled state
[12725.671033] xenbr0: port 1(vif8.0) entered disabled state
[12725.689923] device vif8.0 left promiscuous mode
[12725.696736] xenbr0: port 1(vif8.0) entered disabled state
[12725.696989] audit: type=1700 audit(1616594240.068:39): dev=vif8.0 prom=0 old_prom=256 auid=4294967295 uid=0 gid=0 ses=4294967295
(XEN) smmu: /iommu@51400000: Unexpected global fault, this could be serious
(XEN) smmu: /iommu@51400000:    GFSR 0x00000001, GFSYNR0 0x00000004, GFSYNR1 0x00001055, GFSYNR2 0x00000000

My guess is that this happens because GPU continues to access memory when the context is already invalidated,
and therefore triggers the "Invalid context fault".

Regards,
Mykyta

