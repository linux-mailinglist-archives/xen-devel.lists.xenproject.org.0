Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA15B0D86D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 13:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052279.1420897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNS-0002YD-RM; Tue, 22 Jul 2025 11:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052279.1420897; Tue, 22 Jul 2025 11:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNS-0002Tj-LY; Tue, 22 Jul 2025 11:41:46 +0000
Received: by outflank-mailman (input) for mailman id 1052279;
 Tue, 22 Jul 2025 11:41:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibko=2D=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ueBNR-0002RD-1t
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 11:41:45 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d727f5bd-66f0-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 13:41:43 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI2PR03MB10809.eurprd03.prod.outlook.com (2603:10a6:800:272::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 11:41:38 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Tue, 22 Jul 2025
 11:41:38 +0000
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
X-Inumbo-ID: d727f5bd-66f0-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCrwRoWhsq4ypWgmm/Tyz119t049kST6RmI58wdU/UX18kf89UzxOszM5q7dysn89H2BP3qzUuR4zdueMkS3zlasZ2m0yaT0tcgQcMtgsfP7j8Mc6m9mxQuIcHtaAfrYCEFLjYFhVg6/weBsWjJvwV8MB2QABMHO3WhiuusLHZe9AZQLGZg6nsK5uSV49Sb/Hedlt3M4l+97Y6cJiPDYbqn9ZNXs3nO3B618eZpratvHmBhKvHwRC7LEFHPZuK+AHk+X0mudr36nXIxgINHzSYVlNZW+jVVW2hbP6THrsOwOjhgEWu8KDe9yNLi95UZKMoujW3Yzn2EF7Etv9jaLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcgB+PVoPlQ+5vyNjJcLRHb3/sTxvUoyunM0ZQqmRrs=;
 b=g+6wDOWcDkc2ZmP/3bgdCitsD6AEKYohLHyZGX+/Z5EMgxIRSrqQX5OZBYIpy6hkablkv1IidVX7B1/LhPVxBDFBKizPPYK/HSV4C7VGwtetxBafhb3hfiZ7EOp84egQvn6z3bs2mSee6gFhCLBWFrih/rT82h+QYn0M/BmiKyFtTMH3RElNx6TdaCzY8fjfOVTwIjIjmVsIaz72ceORJvKW+yKlI/jq/e0CGb9I2WxzUz/HlAo+hdh7gbnJPqNnBeg5+V3oHHq25TAXsx0TWal7niOhBFrcL8m8yw5HDE7/Xb71Tl4SwLQZy0Zi3Es2sxOrnBTw0mn5QTFACNK/3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcgB+PVoPlQ+5vyNjJcLRHb3/sTxvUoyunM0ZQqmRrs=;
 b=bKXselAAW8jt7Swm6jaR/B9QLMzYfolnbS3TqqVxRY614E7NUP+NG++VlU+OaNOyW/RlMQj2D5oyaSGx50a3vuV8hJmvbRfq67v6VxYkjQziMN7fot+X3H1/Np9Am8WnqGApzb6ZUSAM1QleHNKJgNA83nmfJRvKJlIC0c1DfYn3GTdSwzKRdVPIAlC4PQoaeI4NWBScCK6H3LB44/qwL3fWcL2f8BQv4mPTzqsmfpgTHiHNAEsW+/YRstU2VzJ3yw3PhG14kBmA1Og8UuftpCcJrL+8YkNAHnWqyR1Noafxdwf+Rm8JA7sLcCuzQqQsBGtXSu1nO/oc8leY+SLF3Q==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [RFC PATCH v5 01/10] xen/arm: add generic SCI subsystem
Thread-Topic: [RFC PATCH v5 01/10] xen/arm: add generic SCI subsystem
Thread-Index: AQHb+v2VIVqDwzw580eWg2MNhp5UUg==
Date: Tue, 22 Jul 2025 11:41:38 +0000
Message-ID:
 <a690ea9c64ca224a8fb1b0771de220f594824151.1753184487.git.oleksii_moisieiev@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1753184487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI2PR03MB10809:EE_
x-ms-office365-filtering-correlation-id: 2731c1cc-719f-457b-a233-08ddc914b812
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4Qx//lRTlbU2NIGE2kyy1qFeiezMXk2vPm3VCIyPnfhsytx/OkLbGjpNhQ?=
 =?iso-8859-1?Q?z6TVy5s5Fikgw0jHH4xFosNTrXpQhWTK84R916q135sk0OJ7mqMU4SbeZp?=
 =?iso-8859-1?Q?dd92kdZvyLTxOhvzPYfM9ZVewRMh98V23pRl2OD6TaSUUxA3vp/oPOqral?=
 =?iso-8859-1?Q?gkHAzO170GM4Is17i7L3dG7XgLWcxg4+2s/fAu699bmfCf3/AlMiXi6l/I?=
 =?iso-8859-1?Q?aWYxA/U+Mh5HuPQj2DMs75UTeUi6WYH51/0KI/a7B5pBifz6aBrqXMSgwT?=
 =?iso-8859-1?Q?LUqjhd0uQefHJWlW53tuUiJZXEr4DXl5i7WDN/rqHL9lYcY2rK8n8q5tWF?=
 =?iso-8859-1?Q?anSvgj9ocv1/FJ4J3htFb6ltJ7OwCHkf5TaNdBXs+qf3AH+nlaGV7ZwgZo?=
 =?iso-8859-1?Q?HPFBWk15oT8UzvGHxiJD6rBCMNTLTqgUU9Xhdf+7MVWHQx7TL1Jx+yxC+d?=
 =?iso-8859-1?Q?EO6TlKBm/Dp7F8XLtRyXJe04GaAJJLO4SuwlTuczAERs1Q4RdDfiDySiAr?=
 =?iso-8859-1?Q?raz+Uv/HBKrWjtYONm+YclF6yMteBVnM3464uQpcwjq5Og45eVKKlQcUn9?=
 =?iso-8859-1?Q?a4fZFaDWVijZZ0wRRrRQtqTX/rvg/q1b0y782Ip834A9Ut19KRMKH9qdC8?=
 =?iso-8859-1?Q?MMjsTm86ahbuGZDHciJAMQWGE7OiLxMhnyND0bLHmoJlglLEzGTghTfkSl?=
 =?iso-8859-1?Q?2Q+I1IDF8/QihsnTBEU7VszLN3ogJ2DPO6ihFkxYBvgb22tPcDVlwuFM1F?=
 =?iso-8859-1?Q?+CzpZqIe2QFoLOqdCV6WCaskx7kNxAlExDLShiiNUzjBJlUHxG8duhPH/Z?=
 =?iso-8859-1?Q?0wo9pYFd3yLDHGg4Tx5k5y+Fr7gsPh2mmaB2agi9Rp//rBcdsQ3QrRmx58?=
 =?iso-8859-1?Q?F2Ly2pI+Kx9ryrLAyu9Y90A4aX5WXvd36R6xPT+/PeQvqK/Cslmb5NeVwU?=
 =?iso-8859-1?Q?FQFLhpfKQy6HdvcBORHS/B5GenxCBYSmWFvWJFoWvp23EqSC68PZrimazR?=
 =?iso-8859-1?Q?ce6h2NHbcv0UOo9O4R2S+o3gqyQDNZvEbcORxe2FhXCv6vJqcGXEykkijc?=
 =?iso-8859-1?Q?4yJte9Oigjyjk0i3fk5wvXYBvEVY/0/6B2v48o3Xi4zLAG27uFHFpirqBS?=
 =?iso-8859-1?Q?33dwZxopzwwBKiIxVNM/GToXITyfhHww1IXmDJG2Ssany5rC9UTtb5lgYS?=
 =?iso-8859-1?Q?OyP206PDxCxY9R3vfWp1XYBkP9o+ihY+7Bej2s5KT4cRDaRIbKbR+HY6u/?=
 =?iso-8859-1?Q?igwFnnX/UG+C1vVNcbdBS8matV8ZvvI5RXqVRfAi8++MOtRxo+e0OFS8qB?=
 =?iso-8859-1?Q?o6Sdy+XKsjbxwi6kPzsgOwAAWwtQryu+CTjOrWHTzGZtMjmJ/vWVczzvCj?=
 =?iso-8859-1?Q?wTODJDAJp9xCZQB73UIPUbCxrolcu7ZwS/AB9kcSnix58ZlV3OXelILwWT?=
 =?iso-8859-1?Q?0Z4FJR3xB3k+XJ0StNkvLHIZyJ5xSxtNKkacPwm169IM+ykzAB1INKHnyZ?=
 =?iso-8859-1?Q?Vl5FGjPbubd7dKORcp7wjRE+BTxUxK8YbyiHhAFCnVrA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?G9yDKj0q0IKiFrVJ8zfMWweZqSSpcelzhd1cA8khFpTubudi53D1AW7RWi?=
 =?iso-8859-1?Q?1H7wUKFc0e2gHB71jyv/IqCBlffExOmoNPfMVSGeUUxDP34VMtf9Xe81EK?=
 =?iso-8859-1?Q?8TJjgsOQSekzZDnWcya8UROqWKInuLlM2OLo/SQ+/tozU1JOuaWHnN/jsL?=
 =?iso-8859-1?Q?w08cUZA6PBO9W94tRin/lEKPMohKe4zqbxoHB62z2vvG0C5K343arsaR2F?=
 =?iso-8859-1?Q?1NNqc3PXcb6ZZfzjmtJO3Gdcss6HRFFclXyDJMhXn3GGQYN09slZGIqAEN?=
 =?iso-8859-1?Q?j4sXsEmsPPVpk1NK0jRXgSzsgvAEr7KwzH9g2T2auM4fNYwbjjFTo2Qk6G?=
 =?iso-8859-1?Q?Jd7J/QTJfUS0o/HnLViHszXpU3NrGUhoar5bnbJKsJQYygSeQKpJz70RRP?=
 =?iso-8859-1?Q?t6zBlXQv5oZMU4xAIHvqByUm7vlIgIRlOsSqJpaDA9Giqm5sgajmcawlSm?=
 =?iso-8859-1?Q?oVoM6xmSanNLaEv26z1f4RKjOod93skYRK2h5ZHgKu5FdSaeDSYYqmeP5+?=
 =?iso-8859-1?Q?NtK03+JG1MllkDjTKPodhmMkralAkys8VRDx9OOog5QBY4+fFSreelHWid?=
 =?iso-8859-1?Q?ECwftvjgYP14dDt9UgcZV0ENT6iCo3V16mTJPzxO2p3pabq7PPkFJoFuiq?=
 =?iso-8859-1?Q?uwEE+m+tFOjWN4WXJJbCOPoRk7LsnW11IKOZ3Xu+6lUsVyqLZxjxxj+6vz?=
 =?iso-8859-1?Q?dVZ4wFKp6wfjDrqP/8ZE+7COcWSE64c6EmsrJmb9LUKcESAd3bsUAibQjz?=
 =?iso-8859-1?Q?/TLYLf45AGhdoFHdzDfQrlrJ0Qh5lJsAM/3arfXbrOjoNCSX1R3hp01+Vy?=
 =?iso-8859-1?Q?FYcCDew+3I0fxQFnZ1p3xIagA4g0TfKhrUR2OUMnBVHueE8c44VlsPKNwY?=
 =?iso-8859-1?Q?WUDz0EYwCKI3l5Oq3b/gELnnMf2DK6hjTgeaKtbU0pacUKiZhC4fm0jfMp?=
 =?iso-8859-1?Q?IgdIUgvXClWq3HGlm4CC+XI92L3BsbqFnKXSiHjRo4COo4iJOQ/lbpYlz8?=
 =?iso-8859-1?Q?rRuz+yYxoRkg3YG9QzCwnigWoBg5Ahpfd5NF3xz9UlNoPlJRCYyYSIDcWi?=
 =?iso-8859-1?Q?m7sTsYrCRPgTlpB1FQZrK2Wgj3Btj7mn4rObPQrhZFHPYpYlwsw7fy7jAH?=
 =?iso-8859-1?Q?eYSYLNZncqCZXEFUHlA2CY0th+iR0bQfp6LLxD37nOaG78b3QN5CoLgBfc?=
 =?iso-8859-1?Q?Wq77oeQ9H3fBz1hxc+XQ8SaCG+TGnbi1ffSIRJteVRtkJoSrazL96Ph3f8?=
 =?iso-8859-1?Q?QLRE8wBaAiJd18Vvm/lXvShtCuWYeX8NUCmA0ha2AEvOylQOWIsTjs3Bwq?=
 =?iso-8859-1?Q?WWT1iMGZrrB7uhWumZVh60DB7zPHIhmPUhwunLMpizC7SDnbbS3zczN9Mu?=
 =?iso-8859-1?Q?y5mIiEoSWFkTnBi5I9Q1WNXmG78/ggNFLnnAC9/siNRSYXGdieXJuiUgbH?=
 =?iso-8859-1?Q?rLHQVztmTos5Owwksj+wsyBGjxByP5Bg4g+FYpeNHsFlhpwlMDbsQWE3PT?=
 =?iso-8859-1?Q?xaPIiDn2QI0JMk0h6sVaTHg1O6JOZl/DtCeYqxz/67DXXjLScjGKl3Ffrl?=
 =?iso-8859-1?Q?ePcpvMb5TDZzxV4jUMqXZDgGwsQ3oE/EIn1g6XqDtuASwpL4zhFM0YIFJE?=
 =?iso-8859-1?Q?oLOQxnoN/FCaZx58PdQpaq7OdcQkKJ8Ng4tY1Oct0ES8edc191Y4ovCw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2731c1cc-719f-457b-a233-08ddc914b812
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 11:41:38.0823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4QFmxoh1di+AWer4tUmHNzxb0C+eq0B1byuvXfguFLciC0VvZUfqXdGUUVjQs/XN+lHAOMbD5m8cKs9ekxBxVQFwJTx4QDBQfH2nJRy9je0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10809

This patch adds the basic framework for ARM SCI mediator. SCI is System
Control Interface, which is designed to redirect requests from the Domains
to ARM specific Firmware (for example SCMI). This will allow the devices,
passed-through to the different Domains, to access to the System resources
(such as clocks/resets etc) by sending requests to the firmware.

ARM SCI subsystem allows to implement different SCI drivers to handle
specific ARM firmware interfaces (like ARM SCMI) and mediate requests
-between the Domains and the Firmware. Also it allows SCI drivers to perfor=
m
proper action during Domain creation/destruction which is vital for
handling use cases like Domain reboot.

This patch introduces new DEVICE_FIRMWARE device subclass for probing SCI
drivers basing on device tree, SCI drivers register itself with
DT_DEVICE_START/END macro. On init - the SCI drivers should register its
SCI ops with sci_register(). Only one SCI driver can be supported.

At run-time, the following SCI API calls are introduced:

- sci_domain_sanitise_config() called from arch_sanitise_domain_config()
- sci_domain_init() called from arch_domain_create()
- sci_relinquish_resources() called from domain_relinquish_resources()
- sci_domain_destroy() called from arch_domain_destroy()
- sci_handle_call() called from vsmccc_handle_call()
- sci_dt_handle_node()
- sci_dt_finalize() called from handle_node() (Dom0 DT)

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---

Changes in v5:
- update Maintainers file. Set role as a Reviewer
- rebased on the latest master branch
- Introduce arch_handle_passthrough_prop call to handle arm specific nodes

Changes in v4:
- fix SPDX-License
- rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
- move XEN_DOMCTL_assign_device code in separate patch
- Add documentation for SCI SCMI drivers

 MAINTAINERS                              |   6 +
 xen/arch/arm/device.c                    |   5 +
 xen/arch/arm/dom0less-build.c            |   8 +
 xen/arch/arm/domain.c                    |  12 +-
 xen/arch/arm/domain_build.c              |   8 +
 xen/arch/arm/firmware/Kconfig            |   8 +
 xen/arch/arm/firmware/Makefile           |   1 +
 xen/arch/arm/firmware/sci.c              | 154 +++++++++++++++++
 xen/arch/arm/include/asm/domain.h        |   5 +
 xen/arch/arm/include/asm/firmware/sci.h  | 200 +++++++++++++++++++++++
 xen/arch/arm/vsmc.c                      |   3 +
 xen/common/device-tree/dom0less-build.c  |   4 +
 xen/include/asm-generic/device.h         |   1 +
 xen/include/asm-generic/dom0less-build.h |   9 +
 xen/include/public/arch-arm.h            |   4 +
 15 files changed, 427 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c4886c1159..31dbba54bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -509,6 +509,12 @@ R:	George Dunlap <gwd@xenproject.org>
 S:	Supported
 F:	xen/common/sched/
=20
+SCI MEDIATORS
+R:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+S:	Supported
+F:	xen/arch/arm/firmware/sci.c
+F:	xen/arch/arm/include/asm/firmware/sci.h
+
 SEABIOS UPSTREAM
 M:	Wei Liu <wl@xen.org>
 S:	Supported
diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 11523750ae..74b54cad34 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -13,6 +13,7 @@
 #include <xen/iocap.h>
 #include <xen/lib.h>
=20
+#include <asm/firmware/sci.h>
 #include <asm/setup.h>
=20
 int map_irq_to_domain(struct domain *d, unsigned int irq,
@@ -303,6 +304,10 @@ int handle_device(struct domain *d, struct dt_device_n=
ode *dev, p2m_type_t p2mt,
                 return res;
             }
         }
+
+        res =3D sci_assign_dt_device(d, dev);
+        if ( res )
+            return res;
     }
