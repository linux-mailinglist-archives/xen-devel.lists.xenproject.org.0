Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4B3642A91
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453784.711373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Cj0-0000IG-U3; Mon, 05 Dec 2022 14:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453784.711373; Mon, 05 Dec 2022 14:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Cj0-0000G9-Qx; Mon, 05 Dec 2022 14:45:42 +0000
Received: by outflank-mailman (input) for mailman id 453784;
 Mon, 05 Dec 2022 14:45:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUwf=4D=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p2Ciz-0000G3-5J
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:45:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b94e6ff-74ab-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 15:45:38 +0100 (CET)
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB9PR08MB9756.eurprd08.prod.outlook.com (2603:10a6:10:45f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 14:45:35 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 14:45:35 +0000
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
X-Inumbo-ID: 7b94e6ff-74ab-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQUaHX5lPzrLkNvGJAL1Ba+h/YkWy212aGU/duMxCuWZVw3mscYV2saH6pXYQDRbLWhwqBv/1WajRRfiajhmkwPQsdjBtSu+aJYS1CIOmxauux9aK6c5ap/x84SDdcy8r+3699SBdIky5VhSvqeD6RCAl6xH8hADtg3zl981oM07+WB4i0tqynxpaXd/EZdwzBF2CYksx5JeDB1aLzfTGy2pRXCCTgtmZGWsAs9Zv/P7Oa52gWlwj+5qW5QgIw++wHpftrBDByWwdey/NBDVOqmkHSbe2cUaY4zan/F4t+JKqHznnQErT/U7FWjRsd9hzcBsFKiaG0KbBZSh8OMzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rh80Bkr6hy3oFrqLRwscaJHjeAfsYCw9hJNKpfbImyA=;
 b=S7wdJPS72KW+JDHuqc3K8dTSpAX8Nw29ZiT5lG9Ytdsjlklb0rhmyQdqntZHhW2I4SgTWapQeaNVW5lbJDCP5QtrkM74Vzt25/AzZ8zdVXhWLNAvYwZMIMJ+psE6tJt2cRsDTEpwGXdF9BvwqGE68rTRQXvXzC8WNZSb3vaTw+/T7fvLKUJ2hxPHJbFsL4PMZrJlo5Us98pp4RQ2a+l2OD4autifxG/b0IONxyHyXMarx872izbtrn4z1mHvdRHsqP+pnf+7CC+NxQSw7jRQSD+kslZphzQ9wfWdgor3+HolDRwxf9/AZz3l1OF4ffwPN/1Ef9lNonvpZfRl1GYXcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rh80Bkr6hy3oFrqLRwscaJHjeAfsYCw9hJNKpfbImyA=;
 b=viiafI6WUEUG4vG7GEcb064vVOLBEQGGBRAHjsp+WO1xsjQkdv89ayaZOSLLG6aagFAl4gr+hiatNy7Gi8hNhfnolOn/CYASxkIGAePVsxpgwqukPDPnRYeNQQB20LDw7e19iuS7Q29zcCjQng8ziCYzcyuIz/BpG6RC4SQ8l7c=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 06/21] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
Thread-Topic: [RFC PATCH 06/21] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
Thread-Index: AQHZBZ8CXEc5ZItnGkaj2GP9yveEkK5aSbwAgAUbbwA=
Date: Mon, 5 Dec 2022 14:45:35 +0000
Message-ID: <29CFB625-A8A8-4CB8-9808-82DA5B6B8611@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <fc259a3c780aeb312ea1043703add9e9bca1a7e1.1669888522.git.rahul.singh@arm.com>
 <a995f3e8-eb40-36d9-9d3e-95bfc3e7f75e@suse.com>
