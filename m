Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2B45072AC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 18:10:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308365.524083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngqQa-0005L2-Iw; Tue, 19 Apr 2022 16:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308365.524083; Tue, 19 Apr 2022 16:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngqQa-0005IP-Ff; Tue, 19 Apr 2022 16:10:08 +0000
Received: by outflank-mailman (input) for mailman id 308365;
 Tue, 19 Apr 2022 16:10:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngqQY-0005E1-5K
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 16:10:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cb725ce-bffb-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 18:10:05 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-Ea-c1LPSMgi1P9QhXHsqAA-2; Tue, 19 Apr 2022 18:10:03 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VE1PR04MB6381.eurprd04.prod.outlook.com (2603:10a6:803:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 16:10:01 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 16:10:00 +0000
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
X-Inumbo-ID: 2cb725ce-bffb-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650384604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCDYEKUCO+dMtuodMiTYj5Y+Ayt7E5b8580ldvcs6XM=;
	b=BdeNBtNvyNX2y1heGYkjtMygDQfd5qSyFA4FT+Rlac8Y3+TBrdJPumhledJW8nfYyD4Iy4
	cAT1gScgjKRIJdCcFgICI2+K0+YlrYRRgA/i7K57k2zZ0BaA0CfNKpHxdzAPDOBnLtBZF9
	49Jor6GMaKYQ1ifPfTBPq5uC0iUspX8=
X-MC-Unique: Ea-c1LPSMgi1P9QhXHsqAA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnOedifyUeTDNLUuZuIQXr+YlNB16xgfsV9UHaccBxUsbSSKLA6xNQS1IeY+jzDr/ZVlgVIRn2GV6bGZP0DVEYtv/i5Lv6Sqzc4Dnfmr40J6H5s6u+htePRpvHXWY4oF73NaOHJfuLVExAVg0JceaKeRDpvvW7BELImIpXztiW4DaBZREI80Mkw8owV8t/7slWsO6vxQZdMkxrYm1jELDZugC3ueOToUDnLPJ5trQfgoWj/a4XvufTfiTEJSnG/HTtHVRPllqBM07ysX40LpO03GezvvyiF/hCz4o0IFo5eho/ETdJogh7t+q2oQbJWeRURMwvp25+7dlFEWpPDcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvGw7Hb4+0vYtzFeEsJZSnAYfW4hflet8Jt85t+40xM=;
 b=nW29xzVYHpi6L+d4o7LZIhQQ60jRgsEwaO5ghssE3UKHT1N6CvZx411ZkBWQn7NAVr/5MgNYtYMn0vVseUVoUXBfni9MnmtZlfn+pb7m8kz28jPzATNmUIPVd0fLD/vZ+VvlEtbbzJvaq9037ER2eU+PqFZXJAiQN4Vl+dITuOKXyrLA6TKA4zVmFt3oeLmjmUtpZw/WNpgzqeB70MY8LzpaxQkZeOmv/QcN8zzwwpC4/EB/+d7bGSewE4cjqryETmUqYubLuJ1hgFKR7D4SbO+Uuh4+qWwD8ZWdRDPyZWh5RXHy4+VpMAH7yRKPC1/FcdkFaM2AU/6B6FJlbsJ9VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0d5d7fc-42ff-0e8e-7314-b90a15289b6e@suse.com>
Date: Tue, 19 Apr 2022 18:09:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
 <6732a3c3-fc19-cbdf-7483-9f5946f1935a@citrix.com>
 <48fe2a98-98de-8aa5-8d3b-e70427008edb@suse.com>
 <cbbd3bb9-c76e-7ba6-7cef-66d47e6d367b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cbbd3bb9-c76e-7ba6-7cef-66d47e6d367b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0101CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a76aa747-d157-4ed4-0f02-08da221f0e61
X-MS-TrafficTypeDiagnostic: VE1PR04MB6381:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6381B8564B80A6AB75AC29A9B3F29@VE1PR04MB6381.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MoFI1nyc3MkJis89M2Ny/Z4VoVnBJE4YxHvFAMKmFS9YIF2+TuR8rDly8HuyFR4xHJeaPnn8gjzcMfdc++6R87c5HJ19uj34c1xgRg9D/A+wILOfNPYvNfYfp+vLdn4vaIF6DvTr6FfCybTiW4XMmPgFPtcyatsCmTWSn51rROZuHWlUYK6Y+UsKoMO+Vxs0PMt434PUptAoFekr9Z4TIzJjuu+bZApS9WW/4R2E8+Uwwxc9anbP3RA3DHYJslXaC/tJvEBOH/oXf4ULWVQ0NL6u9ZwvmyeP5nUdr1utIzDYGuyj49C94vF2YrrkiKjw7r3L77LKUEoxu4pU/T03kltIIcMutqeG3ZaEuX8l7LRcDDy7TvWrqksFR02iad0XVpfSMWkh3tRNzFXTjL2wUXBM4wAmfDLP2k4Rb/A4/z2M6e7HW4QVbsyjAFhCdkYGcet9caAcjQZDb7yErdUx1BPBag6uAXc2O8OpEdXESFEjJ77C0bealO5pUPaeLTMm0wQSVB2K0AysbNEBgRGFHj2K7MCWyLIqLxM7WREYRo/7WUBcueq+CtywNj7NuPyUBSJLzwv/FU46q0kajF1ArNmPRpYeOAGLC7AFLNbaKj2uhl56m1FnMZ11sa8F/Br65RLyukCIGuc53nGKyeHQdzifnlDk83sQtfADCiL/REYV/uIdRPIa1aHYCZ/fKPlj/EkrhH7sWv8pwrkZYCO+lgq2xp/pYM5xiGN72Veq8P4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(508600001)(4326008)(66476007)(66556008)(8676002)(54906003)(2616005)(5660300002)(2906002)(53546011)(8936002)(6512007)(6506007)(31686004)(36756003)(31696002)(66946007)(38100700002)(86362001)(6486002)(316002)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TqpHx34CoV3K4508EVNtLi/4rYfPUfIfjp96jkRGr8xCMPZlTf3vxRRaR4wP?=
 =?us-ascii?Q?O2KcbVe8ynj3mujw5T89+9P1b9NnSu0lpPIal9og4RUzdgac/+XjpOhytNON?=
 =?us-ascii?Q?aIIHVstBARFOgE/0aVo/UgiVomkV61xTKv8tRSiJvo2UE9MwAcZPHkaI49Mt?=
 =?us-ascii?Q?FVjkgN/3C2ncp7efVHAoAwTvLCaSYDdDnj/GMNNgsEcaYucprZP+zWIy+lUs?=
 =?us-ascii?Q?U1MYyBYEo1PdJt9C4F5IYbSIdQjn3cmwpqLAeAs4QL9koNUqY9vGs0GdT1RC?=
 =?us-ascii?Q?HH2pAcasTTt9RFXvR5o8mLeqzepnyD4fZIsAY5chRjpZw2AA7uaRbdR4lZtE?=
 =?us-ascii?Q?X8QfTAO11R0p7qYZ9NOA0qKftw4w9kZwXTN/Br9Wy8vKk56XWH8Is1XTwPr6?=
 =?us-ascii?Q?gstrnm2Drj+BP+QNmJ3vfneLkOin+3V4Ty51f0yqs8MEMcDPnOrIXWy/muo2?=
 =?us-ascii?Q?/PqG/v3acetz1NtH+Lehs2VoroNig97SYIIZPmZr8XyJcTMs3QNYrhWyUpqC?=
 =?us-ascii?Q?C5YgpiDUpviEv0fQq4u6urRdrQ2wwCHUTVibRM0dNeyVf3TbCnqKFANJ43eR?=
 =?us-ascii?Q?ta7KGGmLTD3GxL4GkrqMOwWm966IWTme3ii/96htH2ZxvHkTW9O8Y8hOgyZK?=
 =?us-ascii?Q?PFHXFDXV9ql9t7XP5IcqQavXRhqk23nD4T+cR0mad0NhPdxPeSGvV1iRfqO9?=
 =?us-ascii?Q?HaekGNdfitrxgsy8OiBbnm37cFefSylcdEb/CtSZK62N+fzWcKjor7rz5ywd?=
 =?us-ascii?Q?ef6lr0eHqWXhHyWBRlzbqJjHmBm0XvpsriNhUxX8vQ5nbUvE129ppJB7CCdd?=
 =?us-ascii?Q?BwL/Bz1uuYONHQo0loGE7LZjMlUvpcVjHLGnQgyi4fneJQWoIJSfQY+CaUxr?=
 =?us-ascii?Q?agMwA7qY1B83hzNYFw6dwuPYM/p5C5gh2awdLJTgyoB2TpnCMC5gjPU+fsij?=
 =?us-ascii?Q?HQmYuEkHEBVJuiVKj/Ky88pfwm5+P++U+cnwPn/+zZBo2lX964EEphCVO78L?=
 =?us-ascii?Q?/UaHEmVCep1lTcpkGBk8QGKpTknQTo9tzA8OjapGaf70rIEJwZYGeBGXpF50?=
 =?us-ascii?Q?A9VuYux+skihCaxzu1S4dv/4O4Jgo9/nboIDaK6UMiWY0AM5yBe0KxIRlCFl?=
 =?us-ascii?Q?gov2U5GR7ZdngQmWgHtlkBulgarmOKdBG5OXit+5j0awdq/GZfwh1IRHNe/S?=
 =?us-ascii?Q?mwY7bIhenQ/TrhQO3fQToavzckB/Abn6KiXx3GHZjg25XIb5nWXXdnqRvJUg?=
 =?us-ascii?Q?jHGxqbKu/q7LFZwmK1yj/oizPrONXWtjbL+PVM7bB6A1nqPJi5AhNMFU7dlL?=
 =?us-ascii?Q?UOFb5iSmlMHGSL8RvikYnH71naCEc0xqlBx4NEJwnqAejwfu4Ou8X2kbNa59?=
 =?us-ascii?Q?MqiKW54dalKB8wWL5JTmZ8scCK0dnBQZ4Bx8pjOWkhIduwXZg6XftB2Kt425?=
 =?us-ascii?Q?2+i/sTx/Qa3OFZM3/PmJw1oDcTsy1/odb3RMTF3ahii+Pw8H7JWCJO1KTu3u?=
 =?us-ascii?Q?/vwvC6qnYfvUrgwODIvwGYk7/F+jL8oY/Z6HjzXAPejovQSuavCcUOK5pnPM?=
 =?us-ascii?Q?PnxHW4LQlKXb2jXcX83siCKcoSciXOY5lR2ygsZO+xmWVx/mEh3SWMDb+HD8?=
 =?us-ascii?Q?rYCXxJ2iFarDVUT8otAfXSK+th0AIiiqyY0sLYPufKcSQvcf5jxZktwr3whu?=
 =?us-ascii?Q?HH//+dqBf+UA8ILRU07nKVeYuSpnCBm3rII1y+79A2aIIU0AtLFbGEDU/g4h?=
 =?us-ascii?Q?4raWNpADcw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76aa747-d157-4ed4-0f02-08da221f0e61
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 16:10:00.8637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8XN0Uxtel6VSmV9T5PCzrxMpTqv71tIuXvcscK1UO8UZdqJRr7JPFEt/LsLDsq0kFu4ovcxxKlHf5YYyo//+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6381

On 19.04.2022 17:39, Andrew Cooper wrote:
> On 19/04/2022 11:59, Jan Beulich wrote:
>> On 19.04.2022 12:49, Andrew Cooper wrote:
>>> On 19/04/2022 10:39, Jan Beulich wrote:
>>> Furthermore, under what circumstances is test_assign_device legitimate
>>> when passing DOMID_INVALID ?=C2=A0 This has been broken for 3 years now
>>> without report, so it's clearly an unused codepath under both xl's and
>>> xapi's idea of passthrough.
>> I guess xend had a way to drive the domctl this way.
>=20
> Looking at the xend code, it always called with domid 0.
>=20
> I can't see any evidence that there has actually been a caller passing
> DOMID_INVALID, but this is an utter mess.
>=20
>>  Iirc this was
>> to find out whether a device is assignable at all, without needing
>> to know of any particular valid domain.
>=20
> In a correctly architected IOMMU subsystem (which Xen most definitely
> does not have at this juncture), that question is "Does the device have
> an upstream IOMMU".
>=20
> Xen doesn't currently have a working idea of an x86 system with IOMMUs
> but not covering all devices.=C2=A0 While such a system is unlikely to ex=
ist
> in reality, there are cases where quirks create asymmetric coverage.=C2=
=A0
> Either way, this is fully subsumed by the future work to assign IOMMU
> groups.
>=20
> Also at the moment, because Xen doesn't support per-device IOMMU
> contexts, another check not performed is whether this devices identity
> maps are compatible with the identity maps in the target domain.=C2=A0 Ex=
tra
> complexity here is that it will not occur on a single system
> (Conflicting RMRRs/IVHDs on a single system is definitely a firmware
> bug, not an accurate description of the system); only with migration
> between systems where equivalent logical devices have differing identity
> requirements on different systems.
>=20
>=20
> I don't see anything useful the "with a domid" version gets you.

Hence I guess someone thought allowing DOMID_INVALID there would be a
good idea, irrespective of whether xend actually did things this way.

Jan