=20
     res =3D map_device_irqs_to_domain(d, dev, own_device, irq_ranges);
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4b285cff5e..2a0bf817ba 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -22,6 +22,7 @@
 #include <asm/arm64/sve.h>
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
+#include <asm/firmware/sci.h>
 #include <asm/grant_table.h>
 #include <asm/setup.h>
=20
@@ -272,6 +273,12 @@ int __init init_vuart(struct domain *d, struct kernel_=
info *kinfo,
     return rc;
 }
=20
+int __init arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                        struct dt_device_node *node)
+{
+    return sci_assign_dt_device(kinfo->d, node);
+}
+
 void __init arch_create_domUs(struct dt_device_node *node,
                        struct xen_domctl_createdomain *d_cfg,
                        unsigned int flags)
@@ -280,6 +287,7 @@ void __init arch_create_domUs(struct dt_device_node *no=
de,
=20
     d_cfg->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
+    d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
=20
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 79a144e61b..d0146da5da 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -24,6 +24,7 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/regs.h>
+#include <asm/firmware/sci.h>
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
@@ -699,7 +700,7 @@ int arch_sanitise_domain_config(struct xen_domctl_creat=
edomain *config)
         return -EINVAL;
     }
=20
-    return 0;
+    return sci_domain_sanitise_config(config);
 }
