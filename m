Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C822C45C458
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 14:45:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230438.398336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpsZu-00080G-IU; Wed, 24 Nov 2021 13:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230438.398336; Wed, 24 Nov 2021 13:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpsZu-0007xx-Ej; Wed, 24 Nov 2021 13:44:50 +0000
Received: by outflank-mailman (input) for mailman id 230438;
 Wed, 24 Nov 2021 13:44:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XpRf=QL=hotmail.com=yanluyi2010@srs-se1.protection.inumbo.net>)
 id 1mpsZs-0007xr-BU
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 13:44:48 +0000
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01olkn20805.outbound.protection.outlook.com
 [2a01:111:f403:7010::805])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abfdefda-4d2c-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 14:44:42 +0100 (CET)
Received: from OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1a2::6)
 by OSZP286MB2315.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:185::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Wed, 24 Nov
 2021 13:44:42 +0000
Received: from OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9c31:6396:f5d2:35e6]) by OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9c31:6396:f5d2:35e6%9]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 13:44:42 +0000
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
X-Inumbo-ID: abfdefda-4d2c-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RG9pcXMboDeLdiNI0DbagK4sv1S93AK4C3xiprZvigygmAAAGgg8eNYnqmQ7zt6o8LgOPud/gYoF7BkD570q+kJJgGV3Fphcfpx/P0464hVdrCeL/hvZwy+fDaSIBZbQUYOCG6bG1pO3M/c0IjLD5MV7jUxr5TcGipQVSeCsDT2e8PfEJh54+AUs93Yd4kUPCYeSSo3xbSgZx84XJn9qp/LIiPwHIUJuM0fmsS4UUKn74Rvlf82zwCF4SaqWg3+vhDmPBCKcnIdBJpcez4aOI/9QqsRSWImjUSq1xqJPVeGM+mC9G2mMNIjf1iMU9CQzgqfvdmLcs9bo2oHS/rc8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=il5+ogFAcdQMC7nu3Iu4mtSU5dxI8anSX8Bhz37xE0c=;
 b=mJYgoPgSeUwttDsXta0X4Wx3herDlgd3RJ4B/ACuZsyHV0wKBZyYt4T48M+AozH1nNmBzhML44vLxiJy6LvTsMIGRlzo7jg3E02OP+xUcdCeUBN++9YGVpIBFCXdjT+a8vD83sowYR24WmTZj8PmcHZw7cnDbmEhphfUS/fts0dmCJ8kZQCIqEzYEjNx6JHDyqBWaYuYVaeSZhLV6bsJl0UWycVhD/vAO4QZyrG7pCJmm1K+RFewqdjnJh1Or8VEl2NvCBp/OMa+oHDv59wQTp9B3dFsOEuH6zdzOiLnMr51XoZ0qvMx+a81hnlvq0vboKqv3m/XO0hzqXJ6yfLg7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=il5+ogFAcdQMC7nu3Iu4mtSU5dxI8anSX8Bhz37xE0c=;
 b=tg7ikw1d4330Fal4z0KmxLCiaMDGzfIYAJZO47ybpmJiz9+D4hHvEizWhBZMKj3XXmv8/0yyUaN9zpyjNb2WHBiUQFNJSDNNO4Kwc7nOcquf4uz91fmuPAD5UFCmFCkDh4NSLJeR1mlwuoYyNV+50WiGQVy/qqxaWpfbbTaAi6T7XtUIEzNv9TWNjOZh15huWtDAT04Pts5UCvKFWYcvZadxpjZYh6u5mULJR09SHrgmyRw59Ic7SeD3XthDIIsm1sdjKHMT1h5d1DDCHW/VP+KB6id3+lOBGRmk0gRySet6Y26UpKm3KFC0HZlWSerPbojvxFNn5m0cGiHb8oxIPw==
From: Untitled YAN <yanluyi2010@hotmail.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Jan Beulich <jbeulich@suse.com>, Alexandru Isaila
	<aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: About support for memory event on AMD CPUs
Thread-Topic: About support for memory event on AMD CPUs
Thread-Index:
 AQHX4Ivyto+Oc0SSQ0aRZryw/8JAG6wST82AgAAO3bCAAAtgAIAAATxXgAA9XwCAAAS3GA==
Date: Wed, 24 Nov 2021 13:44:42 +0000
Message-ID:
 <OS3P286MB1995A96AD806302762C863EFB3619@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
References:
 <OS3P286MB1995471B56ADDC423A4EDC9FB3609@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
 <ad9abcb1-0a17-644b-5338-8c305e9ce4b4@suse.com>
 <OS3P286MB19953CFD3B3D4B2B71261DD9B3619@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
 <1b6ae1da-a9be-2e37-e993-05f1bb095f80@suse.com>
 <OS3P286MB1995A04EFEE65E1FBC735FDFB3619@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
 <CABfawhmsNf3fEw6nheSR40UpHKuX39AqxU0EG+FEaQUVY+gVog@mail.gmail.com>
