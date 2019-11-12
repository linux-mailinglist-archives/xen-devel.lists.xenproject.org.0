Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EE8F901D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 14:02:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUVl1-0008J4-Ou; Tue, 12 Nov 2019 12:58:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BaEJ=ZE=ts.fujitsu.com=dietmar.hahn@srs-us1.protection.inumbo.net>)
 id 1iUVkz-0008Iz-2E
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 12:58:53 +0000
X-Inumbo-ID: 25ca8660-054c-11ea-adbe-bc764e2007e4
Received: from mail1.bemta26.messagelabs.com (unknown [85.158.142.5])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25ca8660-054c-11ea-adbe-bc764e2007e4;
 Tue, 12 Nov 2019 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ts.fujitsu.com;
 s=200619tsfj; t=1573563519; i=@ts.fujitsu.com;
 bh=ltDtoF5sm7Hl6XU9kUjuKGhRrEU3P7GZ2TDCJ4VbWxI=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=bobZqros6ixNrMFqrXWVhMdSg/CL/kBACTQZaMMIo5f2G/tpwicYabHBobAbdPgKv
 9Z+bO9qQisZ+1g8AOutdz607J5JA3TG55tZKiWTboYM1y3vLkzeTfIf+JsjSVaV3AZ
 dC87/S3U3VdC9ectw/TCAxsnDUodNdesLJ6P76+91JkxieHMZhcNOeNhx5QsVzpI7/
 YJTcUHr2FmXIFpcaJ4T9VsVTrPBuZa3z4evB4utJHznCr6U1owioWeENImZ/7LvS3N
 fz6VE/qjVviIHcAlFanWw92zdOT6MbGwXeEcM2i3uU9PzIDAIhNXhFEEF+pS3Co698
 N6zEnEaiuYGLQ==
Received: from [85.158.142.101] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-central-1.aws.symcld.net id E9/15-25221-F7CAACD5;
 Tue, 12 Nov 2019 12:58:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleJIrShJLcpLzFFi42Kxs+EI0a1dcyr
 W4Nl5Q4vFj3exW3zfMpnJgcnj9eQJjB6HP1xhCWCKYs3MS8qvSGDNeP3+FUvB3rlcFTenPWJu
 YDx7mKOLkYtDSGAOo8S5ubdYIJwFjBIfG9qYuxg5OdgEDCR2vToEZosI6Eo8W/CMDcRmFnCVW
 PnwKQuILSyQItH7bAOQzcHBIqAqsWsqJ0iYV8BQ4va5u2CtnAJ2EptermQFsYUEkiXetR9khq
 gRlDg58wkLxEgXiWtv29khbHmJjsuNrBMYeWchKZuFpGwWkjJMto7Egt2f2GYBXcQsYC2xcH4
 6RFhbYtnC18wQtqPEhrnNLAsYOVYxWiQVZaZnlOQmZuboGhoY6BoaGusa6JpZ6iVW6SbqpZbq
 JqfmlRQlAiX1EsuL9Yorc5NzUvTyUks2MQKjIKWQwXUH4+xPb/UOMUpyMCmJ8ip2n4oV4kvKT
 6nMSCzOiC8qzUktPsQow8GhJME7bxVQTrAoNT21Ii0zBxiRMGkJDh4lEd7pIGne4oLE3OLMdI
 jUKUZ7jsvX5y1i5lj/H0SeXLUESG6eu3QRsxBLXn5eqpQ475OVQG0CIG0ZpXlwQ2EJ5BKjrJQ
 wLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5fIMt5MvNK4Ha/AjqLCeisA2ePgZxVkoiQkmpgchWL
 OFyzSPbH3F2x/98HPbWeK91hxSKZylvppBXytkFmwp+f9eUrbS/cEU45ukzjcE1sxfGM+onvI
 6z+rF4fYOr+jdHswzLpbUH3nMWnd29pWrhOic9mw3kx9nX396rVGS1NmvI5T6bn1f7boR7p7C
 E/zxlq9LkeubTXdFlu/CfnCrX/nz+/WlfQKhz5fN+Wy9t3xab2lV+U0mkP8jx3PvTDwajwXaL
 f2O/f13PoW/7jvRyzxP/og7Wfj29Okr3Y9Gmxj9XdiMV3Ig/ou1knC60t8bvg3Nt8xefzdK91
 laJ503s4DH7Ipa75VSFgdmL2lq8HLil8cPxopffQyj76LPPUJykRG45PZql+9zTOQ4mlOCPRU
 Iu5qDgRAE+/mxGbAwAA
X-Env-Sender: dietmar.hahn@ts.fujitsu.com
X-Msg-Ref: server-3.tower-226.messagelabs.com!1573563517!9782!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22624 invoked from network); 12 Nov 2019 12:58:37 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-3.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Nov 2019 12:58:37 -0000
Received: from sanpedro.mch.fsc.net ([172.17.20.6])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with SMTP id xACCwaYa002901;
 Tue, 12 Nov 2019 12:58:36 GMT
Received: from amur.mch.fsc.net (unknown [10.172.102.131])
 by sanpedro.mch.fsc.net (Postfix) with ESMTP id 7E7A39D00CDA;
 Tue, 12 Nov 2019 13:58:27 +0100 (CET)
From: Dietmar Hahn <dietmar.hahn@ts.fujitsu.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Date: Tue, 12 Nov 2019 13:58:27 +0100
Message-ID: <2273861.R55spjjXzb@amur.mch.fsc.net>
In-Reply-To: <80423bf6-ceea-0b48-0618-4e7a6ca75cbb@citrix.com>
References: <3020959.C8KU84B5rM@amur.mch.fsc.net>
 <80423bf6-ceea-0b48-0618-4e7a6ca75cbb@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart1751006.3zM9JSGCaE"
Content-Transfer-Encoding: 7Bit
Subject: Re: [Xen-devel] [xen-4.13.0-rc] kexec/kdump failure with cpu
 Intel(R) Xeon(R) Gold 6242 CPU
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.

--nextPart1751006.3zM9JSGCaE
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 12. November 2019, 13:17:29 CET schrieb Andrew Cooper:
> On 12/11/2019 11:38, Dietmar Hahn wrote:
> > Hi,
> >
> > on a new machine with cpu Intel(R) Xeon(R) Gold 6242 CPU the kexec/kdump
> > doesn't work with current xen-4.13.0-rc.
> > The last output of the xen console is:
> >
> > (XEN) Hardware Dom0 crashed: Executing kexec image on cpu5
> > (XEN) Shot down all CPUs
> >
> > After short delay the system reboots.
> >
> > It seems the fixes mentioned in the thread
> > https://lists.xenproject.org/archives/html/xen-devel/2019-10/msg01948.html
> > aren't enough.
> >
> > I built xen-4.11 with the patches but no success.
> > On an older system with xen-4.4 the kdump works.
> >
> > Any help is appreciated.
> 
> Do you have purgatory serial enabled?

Attached is the serial log from the boot.
If wanted I can add more debug flags.

> 
> By any chance does Xen revert back to xAPIC mode and Linux configure
> x2apic mode?  There are some interrupt routing issues on those CPUs with
> mismatched x(2)apic settings.

There are also problems with kdump on native linux at least with the
vmlinuz-4.12.14 kernel from SLES12SP4.

Dietmar.

> 
> ~Andrew

--nextPart1751006.3zM9JSGCaE
Content-Disposition: attachment; filename="console-log.txt"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; name="console-log.txt"

(XEN) Xen version 4.13.0-rc (hahn@mch.fsc.net) (gcc (SUSE Linux) 7.4.1 2019=
0905 [gcc-7-branch revision 275407]) debug=3Dy  Mon Nov 11 13:48:47 CET 2019
(XEN) Latest ChangeSet: Mon Oct 14 11:31:31 2019 +0100 git:518c935fac
(XEN) build-id: d601f27e7e17c83cdb43ffb65877ea09910b4444
(XEN) Console output is synchronous.
(XEN) Bootloader: GRUB2 2.02
(XEN) Command line: vga=3Dgfx-1024x768x16 crashkernel=3D252M<4G console=3Dc=
om1 com1=3D38400 sync_console
(XEN) Xen image load base address: 0
(XEN) Video information:ys to select which entry is highlighted.           =
    =20
(XEN)  VGA is graphics mode 1024x768, 16 bpp 'p' to enter a                =
    =20
(XEN)  VBE/DDC methods: V2; EDID transfer time: 1 seconds                  =
    =20
(XEN) Disc information:                                                    =
    =20
(XEN)  Found 6 MBR signatures                                              =
    =20
(XEN)  Found 6 EDD information structuresutomatically in 1 seconds.        =
    =20
(XEN) Xen-e820 RAM map:                                                    =
    =20
(XEN)  0000000000000000 - 0000000000099400 (usable)                        =
   =20
(XEN)  0000000000099400 - 00000000000a0000 (reserved)
(XEN)  00000000000e0000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 0000000059a24000 (usable)
(XEN)  0000000059a24000 - 0000000059a25000 (reserved)
(XEN)  0000000059a25000 - 0000000064bec000 (usable)
(XEN)  0000000064bec000 - 0000000067600000 (reserved)
(XEN)  0000000067600000 - 0000000067b34000 (ACPI data)
(XEN)  0000000067b34000 - 000000006d72d000 (ACPI NVS)
(XEN)  000000006d72d000 - 000000006f28c000 (reserved)
(XEN)  000000006f28c000 - 000000006f800000 (usable)
(XEN)  000000006f800000 - 0000000090000000 (reserved)
(XEN)  00000000fd000000 - 00000000fe800000 (reserved)
(XEN)  00000000fed20000 - 00000000fed45000 (reserved)
(XEN)  00000000ff000000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 0000002080000000 (usable)
(XEN) New Xen image base address: 0x64400000
(XEN) Kdump: 252MB (258048kB) at 0x49e00000
(XEN) ACPI: RSDP 000F05A0, 0024 (r2 FUJ   )
(XEN) ACPI: XSDT 677610C8, 0114 (r1 FUJ    D3753-C1 11200000 AMI     10013)
(XEN) ACPI: FACP 67A53B50, 0114 (r6 FUJ    D3753-C1 11200000 INTL 20091013)
(XEN) ACPI: DSDT 67761270, 2F28E0 (r2 FUJ    D3753-C1 11200000 INTL 2009101=
3)
(XEN) ACPI: FACS 6D6E9080, 0040
(XEN) ACPI: FPDT 67A53C68, 0044 (r1 FUJ    D3753-C1 11200000 AMI     10013)
(XEN) ACPI: FIDT 67A53CB0, 009C (r1    FUJ D3753-C1 11200000 AMI     10013)
(XEN) ACPI: SPMI 67A53D50, 0041 (r5 FUJ    D3753-C1        0 AMI.        0)
(XEN) ACPI: SSDT 67A53D98, 046C (r2  INTEL ADDRXLAT        1 INTL 20140828)
(XEN) ACPI: MCEJ 67A54208, 0130 (r1 FUJ    D3753-C1        2 INTL 20091013)
(XEN) ACPI: MCFG 67A54338, 003C (r1    FUJ D3753-C1 11200000 MSFT       97)
(XEN) ACPI: HPET 67A54378, 0038 (r1 FUJ    D3753-C1        1 INTL 20091013)
(XEN) ACPI: APIC 67A543B0, 16DE (r3 FUJ    D3753-C1        0 INTL 20091013)
(XEN) ACPI: MIGT 67A55A90, 0040 (r1 FUJ    D3753-C1        0 INTL 20091013)
(XEN) ACPI: MSCT 67A55AD0, 0090 (r1 FUJ    D3753-C1        1 INTL 20091013)
(XEN) ACPI: PCAT 67A55B60, 00C8 (r2 FUJ    D3753-C1        2 INTL 20091013)
(XEN) ACPI: PCCT 67A55C28, 006E (r1 FUJ    D3753-C1        2 INTL 20091013)
(XEN) ACPI: RASF 67A55C98, 0030 (r1 FUJ    D3753-C1        1 INTL 20091013)
(XEN) ACPI: SLIT 67A55CC8, 042C (r1 FUJ    D3753-C1        1 INTL 20091013)
(XEN) ACPI: SRAT 67A560F8, 2D30 (r3 FUJ    D3753-C1        2 INTL 20091013)
(XEN) ACPI: SVOS 67A58E28, 0032 (r1 FUJ    D3753-C1        0 INTL 20091013)
(XEN) ACPI: WDDT 67A58E60, 0040 (r1 FUJ    D3753-C1        0 INTL 20091013)
(XEN) ACPI: OEM4 67A58EA0, A27C4 (r2  INTEL CPU  CST     3000 INTL 20140828)
(XEN) ACPI: SSDT 67AFB668, 33990 (r2  INTEL SSDT  PM     4000 INTL 20140828)
(XEN) ACPI: SSDT 67B2EFF8, 0943 (r2 FUJ    D3753-C1        0 INTL 20091013)
(XEN) ACPI: SPCR 67B2F940, 0050 (r2  A M I  APTIO V 11200000 AMI.    5000E)
(XEN) ACPI: SSDT 67B2F990, 2B2E (r2  INTEL SpsNm           2 INTL 20140828)
(XEN) ACPI: DMAR 67B324C0, 0520 (r1 FUJ    D3753-C1        1 INTL 20091013)
(XEN) ACPI: HEST 67B329E0, 00A8 (r1 FUJ    D3753-C1        1 INTL        1)
(XEN) ACPI: BERT 67B32A88, 0030 (r1 FUJ    D3753-C1        1 INTL        1)
(XEN) ACPI: ERST 67B32AB8, 0230 (r1 FUJ    D3753-C1        1 INTL        1)
(XEN) ACPI: EINJ 67B32CE8, 0150 (r1 FUJ    D3753-C1        1 INTL        1)
(XEN) ACPI: SSDT 67B32E38, 0135 (r2 FUJ    Gabi0002        2 INTL 20140828)
(XEN) ACPI: SSDT 67B32F70, 00BB (r2 FUJ    Gabi0001        2 INTL 20140828)
(XEN) System RAM: 130640MB (133776352kB)
(XEN) SRAT: PXM 0 -> APIC 00 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 02 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 04 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 06 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 08 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 0a -> Node 0
(XEN) SRAT: PXM 0 -> APIC 0c -> Node 0
(XEN) SRAT: PXM 0 -> APIC 0e -> Node 0
(XEN) SRAT: PXM 0 -> APIC 10 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 12 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 14 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 16 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 18 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 1a -> Node 0
(XEN) SRAT: PXM 0 -> APIC 1c -> Node 0
(XEN) SRAT: PXM 0 -> APIC 1e -> Node 0
(XEN) SRAT: PXM 1 -> APIC 20 -> Node 1
(XEN) SRAT: PXM 1 -> APIC 22 -> Node 1
(XEN) SRAT: PXM 1 -> APIC 24 -> Node 1
(XEN) SRAT: PXM 1 -> APIC 26 -> Node 1
(XEN) SRAT: PXM 1 -> APIC 28 -> Node 1
(XEN) SRAT: PXM 1 -> APIC 2a -> Node 1
(XEN) SRAT: PXM 1 -> APIC 2c -> Node 1
(XEN) SRAT: PXM 1 -> APIC 2e -> Node 1
(XEN) SRAT: PXM 1 -> APIC 30 -> Node 1
(XEN) SRAT: PXM 1 -> APIC 32 -> Node 1
(XEN) SRAT: PXM 1 -> APIC 34 -> Node 1
(XEN) SRAT: PXM 1 -> APIC 36 -> Node 1
(XEN) SRAT: PXM 1 -> APIC 38 -> Node 1
(XEN) SRAT: PXM 1 -> APIC 3a -> Node 1
(XEN) SRAT: PXM 1 -> APIC 3c -> Node 1
(XEN) SRAT: PXM 1 -> APIC 3e -> Node 1
(XEN) SRAT: PXM 2 -> APIC 40 -> Node 2
(XEN) SRAT: PXM 2 -> APIC 42 -> Node 2
(XEN) SRAT: PXM 2 -> APIC 44 -> Node 2
(XEN) SRAT: PXM 2 -> APIC 46 -> Node 2
(XEN) SRAT: PXM 2 -> APIC 48 -> Node 2
(XEN) SRAT: PXM 2 -> APIC 4a -> Node 2
(XEN) SRAT: PXM 2 -> APIC 4c -> Node 2
(XEN) SRAT: PXM 2 -> APIC 4e -> Node 2
(XEN) SRAT: PXM 2 -> APIC 50 -> Node 2
(XEN) SRAT: PXM 2 -> APIC 52 -> Node 2
(XEN) SRAT: PXM 2 -> APIC 54 -> Node 2
(XEN) SRAT: PXM 2 -> APIC 56 -> Node 2
(XEN) SRAT: PXM 2 -> APIC 58 -> Node 2
(XEN) SRAT: PXM 2 -> APIC 5a -> Node 2
(XEN) SRAT: PXM 2 -> APIC 5c -> Node 2
(XEN) SRAT: PXM 2 -> APIC 5e -> Node 2
(XEN) SRAT: PXM 3 -> APIC 60 -> Node 3
(XEN) SRAT: PXM 3 -> APIC 62 -> Node 3
(XEN) SRAT: PXM 3 -> APIC 64 -> Node 3
(XEN) SRAT: PXM 3 -> APIC 66 -> Node 3
(XEN) SRAT: PXM 3 -> APIC 68 -> Node 3
(XEN) SRAT: PXM 3 -> APIC 6a -> Node 3
(XEN) SRAT: PXM 3 -> APIC 6c -> Node 3
(XEN) SRAT: PXM 3 -> APIC 6e -> Node 3
(XEN) SRAT: PXM 3 -> APIC 70 -> Node 3
(XEN) SRAT: PXM 3 -> APIC 72 -> Node 3
(XEN) SRAT: PXM 3 -> APIC 74 -> Node 3
(XEN) SRAT: PXM 3 -> APIC 76 -> Node 3
(XEN) SRAT: PXM 3 -> APIC 78 -> Node 3
(XEN) SRAT: PXM 3 -> APIC 7a -> Node 3
(XEN) SRAT: PXM 3 -> APIC 7c -> Node 3
(XEN) SRAT: PXM 3 -> APIC 7e -> Node 3
(XEN) SRAT: Node 0 PXM 0 0-80000000
(XEN) SRAT: Node 0 PXM 0 100000000-880000000
(XEN) SRAT: Node 1 PXM 1 880000000-1080000000
(XEN) SRAT: Node 2 PXM 2 1080000000-1880000000
(XEN) SRAT: Node 3 PXM 3 1880000000-2080000000
(XEN) NUMA: Allocated memnodemap from 207cde0000 - 207cde1000
(XEN) NUMA: Using 19 for the hash shift.
(XEN) Domain heap initialised DMA width 32 bits
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 85 (0x55), Stepping 7 (raw 0=
0050657)
(XEN) DMI 2.8 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x508 (32 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:504,1:0], pm1x_evt[1:500,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - 6d6e9080/000000000000000=
0, using 32
(XEN) ACPI:             wakeup_vec[6d6e908c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x02] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x04] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x06] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x08] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x05] lapic_id[0x0a] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x0c] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x07] lapic_id[0x0e] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x08] lapic_id[0x10] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x09] lapic_id[0x12] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0a] lapic_id[0x14] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0b] lapic_id[0x16] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0c] lapic_id[0x18] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0d] lapic_id[0x1a] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0e] lapic_id[0x1c] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0f] lapic_id[0x1e] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x20] lapic_id[0x20] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x21] lapic_id[0x22] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x22] lapic_id[0x24] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x23] lapic_id[0x26] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x24] lapic_id[0x28] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x25] lapic_id[0x2a] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x26] lapic_id[0x2c] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x27] lapic_id[0x2e] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x28] lapic_id[0x30] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x29] lapic_id[0x32] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x2a] lapic_id[0x34] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x2b] lapic_id[0x36] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x2c] lapic_id[0x38] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x2d] lapic_id[0x3a] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x2e] lapic_id[0x3c] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x2f] lapic_id[0x3e] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x40] lapic_id[0x40] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x41] lapic_id[0x42] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x42] lapic_id[0x44] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x43] lapic_id[0x46] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x44] lapic_id[0x48] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x45] lapic_id[0x4a] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x46] lapic_id[0x4c] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x47] lapic_id[0x4e] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x48] lapic_id[0x50] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x49] lapic_id[0x52] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x4a] lapic_id[0x54] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x4b] lapic_id[0x56] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x4c] lapic_id[0x58] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x4d] lapic_id[0x5a] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x4e] lapic_id[0x5c] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x4f] lapic_id[0x5e] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x60] lapic_id[0x60] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x61] lapic_id[0x62] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x62] lapic_id[0x64] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x63] lapic_id[0x66] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x64] lapic_id[0x68] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x65] lapic_id[0x6a] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x66] lapic_id[0x6c] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x67] lapic_id[0x6e] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x68] lapic_id[0x70] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x69] lapic_id[0x72] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x6a] lapic_id[0x74] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x6b] lapic_id[0x76] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x6c] lapic_id[0x78] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x6d] lapic_id[0x7a] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x6e] lapic_id[0x7c] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x6f] lapic_id[0x7e] enabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0xff] dfl edge lint[0x1])
(XEN) ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
(XEN) Overriding APIC driver with bigsmp
(XEN) ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
(XEN) ACPI: IOAPIC (id[0x09] address[0xfec01000] gsi_base[24])
(XEN) IOAPIC[1]: apic_id 9, version 32, address 0xfec01000, GSI 24-31
(XEN) ACPI: IOAPIC (id[0x0a] address[0xfec08000] gsi_base[32])
(XEN) IOAPIC[2]: apic_id 10, version 32, address 0xfec08000, GSI 32-39
(XEN) ACPI: IOAPIC (id[0x0b] address[0xfec10000] gsi_base[40])
(XEN) IOAPIC[3]: apic_id 11, version 32, address 0xfec10000, GSI 40-47
(XEN) ACPI: IOAPIC (id[0x0c] address[0xfec18000] gsi_base[48])
(XEN) IOAPIC[4]: apic_id 12, version 32, address 0xfec18000, GSI 48-55
(XEN) ACPI: IOAPIC (id[0x0f] address[0xfec20000] gsi_base[72])(XEN) IOAPIC[=
5]: apic_id 15, version 32, address 0xfec20000, GSI 72-79
(XEN) ACPI: IOAPIC (id[0x10] address[0xfec28000] gsi_base[80])
(XEN) IOAPIC[6]: apic_id 16, version 32, address 0xfec28000, GSI 80-87
(XEN) ACPI: IOAPIC (id[0x11] address[0xfec30000] gsi_base[88])
(XEN) IOAPIC[7]: apic_id 17, version 32, address 0xfec30000, GSI 88-95
(XEN) ACPI: IOAPIC (id[0x12] address[0xfec38000] gsi_base[96])
(XEN) IOAPIC[8]: apic_id 18, version 32, address 0xfec38000, GSI 96-103
(XEN) ACPI: IOAPIC (id[0x15] address[0xfec40000] gsi_base[120])
(XEN) IOAPIC[9]: apic_id 21, version 32, address 0xfec40000, GSI 120-127
(XEN) ACPI: IOAPIC (id[0x16] address[0xfec48000] gsi_base[128])
(XEN) IOAPIC[10]: apic_id 22, version 32, address 0xfec48000, GSI 128-135
(XEN) ACPI: IOAPIC (id[0x17] address[0xfec50000] gsi_base[136])
(XEN) IOAPIC[11]: apic_id 23, version 32, address 0xfec50000, GSI 136-143
(XEN) ACPI: IOAPIC (id[0x18] address[0xfec58000] gsi_base[144])
(XEN) IOAPIC[12]: apic_id 24, version 32, address 0xfec58000, GSI 144-151
(XEN) ACPI: IOAPIC (id[0x1b] address[0xfec60000] gsi_base[168])
(XEN) IOAPIC[13]: apic_id 27, version 32, address 0xfec60000, GSI 168-175
(XEN) ACPI: IOAPIC (id[0x1c] address[0xfec68000] gsi_base[176])
(XEN) IOAPIC[14]: apic_id 28, version 32, address 0xfec68000, GSI 176-183
(XEN) ACPI: IOAPIC (id[0x1d] address[0xfec70000] gsi_base[184])
(XEN) IOAPIC[15]: apic_id 29, version 32, address 0xfec70000, GSI 184-191
(XEN) ACPI: IOAPIC (id[0x1e] address[0xfec78000] gsi_base[192])
(XEN) IOAPIC[16]: apic_id 30, version 32, address 0xfec78000, GSI 192-199
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Phys.  Using 17 I/O APICs
(XEN) ACPI: HPET id: 0x8086a701 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base 80000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at 80000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) Xen ERST support is initialized.
(XEN) HEST: Table parsing has been initialized
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 224 CPUs (160 hotplug CPUs)
(XEN) IRQ limits: 200 GSI, 12104 MSI/MSI-X
(XEN) Switched to APIC driver x2apic_cluster
(XEN) xstate: size: 0xa88 and states: 0x2ff
(XEN) mce_intel.c:778: MCA Capability: firstbank 0, extended MCE MSR 0, BCA=
ST, SER, LMCE
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features: IBRS/IBPB STIBP L1D_FLUSH SSBD MD_CLEAR IBRS_ALL=
 RDCL_NO SKIP_L1DFL MDS_NO
(XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN)   Xen settings: BTI-Thunk JMP, SPEC_CTRL: IBRS+ SSBD-, Other: IBPB
(XEN)   Support for HVM VMs: MSR_SPEC_CTRL RSB EAGER_FPU MD_CLEAR
(XEN)   Support for PV VMs: MSR_SPEC_CTRL RSB EAGER_FPU MD_CLEAR
(XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (with PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Platform timer is 23.999MHz HPET
(XEN) Detected 2793.552 MHz processor.
(XEN) alt table ffff82d0804761b0 -> ffff82d080482a9c
(XEN) Intel VT-d iommu 14 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 13 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 12 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 11 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 10 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 9 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 8 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 7 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 6 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 5 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 4 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 3 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 2 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 1 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 15 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d Snoop Control enabled.
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
(XEN) Intel VT-d Queued Invalidation enabled.
(XEN) Intel VT-d Interrupt Remapping enabled.
(XEN) Intel VT-d Posted Interrupt not enabled.
(XEN) Intel VT-d Shared EPT tables enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 9
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
(XEN) TSC deadline timer enabled
(XEN) Defaulting to alternative key handling; send 'A' to switch to normal =
mode.
(XEN) Allocated console ring of 512 KiB.
(XEN) mwait-idle: MWAIT substates: 0x2020
(XEN) mwait-idle: v0.4.1 model 0x55
(XEN) mwait-idle: lapic_timer_reliable_states 0xffffffff
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Extended Page Tables (EPT)
(XEN)  - Virtual-Processor Identifiers (VPID)
(XEN)  - Virtual NMI
(XEN)  - MSR direct-access bitmap
(XEN)  - Unrestricted Guest
(XEN)  - APIC Register Virtualization
(XEN)  - Virtual Interrupt Delivery
(XEN)  - Posted Interrupt Processing
(XEN)  - VMCS shadowing
(XEN)  - VM Functions
(XEN)  - Virtualisation Exceptions
(XEN)  - Page Modification Logging
(XEN)  - TSC Scaling
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) alt table ffff82d0804761b0 -> ffff82d080482a9c
(XEN) Brought up 64 CPUs
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 0
(XEN) Adding cpu 3 to runqueue 0
(XEN) Adding cpu 4 to runqueue 0
(XEN) Adding cpu 5 to runqueue 0
(XEN) Adding cpu 6 to runqueue 0
(XEN) Adding cpu 7 to runqueue 0
(XEN) Adding cpu 8 to runqueue 0
(XEN) Adding cpu 9 to runqueue 0
(XEN) Adding cpu 10 to runqueue 0
(XEN) Adding cpu 11 to runqueue 0
(XEN) Adding cpu 12 to runqueue 0
(XEN) Adding cpu 13 to runqueue 0
(XEN) Adding cpu 14 to runqueue 0
(XEN) Adding cpu 15 to runqueue 0
(XEN) Adding cpu 16 to runqueue 1
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 17 to runqueue 1
(XEN) Adding cpu 18 to runqueue 1
(XEN) Adding cpu 19 to runqueue 1
(XEN) Adding cpu 20 to runqueue 1
(XEN) Adding cpu 21 to runqueue 1
(XEN) Adding cpu 22 to runqueue 1
(XEN) Adding cpu 23 to runqueue 1
(XEN) Adding cpu 24 to runqueue 1
(XEN) Adding cpu 25 to runqueue 1
(XEN) Adding cpu 26 to runqueue 1
(XEN) Adding cpu 27 to runqueue 1
(XEN) Adding cpu 28 to runqueue 1
(XEN) Adding cpu 29 to runqueue 1
(XEN) Adding cpu 30 to runqueue 1
(XEN) Adding cpu 31 to runqueue 1
(XEN) Adding cpu 32 to runqueue 2
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 33 to runqueue 2
(XEN) Adding cpu 34 to runqueue 2
(XEN) Adding cpu 35 to runqueue 2
(XEN) Adding cpu 36 to runqueue 2
(XEN) Adding cpu 37 to runqueue 2
(XEN) Adding cpu 38 to runqueue 2
(XEN) Adding cpu 39 to runqueue 2
(XEN) Adding cpu 40 to runqueue 2
(XEN) Adding cpu 41 to runqueue 2
(XEN) Adding cpu 42 to runqueue 2
(XEN) Adding cpu 43 to runqueue 2
(XEN) Adding cpu 44 to runqueue 2
(XEN) Adding cpu 45 to runqueue 2
(XEN) Adding cpu 46 to runqueue 2
(XEN) Adding cpu 47 to runqueue 2
(XEN) Adding cpu 48 to runqueue 3
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 49 to runqueue 3
(XEN) Adding cpu 50 to runqueue 3
(XEN) Adding cpu 51 to runqueue 3
(XEN) Adding cpu 52 to runqueue 3
(XEN) Adding cpu 53 to runqueue 3
(XEN) Adding cpu 54 to runqueue 3
(XEN) Adding cpu 55 to runqueue 3
(XEN) Adding cpu 56 to runqueue 3
(XEN) Adding cpu 57 to runqueue 3
(XEN) Adding cpu 58 to runqueue 3
(XEN) Adding cpu 59 to runqueue 3
(XEN) Adding cpu 60 to runqueue 3
(XEN) Adding cpu 61 to runqueue 3
(XEN) Adding cpu 62 to runqueue 3
(XEN) Adding cpu 63 to runqueue 3
(XEN) Running stub recovery selftests...
(XEN) traps.c:1589: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff=
82d0803883f2
(XEN) traps.c:784: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d0=
803883f2
(XEN) traps.c:1123: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d0=
803883f2
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Dom0 has maximum 1544 PIRQs
(XEN) NX (Execute Disable) protection active
(XEN) *** Building a PV Dom0 ***
(XEN) ELF: phdr: paddr=3D0x1000000 memsz=3D0xf3f000
(XEN) ELF: phdr: paddr=3D0x2000000 memsz=3D0x51c000
(XEN) ELF: phdr: paddr=3D0x251c000 memsz=3D0x26000
(XEN) ELF: phdr: paddr=3D0x2542000 memsz=3D0xcfb000
(XEN) ELF: memory: 0x1000000 -> 0x323d000
(XEN) ELF: note: GUEST_OS =3D "linux"
(XEN) ELF: note: GUEST_VERSION =3D "2.6"
(XEN) ELF: note: XEN_VERSION =3D "xen-3.0"
(XEN) ELF: note: VIRT_BASE =3D 0xffffffff80000000
(XEN) ELF: note: INIT_P2M =3D 0x8000000000
(XEN) ELF: note: ENTRY =3D 0xffffffff82542180
(XEN) ELF: note: HYPERCALL_PAGE =3D 0xffffffff81001000
(XEN) ELF: note: FEATURES =3D "!writable_page_tables|pae_pgdir_above_4gb"
(XEN) ELF: note: SUPPORTED_FEATURES =3D 0x801
(XEN) ELF: note: PAE_MODE =3D "yes"
(XEN) ELF: note: LOADER =3D "generic"
(XEN) ELF: note: unknown (0xd)
(XEN) ELF: note: SUSPEND_CANCEL =3D 0x1
(XEN) ELF: note: MOD_START_PFN =3D 0x1
(XEN) ELF: note: HV_START_LOW =3D 0xffff800000000000
(XEN) ELF: note: PADDR_OFFSET =3D 0
(XEN) ELF: note: PHYS32_ENTRY =3D 0x10003b0
(XEN) ELF: Found PVH image
(XEN) ELF: addresses:
(XEN)     virt_base        =3D 0xffffffff80000000
(XEN)     elf_paddr_offset =3D 0x0
(XEN)     virt_offset      =3D 0xffffffff80000000
(XEN)     virt_kstart      =3D 0xffffffff81000000
(XEN)     virt_kend        =3D 0xffffffff8323d000
(XEN)     virt_entry       =3D 0xffffffff82542180
(XEN)     p2m_base         =3D 0x8000000000
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x323d000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000001074000000->0000001078000000 (32890764 pages to=
 be allocated)
(XEN)  Init. ramdisk: 000000207f0ed000->000000207ffffe80
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff8323d000
(XEN)  Init. ramdisk: 0000000000000000->0000000000000000
(XEN)  Phys-Mach map: 0000008000000000->000000800fb174f8
(XEN)  Start info:    ffffffff8323d000->ffffffff8323d4b8
(XEN)  Xenstore ring: 0000000000000000->0000000000000000
(XEN)  Console ring:  0000000000000000->0000000000000000
(XEN)  Page tables:   ffffffff8323e000->ffffffff8325b000
(XEN)  Boot stack:    ffffffff8325b000->ffffffff8325c000
(XEN)  TOTAL:         ffffffff80000000->ffffffff83400000
(XEN)  ENTRY ADDRESS: ffffffff82542180
(XEN) Dom0 has maximum 64 VCPUs
(XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff81f3f000
(XEN) ELF: phdr 1 at 0xffffffff82000000 -> 0xffffffff8251c000
(XEN) ELF: phdr 2 at 0xffffffff8251c000 -> 0xffffffff82542000
(XEN) ELF: phdr 3 at 0xffffffff82542000 -> 0xffffffff8279f000
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) ***************************************************
(XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
(XEN) This option is intended to aid debugging of Xen by ensuring
(XEN) that all output is synchronously delivered on the serial line.
(XEN) However it can introduce SIGNIFICANT latencies and affect
(XEN) timekeeping. It is NOT recommended for production use!
(XEN) ***************************************************
(XEN) 3... 2... 1...=20
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 536kB init memory
mapping kernel into physical memory
about to get started...
(XEN) emul-priv-op.c:1113:d0v0 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v0 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00800
[    0.000000] Linux version 4.12.14-94.41-default (geeko@buildhost) (gcc v=
ersion 4.8.5 (SUSE Linux) ) #1 SMP Wed Oct 31 12:25:04 UTC 2018 (3090901)
[    0.000000] Command line: root=3DUUID=3D79b9262c-a665-468b-8b6a-19eb33b3=
b9ce console=3Dtty0 console=3Dhvc0,38400 console=3DttyS0,38400 crashkernel=
=3D180M,high crashkernel=3D72M,low
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[5]: 1088, xstate_sizes[5]:   64
[    0.000000] x86/fpu: xstate_offset[6]: 1152, xstate_sizes[6]:  512
[    0.000000] x86/fpu: xstate_offset[7]: 1664, xstate_sizes[7]: 1024
[    0.000000] x86/fpu: Enabled xstate features 0xe7, context size is 2688 =
bytes, using 'standard' format.
[    0.000000] Released 0 page(s)
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] Xen: [mem 0x0000000000000000-0x0000000000098fff] usable
[    0.000000] Xen: [mem 0x0000000000099400-0x00000000000fffff] reserved
[    0.000000] Xen: [mem 0x0000000000100000-0x0000000059a23fff] usable
[    0.000000] Xen: [mem 0x0000000059a24000-0x0000000059a24fff] reserved
[    0.000000] Xen: [mem 0x0000000059a25000-0x0000000064bebfff] usable
[    0.000000] Xen: [mem 0x0000000064bec000-0x00000000675fffff] reserved
[    0.000000] Xen: [mem 0x0000000067600000-0x0000000067b33fff] ACPI data
[    0.000000] Xen: [mem 0x0000000067b34000-0x000000006d72cfff] ACPI NVS
[    0.000000] Xen: [mem 0x000000006d72d000-0x000000006f28bfff] reserved
[    0.000000] Xen: [mem 0x000000006f28c000-0x000000006f7fffff] usable
[    0.000000] Xen: [mem 0x000000006f800000-0x000000008fffffff] reserved
[    0.000000] Xen: [mem 0x0000000096bfc000-0x0000000096bfcfff] reserved
[    0.000000] Xen: [mem 0x000000009d7fc000-0x000000009d7fcfff] reserved
[    0.000000] Xen: [mem 0x00000000a43fc000-0x00000000a43fcfff] reserved
[    0.000000] Xen: [mem 0x00000000aaffc000-0x00000000aaffcfff] reserved
[    0.000000] Xen: [mem 0x00000000b1bfc000-0x00000000b1bfcfff] reserved
[    0.000000] Xen: [mem 0x00000000b87fc000-0x00000000b87fcfff] reserved
[    0.000000] Xen: [mem 0x00000000bf3fc000-0x00000000bf3fcfff] reserved
[    0.000000] Xen: [mem 0x00000000c5ffc000-0x00000000c5ffcfff] reserved
[    0.000000] Xen: [mem 0x00000000ccbfc000-0x00000000ccbfcfff] reserved
[    0.000000] Xen: [mem 0x00000000d37fc000-0x00000000d37fcfff] reserved
[    0.000000] Xen: [mem 0x00000000da3fc000-0x00000000da3fcfff] reserved
[    0.000000] Xen: [mem 0x00000000e0ffc000-0x00000000e0ffcfff] reserved
[    0.000000] Xen: [mem 0x00000000e7bfc000-0x00000000e7bfcfff] reserved
[    0.000000] Xen: [mem 0x00000000ee7fc000-0x00000000ee7fcfff] reserved
[    0.000000] Xen: [mem 0x00000000f53fc000-0x00000000f53fcfff] reserved
[    0.000000] Xen: [mem 0x00000000fbffc000-0x00000000fbffcfff] reserved
[    0.000000] Xen: [mem 0x00000000fd000000-0x00000000fe7fffff] reserved
[    0.000000] Xen: [mem 0x00000000fec00000-0x00000000fec01fff] reserved
[    0.000000] Xen: [mem 0x00000000fec08000-0x00000000fec08fff] reserved
[    0.000000] Xen: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
[    0.000000] Xen: [mem 0x00000000fec18000-0x00000000fec18fff] reserved
[    0.000000] Xen: [mem 0x00000000fec20000-0x00000000fec20fff] reserved
[    0.000000] Xen: [mem 0x00000000fec28000-0x00000000fec28fff] reserved
[    0.000000] Xen: [mem 0x00000000fec30000-0x00000000fec30fff] reserved
[    0.000000] Xen: [mem 0x00000000fec38000-0x00000000fec38fff] reserved
[    0.000000] Xen: [mem 0x00000000fec40000-0x00000000fec40fff] reserved
[    0.000000] Xen: [mem 0x00000000fec48000-0x00000000fec48fff] reserved
[    0.000000] Xen: [mem 0x00000000fec50000-0x00000000fec50fff] reserved
[    0.000000] Xen: [mem 0x00000000fec58000-0x00000000fec58fff] reserved
[    0.000000] Xen: [mem 0x00000000fec60000-0x00000000fec60fff] reserved
[    0.000000] Xen: [mem 0x00000000fec68000-0x00000000fec68fff] reserved
[    0.000000] Xen: [mem 0x00000000fec70000-0x00000000fec70fff] reserved
[    0.000000] Xen: [mem 0x00000000fec78000-0x00000000fec78fff] reserved
[    0.000000] Xen: [mem 0x00000000fed20000-0x00000000fed44fff] reserved
[    0.000000] Xen: [mem 0x00000000fee00000-0x00000000feefffff] reserved
[    0.000000] Xen: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] Xen: [mem 0x0000000100000000-0x000000207fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 3.2.1 present.
[    0.000000] DMI: FUJITSU SE SERVER SU310 M1/D3753-C1, BIOS V5.0.0.14 R1.=
12.0 for D3753-C1x                    07/22/2019
[    0.000000] Hypervisor detected: Xen PV
[    0.000000] tsc: Using PIT calibration value
[    0.000000] e820: last_pfn =3D 0x2080000 max_arch_pfn =3D 0x400000000
[    0.000000] MTRR: Disabled
[    0.000000] x86/PAT: MTRRs disabled, skipping PAT initialization too.
[    0.000000] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC=
 =20
[    0.000000] e820: last_pfn =3D 0x6f800 max_arch_pfn =3D 0x400000000
[    0.000000] Scanning 1 areas for low memory corruption
[    0.000000] Kernel/User page tables isolation: disabled on XEN PV.
[    0.000000] RAMDISK: [mem 0x04000000-0x04f12fff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000000F05A0 000024 (v02 FUJ   )
[    0.000000] ACPI: XSDT 0x00000000677610C8 000114 (v01 FUJ    D3753-C1 11=
200000 AMI  00010013)
[    0.000000] ACPI: FACP 0x0000000067A53B50 000114 (v06 FUJ    D3753-C1 11=
200000 INTL 20091013)
[    0.000000] ACPI: DSDT 0x0000000067761270 2F28E0 (v02 FUJ    D3753-C1 11=
200000 INTL 20091013)
[    0.000000] ACPI: FACS 0x000000006D6E9080 000040
[    0.000000] ACPI: FPDT 0x0000000067A53C68 000044 (v01 FUJ    D3753-C1 11=
200000 AMI  00010013)
[    0.000000] ACPI: FIDT 0x0000000067A53CB0 00009C (v01 FUJ    D3753-C1 11=
200000 AMI  00010013)
[    0.000000] ACPI: SPMI 0x0000000067A53D50 000041 (v05 FUJ    D3753-C1 00=
000000 AMI. 00000000)
[    0.000000] ACPI: SSDT 0x0000000067A53D98 00046C (v02 INTEL  ADDRXLAT 00=
000001 INTL 20140828)
[    0.000000] ACPI: MCEJ 0x0000000067A54208 000130 (v01 FUJ    D3753-C1 00=
000002 INTL 20091013)
[    0.000000] ACPI: MCFG 0x0000000067A54338 00003C (v01 FUJ    D3753-C1 11=
200000 MSFT 00000097)
[    0.000000] ACPI: HPET 0x0000000067A54378 000038 (v01 FUJ    D3753-C1 00=
000001 INTL 20091013)
[    0.000000] ACPI: APIC 0x0000000067A543B0 0016DE (v03 FUJ    D3753-C1 00=
000000 INTL 20091013)
[    0.000000] ACPI: MIGT 0x0000000067A55A90 000040 (v01 FUJ    D3753-C1 00=
000000 INTL 20091013)
[    0.000000] ACPI: MSCT 0x0000000067A55AD0 000090 (v01 FUJ    D3753-C1 00=
000001 INTL 20091013)
[    0.000000] ACPI: PCAT 0x0000000067A55B60 0000C8 (v02 FUJ    D3753-C1 00=
000002 INTL 20091013)
[    0.000000] ACPI: PCCT 0x0000000067A55C28 00006E (v01 FUJ    D3753-C1 00=
000002 INTL 20091013)
[    0.000000] ACPI: RASF 0x0000000067A55C98 000030 (v01 FUJ    D3753-C1 00=
000001 INTL 20091013)
[    0.000000] ACPI: SLIT 0x0000000067A55CC8 00042C (v01 FUJ    D3753-C1 00=
000001 INTL 20091013)
[    0.000000] ACPI: SRAT 0x0000000067A560F8 002D30 (v03 FUJ    D3753-C1 00=
000002 INTL 20091013)
[    0.000000] ACPI: SVOS 0x0000000067A58E28 000032 (v01 FUJ    D3753-C1 00=
000000 INTL 20091013)
[    0.000000] ACPI: WDDT 0x0000000067A58E60 000040 (v01 FUJ    D3753-C1 00=
000000 INTL 20091013)
[    0.000000] ACPI: OEM4 0x0000000067A58EA0 0A27C4 (v02 INTEL  CPU  CST 00=
003000 INTL 20140828)
[    0.000000] ACPI: SSDT 0x0000000067AFB668 033990 (v02 INTEL  SSDT  PM 00=
004000 INTL 20140828)
[    0.000000] ACPI: SSDT 0x0000000067B2EFF8 000943 (v02 FUJ    D3753-C1 00=
000000 INTL 20091013)
[    0.000000] ACPI: SPCR 0x0000000067B2F940 000050 (v02 A M I  APTIO V  11=
200000 AMI. 0005000E)
[    0.000000] ACPI: SSDT 0x0000000067B2F990 002B2E (v02 INTEL  SpsNm    00=
000002 INTL 20140828)
[    0.000000] ACPI: RMAD 0x0000000067B324C0 000520 (v01 FUJ    D3753-C1 00=
000001 INTL 20091013)
[    0.000000] ACPI: HEST 0x0000000067B329E0 0000A8 (v01 FUJ    D3753-C1 00=
000001 INTL 00000001)
[    0.000000] ACPI: BERT 0x0000000067B32A88 000030 (v01 FUJ    D3753-C1 00=
000001 INTL 00000001)
[    0.000000] ACPI: ERST 0x0000000067B32AB8 000230 (v01 FUJ    D3753-C1 00=
000001 INTL 00000001)
[    0.000000] ACPI: EINJ 0x0000000067B32CE8 000150 (v01 FUJ    D3753-C1 00=
000001 INTL 00000001)
[    0.000000] ACPI: SSDT 0x0000000067B32E38 000135 (v02 FUJ    Gabi0002 00=
000002 INTL 20140828)
[    0.000000] ACPI: SSDT 0x0000000067B32F70 0000BB (v02 FUJ    Gabi0001 00=
000002 INTL 20140828)
[    0.000000] Setting APIC routing to Xen PV.
[    0.000000] NUMA turned off
[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000207fffffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x1f62e75000-0x1f62e9efff]
[    0.000000] Ignoring crashkernel for a Xen PV domain
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000207fffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x0000000000098fff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x0000000059a23fff]
[    0.000000]   node   0: [mem 0x0000000059a25000-0x0000000064bebfff]
[    0.000000]   node   0: [mem 0x000000006f28c000-0x000000006f7fffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000207fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000207ffff=
fff]
[    0.000000] p2m virtual area at ffffc90000000000, size is 40000000
[    0.000000] Remapped 634632 page(s)
[    0.000000] ACPI: PM-Timer IO Port: 0x508
[    0.000000] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] dfl edge lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-=
23
[    0.000000] IOAPIC[1]: apic_id 9, version 32, address 0xfec01000, GSI 24=
=2D31
[    0.000000] IOAPIC[2]: apic_id 10, version 32, address 0xfec08000, GSI 3=
2-39
[    0.000000] IOAPIC[3]: apic_id 11, version 32, address 0xfec10000, GSI 4=
0-47
[    0.000000] IOAPIC[4]: apic_id 12, version 32, address 0xfec18000, GSI 4=
8-55
[    0.000000] IOAPIC[5]: apic_id 15, version 32, address 0xfec20000, GSI 7=
2-79
[    0.000000] IOAPIC[6]: apic_id 16, version 32, address 0xfec28000, GSI 8=
0-87
[    0.000000] IOAPIC[7]: apic_id 17, version 32, address 0xfec30000, GSI 8=
8-95
[    0.000000] IOAPIC[8]: apic_id 18, version 32, address 0xfec38000, GSI 9=
6-103
[    0.000000] IOAPIC[9]: apic_id 21, version 32, address 0xfec40000, GSI 1=
20-127
[    0.000000] IOAPIC[10]: apic_id 22, version 32, address 0xfec48000, GSI =
128-135
[    0.000000] IOAPIC[11]: apic_id 23, version 32, address 0xfec50000, GSI =
136-143
[    0.000000] IOAPIC[12]: apic_id 24, version 32, address 0xfec58000, GSI =
144-151
[    0.000000] IOAPIC[13]: apic_id 27, version 32, address 0xfec60000, GSI =
168-175
[    0.000000] IOAPIC[14]: apic_id 28, version 32, address 0xfec68000, GSI =
176-183
[    0.000000] IOAPIC[15]: apic_id 29, version 32, address 0xfec70000, GSI =
184-191
[    0.000000] IOAPIC[16]: apic_id 30, version 32, address 0xfec78000, GSI =
192-199
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.000000] smpboot: Allowing 288 CPUs, 224 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: Registered nosave memory: [mem 0x00099000-0x00099fff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009a000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x59a24000-0x59a24fff]
[    0.000000] PM: Registered nosave memory: [mem 0x64bec000-0x675fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x67600000-0x67b33fff]
[    0.000000] PM: Registered nosave memory: [mem 0x67b34000-0x6d72cfff]
[    0.000000] PM: Registered nosave memory: [mem 0x6d72d000-0x6f28bfff]
[    0.000000] PM: Registered nosave memory: [mem 0x6f800000-0x8fffffff]
[    0.000000] PM: Registered nosave memory: [mem 0x90000000-0x96bfbfff]
[    0.000000] PM: Registered nosave memory: [mem 0x96bfc000-0x96bfcfff]
[    0.000000] PM: Registered nosave memory: [mem 0x96bfd000-0x9d7fbfff]
[    0.000000] PM: Registered nosave memory: [mem 0x9d7fc000-0x9d7fcfff]
[    0.000000] PM: Registered nosave memory: [mem 0x9d7fd000-0xa43fbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xa43fc000-0xa43fcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xa43fd000-0xaaffbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xaaffc000-0xaaffcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xaaffd000-0xb1bfbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xb1bfc000-0xb1bfcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xb1bfd000-0xb87fbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xb87fc000-0xb87fcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xb87fd000-0xbf3fbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xbf3fc000-0xbf3fcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xbf3fd000-0xc5ffbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xc5ffc000-0xc5ffcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xc5ffd000-0xccbfbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xccbfc000-0xccbfcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xccbfd000-0xd37fbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xd37fc000-0xd37fcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xd37fd000-0xda3fbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xda3fc000-0xda3fcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xda3fd000-0xe0ffbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xe0ffc000-0xe0ffcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xe0ffd000-0xe7bfbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xe7bfc000-0xe7bfcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xe7bfd000-0xee7fbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xee7fc000-0xee7fcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xee7fd000-0xf53fbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xf53fc000-0xf53fcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xf53fd000-0xfbffbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xfbffc000-0xfbffcfff]
[    0.000000] PM: Registered nosave memory: [mem 0xfbffd000-0xfcffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfd000000-0xfe7fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfe800000-0xfebfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec00000-0xfec01fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec02000-0xfec07fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec08000-0xfec08fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec09000-0xfec0ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec10000-0xfec10fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec11000-0xfec17fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec18000-0xfec18fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec19000-0xfec1ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec20000-0xfec20fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec21000-0xfec27fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec28000-0xfec28fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec29000-0xfec2ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec30000-0xfec30fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec31000-0xfec37fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec38000-0xfec38fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec39000-0xfec3ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec40000-0xfec40fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec41000-0xfec47fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec48000-0xfec48fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec49000-0xfec4ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec50000-0xfec50fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec51000-0xfec57fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec58000-0xfec58fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec59000-0xfec5ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec60000-0xfec60fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec61000-0xfec67fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec68000-0xfec68fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec69000-0xfec6ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec70000-0xfec70fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec71000-0xfec77fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec78000-0xfec78fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec79000-0xfed1ffff][  =
  0.000000] PM: Registered nosave memory: [mem 0xfed20000-0xfed44fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed45000-0xfedfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee00000-0xfeefffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfef00000-0xfeffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.000000] e820: [mem 0x96bfd000-0x9d7fbfff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on Xen
[    0.000000] Xen version: 4.13.0-rc (preserve-AD)
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 7645519600211568 ns
[    0.000000] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:288 nr_cpu_ids:28=
8 nr_node_ids:1
[    0.000000] percpu: Embedded 47 pages/cpu @ffff881ff9400000 s155648 r819=
2 d28672 u262144
[    0.000000] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes)
[    0.000000] Built 1 zonelists in Node order, mobility grouping on.  Tota=
l pages: 32921500
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: root=3DUUID=3D79b9262c-a665-468b-8b6a-1=
9eb33b3b9ce console=3Dtty0 console=3Dhvc0,38400 console=3DttyS0,38400 crash=
kernel=3D180M,high crashkernel=3D72M,low
[    0.000000] log_buf_len individual max cpu contribution: 4096 bytes
[    0.000000] log_buf_len total cpu_extra contributions: 258048 bytes
[    0.000000] log_buf_len min size: 262144 bytes
[    0.000000] log_buf_len: 524288 bytes
[    0.000000] early log buf free: 238800(91%)
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] x2apic disabled
[    0.000000] software IO TLB [mem 0x1ff5400000-0x1ff9400000] (64MB) mappe=
d at [ffff881ff5400000-ffff881ff93fffff]
[    0.000000] Memory: 4095532K/133776348K available (10256K kernel code, 2=
268K rwdata, 3324K rodata, 2540K init, 10696K bss, 4925000K reserved, 0K cm=
a-reserved)
[    0.000000] ftrace: allocating 30727 entries in 121 pages
[    0.004000] Hierarchical RCU implementation.
[    0.004000]  RCU event tracing is enabled.
[    0.004000]  RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=3D64.
[    0.004000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D64
[    0.004000] Using NULL legacy PIC
[    0.004000] NR_IRQS:524544 nr_irqs:3928 0
[    0.004000] xen:events: Using FIFO-based ABI
[    0.004000] Console: colour dummy device 80x25
[    0.004000] console [tty0] enabled
[    0.004000] console [hvc0] enabled
[    0.004000] console [ttyS0] enabled
[    0.004000] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd=
42e4dffb, max_idle_ns: 881590591483 ns
[    0.004000] installing Xen timer for CPU 0
[    0.012002] tsc: Unable to calibrate against PIT
[    0.016003] tsc: HPET/PMTIMER calibration failed
[    0.020003] tsc: Detected 2793.552 MHz processor
[    0.024027] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 5587.10 BogoMIPS (lpj=3D11174208)
[    0.028003] pid_max: default: 65536 minimum: 512
[    0.032094] ACPI: Core revision 20170303
[    0.317906] ACPI: 7 ACPI AML tables successfully acquired and loaded
[    0.320212] Security Framework initialized
[    0.324073] AppArmor: AppArmor initialized
[    0.351280] Dentry cache hash table entries: 8388608 (order: 14, 6710886=
4 bytes)
[    0.363784] Inode-cache hash table entries: 4194304 (order: 13, 33554432=
 bytes)
[    0.364410] Mount-cache hash table entries: 131072 (order: 8, 1048576 by=
tes)
[    0.368381] Mountpoint-cache hash table entries: 131072 (order: 8, 10485=
76 bytes)
[    0.372522] mce: CPU supports 2 MCE banks
[    0.376025] Last level iTLB entries: 4KB 128, 2MB 8, 4MB 8
[    0.380003] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.384005] Spectre V2 : Mitigation: Indirect Branch Restricted Speculat=
ion
[    0.388003] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.392003] Spectre V2 : Spectre v2 mitigation: Enabling Indirect Branch=
 Prediction Barrier
