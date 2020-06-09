Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C61F3922
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:11:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jic9v-0003aY-Oy; Tue, 09 Jun 2020 11:11:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jic9u-0003aD-Bz
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:11:10 +0000
X-Inumbo-ID: eba243f6-aa41-11ea-bb8b-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id eba243f6-aa41-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 11:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gC6WEmr69REgLn2lsRvv9NiGoR/bD5T6HVmJ4ITPF7o=;
 b=MKUqEEYxr+tXS/WnVImsNVkESZCN52rzgnGVVqCOo47TU9mBwPU7xgPtfJqSU2yicTt/c0
 kqm3UXwsk6R1nlldv+2Yuc8xZHoR2WQvCO8yBXP2Xfa60juhVkINNCJTJM+V+9qUIcS1bM
 ejboYQ2UZdp6GUZ9WV8DPfS1HSPgFR8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-6MuKb7McOoqNWT9cb6qmdQ-1; Tue, 09 Jun 2020 07:11:07 -0400
X-MC-Unique: 6MuKb7McOoqNWT9cb6qmdQ-1
Received: by mail-wr1-f72.google.com with SMTP id h6so8531339wrx.4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gC6WEmr69REgLn2lsRvv9NiGoR/bD5T6HVmJ4ITPF7o=;
 b=pS+EKW5D/HmT4rMBx+JPap0FbXZ+BcNkIqjnie/B9RMx2PzBDgdKA27T+bAy2CIGcI
 32PNwHlSZQQQj+bZjEDj5eleXlQMu75FUwxym500jjiVvqAcgmNM82NWBlv/FKTbR77h
 qiGZaTzJ4OwcOaikU3reeDebJWwNsjHIn5ntjqaskCjFrvAD5hSjj/f6V8J4F8r4MR12
 jtDVlERx8ylXI15cllHXLfn12kxFy+lAAZZR7Xe1ZgXObbv9hkSb7rHUTuDAp6ikx6ct
 vOi2/hYYnGWZcAZdkjPfkqYrzZsKvjPAuRj5wkJtq52xPwjTq0g8RJGV2ylsLgepoQ5M
 tvkg==
X-Gm-Message-State: AOAM533bTs7/gDaugS7o3idVJ599Zgj9TLk6zb9RmVROdMgm7OTDPlRf
 lvPuA3VwI1YjDO/xE6dC2vrJu/5TXk/e2HIkE6qalw2Vm9DvLu53HF0N23nZ4K+h5a0BfYQKe3Z
 /L91+WI+T9kpDxrl2bLt+19GOb6A=
X-Received: by 2002:a5d:628c:: with SMTP id k12mr3812471wru.211.1591701066333; 
 Tue, 09 Jun 2020 04:11:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY3Up1ym4TzRU1NS9l49R/XWUODvDMW5M2cEwgU3BofYT4BEs0ckiayOWBTvyLMfPr7vv94w==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr3812427wru.211.1591701066086; 
 Tue, 09 Jun 2020 04:11:06 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id r12sm3176227wrc.22.2020.06.09.04.11.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:11:05 -0700 (PDT)
Subject: Re: [RFC PATCH 21/35] hw/lm32/lm32_hwsetup: Emit warning when old
 code is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-22-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3e036ca7-753b-55fb-3a19-7d50f5b6fd19@redhat.com>
Date: Tue, 9 Jun 2020 13:11:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-22-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/lm32/lm32_hwsetup.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/lm32/lm32_hwsetup.h b/hw/lm32/lm32_hwsetup.h
> index de94de177a..f4a4d8fe4b 100644
> --- a/hw/lm32/lm32_hwsetup.h
> +++ b/hw/lm32/lm32_hwsetup.h
> @@ -27,6 +27,7 @@
>  
>  #include "qemu/cutils.h"
>  #include "hw/loader.h"
> +#include "hw/qdev-deprecated.h"
>  
>  typedef struct {
>      void *data;
> @@ -57,6 +58,8 @@ static inline HWSetup *hwsetup_init(void)
>  {
>      HWSetup *hw;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      hw = g_malloc(sizeof(HWSetup));
>      hw->data = g_malloc0(TARGET_PAGE_SIZE);
>      hw->ptr = hw->data;
> 

This one is okay.

Paolo


