Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ABB27E6CB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541.1787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZVe-0008Jy-0A; Wed, 30 Sep 2020 10:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541.1787; Wed, 30 Sep 2020 10:38:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZVd-0008JY-Sz; Wed, 30 Sep 2020 10:38:53 +0000
Received: by outflank-mailman (input) for mailman id 541;
 Wed, 30 Sep 2020 10:38:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YD0F=DH=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kNZVd-0008JT-5b
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:38:53 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6da0caf8-6d3f-45d6-9140-67c912841e26;
 Wed, 30 Sep 2020 10:38:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g4so1221946wrs.5
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 03:38:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e13sm2307944wre.60.2020.09.30.03.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 03:38:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C1AB01FF7E;
 Wed, 30 Sep 2020 11:38:48 +0100 (BST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YD0F=DH=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kNZVd-0008JT-5b
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:38:53 +0000
X-Inumbo-ID: 6da0caf8-6d3f-45d6-9140-67c912841e26
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6da0caf8-6d3f-45d6-9140-67c912841e26;
	Wed, 30 Sep 2020 10:38:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g4so1221946wrs.5
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 03:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=CsgXB6Hqfw/ebXyOsybxKdmz36dyBiIhsmMQBvB0mZ0=;
        b=HZl0S8C25bfxaBZL7Vqzxc6U927lUFpm2st8Ww3dw4lEIo2dM9LwhJlJiOlPYyDYzO
         MavDWcqbYOZAC2bHJAgloFciVI2Opu/LKclIAy1PUDfgWyiB4GjXke9FAVwIjSbek7Yw
         3HY6yvltgOLZZWaEQ78V8Mck0I103fUTJ0diboWso3t8wG69wduxWKjWJUAB+dlgwlRQ
         8dLj6ip2QWkLqVsko9q1HkeeG/aSoIcxm/5lu2i8LF85190j+pe5lY5gGukMRYnDQTEo
         L046vzYHULdazEEbatgGFj/w4tii5iTfPlA3JSwG0AWo1AIIXWt9ujcIcAT7RTDWb4mV
         zAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=CsgXB6Hqfw/ebXyOsybxKdmz36dyBiIhsmMQBvB0mZ0=;
        b=Zl0QK/WLS2AXUMTCShsHxH/NF18U0fnjc28FaFnwUILsxprfnhrcFPFF54kq1VFyOw
         HPxzO4lzNGFP1wx1UfYaqYwIuE5Jd9RgkcRGtCMdNcifI5sqA1jUPcCOgJOWQD1jloxY
         8VhuUe+6Wi1Qe0+T8ZYjGDTMvtHSDuF2nLDev0f17wMyxs+Y3dT7nYSPNol6dYahJUxV
         q9RqWvCeidL2nwQNAis/YfP73lY7a8SwNz+Dfqy7rLlYaR7CN97BlSBWCGZ6OtR8pvOQ
         JOHGmK007LKgVl8bjTFXfTvDluu2TIfCWimrmrw017iQpAOHrxmDIot4W90ixOOm1vzt
         CxEw==
X-Gm-Message-State: AOAM530GboFFKBy2pGSEbRl97m05C6I72gu3J5M86tTSV5EOsDZBAphR
	SiZ+ZslqeZHF0Zqz9lMPLKJjtg==
X-Google-Smtp-Source: ABdhPJwfCuWTFus63duYQtg5ZrNf+pRDB6K8oSzsmRXaf/0t+/M/sWIoVkf6HRH0S/n/1no0UNd9BA==
X-Received: by 2002:a5d:50cd:: with SMTP id f13mr2357299wrt.211.1601462330741;
        Wed, 30 Sep 2020 03:38:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e13sm2307944wre.60.2020.09.30.03.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 03:38:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C1AB01FF7E;
	Wed, 30 Sep 2020 11:38:48 +0100 (BST)
References: <20200926205542.9261-1-julien@xen.org>
 <87k0wcppnj.fsf@linaro.org> <5afbce1c-0c45-4b8c-771a-f83b91328e4a@xen.org>
 <87d024p9tc.fsf@linaro.org> <a42d2724-4d9b-a177-35c7-44bd0250f265@xen.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, masami.hiramatsu@linaro.org,
 ehem+xen@m5p.com, bertrand.marquis@arm.com, andre.przywara@arm.com, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>, Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
In-reply-to: <a42d2724-4d9b-a177-35c7-44bd0250f265@xen.org>
Date: Wed, 30 Sep 2020 11:38:48 +0100
Message-ID: <874knfpn0n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Julien Grall <julien@xen.org> writes:

> Hi Alex,
>
> On 29/09/2020 22:11, Alex Benn=C3=A9e wrote:
>>=20
>> Julien Grall <julien@xen.org> writes:
>>=20
>>> Hi Alex,
>>>
>>> On 29/09/2020 16:29, Alex Benn=C3=A9e wrote:
>>>>
>>>> Julien Grall <julien@xen.org> writes:
>>>>
>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> Hi all,
>>>>>
>>>>> Xen on ARM has been broken for quite a while on ACPI systems. This
>>>>> series aims to fix it.
>>>>>
>>>>> Unfortunately I don't have a system with ACPI v6.0 or later (QEMU see=
ms
>>>>> to only support 5.1). So I did only some light testing.
>>>>
>>>> I was hoping to get more diagnostics out to get it working under QEMU
>>>> TCG so I think must of missed a step:
>>>>
>>>>     Loading Xen 4.15-unstable ...
>>>>     Loading Linux 4.19.0-11-arm64 ...
>>>>     Loading initial ramdisk ...
>>>>     Using modules provided by bootloader in FDT
>>>>     Xen 4.15-unstable (c/s Sat Sep 26 21:55:42 2020 +0100 git:72f3d495=
d0) EFI loader
>>>>     ...silence...
>>>>
>>>> I have a grub installed from testing on a buster base:
>>>>
>>>>     dpkg --status grub-arm64-efi
>>>>     Version: 2.04-8
>>>>
>>>> With:
>>>>
>>>>     GRUB_CMDLINE_LINUX_DEFAULT=3D""
>>>>     GRUB_CMDLINE_LINUX=3D"console=3DttyAMA0"
>>>>     GRUB_CMDLINE_LINUX_XEN_REPLACE=3D"console=3Dhvc0 earlyprintk=3Dxen"
>>>>     GRUB_CMDLINE_XEN=3D"loglvl=3Dall guest_loglvl=3Dall com1=3D115200,=
8n1,0x3e8,5console=3Dcom1,vg"
>>>>
>>>> And I built Xen with --enable-systemd and tweaked the hypervisor .conf=
ig:
>>>>
>>>>     CONFIG_EXPERT=3Dy
>>>>     CONFIG_ACPI=3Dy
>>>>
>>>> So any pointers to make it more verbose would be helpful.
>>>
>>> The error is hapenning before Xen setup the console. You can get early
>>> output on QEMU if you rebuild Xen with the following .config options:
>>>
>>> CONFIG_DEBUG=3Dy
>>> CONFIG_EARLY_UART_CHOICE_PL011=3Dy
>>> CONFIG_EARLY_UART_PL011=3Dy
>>> CONFIG_EARLY_PRINTK=3Dy
>>> CONFIG_EARLY_UART_BASE_ADDRESS=3D0x09000000
>>> CONFIG_EARLY_UART_PL011_BAUD_RATE=3D0
>>> CONFIG_EARLY_PRINTK_INC=3D"debug-pl011.inc"
>>=20
>> OK I can see it fails on the ACPI and then tries to fall back to FDT and
>> then fails to find the GIC:
>>=20
>>    (XEN) CMDLINE[00000000f7bbe000]:chosen placeholder root=3DUUID=3Dcf00=
cd3a-066b-4146-bedf-f811d3343077 ro console=3Dhvc0 earlyprintk=3Dxen
>>    (XEN)
>>    (XEN) Command line: placeholder loglvl=3Dall guest_loglvl=3Dall com1=
=3D115200,8n1,0x3e8,5console=3Dcom1,vg no-real-mode edd=3Doff
>>    (XEN) parameter "placeholder" unknown!
>>    (XEN) parameter "no-real-mode" unknown!
>>    (XEN) parameter "edd" unknown!
>>    (XEN) ACPI: RSDP 138560000, 0024 (r2 BOCHS )
>>    (XEN) ACPI: XSDT 138550000, 004C (r1 BOCHS  BXPCFACP        1       1=
000013)
>>    (XEN) ACPI: FACP 138510000, 010C (r5 BOCHS  BXPCFACP        1 BXPC   =
     1)
