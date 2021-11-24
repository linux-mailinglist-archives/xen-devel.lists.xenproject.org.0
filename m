Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0520B45B7BD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 10:46:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230252.398054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpoqd-0008Vo-MB; Wed, 24 Nov 2021 09:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230252.398054; Wed, 24 Nov 2021 09:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpoqd-0008U1-Iz; Wed, 24 Nov 2021 09:45:51 +0000
Received: by outflank-mailman (input) for mailman id 230252;
 Wed, 24 Nov 2021 09:45:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XpRf=QL=hotmail.com=yanluyi2010@srs-se1.protection.inumbo.net>)
 id 1mpoqa-0008TT-5J
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 09:45:50 +0000
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01olkn2081e.outbound.protection.outlook.com
 [2a01:111:f403:700c::81e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29e78ec8-4d0b-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 10:44:50 +0100 (CET)
Received: from OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1a2::6)
 by OS3P286MB1936.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:175::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Wed, 24 Nov
 2021 09:44:45 +0000
Received: from OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9c31:6396:f5d2:35e6]) by OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9c31:6396:f5d2:35e6%9]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 09:44:45 +0000
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
X-Inumbo-ID: 29e78ec8-4d0b-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDTTQGsTQ/bdVKj3lGg61nvP6+9oV6V+5EVMYc3jKXi3G4z2ijAwk3/BA9wMMyDzfjTFjx1RctKLNNbj5aIwDNCy/Mgqhdp9JCTWso/fMuDg9uBrrWQ0embmoAMz0K1GHHoixYh8D/ALSFGmEn+nLpZJQwTrOpnrG69Yl77tS8AaxGWXXxYYHXtUj+Kvj3tFtZKbn/1RnXrVpbRbARp4x/nbWm5mQMXF3LjInuiJb53QcO+RN4yyQbDRtjcFVwbs+JrP0qCW5TaznH7Rt94AD8ihMYb5Cjpi9VSc2kOqbzTSMdBiajOERGrhmIzH8bjyCnafZUPoU+BFWxyOiPz1Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6ZzSX0jwpua5Q5qnlesaYgkWmfuOxdrhjkJ6biGcp4=;
 b=B8SeYrykvuOWJ+uWaVDPAb/xqmI/CC04IXJv6J452ll2QLQYHiv0eBtsdXlC6XNg3UyT1hS6HoEWr/+ZJWH9T31gf/fipHJ9r1xRA7O/ByQTSc1ozyt0mkedn7ateUWuTmvqhZdqiWKK+269VizS9gBUazQujsOWaqapRz0swea4ZDVqTx6rwlV4rHktGxn3uvK5tSg+GuPSfsY3xaKE+jWQGVEWVC0SZ2xnxJlVA32CDBnHRmNL7sGtQLn0XKS+aJNO03XneVoWAU65cfZ9l2OFVslro4wHwNV1rb7SlC0A0t3412tu3nhv9Im/nXywVQ8/hJERq/IsDKpCw8+pFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6ZzSX0jwpua5Q5qnlesaYgkWmfuOxdrhjkJ6biGcp4=;
 b=if8zUVGV+qz08Z1sKIwIOKuOsMyEWRDc1867y8JbdxYq2pBwHzTnhpWnJ+JWxDtpxlQ63gJMlabTF2U4BePXGUNlfqYi92sMYNZ6yEqrblCxuRWCDHphvFCkS75MT885Nly1o2ujJWRoormQODOa1pw/mC5QGfEMT8GrbyE1snjFDIM+pOFtnCiGbT/bDj+g4YLVol9xuG7eqXCFueWVzLjF9gsHa4yqzO2ZGH9vBdvk2t83zNxDIysmG/5pXEf0VSQdQ5g2D9YoL9Y4zA3l3IEqeEeEQyvwH4Lio0os2J9YM2naB8Rv/WUc4xTOqSdsLgzlxbeQiGa+Tee0Esk0iA==
From: Untitled YAN <yanluyi2010@hotmail.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "tamas@tklengyel.com" <tamas@tklengyel.com>, "aisaila@bitdefender.com"
	<aisaila@bitdefender.com>, "ppircalabu@bitdefender.com"
	<ppircalabu@bitdefender.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: About support for memory event on AMD CPUs
Thread-Topic: About support for memory event on AMD CPUs
Thread-Index: AQHX4Ivyto+Oc0SSQ0aRZryw/8JAG6wST82AgAAO3bCAAAtgAIAAATxX
Date: Wed, 24 Nov 2021 09:44:45 +0000
Message-ID:
 <OS3P286MB1995A04EFEE65E1FBC735FDFB3619@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
