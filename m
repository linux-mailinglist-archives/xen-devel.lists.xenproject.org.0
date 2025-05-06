Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4801AAC266
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 13:21:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977076.1364156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCGMt-0001dv-KQ; Tue, 06 May 2025 11:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977076.1364156; Tue, 06 May 2025 11:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCGMt-0001au-Gt; Tue, 06 May 2025 11:21:47 +0000
Received: by outflank-mailman (input) for mailman id 977076;
 Tue, 06 May 2025 11:21:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=myEs=XW=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uCGMr-0001ao-Vc
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 11:21:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2613::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a8ec762-2a6c-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 13:21:44 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB7505.eurprd03.prod.outlook.com
 (2603:10a6:20b:26a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 11:21:42 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%6]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 11:21:42 +0000
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
X-Inumbo-ID: 4a8ec762-2a6c-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjwERvgh0zYWf1BggqY3tir3F9hrXvwIuO9xmObWgVFFHW7I+QA9jpG7SxmNWkzYKUXuBD+uF+H3dKLaNC75uWl20KdYZGPjBcHs0SaIFfb+ZT8UZzC7kefLHu9IIh3VjgflY0GgzW7iPuKhWiWdOK/kCQZy0y+ozffLWK9QISkYFr74VzSqrMA4axjj2GrJN8wdKmRpjqSDbIwRocM5t/VgqDr0XD19iSm8VcWERbq3++ByAlgXDmvhOJkl5YRBxmbi1uVnBRFuvbxH1+LlPprubA+RGk+FRsX6g84jAOoR7buM5E92S0CI0ibvhnPcQkXGwkUN+sYiNA/ffNN9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M45di3iSaRMQXjpi/0MmGxQEPbRVX08J3En+WQrth2A=;
 b=GtrZ9Tn0xt3HUWqzP8f9LDYXEFYPSNVkMr2EuwvV6Wme22FUzpGK5lsbrlRCrkvHh2DjcGmwGr9XZs+iKr10kg75pm9bGIZiHtkKfjTW3c2msT+kGap1X4vn0E6u1WYN/OBUNzwYqSxfTfLTMDrZGWR3qZ0nrhzVYVBtlNTtReTcJUJLk0hq0ZaFpTrqiyrN5f0HODASBSzNRo/XEn9jn+CQBRxD9L0vfE5R12isuXQVl4+LASSjnTISbNelYP6AG7sZ0Coi+pU6GrkDtkEPGOowAXMQZiWzT4pLdVIwZDIebwJAiapjbu8CZNWWmqEZ8lAQDCFxoqVbw3uAfkoIpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M45di3iSaRMQXjpi/0MmGxQEPbRVX08J3En+WQrth2A=;
 b=EkmUJlgdIxCqtXgVTOzJnmgSaSQJ362m/WSmCQ+7bZ/syW9YPxhc3Z3IEnE+w8nf5HzgKG7K1xS3704+PP+6KhylPi5NRw9rhlTk9wfLJGTCN39V0ZkCesNRygObOUQsuDtg30eNKBWl2XRIgyET+OAldUZsNt+fMbjiLB8Q38d1VorO7vgS02FkalGVXs6FnWsO82J4FD8gt/7Q/Et9b9OIwH71AYxWpGfOWXhQ2WkaEnPwZWbrREn/Pt2b9msWjp1WXn7+OLgNKbB2OTsIeM+x1/j68kESYV8aRgSRz1DeW8OECYqZIu8v5im7n2s3qOKg6/xm8OrnTM1NFJJvhw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "L, John Preetham (893)" <john_preetham.l@daimlertruck.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ruslan
 Shymkevych <Ruslan_Shymkevych@epam.com>
Subject: Re: Request for Documentation on Bringing Up Xen on R-Car H3e
 (H3ULCB)
Thread-Topic: Request for Documentation on Bringing Up Xen on R-Car H3e
 (H3ULCB)
