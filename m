Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62A45B75E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 10:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230216.397991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpoUn-0003gI-H2; Wed, 24 Nov 2021 09:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230216.397991; Wed, 24 Nov 2021 09:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpoUn-0003dX-DN; Wed, 24 Nov 2021 09:23:17 +0000
Received: by outflank-mailman (input) for mailman id 230216;
 Wed, 24 Nov 2021 09:23:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XpRf=QL=hotmail.com=yanluyi2010@srs-se1.protection.inumbo.net>)
 id 1mpoUl-0003dR-90
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 09:23:15 +0000
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01olkn2082e.outbound.protection.outlook.com
 [2a01:111:f403:7010::82e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25437f84-4d08-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 10:23:14 +0100 (CET)
Received: from OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1a2::6)
 by OSZP286MB2256.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:18e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 24 Nov
 2021 09:23:09 +0000
Received: from OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9c31:6396:f5d2:35e6]) by OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9c31:6396:f5d2:35e6%9]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 09:23:09 +0000
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
X-Inumbo-ID: 25437f84-4d08-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxcrPwFddSuJqrIPvEOaZt/E/PVMenhlzjhANFmpDKgZTM34svKU5kLXKfCpVaZFL5/O2NOAHUxfUpNTBdwy2pFlKGGYF/75uQ8cZ8S+nLXhE8BPs+usSJXOSdVOU+5NN1E6RIfEajlRwGmI4LqLj1pmi4mrH9cgw6O0hcCKtR8fciJrPT8O2j1zUFnxZG1MKPLQ3AcwlydhYaj3Iy5stF3YSmBmzTA0XceEUO8BxngGQUtNgxppHaRQIibYbnma+fYV4HtJzGxKSynAEuZBLOIJ3MERmoDaASYwTgpkL5ECRS9npgZ0bmKDl/H4ANZNL3VVtZYnDfwTx5FUxcr+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uf2tDABW1rdquG0aLJXpTc7bgtZyPWkuOIxWkxUro+o=;
 b=ORb/9qE5ToeZ7xY7NPPXjZQOqXSav2GnSnNOMtOm3GPlxzkfPYGHg+H1EKIDgNv7ZXA9VYvwk/zRcAEuZn209+JgtbSJBNdO72dpfkl+I50ptpsR8U6ynVUUOiWb2XTB1tvaiV+paMJnIIWsEq8hJWdMLhFy5w/HNT2T+eZDvbss1Wt+foJBDDmbIQVsMRFkU1Kw/mmt6iSYvL6KxMoxnU7nQda7la9JM3cnNGLJriQCYch+J81AAugDIbjKz98jL55W3gz297ugsKI34oCS61JZV3HNwQwmi168SEXDWOf+omNuK5DisGWyUkfWC1S9pta6y1n0mD/A5wMlCLruoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uf2tDABW1rdquG0aLJXpTc7bgtZyPWkuOIxWkxUro+o=;
 b=E58kPkEGbLnXxG8VLj19ftSY8favkXcYTa62FT0+vKmiMjDd/ze7Pa06+AhCOHolbn5RqXeYweHXhjpw+mkY3Jv/p8QvmveO0WzDX77KWIUCjZurNGGGTRWOO38G1tHPdJB/kj5BGUMhFOIZmcwRkyGW9OyuhWBJH3TG8RYL2LjwE8PNbX14j4Ve1ao6+U0QGl1rDYMiFGkhf0JQgfTEVWjjcM3MxflQmnZfM3kiCPDe6J1HbG+KB0BcB4CdkMHr/PiIEzdPHAORnx4Cu+nWfKL9NkWsmmViqiDEoskmonKR8TOo66eeGJgyPcyaYn9fLS0uWuJ1NTNCNYPuFNauVA==
From: Untitled YAN <yanluyi2010@hotmail.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "tamas@tklengyel.com" <tamas@tklengyel.com>, "aisaila@bitdefender.com"
	<aisaila@bitdefender.com>, "ppircalabu@bitdefender.com"
	<ppircalabu@bitdefender.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: About support for memory event on AMD CPUs