[    0.396002] Spectre V2 : Enabling Restricted Speculation for firmware ca=
lls
[    0.400004] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl and seccomp
[    0.404137] Freeing SMP alternatives memory: 28K
[    0.412162] cpu 0 spinlock event irq 201
[    0.416036] VPMU disabled by hypervisor.
[    0.420313] Performance Events: unsupported p6 CPU model 85 no PMU drive=
r, software events only.
[    0.425534] NMI watchdog: disabled (cpu0): hardware events not enabled
[    0.428004] NMI watchdog: Shutting down hard lockup detector on all cpus
[    0.432020] smp: Bringing up secondary CPUs ...
[    0.436201] installing Xen timer for CPU 1
(XEN) emul-priv-op.c:1113:d0v1 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v1 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00800
[    0.502981] cpu 1 spinlock event irq 213
[    0.516229] installing Xen timer for CPU 2
(XEN) emul-priv-op.c:1113:d0v2 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v2 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00800
[    0.582967] cpu 2 spinlock event irq 220
[    0.596192] installing Xen timer for CPU 3
(XEN) emul-priv-op.c:1113:d0v3 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v3 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00800
[    0.662976] cpu 3 spinlock event irq 227
[    0.676328] installing Xen timer for CPU 4
(XEN) emul-priv-op.c:1113:d0v4 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v4 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00800
[    0.742951] cpu 4 spinlock event irq 234
[    0.756235] installing Xen timer for CPU 5
[    0.756020] random: fast init done
(XEN) emul-priv-op.c:1113:d0v5 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v5 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00800
[    0.829238] cpu 5 spinlock event irq 241
[    0.840196] installing Xen timer for CPU 6
(XEN) emul-priv-op.c:1113:d0v6 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v6 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00800
[    0.906950] cpu 6 spinlock event irq 248
[    0.920251] installing Xen timer for CPU 7
(XEN) emul-priv-op.c:1113:d0v7 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v7 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00800
[    0.986953] cpu 7 spinlock event irq 255
[    1.000297] installing Xen timer for CPU 8
(XEN) emul-priv-op.c:1113:d0v8 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v8 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00800
[    1.066956] cpu 8 spinlock event irq 262
[    1.080151] installing Xen timer for CPU 9
(XEN) emul-priv-op.c:1113:d0v9 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v9 Domain attempted WRMSR 0000001b from 0x00000=
000fee00c00 to 0x00000000fee00800
[    1.120100] cpu 9 spinlock event irq 269
[    1.132192] installing Xen timer for CPU 10
(XEN) emul-priv-op.c:1113:d0v10 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v10 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    1.199526] cpu 10 spinlock event irq 276
[    1.212416] installing Xen timer for CPU 11
(XEN) emul-priv-op.c:1113:d0v11 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v11 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    1.279521] cpu 11 spinlock event irq 283
[    1.292261] installing Xen timer for CPU 12
(XEN) emul-priv-op.c:1113:d0v12 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v12 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    1.359531] cpu 12 spinlock event irq 290
[    1.372384] installing Xen timer for CPU 13
(XEN) emul-priv-op.c:1113:d0v13 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v13 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    1.439526] cpu 13 spinlock event irq 297
[    1.452197] installing Xen timer for CPU 14
(XEN) emul-priv-op.c:1113:d0v14 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v14 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    1.519526] cpu 14 spinlock event irq 304
[    1.532321] installing Xen timer for CPU 15
(XEN) emul-priv-op.c:1113:d0v15 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v15 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    1.599527] cpu 15 spinlock event irq 311
[    1.612391] installing Xen timer for CPU 16
(XEN) emul-priv-op.c:1113:d0v16 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v16 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    1.679522] cpu 16 spinlock event irq 318
[    1.692219] installing Xen timer for CPU 17
(XEN) emul-priv-op.c:1113:d0v17 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v17 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    1.759528] cpu 17 spinlock event irq 325
[    1.772193] installing Xen timer for CPU 18
(XEN) emul-priv-op.c:1113:d0v18 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v18 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    1.839571] cpu 18 spinlock event irq 332
[    1.852222] installing Xen timer for CPU 19
(XEN) emul-priv-op.c:1113:d0v19 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v19 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    1.919529] cpu 19 spinlock event irq 339
[    1.932863] installing Xen timer for CPU 20
(XEN) emul-priv-op.c:1113:d0v20 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v20 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    1.999542] cpu 20 spinlock event irq 346
[    2.012371] installing Xen timer for CPU 21
(XEN) emul-priv-op.c:1113:d0v21 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v21 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    2.079526] cpu 21 spinlock event irq 353
[    2.092194] installing Xen timer for CPU 22
(XEN) emul-priv-op.c:1113:d0v22 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v22 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    2.159522] cpu 22 spinlock event irq 360
[    2.172381] installing Xen timer for CPU 23
(XEN) emul-priv-op.c:1113:d0v23 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v23 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    2.239526] cpu 23 spinlock event irq 367
[    2.252226] installing Xen timer for CPU 24
(XEN) emul-priv-op.c:1113:d0v24 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
[    2.256020] r(XEN) emul-priv-op.c:1113:d0v24 Domain attempted WRMSR 0000=
001b from 0x00000000fee00c00 to 0x00000000fee00800
andom: crng init done
[    2.324102] cpu 24 spinlock event irq 374
[    2.344210] installing Xen timer for CPU 25
(XEN) emul-priv-op.c:1113:d0v25 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v25 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    2.411528] cpu 25 spinlock event irq 381
[    2.424188] installing Xen timer for CPU 26
(XEN) emul-priv-op.c:1113:d0v26 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v26 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    2.491525] cpu 26 spinlock event irq 388
[    2.504301] installing Xen timer for CPU 27
(XEN) emul-priv-op.c:1113:d0v27 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v27 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    2.571520] cpu 27 spinlock event irq 395
[    2.584326] installing Xen timer for CPU 28
(XEN) emul-priv-op.c:1113:d0v28 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v28 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    2.651533] cpu 28 spinlock event irq 402
[    2.664296] installing Xen timer for CPU 29
(XEN) emul-priv-op.c:1113:d0v29 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v29 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    2.731516] cpu 29 spinlock event irq 409
[    2.744192] installing Xen timer for CPU 30
(XEN) emul-priv-op.c:1113:d0v30 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v30 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    2.811510] cpu 30 spinlock event irq 416
[    2.824236] installing Xen timer for CPU 31
(XEN) emul-priv-op.c:1113:d0v31 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v31 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    2.880122] cpu 31 spinlock event irq 423
[    2.892333] installing Xen timer for CPU 32
(XEN) emul-priv-op.c:1113:d0v32 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v32 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    2.959537] cpu 32 spinlock event irq 430
[    2.972598] installing Xen timer for CPU 33
(XEN) emul-priv-op.c:1113:d0v33 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v33 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    3.039529] cpu 33 spinlock event irq 437
[    3.052196] installing Xen timer for CPU 34
(XEN) emul-priv-op.c:1113:d0v34 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v34 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    3.119523] cpu 34 spinlock event irq 444
[    3.132388] installing Xen timer for CPU 35
(XEN) emul-priv-op.c:1113:d0v35 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v35 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    3.199514] cpu 35 spinlock event irq 451
[    3.212292] installing Xen timer for CPU 36
(XEN) emul-priv-op.c:1113:d0v36 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v36 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    3.279536] cpu 36 spinlock event irq 458
[    3.292396] installing Xen timer for CPU 37
(XEN) emul-priv-op.c:1113:d0v37 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v37 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    3.359529] cpu 37 spinlock event irq 465
[    3.372268] installing Xen timer for CPU 38
(XEN) emul-priv-op.c:1113:d0v38 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v38 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    3.439527] cpu 38 spinlock event irq 472
[    3.452217] installing Xen timer for CPU 39
(XEN) emul-priv-op.c:1113:d0v39 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v39 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    3.519524] cpu 39 spinlock event irq 479
[    3.532363] installing Xen timer for CPU 40
(XEN) emul-priv-op.c:1113:d0v40 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v40 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    3.599535] cpu 40 spinlock event irq 486
[    3.612218] installing Xen timer for CPU 41
(XEN) emul-priv-op.c:1113:d0v41 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v41 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    3.679520] cpu 41 spinlock event irq 493
[    3.692193] installing Xen timer for CPU 42
(XEN) emul-priv-op.c:1113:d0v42 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v42 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    3.759529] cpu 42 spinlock event irq 500
[    3.772281] installing Xen timer for CPU 43
(XEN) emul-priv-op.c:1113:d0v43 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v43 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    3.839532] cpu 43 spinlock event irq 507
[    3.852401] installing Xen timer for CPU 44
(XEN) emul-priv-op.c:1113:d0v44 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v44 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    3.919535] cpu 44 spinlock event irq 514
[    3.932689] installing Xen timer for CPU 45
(XEN) emul-priv-op.c:1113:d0v45 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v45 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    3.999540] cpu 45 spinlock event irq 521
[    4.012266] installing Xen timer for CPU 46
(XEN) emul-priv-op.c:1113:d0v46 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v46 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    4.079524] cpu 46 spinlock event irq 528
[    4.092352] installing Xen timer for CPU 47
(XEN) emul-priv-op.c:1113:d0v47 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v47 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    4.159541] cpu 47 spinlock event irq 535
[    4.172397] installing Xen timer for CPU 48
(XEN) emul-priv-op.c:1113:d0v48 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v48 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    4.239540] cpu 48 spinlock event irq 542
[    4.252222] installing Xen timer for CPU 49
(XEN) emul-priv-op.c:1113:d0v49 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v49 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    4.319541] cpu 49 spinlock event irq 549
[    4.332195] installing Xen timer for CPU 50
(XEN) emul-priv-op.c:1113:d0v50 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v50 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    4.399529] cpu 50 spinlock event irq 556
[    4.412267] installing Xen timer for CPU 51
(XEN) emul-priv-op.c:1113:d0v51 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v51 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    4.479526] cpu 51 spinlock event irq 563
[    4.492340] installing Xen timer for CPU 52
(XEN) emul-priv-op.c:1113:d0v52 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v52 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    4.559542] cpu 52 spinlock event irq 570
[    4.572273] installing Xen timer for CPU 53
(XEN) emul-priv-op.c:1113:d0v53 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v53 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    4.639558] cpu 53 spinlock event irq 577
[    4.652194] installing Xen timer for CPU 54
(XEN) emul-priv-op.c:1113:d0v54 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v54 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    4.719530] cpu 54 spinlock event irq 584
[    4.732265] installing Xen timer for CPU 55
(XEN) emul-priv-op.c:1113:d0v55 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v55 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    4.799518] cpu 55 spinlock event irq 591
[    4.812400] installing Xen timer for CPU 56
(XEN) emul-priv-op.c:1113:d0v56 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v56 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    4.879552] cpu 56 spinlock event irq 598
[    4.892479] installing Xen timer for CPU 57
(XEN) emul-priv-op.c:1113:d0v57 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v57 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    4.959529] cpu 57 spinlock event irq 605
[    4.972634] installing Xen timer for CPU 58
(XEN) emul-priv-op.c:1113:d0v58 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v58 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    5.039528] cpu 58 spinlock event irq 612
[    5.052196] installing Xen timer for CPU 59
(XEN) emul-priv-op.c:1113:d0v59 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v59 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    5.119537] cpu 59 spinlock event irq 619
[    5.132336] installing Xen timer for CPU 60
(XEN) emul-priv-op.c:1113:d0v60 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v60 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    5.199526] cpu 60 spinlock event irq 626
[    5.212190] installing Xen timer for CPU 61
(XEN) emul-priv-op.c:1113:d0v61 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00d00 to 0x00000000fee00100
(XEN) emul-priv-op.c:1113:d0v61 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00d00 to 0x00000000fee00900
[    5.279537] cpu 61 spinlock event irq 633
[    5.292330] installing Xen timer for CPU 62
(XEN) emul-priv-op.c:1113:d0v62 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v62 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    5.359539] cpu 62 spinlock event irq 640
[    5.372217] installing Xen timer for CPU 63
(XEN) emul-priv-op.c:1113:d0v63 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1113:d0v63 Domain attempted WRMSR 0000001b from 0x0000=
0000fee00c00 to 0x00000000fee00800
[    5.439540] cpu 63 spinlock event irq 647
[    5.452046] smp: Brought up 1 node, 64 CPUs
[    5.456005] smpboot: Max logical packages: 1
[    5.862950] node 0 initialised, 31188954 pages in 404ms
[    5.891119] devtmpfs: initialized
[    5.892061] x86/mm: Memory block size: 2048MB
[    5.898790] evm: security.selinux
[    5.900003] evm: security.ima
[    5.904003] evm: security.capability
[    5.908051] PM: Registering ACPI NVS region [mem 0x67b34000-0x6d72cfff] =
(96440320 bytes)
[    5.914626] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    5.916341] futex hash table entries: 16384 (order: 8, 1048576 bytes)
[    5.921196] pinctrl core: initialized pinctrl subsystem
[    5.924101] RTC time: 12:22:08, date: 11/12/19
[    5.928749] NET: Registered protocol family 16
[    5.932018] xen:grant_table: Grant tables using version 1 layout
[    5.936055] Grant table initialized
[    5.941292] Detected 1 PCC Subspaces
[    5.944028] Registering PCC driver as Mailbox controller
[    5.948037] ACPI FADT declares the system doesn't support PCIe ASPM, so =
disable it
[    5.952004] ACPI: bus type PCI registered
[    5.956004] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    5.960694] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0x80000000=
=2D0x8fffffff] (base 0x80000000)
[    5.964005] PCI: MMCONFIG at [mem 0x80000000-0x8fffffff] reserved in E820
(XEN) d0: Forcing write emulation on MFNs 80000-8ffff
[    6.033474] PCI: Using configuration type 1 for base access
[    6.044687] ACPI: Added _OSI(Module Device)
[    6.056005] ACPI: Added _OSI(Processor Device)
[    6.072004] ACPI: Added _OSI(3.0 _SCP Extensions)
[    6.088004] ACPI: Added _OSI(Processor Aggregator Device)
[    6.152111] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    6.197203] ACPI: Dynamic OEM Table Load:
[    6.490267] ACPI: Interpreter enabled
[    6.504036] ACPI: (supports S0 S5)
[    6.512005] ACPI: Using IOAPIC for interrupt routing
[    6.528102] HEST: Table parsing has been initialized.
[    6.548006] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    6.576934] ACPI: Enabled 6 GPEs in block 00 to 7F
[    6.696962] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-15])
[    6.716010] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[    6.744350] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    6.764328] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[    6.788004] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using B=
IOS configuration
[    6.812999] PCI host bridge to bus 0000:00
[    6.828005] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    6.852021] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    6.872005] pci_bus 0000:00: root bus resource [io  0x03b0-0x03bb window]
[    6.896005] pci_bus 0000:00: root bus resource [io  0x03c0-0x03df window]
[    6.916019] pci_bus 0000:00: root bus resource [io  0x1000-0x3fff window]
[    6.940005] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    6.964005] pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7ff=
f window]
[    6.988005] pci_bus 0000:00: root bus resource [mem 0xfe010000-0xfe010ff=
f window]
[    7.012005] pci_bus 0000:00: root bus resource [mem 0x90000000-0x96bffff=
f window]
[    7.036005] pci_bus 0000:00: root bus resource [bus 00-15]
(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:04.0
(XEN) PCI add device 0000:00:04.1
(XEN) PCI add device 0000:00:04.2
(XEN) PCI add device 0000:00:04.3
(XEN) PCI add device 0000:00:04.4
(XEN) PCI add device 0000:00:04.5
(XEN) PCI add device 0000:00:04.6
(XEN) PCI add device 0000:00:04.7
(XEN) PCI add device 0000:00:05.0
(XEN) PCI add device 0000:00:05.2
(XEN) PCI add device 0000:00:05.4
(XEN) PCI add device 0000:00:08.0
(XEN) PCI add device 0000:00:08.1
(XEN) PCI add device 0000:00:08.2
(XEN) PCI add device 0000:00:11.0
[    7.208548] pci 0000:00:14.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:00:14.0
(XEN) PCI add device 0000:00:14.2
(XEN) PCI add device 0000:00:16.0
(XEN) PCI add device 0000:00:16.1
(XEN) PCI add device 0000:00:16.4
(XEN) PCI add device 0000:00:17.0
[    7.284508] pci 0000:00:1c.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:00:1c.0
[    7.312518] pci 0000:00:1c.3: System wakeup disabled by ACPI
(XEN) PCI add device 0000:00:1c.3
[    7.340522] pci 0000:00:1c.4: System wakeup disabled by ACPI
(XEN) PCI add device 0000:00:1c.4
[    7.372521] pci 0000:00:1d.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:00:1d.0
(XEN) PCI add device 0000:00:1f.0
(XEN) PCI add device 0000:00:1f.2
(XEN) PCI add device 0000:00:1f.4
(XEN) PCI add device 0000:00:1f.5
[    7.436115] pci 0000:00:1c.0: PCI bridge to [bus 01]
(XEN) PCI add device 0000:02:00.0
[    7.464032] pci 0000:00:1c.3: PCI bridge to [bus 02-03]
(XEN) PCI add device 0000:03:00.0
(XEN) PCI add device 0000:03:01.0
[    7.500108] pci 0000:02:00.0: PCI bridge to [bus 03]
[    7.516160] pci 0000:00:1c.4: PCI bridge to [bus 04]
[    7.532136] pci 0000:00:1d.0: PCI bridge to [bus 05]
[    7.552027] ACPI: PCI Root Bridge [PC01] (domain 0000 [bus 16-23])
[    7.572008] acpi PNP0A08:01: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[    7.596934] acpi PNP0A08:01: _OSC: platform does not support [AER]
[    7.620820] acpi PNP0A08:01: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[    7.644025] acpi PNP0A08:01: FADT indicates ASPM is unsupported, using B=
IOS configuration
[    7.672228] PCI host bridge to bus 0000:16
[    7.684028] pci_bus 0000:16: root bus resource [io  0x4000-0x4fff window]
[    7.708011] pci_bus 0000:16: root bus resource [mem 0x96c00000-0x9d7ffff=
f window]
[    7.732006] pci_bus 0000:16: root bus resource [bus 16-23]
[    7.748378] pci 0000:16:00.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:16:00.0
(XEN) PCI add device 0000:16:05.0
(XEN) PCI add device 0000:16:05.2
(XEN) PCI add device 0000:16:05.4
(XEN) PCI add device 0000:16:08.0
(XEN) PCI add device 0000:16:08.1
(XEN) PCI add device 0000:16:08.2
(XEN) PCI add device 0000:16:08.3
(XEN) PCI add device 0000:16:08.4
(XEN) PCI add device 0000:16:08.5
(XEN) PCI add device 0000:16:08.6
(XEN) PCI add device 0000:16:08.7
(XEN) PCI add device 0000:16:09.0
(XEN) PCI add device 0000:16:09.1
(XEN) PCI add device 0000:16:09.2
(XEN) PCI add device 0000:16:09.3
(XEN) PCI add device 0000:16:09.4
(XEN) PCI add device 0000:16:09.5
(XEN) PCI add device 0000:16:09.6
(XEN) PCI add device 0000:16:09.7
(XEN) PCI add device 0000:16:0a.0
(XEN) PCI add device 0000:16:0a.1
(XEN) PCI add device 0000:16:0a.2
(XEN) PCI add device 0000:16:0a.3
(XEN) PCI add device 0000:16:0a.4
(XEN) PCI add device 0000:16:0a.5
(XEN) PCI add device 0000:16:0a.6
(XEN) PCI add device 0000:16:0a.7
(XEN) PCI add device 0000:16:0b.0
(XEN) PCI add device 0000:16:0b.1
(XEN) PCI add device 0000:16:0b.2
(XEN) PCI add device 0000:16:0b.3
(XEN) PCI add device 0000:16:0e.0
(XEN) PCI add device 0000:16:0e.1
(XEN) PCI add device 0000:16:0e.2
(XEN) PCI add device 0000:16:0e.3
(XEN) PCI add device 0000:16:0e.4
(XEN) PCI add device 0000:16:0e.5
(XEN) PCI add device 0000:16:0e.6
(XEN) PCI add device 0000:16:0e.7
(XEN) PCI add device 0000:16:0f.0
(XEN) PCI add device 0000:16:0f.1
(XEN) PCI add device 0000:16:0f.2
(XEN) PCI add device 0000:16:0f.3
(XEN) PCI add device 0000:16:0f.4
(XEN) PCI add device 0000:16:0f.5
(XEN) PCI add device 0000:16:0f.6
(XEN) PCI add device 0000:16:0f.7
(XEN) PCI add device 0000:16:10.0
(XEN) PCI add device 0000:16:10.1
(XEN) PCI add device 0000:16:10.2
(XEN) PCI add device 0000:16:10.3
(XEN) PCI add device 0000:16:10.4
(XEN) PCI add device 0000:16:10.5
(XEN) PCI add device 0000:16:10.6
(XEN) PCI add device 0000:16:10.7
(XEN) PCI add device 0000:16:11.0
(XEN) PCI add device 0000:16:11.1
(XEN) PCI add device 0000:16:11.2
(XEN) PCI add device 0000:16:11.3
(XEN) PCI add device 0000:16:1d.0
(XEN) PCI add device 0000:16:1d.1
(XEN) PCI add device 0000:16:1d.2
(XEN) PCI add device 0000:16:1d.3
(XEN) PCI add device 0000:16:1e.0
(XEN) PCI add device 0000:16:1e.1
(XEN) PCI add device 0000:16:1e.2
(XEN) PCI add device 0000:16:1e.3
(XEN) PCI add device 0000:16:1e.4
(XEN) PCI add device 0000:16:1e.5
(XEN) PCI add device 0000:16:1e.6
[    8.470827] pci 0000:17:00.0: VF(n) BAR0 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR0 for 16 VFs)(XEN) PCI add device 0000:17:00.0
[    8.518642] pci 0000:17:00.1: VF(n) BAR0 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR0 for 16 VFs)
(XEN) PCI add device 0000:17:00.1
[    8.564133] pci 0000:16:00.0: PCI bridge to [bus 17]
[    8.580214] ACPI: PCI Root Bridge [PC02] (domain 0000 [bus 24-31])
[    8.600025] acpi PNP0A08:02: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[    8.624928] acpi PNP0A08:02: _OSC: platform does not support [AER]
[    8.648789] acpi PNP0A08:02: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[    8.672039] acpi PNP0A08:02: FADT indicates ASPM is unsupported, using B=
IOS configuration
[    8.700167] PCI host bridge to bus 0000:24
[    8.712016] pci_bus 0000:24: root bus resource [io  0x5000-0x5fff window]
[    8.736022] pci_bus 0000:24: root bus resource [mem 0x9d800000-0xa43ffff=
f window]
[    8.760005] pci_bus 0000:24: root bus resource [bus 24-31]
[    8.776120] pci 0000:24:00.0: enabling Extended Tags
[    8.792210] pci 0000:24:00.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:24:00.0
(XEN) PCI add device 0000:24:05.0
(XEN) PCI add device 0000:24:05.2
(XEN) PCI add device 0000:24:05.4
(XEN) PCI add device 0000:24:08.0
(XEN) PCI add device 0000:24:09.0
(XEN) PCI add device 0000:24:0a.0
(XEN) PCI add device 0000:24:0a.1
(XEN) PCI add device 0000:24:0a.2
(XEN) PCI add device 0000:24:0a.3
(XEN) PCI add device 0000:24:0a.4
(XEN) PCI add device 0000:24:0a.5
(XEN) PCI add device 0000:24:0a.6
(XEN) PCI add device 0000:24:0a.7
(XEN) PCI add device 0000:24:0b.0
(XEN) PCI add device 0000:24:0b.1
(XEN) PCI add device 0000:24:0b.2
(XEN) PCI add device 0000:24:0b.3
(XEN) PCI add device 0000:24:0c.0
(XEN) PCI add device 0000:24:0c.1
(XEN) PCI add device 0000:24:0c.2
(XEN) PCI add device 0000:24:0c.3
(XEN) PCI add device 0000:24:0c.4
(XEN) PCI add device 0000:24:0c.5
(XEN) PCI add device 0000:24:0c.6
(XEN) PCI add device 0000:24:0c.7
(XEN) PCI add device 0000:24:0d.0
(XEN) PCI add device 0000:24:0d.1
(XEN) PCI add device 0000:24:0d.2
(XEN) PCI add device 0000:24:0d.3
[    9.108464] pci 0000:25:00.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:25:00.0
[    9.136027] pci 0000:24:00.0: PCI bridge to [bus 25-27]
[    9.152505] pci 0000:26:03.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:26:03.0
[    9.180091] pci 0000:25:00.0: PCI bridge to [bus 26-27]
[    9.196344] pci 0000:27:00.0: enabling Extended Tags
[    9.216268] pci 0000:27:00.0: VF(n) BAR0 space: [mem 0x00000000-0x003fff=
ff 64bit pref] (contains BAR0 for 32 VFs)
[    9.248041] pci 0000:27:00.0: VF(n) BAR3 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR3 for 32 VFs)
(XEN) PCI add device 0000:27:00.0
[    9.292216] pci 0000:27:00.1: enabling Extended Tags
[    9.308253] pci 0000:27:00.1: VF(n) BAR0 space: [mem 0x00000000-0x003fff=
ff 64bit pref] (contains BAR0 for 32 VFs)
[    9.340041] pci 0000:27:00.1: VF(n) BAR3 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR3 for 32 VFs)
(XEN) PCI add device 0000:27:00.1
[    9.384213] pci 0000:27:00.2: enabling Extended Tags
[    9.400252] pci 0000:27:00.2: VF(n) BAR0 space: [mem 0x00000000-0x003fff=
ff 64bit pref] (contains BAR0 for 32 VFs)
[    9.432041] pci 0000:27:00.2: VF(n) BAR3 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR3 for 32 VFs)
(XEN) PCI add device 0000:27:00.2
[    9.476211] pci 0000:27:00.3: enabling Extended Tags
[    9.492254] pci 0000:27:00.3: VF(n) BAR0 space: [mem 0x00000000-0x003fff=
ff 64bit pref] (contains BAR0 for 32 VFs)
[    9.528041] pci 0000:27:00.3: VF(n) BAR3 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR3 for 32 VFs)
(XEN) PCI add device 0000:27:00.3
[    9.568146] pci 0000:26:03.0: PCI bridge to [bus 27]
[    9.588239] ACPI: PCI Root Bridge [PC03] (domain 0000 [bus 32-3f])
[    9.608008] acpi PNP0A08:03: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[    9.632917] acpi PNP0A08:03: _OSC: platform does not support [AER]
[    9.652797] acpi PNP0A08:03: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[    9.680005] acpi PNP0A08:03: FADT indicates ASPM is unsupported, using B=
IOS configuration
[    9.708201] PCI host bridge to bus 0000:32
[    9.720005] pci_bus 0000:32: root bus resource [io  0x6000-0x6fff window]
[    9.740005] pci_bus 0000:32: root bus resource [mem 0xa4400000-0xaafffff=
f window]
[    9.768006] pci_bus 0000:32: root bus resource [bus 32-3f]
[    9.784371] pci 0000:32:00.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:32:00.0
(XEN) PCI add device 0000:32:05.0
(XEN) PCI add device 0000:32:05.2
(XEN) PCI add device 0000:32:05.4
(XEN) PCI add device 0000:32:0e.0
(XEN) PCI add device 0000:32:0e.1
(XEN) PCI add device 0000:32:0f.0
(XEN) PCI add device 0000:32:0f.1
(XEN) PCI add device 0000:32:10.0
(XEN) PCI add device 0000:32:10.1
(XEN) PCI add device 0000:32:12.0
(XEN) PCI add device 0000:32:12.1
(XEN) PCI add device 0000:32:12.2
(XEN) PCI add device 0000:32:12.4
(XEN) PCI add device 0000:32:12.5
(XEN) PCI add device 0000:32:15.0
(XEN) PCI add device 0000:32:15.1
(XEN) PCI add device 0000:32:16.0
(XEN) PCI add device 0000:32:16.1
(XEN) PCI add device 0000:32:16.4
(XEN) PCI add device 0000:32:16.5
(XEN) PCI add device 0000:32:17.0
(XEN) PCI add device 0000:32:17.1
[   10.028561] pci 0000:33:00.0: VF(n) BAR0 space: [mem 0x00000000-0x001fff=
ff 64bit pref] (contains BAR0 for 32 VFs)
[   10.064038] pci 0000:33:00.0: VF(n) BAR3 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR3 for 32 VFs)
(XEN) PCI add device 0000:33:00.0
[   10.104412] pci 0000:33:00.1: VF(n) BAR0 space: [mem 0x00000000-0x001fff=
ff 64bit pref] (contains BAR0 for 32 VFs)
[   10.140038] pci 0000:33:00.1: VF(n) BAR3 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR3 for 32 VFs)
(XEN) PCI add device 0000:33:00.1
[   10.180412] pci 0000:33:00.2: VF(n) BAR0 space: [mem 0x00000000-0x001fff=
ff 64bit pref] (contains BAR0 for 32 VFs)
[   10.216038] pci 0000:33:00.2: VF(n) BAR3 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR3 for 32 VFs)
(XEN) PCI add device 0000:33:00.2
[   10.260407] pci 0000:33:00.3: VF(n) BAR0 space: [mem 0x00000000-0x001fff=
ff 64bit pref] (contains BAR0 for 32 VFs)
[   10.292038] pci 0000:33:00.3: VF(n) BAR3 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR3 for 32 VFs)
(XEN) PCI add device 0000:33:00.3
[   10.336034] pci 0000:32:00.0: PCI bridge to [bus 33]
[   10.352317] ACPI: PCI Root Bridge [PC06] (domain 0000 [bus 40-43])
[   10.372027] acpi PNP0A08:06: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[   10.400555] acpi PNP0A08:06: _OSC: platform does not support [AER]
[   10.420519] acpi PNP0A08:06: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[   10.444005] acpi PNP0A08:06: FADT indicates ASPM is unsupported, using B=
IOS configuration
[   10.472163] acpiphp: Slot [1] registered
[   10.484090] PCI host bridge to bus 0000:40
[   10.496004] pci_bus 0000:40: root bus resource [io  0x7000-0x7fff window]
[   10.520025] pci_bus 0000:40: root bus resource [mem 0xab000000-0xb1bffff=
f window]
[   10.544005] pci_bus 0000:40: root bus resource [bus 40-43]
(XEN) PCI add device 0000:40:04.0
(XEN) PCI add device 0000:40:04.1
(XEN) PCI add device 0000:40:04.2
(XEN) PCI add device 0000:40:04.3
(XEN) PCI add device 0000:40:04.4
(XEN) PCI add device 0000:40:04.5
(XEN) PCI add device 0000:40:04.6
(XEN) PCI add device 0000:40:04.7
(XEN) PCI add device 0000:40:05.0
(XEN) PCI add device 0000:40:05.2
(XEN) PCI add device 0000:40:05.4
(XEN) PCI add device 0000:40:08.0
(XEN) PCI add device 0000:40:08.1
(XEN) PCI add device 0000:40:08.2
[   10.700217] ACPI: PCI Root Bridge [PC07] (domain 0000 [bus 44-57])
[   10.720029] acpi PNP0A08:07: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[   10.748897] acpi PNP0A08:07: _OSC: platform does not support [AER]
[   10.768780] acpi PNP0A08:07: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[   10.792015] acpi PNP0A08:07: FADT indicates ASPM is unsupported, using B=
IOS configuration
[   10.820159] acpiphp: Slot [1-1] registered
[   10.832027] acpiphp: Slot [2] registered
[   10.844024] acpiphp: Slot [3] registered
[   10.860026] acpiphp: Slot [4] registered
[   10.872113] PCI host bridge to bus 0000:44
[   10.884027] pci_bus 0000:44: root bus resource [io  0x8000-0x8fff window]
[   10.908027] pci_bus 0000:44: root bus resource [mem 0xb1c00000-0xb87ffff=
f window]
[   10.932005] pci_bus 0000:44: root bus resource [bus 44-57]
[   10.948377] pci 0000:44:00.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:44:00.0
(XEN) PCI add device 0000:44:05.0
(XEN) PCI add device 0000:44:05.2
(XEN) PCI add device 0000:44:05.4
(XEN) PCI add device 0000:44:08.0
(XEN) PCI add device 0000:44:08.1
(XEN) PCI add device 0000:44:08.2
(XEN) PCI add device 0000:44:08.3
(XEN) PCI add device 0000:44:08.4
(XEN) PCI add device 0000:44:08.5
(XEN) PCI add device 0000:44:08.6
(XEN) PCI add device 0000:44:08.7
(XEN) PCI add device 0000:44:09.0
(XEN) PCI add device 0000:44:09.1
(XEN) PCI add device 0000:44:09.2
(XEN) PCI add device 0000:44:09.3
(XEN) PCI add device 0000:44:09.4
(XEN) PCI add device 0000:44:09.5
(XEN) PCI add device 0000:44:09.6
(XEN) PCI add device 0000:44:09.7
(XEN) PCI add device 0000:44:0a.0
(XEN) PCI add device 0000:44:0a.1
(XEN) PCI add device 0000:44:0a.2
(XEN) PCI add device 0000:44:0a.3
(XEN) PCI add device 0000:44:0a.4
(XEN) PCI add device 0000:44:0a.5
(XEN) PCI add device 0000:44:0a.6
(XEN) PCI add device 0000:44:0a.7
(XEN) PCI add device 0000:44:0b.0
(XEN) PCI add device 0000:44:0b.1
(XEN) PCI add device 0000:44:0b.2
(XEN) PCI add device 0000:44:0b.3
(XEN) PCI add device 0000:44:0e.0
(XEN) PCI add device 0000:44:0e.1
(XEN) PCI add device 0000:44:0e.2
(XEN) PCI add device 0000:44:0e.3
(XEN) PCI add device 0000:44:0e.4
(XEN) PCI add device 0000:44:0e.5
(XEN) PCI add device 0000:44:0e.6
(XEN) PCI add device 0000:44:0e.7
(XEN) PCI add device 0000:44:0f.0
(XEN) PCI add device 0000:44:0f.1
(XEN) PCI add device 0000:44:0f.2
(XEN) PCI add device 0000:44:0f.3
(XEN) PCI add device 0000:44:0f.4
(XEN) PCI add device 0000:44:0f.5
(XEN) PCI add device 0000:44:0f.6
(XEN) PCI add device 0000:44:0f.7
(XEN) PCI add device 0000:44:10.0
(XEN) PCI add device 0000:44:10.1
(XEN) PCI add device 0000:44:10.2
(XEN) PCI add device 0000:44:10.3
(XEN) PCI add device 0000:44:10.4
(XEN) PCI add device 0000:44:10.5
(XEN) PCI add device 0000:44:10.6
(XEN) PCI add device 0000:44:10.7
(XEN) PCI add device 0000:44:11.0
(XEN) PCI add device 0000:44:11.1
(XEN) PCI add device 0000:44:11.2
(XEN) PCI add device 0000:44:11.3
(XEN) PCI add device 0000:44:1d.0
(XEN) PCI add device 0000:44:1d.1
(XEN) PCI add device 0000:44:1d.2
(XEN) PCI add device 0000:44:1d.3
(XEN) PCI add device 0000:44:1e.0
(XEN) PCI add device 0000:44:1e.1
(XEN) PCI add device 0000:44:1e.2
(XEN) PCI add device 0000:44:1e.3
(XEN) PCI add device 0000:44:1e.4
(XEN) PCI add device 0000:44:1e.5
(XEN) PCI add device 0000:44:1e.6
(XEN) PCI add device 0000:45:00.0
[   11.672029] pci 0000:44:00.0: PCI bridge to [bus 45]
[   11.692241] ACPI: PCI Root Bridge [PC08] (domain 0000 [bus 58-6b])
[   11.712008] acpi PNP0A08:08: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[   11.736909] acpi PNP0A08:08: _OSC: platform does not support [AER]
[   11.760010] acpi PNP0A08:08: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[   11.784005] acpi PNP0A08:08: FADT indicates ASPM is unsupported, using B=
IOS configuration
[   11.808143] acpiphp: Slot [1-2] registered
[   11.824026] acpiphp: Slot [2-1] registered
[   11.836025] acpiphp: Slot [3-1] registered
[   11.852025] acpiphp: Slot [4-1] registered
[   11.864066] PCI host bridge to bus 0000:58
[   11.876026] pci_bus 0000:58: root bus resource [io  0x9000-0x9fff window]
[   11.900005] pci_bus 0000:58: root bus resource [mem 0xb8800000-0xbf3ffff=
f window]
[   11.924005] pci_bus 0000:58: root bus resource [bus 58-6b]
[   11.940125] pci 0000:58:00.0: enabling Extended Tags
[   11.960209] pci 0000:58:00.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:58:00.0
[   11.988126] pci 0000:58:01.0: enabling Extended Tags
[   12.004205] pci 0000:58:01.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:58:01.0
[   12.032127] pci 0000:58:02.0: enabling Extended Tags
[   12.048205] pci 0000:58:02.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:58:02.0
[   12.076223] pci 0000:58:03.0: enabling Extended Tags
[   12.092205] pci 0000:58:03.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:58:03.0
(XEN) PCI add device 0000:58:05.0
(XEN) PCI add device 0000:58:05.2
(XEN) PCI add device 0000:58:05.4
(XEN) PCI add device 0000:58:08.0
(XEN) PCI add device 0000:58:09.0
(XEN) PCI add device 0000:58:0a.0
(XEN) PCI add device 0000:58:0a.1
(XEN) PCI add device 0000:58:0a.2
(XEN) PCI add device 0000:58:0a.3
(XEN) PCI add device 0000:58:0a.4
(XEN) PCI add device 0000:58:0a.5
(XEN) PCI add device 0000:58:0a.6
(XEN) PCI add device 0000:58:0a.7
(XEN) PCI add device 0000:58:0b.0
(XEN) PCI add device 0000:58:0b.1
(XEN) PCI add device 0000:58:0b.2
(XEN) PCI add device 0000:58:0b.3
(XEN) PCI add device 0000:58:0c.0
(XEN) PCI add device 0000:58:0c.1
(XEN) PCI add device 0000:58:0c.2
(XEN) PCI add device 0000:58:0c.3
(XEN) PCI add device 0000:58:0c.4
(XEN) PCI add device 0000:58:0c.5
(XEN) PCI add device 0000:58:0c.6
(XEN) PCI add device 0000:58:0c.7
(XEN) PCI add device 0000:58:0d.0
(XEN) PCI add device 0000:58:0d.1
(XEN) PCI add device 0000:58:0d.2
(XEN) PCI add device 0000:58:0d.3
[   12.404158] pci 0000:58:00.0: PCI bridge to [bus 59]
[   12.424120] pci 0000:58:01.0: PCI bridge to [bus 5a]
[   12.440115] pci 0000:58:02.0: PCI bridge to [bus 5b]
[   12.456115] pci 0000:58:03.0: PCI bridge to [bus 5c]
[   12.472268] ACPI: PCI Root Bridge [PC09] (domain 0000 [bus 6c-7f])
[   12.492023] acpi PNP0A08:09: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[   12.516893] acpi PNP0A08:09: _OSC: platform does not support [AER]
[   12.540771] acpi PNP0A08:09: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[   12.564004] acpi PNP0A08:09: FADT indicates ASPM is unsupported, using B=
IOS configuration
[   12.592140] acpiphp: Slot [1-3] registered
[   12.604027] acpiphp: Slot [2-2] registered
[   12.616025] acpiphp: Slot [3-2] registered
[   12.632025] acpiphp: Slot [4-2] registered
[   12.644056] PCI host bridge to bus 0000:6c
[   12.656025] pci_bus 0000:6c: root bus resource [io  0xa000-0xafff window]
[   12.680006] pci_bus 0000:6c: root bus resource [mem 0xbf400000-0xc5fffff=
f window]
[   12.704020] pci_bus 0000:6c: root bus resource [bus 6c-7f]
[   12.724372] pci 0000:6c:00.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:6c:00.0
(XEN) PCI add device 0000:6c:05.0
(XEN) PCI add device 0000:6c:05.2
(XEN) PCI add device 0000:6c:05.4
(XEN) PCI add device 0000:6c:0e.0
(XEN) PCI add device 0000:6c:0e.1
(XEN) PCI add device 0000:6c:0f.0
(XEN) PCI add device 0000:6c:0f.1
(XEN) PCI add device 0000:6c:10.0
(XEN) PCI add device 0000:6c:10.1
(XEN) PCI add device 0000:6c:12.0
(XEN) PCI add device 0000:6c:12.1
(XEN) PCI add device 0000:6c:12.2
(XEN) PCI add device 0000:6c:12.4
(XEN) PCI add device 0000:6c:12.5
(XEN) PCI add device 0000:6c:15.0
(XEN) PCI add device 0000:6c:15.1
(XEN) PCI add device 0000:6c:16.0
(XEN) PCI add device 0000:6c:16.1
(XEN) PCI add device 0000:6c:16.4
(XEN) PCI add device 0000:6c:16.5
(XEN) PCI add device 0000:6c:17.0
(XEN) PCI add device 0000:6c:17.1
[   12.968557] pci 0000:6d:00.0: VF(n) BAR0 space: [mem 0x00000000-0x001fff=
ff 64bit pref] (contains BAR0 for 32 VFs)
[   13.000038] pci 0000:6d:00.0: VF(n) BAR3 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR3 for 32 VFs)
(XEN) PCI add device 0000:6d:00.0
[   13.044406] pci 0000:6d:00.1: VF(n) BAR0 space: [mem 0x00000000-0x001fff=
ff 64bit pref] (contains BAR0 for 32 VFs)
[   13.076038] pci 0000:6d:00.1: VF(n) BAR3 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR3 for 32 VFs)
(XEN) PCI add device 0000:6d:00.1
[   13.120406] pci 0000:6d:00.2: VF(n) BAR0 space: [mem 0x00000000-0x001fff=
ff 64bit pref] (contains BAR0 for 32 VFs)
[   13.156046] pci 0000:6d:00.2: VF(n) BAR3 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR3 for 32 VFs)
(XEN) PCI add device 0000:6d:00.2
[   13.196408] pci 0000:6d:00.3: VF(n) BAR0 space: [mem 0x00000000-0x001fff=
ff 64bit pref] (contains BAR0 for 32 VFs)
[   13.232039] pci 0000:6d:00.3: VF(n) BAR3 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR3 for 32 VFs)
(XEN) PCI add device 0000:6d:00.3
[   13.276035] pci 0000:6c:00.0: PCI bridge to [bus 6d]
[   13.292347] ACPI: PCI Root Bridge [PC12] (domain 0000 [bus 80-83])
[   13.312025] acpi PNP0A08:0c: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[   13.336556] acpi PNP0A08:0c: _OSC: platform does not support [AER]
[   13.360026] acpi PNP0A08:0c: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[   13.384005] acpi PNP0A08:0c: FADT indicates ASPM is unsupported, using B=
IOS configuration
[   13.408158] acpiphp: Slot [1-4] registered
[   13.424090] PCI host bridge to bus 0000:80
[   13.436007] pci_bus 0000:80: root bus resource [io  0xb000-0xbfff window]
[   13.460005] pci_bus 0000:80: root bus resource [mem 0xc6000000-0xccbffff=
f window]
[   13.484025] pci_bus 0000:80: root bus resource [bus 80-83]
(XEN) PCI add device 0000:80:04.0
(XEN) PCI add device 0000:80:04.1
(XEN) PCI add device 0000:80:04.2
(XEN) PCI add device 0000:80:04.3
(XEN) PCI add device 0000:80:04.4
(XEN) PCI add device 0000:80:04.5
(XEN) PCI add device 0000:80:04.6
(XEN) PCI add device 0000:80:04.7
(XEN) PCI add device 0000:80:05.0
(XEN) PCI add device 0000:80:05.2
(XEN) PCI add device 0000:80:05.4
(XEN) PCI add device 0000:80:08.0
(XEN) PCI add device 0000:80:08.1
(XEN) PCI add device 0000:80:08.2
[   13.640216] ACPI: PCI Root Bridge [PC13] (domain 0000 [bus 84-97])
[   13.660009] acpi PNP0A08:0d: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[   13.688028] acpi PNP0A08:0d: _OSC: platform does not support [AER]
[   13.708785] acpi PNP0A08:0d: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[   13.732028] acpi PNP0A08:0d: FADT indicates ASPM is unsupported, using B=
IOS configuration
[   13.760155] acpiphp: Slot [1-5] registered
[   13.772025] acpiphp: Slot [2-3] registered
[   13.784025] acpiphp: Slot [3-3] registered
[   13.800026] acpiphp: Slot [4-3] registered
[   13.812100] PCI host bridge to bus 0000:84
[   13.824053] pci_bus 0000:84: root bus resource [io  0xc000-0xcfff window]
[   13.848005] pci_bus 0000:84: root bus resource [mem 0xccc00000-0xd37ffff=
f window]
[   13.872011] pci_bus 0000:84: root bus resource [bus 84-97]
(XEN) PCI add device 0000:84:05.0
(XEN) PCI add device 0000:84:05.2
(XEN) PCI add device 0000:84:05.4
(XEN) PCI add device 0000:84:08.0
(XEN) PCI add device 0000:84:08.1
(XEN) PCI add device 0000:84:08.2
(XEN) PCI add device 0000:84:08.3
(XEN) PCI add device 0000:84:08.4
(XEN) PCI add device 0000:84:08.5
(XEN) PCI add device 0000:84:08.6
(XEN) PCI add device 0000:84:08.7
(XEN) PCI add device 0000:84:09.0
(XEN) PCI add device 0000:84:09.1
(XEN) PCI add device 0000:84:09.2
(XEN) PCI add device 0000:84:09.3
(XEN) PCI add device 0000:84:09.4
(XEN) PCI add device 0000:84:09.5
(XEN) PCI add device 0000:84:09.6
(XEN) PCI add device 0000:84:09.7
(XEN) PCI add device 0000:84:0a.0
(XEN) PCI add device 0000:84:0a.1
(XEN) PCI add device 0000:84:0a.2
(XEN) PCI add device 0000:84:0a.3
(XEN) PCI add device 0000:84:0a.4
(XEN) PCI add device 0000:84:0a.5
(XEN) PCI add device 0000:84:0a.6
(XEN) PCI add device 0000:84:0a.7
(XEN) PCI add device 0000:84:0b.0
(XEN) PCI add device 0000:84:0b.1
(XEN) PCI add device 0000:84:0b.2
(XEN) PCI add device 0000:84:0b.3
(XEN) PCI add device 0000:84:0e.0
(XEN) PCI add device 0000:84:0e.1
(XEN) PCI add device 0000:84:0e.2
(XEN) PCI add device 0000:84:0e.3
(XEN) PCI add device 0000:84:0e.4
(XEN) PCI add device 0000:84:0e.5
(XEN) PCI add device 0000:84:0e.6
(XEN) PCI add device 0000:84:0e.7
(XEN) PCI add device 0000:84:0f.0
(XEN) PCI add device 0000:84:0f.1
(XEN) PCI add device 0000:84:0f.2
(XEN) PCI add device 0000:84:0f.3
(XEN) PCI add device 0000:84:0f.4
(XEN) PCI add device 0000:84:0f.5
(XEN) PCI add device 0000:84:0f.6
(XEN) PCI add device 0000:84:0f.7
(XEN) PCI add device 0000:84:10.0
(XEN) PCI add device 0000:84:10.1
(XEN) PCI add device 0000:84:10.2
(XEN) PCI add device 0000:84:10.3
(XEN) PCI add device 0000:84:10.4
(XEN) PCI add device 0000:84:10.5
(XEN) PCI add device 0000:84:10.6
(XEN) PCI add device 0000:84:10.7
(XEN) PCI add device 0000:84:11.0
(XEN) PCI add device 0000:84:11.1
(XEN) PCI add device 0000:84:11.2
(XEN) PCI add device 0000:84:11.3
(XEN) PCI add device 0000:84:1d.0
(XEN) PCI add device 0000:84:1d.1
(XEN) PCI add device 0000:84:1d.2
(XEN) PCI add device 0000:84:1d.3
(XEN) PCI add device 0000:84:1e.0
(XEN) PCI add device 0000:84:1e.1
(XEN) PCI add device 0000:84:1e.2
(XEN) PCI add device 0000:84:1e.3
(XEN) PCI add device 0000:84:1e.4
(XEN) PCI add device 0000:84:1e.5
(XEN) PCI add device 0000:84:1e.6
[   14.576194] ACPI: PCI Root Bridge [PC14] (domain 0000 [bus 98-ab])
[   14.596023] acpi PNP0A08:0e: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[   14.624905] acpi PNP0A08:0e: _OSC: platform does not support [AER]
[   14.644765] acpi PNP0A08:0e: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[   14.668019] acpi PNP0A08:0e: FADT indicates ASPM is unsupported, using B=
IOS configuration
[   14.696148] acpiphp: Slot [1-6] registered
[   14.708028] acpiphp: Slot [2-4] registered
[   14.724026] acpiphp: Slot [3-4] registered
[   14.736028] acpiphp: Slot [4-4] registered
[   14.752066] PCI host bridge to bus 0000:98
[   14.764036] pci_bus 0000:98: root bus resource [io  0xd000-0xdfff window]
[   14.788011] pci_bus 0000:98: root bus resource [mem 0xd3800000-0xda3ffff=
f window]
[   14.812006] pci_bus 0000:98: root bus resource [bus 98-ab]
[   14.828122] pci 0000:98:00.0: enabling Extended Tags
[   14.844207] pci 0000:98:00.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:98:00.0
[   14.872126] pci 0000:98:01.0: enabling Extended Tags
[   14.888205] pci 0000:98:01.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:98:01.0
[   14.916126] pci 0000:98:02.0: enabling Extended Tags
[   14.936203] pci 0000:98:02.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:98:02.0
[   14.964126] pci 0000:98:03.0: enabling Extended Tags
[   14.980204] pci 0000:98:03.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:98:03.0
(XEN) PCI add device 0000:98:05.0
(XEN) PCI add device 0000:98:05.2
(XEN) PCI add device 0000:98:05.4
(XEN) PCI add device 0000:98:08.0
(XEN) PCI add device 0000:98:09.0
(XEN) PCI add device 0000:98:0a.0
(XEN) PCI add device 0000:98:0a.1
(XEN) PCI add device 0000:98:0a.2
(XEN) PCI add device 0000:98:0a.3
(XEN) PCI add device 0000:98:0a.4
(XEN) PCI add device 0000:98:0a.5
(XEN) PCI add device 0000:98:0a.6
(XEN) PCI add device 0000:98:0a.7
(XEN) PCI add device 0000:98:0b.0
(XEN) PCI add device 0000:98:0b.1
(XEN) PCI add device 0000:98:0b.2
(XEN) PCI add device 0000:98:0b.3
(XEN) PCI add device 0000:98:0c.0
(XEN) PCI add device 0000:98:0c.1
(XEN) PCI add device 0000:98:0c.2
(XEN) PCI add device 0000:98:0c.3
(XEN) PCI add device 0000:98:0c.4
(XEN) PCI add device 0000:98:0c.5
(XEN) PCI add device 0000:98:0c.6
(XEN) PCI add device 0000:98:0c.7
(XEN) PCI add device 0000:98:0d.0
(XEN) PCI add device 0000:98:0d.1
(XEN) PCI add device 0000:98:0d.2
(XEN) PCI add device 0000:98:0d.3
[   15.284158] pci 0000:98:00.0: PCI bridge to [bus 99]
[   15.300116] pci 0000:98:01.0: PCI bridge to [bus 9a]
[   15.320121] pci 0000:98:02.0: PCI bridge to [bus 9b]
[   15.336113] pci 0000:98:03.0: PCI bridge to [bus 9c]
[   15.352265] ACPI: PCI Root Bridge [PC15] (domain 0000 [bus ac-bf])
[   15.372008] acpi PNP0A08:0f: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI][   15.400026] acpi PNP0A08:0f: _OSC: platform does not su=
pport [AER]
[   15.420784] acpi PNP0A08:0f: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[   15.444005] acpi PNP0A08:0f: FADT indicates ASPM is unsupported, using B=
IOS configuration
[   15.472148] acpiphp: Slot [1-7] registered
[   15.484027] acpiphp: Slot [2-5] registered
[   15.496026] acpiphp: Slot [3-5] registered
[   15.512027] acpiphp: Slot [4-5] registered
[   15.524058] PCI host bridge to bus 0000:ac
[   15.536029] pci_bus 0000:ac: root bus resource [io  0xe000-0xefff window]
[   15.560006] pci_bus 0000:ac: root bus resource [mem 0xda400000-0xe0fffff=
f window]
[   15.584018] pci_bus 0000:ac: root bus resource [bus ac-bf]
[   15.604367] pci 0000:ac:00.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:ac:00.0
(XEN) PCI add device 0000:ac:05.0
(XEN) PCI add device 0000:ac:05.2
(XEN) PCI add device 0000:ac:05.4
(XEN) PCI add device 0000:ac:0e.0
(XEN) PCI add device 0000:ac:0e.1
(XEN) PCI add device 0000:ac:0f.0
(XEN) PCI add device 0000:ac:0f.1
(XEN) PCI add device 0000:ac:10.0
(XEN) PCI add device 0000:ac:10.1
(XEN) PCI add device 0000:ac:12.0
(XEN) PCI add device 0000:ac:12.1
(XEN) PCI add device 0000:ac:12.2
(XEN) PCI add device 0000:ac:12.4
(XEN) PCI add device 0000:ac:12.5
(XEN) PCI add device 0000:ac:15.0
(XEN) PCI add device 0000:ac:15.1
(XEN) PCI add device 0000:ac:16.0
(XEN) PCI add device 0000:ac:16.1
(XEN) PCI add device 0000:ac:16.4
(XEN) PCI add device 0000:ac:16.5
(XEN) PCI add device 0000:ac:17.0
(XEN) PCI add device 0000:ac:17.1
[   15.850848] pci 0000:ad:00.0: VF(n) BAR0 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR0 for 16 VFs)
(XEN) PCI add device 0000:ad:00.0
[   15.898637] pci 0000:ad:00.1: VF(n) BAR0 space: [mem 0x00000000-0x0007ff=
ff 64bit pref] (contains BAR0 for 16 VFs)
(XEN) PCI add device 0000:ad:00.1
[   15.944139] pci 0000:ac:00.0: PCI bridge to [bus ad]
[   15.960345] ACPI: PCI Root Bridge [PC18] (domain 0000 [bus c0-c3])
[   15.980027] acpi PNP0A08:12: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[   16.004547] acpi PNP0A08:12: _OSC: platform does not support [AER]
[   16.024507] acpi PNP0A08:12: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[   16.052005] acpi PNP0A08:12: FADT indicates ASPM is unsupported, using B=
IOS configuration
[   16.076156] acpiphp: Slot [1-8] registered
[   16.092090] PCI host bridge to bus 0000:c0
[   16.104014] pci_bus 0000:c0: root bus resource [io  0xf000-0xffff window]
[   16.124047] pci_bus 0000:c0: root bus resource [mem 0xe1000000-0xe7bffff=
f window]
[   16.152005] pci_bus 0000:c0: root bus resource [bus c0-c3]
(XEN) PCI add device 0000:c0:04.0
(XEN) PCI add device 0000:c0:04.1
(XEN) PCI add device 0000:c0:04.2
(XEN) PCI add device 0000:c0:04.3
(XEN) PCI add device 0000:c0:04.4
(XEN) PCI add device 0000:c0:04.5
(XEN) PCI add device 0000:c0:04.6
(XEN) PCI add device 0000:c0:04.7
(XEN) PCI add device 0000:c0:05.0
(XEN) PCI add device 0000:c0:05.2
(XEN) PCI add device 0000:c0:05.4
(XEN) PCI add device 0000:c0:08.0
(XEN) PCI add device 0000:c0:08.1
(XEN) PCI add device 0000:c0:08.2
[   16.304216] ACPI: PCI Root Bridge [PC19] (domain 0000 [bus c4-d7])
[   16.328008] acpi PNP0A08:13: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[   16.352903] acpi PNP0A08:13: _OSC: platform does not support [AER]
[   16.372784] acpi PNP0A08:13: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[   16.400005] acpi PNP0A08:13: FADT indicates ASPM is unsupported, using B=
IOS configuration
[   16.424087] acpi PNP0A08:13: host bridge window [io  0x0000 window] (ign=
ored, not CPU addressable)
[   16.456097] acpiphp: Slot [1-9] registered
[   16.468026] acpiphp: Slot [2-6] registered
[   16.480027] acpiphp: Slot [3-6] registered
[   16.496026] acpiphp: Slot [4-6] registered
[   16.508111] PCI host bridge to bus 0000:c4
[   16.524006] pci_bus 0000:c4: root bus resource [mem 0xe7c00000-0xee7ffff=
f window]
[   16.548018] pci_bus 0000:c4: root bus resource [bus c4-d7]
(XEN) PCI add device 0000:c4:05.0
(XEN) PCI add device 0000:c4:05.2
(XEN) PCI add device 0000:c4:05.4
(XEN) PCI add device 0000:c4:08.0
(XEN) PCI add device 0000:c4:08.1
(XEN) PCI add device 0000:c4:08.2
(XEN) PCI add device 0000:c4:08.3
(XEN) PCI add device 0000:c4:08.4
(XEN) PCI add device 0000:c4:08.5
(XEN) PCI add device 0000:c4:08.6
(XEN) PCI add device 0000:c4:08.7
(XEN) PCI add device 0000:c4:09.0
(XEN) PCI add device 0000:c4:09.1
(XEN) PCI add device 0000:c4:09.2
(XEN) PCI add device 0000:c4:09.3
(XEN) PCI add device 0000:c4:09.4
(XEN) PCI add device 0000:c4:09.5
(XEN) PCI add device 0000:c4:09.6
(XEN) PCI add device 0000:c4:09.7
(XEN) PCI add device 0000:c4:0a.0
(XEN) PCI add device 0000:c4:0a.1
(XEN) PCI add device 0000:c4:0a.2
(XEN) PCI add device 0000:c4:0a.3
(XEN) PCI add device 0000:c4:0a.4
(XEN) PCI add device 0000:c4:0a.5
(XEN) PCI add device 0000:c4:0a.6
(XEN) PCI add device 0000:c4:0a.7
(XEN) PCI add device 0000:c4:0b.0
(XEN) PCI add device 0000:c4:0b.1
(XEN) PCI add device 0000:c4:0b.2
(XEN) PCI add device 0000:c4:0b.3
(XEN) PCI add device 0000:c4:0e.0
(XEN) PCI add device 0000:c4:0e.1
(XEN) PCI add device 0000:c4:0e.2
(XEN) PCI add device 0000:c4:0e.3
(XEN) PCI add device 0000:c4:0e.4
(XEN) PCI add device 0000:c4:0e.5
(XEN) PCI add device 0000:c4:0e.6
(XEN) PCI add device 0000:c4:0e.7
(XEN) PCI add device 0000:c4:0f.0
(XEN) PCI add device 0000:c4:0f.1
(XEN) PCI add device 0000:c4:0f.2
(XEN) PCI add device 0000:c4:0f.3
(XEN) PCI add device 0000:c4:0f.4
(XEN) PCI add device 0000:c4:0f.5
(XEN) PCI add device 0000:c4:0f.6
(XEN) PCI add device 0000:c4:0f.7
(XEN) PCI add device 0000:c4:10.0
(XEN) PCI add device 0000:c4:10.1
(XEN) PCI add device 0000:c4:10.2
(XEN) PCI add device 0000:c4:10.3
(XEN) PCI add device 0000:c4:10.4
(XEN) PCI add device 0000:c4:10.5
(XEN) PCI add device 0000:c4:10.6
(XEN) PCI add device 0000:c4:10.7
(XEN) PCI add device 0000:c4:11.0
(XEN) PCI add device 0000:c4:11.1
(XEN) PCI add device 0000:c4:11.2
(XEN) PCI add device 0000:c4:11.3
(XEN) PCI add device 0000:c4:1d.0
(XEN) PCI add device 0000:c4:1d.1
(XEN) PCI add device 0000:c4:1d.2
(XEN) PCI add device 0000:c4:1d.3
(XEN) PCI add device 0000:c4:1e.0
(XEN) PCI add device 0000:c4:1e.1
(XEN) PCI add device 0000:c4:1e.2
(XEN) PCI add device 0000:c4:1e.3
(XEN) PCI add device 0000:c4:1e.4
(XEN) PCI add device 0000:c4:1e.5
(XEN) PCI add device 0000:c4:1e.6
[   17.252198] ACPI: PCI Root Bridge [PC20] (domain 0000 [bus d8-eb])
[   17.272007] acpi PNP0A08:14: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[   17.300899] acpi PNP0A08:14: _OSC: platform does not support [AER]
[   17.320784] acpi PNP0A08:14: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[   17.348011] acpi PNP0A08:14: FADT indicates ASPM is unsupported, using B=
IOS configuration
[   17.372073] acpi PNP0A08:14: host bridge window [io  0x0000 window] (ign=
ored, not CPU addressable)
[   17.404089] acpiphp: Slot [1-10] registered
[   17.416027] acpiphp: Slot [2-7] registered
[   17.428026] acpiphp: Slot [3-7] registered
[   17.444025] acpiphp: Slot [4-7] registered
[   17.456064] PCI host bridge to bus 0000:d8
[   17.468016] pci_bus 0000:d8: root bus resource [mem 0xee800000-0xf53ffff=
f window]
[   17.496005] pci_bus 0000:d8: root bus resource [bus d8-eb]
(XEN) PCI add device 0000:d8:05.0
(XEN) PCI add device 0000:d8:05.2
(XEN) PCI add device 0000:d8:05.4
(XEN) PCI add device 0000:d8:08.0
(XEN) PCI add device 0000:d8:09.0
(XEN) PCI add device 0000:d8:0a.0
(XEN) PCI add device 0000:d8:0a.1
(XEN) PCI add device 0000:d8:0a.2
(XEN) PCI add device 0000:d8:0a.3
(XEN) PCI add device 0000:d8:0a.4
(XEN) PCI add device 0000:d8:0a.5
(XEN) PCI add device 0000:d8:0a.6
(XEN) PCI add device 0000:d8:0a.7
(XEN) PCI add device 0000:d8:0b.0
(XEN) PCI add device 0000:d8:0b.1
(XEN) PCI add device 0000:d8:0b.2
(XEN) PCI add device 0000:d8:0b.3
(XEN) PCI add device 0000:d8:0c.0
(XEN) PCI add device 0000:d8:0c.1
(XEN) PCI add device 0000:d8:0c.2
(XEN) PCI add device 0000:d8:0c.3
(XEN) PCI add device 0000:d8:0c.4
(XEN) PCI add device 0000:d8:0c.5
(XEN) PCI add device 0000:d8:0c.6
(XEN) PCI add device 0000:d8:0c.7
(XEN) PCI add device 0000:d8:0d.0
(XEN) PCI add device 0000:d8:0d.1
(XEN) PCI add device 0000:d8:0d.2
(XEN) PCI add device 0000:d8:0d.3
[   17.796225] ACPI: PCI Root Bridge [PC21] (domain 0000 [bus ec-ff])
[   17.816008] acpi PNP0A08:15: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[   17.844908] acpi PNP0A08:15: _OSC: platform does not support [AER]
[   17.864768] acpi PNP0A08:15: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[   17.892004] acpi PNP0A08:15: FADT indicates ASPM is unsupported, using B=
IOS configuration
[   17.916073] acpi PNP0A08:15: host bridge window [io  0x0000 window] (ign=
ored, not CPU addressable)
[   17.948078] acpiphp: Slot [1-11] registered
[   17.960027] acpiphp: Slot [2-8] registered
[   17.972027] acpiphp: Slot [3-8] registered
[   17.988029] acpiphp: Slot [4-8] registered
[   18.000057] PCI host bridge to bus 0000:ec
[   18.012043] pci_bus 0000:ec: root bus resource [mem 0xf5400000-0xfbfffff=
f window]
[   18.036016] pci_bus 0000:ec: root bus resource [bus ec-ff]
[   18.056121] pci 0000:ec:00.0: enabling Extended Tags
[   18.072199] pci 0000:ec:00.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:ec:00.0
[   18.100126] pci 0000:ec:01.0: enabling Extended Tags
[   18.116196] pci 0000:ec:01.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:ec:01.0
[   18.144123] pci 0000:ec:02.0: enabling Extended Tags
[   18.160197] pci 0000:ec:02.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:ec:02.0
[   18.188124] pci 0000:ec:03.0: enabling Extended Tags
[   18.204197] pci 0000:ec:03.0: System wakeup disabled by ACPI
(XEN) PCI add device 0000:ec:03.0
(XEN) PCI add device 0000:ec:05.0
(XEN) PCI add device 0000:ec:05.2
(XEN) PCI add device 0000:ec:05.4
(XEN) PCI add device 0000:ec:0e.0
(XEN) PCI add device 0000:ec:0e.1
(XEN) PCI add device 0000:ec:0f.0
(XEN) PCI add device 0000:ec:0f.1
(XEN) PCI add device 0000:ec:10.0
(XEN) PCI add device 0000:ec:10.1
(XEN) PCI add device 0000:ec:12.0
(XEN) PCI add device 0000:ec:12.1
(XEN) PCI add device 0000:ec:12.2
(XEN) PCI add device 0000:ec:12.4
(XEN) PCI add device 0000:ec:12.5
(XEN) PCI add device 0000:ec:15.0
(XEN) PCI add device 0000:ec:15.1
(XEN) PCI add device 0000:ec:16.0
(XEN) PCI add device 0000:ec:16.1
(XEN) PCI add device 0000:ec:16.4
(XEN) PCI add device 0000:ec:16.5
(XEN) PCI add device 0000:ec:17.0
(XEN) PCI add device 0000:ec:17.1
[   18.452132] pci 0000:ec:00.0: PCI bridge to [bus ed]
[   18.468113] pci 0000:ec:01.0: PCI bridge to [bus ee]
[   18.484113] pci 0000:ec:02.0: PCI bridge to [bus ef]
[   18.500112] pci 0000:ec:03.0: PCI bridge to [bus f0]
[   18.516400] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 *11 12 14=
 15)