=20
 int arch_domain_create(struct domain *d,
@@ -791,6 +792,9 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl =3D config->arch.sve_vl;
 #endif
=20
+    if ( (rc =3D sci_domain_init(d, config)) !=3D 0 )
+        goto fail;
+
     return 0;
=20
 fail:
@@ -851,6 +855,7 @@ void arch_domain_destroy(struct domain *d)
     domain_vgic_free(d);
     domain_vuart_free(d);
     free_xenheap_page(d->shared_info);
+    sci_domain_destroy(d);
 #ifdef CONFIG_ACPI
     free_xenheap_pages(d->arch.efi_acpi_table,
                        get_order_from_bytes(d->arch.efi_acpi_len));
@@ -1044,6 +1049,7 @@ enum {
     PROG_p2m_root,
     PROG_p2m,
     PROG_p2m_pool,
+    PROG_sci,
     PROG_done,
 };
=20
@@ -1103,6 +1109,10 @@ int domain_relinquish_resources(struct domain *d)
         ret =3D relinquish_p2m_mapping(d);
         if ( ret )
             return ret;
+    PROGRESS(sci):
+        ret =3D sci_relinquish_resources(d);
+        if ( ret )
+            return ret;
=20
     PROGRESS(p2m_root):
         /*
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index ed668bd61c..92039cf213 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -26,6 +26,7 @@
 #include <asm/setup.h>
 #include <asm/tee/tee.h>
 #include <asm/pci.h>
+#include <asm/firmware/sci.h>
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
@@ -1639,6 +1640,9 @@ static int __init handle_node(struct domain *d, struc=
t kernel_info *kinfo,
         return 0;
     }
=20
+    if ( sci_dt_handle_node(d, node) )
+        return 0;
+
     /*
      * The vGIC does not support routing hardware PPIs to guest. So
      * we need to skip any node using PPIs.
@@ -1739,6 +1743,10 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
         if ( res )
             return res;
=20
+        res =3D sci_dt_finalize(d, kinfo->fdt);
+        if ( res )
+            return res;
+
         /*
          * Create a second memory node to store the ranges covering
          * reserved-memory regions.
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index 817da745fd..fc7918c7fc 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -1,3 +1,11 @@
+config ARM_SCI
+	bool
+	depends on ARM
+	help
+	  This option enables generic Arm SCI (System Control Interface) mediator=
s
+	  support. It allows domains to control system resources via one of
+	  Arm SCI mediators drivers implemented in XEN, like SCMI.
+
 menu "Firmware Drivers"
=20
 config SCMI_SMC
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefil=
e
index a5e4542666..71bdefc24a 100644
--- a/xen/arch/arm/firmware/Makefile
+++ b/xen/arch/arm/firmware/Makefile
@@ -1 +1,2 @@
+obj-$(CONFIG_ARM_SCI) +=3D sci.o
 obj-$(CONFIG_SCMI_SMC) +=3D scmi-smc.o
diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
new file mode 100644
index 0000000000..e1522e10e2
--- /dev/null
+++ b/xen/arch/arm/firmware/sci.c
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic part of the SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#include <xen/acpi.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/firmware/sci.h>
+
+static const struct sci_mediator_ops __read_mostly *cur_mediator;
+
+int sci_register(const struct sci_mediator_ops *ops)
+{
+    if ( cur_mediator )
+        return -EEXIST;
+
+    if ( !ops->domain_init || !ops->domain_destroy || !ops->handle_call )
+        return -EINVAL;
+
+    cur_mediator =3D ops;
+
+    return 0;
+};
+
+bool sci_handle_call(struct cpu_user_regs *args)
+{
+    if ( unlikely(!cur_mediator) )
+        return false;
+
+    return cur_mediator->handle_call(args);
+}
+
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *conf=
ig)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    return cur_mediator->domain_init(d, config);
+}
+
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->domain_sanitise_config )
+        return 0;
+
+    return cur_mediator->domain_sanitise_config(config);
+}
+
+void sci_domain_destroy(struct domain *d)
+{
+    if ( !cur_mediator )
+        return;
+
+    cur_mediator->domain_destroy(d);
+}
+
+int sci_relinquish_resources(struct domain *d)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->relinquish_resources )
+        return 0;
+
+    return cur_mediator->relinquish_resources(d);
+}
+
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_handle_node )
+        return 0;
+
+    return cur_mediator->dom0_dt_handle_node(d, node);
+}
+
+int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_finalize )
+        return 0;
+
+    return cur_mediator->dom0_dt_finalize(d, fdt);
+}
+
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
+{
+    struct dt_phandle_args ac_spec;
+    int index =3D 0;
+    int ret;
+
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->assign_dt_device )
+        return 0;
+
+    while ( !dt_parse_phandle_with_args(dev, "access-controllers",
+                                        "#access-controller-cells", index,
+                                        &ac_spec) )
+    {
+        printk(XENLOG_DEBUG "sci: assign device %s to %pd\n",
+               dt_node_full_name(dev), d);
+
+        ret =3D cur_mediator->assign_dt_device(d, &ac_spec);
+        if ( ret )
+            return ret;
+
+        index++;
+    }
+
+    return 0;
+}
+
+static int __init sci_init(void)
+{
+    struct dt_device_node *np;
+    unsigned int num_sci =3D 0;
+    int rc;
+
+    dt_for_each_device_node(dt_host, np)
+    {
+        rc =3D device_init(np, DEVICE_FIRMWARE, NULL);
+        if ( !rc && num_sci )
+        {
+            printk(XENLOG_ERR
+                   "SCMI: Only one SCI controller is supported. found seco=
nd %s\n",
+                   np->name);
+            return -EOPNOTSUPP;
+        }
+        else if ( !rc )
+            num_sci++;
+        else if ( rc !=3D -EBADF && rc !=3D -ENODEV )
+            return rc;
+    }
+
+    return 0;
+}
+
+__initcall(sci_init);
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index a3487ca713..af3e168374 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -120,6 +120,11 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+#ifdef CONFIG_ARM_SCI
+    bool sci_enabled;
+    /* ARM SCI driver's specific data */
+    void *sci_data;
+#endif
=20
 }  __cacheline_aligned;
