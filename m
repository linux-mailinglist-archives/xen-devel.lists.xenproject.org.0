Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BAE5BDBD5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 06:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409124.652031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaVFk-00027f-Gh; Tue, 20 Sep 2022 04:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409124.652031; Tue, 20 Sep 2022 04:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaVFk-000257-Di; Tue, 20 Sep 2022 04:53:00 +0000
Received: by outflank-mailman (input) for mailman id 409124;
 Tue, 20 Sep 2022 04:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9R7n=ZX=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1oaVFj-000251-DP
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 04:52:59 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18e11a88-38a0-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 06:52:58 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id n10so2264155wrw.12
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 21:52:58 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a05600c348100b003b477532e66sm1328087wmq.2.2022.09.19.21.52.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 21:52:56 -0700 (PDT)
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
X-Inumbo-ID: 18e11a88-38a0-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=yXWBrA+VdOJ2eLhZR3jbWLCq6szWmV0B8FUoTOgqB0Y=;
        b=aJV1CFqMLGvYtz55pBXOVpWmVSQoYNCnNBeTgMiTAsRFuzH5R6W2APpLLxvjT8WmD4
         +Aq7iwdNNrStFOY9aOqRysX4Fi1hb2Ai05q9KoqfdPoBoG8CctBSGiXnl5/iVsdJ+gtv
         G1xO0rGV43OaEcuEgmtP7LmuG+YfSqRa24lK6FNEcUouwvSx2/shKBcNCI2GLEjS+cs3
         iopHzNjcN5/YTwRaIMxWArxIjRTpTenXmoMfOgDIkxoUoUYf8tucr0luciR3FCLpBLPl
         nYQ3yr3DJaimwbslpab29lcOYdhw+Pw4taR5Nq2MUO+stSchiopNm0u210j4zdGi4ZvP
         JV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=yXWBrA+VdOJ2eLhZR3jbWLCq6szWmV0B8FUoTOgqB0Y=;
        b=StTFxszMveJPro+C9uwxxNoaaDRAs4OlKpVNlAoT2C/PgPbZAGYRyGoqKh15w+RVIm
         MF8LhuB7Qiq2Z+y7lfCDSoSMe05g+s7AyszMZgmSuY/bVsFWULpwYg3lke7rwctN03+V
         Fu/TsRwv4+fVwzs1fIn1BpL3CfDln2tv3jDgoyE7xgdVMZDTQjCnevm3SEK272UVVTTO
         hsPCeZd5Y+C05OT/F8jVY5dsRE3b7bU6aSiCtwNcxVuH4VriF59s05Dm8RHW3rhXB0RV
         XuohUW7k0hb8/rFbdC2ukSHKpZakLyXsl6jpkAMnp3o4RpilIgX6g7vzKyWxrd90rfGU
         EiHQ==
X-Gm-Message-State: ACrzQf16/PK6ss+O3zEDgkpVYXNPowAw74FptSLIyEeX4u98YQbKkVAu
	iRgjta7GAdnTtkxcbVVhksM=
X-Google-Smtp-Source: AMsMyM6arlbxvVjWRWfyODWA+1XBF2D6twCUtKI65uSf3S2vAcndKsZknTjHvTjJhdM7wtQh4z6qXA==
X-Received: by 2002:a5d:4284:0:b0:22a:291e:fa8f with SMTP id k4-20020a5d4284000000b0022a291efa8fmr12816362wrq.553.1663649577762;
        Mon, 19 Sep 2022 21:52:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <6af33d73-1e34-304d-998f-a46c8c05f4bb@amsat.org>
Date: Tue, 20 Sep 2022 06:52:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 3/9] hw/core/sysbus: Resolve main_system_bus singleton
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm
 <magnus.damm@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Cameron Esfahani
 <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Jagannathan Raman <jag.raman@oracle.com>,
 Greg Kurz <groug@kaod.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, John G Johnson
 <john.g.johnson@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Andrew Jeffery
 <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Alistair Francis
 <alistair@alistair23.me>, Jason Herne <jjherne@linux.ibm.com>
References: <20220919231720.163121-1-shentey@gmail.com>
 <20220919231720.163121-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220919231720.163121-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/9/22 01:17, Bernhard Beschow wrote:
> In QEMU, a machine and the main_system_bus always go togehter. Usually
> the bus is part of the machine which suggsts to host it there.

"together", "suggests"

> Since tere is already a current_machine singleton, all code that
> accesses the main_system_bus can be changed (behind the scenes) to go
> through current_machine. This resolves a singleton. Futhermore, by

"Furthermore"

> reifying it in code, the every-machine-has-exactly-one-main-system-bus
> relationship becomes very obvious.
> 
> Note that the main_system_bus attribute is a value rather than a
> pointer. This trades pointer dereferences for pointer arithmetic. The
> idea is to reduce cache misses - a rule of thumb says that
> every pointer dereference causes a cache miss while arithmetic is
> basically free.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/core/bus.c       |  5 ++++-
>   hw/core/machine.c   |  3 +++
>   hw/core/sysbus.c    | 22 +++++-----------------
>   include/hw/boards.h |  1 +
>   4 files changed, 13 insertions(+), 18 deletions(-)

> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 311ed17e18..7af940102d 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h

Likely missing the BusState declaration:

   #include "hw/qdev-core.h"

> @@ -346,6 +346,7 @@ struct MachineState {
>        */
>       MemoryRegion *ram;
>       DeviceMemoryState *device_memory;
> +    BusState main_system_bus;
>   
>       ram_addr_t ram_size;
>       ram_addr_t maxram_size;