[   18.540104] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 *10 11 12 14=
 15)
[   18.560108] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 1=
5)
[   18.584105] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 1=
5)
[   18.608104] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 10 *11 12 14=
 15)
[   18.628107] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 10 *11 12 14=
 15)
[   18.652110] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 10 *11 12 14=
 15)
[   18.676106] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 10 *11 12 14=
 15)
[   18.700804] xen:balloon: Initialising balloon driver
[   18.736870] pci 0000:03:00.0: vgaarb: setting as boot VGA device
[   18.740000] pci 0000:03:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[   18.784171] pci 0000:03:00.0: vgaarb: bridge control possible
[   18.804015] vgaarb: loaded
[   18.812131] EDAC MC: Ver: 3.0.0
[   18.824109] PCI: Using ACPI for IRQ routing
[   18.860159] NetLabel: Initializing
[   18.868004] NetLabel:  domain hash size =3D 128
[   18.884004] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[   18.904020] NetLabel:  unlabeled traffic allowed by default
[   18.920475] clocksource: Switched to clocksource xen
[   18.948434] VFS: Disk quotas dquot_6.6.0
[   18.961221] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[   18.984056] hugetlbfs: disabling because there are no supported hugepage=
 sizes
[   19.008102] AppArmor: AppArmor Filesystem Enabled
[   19.023809] pnp: PnP ACPI init
[   19.035332] system 00:01: [io  0x0500-0x05fe] has been reserved
[   19.054673] system 00:01: [io  0x0400-0x047f] has been reserved
[   19.074402] system 00:01: [io  0x0600-0x061f] has been reserved
[   19.094134] system 00:01: [io  0x0880-0x0883] has been reserved
[   19.113865] system 00:01: [io  0x0800-0x081f] has been reserved
[   19.133599] system 00:01: [mem 0xfed1c000-0xfed3ffff] could not be reser=
ved
[   19.156764] system 00:01: [mem 0xfed45000-0xfed8bfff] has been reserved
[   19.178787] system 00:01: [mem 0xff000000-0xffffffff] has been reserved
[   19.200812] system 00:01: [mem 0xfee00000-0xfeefffff] has been reserved
[   19.222829] system 00:01: [mem 0xfed12000-0xfed1200f] has been reserved
[   19.244852] system 00:01: [mem 0xfed12010-0xfed1201f] has been reserved
[   19.266869] system 00:01: [mem 0xfed1b000-0xfed1bfff] has been reserved
[   19.289456] system 00:02: [io  0x0ca2-0x0cb1] could not be reserved
[   19.309945] system 00:02: [io  0x0a00-0x0a0f] has been reserved
[   19.329675] system 00:02: [io  0x0600-0x061f] has been reserved
[   19.349923] Already setup the GSI :4
[   19.361832] system 00:04: [mem 0xfd000000-0xfdabffff] has been reserved
[   19.383510] system 00:04: [mem 0xfdad0000-0xfdadffff] has been reserved
[   19.405528] system 00:04: [mem 0xfdb00000-0xfdffffff] has been reserved
[   19.427547] system 00:04: [mem 0xfe000000-0xfe00ffff] has been reserved
[   19.449567] system 00:04: [mem 0xfe011000-0xfe01ffff] has been reserved
[   19.471593] system 00:04: [mem 0xfe036000-0xfe03bfff] has been reserved
[   19.493611] system 00:04: [mem 0xfe03d000-0xfe3fffff] has been reserved
[   19.515632] system 00:04: [mem 0xfe410000-0xfe7fffff] has been reserved
[   19.538265] system 00:05: [io  0x0f00-0x0ffe] has been reserved
[   19.559839] system 00:06: [io  0x0200] has been reserved
[   19.577175] pnp: PnP ACPI: found 7 devices
[   19.604151] PM-Timer failed consistency check  (0xffffff) - aborting.
[   19.625214] pci 0000:03:01.0: can't claim BAR 6 [mem 0xfffff800-0xffffff=
ff pref]: no compatible bridge window
[   19.658218] pci 0000:00:1f.4: BAR 0: assigned [mem 0x90000000-0x900000ff=
 64bit]
