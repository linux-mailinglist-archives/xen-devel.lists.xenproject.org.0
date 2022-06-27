Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E821955B8C2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 10:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356327.584479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5kTv-0002LM-RP; Mon, 27 Jun 2022 08:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356327.584479; Mon, 27 Jun 2022 08:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5kTv-0002Hy-OT; Mon, 27 Jun 2022 08:52:31 +0000
Received: by outflank-mailman (input) for mailman id 356327;
 Mon, 27 Jun 2022 08:52:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+OT=XC=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1o5kTt-0002Hs-Bg
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 08:52:29 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 790b0ad2-f5f6-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 10:52:28 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 o16-20020a05600c379000b003a02eaea815so4499343wmr.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jun 2022 01:52:28 -0700 (PDT)
Received: from [10.7.237.7] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 h13-20020adff4cd000000b002103aebe8absm9720868wrp.93.2022.06.27.01.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 01:52:27 -0700 (PDT)
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
X-Inumbo-ID: 790b0ad2-f5f6-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zD66L3mdITq6+N0oV3/QTMI5HSL0Xxy8B+3UI/gTIVM=;
        b=TUSft++HYTitNFoJnWHbmDqufQ4HfFly1XJ4egP6cXvI5z266MLmIl7Ce3bMsU2YMs
         fNcDKlR8JNXt6e+Utbq3VP1DIH+/QT5/SXiBygQRX/wJNourEWlo11KETbNEUk+fQRgG
         fuxJyCkABCAZF04NPfC/cH8urAZj9MCmXLfFobyuncMGq5Ji1wU6gnEjN8YJ2/FhOqdB
         yvWsnyuhH/tY4wPTDyResr7nm3TtptsknA092VQf5QudMjpDP9zxEEuhEy4gRz3dnWmF
         GSTXZfrmujZ38tCF7ScXpFfRoV+e1menEOotT7PheEkKOsjelG44c+Sko/TRCZn8BNTN
         CJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zD66L3mdITq6+N0oV3/QTMI5HSL0Xxy8B+3UI/gTIVM=;
        b=E4sLbvimD37Ioq6dhFsVWMCgxp9HEbapplOneEsfrLxrkAj9BNEiMoyoNe/zdzrjUM
         Dn3pGaxmMlQ1lu85Ey/cL9QVc9cnLI/joa/oDJzer9WuUiic8FLTmVGRkIwNaVpWrNu/
         Wo4qdakakkyCzffEbA/CXn3+95SVhccdO/c+UnJRxJ+U3Y0XISXjDlFjkmf2Ja8ii+WE
         2UN/7MppONYo6QyOv3FLnij6CNgBNWLqY8hpDmCrugtGD4lxwdBpm3Wt7yNmA1Kp5hfi
         2wo3ler4OzFgOIL6UpuCpoAjIqa868x/xIKLN6/+QBDK9qKq4KQh8CnkNb+91VnJw21D
         trcQ==
X-Gm-Message-State: AJIora+iwPQNrdkHZGf/XtOUV+mmyKHo3+CBCNrpmMLaiQz367mMamwZ
	lQjdywAUouLUri0FZcYSkBw=
X-Google-Smtp-Source: AGRyM1ue2+04Ox+iCpYrG9OKwUuld6DMVA7PofR/8yOuTsxVhCP+SVqFxzUGM+CPo+6IY4qnNykyJg==
X-Received: by 2002:a05:600c:35ce:b0:39c:7dc2:aec0 with SMTP id r14-20020a05600c35ce00b0039c7dc2aec0mr14143744wmq.33.1656319947966;
        Mon, 27 Jun 2022 01:52:27 -0700 (PDT)
Message-ID: <0044de2b-d25e-ba76-64e1-46316e786fb4@gmail.com>
Date: Mon, 27 Jun 2022 09:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Reply-To: paul@xen.org
Subject: Re: [PATCH 1/2] hw/i386/xen/xen-hvm: Allow for stubbing
 xen_set_pci_link_route()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20220626094656.15673-1-shentey@gmail.com>
 <20220626094656.15673-2-shentey@gmail.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220626094656.15673-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2022 10:46, Bernhard Beschow wrote:
> The only user of xen_set_pci_link_route() is
> xen_piix_pci_write_config_client() which implements PIIX-specific logic in
> the xen namespace. This makes xen-hvm depend on PIIX which could be
> avoided if xen_piix_pci_write_config_client() was implemented in PIIX. In
> order to do this, xen_set_pci_link_route() needs to be stubbable which
> this patch addresses.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Paul Durrant <paul@xen.org>

