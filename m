Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEC8A21365
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 22:02:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878787.1288978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcshu-0006O3-4J; Tue, 28 Jan 2025 21:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878787.1288978; Tue, 28 Jan 2025 21:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcshu-0006Mb-1P; Tue, 28 Jan 2025 21:01:14 +0000
Received: by outflank-mailman (input) for mailman id 878787;
 Tue, 28 Jan 2025 21:01:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZS2U=UU=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1tcshs-0006MV-8q
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 21:01:12 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff999f3e-ddba-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 22:01:09 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d3f57582a2so128677a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 13:01:09 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-042-254.89.12.pool.telefonica.de.
 [89.12.42.254]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760ab311sm860147666b.97.2025.01.28.13.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 13:01:08 -0800 (PST)
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
X-Inumbo-ID: ff999f3e-ddba-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738098069; x=1738702869; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTNqOQ4RwVUWCgn6HX+Oj/bHeQslJwkndeT4/tSVYlU=;
        b=CvITPvJWlKRKHO3aWOqYPbYsyrLWZa+m2l9nB8JM+4EPxdyqez2Dr1pkI8Hjz4IcuY
         044Wsjkwb9kIlSFcNNmDlF7Wt85BhIz6MM8fllRNcn9TzNztlBUAW2ID1z6xF41xUJMU
         Mqcew/vD0VO42tdjQ3cNAQBrihPcw/KUwvYwiXcaxLr4QWAm3Bidj+CNg1Ld5iv8G0F4
         j8lPyfrM5ZHxGge8IVylmn0/mSLq5uROg4UOvSwDx1RF/62buL+O+5b0ySrl+++vCiG+
         S4bbIRahntpMwjLIMIq9RoCj9Te5GWZfBTP/s7PbAlNXeJCcyYpkdUKy5VVtWKYEPp4a
         lKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738098069; x=1738702869;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTNqOQ4RwVUWCgn6HX+Oj/bHeQslJwkndeT4/tSVYlU=;
        b=jYfP9deA7qelb6JaMIjBFIR1hrr/hBXxA30nksNKFZK63OAUAdrddQ040ZilFB678E
         22KdzO3hRvJF3gD7Q1ug5M2NPvSCkcDgONwu9pJ3DuwqSgnrAVyxZL0YOlh0ybDzfWaP
         xMuyHioVhVZjStiCeSQ4BeIhtTJMXrHpO4337O8edi1qg0KK2/LcIfNP7oVdrpWMeToh
         a8Ab4KS4fsx+J+ctP+ue1c0Xdc7Mcpng4sgxP5wGdOZrgRvPnTNS+ssrPus1Nz9Oc9Ss
         h4aZtxY5iVL9oa/7VAoFWvJK3yaaE9EBRtlGB02EMGNUMy+Y967nodQ2IaTn5EbO/OYi
         OSDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvihNWySOG77iAiCBQeLWhUYXBnB5YfuVJxBsRsN1d2R7s/JOk4XuVqasVCE7ij15HXc9J33RhpU0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpKT97AN0XM27n7I1wy5YcwSsukutmE2YGDzGNvOM0MoL5mGQy
	W+T9b3ALNXZhqcyh0GOPx4iFYA79CqRkv66vdP46nNT9tROdjCe5
X-Gm-Gg: ASbGncvX3iRke9hcvnn+PvEKswluP3NzSseiS7xjUd79zdVGUkq6vN+a4v4SV9lkrAu
	kqY6XXIuvaB1u3xdmiaK/tcPi8qLQ+De7NROijRdWD3hvkXNxDWiBLQZlp7QkPQc4HoiVTL7I6U
	sqzRMln4yKlA+MRT5tH/ZWUMETXlZwb9i95/RkrAbs45Wejx3EjulUdn+imp/mW5aWgmy5zDTXu
	w6FSJCukfs7r4RKoN5mjha8tjdoMjDpth6tdrB/fETAj7t+F7ufd3mllhUE2iTqdezfkiSqRNw3
	riO9K6XixkPzQwLBLvUSBMQtshr5QQ85JwUDYLThCTOv/Rn3Ku/86PXTd10rdJhM
X-Google-Smtp-Source: AGHT+IEUH1MqAsTKouPAgO63mx87B7XD+KP2maJkZHlUr1Y668zI87sZ/y2pdGu6scR74+6RcErjsQ==
X-Received: by 2002:a17:907:3f25:b0:aa4:cd1e:c91b with SMTP id a640c23a62f3a-ab6bbaa8a32mr417503766b.7.1738098068537;
        Tue, 28 Jan 2025 13:01:08 -0800 (PST)