=20
diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include=
/asm/firmware/sci.h
new file mode 100644
index 0000000000..71fb54852e
--- /dev/null
+++ b/xen/arch/arm/include/asm/firmware/sci.h
@@ -0,0 +1,200 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic ARM SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#ifndef __ASM_ARM_SCI_H
+#define __ASM_ARM_SCI_H
+
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/sched.h>
+
+#ifdef CONFIG_ARM_SCI
+
+struct sci_mediator_ops {
+    /*
+     * Called during domain construction. If it is requested to enable
+     * SCI support, so SCI driver can create own structures for the new do=
main
+     * and inform firmware about new domain (if required).
+     * Mandatory.
+     */
+    int (*domain_init)(struct domain *d,
+                       struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain construction. The SCI driver uses
+     * it to sanitize domain SCI configuration parameters.
+     * Optional.
+     */
+    int (*domain_sanitise_config)(struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain destruction, releases all resources, that
+     * were allocated for domain.
+     * Mandatory.
+     */
+    void (*domain_destroy)(struct domain *d);
+
+    /*
+     * Called during domain destruction to relinquish resources used
+     * by SCI driver itself and request resources releasing from firmware.
+     * Optional.
+     */
+    int (*relinquish_resources)(struct domain *d);
+
+    /* SMC/HVC Handle callback */
+    bool (*handle_call)(struct cpu_user_regs *regs);
+
+    /*
+     * Dom0 DT nodes handling callback so SCI driver can detect DT nodes i=
t
+     * need to handle and decide if those nodes need to be provided to Dom=
0.
+     * Optional.
+     */
+    bool (*dom0_dt_handle_node)(struct domain *d, struct dt_device_node *n=
ode);
+
+    /*
+     * SCI driver callback called at the end of Dom0 DT generation, so
+     * it can perform steps to modify DT to enable/disable SCI
+     * functionality for Dom0.
+     */
+    int (*dom0_dt_finalize)(struct domain *d, void *fdt);
+
+    /*
+     * SCI driver callback called when DT device is passed through to gues=
t,
+     * so SCI driver can enable device access to the domain if SCI FW prov=
ides
+     * Device specific access control functionality.
+     * Optional.
+     */
+    int (*assign_dt_device)(struct domain *d, struct dt_phandle_args *ac_s=
pec);
+};
+
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return d->arch.sci_enabled;
+}
+
+/*
+ * Register SCI subsystem ops.
+ *
+ * Register SCI drivers operation and so enable SCI functionality.
+ * Only one SCI driver is supported.
+ */
+int sci_register(const struct sci_mediator_ops *ops);
+
+/*
+ * Initialize SCI functionality for domain if configured.
+ *
+ * Initialization routine to enable SCI functionality for the domain.
+ * The SCI configuration data and decision about enabling SCI functionalit=
y
+ * for the domain is SCI driver specific.
+ */
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *conf=
ig);
+
+/*
+ * Sanitise domain configuration parameters.
+ *
+ */
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config);
+
+/*
+ * Destroy SCI domain instance.
+ */
+void sci_domain_destroy(struct domain *d);
+
+/*
+ * Free resources assigned to the certain domain.
+ */
+int sci_relinquish_resources(struct domain *d);
+
+/*
+ * SMC/HVC Handle callback.
+ *
+ * SCI driver acts as SMC/HVC server for the registered domains and
+ * does redirection of the domain calls to the SCI firmware,
+ * such as ARM TF-A or similar.
+ */
+bool sci_handle_call(struct cpu_user_regs *regs);
+
+/*
+ * Dom0 DT nodes handling function.
+ *
+ * Allows SCI driver to detect DT nodes it need to handle and decide if
+ * those nodes need to be provided to Dom0.
+ */
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node);
+
+/*
+ * Dom0 DT generation finalize.
+ *
+ * Called at the end of Dom0 DT generation, so SCI driver can perform step=
s
+ * to modify DT to enable/disable SCI functionality for Dom0.
+ */
+int sci_dt_finalize(struct domain *d, void *fdt);
+
+/*
+ * Assign DT device to domain.
+ *
+ * Called when DT device is passed through to guest, so SCI driver can ena=
ble
+ * device access to the domain if SCI FW provides "Device specific access
+ * control" functionality.
+ */
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
+#else
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return false;
+}
+
+static inline int sci_domain_init(struct domain *d,
+                                  struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline int
+sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline void sci_domain_destroy(struct domain *d)
+{}
+
+static inline int sci_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+static inline bool sci_handle_call(struct cpu_user_regs *args)
+{
+    return false;
+}
+
+static inline bool sci_dt_handle_node(struct domain *d,
+                                      struct dt_device_node *node)
+{
+    return false;
+}
+
+static inline int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    return false;
+}
+
+static inline int sci_assign_dt_device(struct domain *d,
+                                       struct dt_device_node *dev)
+{
+    return 0;
+}
+
+#endif /* CONFIG_ARM_SCI */
+
+#endif /* __ASM_ARM_SCI_H */
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 6081f14ed0..2469738fcc 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -12,6 +12,7 @@
 #include <public/arch-arm/smccc.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