Thread-Index: AdtsrjaU74AF3fZpR/+NK9h56D1xZg==
Date: Tue, 6 May 2025 11:21:42 +0000
Message-ID: <87v7qec7cr.fsf@epam.com>
References:
 <FR2PPF86245AF1B81D71CF27EE705ED09B7B8E12@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
	<8734ha2evr.fsf@epam.com>
	<FR2PPF86245AF1B0938F55DAF4FF4E63A31B8E02@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
	<87ldv0248u.fsf@epam.com>
	<FR2PPF86245AF1B97AC233A5D738AD088B4B88E2@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To:
 <FR2PPF86245AF1B97AC233A5D738AD088B4B88E2@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
	(John Preetham L.'s message of "Mon, 5 May 2025 04:25:23 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB7505:EE_
x-ms-office365-filtering-correlation-id: a9556a80-dee2-45b0-f97e-08dd8c902d9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?aNO2k1fg6VLzUgMSYtIvO+X2kMQGsQ4YXRllRMcCmRcZAiaY/p3Mc5MD1O?=
 =?iso-8859-1?Q?bx7SI9HysKpjJt7sbtz1vHlSM7hWcflkRcyDH6BirWLaAYrUvwg9LsXmTo?=
 =?iso-8859-1?Q?+k5WVx6eeR3sGBKKq0RurH5rtBHuuz0XNYiqyuIrb/aGFvmAnVQGOkkTy2?=
 =?iso-8859-1?Q?pkZDxQosPUEZHuCfpPLeBuZnTFcxFVTiELUFrj9wdbIdi1y2s/FkK6Uwah?=
 =?iso-8859-1?Q?utPVMsLoJBK0xgvoRZ72t7JOzB4ilNa2ddb7foDL10rNXQSPWmeQumEd8G?=
 =?iso-8859-1?Q?gKtwzvZYadM4Gp2NMdvdNnb7tkes/NJ9kLOSmEl40lC+LnIp8tY1QGw1x0?=
 =?iso-8859-1?Q?6d9e+Vme90vBfesMXxM0DIPeZx5oKThIPt2jzyEa7dBDVtL4xthNR1P7m7?=
 =?iso-8859-1?Q?0zJzdN9+khumwlVwGUVMt7GeAaA/cVDIp9LhqJtTINEQ7FaIWwPjrrhDDT?=
 =?iso-8859-1?Q?zWl/Q5J10afASMT88hCiQVQcd7AOmVd4MiNjN1o60pWziqX7xmqJOT5mJd?=
 =?iso-8859-1?Q?tvFPPw8ftz/GvxphQpbOKussKIdYWI7pVmc1jR2G8fGvrGKc3z5ksKTCTm?=
 =?iso-8859-1?Q?ZcuzUUXMJZ2TsMZslRjIRAAawaNJgAgmZBo7a/Y/Wa3VQrbvJD/mmBXkbG?=
 =?iso-8859-1?Q?KdCn5JkpmBNgbAXDyl+DHYelanG3yebb/qR9BRQI0LOP+um6xylSIiEYVp?=
 =?iso-8859-1?Q?82A8Yh7IptyQNOUBvh9BQ8cpG/iYrvii0gSwjbqfXSUEoinujjjhnzzONE?=
 =?iso-8859-1?Q?pSI8QsRzncAio4PO/svFApXPe0mj9E7VqoscCoM9z/qvFIF150H8gl1BnS?=
 =?iso-8859-1?Q?NnOpL4Rv4hIvsR5M6eBv+8u+CQwJ9WNVQMHMDba47cFB1FNAYVQun/ZBh/?=
 =?iso-8859-1?Q?BXGbWYlC/kClHBDAWkaUU506RXvh0J97ZuBxxqoINlsFP3SZQHTnT4JTVC?=
 =?iso-8859-1?Q?sg2uRzgVsQ5meRa5iBL/HZWZf8jr8SN8d1QWHaZPU1q/3SyC0xN8Onv99p?=
 =?iso-8859-1?Q?ZPGfL1jFEjnGda2hFZNwtJ1Szd3y3wS3ch+IYw74vgUmbZx4uenPg1lCFM?=
 =?iso-8859-1?Q?XGVVzcEM1JmnAG2BfgpVUsD06XOZDid9jTVY1Y+Zog1SpY76h06n9jz0J4?=
 =?iso-8859-1?Q?s6gnFZx8AByUpnWmb6ieyPQPZhzrT9xKb2aUNBWXCK5v57T6SUisMVSBwb?=
 =?iso-8859-1?Q?1LtvX4BrPMEJ0yKRH6cQkGqbQCPJ3rJutjXVEC+P31f/LUIEJqb0B1v+Ol?=
 =?iso-8859-1?Q?il0gaxbPCTk/ch+fkYWOAfNGpnEfIw6LrIyjldDq4gWb+t644kxULvEev5?=
 =?iso-8859-1?Q?W3kdpXWPBt52TmCzZfkZ7OmGEvBBnq2nRFloKMOG1YdIeNTAtPMzbXYnkK?=
 =?iso-8859-1?Q?fDQwql4KVrkPph89aEO1b9soX4jhp1vYLRgBwI8lp3SupikkXm3GsxcF36?=
 =?iso-8859-1?Q?rNargdyOXimAKGZfOHJ7j+H5I6RMMfWQrSorSyDip0bl/IslDC0wMEXPFp?=
 =?iso-8859-1?Q?o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qRNqAe3Z/VE/gBnYb/hCvtvpcCP1yzN+LvP959q9E2eu4opkNdW0zg45m3?=
 =?iso-8859-1?Q?FUl+Th0EoIY6fmA7FY+Of7cEbILZJGmm7xwTnC+NdMH53qa7qrWbfdKk5p?=
 =?iso-8859-1?Q?53KsuZrSIdSGEQAllvgjGeqr2TGNDIR4wivEG6Hwg7uBR2aZvIbgXC/Wck?=
 =?iso-8859-1?Q?tj86wIoqVbFqUgbrs6p6uE2NXQ0Mm0mI4V0uB8ijWKZJCXPagHkVBiBBL8?=
 =?iso-8859-1?Q?es4tk+iWvBrR7RBv/cI524t2/g9IJDT1d0wU7bdU4+jk5QsLjszNNqJk/7?=
 =?iso-8859-1?Q?qVQm5xgV/E1GLhc2RwpMLRJNLU3gZhz25xZbO/vPxcrx3T+Qitfolm6qod?=
 =?iso-8859-1?Q?JeC7T+5Apar14WUJTenV9OnPoc/KSlpjEwYrkqMYVole26yf4lbNB3KXDi?=
 =?iso-8859-1?Q?maRUpPAPj8GzfbzgGbpmhvz1XWYZfVNJpmj5zG7h8ot7uVvTaCe5BKwQao?=
 =?iso-8859-1?Q?3E/2huFy0q3wJrVdwyHrJ/miIKfQ690BcHCpRydQwYknvt/xITUpR9H7Zq?=
 =?iso-8859-1?Q?6yaV76xPmqE0z8Nh68tjllgbCBl9o0DEVUx/3dUsjKzEw2SIrMT6nD7jpY?=
 =?iso-8859-1?Q?PzVCULYaxQqKlE5J3oJpzgl7cL2CjAUGkALYLXwwxEHhoeWADdzSibkiti?=
 =?iso-8859-1?Q?hW6y3F6c3kqrY8Aq9GlhEUbuhGLAg6PKVDFr95xkCXzpYRUJCaDvDOQgnK?=
 =?iso-8859-1?Q?6eaAjr1IWizGHxSt+fwWrHBN16F6cJE8Wz0I8BFe+F3EPkBtXAuA0aupYe?=
 =?iso-8859-1?Q?giEWKdtMF+tKjcTcfvSeBRJctPqjPOYtne6IE4iuvvxaEcyGYfCPg3zL5Q?=
 =?iso-8859-1?Q?+LlQ/rSDQ6PgbSaXtK3MwoJB9dLZU+JAdxP9UEtFlaXjfTQyTrcE9scoVV?=
 =?iso-8859-1?Q?OJvZ2KQwX+dyDFvH3xaG0e8XQsiocvyu31PpdGPafgGDyvSUk+ZuRU2ywP?=
 =?iso-8859-1?Q?hxgedtzOqrr7PHncn/EeL6BpR4m/PpyF/0rk69UTTlfXyCdilElmWtlgtt?=
 =?iso-8859-1?Q?OejrArWrIC6ji2tc/TOAc6KC4sDqsYQdjhtexWxd2tW/LK8zLoo2oLLhPS?=
 =?iso-8859-1?Q?7u4SaZM5x6Hugn/8idY01qO8GZp5rAxyzJJxPFhxDXvip9Z9QwoaswJOQn?=
 =?iso-8859-1?Q?wHeeuzqKaaSczKrHsHjpGKvqXY/HO2H7cvbK0GIZs+0JNG0jo4Ufz6cgKs?=
 =?iso-8859-1?Q?Pu4BxfL1UuUsvlC0/Otk/WI6XktjR3dF+T6im3rvuTGOvqfwaaxfhZkt45?=
 =?iso-8859-1?Q?HF+bTOU8WhUP4hgzoruiLJbBexiZFL6UAX4GQnisUlv6aCgWGFW15qQXp8?=
 =?iso-8859-1?Q?FJM1CXZnL4xtcYT5d3J49EZo+ywdkr9IfX/D50305riDRdxJx8eQDNLgKT?=
 =?iso-8859-1?Q?FsH8lEHYlExyZc7/4iiIgEsniXm1x67vMSCUdKrTrZmTyK+06gdgHQIz4Q?=
 =?iso-8859-1?Q?fI2+PI732mjX39sF5yuN1lfeZtlpp2Q5wp7wTq6Ayr0qahs/shloYidNXl?=
 =?iso-8859-1?Q?5tD1K37jrGIRZ/Vt6+b5enCUnZMfV56L/Mg4rdWKZeUNWYyT1qmTjQZ6e0?=
 =?iso-8859-1?Q?dOQLEhCCWqzAz2axJ184+2Wrrdi4G1jAaMQBz/bNQ1ugrkyTuZvoGWoitV?=
 =?iso-8859-1?Q?fR9jVcX7k20yhkyN01Un5PGAU0bAdrkEFlAg9rAsqN2lJhWkCqp7iKLw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9556a80-dee2-45b0-f97e-08dd8c902d9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 11:21:42.4938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rn/SbznHtrbRnYseiqTzwFHVuFzT/sgSe4BHwwc2690TSeKYWejNuuO24bH6d2mgRHnOpezxSk5sy1wQz55DXlnnQ7ZlhIPEQE/YfSjCbWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7505


Hi John,

"L, John Preetham (893)" <john_preetham.l@daimlertruck.com> writes:

> Hi Volodymyr,
>
> Thank you once again for the detailed explanation and the helpful resourc=
es.
>
> With your guidance, I was able to bring up the XEN hypervisor on the R-Ca=
r H3e board successfully. I really appreciate your support.
>

I glad that it worked.

> Now, I'm looking to move forward with bringing up a QNX guest on the
> XEN hypervisor.

If your QNX guest supports arm64 boot protocol (which is defined at [1])
and supports either Xen HVC console or SBSA (pl011-ish) UART - you can just
boot it by providing kernel=3D option in your domain configuration file.

This at least should give you access to guest's serial console, which is
a good starting point to further bring-up.

> Could you please share the procedure or steps you
> recommend for this?

If I'd did this, I'd done this in the following way:

1. Check that QNX kernel image is compatible with aarch64 boot
protocol. Most of projects (Linux kernel, Xen, U-boot, etc) use it and
it become de-facto standard, so probably QNX should support it too. But
if not - you'll need another loader to boot QNX. We have Xen-enabled
U-Boot, by the way.

2. Boot QNX kernel and get serial console working. As I said, - either via
HVC or SBSA. This is crucial, as you need some feedback from your guest
to understand what going on.

3. Boot rest of QNX environment. See what is working, fix things that
don't :) It would be great if QNX supports Xen PV drivers for block
and network devices, otherwise, you'll have to use virtio or
pass-through, which is somewhat more difficult to configure.

> It would also be very helpful if you could provide
> an example Device Tree Source (DTS) and

If you are not doing real device passthrough (and I recommend to
postpone this until you'll get your guest running) - you don't need any
DTS files. Xen toolstack will generate all the required DTS entries
automatically for the given configuration.

> XEN domain configuration (CFG)
> file for the QNX guest, if available.

No, we don't have any. We had experience with QNX guests, but that was
really long time ago and I don't think that any data survived. Anyways,
I recommend checking manual on xl.cfg ([2]).

Please note, that if you want to use SBSA uart, you need to enable it in
your configuration file. It should be vuart =3D "sbsa_uart", I
believe. Also, you'll have to run xl console with additional arguments
to make it access SBSA uart console, not default HVC one.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/arch/arm64/booting.rst?h=3Dv6.15-rc5
[2] https://xenbits.xen.org/docs/unstable/man/xl.cfg.5.html

--=20
WBR, Volodymyr=

