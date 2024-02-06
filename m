Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F1184B57C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 13:44:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676880.1053232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXKob-0007pq-0y; Tue, 06 Feb 2024 12:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676880.1053232; Tue, 06 Feb 2024 12:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXKoa-0007nV-TL; Tue, 06 Feb 2024 12:44:40 +0000
Received: by outflank-mailman (input) for mailman id 676880;
 Tue, 06 Feb 2024 12:15:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmrB=JP=outlook.it=giuseppe.de.rosa@srs-se1.protection.inumbo.net>)
 id 1rXKLw-0001Ye-5c
 for xen-devel@lists.xen.org; Tue, 06 Feb 2024 12:15:04 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03olkn20801.outbound.protection.outlook.com
 [2a01:111:f403:2e0e::801])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a4ce124-c4e9-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 13:15:02 +0100 (CET)
Received: from DB9P192MB1434.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:296::21)
 by DB9P192MB1705.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:390::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Tue, 6 Feb
 2024 12:14:59 +0000
Received: from DB9P192MB1434.EURP192.PROD.OUTLOOK.COM
 ([fe80::3954:cef6:c539:697a]) by DB9P192MB1434.EURP192.PROD.OUTLOOK.COM
 ([fe80::3954:cef6:c539:697a%6]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 12:14:59 +0000
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
X-Inumbo-ID: 5a4ce124-c4e9-11ee-8a47-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLPhaatdKBVW7VGtj+r2XroO3mY9Y9i6GU8IPVoh5kkTFblOrSmgEXzbjZ7tZgmJmRrIMqywDVwWCcpEkC0shcSohYX9WlH+07rPRl8MG1xOhM8azHjveBmaJjimRG/Ag4qGnKjVvCOPYF8ILA+9piUY115LeNKYoFphjS0tBnkuqMDm1sJucfCkcL8Kc8o2K8U8cRjznsrheakegABH/lf4XfgSTthEwaY/wSsRDb1/7QgRG2a/bD/MNSRpjObjpzsFdaXzyflgI4ZlK6aAy3+rLglTsX/cSfgxnco8vu0VTwx8ykcmAv01QRVvGfcjH6DmXnvsB63aABpzhufO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfJIk17PpbBfHpBm6+Fpzi6fN/Ybt/PSCAmmnyNCP78=;
 b=SO+93Z0NqClN/OltVtZJIySGLt4Pr4j+d0V9YHqxRDRXuAwQ/ffCLmngqSonCDoNJrmYHQxEG5alPJTpyQO8jogrpjZWEpit+nETOUQ/7W1Sjh3aCCVfcsSoM/ZaJ7455TOYa5SnYN5i8SgTLYxwVTYIOn9rtD/6VgZJSV4RXr45+LQ1q+NxFUt61joiFnb+TPGzwL5XtJcARroAVmIf/yyDSrDLU72v9TU1KiH5+vQXO8lMPQO1B7CS1GviWN5fJpJMYCAbOmpdDP+v+dwTVRfx3pYsC94HvgQ9f6E8Cd4CICeJQNz9+KULiJXgqIuvo7CEX9oiyVEPg5jxH6v5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
From: Giuseppe De Rosa <giuseppe.de.rosa@outlook.it>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Subject: [BUG] Possible FATAL PAGE FAULT in domain_crash function on Xen
 4.14.6
Thread-Topic: [BUG] Possible FATAL PAGE FAULT in domain_crash function on Xen
 4.14.6
Thread-Index: AQHaWPFxTFnf2PP9dU2mKqDyY7lMyQ==
Date: Tue, 6 Feb 2024 12:14:59 +0000
Message-ID:
 <DB9P192MB1434AD2FD1069E39FB480068A6462@DB9P192MB1434.EURP192.PROD.OUTLOOK.COM>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-tmn: [V/mlFo0ZEgixTlu3mNp4LKO0UiuMDr42p2szM09yAXs=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P192MB1434:EE_|DB9P192MB1705:EE_
x-ms-office365-filtering-correlation-id: d48f151e-8de6-4a29-ca8a-08dc270d3d2e
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jvJJFa68BFx8WzPB5lKytTFkFz7qfpgeNKbZpOPasKY1wZfEi6oXJ+xcKDvLOwSOXGHUtkGfHD6zPCiq3eyhZaR0QhK7OqWLmYSH9bnXyCoJhpR3VmrQXrga1KwLCmVLBNK29QUYxncLn24c+rJudZ4hXTN2Kkh70NYe968xN4ZVVaCpL78HKwsQkDC45SwnLgnPgXQYn6W7ZSX7pfE+7c3R5FTK8HtQX0djBnNvCsSLQBH+nQmok94QmfxPOM9mXcikrs5vCD0uLvnl+RGEZkndz5RB3mK6E7wXItinBxXOoOYHB2NSKClSnN6myyIDmRtWbgzn8jxkHw+kaWi3+IdNBTJQbdoO4qnDEmOyQ5iJULrolRFhWqpzQMpmUpUkOaCKh2u8IrZq52fedxazdaFiUd2w1YOu35H0XGqlmljNNbbWzC0NQSmvPkT564pFNvwUix78R/6QApJZLYNu86Z5udVngVTdGQntoIGvM9iCvHTJ2ls7dfy0JTTaqXo8BgqwYD8n1GYwupGuxwkqk6LaBLYow+xPV/MPK6hZsSSp6XpRMaWJQI5qrqFDaNFY
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NfhndCs4G5IL7tbRWdWDO42a6ZSgG9SAmxmvl9lrLBQPj29bLBW2/p4lY2?=
 =?iso-8859-1?Q?RwC2h4fZHWyQ0FhNZOAb6kVwf4v6UNtyW2gsyb/t2IZOICGQ4jlob7Cu9h?=
 =?iso-8859-1?Q?lJwIORLjQs4XaycQWVKkemt/+dwdM696gJjobd4eVfo9tQfHq7CvGqZMYc?=
 =?iso-8859-1?Q?8VfKRjG03mpM888ImOjUo65wxK7et0i8MLJU8/jAXhzl+rY4esiGEaqTUj?=
 =?iso-8859-1?Q?xj6sOQaFIxteEfoZUZtY7WwQ1Rg9pHZM607BuXb+EnbyRrUtN6Mau36ys0?=
 =?iso-8859-1?Q?G5dOEAk4EN6m0UdhbuFCXXcHcNyecQwhzHs1lZMqGlBo9YdmM7bE/ek5yA?=
 =?iso-8859-1?Q?s3Q/vCMe62hl4VISORtXTCp6RVQGpapvzFsQQeWH2+vNkbaDsgwHxvLxqc?=
 =?iso-8859-1?Q?m1EgRb5R83Pe7poir8v94IPfDV3FIWhFU44/3vyll+/SbtUnnJ6KZbRaxX?=
 =?iso-8859-1?Q?1WTDMxFR2xefjhPjqAwvFKRrs7OnVVP7HoJZ9UdFZGqaVk7A59SzXz+1o8?=
 =?iso-8859-1?Q?MWXk8ZY4x2eGhfBnlrhvmuxm5r+Nq5yMl2aXu1qK78S8KSND/qDo/PJHqd?=
 =?iso-8859-1?Q?HoEAduwFb7ISrAXrf1GtFAYlCAZzZq6w2a9Ir2ceDDTckUKyEBvtkOPSVP?=
 =?iso-8859-1?Q?XDJz6fDBXmtIyUYL1ohjz5r0XeLP3lvFYGEM/QVVMvKs0hzvi5llT7lAfR?=
 =?iso-8859-1?Q?B2qfYvSWueGd/evcUKpIZm4SbK7d++KkW7Z+eO03t1iOw1Gatxw5ufE8gd?=
 =?iso-8859-1?Q?/GNXpPXzg9ae6sAwjU59YCDvN/pwZe1vsVyKdLOEFaJOuY9sPoKy2X4x4n?=
 =?iso-8859-1?Q?HPAumaErlZ1LyYZPH/jFByAqTLYvCXqqDND+aTgATiAcqMrW3To2LbtGrb?=
 =?iso-8859-1?Q?oyG1Ej3WIrKd+U9VTM+66twtiT4DfeI1EbT6IxfEBBsH6c23bTB6OAsLmk?=
 =?iso-8859-1?Q?7gN8Sex5G/xAPO0vHf6G7hE5XL26jl/WvpunGxCi9cmmn34lbUOP0u2TXP?=
 =?iso-8859-1?Q?uxvFzHZxXYnOpGvSvWWKalMb2NfTCyrYeGPMocYBp4mXw6lXS+4mAJEnEY?=
 =?iso-8859-1?Q?9OYGrgKt+J77MHwVbHMo61ZcnPZ84UZILHltNB4ZFI/ohf4lEIIw5gsnXm?=
 =?iso-8859-1?Q?UFM792/XHFBWpuYgLoxibrpirxFJ0lpvGIEFm+J1bTQy8LE4ZNg0UxfFRH?=
 =?iso-8859-1?Q?Ic/sszdaKAZMaMPeLI8bcl71xpmMwLd2ZOwfj9GhGzQ9cQ/fBPLZWXUuem?=
 =?iso-8859-1?Q?nZ40jTvo69Tp0s8cQvs/nQE9MqKLn6XOS/VbgRNL0=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB9P192MB1434AD2FD1069E39FB480068A6462DB9P192MB1434EURP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB1434.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d48f151e-8de6-4a29-ca8a-08dc270d3d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 12:14:59.4144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1705

--_000_DB9P192MB1434AD2FD1069E39FB480068A6462DB9P192MB1434EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Bug detailed description:

----------------

While booting a Linux Debian 7 "Wheezy" VM, Xen crashes with a FATAL PAGE F=
AULT.



Environment :

----------------

HW: Intel(R) Xeon(R) CPU E5-1620 v2 @ 3.70GHz (2 CPU, Xen in nested virtual=
ization upon QEMU/KVM), 4GB RAM

Xen: Xen 4.14.6 (xen-hypervisor-4.14-amd64 package)

Dom0: Linux 5.10.0-26-amd64 (Debian 11 "Bullseye"), 1 CPU, 1024GB RAM



Reproduce steps:

----------------

1.      Install debian 11 and xen package

2.      Boot a clean debian 7 image in hardware-assisted virtualization

3.      Single bit-flip bit number 2 of VMCS field "VM_EXIT_QUALIFICATION" =
(field number 6400). In my case, value changed from [100049] -> [10004d]

4.      Leave the debian7 guest executing after the bit flip.



Current result:

----------------

Xen crash



Console error log:

----------------

(XEN) d1v0 Unexpected PIO status 1, port 0x10 read 0x00000000ffff

(XEN) domain_crash called from io.c:166
(XEN) Domain 1 (vcpu#0) crashed on cpu#1:
(XEN) ----[ Xen-4.14.6  x86_64  debug=3Dn   Not tainted ]----
(XEN) CPU:    1
(XEN) RIP:    0010:[<ffffffff8100712e>]
(XEN) RFLAGS: 0000000000000046   CONTEXT: hvm guest (d1v0)
(XEN) rax: 0000000000000000   rbx: 0000000040000000   rcx: 0000000000000001
(XEN) rdx: 0000000000000000   rsi: ffffffff81666a80   rdi: ffffffff81617830
(XEN) rbp: 0000000000000020   rsp: ffffffff81601e78   r8:  0000000000000200
(XEN) r9:  ffffffff8168f2a0   r10: 0000000000000007   r11: 0000000000000007
(XEN) r12: ffffffff81601f58   r13: ffffffffffffffff   r14: 000000000008c800
(XEN) r15: 0000000000001000   cr0: 0000000080050033   cr4: 00000000001000a0
(XEN) cr3: 0000000001605000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: ffffffff81696000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: 0010
(XEN) d1v0 Bad rIP ffffffff8100712e for mode 0
(XEN) domain_crash called from vmx.c:4413
(XEN) ----[ Xen-4.14.6  x86_64  debug=3Dn   Not tainted ]----
(XEN) CPU:    1
(XEN) RIP:    e008:[<ffff82d040206fa9>] __domain_crash+0x9/0x80
(XEN) RFLAGS: 0000000000010296   CONTEXT: hypervisor (d1v0)
(XEN) rax: ffff830139c0506c   rbx: ffff8301308a0000   rcx: 0000000000000000
(XEN) rdx: ffff830136ddffff   rsi: 000000000000000a   rdi: 0000000000000000
(XEN) rbp: 0000000000000000   rsp: ffff830136ddfee0   r8:  0000000000000001
(XEN) r9:  0000000000004000   r10: 0000000000000001   r11: ffff82d040372d40
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000001526e0
(XEN) cr3: 0000000136da6000   cr2: 0000000000000208
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d040206fa9> (__domain_crash+0x9/0x80):
(XEN)  0f 1e fa 55 48 89 fd 53 <80> bf 08 02 00 00 00 75 2d 48 89 e3 0f b7 =
37 48
(XEN) Xen stack trace from rsp=3Dffff830136ddfee0:
(XEN)    ffff8301308a0000 0000000000000000 ffff82d0402a1798 000000000000100=
0
(XEN)    000000000008c800 ffffffffffffffff ffffffff81601f58 000000000000002=
0
(XEN)    0000000040000000 0000000000000007 0000000000000007 ffffffff8168f2a=
0
(XEN)    0000000000000200 0000000000000000 0000000000000001 000000000000000=
0
(XEN)    ffffffff81666a80 ffffffff81617830 000000fa00000000 ffffffff8100712=
e
(XEN)    0000000000000000 0000000000000046 ffffffff81601e78 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000e01000000001 ffff8301308a0000 00000030f9686000 00000000001526e=
0
(XEN)    0000000000000000 0000000000000000 0006020200000000 000000000000000=
0
(XEN) Xen call trace:
(XEN)    [<ffff82d040206fa9>] R __domain_crash+0x9/0x80
(XEN)    [<ffff82d0402a1798>] S vmx_asm_vmexit_handler+0xf8/0x210
(XEN)
(XEN) Pagetable walk from 0000000000000208:
(XEN)  L4[0x000] =3D 0000000000000000 ffffffffffffffff
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 1:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=3D0000]
(XEN) Faulting linear address: 0000000000000208
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...



HVM guest config file:

--------------------------------

name =3D "debian7"

builder=3D "hvm"
memory =3D 1024
vcpus =3D 1
cpus=3D ["1"]
disk=3D["qcow2:/home/test/debian7.qcow2,xvda,w"]
vnc =3D 1
vnclisten =3D '127.0.0.1'
vncdisplay =3D 1
boot =3D "d"
serial =3D "pty"

Discussion
--------------------------------

Hello, i am conducting robustness tests on Xen 4.14. I bit flipped the fiel=
d VM_EXIT_QUALIFICATION during the exit handling of an IO_INSTRUCTION. Afte=
r a VM Read on that field, Xen crashes with this error log. This is my (pos=
sible) explanation:


Xen correctly detects an error in the field, resulting in a domain crash (U=
nexpected PIO status 1) called from this point in the code:

xen/arch/x86/hvm/io.c
```
gprintk(XENLOG_ERR, "Unexpected PIO status %d, port %#x %s 0x%0*x\n",
                rc, port, dir =3D=3D IOREQ_WRITE ? "write" : "read",
                size * 2, data & ((1u << (size * 8)) - 1));
domain_crash(curr->domain);
return false;
```

In the `handle_pio` function, in the handling of the `IO_INSTRUCTION` exit =
reason. However, the code continues and ends here for an issue in the proce=
ssor mode:

/xen/arch/x86/hvm/vmx/vmx.c
```
mode =3D vmx_guest_x86_mode(v);
    if ( mode =3D=3D 8 ? !is_canonical_address(regs->rip)
                   : regs->rip !=3D regs->eip )
    {
        gprintk(XENLOG_WARNING, "Bad rIP %lx for mode %u\n", regs->rip, mod=
e);

        if ( vmx_get_cpl() )
        {
            __vmread(VM_ENTRY_INTR_INFO, &intr_info);
            if ( !(intr_info & INTR_INFO_VALID_MASK) )
                hvm_inject_hw_exception(TRAP_gp_fault, 0);
            /* Need to fix rIP nevertheless. */
            if ( mode =3D=3D 8 )
                regs->rip =3D (long)(regs->rip << (64 - VADDR_BITS)) >>
                            (64 - VADDR_BITS);
            else
                regs->rip =3D regs->eip;
        }
        else
            domain_crash(v->domain);
    }
```

However, the domain pointer has already been deallocated due to the previou=
s domain crash, resulting in a page fault that leads to Xen crashing.

I would like to report this crash and ask for your opinion. Based on previo=
us research, I do not believe it has been reported before. I am unsure if i=
t could potentially be a security issue, hence I am posting it here. Let me=
 know if I should provide other results. Thank you for your kind response i=
n advance.



Best Regards,

Giuseppe De Rosa.




--_000_DB9P192MB1434AD2FD1069E39FB480068A6462DB9P192MB1434EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<table style=3D"text-align: left; background-color: rgb(233, 234, 234); wid=
th: 100%; color: rgb(51, 51, 51);">
<tbody>
<tr>
<td style=3D"text-align: left;">
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">Bug detailed description:</spa=
n></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">----------------</span></p>
<p class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"font=
-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">While=
 booting a Linux Debian 7 &quot;Wheezy&quot; VM, Xen crashes with a FATAL P=
AGE FAULT.&nbsp;</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">&nbsp;</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">Environment :</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">----------------</span></p>
<p class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"font=
-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">HW: I=
ntel(R) Xeon(R) CPU E5-1620 v2 @ 3.70GHz (2 CPU, Xen in nested virtualizati=
on upon QEMU/KVM), 4GB RAM</span></p>
<p class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"font=
-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">Xen: =
Xen 4.14.6 (xen-hypervisor-4.14-amd64 package)</span></p>
<p class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"font=
-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">Dom0:=
 Linux 5.10.0-26-amd64 (Debian 11 &quot;Bullseye&quot;), 1 CPU, 1024GB RAM<=
/span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">&nbsp;</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">Reproduce steps:</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">----------------</span></p>
<p class=3D"elementToProof" style=3D"text-align: left; text-indent: -0.25in=
; margin-left: 0.5in;">
<span style=3D"font-family: Arial, sans-serif; font-size: 12px; color: rgb(=
51, 51, 51);">1.</span><span style=3D"font-family: &quot;Times New Roman&qu=
ot;; font-size: 7pt; color: rgb(51, 51, 51); line-height: normal;">&nbsp; &=
nbsp; &nbsp;
</span><span style=3D"font-family: Arial, sans-serif; font-size: 12px; colo=
r: rgb(51, 51, 51); background-color: rgb(233, 234, 234); line-height: norm=
al;">Install debian 11 and xen package</span></p>
<p class=3D"elementToProof" style=3D"text-align: left; text-indent: -0.25in=
; margin-left: 0.5in;">
<span style=3D"font-family: Arial, sans-serif; font-size: 12px; color: rgb(=
51, 51, 51);">2.</span><span style=3D"font-family: &quot;Times New Roman&qu=
ot;; font-size: 7pt; color: rgb(51, 51, 51); line-height: normal;">&nbsp; &=
nbsp; &nbsp;
</span><span style=3D"font-family: Arial, sans-serif; font-size: 12px; colo=
r: rgb(51, 51, 51); line-height: normal;">Boot a clean debian 7 image in ha=
rdware-assisted virtualization</span></p>
<p class=3D"elementToProof" style=3D"text-align: left; text-indent: -0.25in=
; margin-left: 0.5in;">
<span style=3D"font-family: Arial, sans-serif; font-size: 12px; color: rgb(=
51, 51, 51);">3.</span><span style=3D"font-family: &quot;Times New Roman&qu=
ot;; font-size: 7pt; color: rgb(51, 51, 51); line-height: normal;">&nbsp; &=
nbsp; &nbsp;
</span><span style=3D"font-family: Arial, sans-serif; font-size: 12px; colo=
r: rgb(51, 51, 51); line-height: normal;">Single bit-flip bit number 2 of V=
MCS field &quot;VM_EXIT_QUALIFICATION&quot; (field number 6400). In my case=
, value changed from [100049] -&gt; [10004d]</span></p>
<p class=3D"elementToProof" style=3D"text-align: left; text-indent: -0.25in=
; margin-left: 0.5in;">
<span style=3D"font-family: Arial, sans-serif; font-size: 12px; color: rgb(=
51, 51, 51);">4.</span><span style=3D"font-family: &quot;Times New Roman&qu=
ot;; font-size: 7pt; color: rgb(51, 51, 51); line-height: normal;">&nbsp; &=
nbsp; &nbsp;
</span><span style=3D"font-family: Arial, sans-serif; font-size: 12px; colo=
r: rgb(51, 51, 51); line-height: normal;">Leave the debian7 guest executing=
 after the bit flip</span><span style=3D"font-family: Arial, sans-serif; fo=
