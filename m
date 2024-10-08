Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165AB9955FA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 19:48:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813407.1226339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syEJU-0001iK-MF; Tue, 08 Oct 2024 17:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813407.1226339; Tue, 08 Oct 2024 17:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syEJU-0001fS-JN; Tue, 08 Oct 2024 17:48:00 +0000
Received: by outflank-mailman (input) for mailman id 813407;
 Tue, 08 Oct 2024 17:47:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=stPN=RE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1syEJT-0001f3-5M
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 17:47:59 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73c1ad7f-859d-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 19:47:57 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by GVXPR03MB10873.eurprd03.prod.outlook.com
 (2603:10a6:150:218::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 17:47:53 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 17:47:52 +0000
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
X-Inumbo-ID: 73c1ad7f-859d-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIB8Ct+fEIR0i+I8uOc3He8s8k7TC3kAzwayYGaTZNQwVztoDgKFPPWZgyYy9yv01yUahIUz3i4kWW2JJhEuHOwb/9BMwIJ+tn9CMWaWlF32itznzqy+FofGQGOd07cpsjhVwnImk4fGxRl5PMRmFdK4L0ZBD5+07UjrXpp36KHQByWqSIIQhLZxnxTAI1CjPW0kKtJH+FAmdePWxVzPriCm+cy4xUZAVpoaudumN+3mW1l/TLHU7XqJZPyAXCPh9AOM8mYkLp2Zq9VQcxtkGZovR7y6nb+ENST7R+bhdQsKfHCMSrv7kKwIz6MtNfw5757CWcj4x0SE4KHbMQx5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/02YQd8rw9UthqjIbuNSQzRqk7HXgndWucdoR1V+IaY=;
 b=ggsGd7BIq+oKIca4w74n7bYsodt2z02kUz3oiw4fHRgvuacI6NZ9CHQtTLgWYDAB/1J23kfYkmAZS33RXfSrK0AgSgloysyUKfunNeO+pXwSfB6dBWmpI8xUazd6V9eUxYMIsr0FpHP7FGxe5b0ykSMhXAjh+VWk93JP2POVwze143iKAcL/8HC7Mu66gVf4Y0sStx1D0GqD/vGjMBthQQOfcE6ZbNc+XOAqFCo7FofJP45F2vJxpzUM9Df0g9+B9U8ykAMRTUeIZB8ABFfq8Dh7sxwR5s3MLIC4BNfRpPlPv5PV8xgwXysi0LrMNAqXL/m+pUuN9JhhsQcJgP+m6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/02YQd8rw9UthqjIbuNSQzRqk7HXgndWucdoR1V+IaY=;
 b=RDVJKAQtlZa/nlOJDHakjgp+t70dKu/df0gCPRVzk7Sriezj8EBkCAVW3cLrNU+3Z0PWTqp3Dp9IZcaTFYb1QWl+Tw6pno1wDxRnW9ZVWmZ9t4WV+pfJK9fLj2W/VPqDuggYCCcwCOgq3qjGHhXOm16r1gMpDCvmN4UnG7lBJbpMWxWrPqP6jw3WA8OiTivz1/rzpS3RYO105QWnxkRAn6lCiNHU9gxj5q+zKvXbUpdF0RrpTJrGD47fB3eGODeUhbHjJ38bbRGHracLsy1v6wygvMW88Yo2HuzpMfd3KpOi09T29RonV5W8hxCehyYQsskKcF+FyGal6ljEXe9+8g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add myself as maintainer for arm tee
Thread-Topic: [PATCH] MAINTAINERS: add myself as maintainer for arm tee
Thread-Index: AQHbGYnKbmuSpa/+lk+wbigq1bh8+Q==
Date: Tue, 8 Oct 2024 17:47:52 +0000
Message-ID: <87wmii5vw8.fsf@epam.com>
References:
 <e853549e25d26264e1a470336a98c48d22b799eb.1728395637.git.bertrand.marquis@arm.com>
In-Reply-To:
 <e853549e25d26264e1a470336a98c48d22b799eb.1728395637.git.bertrand.marquis@arm.com>
	(Bertrand Marquis's message of "Tue, 8 Oct 2024 15:54:58 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|GVXPR03MB10873:EE_
x-ms-office365-filtering-correlation-id: 3f78fab0-079d-4214-59ca-08dce7c1555d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oz3M1IbQcLCEMUjGIhFRhfvjzbnsZRvjJYZGKl48g8BKc1fQVTnEBlq10B?=
 =?iso-8859-1?Q?B+V6oo2nislyXrZlYaR/Ga14msCp5g8AlBeqTbs5rSDS1Bw4I2sniehpZA?=
 =?iso-8859-1?Q?BfVEf0TzCgaKN3/ZZpc5I3GmBpj0i6fiGBaMEdy/3WgHqc3OFAifXNdeqD?=
 =?iso-8859-1?Q?ajgiGjyeutf+yOYTe17y1Q+OC8WmBqeZhH+NTpZUG+7OVJGYQubfAJLsoD?=
 =?iso-8859-1?Q?WtfTK5joUm3bvjX7oUT6oS8b824CiIdAXZ7llk9cnM2buyr7HnMWPuRiyV?=
 =?iso-8859-1?Q?H4kpC5kZVXoaezP90LlleKh6raIKPd/QVbrC1vY0obs6BUdhAuHbGyLN9E?=
 =?iso-8859-1?Q?5UitH+cEHCUN6fNHbrZCxHyjspeC02VwUkUzAmSTOeRD88w16+Hfri1jta?=
 =?iso-8859-1?Q?w5WEwFJXCYv0/cVlZBkcbVbo+EBy26AzPqXfkUTzU54R4bTV5RY/HiuVmt?=
 =?iso-8859-1?Q?06ZGjkTyYF7/VkoTG9Ga95cCCaRiF+XmB7SnEGYCuJ0xAiv1ZuQ1E+WACF?=
 =?iso-8859-1?Q?VUebbnUqgThLEk3aTbWlY5c9/F6k05KDbHFw1osgUHXMVywP5+dxXG9Rgj?=
 =?iso-8859-1?Q?RtMd2mGE6QGzb28HQPlB9sDQn2787+qLdgCZY8bNq2epZkpN+1N6JEqhzH?=
 =?iso-8859-1?Q?HPQIvBAW9ZSLXzZ4uT1KMd1u9PiQCqZokIV31DQ+Dq5nZIgXSQQVmoSLVf?=
 =?iso-8859-1?Q?iEDtjyaFKfn4B19O7OPhs1HJdE6Y5q1jp7U8mutns1fvdcM+LS4N/3TU9C?=
 =?iso-8859-1?Q?IaJ5bo9YpbCPComs+RgXKNAo5aqCBS37ua8kNJ1dPE8VqNowGEv1lZnkET?=
 =?iso-8859-1?Q?e/S78GTtkNDDigHEYzyn1HvVxmJlMb5OP54MG+gB2q8nJ33wevOfd3Efd1?=
 =?iso-8859-1?Q?gzmKahUtWL2VsTOKzhEb/8yHuN8XuAWfBk4Y9K5uQQCPuu3RahULXmZhR7?=
 =?iso-8859-1?Q?zEjGsXBPjxdeH/w4lSw1mWbLE0P8MVRYtUH0tZBJ6cUOZUOz1FdOUD7Z0r?=
 =?iso-8859-1?Q?I1fHJeZuPaha/97m4XNHO/+JA0gzvM30HwSUwB7LpzsxSl/2fP3Lpt5KMx?=
 =?iso-8859-1?Q?fBzgfTwJgPmFNOsk7TYdYLXCehogA/E42U8vnM6F6+QUgSmi0kno+Go6ei?=
 =?iso-8859-1?Q?1S4oO0+JVS+aAHx/mcZSJHTms/ejaUd1gJF9NUF08ymKECZmzF/tfQU7Cj?=
 =?iso-8859-1?Q?1WS9mSen47kWG5gfnh2jKwu44mAEwQVBlALwGlb3NKZ6Sm7NAHihWduQLR?=
 =?iso-8859-1?Q?YnPik+d6sc5dhYEOXJMtsez0KKGFaCGPSZFAbNkiD6syhkgtrroMuL28Sr?=
 =?iso-8859-1?Q?fLYIp3R/Ld3Nk9U9hjz4iGDDH2nQokOiliwS7/cMGcWmPFBSSYtogwfLWs?=
 =?iso-8859-1?Q?m7oV5DGcsAPaWKXpczfUODcjCbhXcO4Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IogUwcSgQIVkCs5vuOxQMuF+tJNKNbUK+Brz19VQ1LFIeqPBiKSS8A6+aS?=
 =?iso-8859-1?Q?6X8cdWYmeLXy53PrOTHOoy6SMwhpifF/0f63uo0UreBaeGB9ZhFL6rTve0?=
 =?iso-8859-1?Q?sViUVFzbhJEXITv8vv+tvw0vfpJhS2nTf0nDbqd8Ec2iShBjK/FTgIi5YX?=
 =?iso-8859-1?Q?sKWQ7ARX1OHI2XJl6mPVy+x18C48Usuy89Of55mrpPEwru27ZaQCW21+y2?=
 =?iso-8859-1?Q?oHq6PTbr0FYD3u0Ihz9ix8ENOLqYHAXEEkwMe2DV7/brDpAAWc3rN/xlp/?=
 =?iso-8859-1?Q?0epS5/Z/Jj4b5hTolrTkbyZLbhVTrUfnE4qGp100AkAqeOwhbBZ0iS1Xb9?=
 =?iso-8859-1?Q?KPWLtYHOtx1HPcIP6SM49pNKvM9j46s5gRttiUzyoybtMh0qpKcdlvXLmh?=
 =?iso-8859-1?Q?xzndTj2RDDvfHfg6Jl6O/Y/yLcvRvNEKWfDl6bFw3Jmm3xNGDsGnzzTyo8?=
 =?iso-8859-1?Q?8OFmWvx09+BUpJwSHFw2SC1lgIYza5g/z/RipIhPyQaFSU++0slnFVCud6?=
 =?iso-8859-1?Q?ft5zBiTfjaclHOBlR/xV1O4WvhkDUauDTXB910SsGt3TFs34/RKLAp6G2o?=
 =?iso-8859-1?Q?ucqHaNJKvTXnjJmNj8Uz0e1ambGJmOMh0gCkKBlBAs4xU5Cr5vwrmBL+R0?=
 =?iso-8859-1?Q?OVImepTGDUVqSs2ngsC9TUdVe5m2nL+cLGYDUv8kkN9ND704hmKkSQ9zsr?=
 =?iso-8859-1?Q?y+JtqY3+y4ENXTWXnpRCTvG9NmVrPW2UjfpaaIGKCL/vyp8qTanAxmMwkO?=
 =?iso-8859-1?Q?ctVb4mLiZGuvjkgvkEuFuRS/nVpWe+Er9sfywt2lDjGZb3JqldyDUx9EX+?=
 =?iso-8859-1?Q?NRebKBw8LdWvKpc0l2Fl6TThXxJrLMLQLy6hTge1gi58xq3AuLtCAqJjBB?=
 =?iso-8859-1?Q?pnNDhWv1lfg3+SioWDWT7HtSxDt+Rlq4qwhk99Kx+g40nYCYs+ymMvOI6l?=
 =?iso-8859-1?Q?UGt6Qj5R98YXpGalXw4gAM+UEzXFEabjPj+aHiAfvb0hAQ22xKeMAuN/6P?=
 =?iso-8859-1?Q?rTYta0Jz8TJYchEBPTMzAxcG705i+1weJ4VjyJBRP/npkyG8p3AFO9UVD6?=
 =?iso-8859-1?Q?KW2j9O+zEMpTPmkA5t+LqypcIkF2LnvK8pY6JUHJvrH3cJ7QmcJqarqoTi?=
 =?iso-8859-1?Q?klzJQcf7cIan1+S4Wl+LwNip62cVcT8vb5wocHB1KxDp0WqIINS0KPTatq?=
 =?iso-8859-1?Q?ZPVSbW9otaFCEOHSJWHdbi9axAqH9u+rJGvE3Poor0qSKwJ3QOTpBhFqSr?=
 =?iso-8859-1?Q?21NJtSSKhRxeCUQjx9gWo/y6pS0jn90okNiJgLsabUovgDzBN3hz/amORq?=
 =?iso-8859-1?Q?pQH1HA3G6d97f3kOQG/wjiMnd+3TSOJjoZia+XupvrfeVXgqnNmbHrB+Rq?=
 =?iso-8859-1?Q?v0tY6o6PjaValr38Y/bdfkLw8wf8hAHTVBJC2MzDX+/gkr5oXM94bDJIba?=
 =?iso-8859-1?Q?vGXqzE2tz4AROF40Yn65dicGcGgtQwLNK9k0jT5EuJnIIhWRE8j44dKShf?=
 =?iso-8859-1?Q?8jD9ipUXmUQAjOuY2TcEaCwaxYPJXUa4DyIUSF+pKZqpUoI+p1KvCha/zj?=
 =?iso-8859-1?Q?Z4qHJyC+ccoxnGNCKRnpZu7M78cO9MmWv0OxntocMWENVnlHZ/72JM9YZB?=
 =?iso-8859-1?Q?XSwgRcZ7UmveKaSkwTsaKJPlTYdcgAg0RgQm6JLsk30No58MsqRJW4nw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f78fab0-079d-4214-59ca-08dce7c1555d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 17:47:52.6611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uYJLgU7gNybEUm5Pa5eSYw2fBx91OWzve3ol+cYNDBA+DqBYC5j6uTXFJaH/BWjz5KLpshftyoLAtU2K1PagArcT37dumEprVQFLt7R6VTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10873

Bertrand Marquis <bertrand.marquis@arm.com> writes:

> With Tee mediators now containing Optee and FF-A implementations, add
> myself as maintainers to have someone handling the FF-A side.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

--=20
WBR, Volodymyr=

