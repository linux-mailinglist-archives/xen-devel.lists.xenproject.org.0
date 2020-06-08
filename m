Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1451F1396
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 09:30:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiCED-0002Cb-63; Mon, 08 Jun 2020 07:29:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p0X=7V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiCEC-0002CW-IU
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 07:29:52 +0000
X-Inumbo-ID: d6e92dd2-a959-11ea-9b55-bc764e2007e4
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6e92dd2-a959-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 07:29:51 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id r15so15416916wmh.5
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=rXS4JTeUY9K/JTTPim0861F+6JiaK2fAoudEh3BjvDw=;
 b=V+tlTwY9mGMWHb8OL92aFTV1SdcrVSPEAIRxfxsCZYM7fQJY67nwjopiwnpWrJ+CaV
 4g2P4g3D8ysGb0iLmLz5cB5lcyuBQVXtWB99xCHFMiINog0TzL1ldufCd85Ook3MAl5T
 2ubAOZk/fPx61z82mQamdsIrfQS1bBAGsWa1KgdW8tgnYQETIhvt/IVW2RKSBZxxahjF
 TYxeLsfGxcdRHvQYXaZKkXvix4PpVuN2KvUJXrxCbvVNJJwpqlCxC4K0VJHQ42lNuWxl
 3TzKOQ4SLE5O7B987JtN3ARZnudRGd36MPxbp9v+x6OsSPnB2m6/pPl25rNGGK/fSF3s
 dIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:references:in-reply-to:subject
 :date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=rXS4JTeUY9K/JTTPim0861F+6JiaK2fAoudEh3BjvDw=;
 b=aHX8XQW2SfTmy6Ewb/8FKSrBAnRZCYjj5he0M3W6mttdJ05g6dw4V0EMng+i25b6sp
 IvOnCSHGPiHd8sWeLEtj9a6mOK7koquTrgFMsWOEiCyXitxXpiDNT6xZVqDFKMDwTTvI
 dwjcW+zIWN8LHz/s/oJZx40BtYIk+TqfedDzTzhNFr46Guv2wjfC16IktUerySw89u87
 rPF3WmWn4cwChKC0dGqBnnUscUAmDgjLG0Fazv9sH6EUetX+fLQLQeYAEkMbFYYr0ACK
 2Ragf1CR+dUB1n9FwsI57sX6liAaBVA4Tv66OeoTysWc7djt4epwOXmd4f333sPYxjKg
 u0Aw==
X-Gm-Message-State: AOAM533++6hNeVdBmuq4h5D3nUA8ZF88zVQ4lbKZE7mkK5wW9T6gUCF7
 Rl/VER67KRi+qHmOUMiFVsR1BE1V8ac=
X-Google-Smtp-Source: ABdhPJx9y49rA700HBd9pOOBFPrqL0CbBLpEmA64sue272XbgM1vCelFSbU9I//e0MWCUBCi/YyXSA==
X-Received: by 2002:a05:600c:2110:: with SMTP id
 u16mr14810817wml.26.1591601390723; 
 Mon, 08 Jun 2020 00:29:50 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id b81sm23349934wmc.5.2020.06.08.00.29.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 00:29:49 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?B?J+KAjeWwj+Wkqic=?= <nospam@kota.moe>,
 <xen-devel@lists.xenproject.org>
References: <CACsxjPY6Zhau786kB8N0f+ejgT7VQ+MFFZOcayjmqt_ecOjuVg@mail.gmail.com>
In-Reply-To: <CACsxjPY6Zhau786kB8N0f+ejgT7VQ+MFFZOcayjmqt_ecOjuVg@mail.gmail.com>
Subject: RE: xenforeignmemory fails to map PCI device memory with "Invalid
 Argument" error
Date: Mon, 8 Jun 2020 08:29:48 +0100
Message-ID: <001b01d63d66$97f0fd80$c7d2f880$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJMiBb2MW2/R0K83Fy7lBrWOICjaKfhuzVQ
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
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
???
> Sent: 07 June 2020 23:19
> To: xen-devel@lists.xenproject.org
> Subject: xenforeignmemory fails to map PCI device memory with "Invalid =
Argument" error
>=20
> Hi xen-devel,
>=20
> I'm trying to read HVM guest PCI memory from Dom0 using the =
xenforeignmemory
> library, but it's consistently failing with "Invalid Argument", no =
matter
> which PCI device I try.
> However, if I try to map in regular (non-device) memory, it seems to =
work fine.
>=20
> Do you know why I can't seem to map in guest PCI memory? Am I meant to =
be
> mapping in the memory in some other way instead?

This behaviour is not surprising...

>=20
> (Background: I'm trying to port Looking Glass to Xen:
> https://forum.level1techs.com/t/looking-glass-on-xen/158089)
>=20
> Some example code to demonstrate the problem:
>=20
>     #include <stdint.h>
>     #include <stdio.h>
>     #include <sys/mman.h>
>     #include <unistd.h>
>     #include <xenforeignmemory.h>
>=20
>     void map(xenforeignmemory_handle* xfm, uint32_t dom, uintptr_t =
addr) {
>         xen_pfn_t frame =3D addr / sysconf(_SC_PAGESIZE);
>         void* out =3D xenforeignmemory_map(xfm, dom, PROT_READ |
> PROT_WRITE, 1, &frame, NULL);
>         if (!out) {
>             printf("Failed to map Dom%u's 0x%08lx: %m\n", dom, addr);
>             return;
>         }
>=20
>         printf("Dom%u 0x%08lx: 0x%08lx 0x%08lx 0x%08lx 0x%08lx\n",
>             dom, addr,
>             ((unsigned long*)out)[0],
>             ((unsigned long*)out)[1],
>             ((unsigned long*)out)[2],
>             ((unsigned long*)out)[3]
>         );
>         xenforeignmemory_unmap(xfm, out, 1);
>     }
>=20
>     int main(void) {
>         xenforeignmemory_handle* xfm =3D xenforeignmemory_open(NULL, =
0);
>         if (!xfm) {
>             perror("xenforeignmemory_open");
>             return 1;
>         }
>=20
>         // Regular memory - works fine
>         map(xfm, 3, 0x10000000);
>=20
>         // PCI device memory - errors with "Invalid Argument"
>         map(xfm, 3, 0xf2311000);
>=20
>         xenforeignmemory_close(xfm);
>         return 0;
>     }
>=20
> In this case, Dom 3's 0xf2311000 belongs to the emulated SATA device:

...since, as you say here, the address belongs to an *emulated* device. =
To emulate the device, BAR accesses need to be trapped and this is done =
by leaving 'holes' in the guest P2M at those addresses such than =
accesses cause page faults, at which point the faulting instruction can =
be examined to determine the nature of the access.

  Paul

>=20
>     $ sudo xl qemu-monitor-command 3 'info pci'
>     ...snip...
>       Bus  0, device   5, function 0:
>         SATA controller: PCI device 8086:2922
>           PCI subsystem 1af4:1100
>           IRQ 0.
>           BAR4: I/O at 0xc260 [0xc27f].
>           BAR5: 32 bit memory at 0xf2311000 [0xf2311fff].
>           id "ahci0"
>     ...snip...



