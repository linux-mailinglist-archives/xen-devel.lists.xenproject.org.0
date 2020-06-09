Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EB91F3934
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:13:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jicBf-0003wP-Oe; Tue, 09 Jun 2020 11:12:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jicBe-0003wF-QD
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:12:58 +0000
X-Inumbo-ID: 2cc26ee2-aa42-11ea-b30b-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2cc26ee2-aa42-11ea-b30b-12813bfff9fa;
 Tue, 09 Jun 2020 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dy54HX3yjH25i0N8iq/ISO1rX+f/prrBggOwYYHoeGM=;
 b=PHJe75H4dCzz4x3hKaQ7xz17pPv4BxaTaDKpik7d/80S93P8SU7+97Rbz+nYte2uiZco60
 fJYMLk5ArwB6oyIcybV1sJ3YNCFUEIUu2yPP3iIdgJ3h+aSLM3H5SFvAAbDj2xdIChJGHS
 4z9wLbyEDx+N/TWYESDb0woMcbQTuC0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-JEOFzc9ZMvKlqEs4UYo5-Q-1; Tue, 09 Jun 2020 07:12:52 -0400
X-MC-Unique: JEOFzc9ZMvKlqEs4UYo5-Q-1
Received: by mail-wm1-f69.google.com with SMTP id c4so610307wmd.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dy54HX3yjH25i0N8iq/ISO1rX+f/prrBggOwYYHoeGM=;
 b=WUZ093wZlTDkEgY4UfZn4IvAWe+jt/ARe3qK06FAMGhN9XLZRqb/kruglu7BSgoa0I
 IZB4JYGFYJeqTyFvHRKebILbgLc4AL2+sYJq+FnqX6nDCGoj0wdJ5UgtiiW0FUvFP+Z+
 OrY015seZK+uNJTyK3RKPtw5KdK6pK1qWsHLLmXKcBZjqASXCAZ6h5APIByu0vlvSxha
 kh5FQ1TOs/cFbkTgZONRbrgKb259dglUZVXjXbT5mzPHyuBK8GqpgaGylxxBVtQ6kpw2
 Jf1nJUNwOrGetud6OkKuCDcnmneBRxfat0UCDS9F33Xy9jA+6KRyHZlumzlUoZb5MKy0
 Hp7w==
X-Gm-Message-State: AOAM531wCZJ2mZT+YvfLo8o8wtfzMH6CGE70h5HYBy6ragHGFOI7FrxF
 SquP9LF6jNu/+A+i3yMkRcNOlWmTfC7Ta5LO5W+gnHhpdJG3aLn9Dqa+BiGXMQGfef2/EwAWX/P
 z68vKYRDyhCMg8XjZH1Vd7A9GfSQ=
X-Received: by 2002:a5d:6944:: with SMTP id r4mr3767000wrw.169.1591701170930; 
 Tue, 09 Jun 2020 04:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1H01HZsnF0pwx9oeoL9yjnBGXgYxEXfgTncokwamlfkzpTt0NHDCpjwEqldpHwJp0uf5vaQ==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr3766967wrw.169.1591701170664; 
 Tue, 09 Jun 2020 04:12:50 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id u130sm2588369wmg.32.2020.06.09.04.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:12:50 -0700 (PDT)
Subject: Re: [RFC PATCH 27/35] hw/ppc/ppc: Emit warning when old code is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-28-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <135e04f9-a2f4-b4d4-6689-83ae1f36d81c@redhat.com>
Date: Tue, 9 Jun 2020 13:12:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-28-philmd@redhat.com>
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
>  hw/ppc/ppc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 4a11fb1640..39fcf746c5 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -37,6 +37,7 @@
>  #include "kvm_ppc.h"
>  #include "migration/vmstate.h"
>  #include "trace.h"
> +#include "hw/qdev-deprecated.h"
>  
>  //#define PPC_DEBUG_IRQ
>  //#define PPC_DEBUG_TB
> @@ -1114,6 +1115,8 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
>      PowerPCCPU *cpu = env_archcpu(env);
>      ppc_tb_t *tb_env;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      tb_env = g_malloc0(sizeof(ppc_tb_t));
>      env->tb_env = tb_env;
>      tb_env->flags = PPC_DECR_UNDERFLOW_TRIGGERED;
> 

This one is okay.

Paolo


