Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A011F3901
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:08:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jic77-0002Xk-UO; Tue, 09 Jun 2020 11:08:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jic76-0002Xa-II
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:08:16 +0000
X-Inumbo-ID: 843c4c99-aa41-11ea-b307-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 843c4c99-aa41-11ea-b307-12813bfff9fa;
 Tue, 09 Jun 2020 11:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzIR+3VysZFR+NGFD1AmGomUUyfUE6amVvn/ew5M7nY=;
 b=OyHpAaQJdsGL8vfGCHtmjpueoLbhAJK2sr1+kK/qmR8exBExbEjBspXsgRjSYSLIGCKRzv
 8JcSlpEse1zqhRa28Qc43TYvUVRHWmIy+wm59j6iebdRutiB0BfK1AZT9VXK8cI5CvlV1x
 DsQhHEX+8evJFuqO9aKNehlc2vTn2UE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-Vjc0wUdtOwKepODSgrmW6g-1; Tue, 09 Jun 2020 07:08:14 -0400
X-MC-Unique: Vjc0wUdtOwKepODSgrmW6g-1
Received: by mail-wm1-f69.google.com with SMTP id c4so607326wmd.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nzIR+3VysZFR+NGFD1AmGomUUyfUE6amVvn/ew5M7nY=;
 b=DKphJ5RTo6NrnFV4rKiAziPF19gEa0AjeEr9gWGcO8w2+mcg2IT8i8ye5NXA65C5gv
 CgPJDtpVxJ2lSbdBI3/LXCC++yP19q5daddOnn9ofESaTCFh52V8350CLOo7nEzGMndD
 e+JwQZCozowT6klPFen31rghpnMybQf+PK2eLA5WEy1U64rDKpUKKHktXHGICW/QLj7E
 FdT+hPRnZykafXz3J6S3x2ncJGNUcQBWsedfS+gO+GyYCNhEKdIxpqyXEOR8ByDdLEJt
 OFH/LWeiI1fMlPR8A6dwBQ26RY2OswEKY5JvNf1/ZRDgvzHLJUcHMR4QPtwerH1k7hbp
 tRig==
X-Gm-Message-State: AOAM531vTwiHr1JqzHk2ooAKQLCYpePWVX8VYOCqgPckK15RoTZc3Hff
 8UsP6F4vwFGvgs741fSSC/TKdY0ZqDX3VaKr4A9iK+EnCnyAaBjhKvdgfa5UFp+RZ0BSLCvolAw
 yEJ2EKUEXahyORVwIz4JXvbpoft0=
X-Received: by 2002:a1c:7215:: with SMTP id n21mr3428435wmc.10.1591700893213; 
 Tue, 09 Jun 2020 04:08:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdC3784/XM7YgW9UJ09UlWBbxHKdjVmbxcRKY6OuIHXNLH2XpKSYf455WgqT5IWKVna7+8aw==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr3428413wmc.10.1591700892989; 
 Tue, 09 Jun 2020 04:08:12 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id r11sm3060354wre.25.2020.06.09.04.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:08:12 -0700 (PDT)
Subject: Re: [RFC PATCH 14/35] hw/i386/pc: Emit warning when old code is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-15-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <99a85bad-3197-6a74-5218-86f2326cd381@redhat.com>
Date: Tue, 9 Jun 2020 13:08:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-15-philmd@redhat.com>
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
>  hw/i386/pc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2128f3d6fe..c71809fd28 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -94,6 +94,7 @@
>  #include "vmport.h"
>  #include "fw_cfg.h"
>  #include "trace.h"
> +#include "hw/qdev-deprecated.h"
>  
>  GlobalProperty pc_compat_5_0[] = {};
>  const size_t pc_compat_5_0_len = G_N_ELEMENTS(pc_compat_5_0);
> @@ -348,6 +349,8 @@ GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
>  {
>      GSIState *s;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      s = g_new0(GSIState, 1);
>      if (kvm_ioapic_in_kernel()) {
>          kvm_pc_setup_irq_routing(pci_enabled);
> 

This one is okay, GSIState is just an array of qemu_irqs.

Paolo