[   19.682437] pci 0000:00:1c.0: PCI bridge to [bus 01]
[   19.699025] pci 0000:03:01.0: BAR 6: assigned [mem 0x96834000-0x968347ff=
 pref]
[   19.723020] pci 0000:02:00.0: PCI bridge to [bus 03]
[   19.739616] pci 0000:02:00.0:   bridge window [mem 0x95000000-0x968fffff]
[   19.762223] pci 0000:00:1c.3: PCI bridge to [bus 02-03]
[   19.779649] pci 0000:00:1c.3:   bridge window [mem 0x95000000-0x969fffff]
[   19.802256] pci 0000:00:1c.4: PCI bridge to [bus 04]
[   19.818848] pci 0000:00:1d.0: PCI bridge to [bus 05]
[   19.835569] pci 0000:17:00.0: BAR 7: assigned [mem 0x9d518000-0x9d597fff=
 64bit pref]
[   19.861263] pci 0000:17:00.1: BAR 7: no space for [mem size 0x00080000 6=
4bit pref]
[   19.886319] pci 0000:17:00.1: BAR 7: failed to assign [mem size 0x000800=
00 64bit pref]
[   19.912633] pci 0000:16:00.0: PCI bridge to [bus 17]
[   19.929222] pci 0000:16:00.0:   bridge window [mem 0x9d600000-0x9d6fffff]
[   19.951816] pci 0000:16:00.0:   bridge window [mem 0x9d500000-0x9d5fffff=
 64bit pref]