In-Reply-To:
 <CABfawhmsNf3fEw6nheSR40UpHKuX39AqxU0EG+FEaQUVY+gVog@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: e24b8c69-a59a-21e3-b83d-bb67fda0c2d9
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [vBJ5H74RjN+SXbhgQsn5twIHp4HyUV8Wp0ZRr6dFP0U=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5d67b31-89fc-4193-dcf0-08d9af50919e
x-ms-traffictypediagnostic: OSZP286MB2315:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TUOOZdp6txGMJ/cVVK8UYCzWeG/f+4VXPZQKb7oa1T02vMBjvsjOvQ7UklUNu7bOEv+3IzTEK7tCR0aXT98Kz8WZl9u/q0Kw3njlijRUixAjHOPN0M+Kqb/+nVO2WY2QYq9Sna4EpEEtPkYTHDTC2zv0L6kpOAbQllAAvoB5bBZuP7jQ+wnWyzuiR6DDPP2XoYk2h9EBOH8n42w0BYWyVQQFAvper81j4ZL1eOdICFeAVb74fn0SQTbkn7k/xJS14IR1sqE4sLbbB91Xxn0SHuc/yo3d14YU1S7xhEJC/C7NjeKvWo3gyZWK/WtQg7NXCoizDZHX4RmiXliMVSYqeF2cx5GvH6zAT8hGexNlMH925DE6fxMOVMvwZjGE5AaBq3sqSdnvnI3ExAbALeXQVt2jFwEIkZ1tPrN1kmAsnixR5UocM0qKFKOwt5xb0pSi+Flyh+zRCXJqJ54rMji0lRLnHJPCPVwQy4BRBq288qfrCVp4bOqESYBxa+BT8uckHKmu2ARkGVX4PxQQqPhPQnPZaTqvvyoXSY+hkFPgLCdYgvXJ+T/syT95A8Y3ibJA6vL2pKJqsMmZmWFO2HmDGc16raxyX44pFX4Ub9wVSDxRDJr3UxWX4EFATxwoWJ0h
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 sOYTksWoC43R3h/DoGrDikA58DvhYA+QirNQpCO/aMs9TiT8TGP4a7a3psYKYJ4xwsZG6YpTZd1m9CuwJayoJ6saoCKYHrlmgFAap8Cwa1s3O75z+VLCqUiWIkrQnbncdAPX9qpHnrX0egu9HYTaWWHq+WCfEAtRIM79+++3qktph61IOQyq1FuQDa4a5oKPKd4pQNC27cHfPtYDPxBdq6iJFrdz0KCE1A8N2p4ZzV1hsxRg74w8W/OnMnrC7O+4WN/Y6mTeJ1zVhzPNXTOlLgL3YLMyE3/Vonx6TWxY6c4ZjQ/r/Jw1D6aNgXCLZpNVx1XUbxE6TcwGz9SvWPzBQ1H90w5yL85ZhLz0lHgoA5JYtn5AgJQPZmG5dc5Il9xkBIL16BKuaceQeiFPvy8ISxkfJ5SvW6FtZzJHxKkxX9w0SLlE8Gbka4FC5SnUeKkii3fOXfPwWMgzhNbUBcOSUi2UN/A5kIyEy/GlD3rwyRyHc01zMpcgCUX47kprvB7qF+2MWcmOWI4IKeN75XhO/E9fbnPtX+FHS3KnrEROl3ZSW2QDnwVrQALBbXGUM5iW8KHD0C8slT5niyydMUu1iHeGooj3oSA5jePLWVJDSKQWT7AAzMJLnhJ7dMcVlHKO6j1cmy3bgaxVMRp2VHJrbUTHk/gO31RoseCicpeoliJtvaszRQFZtBey9rWAjvwNkSHZrkMQ1yzRMg3YIdNHfw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-18f16.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d67b31-89fc-4193-dcf0-08d9af50919e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 13:44:42.4211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB2315

Original email:=0A=
=0A=
From: Tamas K Lengyel <tamas@tklengyel.com>=0A=
Sent: Wednesday, November 24, 2021 21:12=0A=
To: Untitled YAN <yanluyi2010@hotmail.com>=0A=
Cc: Jan Beulich <jbeulich@suse.com>; Alexandru Isaila <aisaila@bitdefender.=
com>; Petre Pircalabu <ppircalabu@bitdefender.com>; Xen-devel <xen-devel@li=
sts.xenproject.org>=0A=
Subject: Re: About support for memory event on AMD CPUs =0A=
=A0=0A=
> Altp2m is only available on Intel, mem_access (restricting permissions) i=
s only available on Intel and ARM. No technical reason for it not working o=
n AMD, it just hasn't been implemented in Xen.=0A=
> =0A=
> Tamas=0A=
> =0A=
> On Wed, Nov 24, 2021, 4:44 AM Untitled YAN <yanluyi2010@hotmail.com> wrot=
e:=0A=
> Original email:=0A=
> =0A=
> From: Jan Beulich <jbeulich@suse.com>=0A=
> Sent: Wednesday, November 24, 2021 17:27=0A=
> To: Untitled YAN <yanluyi2010@hotmail.com>=0A=
> Cc: tamas@tklengyel.com <tamas@tklengyel.com>; aisaila@bitdefender.com <a=
isaila@bitdefender.com>; ppircalabu@bitdefender.com <ppircalabu@bitdefender=
.com>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.> org>=0A=
> Subject: Re: About support for memory event on AMD CPUs =0A=
> =A0=0A=
> > On 24.11.2021 10:23, Untitled YAN wrote:=0A=
> > > Original email:=0A=
> > > =0A=
> > > From: Jan Beulich <jbeulich@suse.com>=0A=
> > > Sent: Wednesday, November 24, 2021 15:54=0A=
> > > To: YAN Untitled <yanluyi2010@hotmail.com>=0A=
> > > Cc: tamas@tklengyel.com <tamas@tklengyel.com>; aisaila@bitdefender.co=
m <aisaila@bitdefender.com>; ppircalabu@bitdefender.com <ppircalabu@bitdefe=
nder.com>; xen-devel@lists.xenproject.org <xen-devel@lists.x > enproject.>o=
rg>=0A=
> > > Subject: Re: About support for memory event on AMD CPUs =0A=
> > > =A0=0A=
> > >> On 23.11.2021 18:14, YAN Untitled wrote:=0A=
> > >>> Dear developers,=0A=
> > >>>=0A=
> > >>> Short version: is memory event supported on AMD CPUs or is it going=
 to be=0A=
> > >>> supported?=0A=
> > >>>=0A=
> > >>> Long version:=0A=
> > >>>=0A=
> > >>> Environment: LibVMI 0.15.0 + Xen 4.14.3 on an **AMD CPU** (5950x), =
64-bit=0A=
> > >>> Debian 11 Dom0.=0A=
> > >>>=0A=
> > >>> What I am trying to accomplish: register a **memory event** handler=
, so that=0A=
> > >>> I can capture all memory accesses within a specific range issued by=
 any thread,=0A=
> > >>> or all memory accesses within any range issued by a specific thread=
.=0A=
> > >>>=0A=
> > >>> What I got instead: an error from LibVMI saying=0A=
> > >>> "xc_hvm_set_mem_access failed with code: -1".=0A=
> > >>>=0A=
> > >>> Some investigation: by inspecting the source code of LibVMI, I find=
 the direct=0A=
> > >>> cause is one of the libxc functions, 1) xc_set_mem_access or=0A=
> > >>> 2) xc_altp2m_set_mem_access, returned error code -1.=0A=
> > >>>=0A=
> > >>> After some searching, I found someone else having a similar problem=
 [1]. I also=0A=
