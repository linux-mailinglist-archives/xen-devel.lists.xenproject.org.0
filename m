Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6520830C60C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 17:39:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80655.147655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yhx-00026q-V2; Tue, 02 Feb 2021 16:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80655.147655; Tue, 02 Feb 2021 16:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yhx-00026R-S0; Tue, 02 Feb 2021 16:39:17 +0000
Received: by outflank-mailman (input) for mailman id 80655;
 Tue, 02 Feb 2021 16:39:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2iTi=HE=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1l6yhw-00026M-Aq
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 16:39:16 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 34753819-a19f-4505-9d2b-c72fed66008a;
 Tue, 02 Feb 2021 16:39:15 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-cpCsUiTMPzWIWHKI7sQoTA-1; Tue, 02 Feb 2021 11:39:13 -0500
Received: by mail-ed1-f69.google.com with SMTP id f21so9907421edx.23
 for <xen-devel@lists.xenproject.org>; Tue, 02 Feb 2021 08:39:12 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b1sm3313895eju.15.2021.02.02.08.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 08:39:10 -0800 (PST)
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
X-Inumbo-ID: 34753819-a19f-4505-9d2b-c72fed66008a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612283955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=upnt39CyCVwBoTycKyW7rsDh22PJi9fn/RtxLu9lyuM=;
	b=XJIj4CVuOXIbXba3uXtKtrnaOq+uQ44BWiothUsTonfEyZyMDOa0wyaJllX1KM1j0rebSs
	NlRe+86rO/kD88PQ7gQREl3DxCPnGaQ2Hj933Hz4irAPL7Mnhg2XCCDqasiOG6JkOTsAj6
	GbrJ964JhnmSXAV8qWOtJl8Gq46V168=
X-MC-Unique: cpCsUiTMPzWIWHKI7sQoTA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=upnt39CyCVwBoTycKyW7rsDh22PJi9fn/RtxLu9lyuM=;
        b=jNN54bI9P6cTotgnOZvga7m0i35xIGIYp511SIPc5vvGStWnNIYF34YQBnTNvarUBO
         bp2//dFPwO39xOW91JCNhbpmJELIYClZVM20aEhkTxGyVqsGgFz9Z5O76YcYwCVFGl00
         c5WS15URWWjMvgTC9PHba0ZFzH23/vluMKNu8wNmH6KednAR+8BXKkjr/zGc48Zwxxyc
         gPKUCdN9fIF+BY0QFSfzjEBj0kc9Xs966kEq8oLZhtVS0XO7oxhcBe+cX8WObczKqyF5
         He3adK+IIUKcl+/7RtFrG1grcufHCBmh5f2dQYFJtJgxmwsIllMGEdrbdQ1BkCdl91Te
         /bWQ==
X-Gm-Message-State: AOAM530jIDUUrVmRyBVK/sdfMQgHQ/T4idfy3Qi8QolOrFy9/en1DEn9
	nZJUFm+a5NRS+qoAQvgzwHPV+61aNAsynW88e8rXzlKpq5l5/Llw216OpIqSp1xpYM6/Bbpe6Gs
	lmQr9PzrRP3G6TMn/qHBAMUOQxzk=
X-Received: by 2002:a17:906:c049:: with SMTP id bm9mr22307617ejb.535.1612283951845;
        Tue, 02 Feb 2021 08:39:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2tklvRYuU9l0qDykZvY93YU17wJ9cDOV5rFXjVQAhMAYZL/Panns/oGzBvmoCNoRhjmIqiA==
X-Received: by 2002:a17:906:c049:: with SMTP id bm9mr22307596ejb.535.1612283951672;
        Tue, 02 Feb 2021 08:39:11 -0800 (PST)
Subject: Re: [PATCH] hw/i386/xen: Remove dead code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20210202155644.998812-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <13e06470-e13d-31ef-f7a7-9370a01d8b1c@redhat.com>
Date: Tue, 2 Feb 2021 17:39:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202155644.998812-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02/02/21 16:56, Philippe Mathieu-Daudé wrote:
> 'drivers_blacklisted' is never accessed, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/i386/xen/xen_platform.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 7c4db35debb..01ae1fb1618 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -60,7 +60,6 @@ struct PCIXenPlatformState {
>       MemoryRegion bar;
>       MemoryRegion mmio_bar;
>       uint8_t flags; /* used only for version_id == 2 */
> -    int drivers_blacklisted;
>       uint16_t driver_product_version;
>   
>       /* Log from guest drivers */
> @@ -245,18 +244,10 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
>   
>   static uint32_t platform_fixed_ioport_readw(void *opaque, uint32_t addr)
>   {
> -    PCIXenPlatformState *s = opaque;
> -
>       switch (addr) {
>       case 0:
> -        if (s->drivers_blacklisted) {
> -            /* The drivers will recognise this magic number and refuse
> -             * to do anything. */
> -            return 0xd249;
> -        } else {
> -            /* Magic value so that you can identify the interface. */
> -            return 0x49d2;
> -        }
> +        /* Magic value so that you can identify the interface. */
> +        return 0x49d2;
>       default:
>           return 0xffff;
>       }
> 

Cc: qemu-trivial@nongnu.org


