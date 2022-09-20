Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1511E5BF105
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 01:24:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409608.652610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oamav-0005t1-7f; Tue, 20 Sep 2022 23:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409608.652610; Tue, 20 Sep 2022 23:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oamav-0005qu-4x; Tue, 20 Sep 2022 23:24:01 +0000
Received: by outflank-mailman (input) for mailman id 409608;
 Tue, 20 Sep 2022 23:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SAgC=ZX=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1oamau-0005qo-AZ
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 23:24:00 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4df637d3-393b-11ed-bad8-01ff208a15ba;
 Wed, 21 Sep 2022 01:23:59 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id y17so9824693ejo.6
 for <xen-devel@lists.xenproject.org>; Tue, 20 Sep 2022 16:23:59 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-006-055.78.54.pool.telefonica.de.
 [78.54.6.55]) by smtp.gmail.com with ESMTPSA id
 j22-20020a508a96000000b0044ed7a75c33sm689265edj.6.2022.09.20.16.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 16:23:58 -0700 (PDT)
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
X-Inumbo-ID: 4df637d3-393b-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=qKZPVG5iME12/xaovZM6A6+qsWvmHnon3GYaJNYHOS8=;
        b=fCK9HNlTrRewEDKb1ki/vTFY3BFU4vzCnR5/5SporYyj2K3I0iIme7NT7sFxvxSWk3
         umbS7mgSQHCv4vemkhsUb7I8ViXwtdzvdECA7Hg1aPJOJHkBgajnUvnzOd15ofRxvKPW
         2NmhmYzO4jI0zH5j583BH2fYOyCqRhQagr8KEfGrHxwOvw9vpW0RHacBcO/xfLZqnbG9
         JGQYdHCVFxtkFHNb5If1sypH5E1lsaKJVmD0Bts992LCNZLkqOhf1P9RqHOcsUAWXlWu
         d4YWu7xGj+i6DW0je9gZb13SoS+moDDgWL9JmB1tDOJPynLYKJKZy8VNJloyV8FGfrcV
         cuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qKZPVG5iME12/xaovZM6A6+qsWvmHnon3GYaJNYHOS8=;
        b=0qEUS3okSv3QwqoyQA/5lKghi34dbS3gMZj81WArZ8W6iWH0h+Ue/1RdUcOZXj0J1Z
         KTV5ltnm/01lr9IR1r7E2tmRu5pE3VyW2u7OM92pQWcJlMoO1pGkI1pLyAVX2B1cuMSi
         IL03SzyceUA0F79QLo0eLrN8RzOp4oKwKpjlBySmYRxmLxR1rwrUhgT2tuVQpBZb3AZS
         UpumV2eh5/8RcqWTb0uDCK7ap4RH3o29J6CUfRqlbT5fDD6LGCf2FSEXfBCSUVruXdzk
         jgfv1QeGi32Z3oTLkmx37VPbl4tyL+RCUWt4nosD8lUcIeaJOputhAg/E49Nl/mf3j7Z
         lj9A==
X-Gm-Message-State: ACrzQf0/1T8N92CdJSH+T1fNqIVJfQTGai6bFojUQWn4GjojPu+VMI+c
	mJ4sidNjHm9HWovDXA+MV+4=
X-Google-Smtp-Source: AMsMyM5RM/OVc3EykNVPTfjHa4cDBJJ/DnJiA70xAhCb8RUZeIR5sVs3l/o+BP+JEU8fpdRpHUyjcA==
X-Received: by 2002:a17:906:eec9:b0:73d:c369:690f with SMTP id wu9-20020a170906eec900b0073dc369690fmr19058158ejb.767.1663716238901;
        Tue, 20 Sep 2022 16:23:58 -0700 (PDT)
Date: Tue, 20 Sep 2022 23:23:52 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Cameron Esfahani <dirty@apple.com>,
 Michael Rolnik <mrolnik@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Jagannathan Raman <jag.raman@oracle.com>, Greg Kurz <groug@kaod.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Peter Xu <peterx@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Stafford Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 "open list:Overall" <kvm@vger.kernel.org>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Andrew Jeffery <andrew@aj.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Herne <jjherne@linux.ibm.com>
Subject: Re: [PATCH 1/9] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
In-Reply-To: <87edw6xoog.fsf@pond.sub.org>
References: <20220919231720.163121-1-shentey@gmail.com> <20220919231720.163121-2-shentey@gmail.com> <CAKmqyKN+V2R8PkED67tB8+pCZs9369ViiL8OZ9XhO3SdUCk5=Q@mail.gmail.com> <87edw6xoog.fsf@pond.sub.org>
Message-ID: <0BBD7391-7B2D-44E7-9396-D1747784B9DA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 20=2E September 2022 11:36:47 UTC schrieb Markus Armbruster <armbru@redh=
at=2Ecom>:
>Alistair Francis <alistair23@gmail=2Ecom> writes:
>
>> On Tue, Sep 20, 2022 at 9:18 AM Bernhard Beschow <shentey@gmail=2Ecom> =
wrote:
>>>
>>> SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it =
to
>>> inherit from TYPE_MACHINE=2E This is an inconsistency which can cause
>>> undefined behavior such as memory corruption=2E
>>>
>>> Change SiFiveEState to inherit from MachineState since it is registere=
d
>>> as a machine=2E
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>
>> Reviewed-by: Alistair Francis <alistair=2Efrancis@wdc=2Ecom>
>
>To the SiFive maintainers: since this is a bug fix, let's merge it right
>away=2E

I could repost this particular patch with the three new tags (incl=2E Fixe=
s) if desired=2E

Best regards,
Bernhard
>