References:
 <OS3P286MB1995471B56ADDC423A4EDC9FB3609@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
 <ad9abcb1-0a17-644b-5338-8c305e9ce4b4@suse.com>
 <OS3P286MB19953CFD3B3D4B2B71261DD9B3619@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
 <1b6ae1da-a9be-2e37-e993-05f1bb095f80@suse.com>
In-Reply-To: <1b6ae1da-a9be-2e37-e993-05f1bb095f80@suse.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 5644686d-2161-023e-26ab-b8a078e3416d
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [3bo01EuBnDi7wHzwyhBSbtH7P8kquSyOV2/ps/K3NBk=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6a8bbef-dda3-47d7-b111-08d9af2f0c62
x-ms-traffictypediagnostic: OS3P286MB1936:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 849zt7Ly0mtBQFnGl17/57ehwtoc/DoOSUlgbbAU+a/5gRoAfto1+WnAcbFYZvbMRIuL2AOwJw2mw3BUiYTZUjB1aht6HY5fDfMrMMDy3p+j4I7hFKj+8yOF3Jl192sHl+FDPho1WFtTF7oXPHdwH4OrHmg00egj2/pGGICockmMyFvSwrfEd2s83SkWP3xd9ytX46gRgW3GYVs0tP7n8RU/36/v/AJBt2wKD+h/XnWBN8V9jMbNSWnXlfgGB9+7bcbv630dJnqTSpnGGDJ8LwGOEOKIh3V7OQAkIFhuc88coZJ15DUNYJY981ERfC7QB5BQoFql3jusQURhK6XiAFGL3MPJ5mN3LKfpu/tp+Gnbn078dYjDrsyXOBLNVmsXDPlI89NgAVAEUOqhk9kiC+mxdq4L3l60fnGjuQUfvP+JWSQn2UX1bkJBp2m02dQAze2Nfqq6okgAf1J+QirW134KqSwxOsWxINJb7SF2k5Zw8ChrWjAND8LXZLizIi92k4pDVY+993maixv/WCwpc/TqO6csRXoEVTmJ/NH1iTsdxtWX2fPPgX0nitKkiZ3jErzfwXvk6DuWGoX55YNQLwnCH5UJVDK5D8i4TBRwSsjr40qTKbdErQ6i08XYbHyZ
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 kbcXMVD0HJyHAHxWZ3rhP9F8zUS1LdAwNZ/psCxzhzPB2M9209/xD3U4kG8yJ/GTD8/88p+Qg64wWhBlIiqdqFlOFldPuzgdZDdAAz4iYaAM48xGXAOcdKz3PdHHBoCHWj+zdpD1cUt57vUlK83CwrdBjCSNzDuHk97qeO1WOaRQs+7vzqO2yMNeXA6Me6MJmWWQUFMwkHhgiKEOom3T4M3IVtzWXTzoKzpWORnftn1PwOnJwXzSrap5fkPHRZ7Xx9lDLn9rMwIZbch2g5tPlC9OfOKOafwQdZDON3XxNj6djLRtqtdHSbD7PiOyx4Zf/6l1Y9uDX7DB6HWgIkF6eRbwc/Uc2fo1/Wfu6tHfgnzBJXrUXGIgP9OThTzqKpoIwcpMkovkeMnYKKISJOUlH/KlVQjA5QyDFO+6veq8Se7F3IBWaH9IalmoYyLGir++3vwPsdWtmBhBWXiPu10wsH8ZnirpKKSo6XWmcJu0wvVmUoXTN/QzuLdVsc7kEZx/QWRyPnGdxg3+tv+3kdhM3GFylSFrCFrlqxVNnp2KUowvt8xVnDZ0ZpxsGkeRX1SXwv8naLiOmQFTuga55DK310vownWvhq1bdvsg8wHLI0CRuCM6jxx6Ou+OQOgaCuNtNUd+priQYUdIXx+T0iD1Hop+K4Lc1x5itVw4jnpPLFe+L2yrEKaPiGnmxk1p3jJqngcfGxTCovqnW/0CZygdmg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-18f16.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a8bbef-dda3-47d7-b111-08d9af2f0c62
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 09:44:45.5405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1936

Original email:=0A=
=0A=
From: Jan Beulich <jbeulich@suse.com>=0A=
Sent: Wednesday, November 24, 2021 17:27=0A=
To: Untitled YAN <yanluyi2010@hotmail.com>=0A=
Cc: tamas@tklengyel.com <tamas@tklengyel.com>; aisaila@bitdefender.com <ais=
aila@bitdefender.com>; ppircalabu@bitdefender.com <ppircalabu@bitdefender.c=
om>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
Subject: Re: About support for memory event on AMD CPUs =0A=
=A0=0A=
> On 24.11.2021 10:23, Untitled YAN wrote:=0A=
> > Original email:=0A=
> > =0A=
> > From: Jan Beulich <jbeulich@suse.com>=0A=
> > Sent: Wednesday, November 24, 2021 15:54=0A=
> > To: YAN Untitled <yanluyi2010@hotmail.com>=0A=
> > Cc: tamas@tklengyel.com <tamas@tklengyel.com>; aisaila@bitdefender.com =
<aisaila@bitdefender.com>; ppircalabu@bitdefender.com <ppircalabu@bitdefend=
er.com>; xen-devel@lists.xenproject.org <xen-devel@lists.x enproject.>org>=
=0A=
> > Subject: Re: About support for memory event on AMD CPUs =0A=
> > =A0=0A=
> >> On 23.11.2021 18:14, YAN Untitled wrote:=0A=
> >>> Dear developers,=0A=
> >>>=0A=
> >>> Short version: is memory event supported on AMD CPUs or is it going t=
o be=0A=
> >>> supported?=0A=
> >>>=0A=
> >>> Long version:=0A=
> >>>=0A=
> >>> Environment: LibVMI 0.15.0 + Xen 4.14.3 on an **AMD CPU** (5950x), 64=
-bit=0A=
> >>> Debian 11 Dom0.=0A=
> >>>=0A=
> >>> What I am trying to accomplish: register a **memory event** handler, =
so that=0A=
> >>> I can capture all memory accesses within a specific range issued by a=
ny thread,=0A=
> >>> or all memory accesses within any range issued by a specific thread.=
=0A=
> >>>=0A=
> >>> What I got instead: an error from LibVMI saying=0A=
> >>> "xc_hvm_set_mem_access failed with code: -1".=0A=
> >>>=0A=
> >>> Some investigation: by inspecting the source code of LibVMI, I find t=
he direct=0A=
> >>> cause is one of the libxc functions, 1) xc_set_mem_access or=0A=
> >>> 2) xc_altp2m_set_mem_access, returned error code -1.=0A=
> >>>=0A=
> >>> After some searching, I found someone else having a similar problem [=
1]. I also=0A=
> >>> noted LibVMI says:=0A=
> >>>=0A=
> >>>> Currently only the Xen Hypervisor provides these features,=0A=
> >>>> and some of these are specifically only available on Intel CPUs=0A=
> >>>=0A=
> >>> However, I can't find the exact confirmation for the availability of =
memory=0A=
> >>> event on AMD CPUs from https://wiki.xenproject.org.=0A=
> >>=0A=
> >> Aiui underlying what you want is altp2m, which presently depends (in=
=0A=
> >> the hypervisor) on EPT being available (and in use for the guest in=0A=
> >> question).=0A=
> >>=0A=
> >> Jan=0A=
> > =0A=
> > Dear Jan,=0A=
> > =0A=
> > Thanks for your reply. I really appreciate the information. After some=
=0A=
> > searching with the keyword "EPT" I found [1]. So I checked on dom0 with=
=0A=
> > "xl dmesg | grep HAP", which says:=0A=
> > =0A=
> >> (XEN) HVM: Hardware Assisted Paging (HAP) detected=0A=
> >> (XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB=0A=
> > =0A=
> > And the guest is an HVM guest running Debian 10 with kernel v4.16 built=
 from=0A=
> > source. Most of the configuration of the guest is generated by virt-man=
ager.=0A=
> > The "xl list -l" shows that there is no explicit configuration for EPT,=
 RVI or=0A=
> > HAP, but it does say the "type" is "hvm".=0A=
> =0A=
> HAP is the term covering EPT on the Intel side and NPT for AMD.=0A=
> =0A=
> Jan=0A=
=0A=
Dear Jan,=0A=
=0A=
Yeah that's why I wanted to confirm if the HAP is enabled for the guest - i=
t=0A=
turns out it is enabled but for some reason, xc_altp2m_set_mem_access faile=
d.=0A=
I am trying to replicate my setup on an Intel machine to find out if it's a=
=0A=
configuration problem. Still don't know if it's implemented for AMD but tha=
nks=0A=
for your help and information.=0A=
=0A=
=0A=
Untitled YAN=0A=