nt-size: 12px; color: rgb(51, 51, 51);">.</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">&nbsp;</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">Current result:</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">----------------</span></p>
<p class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"font=
-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">Xen c=
rash</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">&nbsp;</span></p>
<p class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"font=
-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">Conso=
le error log:</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">----------------</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">(XEN) d1v0 Unexpected PIO stat=
us 1, port 0x10 read 0x00000000ffff</span></p>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) domain_crash called fr=
om io.c:166</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) Domain 1 (vcpu#0) cras=
hed on cpu#1:</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) ----[ Xen-4.14.6 &nbsp=
;x86_64 &nbsp;debug=3Dn &nbsp; Not tainted ]----</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) CPU: &nbsp; &nbsp;1</s=
pan></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) RIP: &nbsp; &nbsp;0010=
:[&lt;ffffffff8100712e&gt;]</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) RFLAGS: 00000000000000=
46 &nbsp; CONTEXT: hvm guest (d1v0)</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) rax: 0000000000000000 =
&nbsp; rbx: 0000000040000000 &nbsp; rcx: 0000000000000001</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) rdx: 0000000000000000 =
&nbsp; rsi: ffffffff81666a80 &nbsp; rdi: ffffffff81617830</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) rbp: 0000000000000020 =
&nbsp; rsp: ffffffff81601e78 &nbsp; r8: &nbsp;0000000000000200</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) r9: &nbsp;ffffffff8168=
f2a0 &nbsp; r10: 0000000000000007 &nbsp; r11: 0000000000000007</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) r12: ffffffff81601f58 =
&nbsp; r13: ffffffffffffffff &nbsp; r14: 000000000008c800</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) r15: 0000000000001000 =
&nbsp; cr0: 0000000080050033 &nbsp; cr4: 00000000001000a0</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) cr3: 0000000001605000 =
&nbsp; cr2: 0000000000000000</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) fsb: 0000000000000000 =
&nbsp; gsb: ffffffff81696000 &nbsp; gss: 0000000000000000</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) ds: 0000 &nbsp; es: 00=
00 &nbsp; fs: 0000 &nbsp; gs: 0000 &nbsp; ss: 0000 &nbsp; cs: 0010</span></=
div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) d1v0 Bad rIP ffffffff8=
100712e for mode 0</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) domain_crash called fr=
om vmx.c:4413</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) ----[ Xen-4.14.6 &nbsp=
;x86_64 &nbsp;debug=3Dn &nbsp; Not tainted ]----</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) CPU: &nbsp; &nbsp;1</s=
pan></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) RIP: &nbsp; &nbsp;e008=
:[&lt;ffff82d040206fa9&gt;] __domain_crash+0x9/0x80</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) RFLAGS: 00000000000102=
96 &nbsp; CONTEXT: hypervisor (d1v0)</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) rax: ffff830139c0506c =
&nbsp; rbx: ffff8301308a0000 &nbsp; rcx: 0000000000000000</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) rdx: ffff830136ddffff =
&nbsp; rsi: 000000000000000a &nbsp; rdi: 0000000000000000</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) rbp: 0000000000000000 =
&nbsp; rsp: ffff830136ddfee0 &nbsp; r8: &nbsp;0000000000000001</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) r9: &nbsp;000000000000=
4000 &nbsp; r10: 0000000000000001 &nbsp; r11: ffff82d040372d40</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) r12: 0000000000000000 =
&nbsp; r13: 0000000000000000 &nbsp; r14: 0000000000000000</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) r15: 0000000000000000 =
&nbsp; cr0: 0000000080050033 &nbsp; cr4: 00000000001526e0</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) cr3: 0000000136da6000 =
&nbsp; cr2: 0000000000000208</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) fsb: 0000000000000000 =
&nbsp; gsb: 0000000000000000 &nbsp; gss: 0000000000000000</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) ds: 0000 &nbsp; es: 00=
00 &nbsp; fs: 0000 &nbsp; gs: 0000 &nbsp; ss: 0000 &nbsp; cs: e008</span></=
div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) Xen code around &lt;ff=
ff82d040206fa9&gt; (__domain_crash+0x9/0x80):</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) &nbsp;0f 1e fa 55 48 8=
9 fd 53 &lt;80&gt; bf 08 02 00 00 00 75 2d 48 89 e3 0f b7 37 48</span></div=
>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) Xen stack trace from r=
sp=3Dffff830136ddfee0:</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) &nbsp; &nbsp;ffff83013=
08a0000 0000000000000000 ffff82d0402a1798 0000000000001000</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) &nbsp; &nbsp;000000000=
008c800 ffffffffffffffff ffffffff81601f58 0000000000000020</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) &nbsp; &nbsp;000000004=
0000000 0000000000000007 0000000000000007 ffffffff8168f2a0</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) &nbsp; &nbsp;000000000=
0000200 0000000000000000 0000000000000001 0000000000000000</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) &nbsp; &nbsp;ffffffff8=
1666a80 ffffffff81617830 000000fa00000000 ffffffff8100712e</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) &nbsp; &nbsp;000000000=
0000000 0000000000000046 ffffffff81601e78 0000000000000000</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) &nbsp; &nbsp;000000000=
0000000 0000000000000000 0000000000000000 0000000000000000</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) &nbsp; &nbsp;0000e0100=
0000001 ffff8301308a0000 00000030f9686000 00000000001526e0</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) &nbsp; &nbsp;000000000=
0000000 0000000000000000 0006020200000000 0000000000000000</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) Xen call trace:</span>=
</div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) &nbsp; &nbsp;[&lt;ffff=
82d040206fa9&gt;] R __domain_crash+0x9/0x80</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) &nbsp; &nbsp;[&lt;ffff=
82d0402a1798&gt;] S vmx_asm_vmexit_handler+0xf8/0x210</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN)</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) Pagetable walk from 00=
00000000000208:</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) &nbsp;L4[0x000] =3D 00=
00000000000000 ffffffffffffffff</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN)</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) **********************=
******************</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) Panic on CPU 1:</span>=
</div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) FATAL PAGE FAULT</span=
></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) [error_code=3D0000]</s=
pan></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) Faulting linear addres=
s: 0000000000000208</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) **********************=
******************</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN)</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">(XEN) Reboot in five seconds=
...</span></div>
<p class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"font=
-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp=
;</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">HVM guest config file:</span><=
/p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">------------------------------=
--</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">name =3D &quot;debian7&quot;</=
span></p>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">builder=3D &quot;hvm&quot;</=
span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">memory =3D 1024</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">vcpus =3D 1</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">cpus=3D [&quot;1&quot;]</spa=
n></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">disk=3D[&quot;qcow2:/home/te=
st/debian7.qcow2,xvda,w&quot;]</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">vnc =3D 1</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">vnclisten =3D '127.0.0.1'</s=
pan></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">vncdisplay =3D 1</span></div=
>
<div class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"fo=
nt-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">boo=
t =3D &quot;d&quot;</span></div>
<div class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"fo=
nt-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">ser=
ial =3D &quot;pty&quot;</span></div>
<div class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"fo=
nt-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);"><br=
>
</span></div>
<div class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"fo=
nt-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">Dis=
cussion</span></div>
<div class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"fo=
nt-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51); back=
ground-color: rgb(233, 234, 234);">--------------------------------</span><=
/div>
<p class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"font=
-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">Hello=
, i am conducting robustness tests on Xen 4.14. I bit flipped the field VM_=
EXIT_QUALIFICATION during the exit handling
 of an IO_INSTRUCTION. After a VM Read on that field, Xen crashes with this=
 error log. This is my (possible) explanation:<br>