> > >>> noted LibVMI says:=0A=
> > >>>=0A=
> > >>>> Currently only the Xen Hypervisor provides these features,=0A=
> > >>>> and some of these are specifically only available on Intel CPUs=0A=
> > >>>=0A=
> > >>> However, I can't find the exact confirmation for the availability o=
f memory=0A=
> > >>> event on AMD CPUs from https://wiki.xenproject.org.=0A=
> > >>=0A=
> > >> Aiui underlying what you want is altp2m, which presently depends (in=
=0A=
> > >> the hypervisor) on EPT being available (and in use for the guest in=
=0A=
> > >> question).=0A=
> > >>=0A=
> > >> Jan=0A=
> > > =0A=
> > > Dear Jan,=0A=
> > > =0A=
> > > Thanks for your reply. I really appreciate the information. After som=
e=0A=
> > > searching with the keyword "EPT" I found [1]. So I checked on dom0 wi=
th=0A=
> > > "xl dmesg | grep HAP", which says:=0A=
> > > =0A=
> > >> (XEN) HVM: Hardware Assisted Paging (HAP) detected=0A=
> > >> (XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB=0A=
> > > =0A=
> > > And the guest is an HVM guest running Debian 10 with kernel v4.16 bui=
lt from=0A=
> > > source. Most of the configuration of the guest is generated by virt-m=
anager.=0A=
> > > The "xl list -l" shows that there is no explicit configuration for EP=
T, RVI or=0A=
> > > HAP, but it does say the "type" is "hvm".=0A=
> > =0A=
> > HAP is the term covering EPT on the Intel side and NPT for AMD.=0A=
> > =0A=
> > Jan=0A=
> =0A=
> Dear Jan,=0A=
> =0A=
> Yeah that's why I wanted to confirm if the HAP is enabled for the guest -=
 it=0A=
> turns out it is enabled but for some reason, xc_altp2m_set_mem_access fai=
led.=0A=
> I am trying to replicate my setup on an Intel machine to find out if it's=
 a=0A=
> configuration problem. Still don't know if it's implemented for AMD but t=
hanks=0A=
> for your help and information.=0A=
> =0A=
> =0A=
> Untitled YAN=0A=
=0A=
Dear Tamas,=0A=
=0A=
Thanks for your clear answer. So I will watch the update note, or maybe I w=
ill=0A=
try to get an Intel machine for my experiments. Thanks!=0A=
=0A=
=0A=
Untitled YAN=0A=

