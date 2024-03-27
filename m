Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F04D688DCDA
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 12:50:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698471.1090163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRnW-0007W7-Ld; Wed, 27 Mar 2024 11:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698471.1090163; Wed, 27 Mar 2024 11:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRnW-0007UE-I4; Wed, 27 Mar 2024 11:50:26 +0000
Received: by outflank-mailman (input) for mailman id 698471;
 Wed, 27 Mar 2024 11:50:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lksO=LB=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rpRnV-0007U8-1J
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 11:50:25 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32189df3-ec30-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 12:50:23 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a47385a4379so143188866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 04:50:23 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u1-20020a1709063b8100b00a46fbff47a6sm5322360ejf.168.2024.03.27.04.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 04:50:22 -0700 (PDT)
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
X-Inumbo-ID: 32189df3-ec30-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711540223; x=1712145023; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4FC6f2CiQL5W1YZBJ6SK7a0UwL0NwwFJDhTY6Z9yEh8=;
        b=Cy8mPMBHNgZGtKq/fDoOgQdcVM5rrAA9vFrEePUze5qwkUh8zyytvlxiz9rPk57pAh
         JrEL0q3HCzVWbC6lj1xzPO+npyyJrYibJ14JnjVE+AI00H4XZlNfFFH/V9+yEKTivxXq
         44/S3gSuFtJnN10Po/e+C9tQqkW5814jtUCz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711540223; x=1712145023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4FC6f2CiQL5W1YZBJ6SK7a0UwL0NwwFJDhTY6Z9yEh8=;
        b=ABVCRIE0Iv+w6f9I75xQ4/5ULLxfGrKvtzoC732zRj/6hg5OTZqmdlwXk7Nw/kbtjl
         mGE1oN5GNq3HAHXai9ZnQ1f4cZtMyBUYTCY+V90VNm2I2gG/NxdZ9p1/B8TwM0EmRaE9
         qDnTk1Sorzj55ZRpfSCRghUmctxdnrgyn3u2nh5N23ftwiCsS/4fK5jX5lX3T34Q7+ij
         xelEf1LcJE3toUAZFT06keVgoLk5Qum/6Zo6fXY69gOjphgWnXsrWS58jU7JrLXbuHNQ
         q+NXpxTPqL6GrcfUiEzjbeWgsGrFu7Ioc1EX3yfBLdg/TmPUl9rKtHZYe6JIyapCcKXz
         7+ag==
X-Forwarded-Encrypted: i=1; AJvYcCWKngMPltAAVtyr0dxzqJ7t1SBwsOS1PIECUi0EhdRRTMAs+Lg8IORV/OHEFPvrzdkauOlMqQHocdl7Y+c/uQR7fi43ebapJe6RhVt59nI=
X-Gm-Message-State: AOJu0YxvLAWbW10d+KHpFtT6yqPV1gy0Z1fAOMyns0cXWKU9qh0CUspH
	tza6qUdBuK6DaAahzh/E0zbd8VduKHbZDSXTynDi40h1Lsryd1u3k81k3PI77rs=
X-Google-Smtp-Source: AGHT+IHjrlueyINri3BcwMN7nzklq3D6QJVA6wmS9ETMB5MPCffXe1tqgCTZZJIf53/O2Hw5bsVZmw==
X-Received: by 2002:a17:906:a890:b0:a47:134d:2fc8 with SMTP id ha16-20020a170906a89000b00a47134d2fc8mr3629567ejb.10.1711540223416;
        Wed, 27 Mar 2024 04:50:23 -0700 (PDT)
Date: Wed, 27 Mar 2024 11:50:21 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH-for-9.0 v2 05/19] hw/display: Restrict
 xen_register_framebuffer() call to Xen
Message-ID: <7e08a2d5-7d90-4d48-85e5-4c7e39d59c11@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-6-philmd@linaro.org>

On Tue, Nov 14, 2023 at 03:38:01PM +0100, Philippe Mathieu-Daudé wrote:
> Only call xen_register_framebuffer() when Xen is enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I don't think this patch is very useful but it's fine, so:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

