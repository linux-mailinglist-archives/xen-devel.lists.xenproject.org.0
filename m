Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88D7FF0A3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 14:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644724.1006147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8hOa-0006aa-IA; Thu, 30 Nov 2023 13:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644724.1006147; Thu, 30 Nov 2023 13:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8hOa-0006Yv-E6; Thu, 30 Nov 2023 13:48:00 +0000
Received: by outflank-mailman (input) for mailman id 644724;
 Thu, 30 Nov 2023 13:47:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dHGs=HL=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r8hOZ-0006Yo-HP
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 13:47:59 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 118d47af-8f87-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 14:47:57 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40b4734b975so8784995e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 05:47:57 -0800 (PST)
Received: from [192.168.69.100] (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr.
 [176.184.17.116]) by smtp.gmail.com with ESMTPSA id
 n26-20020a05600c3b9a00b0040b34409d43sm2099005wms.11.2023.11.30.05.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 05:47:56 -0800 (PST)
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
X-Inumbo-ID: 118d47af-8f87-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701352077; x=1701956877; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rzryK5Ovxx7DOgDxZdQ36NxzgykTz4w4Mydj5qAA+DE=;
        b=EzeHO7+IWferb5J459FxMhDxw8VGZXRfSX2uWJF+d5MaCzN4JlvUi2sjJ/UgqWh4xx
         EwCTcCy4bzoqPEKW1WHFu/klMzZ1aY6s/orfhKkZy0j+Md+PiuzNi19HJYsS6i/Z7qx6
         2xyaHrLzJDdcyUfqEsvsVmG6gZkiYDKfBON/zypjfJU6nyc5S/ZqQAyi0+H+W9PzKqVE
         ctRNzic6+bt8NJ+WoFa1Gz0zHv2NHcpnDmECwDQudKNLTnWnlq8ezrJjKR2hLlGl8RpE
         60czB1l/aDl7Hs3acDxpwY/j2hhKcY8QEFHsRMLwT1XO/my7SRdOTLb7g9FtyX4saKKw
         WUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701352077; x=1701956877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzryK5Ovxx7DOgDxZdQ36NxzgykTz4w4Mydj5qAA+DE=;
        b=CLVpuYTUiZG42hSbBI0Wv1bZOMyHaDDMkqbjxB/EI72z2TKpX8aoXAjzLOD4m2G0Y8
         x1yA3yObw/XjuX0djJeiKkPnP6rH5W1dyJxHD0zuFZiFLUXzjf7SzjyytKwBvgNtiWZu
         +MvcJ85vNH1YDVxtKFDS14Dqgzpfy5ofGn9uVu+xrnzH+IvP2iZ4uR8Q2mN0PqBJntqo
         2LbNXClrVhS6V5zUfEUD/s7HuM/nxTZiEk0JjgedSdmK+UAfEIl7l8QmPTj8vEr79YOJ
         lLmrTZhY19EfLdyeI4ggkW8B8BtL2I823VgGXia3BZk12mEl+LpSLlsPn1s7e8FITTwf
         a5sw==
X-Gm-Message-State: AOJu0Yzy53CySC1AtcAi0HbKXSL+zsvZoFWrd/15o7fwCnUrmimChT/w
	MbGK+pKewBSvlRU8cfCVGA4jQg==
X-Google-Smtp-Source: AGHT+IEVx+BgPGgvtoGgXlS2ma7+soUtQpvgW6i96U/5dPN3399XP3o/9uLj4S+iHyFoPGNahzok1g==
X-Received: by 2002:a05:600c:3c8a:b0:40b:4da4:b985 with SMTP id bg10-20020a05600c3c8a00b0040b4da4b985mr6336852wmb.38.1701352076590;
        Thu, 30 Nov 2023 05:47:56 -0800 (PST)
Message-ID: <9c305a84-fd86-42fe-98ae-9297d480acd6@linaro.org>
Date: Thu, 30 Nov 2023 14:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] Replace "iothread lock" with "BQL" in comments
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Paul Durrant <paul@xen.org>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Huacai Chen <chenhuacai@kernel.org>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Jiri Slaby <jslaby@suse.cz>, Alexander Graf <agraf@csgraf.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Stafford Horne <shorne@gmail.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 John Snow <jsnow@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Michael Roth <michael.roth@amd.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-6-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129212625.1051502-6-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 29/11/23 22:26, Stefan Hajnoczi wrote:
> The term "iothread lock" is obsolete. The APIs use Big QEMU Lock (BQL)
> in their names. Update the code comments to use "BQL" instead of
> "iothread lock".
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   docs/devel/reset.rst             |  2 +-
>   hw/display/qxl.h                 |  2 +-
>   include/exec/cpu-common.h        |  2 +-
>   include/exec/memory.h            |  4 ++--
>   include/exec/ramblock.h          |  2 +-
>   include/migration/register.h     |  8 ++++----
>   target/arm/internals.h           |  4 ++--
>   accel/tcg/cputlb.c               |  4 ++--
>   accel/tcg/tcg-accel-ops-icount.c |  2 +-
>   hw/remote/mpqemu-link.c          |  2 +-
>   migration/block-dirty-bitmap.c   | 10 +++++-----
>   migration/block.c                | 24 ++++++++++++------------
>   migration/colo.c                 |  2 +-
>   migration/migration.c            |  2 +-
>   migration/ram.c                  |  4 ++--
>   system/physmem.c                 |  6 +++---
>   target/arm/helper.c              |  2 +-
>   target/arm/tcg/m_helper.c        |  2 +-
>   ui/spice-core.c                  |  2 +-
>   util/rcu.c                       |  2 +-
>   audio/coreaudio.m                |  4 ++--
>   ui/cocoa.m                       |  6 +++---
>   22 files changed, 49 insertions(+), 49 deletions(-)


> diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
> index 69c6a53902..a2bc0a345d 100644
> --- a/include/exec/ramblock.h
> +++ b/include/exec/ramblock.h
> @@ -34,7 +34,7 @@ struct RAMBlock {
>       ram_addr_t max_length;
>       void (*resized)(const char*, uint64_t length, void *host);
>       uint32_t flags;
> -    /* Protected by iothread lock.  */
> +    /* Protected by BQL.  */

There is only one single BQL, so preferably:

"by the BQL"

>       char idstr[256];
>       /* RCU-enabled, writes protected by the ramlist lock */
>       QLIST_ENTRY(RAMBlock) next;




> -/* Called with iothread lock taken.  */
> +/* Called with BQL taken.  */

"with the BQL" (other uses)

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   static void dirty_bitmap_do_save_cleanup(DBMSaveState *s)
>   {
>       SaveBitmapState *dbms;
> @@ -479,7 +479,7 @@ static void dirty_bitmap_do_save_cleanup(DBMSaveState *s)
>       }
>   }