>>    (XEN) ACPI: DSDT 138520000, 14A6 (r2 BOCHS  BXPCDSDT        1 BXPC   =
     1)
>>    (XEN) ACPI: APIC 138500000, 018C (r3 BOCHS  BXPCAPIC        1 BXPC   =
     1)
>>    (XEN) ACPI: GTDT 1384F0000, 0060 (r2 BOCHS  BXPCGTDT        1 BXPC   =
     1)
>>    (XEN) ACPI: MCFG 1384E0000, 003C (r1 BOCHS  BXPCMCFG        1 BXPC   =
     1)
>>    (XEN) ACPI: SPCR 1384D0000, 0050 (r2 BOCHS  BXPCSPCR        1 BXPC   =
     1)
>>    (XEN) Unsupported FADT revision 5.1, should be 6.0+, will disable ACPI
>>    (XEN) acpi_boot_table_init: FADT not found (-22)
>>    (XEN) Domain heap initialised
>>    (XEN) Booting using Device Tree
>>    (XEN) Platform: Generic System
>>    (XEN)
>>    (XEN) ****************************************
>>    (XEN) Panic on CPU 0:
>>    (XEN) Unable to find compatible GIC in the device tree
>>    (XEN) ****************************************
>>    (XEN)
>>    (XEN) Reboot in five seconds...
>>=20
>> Despite saying it is going to reboot it never manages to. Any idea how
>> it is trying to reset the system?
>
> This is a bit of chicken and eggs problem. To know the reset method, you=
=20
> need to parse the ACPI tables. As we can't parse then we don't know the=20
> reset method. So, Xen will just do an infinite loop.

Well you do get some ACPI tables - downgrading the minimum at least
restores the reset method detection. I wonder if it would be worth
defaulting to PSCI if you don't know rather than hang indefinitely?

FWIW the failure after that is failing to find the GIC - I'm just
looking at the MADT table parsing now. Why am I getting a sense of
DejaVu?

> It would probably be good to be more forthcoming with the users and say=20
> it will not reboot.
>
> Also, IIRC, the time subsystem is not yet initialized. So it might be=20
> possible to mdelay() doesn't work properly.

Surely that's an architectural subsystem so there is no reason that
couldn't be up and running.

>
> Cheers,


--=20
Alex Benn=C3=A9e

