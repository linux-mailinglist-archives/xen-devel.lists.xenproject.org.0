Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C621B2A3285
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 19:06:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17873.42628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZeCx-0001V4-GP; Mon, 02 Nov 2020 18:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17873.42628; Mon, 02 Nov 2020 18:05:31 +0000
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
	id 1kZeCx-0001Uf-D3; Mon, 02 Nov 2020 18:05:31 +0000
Received: by outflank-mailman (input) for mailman id 17873;
 Mon, 02 Nov 2020 18:05:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NLV7=EI=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kZeCv-0001Ua-OK
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 18:05:29 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5443ecca-c200-4938-a142-862bbd67ac79;
 Mon, 02 Nov 2020 18:05:28 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b1so18549791lfp.11
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2020 10:05:28 -0800 (PST)
Received: from [100.64.112.11] (ll-18.209.223.85.sovam.net.ua. [85.223.209.18])
 by smtp.gmail.com with ESMTPSA id p18sm2522064lfa.111.2020.11.02.10.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 10:05:26 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=NLV7=EI=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kZeCv-0001Ua-OK
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 18:05:29 +0000
X-Inumbo-ID: 5443ecca-c200-4938-a142-862bbd67ac79
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5443ecca-c200-4938-a142-862bbd67ac79;
	Mon, 02 Nov 2020 18:05:28 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b1so18549791lfp.11
        for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2020 10:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=91giC+mxG8WeUfryWnpYaUZpwW48FmL3KEYlVuhHF7U=;
        b=n6jRcVN58UPalHAKowzUVJc9OXrWkDYUlX/CR11eia36ZH3d9KTUTeEZtElCFdNVa4
         vdfU+UREXBr10VRJL0nFK4f2bVY74gXLgdJ6xg73LX+gM0kd7JwbG6UrxgWKx621Rfew
         sAU29X6Iz/OuedqszErCrveWCHTgtMr3vg2wSp3FH2HyILsB9LTKOocJUglwpBJTd+wl
         2t/Aqz+zxunvqJhdjUOTYf0aGvMwKmZ12amQo3CMB0DTIEr7RFPDybuIwMHGpMtatNC7
         UxocncEGqXk/UyivawPnArL+Hr3KLqQQTmSVGFnXbIlQLzwATnUGkioPcu2fGapM8alK
         d7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=91giC+mxG8WeUfryWnpYaUZpwW48FmL3KEYlVuhHF7U=;
        b=JHuE7B3gayX+NnM47Z3PhDVL+bi1f+yvrxm3azz2NSsHVA3m/N6espAGkTjJDbaIxv
         XhE2Wdxc1f1E643laS60QxN1BhHSgWCB9H2D0ndyvLMPVgUrst0xBexDMvCpgCAxm33f
         XFhbY5GB34JPFnSfCY+TE0PxzoHSMrwakhIGdxRBiVYa/okUEhRJlEzV/iXYdrSMf+/f
         ExQwzG/Txfy3zawRfMURT7GBRAALyXSGbDWwc7iu4hi1aw8jvWtkNKmMjn90mhsi7Mhm
         yNEgCOmKBEOEgO/qoTIuGFZy4zbJb/vg5VAENauSIL5YCbZW6aIyABh81/ZkLKJoTY+/
         91lg==
X-Gm-Message-State: AOAM530OYkLfifsZ1IqJe0O283l2XthpQ8+7WquOOB1muY36FY3XAHI1
	RJOPRVnq/aatxIuMxwP5TnE=
X-Google-Smtp-Source: ABdhPJz6/Y3JNtUGzP1ugZpfTXGYJruVrvS7FAcwSI4QdDE0pf+BpiUhypoyDDyW74SbvTwI36fJBQ==
X-Received: by 2002:ac2:5938:: with SMTP id v24mr5736541lfi.228.1604340327677;
        Mon, 02 Nov 2020 10:05:27 -0800 (PST)
Received: from [100.64.112.11] (ll-18.209.223.85.sovam.net.ua. [85.223.209.18])
        by smtp.gmail.com with ESMTPSA id p18sm2522064lfa.111.2020.11.02.10.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 10:05:26 -0800 (PST)