Date: Tue, 28 Jan 2025 19:13:56 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Yi Liu <yi.l.liu@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Anthony PERARD <anthony@xenproject.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, Paul Durrant <paul@xen.org>,
 =?ISO-8859-1?Q?Cl=E9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/9=5D_hw/sysbus/platform-bus?=
 =?US-ASCII?Q?=3A_Introduce_TYPE=5FDYNAMIC=5FSYS=5FBUS=5FDEVICE?=
In-Reply-To: <990dacab-6cfd-4a18-944d-ba076a80996c@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org> <wkb53fhvfchqa4uvmifgitvcr7t7rfpc3hcohdhzczkzvktetx@yjveswjel3s4> <CAFEAcA-QOYcnJi=joKHbRmUCXK1UFOgQRgYP-fDq4h_1SkMGyQ@mail.gmail.com> <2893a552-ca6c-01c4-dcc0-6107ccf1c7b5@eik.bme.hu> <990dacab-6cfd-4a18-944d-ba076a80996c@linaro.org>
Message-ID: <291CA1E7-6220-4F8E-90E1-D38723E7FDBE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 28=2E Januar 2025 15:10:18 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 28/1/25 13:57, BALATON Zoltan wrote:
>> On Tue, 28 Jan 2025, Peter Maydell wrote:
>>> On Tue, 28 Jan 2025 at 10:42, Gerd Hoffmann <kraxel@redhat=2Ecom> wrot=
e:
>>>>=20
>>>> On Sat, Jan 25, 2025 at 07:13:34PM +0100, Philippe Mathieu-Daud=C3=A9=
 wrote:
>>>>> Some SysBus devices can optionally be dynamically plugged onto
>>>>> the sysbus-platform-bus (then virtual guests are aware of
>>>>> mmio mapping and IRQs via device tree / ACPI rules)=2E
>>>>=20
>>>> Do we have some sane way to have user-pluggable sysbus devices on arm=
?
>>>=20
>>> The answer in a general sense is "no, because user pluggable
>>> sysbus is a weird idea"=2E "sysbus" means "it's wired into a
>>> specific bit of the memory map and to specific IRQs, and whoever
>>> does that needs to know what IRQs and bits of memory are usable,
>>> and the guest OS needs to know it's there"=2E "user-pluggable" means
>>> "it's all automatic and the guest can just do some kind of
>>> probing for what is or isn't present"=2E All the platform bus stuff
>>> is a nasty mess that's working around the things people want
>>> to plug in not being clean devices on probeable buses :-(
>>> And the platform bus is only supported on the "virt" board,
>>> because that's the only one where QEMU is generating its
>>> own dtb or ACPI tables where it can tell the guest "hey,
>>> there's some device here"=2E
>>=20
>> There are some SoCs that have memory mapped devices but different versi=
ons in the same family have different devices=2E Either older ones missing =
some devices or have less USB or network ports while newer SoCs have more o=
f those or they have PCIe instead of PCI=2E Modelling these could use plugg=
able sysbus devices so one could add the devices needed for a SoC version w=
ithout having to write or modify a board code=2E I think Bernhard's attempt=
 to try creating e500 SoCs from a device tree goes in that direction too=2E=
 We could also model this by having a SoC that can instantiate devices base=
d on some properties but maybe pluggable devices could be more generic for =
this=2E The issue seems to be how to tell the board or SoC where to map it =
and what IRQ to connect it as this is done by the board and not the device =
so properties on the device to set these does not really help unless the bo=
ard can somehow query it and instantiate the devices based on that=2E Other=
wise whatever handles the -device option to create the device would need kn=
owledge about the board=2E (E=2Eg=2E the e500 devices are mapped in the CCS=
R memory region so one can't just use system address space for them=2E)
>
>IIRC Bernard's series takes a DTB as input and create the machine
>matching this DTB=2E

That's correct=2E It's still on my todo list to send an RFC=2E I first wan=
ted to gain some experience implementing a machine in the classic way which=
 I've now done by means of the imx8mp-evk series=2E Once I clean up the e50=
0-fdt branch I'd send an RFC=2E

Best regards,
Bernhard

>
>As Peter explained, sysbus-platform-bus fits TYPE_DYNAMIC_SYS_BUS_DEVICE
>in free slots, then generates the corresponding ACPI/DTB=2E
>
>What you describe seems closer to the QEMU Dynamic Machine project,
>following Damien's idea:
>https://lore=2Ekernel=2Eorg/qemu-devel/20220223090706=2E4888-1-damien=2Eh=
edde@greensocs=2Ecom/
>We are not quite there yet=2E=2E=2E