[   19.977561] pci_bus 0000:16: Some PCI device resources are unassigned, t=
ry booting with pci=3Drealloc
[   20.007654] pci 0000:27:00.0: BAR 7: no space for [mem size 0x00400000 6=
4bit pref]
[   20.032745] pci 0000:27:00.0: BAR 7: failed to assign [mem size 0x004000=
00 64bit pref]
[   20.059056] pci 0000:27:00.1: BAR 7: no space for [mem size 0x00400000 6=
4bit pref]
[   20.084220] pci 0000:27:00.1: BAR 7: failed to assign [mem size 0x004000=
00 64bit pref]
[   20.110536] pci 0000:27:00.2: BAR 7: no space for [mem size 0x00400000 6=
4bit pref]
[   20.135698] pci 0000:27:00.2: BAR 7: failed to assign [mem size 0x004000=
00 64bit pref]
[   20.162012] pci 0000:27:00.3: BAR 7: no space for [mem size 0x00400000 6=
4bit pref]
[   20.187175] pci 0000:27:00.3: BAR 7: failed to assign [mem size 0x004000=
00 64bit pref]
[   20.213491] pci 0000:27:00.0: BAR 10: assigned [mem 0xa3020000-0xa309fff=
f 64bit pref]
[   20.239517] pci 0000:27:00.1: BAR 10: no space for [mem size 0x00080000 =
64bit pref]
[   20.264969] pci 0000:27:00.1: BAR 10: failed to assign [mem size 0x00080=
000 64bit pref]
[   20.291568] pci 0000:27:00.2: BAR 10: no space for [mem size 0x00080000 =
64bit pref]
[   20.317016] pci 0000:27:00.2: BAR 10: failed to assign [mem size 0x00080=
000 64bit pref]
[   20.343615] pci 0000:27:00.3: BAR 10: no space for [mem size 0x00080000 =
64bit pref]
[   20.369064] pci 0000:27:00.3: BAR 10: failed to assign [mem size 0x00080=
000 64bit pref]
[   20.395661] pci 0000:26:03.0: PCI bridge to [bus 27]
[   20.412261] pci 0000:26:03.0:   bridge window [mem 0xa4000000-0xa41fffff]
[   20.434853] pci 0000:26:03.0:   bridge window [mem 0x9f000000-0xa30fffff=
 64bit pref]
[   20.460593] pci 0000:25:00.0: PCI bridge to [bus 26-27]
[   20.478035] pci 0000:25:00.0:   bridge window [mem 0xa4000000-0xa41fffff]
[   20.500627] pci 0000:25:00.0:   bridge window [mem 0x9f000000-0xa30fffff=
 64bit pref]
[   20.526370] pci 0000:24:00.0: PCI bridge to [bus 25-27]
[   20.543815] pci 0000:24:00.0:   bridge window [mem 0xa3f00000-0xa42fffff]
[   20.566403] pci 0000:24:00.0:   bridge window [mem 0x9f000000-0xa30fffff=
 64bit pref]
[   20.592148] pci_bus 0000:24: Some PCI device resources are unassigned, t=
ry booting with pci=3Drealloc
[   20.622222] pci 0000:33:00.0: BAR 7: no space for [mem size 0x00200000 6=
4bit pref]
[   20.647334] pci 0000:33:00.0: BAR 7: failed to assign [mem size 0x002000=
00 64bit pref]
[   20.673642] pci 0000:33:00.1: BAR 7: no space for [mem size 0x00200000 6=
4bit pref]
[   20.698809] pci 0000:33:00.1: BAR 7: failed to assign [mem size 0x002000=
00 64bit pref]
[   20.725122] pci 0000:33:00.2: BAR 7: no space for [mem size 0x00200000 6=
4bit pref]
[   20.750284] pci 0000:33:00.2: BAR 7: failed to assign [mem size 0x002000=
00 64bit pref]
[   20.776601] pci 0000:33:00.3: BAR 7: no space for [mem size 0x00200000 6=
4bit pref]
[   20.801769] pci 0000:33:00.3: BAR 7: failed to assign [mem size 0x002000=
00 64bit pref]
[   20.828077] pci 0000:33:00.0: BAR 10: assigned [mem 0xaa020000-0xaa09fff=
f 64bit pref]
[   20.854112] pci 0000:33:00.1: BAR 10: no space for [mem size 0x00080000 =
64bit pref]
[   20.879555] pci 0000:33:00.1: BAR 10: failed to assign [mem size 0x00080=
000 64bit pref]
[   20.906150] pci 0000:33:00.2: BAR 10: no space for [mem size 0x00080000 =
64bit pref]
[   20.931608] pci 0000:33:00.2: BAR 10: failed to assign [mem size 0x00080=
000 64bit pref]
[   20.958206] pci 0000:33:00.3: BAR 10: no space for [mem size 0x00080000 =
64bit pref]
[   20.983653] pci 0000:33:00.3: BAR 10: failed to assign [mem size 0x00080=
000 64bit pref]
[   21.010249] pci 0000:32:00.0: PCI bridge to [bus 33]
[   21.026848] pci 0000:32:00.0:   bridge window [mem 0xaad00000-0xaaefffff]
[   21.049436] pci 0000:32:00.0:   bridge window [mem 0xa6000000-0xaa0fffff=
 64bit pref]
[   21.075184] pci_bus 0000:32: Some PCI device resources are unassigned, t=
ry booting with pci=3Drealloc
[   21.105263] pci 0000:44:00.0: PCI bridge to [bus 45]
[   21.121790] pci 0000:44:00.0:   bridge window [io  0x8000-0x8fff]
[   21.142103] pci 0000:44:00.0:   bridge window [mem 0xb8400000-0xb86fffff]
[   21.164815] pci 0000:58:00.0: BAR 14: assigned [mem 0xb8800000-0xb89ffff=
f]
[   21.187565] pci 0000:58:00.0: BAR 15: assigned [mem 0xb8a00000-0xb8bffff=
f 64bit pref]
[   21.213591] pci 0000:58:01.0: BAR 14: assigned [mem 0xb8c00000-0xb8dffff=
f]
[   21.236469] pci 0000:58:01.0: BAR 15: assigned [mem 0xb8e00000-0xb8fffff=
f 64bit pref]
[   21.262493] pci 0000:58:02.0: BAR 14: assigned [mem 0xb9000000-0xb91ffff=
f]
[   21.285377] pci 0000:58:02.0: BAR 15: assigned [mem 0xb9200000-0xb93ffff=
f 64bit pref]
[   21.311397] pci 0000:58:03.0: BAR 14: assigned [mem 0xb9400000-0xb95ffff=
f]
[   21.334276] pci 0000:58:03.0: BAR 15: assigned [mem 0xb9600000-0xb97ffff=
f 64bit pref]
[   21.360301] pci 0000:58:00.0: BAR 13: assigned [io  0x9000-0x9fff]
[   21.380890] pci 0000:58:01.0: BAR 13: no space for [io  size 0x1000]
[   21.402055] pci 0000:58:01.0: BAR 13: failed to assign [io  size 0x1000]
[   21.424365] pci 0000:58:02.0: BAR 13: no space for [io  size 0x1000]
[   21.445520] pci 0000:58:02.0: BAR 13: failed to assign [io  size 0x1000]
[   21.467833] pci 0000:58:03.0: BAR 13: no space for [io  size 0x1000]
[   21.488996] pci 0000:58:03.0: BAR 13: failed to assign [io  size 0x1000]
[   21.511302] pci 0000:58:03.0: BAR 13: assigned [io  0x9000-0x9fff]
[   21.531895] pci 0000:58:02.0: BAR 13: no space for [io  size 0x1000]
[   21.553059] pci 0000:58:02.0: BAR 13: failed to assign [io  size 0x1000]
[   21.575366] pci 0000:58:01.0: BAR 13: no space for [io  size 0x1000]
[   21.596524] pci 0000:58:01.0: BAR 13: failed to assign [io  size 0x1000]
[   21.618832] pci 0000:58:00.0: BAR 13: no space for [io  size 0x1000]
[   21.639997] pci 0000:58:00.0: BAR 13: failed to assign [io  size 0x1000]
[   21.662308] pci 0000:58:00.0: PCI bridge to [bus 59]
[   21.678898] pci 0000:58:00.0:   bridge window [mem 0xb8800000-0xb89fffff]
[   21.701493] pci 0000:58:00.0:   bridge window [mem 0xb8a00000-0xb8bfffff=
 64bit pref]
[   21.727237] pci 0000:58:01.0: PCI bridge to [bus 5a]
[   21.743819] pci 0000:58:01.0:   bridge window [mem 0xb8c00000-0xb8dfffff]
[   21.766411] pci 0000:58:01.0:   bridge window [mem 0xb8e00000-0xb8ffffff=
 64bit pref]
[   21.792158] pci 0000:58:02.0: PCI bridge to [bus 5b]
[   21.808739] pci 0000:58:02.0:   bridge window [mem 0xb9000000-0xb91fffff]
[   21.831326] pci 0000:58:02.0:   bridge window [mem 0xb9200000-0xb93fffff=
 64bit pref]
[   21.857075] pci 0000:58:03.0: PCI bridge to [bus 5c]
[   21.873653] pci 0000:58:03.0:   bridge window [io  0x9000-0x9fff]
[   21.893961] pci 0000:58:03.0:   bridge window [mem 0xb9400000-0xb95fffff]
[   21.916552] pci 0000:58:03.0:   bridge window [mem 0xb9600000-0xb97fffff=
 64bit pref]
[   21.942349] pci 0000:6d:00.0: BAR 7: no space for [mem size 0x00200000 6=
4bit pref]
[   21.967457] pci 0000:6d:00.0: BAR 7: failed to assign [mem size 0x002000=
00 64bit pref]
[   21.993764] pci 0000:6d:00.1: BAR 7: no space for [mem size 0x00200000 6=
4bit pref]
[   22.018931] pci 0000:6d:00.1: BAR 7: failed to assign [mem size 0x002000=
00 64bit pref]
[   22.045244] pci 0000:6d:00.2: BAR 7: no space for [mem size 0x00200000 6=
4bit pref]
[   22.070407] pci 0000:6d:00.2: BAR 7: failed to assign [mem size 0x002000=
00 64bit pref]
[   22.096724] pci 0000:6d:00.3: BAR 7: no space for [mem size 0x00200000 6=
4bit pref]
[   22.121889] pci 0000:6d:00.3: BAR 7: failed to assign [mem size 0x002000=
00 64bit pref]
[   22.148197] pci 0000:6d:00.0: BAR 10: assigned [mem 0xc5020000-0xc509fff=
f 64bit pref]
[   22.174234] pci 0000:6d:00.1: BAR 10: no space for [mem size 0x00080000 =
64bit pref]
[   22.199676] pci 0000:6d:00.1: BAR 10: failed to assign [mem size 0x00080=
000 64bit pref]
[   22.226275] pci 0000:6d:00.2: BAR 10: no space for [mem size 0x00080000 =
64bit pref]
[   22.251730] pci 0000:6d:00.2: BAR 10: failed to assign [mem size 0x00080=
000 64bit pref]
[   22.278322] pci 0000:6d:00.3: BAR 10: no space for [mem size 0x00080000 =
64bit pref]
[   22.303777] pci 0000:6d:00.3: BAR 10: failed to assign [mem size 0x00080=
000 64bit pref]
[   22.330372] pci 0000:6c:00.0: PCI bridge to [bus 6d]
[   22.346969] pci 0000:6c:00.0:   bridge window [mem 0xc5d00000-0xc5efffff]
[   22.369557] pci 0000:6c:00.0:   bridge window [mem 0xc1000000-0xc50fffff=
 64bit pref]
[   22.395303] pci_bus 0000:6c: Some PCI device resources are unassigned, t=
ry booting with pci=3Drealloc
[   22.425471] pci 0000:98:00.0: BAR 14: assigned [mem 0xd3800000-0xd39ffff=
f]
[   22.448198] pci 0000:98:00.0: BAR 15: assigned [mem 0xd3a00000-0xd3bffff=
f 64bit pref]
[   22.474227] pci 0000:98:01.0: BAR 14: assigned [mem 0xd3c00000-0xd3dffff=
f]
[   22.497106] pci 0000:98:01.0: BAR 15: assigned [mem 0xd3e00000-0xd3fffff=
f 64bit pref]
[   22.523128] pci 0000:98:02.0: BAR 14: assigned [mem 0xd4000000-0xd41ffff=
f]
[   22.546012] pci 0000:98:02.0: BAR 15: assigned [mem 0xd4200000-0xd43ffff=
f 64bit pref]
[   22.572038] pci 0000:98:03.0: BAR 14: assigned [mem 0xd4400000-0xd45ffff=
f]
[   22.594913] pci 0000:98:03.0: BAR 15: assigned [mem 0xd4600000-0xd47ffff=
f 64bit pref]
[   22.620935] pci 0000:98:00.0: BAR 13: assigned [io  0xd000-0xdfff]
[   22.641531] pci 0000:98:01.0: BAR 13: no space for [io  size 0x1000]
[   22.662692] pci 0000:98:01.0: BAR 13: failed to assign [io  size 0x1000]
[   22.685003] pci 0000:98:02.0: BAR 13: no space for [io  size 0x1000]
[   22.706161] pci 0000:98:02.0: BAR 13: failed to assign [io  size 0x1000]
[   22.728467] pci 0000:98:03.0: BAR 13: no space for [io  size 0x1000]
[   22.749633] pci 0000:98:03.0: BAR 13: failed to assign [io  size 0x1000]
[   22.771944] pci 0000:98:03.0: BAR 13: assigned [io  0xd000-0xdfff]
[   22.792529] pci 0000:98:02.0: BAR 13: no space for [io  size 0x1000]
[   22.813694] pci 0000:98:02.0: BAR 13: failed to assign [io  size 0x1000]
[   22.836000] pci 0000:98:01.0: BAR 13: no space for [io  size 0x1000]
[   22.857163] pci 0000:98:01.0: BAR 13: failed to assign [io  size 0x1000]
[   22.879472] pci 0000:98:00.0: BAR 13: no space for [io  size 0x1000]
[   22.900632] pci 0000:98:00.0: BAR 13: failed to assign [io  size 0x1000]
[   22.922941] pci 0000:98:00.0: PCI bridge to [bus 99]
[   22.939535] pci 0000:98:00.0:   bridge window [mem 0xd3800000-0xd39fffff]
[   22.962129] pci 0000:98:00.0:   bridge window [mem 0xd3a00000-0xd3bfffff=
 64bit pref]
[   22.987870] pci 0000:98:01.0: PCI bridge to [bus 9a]
[   23.004453] pci 0000:98:01.0:   bridge window [mem 0xd3c00000-0xd3dfffff]
[   23.027045] pci 0000:98:01.0:   bridge window [mem 0xd3e00000-0xd3ffffff=
 64bit pref]
[   23.052795] pci 0000:98:02.0: PCI bridge to [bus 9b]
[   23.069373] pci 0000:98:02.0:   bridge window [mem 0xd4000000-0xd41fffff]
[   23.091966] pci 0000:98:02.0:   bridge window [mem 0xd4200000-0xd43fffff=
 64bit pref]
[   23.117711] pci 0000:98:03.0: PCI bridge to [bus 9c]
[   23.134288] pci 0000:98:03.0:   bridge window [io  0xd000-0xdfff]
[   23.154597] pci 0000:98:03.0:   bridge window [mem 0xd4400000-0xd45fffff]
[   23.177188] pci 0000:98:03.0:   bridge window [mem 0xd4600000-0xd47fffff=
 64bit pref]
[   23.202988] pci 0000:ad:00.0: BAR 7: assigned [mem 0xe0d18000-0xe0d97fff=
 64bit pref]
[   23.228769] pci 0000:ad:00.1: BAR 7: no space for [mem size 0x00080000 6=
4bit pref]
[   23.253831] pci 0000:ad:00.1: BAR 7: failed to assign [mem size 0x000800=
00 64bit pref]
[   23.280141] pci 0000:ac:00.0: PCI bridge to [bus ad]
[   23.296734] pci 0000:ac:00.0:   bridge window [mem 0xe0e00000-0xe0efffff]
[   23.319327] pci 0000:ac:00.0:   bridge window [mem 0xe0d00000-0xe0dfffff=
 64bit pref]
