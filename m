Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BD327D9CC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 23:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375.1105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNMub-0008SC-3Z; Tue, 29 Sep 2020 21:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375.1105; Tue, 29 Sep 2020 21:11:49 +0000
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
	id 1kNMua-0008Rq-W7; Tue, 29 Sep 2020 21:11:48 +0000
Received: by outflank-mailman (input) for mailman id 375;
 Tue, 29 Sep 2020 21:11:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SVYV=DG=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kNMuZ-0008Rl-Q3
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 21:11:47 +0000
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc5a6334-e781-4026-b080-2fa3586bb1c7;
 Tue, 29 Sep 2020 21:11:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y15so6312495wmi.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 14:11:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c4sm7646558wrp.85.2020.09.29.14.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 14:11:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE6BE1FF7E;
 Tue, 29 Sep 2020 22:11:43 +0100 (BST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SVYV=DG=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kNMuZ-0008Rl-Q3
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 21:11:47 +0000
X-Inumbo-ID: cc5a6334-e781-4026-b080-2fa3586bb1c7
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cc5a6334-e781-4026-b080-2fa3586bb1c7;
	Tue, 29 Sep 2020 21:11:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y15so6312495wmi.0
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 14:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=KlfnmpJFEKVjo/rT+Sjq9sS50kADaeGjXSvbxt3os7A=;
        b=lJVPjxmbAnfLXPQwnzPWVTEh8NvAK7IuBiOkdaInAlRiSAPH0hcf/1FEwm+I6+YaKq
         V9eHb55iG9U9rcSeCG1+7SYZ9jAF11OLk16JUPI5oLI0uX3GAg2uVpUad01S6R9SZ+jv
         SbFHBsOcfc79+XDBfxrknzTki00jwyGDMNseKEGqAYpdVRtskw7LtuF8+0fpoInBv7QP
         6nDl+qadBQPIKk8SqgOo9AH+jaNS1DhyYh3Jke0nuj+e0kJGb50Vmi0Ko/m2CCO3VbQo
         N2nKYDh/Lfdogv+7jdSbGaHuriglqVXXeGSnntSUdZlnP9KXufgQf3LZ66LwTerEpsYH
         IhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=KlfnmpJFEKVjo/rT+Sjq9sS50kADaeGjXSvbxt3os7A=;
        b=DgEBj+yI/yonvxKNMYAXd5vYROumgljbYNB7KTQexlFGQuWCFFyIIeEDg+fTdbDnhs
         Z4X0ftVLaapP/Tyr6FRqh8GCDaavkAFS7Xlc3+2LxrjQaCrRDpjWrMRpxn9cGeix0uQm
         wlE6ZYjTsM7i9DPAGkDY911ngshOh3PtJIPJ278yFqxG4mFr+GAKSFQC6bPyXhgZFUwq
         7Jtq/H0p9kGaZHqTFpFk1tqRW/aqlOaK5X07mdVmu4hbi4h0ax6cHB77M3eQet7fekID
         s94eKPsj7B7M5JNqdvoB9js1CectwVEU9nU952vgUxxbwSHSL5k5iwOMZaPwHXMnspbu
         TVlg==
X-Gm-Message-State: AOAM533iGwNR2ec1MtqDVe0RZTVqMAOgttxNvZ9DmVgXZy1ClVeh4Md0
	0OvetTO+lgni77XfBFOGc3B0bQ==
X-Google-Smtp-Source: ABdhPJzqdy88nT3gs77Q4Me+NJg+aFknmtBcwXOEx3NBLX/FyvQxW4u7au7b9iy3yixx3yN1bUecwg==
X-Received: by 2002:a7b:c44b:: with SMTP id l11mr6436479wmi.52.1601413905949;
        Tue, 29 Sep 2020 14:11:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c4sm7646558wrp.85.2020.09.29.14.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 14:11:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EE6BE1FF7E;
	Tue, 29 Sep 2020 22:11:43 +0100 (BST)
References: <20200926205542.9261-1-julien@xen.org>
 <87k0wcppnj.fsf@linaro.org> <5afbce1c-0c45-4b8c-771a-f83b91328e4a@xen.org>
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
In-reply-to: <5afbce1c-0c45-4b8c-771a-f83b91328e4a@xen.org>
Date: Tue, 29 Sep 2020 22:11:43 +0100
Message-ID: <87d024p9tc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Julien Grall <julien@xen.org> writes:

> Hi Alex,
>
> On 29/09/2020 16:29, Alex Benn=C3=A9e wrote:
>>=20
>> Julien Grall <julien@xen.org> writes:
>>=20
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Hi all,
>>>
>>> Xen on ARM has been broken for quite a while on ACPI systems. This
>>> series aims to fix it.
>>>
>>> Unfortunately I don't have a system with ACPI v6.0 or later (QEMU seems
>>> to only support 5.1). So I did only some light testing.
>>=20
>> I was hoping to get more diagnostics out to get it working under QEMU
>> TCG so I think must of missed a step:
>>=20
>>    Loading Xen 4.15-unstable ...
>>    Loading Linux 4.19.0-11-arm64 ...
>>    Loading initial ramdisk ...
>>    Using modules provided by bootloader in FDT
>>    Xen 4.15-unstable (c/s Sat Sep 26 21:55:42 2020 +0100 git:72f3d495d0)=
 EFI loader
