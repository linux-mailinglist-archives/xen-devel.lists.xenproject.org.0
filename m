Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20AC5E5CB9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 09:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409995.652998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obH37-0001UB-AF; Thu, 22 Sep 2022 07:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409995.652998; Thu, 22 Sep 2022 07:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obH37-0001SO-6m; Thu, 22 Sep 2022 07:55:09 +0000
Received: by outflank-mailman (input) for mailman id 409995;
 Thu, 22 Sep 2022 07:55:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GnJq=ZZ=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1obH35-0001SH-HG
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 07:55:07 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df4cbadd-3a4b-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 09:55:06 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id lh5so19112666ejb.10
 for <xen-devel@lists.xenproject.org>; Thu, 22 Sep 2022 00:55:06 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-214-084.77.191.pool.telefonica.de.
 [77.191.214.84]) by smtp.gmail.com with ESMTPSA id
 u17-20020a056402065100b0045081dc93dfsm3166610edx.78.2022.09.22.00.55.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:55:05 -0700 (PDT)
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
X-Inumbo-ID: df4cbadd-3a4b-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=XAn7c1pwQ/FfM7vHKOqOcGKKPoVtNy6cXXuDPbbsEMg=;
        b=KdwbP3Bc87qLjlpjsnO2AH1hFtCVaiTGJp44vkAjCHEyi2BVqdUN8ix+ddbhHaPK1r
         EqWJ5pPbZsCjVFS9e+dTsVJ0Foj6V+KoT4fRyJlz7QqnJ/8hVqxrc1Ho7ZLeIspC87hS
         EwLwWL/B0irPWwT9KoGor+fge4WF8zkBMONJ36LmRsHQ1cCTfxd9d0oVkt47Fb8ho6Yq
         vGRDgumcb7zLXHHzBCfP5aDStxiv4J7vmNbl/fZPXSp3qCOfLbaEdK0wuuYY9KcWK55E
         P9+VDLqy0HdpS4ndwVtZP2lM2k+QoDCxBOx6WyXF/QkqHcfEpOC7COF2TxEu7OhFiih6
         yxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XAn7c1pwQ/FfM7vHKOqOcGKKPoVtNy6cXXuDPbbsEMg=;
        b=eij2bUdXUlVqZuq1jKWYm7LPtLl54CA5JXZ3/9Km98uublB1ejZctnmYQAlqLsWO7x
         6RjdT2311a6O4PWdLcnU6OcZ22azP/dqCV2ir6yfmJHiiLM+7M31rQUjUb9TTlvYHcP+
         tyxf/RtKC1ncZF12+82Nt4XBWuQcDu9GSUN7oFZG+ox3yQKfVLymQjO2JpOwbw2AXTBe
         yR2LmQpUPLgfCE1oEqqVa2CBQyRvG26rm038FYChEjyVtHltxlcVkEfVzkmLrvJKMh9v
         7YAB1mKKJG+9zFk1WtpwVekpMSE+TiR93mWseXXdCcuSjWvRkZq3FCC0Lg16RtN/A2qy
         cbDw==
X-Gm-Message-State: ACrzQf2nnE3tkPvcoGQ7aLNs1iqoYZR+W31fKGQil8/0iQuL0pWdXdgM
	aEQ4JbGhjcGL1JCxEkBCs2w=
X-Google-Smtp-Source: AMsMyM4vh+kpWsvDAV6UjWoPXkkUVHDYB2adjnMzVWEdRb430ELqUeGucGcmkbkYyJGj0Q/DyqUmmQ==
X-Received: by 2002:a17:906:9b93:b0:780:3b58:93e1 with SMTP id dd19-20020a1709069b9300b007803b5893e1mr1620475ejc.698.1663833305755;
        Thu, 22 Sep 2022 00:55:05 -0700 (PDT)
Date: Thu, 22 Sep 2022 07:55:01 +0000
From: B <shentey@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
CC: Alistair Francis <alistair23@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
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
In-Reply-To: <87a66tgwd5.fsf@pond.sub.org>
References: <20220919231720.163121-1-shentey@gmail.com> <20220919231720.163121-2-shentey@gmail.com> <CAKmqyKN+V2R8PkED67tB8+pCZs9369ViiL8OZ9XhO3SdUCk5=Q@mail.gmail.com> <87edw6xoog.fsf@pond.sub.org> <0BBD7391-7B2D-44E7-9396-D1747784B9DA@gmail.com> <87a66tgwd5.fsf@pond.sub.org>
Message-ID: <58A6CCCB-7426-41A2-9D3A-0683FBC51F47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 21=2E September 2022 04:55:02 UTC schrieb Markus Armbruster <armbru@red=
hat=2Ecom>:
>Bernhard Beschow <shentey@gmail=2Ecom> writes:
>
>> Am 20=2E September 2022 11:36:47 UTC schrieb Markus Armbruster <armbru@=
redhat=2Ecom>:
>>>Alistair Francis <alistair23@gmail=2Ecom> writes:
>>>
>>>> On Tue, Sep 20, 2022 at 9:18 AM Bernhard Beschow <shentey@gmail=2Ecom=
> wrote:
>>>>>
>>>>> SiFiveEState inherits from SysBusDevice while it's TypeInfo claims i=
t to
>>>>> inherit from TYPE_MACHINE=2E This is an inconsistency which can caus=
e
>>>>> undefined behavior such as memory corruption=2E
>>>>>
>>>>> Change SiFiveEState to inherit from MachineState since it is registe=
red
>>>>> as a machine=2E
>>>>>
>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>>
>>>> Reviewed-by: Alistair Francis <alistair=2Efrancis@wdc=2Ecom>
>>>
>>>To the SiFive maintainers: since this is a bug fix, let's merge it righ=
t
>>>away=2E
>>
>> I could repost this particular patch with the three new tags (incl=2E F=
ixes) if desired=2E
>
>Can't hurt, and could help the maintainers=2E

[X] Done=2E

Best regards,
Bernhard

