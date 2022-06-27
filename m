Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B661F55B8C4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 10:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356330.584490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5kUL-0002o8-5g; Mon, 27 Jun 2022 08:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356330.584490; Mon, 27 Jun 2022 08:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5kUL-0002l3-1c; Mon, 27 Jun 2022 08:52:57 +0000
Received: by outflank-mailman (input) for mailman id 356330;
 Mon, 27 Jun 2022 08:52:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+OT=XC=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1o5kUJ-0002dY-M5
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 08:52:55 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88e4cbc3-f5f6-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 10:52:55 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id e28so6819891wra.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jun 2022 01:52:55 -0700 (PDT)
Received: from [10.7.237.7] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a5d4bc1000000b00219e77e489fsm9633148wrt.17.2022.06.27.01.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 01:52:54 -0700 (PDT)
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
X-Inumbo-ID: 88e4cbc3-f5f6-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YxRvcSf7ptmHEAYJ6Lp/sYOIY/HDDd80u0zELz0O8Rg=;
        b=EVJcXnYxGeVieQhSeOobV7k1U5qEBLh66Tb+4iTzlm7+StkuQ+u3asnIz4U8fiBzTf
         0umbG5MBglrtNKmXjJP97eeuVS/uOVu1ksrs5Cs6uSw3dhB9pUmvQEH3qxEYzOIaNJo5
         fgXXHRZfwU6u3uFTMuvfU6w4mi5IU2cOLcCvSosPuveAEqnoVO6Nld+kYMUXbSuaD9/+
         Q9oSXSH6u8lte9NUpeMucqprHFlnngCCUIQzJY2+aE5oq6kglUm2DxJH8CrwEs7WlqMG
         18hLEMdEfg3z7+vHQqtvJlHsdJ1qcDG0MkqAt+kwDI0LRKkH5quMmB/jEwoDTt7h7uhv
         UQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YxRvcSf7ptmHEAYJ6Lp/sYOIY/HDDd80u0zELz0O8Rg=;
        b=0TgdJC7hDC5HP6OKqndKBsnTegtc924+fizD0e3SvQkuKicQo0JJWZBFEB8hgaaZiF
         NBV7QK6zVCI41fZncJo9CvqTrrb3FbhYiOv6DV4exZsAzP5w94GWvkoymuNyctFCrCAC
         D8KHiBL34/StYA3LbqJpH8xruh5ozulW4MFUj3K39WYDOo8+/WhpSWy0Or27KnLce54I
         4+VaphSiWB5T2iUqHsAc2BzNvpXgkIpUmsu4W5BG+jJoDW+6zk9o8AYN0Ne6p8UGndtJ
         SRgHvA7FodH4s6q2P9Uq448hjw5iH1OVcKMrW5dcAJwJ5VXJ8ETcAGZ15/urJ59ymne+
         WuNw==
X-Gm-Message-State: AJIora9eWaz0fvlfJwNO8Vs2gcUOf//a3un7WY9XYtC++RKRSxIzkxvO
	eD3kmfpHenf9buvVpcvlhE0=
X-Google-Smtp-Source: AGRyM1sakRCV4QFb6DvtU4gnXvhnzZNuVTvM9I0nKjKAn0cOFnvi2cXEqpaAGuHVniGGE9URjY6kog==
X-Received: by 2002:a5d:4589:0:b0:21b:8568:f38e with SMTP id p9-20020a5d4589000000b0021b8568f38emr11039593wrq.165.1656319974592;
        Mon, 27 Jun 2022 01:52:54 -0700 (PDT)
Message-ID: <c4dae18f-5337-ef74-ea9d-0d6f20c9b919@gmail.com>
Date: Mon, 27 Jun 2022 09:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Reply-To: paul@xen.org
Subject: Re: [PATCH 2/2] hw/i386/xen/xen-hvm: Inline
 xen_piix_pci_write_config_client() and remove it
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
 <20220626094656.15673-3-shentey@gmail.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220626094656.15673-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2022 10:46, Bernhard Beschow wrote:
> xen_piix_pci_write_config_client() is implemented in the xen sub tree and
> uses PIIX constants internally, thus creating a direct dependency on
> PIIX. Now that xen_set_pci_link_route() is stubbable, the logic of
> xen_piix_pci_write_config_client() can be moved to PIIX which resolves
> the dependency.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Paul Durrant <paul@xen.org>