+#include <asm/firmware/sci.h>
 #include <asm/monitor.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
@@ -300,6 +301,8 @@ static bool vsmccc_handle_call(struct cpu_user_regs *re=
gs)
             break;
         case ARM_SMCCC_OWNER_SIP:
             handled =3D handle_sip(regs);
+            if ( !handled )
+                handled =3D sci_handle_call(regs);
             break;
         case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_E=
ND:
         case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END=
:
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 0012046574..f29656a27e 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -228,6 +228,10 @@ static int __init handle_passthrough_prop(struct kerne=
l_info *kinfo,
     if ( res < 0 )
         return res;
=20
+    res =3D arch_handle_passthrough_prop(kinfo, node);
+    if ( res )
+        return res;
+
     /* If xen_force, we allow assignment of devices without IOMMU protecti=
on. */
     if ( xen_force && !dt_device_is_protected(node) )
         return 0;
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/dev=
ice.h
index 1acd1ba1d8..e96c5558c2 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -18,6 +18,7 @@ enum device_class
     DEVICE_IOMMU,
     DEVICE_INTERRUPT_CONTROLLER,
     DEVICE_PCI_HOSTBRIDGE,
+    DEVICE_FIRMWARE,
     /* Use for error */
     DEVICE_UNKNOWN,
 };
diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-gen=
eric/dom0less-build.h
index e0ad0429ec..1c56441c33 100644
--- a/xen/include/asm-generic/dom0less-build.h
+++ b/xen/include/asm-generic/dom0less-build.h
@@ -61,6 +61,9 @@ void set_domain_type(struct domain *d, struct kernel_info=
 *kinfo);
 int init_intc_phandle(struct kernel_info *kinfo, const char *name,
                       const int node_next, const void *pfdt);
=20
+int arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                 struct dt_device_node *node);
+
 #else /* !CONFIG_DOM0LESS_BOOT */
=20
 static inline void create_domUs(void) {}
@@ -70,6 +73,12 @@ static inline bool is_dom0less_mode(void)
 }
 static inline void set_xs_domain(struct domain *d) {}
=20
+static inline int arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                               struct dt_device_node *node=
)
+{
+    return 0;
+}
+
 #endif /* CONFIG_DOM0LESS_BOOT */
=20
 #endif /* __ASM_GENERIC_DOM0LESS_BUILD_H__ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 24840eeaa6..55eed9992c 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -327,6 +327,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
=20
+#define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
@@ -350,6 +352,8 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+    /* IN */
+    uint8_t arm_sci_type;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
--=20
2.34.1