Thread-Topic: About support for memory event on AMD CPUs
Thread-Index: AQHX4Ivyto+Oc0SSQ0aRZryw/8JAG6wST82AgAAO3bA=
Date: Wed, 24 Nov 2021 09:23:09 +0000
Message-ID:
 <OS3P286MB19953CFD3B3D4B2B71261DD9B3619@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
References:
 <OS3P286MB1995471B56ADDC423A4EDC9FB3609@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
 <ad9abcb1-0a17-644b-5338-8c305e9ce4b4@suse.com>
In-Reply-To: <ad9abcb1-0a17-644b-5338-8c305e9ce4b4@suse.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 385db734-82bf-2611-7953-fd7021148395
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [2i3AlY3af0QBCzZVf5ubxMio01LaUn2wE4YA6hkioB4=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5af1e031-7161-48d3-2d9f-08d9af2c07ef
x-ms-traffictypediagnostic: OSZP286MB2256:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YgGh3/Lv7/ce8eS1hKhaoW0fx7fCczdm/nwVD+Ltb1OvVUh5rXqc84Tma38vqMx4AnZtxd8yOI5ZtZgaOsMHjrYI4TXeG3p/uu3MW1e+W1ehMNAY1+M5D4/QK/fo1s0hwA3Ty1MjqHcu8L6vP+6VKtX8Fk66/hL7thLH9S/sWFXpJqi7ypkursmOeU8WRiCqTb6wTPriwyD0F+7NRMECx221rQJz82Q2FD1LqyvwRLurQmF7EJfhh2xMHt5TCtYajIzYlJ3GCiIy25gAjkSKavq+Po0RyhA63nLNHGszM4QHSbjq0+UCw0ERNPYVjKBPczuDsQHUP0fuYz6Q5QmR6Ej7PwbuEJSImR+DXQ7cvNU6DGyhz4+7TP8gbbqY598513pqiNeHWh2I/L1i3cJBPLACW19s2RD94wIjjQJwMHzq0x73uthZZpyxsnbLATOv9EUqQi9RrDoOy5P3zpnPGk1PCGAocH/4KZNkHopUVFLyJaCd52Pw34JdYYooVO8PsZO9CmFG6wq7NtSRQlIQ97AiobWbc1D6m5RF7CAhfcGlQ9lU/UoJtP6s1mbzehMjsUR+/tnwwdZiY0KcYTB8j9ccpgb+Xcx43F2wI8swKYkPkYkvS7+xo5jXyY6n9t1T
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 r9rcywUXY0jQODybHVFXo1FKt/+RMOEpN2mFM3yodxNscpS2xt3C78ZxioKsyvPndlqCc/GLdCfjdPPQHaOqogG2WRU/LQ7u4v4hshyB3Lq/bUSAavVJu2DIP4oX8+GEyhABUXJhOJoyvqV9+k58p2MSDqC6CxqG7IMrlagUzedyDgc91O6n7yS10KqUIejRNLs/J72KinB1m22WlltymWVaMDU/EV4vonv52JNaJIOxrDxC7TcKFDnoa5FnzacnoosLWolT4M/OyThkcqw5aVhVd7cYr0+XwdxlD2JMTcIE8geR0fwudOuzYtqZ0saxNCD2wU1ZbZsCebURchrbml3RGG8U7zeo6J14UeWJGVCJwwCaSP5WV7B7FofqeDn7HP6kcoDs/dMOCf477hreszXrHxiyxw8HAhpHzciIL4oBVmrBdw12vvg+WYn3i2hgX1TySMNkli60AB2+fX8msX4qxywkPl43OyAUwCu8Ag3VXqmMfv9S/LKY6u75L3MlTPiJMk5kUHZ+TxmA/Mw+Zh/ThI3aOjYBEFHTL2ALVHkF0XW8nK7XC0ddFWk4BUTUQn1XxjOPzRP8/qbIaWY+yVwLZjYj0FmxbfE7kc6/yjbjooe07PKtCHdpzyS5ES6wRWqxfOswwAvzFcIwv/npmRSeu21RyoROJUcDIzARQDdjUe6E9kZMzJo0eba7bCCbJX6sapspzloEuGZdiccVXw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-18f16.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af1e031-7161-48d3-2d9f-08d9af2c07ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 09:23:09.4938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB2256

Original email:=0A=
=0A=
From: Jan Beulich <jbeulich@suse.com>=0A=
Sent: Wednesday, November 24, 2021 15:54=0A=
To: YAN Untitled <yanluyi2010@hotmail.com>=0A=
Cc: tamas@tklengyel.com <tamas@tklengyel.com>; aisaila@bitdefender.com <ais=
aila@bitdefender.com>; ppircalabu@bitdefender.com <ppircalabu@bitdefender.c=
om>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
Subject: Re: About support for memory event on AMD CPUs =0A=
=A0=0A=
> On 23.11.2021 18:14, YAN Untitled wrote:=0A=
> > Dear developers,=0A=
> > =0A=
> > Short version: is memory event supported on AMD CPUs or is it going to =
be=0A=
> > supported?=0A=
> > =0A=
> > Long version:=0A=
> > =0A=
> > Environment: LibVMI 0.15.0 + Xen 4.14.3 on an **AMD CPU** (5950x), 64-b=
it=0A=
> > Debian 11 Dom0.=0A=
> > =0A=
> > What I am trying to accomplish: register a **memory event** handler, so=
 that=0A=
> > I can capture all memory accesses within a specific range issued by any=
 thread,=0A=
> > or all memory accesses within any range issued by a specific thread.=0A=
> > =0A=
> > What I got instead: an error from LibVMI saying=0A=
> > "xc_hvm_set_mem_access failed with code: -1".=0A=
> > =0A=
> > Some investigation: by inspecting the source code of LibVMI, I find the=
 direct=0A=
> > cause is one of the libxc functions, 1) xc_set_mem_access or=0A=
> > 2) xc_altp2m_set_mem_access, returned error code -1.=0A=
> > =0A=
> > After some searching, I found someone else having a similar problem [1]=
. I also=0A=
> > noted LibVMI says:=0A=
> > =0A=
> >> Currently only the Xen Hypervisor provides these features,=0A=
> >> and some of these are specifically only available on Intel CPUs=0A=
> > =0A=
> > However, I can't find the exact confirmation for the availability of me=
mory=0A=
> > event on AMD CPUs from https://wiki.xenproject.org.=0A=
> =0A=
> Aiui underlying what you want is altp2m, which presently depends (in=0A=
> the hypervisor) on EPT being available (and in use for the guest in=0A=
> question).=0A=
> =0A=
> Jan=0A=
=0A=
Dear Jan,=0A=
=0A=
Thanks for your reply. I really appreciate the information. After some=0A=
searching with the keyword "EPT" I found [1]. So I checked on dom0 with=0A=
"xl dmesg | grep HAP", which says:=0A=
=0A=
> (XEN) HVM: Hardware Assisted Paging (HAP) detected=0A=
> (XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB=0A=
=0A=
And the guest is an HVM guest running Debian 10 with kernel v4.16 built fro=
m=0A=
source. Most of the configuration of the guest is generated by virt-manager=
.=0A=
The "xl list -l" shows that there is no explicit configuration for EPT, RVI=
 or=0A=
HAP, but it does say the "type" is "hvm". So I am still quite confusing:=0A=
=0A=
1. Is memory event feature for AMD's RVI is even implemented?=0A=
2. If memory event should be working on AMD CPUs with RVI enabled, am I mis=
sing=0A=
   any essential step to make it work?=0A=
=0A=
[1] https://groups.google.com/g/vmitools/c/JRN11E64BNY=0A=
=0A=
=0A=
Untitled YAN=0A=