<br>
</span></p>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">Xen correctly detects an err=
or in the field, resulting in a domain crash (Unexpected PIO status 1) call=
ed from this point in the code:</span></div>
<div class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"fo=
nt-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);"><br=
>
xen/arch/x86/hvm/io.c</span></div>
<div class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"fo=
nt-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51); back=
ground-color: rgb(233, 234, 234);">```</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">gprintk(XENLOG_ERR, &quot;Un=
expected PIO status %d, port %#x %s 0x%0*x\n&quot;,</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; rc, port, dir =3D=3D IOREQ_WRITE ? &quot;write&=
quot; : &quot;read&quot;,</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; size * 2, data &amp; ((1u &lt;&lt; (size * 8)) =
- 1));</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">domain_crash(curr-&gt;domain=
);</span></div>
<div class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"fo=
nt-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">ret=
urn false;</span></div>
<div class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"fo=
nt-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51); back=
ground-color: rgb(233, 234, 234);">```</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);"><br>
</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">In the `handle_pio` function=
, in the handling of the `IO_INSTRUCTION` exit reason. However, the code co=
ntinues and ends here for an issue in
 the processor mode:</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);"><br>
</span></div>
<div class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"fo=
nt-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">/xe=
n/arch/x86/hvm/vmx/vmx.c</span></div>
<div class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"fo=
nt-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51); back=
ground-color: rgb(233, 234, 234);">```</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">mode =3D vmx_guest_x86_mode(=
v);</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; if ( mode =3D=
=3D 8 ? !is_canonical_address(regs-&gt;rip)</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: regs-&gt;rip !=3D regs-&gt;eip )=
</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; {</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
gprintk(XENLOG_WARNING, &quot;Bad rIP %lx for mode %u\n&quot;, regs-&gt;rip=
, mode);</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);"><br>
</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
if ( vmx_get_cpl() )</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
{</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; __vmread(VM_ENTRY_INTR_INFO, &amp;intr_info);</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; if ( !(intr_info &amp; INTR_INFO_VALID_MASK) )</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; hvm_inject_hw_exception(TRAP_gp_fault, 0);</spa=
n></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; /* Need to fix rIP nevertheless. */</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; if ( mode =3D=3D 8 )</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; regs-&gt;rip =3D (long)(regs-&gt;rip &lt;&lt; (=
64 - VADDR_BITS)) &gt;&gt;</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (64 -=
 VADDR_BITS);</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; else</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; regs-&gt;rip =3D regs-&gt;eip;</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
}</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
else</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; domain_crash(v-&gt;domain);</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp; &nbsp; }</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">```</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);"><br>
</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);">However, the domain pointer =
has already been deallocated due to the previous domain crash, resulting in=
 a page fault that leads to Xen crashing.</span></div>
<div style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-se=
rif; font-size: 12px; color: rgb(51, 51, 51);"><br>
</span></div>
<div class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"fo=
nt-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">I w=
ould like to report this crash and ask for your opinion. Based on previous =
research, I do not believe it has been
 reported before. I am unsure if it could potentially be a security issue, =
hence I am posting it here. Let me know if I should provide other results. =
Thank you for your kind response in advance.</span></div>
<p style=3D"text-align: left;" class=3D"elementToProof"><span style=3D"font=
-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">&nbsp=
;</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">Best Regards,</span></p>
<p class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"font=
-family: Arial, sans-serif; font-size: 12px; color: rgb(51, 51, 51);">Giuse=
ppe De Rosa.</span></p>
<p style=3D"text-align: left;"><span style=3D"font-family: Arial, sans-seri=
f; font-size: 12px; color: rgb(51, 51, 51);">&nbsp;</span></p>
</td>
</tr>
</tbody>
</table>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_DB9P192MB1434AD2FD1069E39FB480068A6462DB9P192MB1434EURP_--