In-Reply-To: <a995f3e8-eb40-36d9-9d3e-95bfc3e7f75e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7158:EE_|DB9PR08MB9756:EE_
x-ms-office365-filtering-correlation-id: f4b3a7ee-2773-4610-e5a3-08dad6cf5e2d
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YZ6rFOKw0OStTV3bKIlLtHT5SRx0r4giiAqwKI6aI+e+ygdydm09FHfVKbfkEAhpbbhVzNvtb8jV+GPWUxuk3H/81AX9wSVITifAXz0+QfpJDoWB9gGY2tVnQrzW9P3MUhjo+Wmm2Boc3ama791nkYTqmGDs9tQCm+BXJoUeiXOf+c6LLWsZYvPv9EVyuEHSndv1YHT2QMazVOEDufxaPFcT7316BRwKqbz7YnvA66Ebld3T9iyRaVL6GprGNLIfUJDfpNUkzcbMBL8bEScd7XCobZcAZrLWqjsle07SPbkSudNss9HoEvTqWuUW0cgWNpooOiUB4v15alu2p9QDLw7fUKYpqDFgfLR5E5Vesv4C4a7acjUtgHFr2nFx8c6SxDVkTOkB7kaqlq8qdrA0MtfoSWZHxxzwbCHGq54ZNN3Qx4o2Em1dGjha6bEs1xlyNXb/zTtJ4jSN8yfURJB3go+PSjFo/NVTJQTV364OuRoau6riso+uTxyUHcVxkdrYtnf982QcyWpkw4owUBC3UFqSpXbg7C66USVq7aCsVpiLYWV3JMhJvhSshgQ3OAU49EOg2QVEKXiZQxnkyFVlH1/XKaWKP8FpQrM53Ucl8fIigYSHfOrxZ/g4WLxn9/y57FV5fieXOiXM1JPCpfHMKXXbrZndDEj3ay5oH1qm5qo9MDp4c0zTe1v8Sp6/KWpfZQ6V75loGyMQzxNHJE6AMoa6HNJBoQXi7xMoNtHBgVY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(451199015)(36756003)(71200400001)(83380400001)(316002)(6506007)(186003)(6486002)(6916009)(54906003)(6512007)(26005)(53546011)(2906002)(33656002)(86362001)(66556008)(66476007)(64756008)(76116006)(66446008)(66946007)(4326008)(122000001)(38100700002)(8676002)(478600001)(2616005)(38070700005)(41300700001)(8936002)(91956017)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IyWu9d0y7pYOAyA/iA0IHOnSW6/A7qXTRpxtSgQ4Nt0+R3V05foMCz05iySm?=
 =?us-ascii?Q?Ev684pMgS5caYT+/xRnwesbTnU5pm6xb7DaZAvVzE4kPKEUidQrsk6N48h9u?=
 =?us-ascii?Q?e7IGliKRoVKumCSJyVEpjFEvXN6Zqo/uHwh6YFTqRzfcy+Ix9D91Pw940LkI?=
 =?us-ascii?Q?7C17TBiw4Yf55AsnM0LyEaQ1d8iSLJ0IobGkt18oDdsXBvpP5IWT7+4k/sAl?=
 =?us-ascii?Q?nBIYQ9w5SPG+YK01lPYFqM1NfWRE3t1qPck1xa6EKh622c4/gbU0HMmdF+i3?=
 =?us-ascii?Q?6Go95mUhRT9rktJhIWmvRqxGYwzBrQ52jl3yXoLJ2YH1BDk4jSH2dJrS/Amn?=
 =?us-ascii?Q?gautlFnZ0D20mB7M+YfQUvUxJ/+fOH0un6Upw7GSBl+i07ybMqiiNjRPKTqn?=
 =?us-ascii?Q?WLcdx0fPKqBItQ/jDqFRxm17y+Daukuqd5P3Rn4447P1XQ6bdA0ejH0aOW27?=
 =?us-ascii?Q?oa8SSeuWP6OLOTmatVDW0yqnDxLW5ViextBsjJNr1GH6dLNJzOK2M5QyOpsh?=
 =?us-ascii?Q?KfyM/HTREbgattrcUR5DYxwMWbJSDoACFf+XvhGVu6HYQ6rX4NBvb/Qb//Xm?=
 =?us-ascii?Q?glWbW5u1+UT0VLuphXyPvDwv6L5iiMCmKPEfbHata7Fjpr8Y4AqYkTKGZ+kY?=
 =?us-ascii?Q?GSk0dAGgR4KHo0VLWXrve5DKY10ZlolOpBdRVDFQIIQyB7P1oU7xACKlFCl/?=
 =?us-ascii?Q?o2adNazc5+f+lAPpd3hZu674RsnSaaeHHyJVjGOCSCIoyli1AI48/2rc0skN?=
 =?us-ascii?Q?TscMhfpeLhb86la3i6DYU4+wXIkXAwueb8Mrq+KYbAumfScoduJaYBGjV1TW?=
 =?us-ascii?Q?2ODwz2RaEKY65qpT3ITUbgqS3QOrSfQHeF9BbEit13dew3lO5jV/p/cUdnps?=
 =?us-ascii?Q?1q07QBjeVWGOSb7EDpeYGFCdfBoBiUIo5yxHnqmhrEN5BHGStsC7uUnkMarA?=
 =?us-ascii?Q?P1S4rsdo1ggQrKErlU1Ph9bkAIMkNsbngUeY+dcnvZ1L3kRInIKVUSvb20nY?=
 =?us-ascii?Q?7Bbbc28gl99G+CXqnN0Z1ftSPoLxIHYuT+RtBMGSE+0mZ+mRv+pzfLnSA8jz?=
 =?us-ascii?Q?abEH0CtMu9xKAQY0q/SuB32mvbBcUZKSC0LHhcbNIrKOJ3/plXg1rY/KYELW?=
 =?us-ascii?Q?pGr8qnPSilji+tQtb6W//+zSgb3oR6Esfh3oxHLjv3QVmZnJXlaUY6WSpMEX?=
 =?us-ascii?Q?uHi6UYpqHSAEHphVG9TtYBKrq8gx9Ol3VbeFEciQeGY3HJqclwDasISfbLG0?=
 =?us-ascii?Q?IH5HzB0CZza33hKDlGJn4l5RZBHi5MTQpicDOoqkfu2FPelvQcZoJl87R8Sl?=
 =?us-ascii?Q?21Zww0bKVXaurYA9qNMafj9moQBuFCDWj492A2yowS4yX4jP2e+NbPJ7dMW4?=
 =?us-ascii?Q?iox6biKBgYZV1EPH5klJr5808lKjEBkbvuQNoRFNZ5490z/xMa7jGoL5gyPa?=
 =?us-ascii?Q?/+LLLihcjZ7i2gaTZmaxZ6M+XzqBS0L44n04h+SlNzk4edhHGfJuN+WPu78r?=
 =?us-ascii?Q?l+XFtn+B5Rz3dAKVoBxFi+Q2UqVlo18sm+uqr0cG25q9pJRd0rAieu5pNuVb?=
 =?us-ascii?Q?WJjGGkiBeew43s2CZKJKjE5vpGANDCjO4kH1XtOo?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E632C57C4F13941BCDD377125521064@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7158.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b3a7ee-2773-4610-e5a3-08dad6cf5e2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 14:45:35.2518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7E1HeaSv2P5BYDO5keSaWmiqpZ4e65BRaFZuh1P/jRKEqviTy6t536jNkywXEHmtF2U51a9cmbJX8NmUIbU12g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9756