Subject: Re: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
To: Wei Chen <Wei.Chen@arm.com>
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <Julien.Grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Tim Deegan <tim@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com>
 <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com>
 <alpine.DEB.2.21.2010291252410.12247@sstabellini-ThinkPad-T480s>
 <CAPD2p-mH0Hi+JOUB-mt+aZR_gN86EZCpnMPTww0ErMESTwZ=AA@mail.gmail.com>
 <CAA93ih3Z-zxQ33gvr2C43i0J5XP3OBgUhTyMcwhe9zVj-uOONA@mail.gmail.com>
 <CAPD2p-=2UimQy6VHKw1FgyVi2R94Ux_HFdPYk7=FR3KWSEqiHw@mail.gmail.com>
 <AM0PR08MB3747802302FE70971AE91F6F9E100@AM0PR08MB3747.eurprd08.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <22edd064-bd78-ba8e-6537-820a929e21e6@gmail.com>
Date: Mon, 2 Nov 2020 20:05:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB3747802302FE70971AE91F6F9E100@AM0PR08MB3747.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 02.11.20 09:23, Wei Chen wrote:
> Hi Oleksandr,

Hi Wei.


>
> Thanks for the sharing of virtio-disk backend. I have tested it on arm FVP_base platform.
> We used domain-0 to run virtio disk backend. The backend disk is a loop device.
>      "virtio_disks": [
>          {
>              "backend_domname": "Domain-0",
>              "devid": 0,
>              "disks": [
>                  {
>                      "filename": "/dev/loop0"
>                  }
>              ]
>          }
>      ],
>
> It works fine and I've pasted some logs:
>
> -------------------------------------------
> Domain-0 logs:
> main: read backend domid 0
> (XEN) gnttab_mark_dirty not implemented yet
> (XEN) domain_direct_pl011_init for domain#2
> main: read frontend domid 2
>    Info: connected to dom2
>
> demu_seq_next: >XENSTORE_ATTACHED
> demu_seq_next: domid = 2
> demu_seq_next: filename[0] = /dev/loop0
> demu_seq_next: readonly[0] = 0
> demu_seq_next: base[0]     = 0x2000000
> demu_seq_next: irq[0]      = 33
> demu_seq_next: >XENCTRL_OPEN
> demu_seq_next: >XENEVTCHN_OPEN
> demu_seq_next: >XENFOREIGNMEMORY_OPEN
> demu_seq_next: >XENDEVICEMODEL_OPEN
> demu_initialize: 2 vCPU(s)
> demu_seq_next: >SERVER_REGISTERED
> demu_seq_next: ioservid = 0
> demu_seq_next: >RESOURCE_MAPPED
> demu_seq_next: shared_iopage = 0xffffae6de000
> demu_seq_next: buffered_iopage = 0xffffae6dd000
> demu_seq_next: >SERVER_ENABLED
> demu_seq_next: >PORT_ARRAY_ALLOCATED
> demu_seq_next: >EVTCHN_PORTS_BOUND
> demu_seq_next: VCPU0: 3 -> 7
> demu_seq_next: VCPU1: 5 -> 8
> demu_seq_next: >EVTCHN_BUF_PORT_BOUND
> demu_seq_next: 0 -> 9
> demu_register_memory_space: 2000000 - 20001ff
>    Info: (virtio/mmio.c) virtio_mmio_init:290: mailto:virtio-mmio.devices=0x200@0x2000000:33
> demu_seq_next: >DEVICE_INITIALIZED
> demu_seq_next: >INITIALIZED
> IO request not ready
> IO request not ready
>
> ----------------
> Dom-U logs:
> [    0.491037] xen:xen_evtchn: Event-channel device installed
> [    0.493600] Initialising Xen pvcalls frontend driver
> [    0.516807] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    0.525565] cacheinfo: Unable to detect cache hierarchy for CPU 0
> [    0.562275] brd: module loaded
> [    0.595300] loop: module loaded
> [    0.683800] virtio_blk virtio0: [vda] 131072 512-byte logical blocks (67.1 MB/64.0 MiB)
> [    0.684000] vda: detected capacity change from 0 to 67108864
>
>
> / # dd if=/dev/vda of=/dev/null bs=1M count=64
> 64+0 records in
> 64+0 records out
> 67108864 bytes (64.0MB) copied, 3.196242 seconds, 20.0MB/s
> / # dd if=/dev/zero of=/dev/vda bs=1M count=64
> 64+0 records in
> 64+0 records out
> 67108864 bytes (64.0MB) copied, 3.704594 seconds, 17.3MB/s
> ---------------------
>
> The read/write seems OK in dom-U. The FVP platform is a emulator, so the performance is no reference.
> We will test it on real hardware like N1SDP.


This is really a good news. Thank you for testing!


-- 
Regards,

Oleksandr Tyshchenko