>>    ...silence...
>>=20
>> I have a grub installed from testing on a buster base:
>>=20
>>    dpkg --status grub-arm64-efi
>>    Version: 2.04-8
>>=20
>> With:
>>=20
>>    GRUB_CMDLINE_LINUX_DEFAULT=3D""
>>    GRUB_CMDLINE_LINUX=3D"console=3DttyAMA0"
>>    GRUB_CMDLINE_LINUX_XEN_REPLACE=3D"console=3Dhvc0 earlyprintk=3Dxen"
>>    GRUB_CMDLINE_XEN=3D"loglvl=3Dall guest_loglvl=3Dall com1=3D115200,8n1=
,0x3e8,5console=3Dcom1,vg"
>>=20
>> And I built Xen with --enable-systemd and tweaked the hypervisor .config:
>>=20
>>    CONFIG_EXPERT=3Dy
>>    CONFIG_ACPI=3Dy
>>=20
>> So any pointers to make it more verbose would be helpful.
>
> The error is hapenning before Xen setup the console. You can get early=20
> output on QEMU if you rebuild Xen with the following .config options:
>
> CONFIG_DEBUG=3Dy
> CONFIG_EARLY_UART_CHOICE_PL011=3Dy
> CONFIG_EARLY_UART_PL011=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_UART_BASE_ADDRESS=3D0x09000000
> CONFIG_EARLY_UART_PL011_BAUD_RATE=3D0
> CONFIG_EARLY_PRINTK_INC=3D"debug-pl011.inc"

OK I can see it fails on the ACPI and then tries to fall back to FDT and
then fails to find the GIC:

  (XEN) CMDLINE[00000000f7bbe000]:chosen placeholder root=3DUUID=3Dcf00cd3a=
-066b-4146-bedf-f811d3343077 ro console=3Dhvc0 earlyprintk=3Dxen
  (XEN)
  (XEN) Command line: placeholder loglvl=3Dall guest_loglvl=3Dall com1=3D11=
5200,8n1,0x3e8,5console=3Dcom1,vg no-real-mode edd=3Doff
  (XEN) parameter "placeholder" unknown!
  (XEN) parameter "no-real-mode" unknown!
  (XEN) parameter "edd" unknown!
  (XEN) ACPI: RSDP 138560000, 0024 (r2 BOCHS )
  (XEN) ACPI: XSDT 138550000, 004C (r1 BOCHS  BXPCFACP        1       10000=
13)
  (XEN) ACPI: FACP 138510000, 010C (r5 BOCHS  BXPCFACP        1 BXPC       =
 1)
  (XEN) ACPI: DSDT 138520000, 14A6 (r2 BOCHS  BXPCDSDT        1 BXPC       =
 1)
  (XEN) ACPI: APIC 138500000, 018C (r3 BOCHS  BXPCAPIC        1 BXPC       =
 1)
  (XEN) ACPI: GTDT 1384F0000, 0060 (r2 BOCHS  BXPCGTDT        1 BXPC       =
 1)
  (XEN) ACPI: MCFG 1384E0000, 003C (r1 BOCHS  BXPCMCFG        1 BXPC       =
 1)
  (XEN) ACPI: SPCR 1384D0000, 0050 (r2 BOCHS  BXPCSPCR        1 BXPC       =
 1)
  (XEN) Unsupported FADT revision 5.1, should be 6.0+, will disable ACPI
  (XEN) acpi_boot_table_init: FADT not found (-22)
  (XEN) Domain heap initialised
  (XEN) Booting using Device Tree
  (XEN) Platform: Generic System
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) Unable to find compatible GIC in the device tree
  (XEN) ****************************************
  (XEN)
  (XEN) Reboot in five seconds...

Despite saying it is going to reboot it never manages to. Any idea how
it is trying to reset the system?

--=20
Alex Benn=C3=A9e