[   23.345073] pci_bus 0000:ac: Some PCI device resources are unassigned, t=
ry booting with pci=3Drealloc
[   23.375249] pci 0000:ec:00.0: BAR 14: assigned [mem 0xf5400000-0xf55ffff=
f]
[   23.397967] pci 0000:ec:00.0: BAR 15: assigned [mem 0xf5600000-0xf57ffff=
f 64bit pref]
[   23.423995] pci 0000:ec:01.0: BAR 14: assigned [mem 0xf5800000-0xf59ffff=
f]
[   23.446867] pci 0000:ec:01.0: BAR 15: assigned [mem 0xf5a00000-0xf5bffff=
f 64bit pref]
[   23.472900] pci 0000:ec:02.0: BAR 14: assigned [mem 0xf5c00000-0xf5dffff=
f]
[   23.495777] pci 0000:ec:02.0: BAR 15: assigned [mem 0xf5e00000-0xf5fffff=
f 64bit pref]
[   23.521801] pci 0000:ec:03.0: BAR 14: assigned [mem 0xf6000000-0xf61ffff=
f]
[   23.544680] pci 0000:ec:03.0: BAR 15: assigned [mem 0xf6200000-0xf63ffff=
f 64bit pref]
[   23.570706] pci 0000:ec:00.0: BAR 13: no space for [io  size 0x1000]
[   23.591866] pci 0000:ec:00.0: BAR 13: failed to assign [io  size 0x1000]
[   23.614177] pci 0000:ec:01.0: BAR 13: no space for [io  size 0x1000]
[   23.635340] pci 0000:ec:01.0: BAR 13: failed to assign [io  size 0x1000]
[   23.657643] pci 0000:ec:02.0: BAR 13: no space for [io  size 0x1000]
[   23.678808] pci 0000:ec:02.0: BAR 13: failed to assign [io  size 0x1000]
[   23.701113] pci 0000:ec:03.0: BAR 13: no space for [io  size 0x1000]
[   23.722275] pci 0000:ec:03.0: BAR 13: failed to assign [io  size 0x1000]
[   23.744588] pci 0000:ec:03.0: BAR 13: no space for [io  size 0x1000]
[   23.765750] pci 0000:ec:03.0: BAR 13: failed to assign [io  size 0x1000]
[   23.788053] pci 0000:ec:02.0: BAR 13: no space for [io  size 0x1000]
[   23.809219] pci 0000:ec:02.0: BAR 13: failed to assign [io  size 0x1000]
[   23.831527] pci 0000:ec:01.0: BAR 13: no space for [io  size 0x1000]
[   23.852685] pci 0000:ec:01.0: BAR 13: failed to assign [io  size 0x1000]
[   23.874994] pci 0000:ec:00.0: BAR 13: no space for [io  size 0x1000]
[   23.896158] pci 0000:ec:00.0: BAR 13: failed to assign [io  size 0x1000]
[   23.918462] pci 0000:ec:00.0: PCI bridge to [bus ed]
[   23.935056] pci 0000:ec:00.0:   bridge window [mem 0xf5400000-0xf55fffff]
[   23.957653] pci 0000:ec:00.0:   bridge window [mem 0xf5600000-0xf57fffff=
 64bit pref]
[   23.983400] pci 0000:ec:01.0: PCI bridge to [bus ee]
[   23.999978] pci 0000:ec:01.0:   bridge window [mem 0xf5800000-0xf59fffff]
[   24.022575] pci 0000:ec:01.0:   bridge window [mem 0xf5a00000-0xf5bfffff=
 64bit pref]
[   24.048314] pci 0000:ec:02.0: PCI bridge to [bus ef]
[   24.064899] pci 0000:ec:02.0:   bridge window [mem 0xf5c00000-0xf5dfffff]
[   24.087490] pci 0000:ec:02.0:   bridge window [mem 0xf5e00000-0xf5ffffff=
 64bit pref]
[   24.113238] pci 0000:ec:03.0: PCI bridge to [bus f0]
[   24.129817] pci 0000:ec:03.0:   bridge window [mem 0xf6000000-0xf61fffff]
[   24.152411] pci 0000:ec:03.0:   bridge window [mem 0xf6200000-0xf63fffff=
 64bit pref]
[   24.178275] NET: Registered protocol family 2
[   24.194137] TCP established hash table entries: 524288 (order: 10, 41943=
04 bytes)
[   24.219423] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[   24.241504] TCP: Hash tables configured (established 524288 bind 65536)
[   24.264028] UDP hash table entries: 65536 (order: 9, 2097152 bytes)
[   24.285316] UDP-Lite hash table entries: 65536 (order: 9, 2097152 bytes)
[   24.307758] NET: Registered protocol family 1
[   24.322537] pci 0000:03:00.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[   24.350629] Unpacking initramfs...
[   25.394928] Freeing initrd memory: 15436K
[   25.413312] RAPL PMU: API unit is 2^-32 Joules, 3 fixed counters, 655360=
 ms ovfl timer[   25.439270] RAPL PMU: hw unit of domain pp0-core 2^-14 Jou=
les
[   25.458429] RAPL PMU: hw unit of domain package 2^-14 Joules
[   25.477306] RAPL PMU: hw unit of domain dram 2^-16 Joules
[   25.495421] Scanning for low memory corruption every 60 seconds
[   25.516739] audit: initializing netlink subsys (disabled)
[   25.534637] audit: type=3D2000 audit(1573561347.343:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[   25.534906] Initialise system trusted keyrings
[   25.577725] Key type blacklist registered
[   25.591401] workingset: timestamp_bits=3D36 max_order=3D25 bucket_order=
=3D0
[   25.618054] zbud: loaded
[   25.775991] Key type asymmetric registered
[   25.789280] Asymmetric key parser 'x509' registered
[   25.805621] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 248)
[   25.830606] io scheduler noop registered
[   25.843337] io scheduler deadline registered
[   25.857663] io scheduler cfq registered (default)
[   25.873361] io scheduler mq-deadline registered
[   25.888516] io scheduler kyber registered
[   25.901983] io scheduler bfq registered
[   25.920183] Already setup the GSI :16
[   25.932670] Already setup the GSI :16
[   25.944782] Already setup the GSI :16
[   25.957877] Already setup the GSI :40
[   25.970863] Already setup the GSI :95
[   25.982970] Already setup the GSI :95
[   25.995271] Already setup the GSI :95
[   26.008202] Already setup the GSI :143
[   26.020596] Already setup the GSI :143
[   26.033178] Already setup the GSI :143
[   26.046386] Already setup the GSI :199
[   26.058766] Already setup the GSI :199
[   26.071355] Already setup the GSI :199
[   26.083947] pcieport 0000:00:1c.0: Signaling PME with IRQ 650
[   26.102901] pcieport 0000:00:1c.3: Signaling PME with IRQ 651
[   26.122062] pcieport 0000:00:1c.4: Signaling PME with IRQ 652
[   26.141222] pcieport 0000:00:1d.0: Signaling PME with IRQ 653
[   26.160387] pcieport 0000:16:00.0: Signaling PME with IRQ 654
[   26.179537] pcieport 0000:24:00.0: Signaling PME with IRQ 655
[   26.198704] pcieport 0000:32:00.0: Signaling PME with IRQ 656
[   26.217862] pcieport 0000:44:00.0: Signaling PME with IRQ 657
[   26.237024] pcieport 0000:58:00.0: Signaling PME with IRQ 658
[   26.256184] pcieport 0000:58:01.0: Signaling PME with IRQ 659
[   26.275345] pcieport 0000:58:02.0: Signaling PME with IRQ 660
[   26.294511] pcieport 0000:58:03.0: Signaling PME with IRQ 661
[   26.313670] pcieport 0000:6c:00.0: Signaling PME with IRQ 662
[   26.332826] pcieport 0000:98:00.0: Signaling PME with IRQ 663
[   26.351990] pcieport 0000:98:01.0: Signaling PME with IRQ 664
[   26.371150] pcieport 0000:98:02.0: Signaling PME with IRQ 665
[   26.390312] pcieport 0000:98:03.0: Signaling PME with IRQ 666
[   26.409475] pcieport 0000:ac:00.0: Signaling PME with IRQ 667
[   26.428637] pcieport 0000:ec:00.0: Signaling PME with IRQ 668
[   26.447793] pcieport 0000:ec:01.0: Signaling PME with IRQ 669
[   26.466955] pcieport 0000:ec:02.0: Signaling PME with IRQ 670
[   26.486115] pcieport 0000:ec:03.0: Signaling PME with IRQ 671
[   26.505263] pciehp 0000:58:00.0:pcie004: Slot #28 AttnBtn- PwrCtrl- MRL-=
 AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   26.524106] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x284=
4758759d, max_idle_ns: 440795236302 ns
[   26.546474] pciehp 0000:58:01.0:pcie004: Slot #29 AttnBtn- PwrCtrl- MRL-=
 AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   26.620818] pciehp 0000:58:02.0:pcie004: Slot #30 AttnBtn- PwrCtrl- MRL-=
 AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   26.661999] pciehp 0000:58:03.0:pcie004: Slot #31 AttnBtn- PwrCtrl- MRL-=
 AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   26.703188] pciehp 0000:98:00.0:pcie004: Slot #24 AttnBtn- PwrCtrl- MRL-=
 AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   26.744362] pciehp 0000:98:01.0:pcie004: Slot #25 AttnBtn- PwrCtrl- MRL-=
 AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   26.785548] pciehp 0000:98:02.0:pcie004: Slot #26 AttnBtn- PwrCtrl- MRL-=
 AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   26.826725] pciehp 0000:98:03.0:pcie004: Slot #27 AttnBtn- PwrCtrl- MRL-=
 AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   26.867912] pciehp 0000:ec:00.0:pcie004: Slot #20 AttnBtn- PwrCtrl- MRL-=
 AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   26.909087] pciehp 0000:ec:01.0:pcie004: Slot #21 AttnBtn- PwrCtrl- MRL-=
 AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   26.950271] pciehp 0000:ec:02.0:pcie004: Slot #22 AttnBtn- PwrCtrl- MRL-=
 AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   26.991453] pciehp 0000:ec:03.0:pcie004: Slot #23 AttnBtn- PwrCtrl- MRL-=
 AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   27.032867] vesafb: mode is 1024x768x16, linelength=3D2048, pages=3D0
[   27.052899] vesafb: scrolling: redraw
[   27.065204] vesafb: Truecolor: size=3D1:5:5:5, shift=3D15:10:5:0
[   27.084843] vesafb: framebuffer at 0x95000000, mapped to 0xffffc90049400=
000, using 3072k, total 8128k
[   27.179136] Console: switching to colour frame buffer device 128x48
[   27.264147] fb0: VESA VGA frame buffer device
[   27.299346] ERST: Error Record Serialization Table (ERST) support is ini=
tialized.
[   27.324446] pstore: using zlib compression
[   27.338170] pstore: Registered erst as persistent store backend
[   27.358878] GHES: APEI firmware first mode is enabled by APEI bit and WH=
EA _OSC.
[   27.384243] xen_mcelog: /dev/mcelog registered by Xen
[   27.401814] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
(XEN) d0: Forcing read-only access to MFN fed00
[   27.439213] hpet_acpi_add: no address or irqs in _CRS
[   27.456201] Non-volatile memory driver v1.3
[   27.470218] Linux agpgart interface v0.103
[   27.498179] i8042: PNP: No PS/2 controller found.
[   27.514038] mousedev: PS/2 mouse device common for all mice
[   27.532708] rtc_cmos 00:00: RTC can wake from S4
[   27.548417] rtc_cmos 00:00: rtc core: registered rtc_cmos as rtc0
[   27.568893] rtc_cmos 00:00: alarms up to one month, y3k, 114 bytes nvram
[   27.591510] clocksource: Switched to clocksource tsc
[   27.610052] ledtrig-cpu: registered to indicate activity on CPUs
[   27.630211] hidraw: raw HID events driver (C) Jiri Kosina
[   27.648980] NET: Registered protocol family 10
[   27.671913] Segment Routing with IPv6
[   27.688500] dev_mcelog: Unable to init device /dev/mcelog, already regis=
tered
[   27.688541] sched_clock: Marking stable (27688493126, 0)->(89868199031, =
=2D62179705905)
[   27.743480] registered taskstats version 1
[   27.788342] Loading compiled-in X.509 certificates
[   27.835279] Loaded X.509 cert 'SUSE Linux Enterprise Secure Boot Signkey=
: 3fb077b6cebc6ff2522e1c148c57c777c788e3e7'
[   27.901935] zswap: loaded using pool lzo/zbud
[   27.950488] page_owner is disabled
[   27.992805] Key type trusted registered
[   28.043392] Key type encrypted registered
[   28.086822] AppArmor: AppArmor sha1 policy hashing enabled
[   28.135030] ima: No TPM chip found, activating TPM-bypass! (rc=3D-19)
[   28.185737] ima: Allocated hash algorithm: sha256
[   28.230839] evm: HMAC attrs: 0x1
[   28.273889]   Magic number: 11:28:380
[   28.307633] Freeing unused kernel memory: 2540K
[   28.364103] Write protecting the kernel read-only data: 16384k
[   28.413652] Freeing unused kernel memory: 2016K
[   28.447503] Freeing unused kernel memory: 772K
[   28.493954] alg: No test for pkcs1pad(rsa,sha256) (pkcs1pad(rsa-generic,=
sha256))
[   28.613582] systemd[1]: systemd 228 running in system mode. (+PAM -AUDIT=
 +SELINUX -IMA +APPARMOR -SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT -GNU=
TLS +ACL +XZ -LZ4 +SECCOMP +BLKID -ELFUTILS +KMOD -IDN)
[   28.729906] systemd[1]: Detected architecture x86-64.
[   28.774635] systemd[1]: Running in initial RAM disk.
[   28.819109] systemd[1]: Set hostname to <linux-v37i>.
[   28.996700] systemd[1]: Listening on Journal Audit Socket.
[   29.042608] systemd[1]: Reached target Local File Systems.
[   29.088130] systemd[1]: Listening on udev Control Socket.
[   29.133775] systemd[1]: Created slice System Slice.
[   29.176653] systemd[1]: Reached target Slices.
[   29.217649] systemd[1]: Listening on udev Kernel Socket.
[   29.281387] SCSI subsystem initialized
[   29.284587] alua: device handler registered
[   29.287117] emc: device handler registered
[   29.289687] rdac: device handler registered
[   29.296774] device-mapper: uevent: version 1.0.3
[   29.296866] device-mapper: ioctl: 4.37.0-ioctl (2017-09-20) initialised:=
 dm-devel@redhat.com
[   30.175324] ACPI: bus type USB registered
[   30.175346] usbcore: registered new interface driver usbfs
[   30.175354] usbcore: registered new interface driver hub
[   30.176203] usbcore: registered new device driver usb
[   30.248196] megasas: 07.704.04.00-rc1
[   30.261171] megaraid_sas 0000:45:00.0: FW now in Ready state
[   30.280409] megaraid_sas 0000:45:00.0: 64 bit DMA mask and 32 bit consis=
tent mask
[   30.306050] megaraid_sas 0000:45:00.0: firmware supports msix        : (=
96)
[   30.327682] megaraid_sas 0000:45:00.0: current msix/online cpus      : (=
64/64)
[   30.327684] megaraid_sas 0000:45:00.0: RDPQ mode     : (disabled)
[   30.327685] megaraid_sas 0000:45:00.0: Current firmware supports maximum=
 commands: 928        LDIO thershold: 0
[   30.337712] megaraid_sas 0000:45:00.0: Configured max firmware commands:=
 927
[   30.437510] Already setup the GSI :16
[   30.448117] ahci 0000:00:17.0: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0x=
ff impl SATA mode
[   30.448118] ahci 0000:00:17.0: flags: 64bit ncq sntf pm led clo only pio=
 slum part ems deso sadm sds apst=20
[   30.458194] megaraid_sas 0000:45:00.0: FW supports sync cache        : Y=
es
[   30.476114] fb: switching to mgag200drmfb from VESA VGA
[   30.487927] Emulex LightPulse Fibre Channel SCSI driver 12.0.0.6
[   30.487927] Copyright (C) 2017-2018 Broadcom. All Rights Reserved. The t=
erm "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
[   30.517096] scsi host1: ahci
[   30.540128] megaraid_sas 0000:45:00.0: firmware type : Extended VD(240 V=
D)firmware
[   30.567281] scsi host2: ahci
[   30.588129] megaraid_sas 0000:45:00.0: controller type       : MR(2048MB)
[   30.588131] megaraid_sas 0000:45:00.0: Online Controller Reset(OCR)  : E=
nabled
[   30.588131] megaraid_sas 0000:45:00.0: Secure JBOD support   : Yes
[   30.588132] megaraid_sas 0000:45:00.0: NVMe passthru support : No
[   30.627811] megaraid_sas 0000:45:00.0: INIT adapter done
[   30.667994] scsi host3: ahci
[   30.672127] lpfc 0000:17:00.0: 0:6101 Disabling NVME support: Not suppor=
ted by firmware: 1 1
[   30.672129] lpfc 0000:17:00.0: 0:2574 IO channels: irqs 4 fcp 4 nvme 0 M=
RQ: 16
[   30.673030] scsi host4: Emulex LPe32000 16Gb PCIe Fibre Channel Adapter =
on PCI bus 17 device 00 irq 32
[   30.682250] megaraid_sas 0000:45:00.0: pci id                : (0x1000)/=
(0x005d)/(0x1734)/(0x1212)
[   30.703530] scsi host5: ahci
[   30.712773] megaraid_sas 0000:45:00.0: unevenspan support    : no
[   30.712774] megaraid_sas 0000:45:00.0: firmware crash dump   : yes
[   30.712775] megaraid_sas 0000:45:00.0: jbod sync map         : yes
[   30.712777] scsi host0: Avago SAS based MegaRAID driver
[   30.734851] scsi 0:2:0:0: Direct-Access     FTS      PRAID EP420i     4.=
68 PQ: 0 ANSI: 5
[   30.758635] scsi host6: ahci
[   30.778728] scsi 0:2:0:0: Attached scsi generic sg0 type 0
[   30.799312] scsi host7: ahci
[   30.817176] scsi 0:2:1:0: Direct-Access     FTS      PRAID EP420i     4.=
68 PQ: 0 ANSI: 5
[   30.826792] scsi host8: ahci
[   30.855153] scsi 0:2:1:0: Attached scsi generic sg1 type 0
[   30.879676] scsi host9: ahci
[   30.911206] scsi 0:2:2:0: Direct-Access     FTS      PRAID EP420i     4.=
68 PQ: 0 ANSI: 5
[   30.936862] ata1: SATA max UDMA/133 abar m524288@0x96a00000 port 0x96a00=
100 irq 738
[   30.946857] scsi 0:2:2:0: Attached scsi generic sg2 type 0
[   30.966300] ata2: SATA max UDMA/133 abar m524288@0x96a00000 port 0x96a00=
180 irq 738
[   30.966302] ata3: SATA max UDMA/133 abar m524288@0x96a00000 port 0x96a00=
200 irq 738
[   30.966303] ata4: SATA max UDMA/133 abar m524288@0x96a00000 port 0x96a00=
280 irq 738
[   30.966305] ata5: SATA max UDMA/133 abar m524288@0x96a00000 port 0x96a00=
300 irq 738
[   30.966308] ata6: SATA max UDMA/133 abar m524288@0x96a00000 port 0x96a00=
380 irq 738
[   30.986713] scsi 0:2:3:0: Direct-Access     FTS      PRAID EP420i     4.=
68 PQ: 0 ANSI: 5
[   31.005290] ata7: SATA max UDMA/133 abar m524288@0x96a00000 port 0x96a00=
400 irq 738
[   31.005292] ata8: SATA max UDMA/133 abar m524288@0x96a00000 port 0x96a00=
480 irq 738
[   31.023090] scsi 0:2:3:0: Attached scsi generic sg3 type 0
[   31.050251] Already setup the GSI :16
[   31.060265] scsi 0:2:4:0: Direct-Access     FTS      PRAID EP420i     4.=
68 PQ: 0 ANSI: 5
[   31.078694] xhci_hcd 0000:00:14.0: xHCI Host Controller
[   31.088551] scsi 0:2:4:0: Attached scsi generic sg4 type 0
[   31.115712] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 1
[   31.125818] scsi 0:2:5:0: Direct-Access     FTS      PRAID EP420i     4.=
68 PQ: 0 ANSI: 5
[   31.145161] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x1=
00 quirks 0x00009810
[   31.154033] scsi 0:2:5:0: Attached scsi generic sg5 type 0
[   31.319290] ata4: SATA link down (SStatus 0 SControl 300)
[   31.536873] lpfc 0000:17:00.0: 0:3176 Port Name 0 Physical Link is funct=
ional
[   31.560165] ata5: SATA link down (SStatus 0 SControl 300)
[   31.647604] ata1: SATA link down (SStatus 0 SControl 300)
[   31.739200] ata8: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[   31.739626] sd 0:2:0:0: [sda] 109051904 512-byte logical blocks: (55.8 G=
B/52.0 GiB)
[   31.739628] sd 0:2:0:0: [sda] 4096-byte physical blocks
[   31.739662] sd 0:2:0:0: [sda] Write Protect is off
[   31.739750] sd 0:2:0:0: [sda] Write cache: disabled, read cache: enabled=
, doesn't support DPO or FUA
[   31.739862] sd 0:2:1:0: [sdb] 419430400 512-byte logical blocks: (215 GB=
/200 GiB)
[   31.739863] sd 0:2:1:0: [sdb] 4096-byte physical blocks
[   31.739920] sd 0:2:1:0: [sdb] Write Protect is off
[   31.739950] sd 0:2:2:0: [sdc] 109051904 512-byte logical blocks: (55.8 G=
B/52.0 GiB)
[   31.739952] sd 0:2:2:0: [sdc] 4096-byte physical blocks
[   31.739988] sd 0:2:2:0: [sdc] Write Protect is off
[   31.740015] sd 0:2:1:0: [sdb] Write cache: disabled, read cache: enabled=
, doesn't support DPO or FUA
[   31.740322] sd 0:2:3:0: [sdd] 209715200 512-byte logical blocks: (107 GB=
/100 GiB)
[   31.740324] sd 0:2:3:0: [sdd] 4096-byte physical blocks
[   31.740340] sd 0:2:2:0: [sdc] Write cache: disabled, read cache: enabled=
, doesn't support DPO or FUA
[   31.740373] sd 0:2:3:0: [sdd] Write Protect is off
[   31.740471] sd 0:2:3:0: [sdd] Write cache: disabled, read cache: enabled=
, doesn't support DPO or FUA
[   31.740508] sd 0:2:4:0: [sde] 62914560 512-byte logical blocks: (32.2 GB=
/30.0 GiB)
[   31.740510] sd 0:2:4:0: [sde] 4096-byte physical blocks
[   31.740517] sd 0:2:5:0: [sdf] 167772160 512-byte logical blocks: (85.9 G=
B/80.0 GiB)
[   31.740518] sd 0:2:5:0: [sdf] 4096-byte physical blocks
[   31.740557] sd 0:2:4:0: [sde] Write Protect is off
[   31.740565] sd 0:2:5:0: [sdf] Write Protect is off
[   31.740663] sd 0:2:4:0: [sde] Write cache: disabled, read cache: enabled=
, doesn't support DPO or FUA
[   31.740680] sd 0:2:5:0: [sdf] Write cache: disabled, read cache: enabled=
, doesn't support DPO or FUA
[   31.740957]  sdc: sdc1 sdc2 sdc3
[   31.741555] sd 0:2:2:0: [sdc] Attached SCSI disk
[   31.741642]  sdf: sdf1
[   31.741674]  sde: sde1
[   31.742153] sd 0:2:5:0: [sdf] Attached SCSI disk
[   31.742175] sd 0:2:4:0: [sde] Attached SCSI disk
[   31.748478]  sdd: sdd1 sdd2
[   31.749030] sd 0:2:3:0: [sdd] Attached SCSI disk
[   31.752076]  sda: sda1 sda2 sda3
[   31.752596] sd 0:2:0:0: [sda] Attached SCSI disk
[   31.754063]  sdb: sdb1 sdb2
[   31.754510] sd 0:2:1:0: [sdb] Attached SCSI disk
[   31.960083] lpfc 0000:17:00.1: 1:6101 Disabling NVME support: Not suppor=
ted by firmware: 1 1
[   31.983545] ata7: SATA link down (SStatus 0 SControl 300)
[   32.026722] lpfc 0000:17:00.1: 1:2574 IO channels: irqs 4 fcp 4 nvme 0 M=
RQ: 16
[   32.076040] ata3: SATA link down (SStatus 0 SControl 300)
[   32.120539] scsi host10: Emulex LPe32000 16Gb PCIe Fibre Channel Adapter=
 on PCI bus 17 device 01 irq 36
[   32.153835] ata6: SATA link down (SStatus 0 SControl 300)
[   32.496409] lpfc 0000:17:00.0: 0:1303 Link Up Event x1 received Data: x1=
 x0 x80 x0 x0 x0 0
