Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D2C4D939A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 06:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290342.492925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTzSf-0002mk-Hc; Tue, 15 Mar 2022 05:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290342.492925; Tue, 15 Mar 2022 05:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTzSf-0002kB-De; Tue, 15 Mar 2022 05:11:09 +0000
Received: by outflank-mailman (input) for mailman id 290342;
 Mon, 14 Mar 2022 16:41:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AfWQ=TZ=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nTnlC-0003yM-9y
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 16:41:30 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98629fdc-a3b5-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 17:41:29 +0100 (CET)
Received: by mail-pj1-x102b.google.com with SMTP id v4so15267725pjh.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Mar 2022 09:41:29 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a056a00178100b004f731a1a952sm22043486pfg.168.2022.03.14.09.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 09:41:27 -0700 (PDT)
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
X-Inumbo-ID: 98629fdc-a3b5-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=W0zrBM+N0hxFD4HvfoclDpELnmJr/18GN6q0lPZatEw=;
        b=fmpUDGOi8OZUJgMmHkU4ZiecIW8QqM1a02qsRb5yuKVzZqkKGRd0gAv5AfPJZciLC2
         wyfwXolLcpsITp6G/VgGOl4n+QuCOLQk3Yq16Z7BHeO1D5wgcSAf/IDLm72KrjEXZHV/
         M4BRhf0N2E/JnyG/RHuUFZTe+nWC8OwxMU8ozx661gpkTL/UO2ghlDIt48sBGxo0Msdh
         /YNfia3uEbrZh1oI7H2fo/d1bB9/w6wpunLJALQRD5SqFqrj8TQigLM4Ted+4sWSxOKR
         FPVMqV/tM1261P8Mf1g7qtmMopnyahbNNaai7t7ssi2iWy+HgxXH9dvrAsqdbHKia6V5
         abag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W0zrBM+N0hxFD4HvfoclDpELnmJr/18GN6q0lPZatEw=;
        b=JYZT9tBkiEvRYq2cyLNeekmY7jOWZuVMxN4vTpXPPD7BER5n+0DRwX2Cw+oFrx4fsw
         d7kaYyuFPqpuXXFw+LjYbMRqg4AWXqkbSRx7LBQG5yOqNP6p8eNdCCiDR/Y0fiGH4s3S
         JBq+7HJ0/k5q1VBNSdmIs/JDk/JJZNSQSdJBj5aTuHnLo8tW+qS/Igx34MlUmEwxSoQs
         gbw95TQuYvYiilT30EISc+Da2aFnR3x3bToOfusSQgQV+CZ62EtRFl/+lnNXSi9/+Se6
         V93JXji9RT5AkleA3ElTHJ2TN0h45WTHSscEe9qFhz12R1QODWjHkZNhfRJd2HHK2MjK
         k4kw==
X-Gm-Message-State: AOAM5309KTeSqDxD/aG5ZAqMv0Hb4kQekI4E5SKNDw/8cKg01eF+5dKM
	46adlp0f9awtpeV3qwdMhRY=
X-Google-Smtp-Source: ABdhPJwPi5HHkN9qRkorFbCauI5zttPHA5P4ioPiaxV0wCn1Jl6lXBIv9n8vWOh2Ce6Vb5rH2bPC8Q==
X-Received: by 2002:a17:90a:1b4a:b0:1bf:1112:5ef with SMTP id q68-20020a17090a1b4a00b001bf111205efmr36323pjq.143.1647276087626;
        Mon, 14 Mar 2022 09:41:27 -0700 (PDT)
Message-ID: <8ac83023-3609-4b24-6ffc-9f93478ce69b@gmail.com>
Date: Mon, 14 Mar 2022 17:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 0/3] Use g_new() & friends where that makes obvious
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Keith Busch
 <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth
 <michael.roth@amd.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Colin Xu <colin.xu@intel.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Cornelia Huck
 <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 haxm-team@intel.com, qemu-s390x@nongnu.org
References: <20220314160108.1440470-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220314160108.1440470-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/3/22 17:01, Markus Armbruster wrote:
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
> 
> This series only touches allocations with size arguments of the form
> sizeof(T).  It's mechanical, except for a tiny fix in PATCH 2.
> 
> PATCH 1 adds the Coccinelle script.
> 
> PATCH 2 cleans up the virtio-9p subsystem, and fixes a harmless typing
> error uncovered by the cleanup.
> 
> PATCH 3 cleans up everything else.  I started to split it up, but
> splitting is a lot of decisions, and I just can't see the value.
> 
> For instance, MAINTAINERS tells me to split for subsystem "virtio",
> patching
> 
>      hw/char/virtio-serial-bus.c
>      hw/display/virtio-gpu.c
>      hw/net/virtio-net.c
>      hw/virtio/virtio-crypto.c
>      hw/virtio/virtio-iommu.c
>      hw/virtio/virtio.c
> 
> But it also tells me to split for subsystem "Character devices",
> patching
> 
>      hw/char/parallel.c                       |  2 +-
>      hw/char/riscv_htif.c                     |  2 +-
>      hw/char/virtio-serial-bus.c              |  6 +-
> 
> and for subsystem "Network devices", patching
> 
>      hw/net/virtio-net.c
> 
> and for subsystem "virtio-gpu", patching
> 
>      hw/display/virtio-gpu.c
> 
> I guess I'd go with "virtio".  Six files down, 103 to go.  Thanks, but
> no thanks.
> 
> Since the transformation is local to a function call, dropping is
> completely safe.  We can deal with conflicts by dropping conflicting
> hunks, with "git-pull -s recursive -X ours".  Or drop entire files
> with conflicts.
> 
> If you want me to split off certain parts, please tell me exactly what
> you want split off, and I'll gladly do the splitting.  I don't mind
> the splitting part, I do mind the *thinking* part.
> 
> Markus Armbruster (3):
>    scripts/coccinelle: New use-g_new-etc.cocci
>    9pfs: Use g_new() & friends where that makes obvious sense
>    Use g_new() & friends where that makes obvious sense

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