Hi Jan,

> On 2 Dec 2022, at 8:45 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 01.12.2022 17:02, Rahul Singh wrote:
>> Add new viommu_type field and field values XEN_DOMCTL_CONFIG_VIOMMU_NONE
>> XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 in xen_arch_domainconfig to
>> enable/disable vIOMMU support for domains.
>>=20
>> Also add viommu=3D"N" parameter to xl domain configuration to enable the
>> vIOMMU for the domains. Currently, only the "smmuv3" type is supported
>> for ARM.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> docs/man/xl.cfg.5.pod.in             | 11 +++++++++++
>> tools/golang/xenlight/helpers.gen.go |  2 ++
>> tools/golang/xenlight/types.gen.go   |  1 +
>> tools/include/libxl.h                |  5 +++++
>> tools/libs/light/libxl_arm.c         | 13 +++++++++++++
>> tools/libs/light/libxl_types.idl     |  6 ++++++
>> tools/xl/xl_parse.c                  |  9 +++++++++
>> 7 files changed, 47 insertions(+)
>=20
> This diffstat taken together with the title makes me assume that e.g. ...
>=20
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -179,6 +179,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc=
,
>>         return ERROR_FAIL;
>>     }
>>=20
>> +    switch (d_config->b_info.arch_arm.viommu_type) {
>> +    case LIBXL_VIOMMU_TYPE_NONE:
>> +        config->arch.viommu_type =3D XEN_DOMCTL_CONFIG_VIOMMU_NONE;
>=20
> ... this constant doesn't exist yet, and hence this would fail to build
> at this point in the series. I notice, however, that the constants are
> introduced in earlier patches. Perhaps the title here wants re-wording?

Yes, I will fix the commit msg.

Regards,
Rahul