[   32.527229] ata8.00: ATAPI: HL-DT-ST DVDRAM GUD0N, GF01, max UDMA/133
[   33.009042] lpfc 0000:17:00.1: 1:3176 Port Name 1 Physical Link is funct=
ional
[   33.041064] ata2: SATA link down (SStatus 0 SControl 300)
[   33.125523] ata8.00: configured for UDMA/133
[   33.231371] scsi 9:0:0:0: CD-ROM            HL-DT-ST DVDRAM GUD0N     GF=
01 PQ: 0 ANSI: 5
[   33.436125] lpfc 0000:ad:00.0: 2:6101 Disabling NVME support: Not suppor=
ted by firmware: 1 1
[   33.476765] scsi 9:0:0:0: Attached scsi generic sg6 type 5
[   33.513836] lpfc 0000:ad:00.0: 2:2574 IO channels: irqs 4 fcp 4 nvme 0 M=
RQ: 16
[   33.514863] scsi host11: Emulex LPe32000 16Gb PCIe Fibre Channel Adapter=
 on PCI bus ad device 00 irq 131
[   34.429846] sr 9:0:0:0: [sr0] scsi3-mmc drive: 62x/62x writer dvd-ram cd=
/rw xa/form2 cdda tray
[   34.429848] cdrom: Uniform CD-ROM driver Revision: 3.20
[   34.586466] Console: switching to colour dummy device 80x25
[   34.586820] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002
[   34.627443] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[   34.627445] usb usb1: Product: xHCI Host Controller
[   34.627446] usb usb1: Manufacturer: Linux 4.12.14-94.41-default xhci-hcd
[   34.627446] usb usb1: SerialNumber: 0000:00:14.0
[   34.627731] hub 1-0:1.0: USB hub found
[   34.718218] hub 1-0:1.0: 16 ports detected
[   34.720142] xhci_hcd 0000:00:14.0: xHCI Host Controller
[   34.749283] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 2
[   34.749642] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003
[   34.796471] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[   34.796472] usb usb2: Product: xHCI Host Controller
[   34.796473] usb usb2: Manufacturer: Linux 4.12.14-94.41-default xhci-hcd
[   34.796474] usb usb2: SerialNumber: 0000:00:14.0
[   34.796790] hub 2-0:1.0: USB hub found
[   34.836837] hub 2-0:1.0: 10 ports detected
[   34.859114] Already setup the GSI :19
[   34.913231] Already setup the GSI :19
[   34.940117] [TTM] Zone  kernel: Available graphics memory: 64436078 kiB
[   34.940118] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[   34.940119] [TTM] Initializing pool allocator
[   34.940124] [TTM] Initializing DMA pool allocator
[   35.014137] fbcon: mgadrmfb (fb0) is primary device
[   35.014199] Console: switching to colour frame buffer device 128x48
[   35.052041] usb 1-1: new full-speed USB device number 2 using xhci_hcd
[   35.204823] usb 1-1: New USB device found, idVendor=3D0624, idProduct=3D=
0415
[   35.204826] usb 1-1: New USB device strings: Mfr=3D2, Product=3D3, Seria=
lNumber=3D1
[   35.204827] usb 1-1: Product: FTS A3C40078042
[   35.204829] usb 1-1: Manufacturer: =C3=9D=C3=90
[   35.204830] usb 1-1: SerialNumber: 23441500178
[   35.336062] usb 1-7: new high-speed USB device number 3 using xhci_hcd
[   35.343562] mgag200 0000:03:00.0: fb0: mgadrmfb frame buffer device
[   35.349087] lpfc 0000:ad:00.0: 2:3176 Port Name 0 Physical Link is funct=
ional
[   35.514515] usb 1-7: New USB device found, idVendor=3D046b, idProduct=3D=
ff01
[   35.542607] usb 1-7: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   35.542608] usb 1-7: Product: Virtual Hub
[   35.542608] usb 1-7: Manufacturer: American Megatrends Inc.
[   35.542609] usb 1-7: SerialNumber: serial
[   35.546691] hub 1-7:1.0: USB hub found
[   35.556108] lpfc 0000:ad:00.1: 3:6101 Disabling NVME support: Not suppor=
ted by firmware: 1 1
[   35.556113] lpfc 0000:ad:00.1: 3:2574 IO channels: irqs 4 fcp 4 nvme 0 M=
RQ: 16
[   35.557141] scsi host12: Emulex LPe32000 16Gb PCIe Fibre Channel Adapter=
 on PCI bus ad device 01 irq 134
[   35.708998] hub 1-7:1.0: 7 ports detected
[   35.716077] [drm] Initialized mgag200 1.0.0 20110418 for 0000:03:00.0 on=
 minor 0
[   35.840019] usb 1-13: new high-speed USB device number 4 using xhci_hcd
[   36.008490] usb 1-13: New USB device found, idVendor=3D0451, idProduct=
=3D8027
[   36.031321] usb 1-13: New USB device strings: Mfr=3D0, Product=3D0, Seri=
alNumber=3D1
[   36.055565] usb 1-13: SerialNumber: 9C010869A0A6
[   36.071661] hub 1-13:1.0: USB hub found
[   36.084693] hub 1-13:1.0: 2 ports detected
[   36.113710] usbcore: registered new interface driver usbhid
[   36.113733] usb-storage 1-1:1.2: USB Mass Storage device detected
[   36.132441] usbhid: USB HID core driver
[   36.164060] usb 1-7.1: new high-speed USB device number 5 using xhci_hcd
[   36.166552] scsi host13: usb-storage 1-1:1.2
[   36.203311] usb-storage 1-1:1.3: USB Mass Storage device detected
[   36.224296] scsi host14: usb-storage 1-1:1.3
[   36.238805] usbcore: registered new interface driver usb-storage
[   36.239311] input: =C3=9D=C3=90 FTS A3C40078042 as /devices/pci0000:00/0=
000:00:14.0/usb1/1-1/1-1:1.0/0003:0624:0415.0001/input/input0
[   36.297855] lpfc 0000:ad:00.0: 2:1303 Link Up Event x1 received Data: x1=
 x0 x80 x0 x0 x0 0
[   36.329327] usbcore: registered new interface driver uas
[   36.341413] usb 1-7.1: New USB device found, idVendor=3D046b, idProduct=
=3Dff10
[   36.356516] hid-generic 0003:0624:0415.0001: input,hidraw0: USB HID v1.1=
0 Keyboard [=C3=9D=C3=90 FTS A3C40078042] on usb-0000:00:14.0-1/input0
[   36.365015] lpfc 0000:ad:00.1: 3:3176 Port Name 1 Physical Link is funct=
ional
[   36.370511] usb 1-7.1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[   36.412243] input: =C3=9D=C3=90 FTS A3C40078042 as /devices/pci0000:00/0=
000:00:14.0/usb1/1-1/1-1:1.1/0003:0624:0415.0002/input/input1
[   36.436014] usb 1-7.1: Product: Virtual Keyboard and Mouse
[   36.518212] usb 1-7.1: Manufacturer: American Megatrends Inc.
[   36.520379] hid-generic 0003:0624:0415.0002: input,hidraw1: USB HID v1.1=
0 Mouse [=C3=9D=C3=90 FTS A3C40078042] on usb-0000:00:14.0-1/input1
[   36.539363] input: American Megatrends Inc. Virtual Keyboard and Mouse a=
s /devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7.1/1-7.1:1.0/0003:046B:FF10.=
0003/input/input2
[   36.628552] hid-generic 0003:046B:FF10.0003: input,hidraw2: USB HID v1.1=
0 Keyboard [American Megatrends Inc. Virtual Keyboard and Mouse] on usb-000=
0:00:14.0-7.1/input0
[   36.680382] input: American Megatrends Inc. Virtual Keyboard and Mouse a=
s /devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7.1/1-7.1:1.1/0003:046B:FF10.=
0004/input/input3
[   36.730591] hid-generic 0003:046B:FF10.0004: input,hidraw3: USB HID v1.1=
0 Mouse [American Megatrends Inc. Virtual Keyboard and Mouse] on usb-0000:0=
0:14.0-7.1/input1
[   37.214753] scsi 13:0:0:0: CD-ROM            KVM      vmDisk-CD        0=
=2E01 PQ: 0 ANSI: 0
[   37.247843] scsi 14:0:0:0: Direct-Access     KVM      vmDisk           0=
=2E01 PQ: 0 ANSI: 0
[   37.275786] sd 14:0:0:0: Attached scsi generic sg7 type 0
[   37.294589] sr 13:0:0:0: [sr1] scsi-1 drive
[   37.309347] sr 13:0:0:0: Attached scsi generic sg8 type 5
[   37.329723] sd 14:0:0:0: [sdg] Attached SCSI removable disk
[   38.666985] EXT4-fs (sdb2): mounting ext3 file system using the ext4 sub=
system
[   38.704800] EXT4-fs (sdb2): mounted filesystem with ordered data mode. O=
pts: (null)
[   39.099417] systemd-journald[581]: Received SIGTERM from PID 1 (systemd).
[   39.327698] systemd: 15 output lines suppressed due to ratelimiting
[   40.132782] systemd-sysv-generator[914]: Overwriting existing symlink /r=
un/systemd/generator.late/inputattach.service with real service.
[   41.363414] EXT4-fs (sdb2): re-mounted. Opts: acl,user_xattr
[   41.578347] systemd-journald[988]: Received request to flush runtime jou=
rnal from PID 1
[   42.025075] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input4
[   42.053675] ACPI: Power Button [PWRB]
[   42.066966] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input5
[   42.092409] ACPI: Power Button [PWRF]
[   42.822462] dca service started, version 1.12.1
[   42.822782] wmi: Mapper loaded
[   42.852401] ipmi message handler version 39.2
[   42.872326] i801_smbus 0000:00:1f.4: enabling device (0141 -> 0143)
[   42.894009] Already setup the GSI :16
[   42.906885] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[   42.926631] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[   42.951891] lpc_ich 0000:00:1f.0: I/O space for ACPI uninitialized
[   42.973092] lpc_ich 0000:00:1f.0: No MFD cells added
[   43.133786] input: PC Speaker as /devices/platform/pcspkr/input/input6
[   43.133953] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[   43.184729] ipmi device interface
[   43.202632] ioatdma: Intel(R) QuickData Technology Driver 4.00
[   43.226271] pps_core: LinuxPPS API ver. 1 registered
[   43.243303] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[   43.285298] iTCO_vendor_support: vendor-support=3D0
[   43.305622] Already setup the GSI :26
[   43.328707] Already setup the GSI :27
[   43.354978] Already setup the GSI :26
[   43.379173] Already setup the GSI :27
[   43.402584] Already setup the GSI :16
[   43.417398] Already setup the GSI :26
[   43.441592] Already setup the GSI :27
[   43.457902] ipmi_si: probing via SMBIOS
[   43.471081] ipmi_si: SMBIOS: io 0xca2 regsize 1 spacing 1 irq 0
[   43.492805] ipmi_si: Adding SMBIOS-specified kcs state machine
[   43.492831] ipmi_si IPI0001:00: ipmi_si: probing via ACPI
[   43.492869] ipmi_si IPI0001:00: [io  0x0ca2] regsize 1 spacing 1 irq 0
[   43.492874] ipmi_si dmi-ipmi-si.0: Removing SMBIOS-specified kcs state m=
achine in favor of ACPI
[   43.492875] ipmi_si: Adding ACPI-specified kcs state machine
[   43.492898] IPMI System Interface driver.
[   43.493249] ipmi_si: probing via SPMI
[   43.493252] ipmi_si: SPMI: io 0xca2 regsize 1 spacing 1 irq 0
[   43.493253] (NULL device *): SPMI-specified kcs state machine: duplicate
[   43.493255] ipmi_si: Trying ACPI-specified kcs state machine at i/o addr=
ess 0xca2, slave address 0x20, irq 0
[   43.510441] Already setup the GSI :74
[   43.521688] Already setup the GSI :75
[   43.584905] ipmi_si IPI0001:00: Found new BMC (man_id: 0x002880, prod_id=
: 0x0593, dev_id: 0x05)
[   43.612237] Already setup the GSI :74
[   43.631484] ipmi_si IPI0001:00: IPMI kcs interface initialized
[   43.732570] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[   43.745287] Already setup the GSI :75
[   43.758194] iTCO_wdt: unable to reset NO_REBOOT flag, device disabled by=
 hardware/BIOS
[   43.851901] IPMI SSIF Interface driver
[   43.878259] Already setup the GSI :74
[   43.914287] Already setup the GSI :75
[   43.946095] Already setup the GSI :122
[   43.959053] PTP clock support registered
[   43.960999] Already setup the GSI :123
[   43.971064] Already setup the GSI :122
[   43.983890] Already setup the GSI :123
[   43.994169] Already setup the GSI :122
[   44.060032] Already setup the GSI :123
[   44.089226] Already setup the GSI :170
[   44.116870] Already setup the GSI :171
[   44.123653] Already setup the GSI :170
[   44.134474] Already setup the GSI :171
[   44.135010] i40e: Intel(R) Ethernet Connection XL710 Network Driver - ve=
rsion 2.3.2-k
[   44.135011] i40e: Copyright (c) 2013 - 2014 Intel Corporation.
[   44.144825] Already setup the GSI :170
[   44.152117] i40e 0000:27:00.0: fw 3.1.52520 api 1.5 nvm 3.33 0x800010ff =
1.1876.0
[   44.155389] Already setup the GSI :171
[   44.284802] AVX2 version of gcm_enc/dec engaged.
[   44.284803] AES CTR mode by8 optimization enabled
[   44.287129] i40e 0000:27:00.0: MAC address: 00:22:4d:d8:87:39
[   44.300062] i40e 0000:27:00.0 eth0: NIC Link is Up, 1000 Mbps Full Duple=
x, Flow Control: None
[   44.301380] i40e 0000:27:00.0: Added LAN device PF0 bus=3D0x27 dev=3D0x0=
0 func=3D0x00
[   44.301908] i40e 0000:27:00.0: Features: PF-id[0] VFs: 32 VSIs: 34 QP: 6=
4 RSS FD_ATR FD_SB NTUPLE DCB VxLAN Geneve PTP VEPA
[   44.302022] Already setup the GSI :46
[   44.318786] i40e 0000:27:00.1: fw 3.1.52520 api 1.5 nvm 3.33 0x800010ff =
1.1876.0
[   44.500331] i40e 0000:27:00.1: MAC address: 00:22:4d:d8:87:3a
[   44.521765] i40e 0000:27:00.1: Added LAN device PF1 bus=3D0x27 dev=3D0x0=
0 func=3D0x01
[   44.522288] i40e 0000:27:00.1: Features: PF-id[1] VFs: 32 VSIs: 34 QP: 6=
4 RSS FD_ATR FD_SB NTUPLE DCB VxLAN Geneve PTP VEPA
[   44.522423] Already setup the GSI :46
[   44.538196] i40e 0000:27:00.2: fw 3.1.52520 api 1.5 nvm 3.33 0x800010ff =
1.1876.0
[   44.542007] i40e 0000:27:00.2: MAC address: 00:22:4d:d8:87:3b
[   44.559545] i40e 0000:27:00.2: Added LAN device PF2 bus=3D0x27 dev=3D0x0=
0 func=3D0x02
[   44.708771] i40e 0000:27:00.2: Features: PF-id[2] VFs: 32 VSIs: 34 QP: 6=
4 RSS FD_ATR FD_SB NTUPLE DCB VxLAN Geneve PTP VEPA
[   44.708901] Already setup the GSI :46
[   44.711694] alg: No test for pcbc(aes) (pcbc-aes-aesni)
[   44.724117] i40e 0000:27:00.3: fw 3.1.52520 api 1.5 nvm 3.33 0x800010ff =
1.1876.0
[   44.727823] i40e 0000:27:00.3: MAC address: 00:22:4d:d8:87:3c
[   44.752893] i40e 0000:27:00.3: Added LAN device PF3 bus=3D0x27 dev=3D0x0=
0 func=3D0x03
[   44.753412] i40e 0000:27:00.3: Features: PF-id[3] VFs: 32 VSIs: 34 QP: 6=
4 RSS FD_ATR FD_SB NTUPLE DCB VxLAN Geneve PTP VEPA
[   44.767094] i40e 0000:33:00.0: fw 6.0.48442 api 1.7 nvm 6.01 0x80003485 =
1.1876.0
[   44.833832] i40e 0000:33:00.0: MAC address: 3c:fd:fe:70:0c:18
[   45.020868] i40e 0000:33:00.0: PCI-Express: Speed 8.0GT/s Width x8
[   45.022038] i40e 0000:33:00.0: Features: PF-id[0] VFs: 32 VSIs: 34 QP: 6=
4 RSS FD_ATR FD_SB NTUPLE DCB VxLAN Geneve PTP VEPA
[   45.022154] Already setup the GSI :48
[   45.043480] i40e 0000:33:00.1: fw 6.0.48442 api 1.7 nvm 6.01 0x80003485 =
1.1876.0
[   45.111226] i40e 0000:33:00.1: MAC address: 3c:fd:fe:70:0c:19
[   45.171549] Adding 9764604k swap on /dev/sda3.  Priority:-1 extents:1 ac=
ross:9764604k FS
[   45.192670] i40e 0000:33:00.1: PCI-Express: Speed 8.0GT/s Width x8
[   45.220885] i40e 0000:33:00.1: Features: PF-id[1] VFs: 32 VSIs: 34 QP: 6=
4 RSS FD_ATR FD_SB NTUPLE DCB VxLAN Geneve PTP VEPA
[   45.258694] Already setup the GSI :48
[   45.277781] md/raid1:md11: active with 1 out of 2 mirrors
[   45.278281] md/raid1:md0: active with 1 out of 2 mirrors
[   45.278360] md/raid1:md22: active with 1 out of 2 mirrors
[   45.278383] md/raid1:md21: active with 1 out of 2 mirrors
[   45.278388] md22: detected capacity change from 0 to 19998834688
[   45.278408] md21: detected capacity change from 0 to 23246536704
[   45.278499] md/raid1:md12: active with 1 out of 2 mirrors
[   45.278525] md12: detected capacity change from 0 to 19998834688
[   45.296339] md11: detected capacity change from 0 to 23246536704
[   45.297059] i40e 0000:33:00.2: fw 6.0.48442 api 1.7 nvm 6.01 0x80003485 =
1.1876.0
[   45.372161] i40e 0000:33:00.2: MAC address: 3c:fd:fe:70:0c:1a
[   45.497686] md0: detected capacity change from 0 to 8595046400
[   45.522142] i40e 0000:33:00.2: PCI-Express: Speed 8.0GT/s Width x8
[   45.552701] i40e 0000:33:00.2: Features: PF-id[2] VFs: 32 VSIs: 34 QP: 6=
4 RSS FD_ATR FD_SB NTUPLE DCB VxLAN Geneve PTP VEPA
[   45.590343] Already setup the GSI :48
[   45.616857] i40e 0000:33:00.3: fw 6.0.48442 api 1.7 nvm 6.01 0x80003485 =
1.1876.0
[   45.732724] i40e 0000:33:00.3: MAC address: 3c:fd:fe:70:0c:1b
[   45.783024] i40e 0000:33:00.3: PCI-Express: Speed 8.0GT/s Width x8
[   45.805079] i40e 0000:33:00.3: Features: PF-id[3] VFs: 32 VSIs: 34 QP: 6=
4 RSS FD_ATR FD_SB NTUPLE DCB VxLAN Geneve PTP VEPA
[   45.856478] i40e 0000:6d:00.0: fw 6.0.48442 api 1.7 nvm 6.01 0x80003485 =
1.1876.0
[   45.919515] i40e 0000:6d:00.0: MAC address: 3c:fd:fe:70:3d:e0
[   45.967916] i40e 0000:6d:00.0: PCI-Express: Speed 8.0GT/s Width x8
[   45.989995] i40e 0000:6d:00.0: Features: PF-id[0] VFs: 32 VSIs: 34 QP: 6=
4 RSS FD_ATR FD_SB NTUPLE DCB VxLAN Geneve PTP VEPA
[   46.027715] Already setup the GSI :96
[   46.054300] EDAC MC0: Giving out device to module skx_edac controller Sk=
ylake Socket#0 IMC#0: DEV 0000:24:0a.0 (INTERRUPT)
[   46.054325] i40e 0000:6d:00.1: fw 6.0.48442 api 1.7 nvm 6.01 0x80003485 =
1.1876.0
[   46.091570] EDAC MC1: Giving out device to module skx_edac controller Sk=
ylake Socket#0 IMC#1: DEV 0000:24:0c.0 (INTERRUPT)
[   46.153778] EDAC MC2: Giving out device to module skx_edac controller Sk=
ylake Socket#1 IMC#0: DEV 0000:58:0a.0 (INTERRUPT)
[   46.191060] EDAC MC3: Giving out device to module skx_edac controller Sk=
ylake Socket#1 IMC#1: DEV 0000:58:0c.0 (INTERRUPT)
[   46.191161] i40e 0000:6d:00.1: MAC address: 3c:fd:fe:70:3d:e1
[   46.191172] EDAC MC4: Giving out device to module skx_edac controller Sk=
ylake Socket#2 IMC#0: DEV 0000:98:0a.0 (INTERRUPT)
[   46.191240] EDAC MC5: Giving out device to module skx_edac controller Sk=
ylake Socket#2 IMC#1: DEV 0000:98:0c.0 (INTERRUPT)
[   46.191376] EDAC MC6: Giving out device to module skx_edac controller Sk=
ylake Socket#3 IMC#0: DEV 0000:d8:0a.0 (INTERRUPT)
[   46.191449] EDAC MC7: Giving out device to module skx_edac controller Sk=
ylake Socket#3 IMC#1: DEV 0000:d8:0c.0 (INTERRUPT)
[   46.428365] i40e 0000:6d:00.1: PCI-Express: Speed 8.0GT/s Width x8
[   46.453863] i40e 0000:6d:00.1: Features: PF-id[1] VFs: 32 VSIs: 34 QP: 6=
4 RSS FD_ATR FD_SB NTUPLE DCB VxLAN Geneve PTP VEPA
[   46.491489] Already setup the GSI :96
[   46.517167] i40e 0000:6d:00.2: fw 6.0.48442 api 1.7 nvm 6.01 0x80003485 =
1.1876.0
[   46.607293] i40e 0000:6d:00.2: MAC address: 3c:fd:fe:70:3d:e2
[   46.664156] i40e 0000:6d:00.2: PCI-Express: Speed 8.0GT/s Width x8
[   46.686181] i40e 0000:6d:00.2: Features: PF-id[2] VFs: 32 VSIs: 34 QP: 6=
4 RSS FD_ATR FD_SB NTUPLE DCB VxLAN Geneve PTP VEPA
[   46.723641] Already setup the GSI :96
[   46.749033] i40e 0000:6d:00.3: fw 6.0.48442 api 1.7 nvm 6.01 0x80003485 =
1.1876.0
[   46.797771] intel_rapl: Found RAPL domain package
(XEN) traps.c:1589: GPF (0000): ffff82d08037dbf4 [emul-priv-op.c#read_msr+0=
x211/0x483] -> ffff82d080388bb3
[   46.844744] intel_rapl: Found RAPL domain dram
[   46.844946] i40e 0000:6d:00.3: MAC address: 3c:fd:fe:70:3d:e3
[   46.860001] intel_rapl: DRAM domain energy unit 15300pj
[   46.897365] intel_rapl: RAPL package 0 domain package locked by BIOS
[   46.909812] i40e 0000:6d:00.3: PCI-Express: Speed 8.0GT/s Width x8
[   46.941091] i40e 0000:6d:00.3: Features: PF-id[3] VFs: 32 VSIs: 34 QP: 6=
4 RSS FD_ATR FD_SB NTUPLE DCB VxLAN Geneve PTP VEPA
[   47.338566] xen:xen_evtchn: Event-channel device installed
[   47.646033] i40e: Registered client i40iw
[   47.660506] i40iw_initialize_dev: DCB is set/clear =3D 0
[   47.678055] i40iw_wait_pe_ready: [1275] fm load status[x0703]
[   47.697571] i40iw_wait_pe_ready: [1277] CSR_CQP status[x0080]
[   47.717265] i40iw_wait_pe_ready: [1280] I40E_GLPE_CPUSTATUS1 status[x008=
0][   47.740707] i40iw_wait_pe_ready: [1283] I40E_GLPE_CPUSTATUS2 status[x0=
080]


Welcome to SUSE Linux Enterprise Server 12 SP4  (x86_64) - Kernel 4.12.14-9=
4.41-default (hvc0).


linux-v37i login:=20

--nextPart1751006.3zM9JSGCaE
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--nextPart1751006.3zM9JSGCaE--




