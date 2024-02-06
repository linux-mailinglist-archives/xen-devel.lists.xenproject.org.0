Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2931084BABD
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 17:18:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677035.1053431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXO8t-000713-HR; Tue, 06 Feb 2024 16:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677035.1053431; Tue, 06 Feb 2024 16:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXO8t-0006y2-E0; Tue, 06 Feb 2024 16:17:51 +0000
Received: by outflank-mailman (input) for mailman id 677035;
 Tue, 06 Feb 2024 16:17:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmrB=JP=outlook.it=giuseppe.de.rosa@srs-se1.protection.inumbo.net>)
 id 1rXO8r-0006vo-Nd
 for xen-devel@lists.xen.org; Tue, 06 Feb 2024 16:17:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn20800.outbound.protection.outlook.com
 [2a01:111:f403:2e13::800])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 426c56a4-c50b-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 17:17:45 +0100 (CET)
Received: from DB9P192MB1434.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:296::21)
 by DU0P192MB1951.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:411::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 16:17:42 +0000
Received: from DB9P192MB1434.EURP192.PROD.OUTLOOK.COM
 ([fe80::3954:cef6:c539:697a]) by DB9P192MB1434.EURP192.PROD.OUTLOOK.COM
 ([fe80::3954:cef6:c539:697a%6]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 16:17:42 +0000
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
X-Inumbo-ID: 426c56a4-c50b-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCUtJHrn8hzxkeTzsYNGuOLAlwOpQBIyyDdUFka9i8yFh41GSvI03yUm1AQr1Ik11Dnm22D3sEPT/Q23d3X37RX6QZxf3T8RjY1bV39Rd/u/xHYUFPS4iUOFu6DhEYJ9kqqCa0+rGTm7cCjHwkCTWNWraY6Vx9u5VM8WwV99CkGRyQ017nWC19Cn6bxvssh7DtpDoV+GV68dInJnXrj9HHrQDPPaSpZgPNvSMMCTj4P4n0mGPEMFtASc94cif2AjT/3r30kPMW9jwN4PhjLW0gOK5nG0exAVuPw9ymmtbqZJktDVEtT2VdHeZ3g5y+D6CPKOgDEGL/5k7npYs6iGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kycROZqAaTkyG+kYa3gPHkmWsxhIihlVtcW94aOH6c=;
 b=B4wyJzsN5a4gBCJqdujznaiZhOEIHUqJJcPGrHZGdLk5oTeZnqywZNk3X/mpYNOaedcHqagGAa/XzlxrJSWuUFya41sgtkFJkqMPEtD1tMNYWsdpZziYYsTGjqKLmihjieJafuAh6aGOkZYeqNHrhAE17W5n/Xupol3doGZlEV/f081O4NefQxa6q8AitZQ5adj1gB6C2NlvuUAOvqId1AgVJ/zV2xIk6vCKoSSulERZ+FQradEgSt5icY77nVugIuCjLPs/UqcXcc9czmXvjQEr9TJcX06jEIvwlJXY76zb2iNOM/vwcFb2Ghs/m6bc/0FZ6p3haxhL/V8wsJpnaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
From: Giuseppe De Rosa <giuseppe.de.rosa@outlook.it>
To: Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xen.org"
	<xen-devel@lists.xen.org>
Subject: R: [BUG] Possible FATAL PAGE FAULT in domain_crash function on Xen
 4.14.6
Thread-Topic: [BUG] Possible FATAL PAGE FAULT in domain_crash function on Xen
 4.14.6
Thread-Index: AQHaWPFxTFnf2PP9dU2mKqDyY7lMybD9WsMAgAAheyA=
Date: Tue, 6 Feb 2024 16:17:42 +0000
Message-ID:
 <DB9P192MB143408981DB724A477C0ADA6A6462@DB9P192MB1434.EURP192.PROD.OUTLOOK.COM>
References:
 <DB9P192MB1434AD2FD1069E39FB480068A6462@DB9P192MB1434.EURP192.PROD.OUTLOOK.COM>
 <5cb25d4f-c3be-4c45-a434-421e1bf54be3@citrix.com>
In-Reply-To: <5cb25d4f-c3be-4c45-a434-421e1bf54be3@citrix.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-tmn: [RltGXoKOyqgU5NHietxuq3XOYJ6cYoPKdcTFnw77gm0=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P192MB1434:EE_|DU0P192MB1951:EE_
x-ms-office365-filtering-correlation-id: 1a7e45af-fe60-4161-3fba-08dc272f2576
x-ms-exchange-slblob-mailprops:
 WaIXnCbdHrOEviK8+uzePdFfNisOgVEmkoxbfNPwsUIZpudLBB2q+9cq/tPX4qPvM9FK6TzTI9rXOBABhonhKmXq1H3F2xXUyeji9R/Jt2YNKYtQopjSEoamd26t5/SYcWiwenN6naua5uiNTod1ZDoMgjcnY01FOL9H3+wA+jtsZbEwuJqJOfKmJOT6QXpFcUhVIvnsQ0eW+MHnJUCBnQWpTynyoRgUJ6gr6kNQ8bTm9kSL272yHV5bmeC41HI9SgQOa34jMmvwghi8BVcYh1b8e6YEQ4x0XYdCovJTGuOo8BgpseJjUCBP62190Kf1ZCtENnJXDyDPYiQwNdJ6SV6z0XYNhbsPhbjr+z2OWiU8hLWxaJ1rvOAbVfotWL4m8lDUIuy/2GWtnVrL30k9/0Cc2G6ORqqzh1AIWrzZ0pcCjJLY508ketau8gOldP3dykQpsLNHLtKQW/zXkNISv2Vmy8sxHT5rKrAS5sEmEG41ZRmJOcPOJ3UB9vvxikmBBD0iyeryTI+6vaSkNlvHQFkAFmJtIACmf1dUCdkiwi5b62FbsCpkbGARl+wQp2i5kCpETiBcNogZIK2HD7n9aJwJcCWI7eZZ9SvzcNIwqq+hfMbCm9GSDCHdb8dmmBb28hH+B2rvi0cFwnFCh2WvWAbFsBr8YpY+s85Cb05f5Lam0C6eqNsnMVjJNGGuP7+3TdT/Ux283crDnhuy8/PopAnl/ENwGvK8Oh4PHnJrw6yWQ0YTh+21tTLqB44xFQYpf7n9/sd2BbU=
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9sVgsrjV/J6jqibLehPI/Fqk7mRDY3Zf4YCmEZI86Ij3YlS5mbh7xsPWkfrk6MwQyH/rMGygyEK+OljHSoZO67eh4o7jKS91eqdQTNYnAYjKXGcopxFAlDzpdD6hrmfjYiFDpo/iux2/4selZVMIKKADCgZDggQk/CibyugU2RIRG0Zh7uUFx1iuEPpi2saazpqYIqzfRJd/9saW/rS4crMpgcJuEDC5xkZVHogZHFSNdK72LrLRfBEL/WkAV1jUOs5ctTFcchEyDhnZv+A/9mICu+2H0B63n4rCe8aXQbHp+zELijy4fKyWNc9ywgueel6LT4MGCBeP64LlbnvtK12Dg7A2y3sh9YmHnAr5HmXx9ujpJPr5BFvaSgL2x9IIMWZsORqR1efYqCf8zwpa8gnjGhQfGigWjI8kd81ZbB2yO2HSUaQeR8z27OT8pDNRMZu2LGzd5X3BjPn8nKPg0VmGFhBadfnkqtr+hVRtofmt/C/x7y0BXhRlCAfqOzniE7TZXp0Bizm+5Zh6AkxPu91QiNW7nxXYxSrQftDEZNBAQ3N0/mpYfe7EU2SX52dc
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+Amfm7Lm5R98xgsH+GNdYsDQGrHcRa9w55HsaP/aMJvMQSdQb0fNo770cJ?=
 =?iso-8859-1?Q?hhJs9EYb4ZZFW6PM6nQNPSiw9wEPX/gCvHoomUh0XQ7NEznKph9040yoVr?=
 =?iso-8859-1?Q?xTF4Fhdfkf834IxnbOWPGpkyiUUcBPf2VSrtgKxQkGPggukxAUqR/bc+ak?=
 =?iso-8859-1?Q?X/0TTcrxyk+Lfl7Z5273/reuYau7b1m7yv5C4Z+xXlvf3m48YC2n+6OdCA?=
 =?iso-8859-1?Q?SlyOxmgPNu1mru3LmdKKDU708UaLElHJSqkrz7G2PKNjBoyYN8pAWJbnoO?=
 =?iso-8859-1?Q?6SLFSfMRsFIZP/uIUPM4OEkXkvHkF6mFZw1h9+oLzBJL4WEASQuZtGkIKx?=
 =?iso-8859-1?Q?Q78QvbVuLgqJd2FsiF4fwRKc8oXgnV7LDg9QwoNJK9juQWBBaCnZW3I/qH?=
 =?iso-8859-1?Q?w7F2M3fsLZ2fS9sO6m5NVxnayrHVkayoMtir1l3xA+RV8r0hXDRInW6v4C?=
 =?iso-8859-1?Q?vKIByHgfTvexSjYm+J6DFiX/biL3x3pvHVRQGYyU5Kq2Zr6dRHpgXpKhhY?=
 =?iso-8859-1?Q?hn9JvxEiVt/HYmgLFNAq0FE8Bizxrn5TeyTtpXf/P+EwMq1V4J3wwBPcNb?=
 =?iso-8859-1?Q?rNDmE9fse7WGCtnzaZ5yBVgpaXs58T30uh7kn1LP/KF3m74eqcEjA16qq2?=
 =?iso-8859-1?Q?26oj3KjRbNlBO9+978KgVNjixk+MIIScxpJc/FS51jDFkeHnyrcFGrdZ9F?=
 =?iso-8859-1?Q?4GHO9csb4K/yInnV7t82ROfH9noWREMfT6xuP81bs0tA2sd1g54U+HL2Of?=
 =?iso-8859-1?Q?WsAxJO6rNqW3eZ8eR7441Dg078BuWyU3slb8CuxZwyOD5MhGQe29uqPXWo?=
 =?iso-8859-1?Q?yZ0YQ5LMgaFs9+Dji4layDIV8TCT51Bwyj+vU0Rif4Uicw76TBlGmjQYsM?=
 =?iso-8859-1?Q?qOp7vKju+HAEtaWhasrrSd6lb0UkoOQsPVrgrPNx1NfCzKfmW19dMfW8sb?=
 =?iso-8859-1?Q?sOIHKgREwSm6GFWN5e2dxKGXwRbdTFOhsyHVEBD31mbYSC+paoKzjrYiIV?=
 =?iso-8859-1?Q?PQI9WRhRTooQ39OSGrL6ka1OrJtwdANPJ3K/FCZu/intvcXfxpiPc0GVt6?=
 =?iso-8859-1?Q?dK3g458OYIT2L+33uIPYfM1DLvU05xT4w7p2/8O5+xQDpfhBGwVwPgpccE?=
 =?iso-8859-1?Q?9yyMJLOUQWM4i1WNNeH1QsaU6dwQcJr41k5T+6FZHab0WBiwCn4NFhOxSh?=
 =?iso-8859-1?Q?u4wVygyx4ZCHNO56AU08mmXsesQ35iaEirIphoPvKaoXPGXjWKsJk62soV?=
 =?iso-8859-1?Q?1kBs14rgta7L4XzI1/CNGPJrT0wBFBXw0URlB1DDA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB9P192MB143408981DB724A477C0ADA6A6462DB9P192MB1434EURP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB1434.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7e45af-fe60-4161-3fba-08dc272f2576
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 16:17:42.4753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P192MB1951

--_000_DB9P192MB143408981DB724A477C0ADA6A6462DB9P192MB1434EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Andrew,

Thank you for the quick response. I have no local modifications to Xen, pre=
cisely in order to test it as cleanly as possible.
As soon as possible, I'll try to use a more recent version. Regarding the s=
tack trace, I believe the series of function calls starts from:

vmx_asm_vmexit_handler -> vmx_vmexit_handler -> domain_crash -> __domain_cr=
ash

Thank you for addressing the concerns about security, next time I'll follow=
 your advice.

Best regards,
Giuseppe De Rosa.
________________________________
Da: Andrew Cooper <andrew.cooper3@citrix.com>
Inviato: marted=EC 6 febbraio 2024 15:11
A: Giuseppe De Rosa <giuseppe.de.rosa@outlook.it>; xen-devel@lists.xen.org =
<xen-devel@lists.xen.org>
Oggetto: Re: [BUG] Possible FATAL PAGE FAULT in domain_crash function on Xe=
n 4.14.6

On 06/02/2024 12:14 pm, Giuseppe De Rosa wrote:
> Bug detailed description:
>
> ----------------
>
> While booting a Linux Debian 7 "Wheezy" VM, Xen crashes with a FATAL
> PAGE FAULT.
>
>
>
> Environment :
>
> ----------------
>
> HW: Intel(R) Xeon(R) CPU E5-1620 v2 @ 3.70GHz (2 CPU, Xen in nested
> virtualization upon QEMU/KVM), 4GB RAM
>
> Xen: Xen 4.14.6 (xen-hypervisor-4.14-amd64 package)
>
> Dom0: Linux 5.10.0-26-amd64 (Debian 11 "Bullseye"), 1 CPU, 1024GB RAM
>
>
>
> Reproduce steps:
>
> ----------------
>
> 1.      Install debian 11 and xen package
>
> 2.      Boot a clean debian 7 image in hardware-assisted virtualization
>
> 3.      Single bit-flip bit number 2 of VMCS field
> "VM_EXIT_QUALIFICATION" (field number 6400). In my case, value changed
> from [100049] -> [10004d]
>
> 4.      Leave the debian7 guest executing after the bit flip.
>
>
>
> Current result:
>
> ----------------
>
> Xen crash
>
>
>
> Console error log:
>
> ----------------
>
> (XEN) d1v0 Unexpected PIO status 1, port 0x10 read 0x00000000ffff
>
> (XEN) domain_crash called from io.c:166
> (XEN) Domain 1 (vcpu#0) crashed on cpu#1:
> (XEN) ----[ Xen-4.14.6  x86_64  debug=3Dn   Not tainted ]----
> (XEN) CPU:    1
> (XEN) RIP:    0010:[<ffffffff8100712e>]
> (XEN) RFLAGS: 0000000000000046   CONTEXT: hvm guest (d1v0)
> (XEN) rax: 0000000000000000   rbx: 0000000040000000   rcx: 00000000000000=
01
> (XEN) rdx: 0000000000000000   rsi: ffffffff81666a80   rdi: ffffffff816178=
30
> (XEN) rbp: 0000000000000020   rsp: ffffffff81601e78   r8:  00000000000002=
00
> (XEN) r9:  ffffffff8168f2a0   r10: 0000000000000007   r11: 00000000000000=
07
> (XEN) r12: ffffffff81601f58   r13: ffffffffffffffff   r14: 000000000008c8=
00
> (XEN) r15: 0000000000001000   cr0: 0000000080050033   cr4: 00000000001000=
a0
> (XEN) cr3: 0000000001605000   cr2: 0000000000000000
> (XEN) fsb: 0000000000000000   gsb: ffffffff81696000   gss: 00000000000000=
00
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: 0010
> (XEN) d1v0 Bad rIP ffffffff8100712e for mode 0
> (XEN) domain_crash called from vmx.c:4413
> (XEN) ----[ Xen-4.14.6  x86_64  debug=3Dn   Not tainted ]----
> (XEN) CPU:    1
> (XEN) RIP:    e008:[<ffff82d040206fa9>] __domain_crash+0x9/0x80
> (XEN) RFLAGS: 0000000000010296   CONTEXT: hypervisor (d1v0)
> (XEN) rax: ffff830139c0506c   rbx: ffff8301308a0000   rcx: 00000000000000=
00
> (XEN) rdx: ffff830136ddffff   rsi: 000000000000000a   rdi: 00000000000000=
00
> (XEN) rbp: 0000000000000000   rsp: ffff830136ddfee0   r8:  00000000000000=
01
> (XEN) r9:  0000000000004000   r10: 0000000000000001   r11: ffff82d040372d=
40
> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 00000000000000=
00
> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000001526=
e0
> (XEN) cr3: 0000000136da6000   cr2: 0000000000000208
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000000=
00
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d040206fa9> (__domain_crash+0x9/0x80):
> (XEN)  0f 1e fa 55 48 89 fd 53 <80> bf 08 02 00 00 00 75 2d 48 89 e3 0f
> b7 37 48
> (XEN) Xen stack trace from rsp=3Dffff830136ddfee0:
> (XEN)    ffff8301308a0000 0000000000000000 ffff82d0402a1798 0000000000001=
000
> (XEN)    000000000008c800 ffffffffffffffff ffffffff81601f58 0000000000000=
020
> (XEN)    0000000040000000 0000000000000007 0000000000000007 ffffffff8168f=
2a0
> (XEN)    0000000000000200 0000000000000000 0000000000000001 0000000000000=
000
> (XEN)    ffffffff81666a80 ffffffff81617830 000000fa00000000 ffffffff81007=
12e
> (XEN)    0000000000000000 0000000000000046 ffffffff81601e78 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000e01000000001 ffff8301308a0000 00000030f9686000 0000000000152=
6e0
> (XEN)    0000000000000000 0000000000000000 0006020200000000 0000000000000=
000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040206fa9>] R __domain_crash+0x9/0x80
> (XEN)    [<ffff82d0402a1798>] S vmx_asm_vmexit_handler+0xf8/0x210
> (XEN)
> (XEN) Pagetable walk from 0000000000000208:
> (XEN)  L4[0x000] =3D 0000000000000000 ffffffffffffffff
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 1:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=3D0000]
> (XEN) Faulting linear address: 0000000000000208
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
>
>
>
> HVM guest config file:
>
> --------------------------------
>
> name =3D "debian7"
>
> builder=3D "hvm"
> memory =3D 1024
> vcpus =3D 1
> cpus=3D ["1"]
> disk=3D["qcow2:/home/test/debian7.qcow2,xvda,w"]
> vnc =3D 1
> vnclisten =3D '127.0.0.1'
> vncdisplay =3D 1
> boot =3D "d"
> serial =3D "pty"
>
> Discussion
> --------------------------------
>
> Hello, i am conducting robustness tests on Xen 4.14. I bit flipped the
> field VM_EXIT_QUALIFICATION during the exit handling of an
> IO_INSTRUCTION. After a VM Read on that field, Xen crashes with this
> error log. This is my (possible) explanation:
>
> Xen correctly detects an error in the field, resulting in a domain crash
> (Unexpected PIO status 1) called from this point in the code:
>
> xen/arch/x86/hvm/io.c
> ```
> gprintk(XENLOG_ERR, "Unexpected PIO status %d, port %#x %s 0x%0*x\n",
>                 rc, port, dir =3D=3D IOREQ_WRITE ? "write" : "read",
>                 size * 2, data & ((1u << (size * 8)) - 1));
> domain_crash(curr->domain);
> return false;
> ```
>
> In the `handle_pio` function, in the handling of the `IO_INSTRUCTION`
> exit reason. However, the code continues and ends here for an issue in
> the processor mode:
>
> /xen/arch/x86/hvm/vmx/vmx.c
> ```
> mode =3D vmx_guest_x86_mode(v);
>     if ( mode =3D=3D 8 ? !is_canonical_address(regs->rip)
>                    : regs->rip !=3D regs->eip )
>     {
>         gprintk(XENLOG_WARNING, "Bad rIP %lx for mode %u\n", regs->rip,
> mode);
>
>         if ( vmx_get_cpl() )
>         {
>             __vmread(VM_ENTRY_INTR_INFO, &intr_info);
>             if ( !(intr_info & INTR_INFO_VALID_MASK) )
>                 hvm_inject_hw_exception(TRAP_gp_fault, 0);
>             /* Need to fix rIP nevertheless. */
>             if ( mode =3D=3D 8 )
>                 regs->rip =3D (long)(regs->rip << (64 - VADDR_BITS)) >>
>                             (64 - VADDR_BITS);
>             else
>                 regs->rip =3D regs->eip;
>         }
>         else
>             domain_crash(v->domain);
>     }
> ```
>
> However, the domain pointer has already been deallocated due to the
> previous domain crash, resulting in a page fault that leads to Xen crashi=
ng.
>
> I would like to report this crash and ask for your opinion. Based on
> previous research, I do not believe it has been reported before. I am
> unsure if it could potentially be a security issue, hence I am posting
> it here. Let me know if I should provide other results. Thank you for
> your kind response in advance.


Answering somewhat out of order.

You've posted this publicly so the cat is out of the bag regardless.  If
you have concerns about security, please email security@xen.org as your
first point of contact.

That said, nested virt is not security supported.  It's still an
experimental feature, so bugs like this are fine to come straight to the
public mailing list.

The "Bad rIP" logic is buggy and has since been deleted.  Xen 4.14 is a
very old version of Xen, and is outside of general bugfix support.

It is quite likely that this bug still exists, but please use an
up-to-date version of Xen.  Fixes need developing against master and are
unlikely to be backported in this case, given its experimental status.

Also, you should be using a debug build of Xen generally for work like
this.  (I have no idea if it would alter your observations.)


I'm not sure what I think about bitflipping the exit qualification.  In
other places, that will definitely cause more severe crashes, and Xen
won't be getting in the game of auditing the VMX implementation against
the VMX spec.


For this crash you've got, there should be no way for the domain pointer
to have been freed in the sequence you've described.  While the vCPU is
still scheduled, the structures will remain.

Looking at the second backtrace, It looks suspiciously like a NULL
pointer was passed into __domain_crash() from vmx_asm_vmexit_handler()
but there's no such call call, nor a tailcall out of the handler, even
taking a peek at the 4.14 code.

If you have local changes, I'd look at those first.

~Andrew

--_000_DB9P192MB143408981DB724A477C0ADA6A6462DB9P192MB1434EURP_
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
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Hello Andrew,</span><=
/div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">Thank you for the quick response. I have no lo=
cal modifications to Xen, precisely in order to test it as cleanly as possi=
ble.</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">As soon as possible, I'll try to use a more re=
cent version. Regarding the stack trace, I believe the series of function c=
alls starts from:</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">vmx_asm_vmexit_handler -&gt; vmx_vmexit_handle=
r -&gt; domain_crash -&gt; __domain_crash</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">Thank you for addressing the concerns about se=
curity, next time I'll follow your advice.</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">Best regards,</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">Giuseppe De Rosa.</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Da:</b> Andrew Cooper &lt;andre=
w.cooper3@citrix.com&gt;<br>
<b>Inviato:</b> marted=EC 6 febbraio 2024 15:11<br>
<b>A:</b> Giuseppe De Rosa &lt;giuseppe.de.rosa@outlook.it&gt;; xen-devel@l=
ists.xen.org &lt;xen-devel@lists.xen.org&gt;<br>
<b>Oggetto:</b> Re: [BUG] Possible FATAL PAGE FAULT in domain_crash functio=
n on Xen 4.14.6</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 06/02/2024 12:14 pm, Giuseppe De Rosa wrote:<br=
>
&gt; Bug detailed description:<br>
&gt; <br>
&gt; ----------------<br>
&gt; <br>
&gt; While booting a Linux Debian 7 &quot;Wheezy&quot; VM, Xen crashes with=
 a FATAL<br>
&gt; PAGE FAULT.&nbsp;<br>
&gt; <br>
&gt; &nbsp;<br>
&gt; <br>
&gt; Environment :<br>
&gt; <br>
&gt; ----------------<br>
&gt; <br>
&gt; HW: Intel(R) Xeon(R) CPU E5-1620 v2 @ 3.70GHz (2 CPU, Xen in nested<br=
>
&gt; virtualization upon QEMU/KVM), 4GB RAM<br>
&gt; <br>
&gt; Xen: Xen 4.14.6 (xen-hypervisor-4.14-amd64 package)<br>
&gt; <br>
&gt; Dom0: Linux 5.10.0-26-amd64 (Debian 11 &quot;Bullseye&quot;), 1 CPU, 1=
024GB RAM<br>
&gt; <br>
&gt; &nbsp;<br>
&gt; <br>
&gt; Reproduce steps:<br>
&gt; <br>
&gt; ----------------<br>
&gt; <br>
&gt; 1.&nbsp; &nbsp; &nbsp; Install debian 11 and xen package<br>
&gt; <br>
&gt; 2.&nbsp; &nbsp; &nbsp; Boot a clean debian 7 image in hardware-assiste=
d virtualization<br>
&gt; <br>
&gt; 3.&nbsp; &nbsp; &nbsp; Single bit-flip bit number 2 of VMCS field<br>
&gt; &quot;VM_EXIT_QUALIFICATION&quot; (field number 6400). In my case, val=
ue changed<br>
&gt; from [100049] -&gt; [10004d]<br>
&gt; <br>
&gt; 4.&nbsp; &nbsp; &nbsp; Leave the debian7 guest executing after the bit=
 flip.<br>
&gt; <br>
&gt; &nbsp;<br>
&gt; <br>
&gt; Current result:<br>
&gt; <br>
&gt; ----------------<br>
&gt; <br>
&gt; Xen crash<br>
&gt; <br>
&gt; &nbsp;<br>
&gt; <br>
&gt; Console error log:<br>
&gt; <br>
&gt; ----------------<br>
&gt; <br>
&gt; (XEN) d1v0 Unexpected PIO status 1, port 0x10 read 0x00000000ffff<br>
&gt; <br>
&gt; (XEN) domain_crash called from io.c:166<br>
&gt; (XEN) Domain 1 (vcpu#0) crashed on cpu#1:<br>
&gt; (XEN) ----[ Xen-4.14.6 &nbsp;x86_64 &nbsp;debug=3Dn &nbsp; Not tainted=
 ]----<br>
&gt; (XEN) CPU: &nbsp; &nbsp;1<br>
&gt; (XEN) RIP: &nbsp; &nbsp;0010:[&lt;ffffffff8100712e&gt;]<br>
&gt; (XEN) RFLAGS: 0000000000000046 &nbsp; CONTEXT: hvm guest (d1v0)<br>
&gt; (XEN) rax: 0000000000000000 &nbsp; rbx: 0000000040000000 &nbsp; rcx: 0=
000000000000001<br>
&gt; (XEN) rdx: 0000000000000000 &nbsp; rsi: ffffffff81666a80 &nbsp; rdi: f=
fffffff81617830<br>
&gt; (XEN) rbp: 0000000000000020 &nbsp; rsp: ffffffff81601e78 &nbsp; r8: &n=
bsp;0000000000000200<br>
&gt; (XEN) r9: &nbsp;ffffffff8168f2a0 &nbsp; r10: 0000000000000007 &nbsp; r=
11: 0000000000000007<br>
&gt; (XEN) r12: ffffffff81601f58 &nbsp; r13: ffffffffffffffff &nbsp; r14: 0=
00000000008c800<br>
&gt; (XEN) r15: 0000000000001000 &nbsp; cr0: 0000000080050033 &nbsp; cr4: 0=
0000000001000a0<br>
&gt; (XEN) cr3: 0000000001605000 &nbsp; cr2: 0000000000000000<br>
&gt; (XEN) fsb: 0000000000000000 &nbsp; gsb: ffffffff81696000 &nbsp; gss: 0=
000000000000000<br>
&gt; (XEN) ds: 0000 &nbsp; es: 0000 &nbsp; fs: 0000 &nbsp; gs: 0000 &nbsp; =
ss: 0000 &nbsp; cs: 0010<br>
&gt; (XEN) d1v0 Bad rIP ffffffff8100712e for mode 0<br>
&gt; (XEN) domain_crash called from vmx.c:4413<br>
&gt; (XEN) ----[ Xen-4.14.6 &nbsp;x86_64 &nbsp;debug=3Dn &nbsp; Not tainted=
 ]----<br>
&gt; (XEN) CPU: &nbsp; &nbsp;1<br>
&gt; (XEN) RIP: &nbsp; &nbsp;e008:[&lt;ffff82d040206fa9&gt;] __domain_crash=
+0x9/0x80<br>
&gt; (XEN) RFLAGS: 0000000000010296 &nbsp; CONTEXT: hypervisor (d1v0)<br>
&gt; (XEN) rax: ffff830139c0506c &nbsp; rbx: ffff8301308a0000 &nbsp; rcx: 0=
000000000000000<br>
&gt; (XEN) rdx: ffff830136ddffff &nbsp; rsi: 000000000000000a &nbsp; rdi: 0=
000000000000000<br>
&gt; (XEN) rbp: 0000000000000000 &nbsp; rsp: ffff830136ddfee0 &nbsp; r8: &n=
bsp;0000000000000001<br>
&gt; (XEN) r9: &nbsp;0000000000004000 &nbsp; r10: 0000000000000001 &nbsp; r=
11: ffff82d040372d40<br>
&gt; (XEN) r12: 0000000000000000 &nbsp; r13: 0000000000000000 &nbsp; r14: 0=
000000000000000<br>
&gt; (XEN) r15: 0000000000000000 &nbsp; cr0: 0000000080050033 &nbsp; cr4: 0=
0000000001526e0<br>
&gt; (XEN) cr3: 0000000136da6000 &nbsp; cr2: 0000000000000208<br>
&gt; (XEN) fsb: 0000000000000000 &nbsp; gsb: 0000000000000000 &nbsp; gss: 0=
000000000000000<br>
&gt; (XEN) ds: 0000 &nbsp; es: 0000 &nbsp; fs: 0000 &nbsp; gs: 0000 &nbsp; =
ss: 0000 &nbsp; cs: e008<br>
&gt; (XEN) Xen code around &lt;ffff82d040206fa9&gt; (__domain_crash+0x9/0x8=
0):<br>
&gt; (XEN) &nbsp;0f 1e fa 55 48 89 fd 53 &lt;80&gt; bf 08 02 00 00 00 75 2d=
 48 89 e3 0f<br>
&gt; b7 37 48<br>
&gt; (XEN) Xen stack trace from rsp=3Dffff830136ddfee0:<br>
&gt; (XEN) &nbsp; &nbsp;ffff8301308a0000 0000000000000000 ffff82d0402a1798 =
0000000000001000<br>
&gt; (XEN) &nbsp; &nbsp;000000000008c800 ffffffffffffffff ffffffff81601f58 =
0000000000000020<br>
&gt; (XEN) &nbsp; &nbsp;0000000040000000 0000000000000007 0000000000000007 =
ffffffff8168f2a0<br>
&gt; (XEN) &nbsp; &nbsp;0000000000000200 0000000000000000 0000000000000001 =
0000000000000000<br>
&gt; (XEN) &nbsp; &nbsp;ffffffff81666a80 ffffffff81617830 000000fa00000000 =
ffffffff8100712e<br>
&gt; (XEN) &nbsp; &nbsp;0000000000000000 0000000000000046 ffffffff81601e78 =
0000000000000000<br>
&gt; (XEN) &nbsp; &nbsp;0000000000000000 0000000000000000 0000000000000000 =
0000000000000000<br>
&gt; (XEN) &nbsp; &nbsp;0000e01000000001 ffff8301308a0000 00000030f9686000 =
00000000001526e0<br>
&gt; (XEN) &nbsp; &nbsp;0000000000000000 0000000000000000 0006020200000000 =
0000000000000000<br>
&gt; (XEN) Xen call trace:<br>
&gt; (XEN) &nbsp; &nbsp;[&lt;ffff82d040206fa9&gt;] R __domain_crash+0x9/0x8=
0<br>
&gt; (XEN) &nbsp; &nbsp;[&lt;ffff82d0402a1798&gt;] S vmx_asm_vmexit_handler=
+0xf8/0x210<br>
&gt; (XEN)<br>
&gt; (XEN) Pagetable walk from 0000000000000208:<br>
&gt; (XEN) &nbsp;L4[0x000] =3D 0000000000000000 ffffffffffffffff<br>
&gt; (XEN)<br>
&gt; (XEN) ****************************************<br>
&gt; (XEN) Panic on CPU 1:<br>
&gt; (XEN) FATAL PAGE FAULT<br>
&gt; (XEN) [error_code=3D0000]<br>
&gt; (XEN) Faulting linear address: 0000000000000208<br>
&gt; (XEN) ****************************************<br>
&gt; (XEN)<br>
&gt; (XEN) Reboot in five seconds...<br>
&gt; <br>
&gt; &nbsp;<br>
&gt; <br>
&gt; HVM guest config file:<br>
&gt; <br>
&gt; --------------------------------<br>
&gt; <br>
&gt; name =3D &quot;debian7&quot;<br>
&gt; <br>
&gt; builder=3D &quot;hvm&quot;<br>
&gt; memory =3D 1024<br>
&gt; vcpus =3D 1<br>
&gt; cpus=3D [&quot;1&quot;]<br>
&gt; disk=3D[&quot;qcow2:/home/test/debian7.qcow2,xvda,w&quot;]<br>
&gt; vnc =3D 1<br>
&gt; vnclisten =3D '127.0.0.1'<br>
&gt; vncdisplay =3D 1<br>
&gt; boot =3D &quot;d&quot;<br>
&gt; serial =3D &quot;pty&quot;<br>
&gt; <br>
&gt; Discussion<br>
&gt; --------------------------------<br>
&gt; <br>
&gt; Hello, i am conducting robustness tests on Xen 4.14. I bit flipped the=
<br>
&gt; field VM_EXIT_QUALIFICATION during the exit handling of an<br>
&gt; IO_INSTRUCTION. After a VM Read on that field, Xen crashes with this<b=
r>
&gt; error log. This is my (possible) explanation:<br>
&gt; <br>
&gt; Xen correctly detects an error in the field, resulting in a domain cra=
sh<br>
&gt; (Unexpected PIO status 1) called from this point in the code:<br>
&gt; <br>
&gt; xen/arch/x86/hvm/io.c<br>
&gt; ```<br>
&gt; gprintk(XENLOG_ERR, &quot;Unexpected PIO status %d, port %#x %s 0x%0*x=
\n&quot;,<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc, port, dir =
=3D=3D IOREQ_WRITE ? &quot;write&quot; : &quot;read&quot;,<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size * 2, data=
 &amp; ((1u &lt;&lt; (size * 8)) - 1));<br>
&gt; domain_crash(curr-&gt;domain);<br>
&gt; return false;<br>
&gt; ```<br>
&gt; <br>
&gt; In the `handle_pio` function, in the handling of the `IO_INSTRUCTION`<=
br>
&gt; exit reason. However, the code continues and ends here for an issue in=
<br>
&gt; the processor mode:<br>
&gt; <br>
&gt; /xen/arch/x86/hvm/vmx/vmx.c<br>
&gt; ```<br>
&gt; mode =3D vmx_guest_x86_mode(v);<br>
&gt; &nbsp; &nbsp; if ( mode =3D=3D 8 ? !is_canonical_address(regs-&gt;rip)=
<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:=
 regs-&gt;rip !=3D regs-&gt;eip )<br>
&gt; &nbsp; &nbsp; {<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; gprintk(XENLOG_WARNING, &quot;Bad rIP %lx =
for mode %u\n&quot;, regs-&gt;rip,<br>
&gt; mode);<br>
&gt; <br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; if ( vmx_get_cpl() )<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; {<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; __vmread(VM_ENTRY_INTR_INFO,=
 &amp;intr_info);<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if ( !(intr_info &amp; INTR_=
INFO_VALID_MASK) )<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hvm_inject_hw_=
exception(TRAP_gp_fault, 0);<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* Need to fix rIP neverthel=
ess. */<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if ( mode =3D=3D 8 )<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; regs-&gt;rip =
=3D (long)(regs-&gt;rip &lt;&lt; (64 - VADDR_BITS)) &gt;&gt;<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; (64 - VADDR_BITS);<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; regs-&gt;rip =
=3D regs-&gt;eip;<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; else<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; domain_crash(v-&gt;domain);<=
br>
&gt; &nbsp; &nbsp; }<br>
&gt; ```<br>
&gt; <br>
&gt; However, the domain pointer has already been deallocated due to the<br=
>
&gt; previous domain crash, resulting in a page fault that leads to Xen cra=
shing.<br>
&gt; <br>
&gt; I would like to report this crash and ask for your opinion. Based on<b=
r>
&gt; previous research, I do not believe it has been reported before. I am<=
br>
&gt; unsure if it could potentially be a security issue, hence I am posting=
<br>
&gt; it here. Let me know if I should provide other results. Thank you for<=
br>
&gt; your kind response in advance.<br>
<br>
<br>
Answering somewhat out of order.<br>
<br>
You've posted this publicly so the cat is out of the bag regardless.&nbsp; =
If<br>
you have concerns about security, please email security@xen.org as your<br>
first point of contact.<br>
<br>
That said, nested virt is not security supported.&nbsp; It's still an<br>
experimental feature, so bugs like this are fine to come straight to the<br=
>
public mailing list.<br>
<br>
The &quot;Bad rIP&quot; logic is buggy and has since been deleted.&nbsp; Xe=
n 4.14 is a<br>
very old version of Xen, and is outside of general bugfix support.<br>
<br>
It is quite likely that this bug still exists, but please use an<br>
up-to-date version of Xen.&nbsp; Fixes need developing against master and a=
re<br>
unlikely to be backported in this case, given its experimental status.<br>
<br>
Also, you should be using a debug build of Xen generally for work like<br>
this.&nbsp; (I have no idea if it would alter your observations.)<br>
<br>
<br>
I'm not sure what I think about bitflipping the exit qualification.&nbsp; I=
n<br>
other places, that will definitely cause more severe crashes, and Xen<br>
won't be getting in the game of auditing the VMX implementation against<br>
the VMX spec.<br>
<br>
<br>
For this crash you've got, there should be no way for the domain pointer<br=
>
to have been freed in the sequence you've described.&nbsp; While the vCPU i=
s<br>
still scheduled, the structures will remain.<br>
<br>
Looking at the second backtrace, It looks suspiciously like a NULL<br>
pointer was passed into __domain_crash() from vmx_asm_vmexit_handler()<br>
but there's no such call call, nor a tailcall out of the handler, even<br>
taking a peek at the 4.14 code.<br>
<br>
If you have local changes, I'd look at those first.<br>
<br>
~Andrew<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB9P192MB143408981DB724A477C0ADA6A6462DB9P192MB1434EURP_--

