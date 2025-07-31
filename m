Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB40B16ED8
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065254.1430666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoF-0002KN-Nb; Thu, 31 Jul 2025 09:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065254.1430666; Thu, 31 Jul 2025 09:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoF-0002Jr-Gg; Thu, 31 Jul 2025 09:42:47 +0000
Received: by outflank-mailman (input) for mailman id 1065254;
 Thu, 31 Jul 2025 09:42:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XXc8=2M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhPoD-00025Y-Fr
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:42:45 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b541ed1b-6df2-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:42:43 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU5PR03MB10524.eurprd03.prod.outlook.com (2603:10a6:10:526::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Thu, 31 Jul
 2025 09:42:37 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 09:42:36 +0000
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
X-Inumbo-ID: b541ed1b-6df2-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGm07XnXkTjcI1LtJHD7T0XouT1FfpVlP+1ltgRrTKSmjHmJz/ukXt6gMbkyfIGYLxqdwUH9Ea//IRMAbbGkn+23U87w1Cqk3EI9ycMuQSvZusSM87r8JGO+xun+v2V5gxBFMvnNXyzDHl55Ciwe7VXbmmr9D/hZNM3D82tWdh65j/5IyFRPlyPzwUejJBVr8wULJ7jiss+CRcMdrHxMX89KskBM5nb8Qs/EBagWJO5COUhGGDc3tgu3QLMvDyDaldWJvA/Adz3dtU9QhmeUKKmFjWllDLa1RVfXLD9XPJ5ZIexBTq0j6MldinoCSYULUD7SnE/isrW/a8fvV0oc/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJGNO244xmbvCg8mFJ8B/E0SmsrA4Ra8FtaUDi5cEdw=;
 b=nCT42uCXWB/MJ2IS70yDEBVhUAPqaRAyAobSt2s8Mb9hjQMXwQucEdLLOCI3Kh5x30F96xII/vVBLEkTbNbu4CnaOqUdlkg1eMHDPsgHkRjPnOR/kP6wjtEdrJJRLIoIOhA5bJO7+DF2rYc9ye19u0dxC3Uksv4hy0YRxxELUu5nXJQGT1L6XcHJTii8OqUKI/YLORqENiQi+XyXqvYfLyU2Cpxbg/mTZ0gUwbmkppQaKsOms/GuEFNU96cZas5AIXHHrihHXMaymbi218DO+e7H7Ler3rc3ViMB3/sclBsOoh1cDtknlHAQPinTuc/aZ0FxTnJsXzd2DsV09xeJyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJGNO244xmbvCg8mFJ8B/E0SmsrA4Ra8FtaUDi5cEdw=;
 b=ma6TBYpyX0gyH/yiRdwdK7/HggdtnPcPG/DNUoXXvWIFJ79jg7sXemQVxj7cdHDfyzctoqSPE2Qfoc/cE7/7gjIZrAxgtkFNBPQbzlhlCpeL91mkv4btvldUPhQvzncWJ2InCUPS46n5lO0TlZjjQwCMQJJEi7Zipm915KcJHogluR5zVJ0lQXsxva5nFbSuBoB84AwXso5BTUoyIW1ADjmwfYo4jILFrO9pbqQY8K30KF6mIDYELd1ID4CY7c6YfN4iqL1QRCvBE+f8+TQwagYXBLoH1VSsUPeEp5+blXa0QLWsBSiiqA0B7/E1zXC0jQZcDEWkRXp9WhBkpwdBPg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH 0/7] xen/arm: rework to probe kernel before creating
 domains during xen boot
Thread-Topic: [XEN][PATCH 0/7] xen/arm: rework to probe kernel before creating
 domains during xen boot
Thread-Index: AQHcAf9y7RxsIYyypkiwAYTFDxXPeg==
Date: Thu, 31 Jul 2025 09:42:36 +0000
Message-ID: <20250731094234.996684-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU5PR03MB10524:EE_
x-ms-office365-filtering-correlation-id: 7e030263-aab8-48f2-b505-08ddd0169549
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VfQ7c9GkZjhbLqKlg2zu1UiNUyGqoY+0x+xnrK7JxH+dW+icfefvKChURE?=
 =?iso-8859-1?Q?cvbhsv3ivNQFU17ZFDBSbT11zdrD5fvk4neKqXZMdNuFWh4GqhvTWbhCW2?=
 =?iso-8859-1?Q?TuKbAZdloJ9/pN6Q1uQcAgaPeRhTJtyjL8xpiNKW5saKs+91aFXSXPe5K8?=
 =?iso-8859-1?Q?9bjD+FnVlnYDVg5CJR6HhSFFtUsMoFmRMmRcrvEdOPfsUjlTHBoXhWCCh6?=
 =?iso-8859-1?Q?8HDHwq2bjIOlisEh0YQtp49Ca8/6h+EtWlwuw278Ldd0s1IJZCHncYSTx1?=
 =?iso-8859-1?Q?AaYv2EP0KF9dJCPl4YjRBKm3GwbDS9gYnSNuH8tFhg9Gw0FYLRvg0HS/5K?=
 =?iso-8859-1?Q?VH2L+pseiNeY7aBlx+0/vZxgIJ29LW13xsAso099IcmuQs5lu0tcxZZ8W0?=
 =?iso-8859-1?Q?QVQD7A9Mvxn9ESaipqc1BfdS9+APDQRxojLolglkYdoWgsw0H4tJQMb9QJ?=
 =?iso-8859-1?Q?DA7stfOKZqq+MX1lL7QVqzQnSYouwjU2B+Mw/1la1ONBljUBPsjxQkqoNQ?=
 =?iso-8859-1?Q?khGysUXBoWNCNGHdKY4+5lVc9Lm6UTOUI9i7FHcYjjI10+H/akzT7Csoei?=
 =?iso-8859-1?Q?UaOSrbi4P3AX9GtzbEJJW6zJjI9WpytdQZvnnrAnyjy7s9DgEBGwO337J+?=
 =?iso-8859-1?Q?UzX2AKfPtj0ORrtGXh4kigCuZ8+67Slt4BPdZcFNBMGTRtK087m5A/Adxh?=
 =?iso-8859-1?Q?Olt8oyCaKo1V8Tn9pnK7o5xEhrMssKxFamjBrJrBjrZR1gT40APG6Q4PyT?=
 =?iso-8859-1?Q?mKitbyf4NgL/PnhJDE+ZgPorjquXnrA6gkqGNl7O5coyLgbIndOy83CM2A?=
 =?iso-8859-1?Q?xGSQNkhtZB4WOW05B7xGUQtMPTVWfqkaZfsCmpAbxKjNWuB1bXa+wDcCU0?=
 =?iso-8859-1?Q?5eDWlKqbQcy4dq3zdWwvceuc6sjUuLh/c8isUsse3sU35OzjZc6697BuU7?=
 =?iso-8859-1?Q?VSAdPaVM+2BlAMvXrSJL0SB/MH7J5wEFj6s2/iUsJLwVCP9Yz7te4JSbns?=
 =?iso-8859-1?Q?JoVS22PK8J4UTQeYD9Z8drLzAmIcmm1PYhhbbIOpWGVvnXqEWJVrUoAJj9?=
 =?iso-8859-1?Q?4ENzTOYQIuMiQTpKqdfIxZ8ynzoOhuzroRIrQa9hqjQ//oiclngysHKH1J?=
 =?iso-8859-1?Q?4iRRdoiLFQjId03s4D5kOWS+Vb8Kk+Q0+cRNVhVBbE+lmPLFf3btexExvS?=
 =?iso-8859-1?Q?xylT6giYuFgC9SLRHApgTWhUGF+jmBKCB1YrZ7ri1DdkMn3FZtZr+LJt+b?=
 =?iso-8859-1?Q?FRb/JMPBHZDBluCgsLRq02ha5Ykpzx0hDSjaIpb2DIbdckbsxnVEBYUdLt?=
 =?iso-8859-1?Q?WKU8UAQqttkiFuK3ifglGM3ajy+19sSggzJ7e/wOemHXyopfq06txRn3YN?=
 =?iso-8859-1?Q?CQn6aSmq1il66V3biuYeuQiGQSrULPD7lLE7xCI/2p/qZX0tU1MTrSLaXn?=
 =?iso-8859-1?Q?gA+lF1qe9vebJD1NCvyqw6Lwkh1BU2B9sRFB1ARoUHPOyeUTY+h/iDojob?=
 =?iso-8859-1?Q?o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Szw98Fx81KEZUzhkSCehCvwG9MSib/LgwgVp1+oWefEQI9rMnzplicsyWM?=
 =?iso-8859-1?Q?Yrle20kZwJFs/u2RnXMNqJqv+x4Bk2nLtuwEVLTUbv8CXUGRiqF3f7ZxRU?=
 =?iso-8859-1?Q?juK37pTF0xz3wRxDcUWJ2Y8UVpJ5GN3gdYSxqrYqcWc5zHRYxxQZsaEDRG?=
 =?iso-8859-1?Q?U2RHED2mfetbqOfdEZ8juKnd1TRRXhncgOF7nNKhcxak0lO7yCDD5tKzIF?=
 =?iso-8859-1?Q?y9YodY7flgYSo8bIwZKYxtDro+7ZbR0XnPZy3WSiHVi6gzIPv+07fIcwJS?=
 =?iso-8859-1?Q?VRTRiGxDwUagGf8PWmKq+V1cp+Wnbzco1NfmOGCfvEQ9Bl6t7FWAPHMjva?=
 =?iso-8859-1?Q?RUR3rY8Bf369JE+KVUb7JWMNikL5mLsvGFCP2vu2IdM9YgxjNq5fnO0JCE?=
 =?iso-8859-1?Q?V4mfAoO/yZxQ4gkxH4LZ4Ik/1kQclMoSVVvGjcidtAkPp9aelUkzCuBLXb?=
 =?iso-8859-1?Q?OsIBjVsZ8eQ8ORkX3Q8vO0JRHBsmrr5QEUOAc1AZfoteETu3VZZS11ot5x?=
 =?iso-8859-1?Q?cy2E9T8rOBkG4gVMpuXJLxVHMPZD1fSK20wgPXur4236S5aoYq9L6RjZ5z?=
 =?iso-8859-1?Q?sTOjUHn63PHLRGVNa1sFHo5OYjG36qWwo2GSgGzHHSx/EXeuB4W1y247Vw?=
 =?iso-8859-1?Q?imgHZ6p46hSo1wdeT0gvG9SjtccyVgE4x6G2BGF8DIxoK7pNyAh3zaO9X5?=
 =?iso-8859-1?Q?PSYzg4CHPz6Tp0QVdkANrQPgCr4NND5HqQvv4pV/fHPlkJvCa5eqxuXRvE?=
 =?iso-8859-1?Q?PhgaGPjCV8Gg+D5dAgXyO55yJFCEOqdcRVHynU2WbcoLHnb4G3xzq1Z8iu?=
 =?iso-8859-1?Q?X6++rGYisXsmqKnT82JD1SwdaFnxye2MndxhVrTEngEc63S5Oyahdk5lPj?=
 =?iso-8859-1?Q?/9rZy2FhkHPxi/f6kPNM2tXX0z3wsOXy7wCb6QLxuWZ6ZSEsOWJaESnlQ5?=
 =?iso-8859-1?Q?SonjpG930MczUf44cX04sLdUOpCxANimhK3frjRJ6tkHgwNrYNneoSTfRU?=
 =?iso-8859-1?Q?HeLo7lqOsN5057HTcbFraTeMYEklhwobxPFgMCDLjE1nYMv4AuYYzU//C1?=
 =?iso-8859-1?Q?U14eiXWckCDi878DRBue8NjzarQD2lbBHlfZfD2WylCHuNLU+wvYNOkLTC?=
 =?iso-8859-1?Q?3GOBhx+D7ZC4TI479d7oi94rW2QFMIs2jNwDhsYRmXnWqf6MWGR6+b/grx?=
 =?iso-8859-1?Q?SG1f1biDKMgOT+dX28ME1KJ2N3rL8VAia5lAXw42IX/dL7jVADvMhWnai6?=
 =?iso-8859-1?Q?0Vj4BCcEiJ7mDYJNfCk+rdSv1uyfr+zaW2jarN6YtnaxFgfsvvrs+6Yie3?=
 =?iso-8859-1?Q?9HA1Z4HlnGRFmxHF0anFQhytRnS6Az8WcuvUoSoAylH9qYLXQq7U6bVh7i?=
 =?iso-8859-1?Q?TOviJgXnrbtNvz+DRgzSCrTlQS4uMRDe1J0ds/62/xHgDPThQFh0hYKu5Y?=
 =?iso-8859-1?Q?iLgIE/bU8Q3YjSZBNEdQNABq6Vg6hju0NDUWVnz0rw43uJKbNnTZN807yI?=
 =?iso-8859-1?Q?gCipYNHejsbvxC+0lJ6xVuhuNCbz7LhZSAQqC9DPiJeLzQAtFM3rGq8fd0?=
 =?iso-8859-1?Q?o3DzUUUhaXYkGDUvPtAFKtX1Th6eYDhSkQQMrXwEJlJ6H7oLuV+ysfXLvn?=
 =?iso-8859-1?Q?xlM+ZeTSX0VRvrSxyCjuQMBWVHCFMYfVlwUbvO+zvWjSG0ejsmjZ1FlQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e030263-aab8-48f2-b505-08ddd0169549
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 09:42:36.8578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GFN1Af3+cLJvb+pByZZ+Fc6y93Z98eAlLjsUMa9L/H7lh3pfGFvd3tTj65oq/2rZVNzXatQRZQdsyPXFA4dFBUKaDRicdAVxs1wnjUiAvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10524

From: Grygorii Strashko <grygorii_strashko@epam.com>

This series follows discussion [1][2] which pointed to "historical" issue p=
resent in Xen and
related to creating domains on 64bit Arches which allows running both 64/32=
bit guests (like Arm AArch64):

Now, during Xen boot or by toolstack, the domain is always created before k=
nowing the guest type (32/64bit).
For example, on ARM64 during Xen boot:
- dom0 is created with default type 32bit
- vcpu[0] is created
- kernel binary probed and guest type is determined (for example 64bit)
- dom0 type changed according to guest type causing vcpu[0] reconfiguration
  (with restriction applied that domain type have to be properly set before=
 allocating domain'a memory)

The same domain creation sequence executed for dom0less boot and for creati=
ng domains by toolstack
(The toolstack uses XEN_DOMCTL_set_address_size hypercall to reconfigure do=
main type).

As indicated by Julien Grall and Andrew Cooper, above domain creation seque=
nce
is not robust and fragile, so it was proposed to introduce extra flags to X=
EN_DOMCTL_createdomain
to allow configuring domain type properly at domain creation time and perfo=
rm further rework of
domain creation sequence to probe guest type before creating domain.

Hence, this series:
- introduces extra "XEN_DOMCTL_CDF_is_32bits" flag which is intended to be =
used by
  64bit Arches for proper configuration of domain type when domain is creat=
ed.

  Now it adds initial support for this flag form Arm64 arch only. The defau=
lt Arm64 domain type is
  changed to 64bit:
    - the Arm Xen boot code is handling this case properly already;
    - for toolstack case the XEN_DOMCTL_set_address_size hypercall handling
    updated to forcibly configure domain type regardless of current domain =
type
    configuration. Hence toolstack configures vcpus and memory after
    configuring domain type it allows to start with domain default type AAr=
ch64
    and then switch to requested domain type and ensures all required domai=
n
    settings applied.

  For Arm32 this flag is ignored.

- dom0 setup sequence reworked to probe kernel before creating domain

- dom0less domains setup sequence reworked to probe kernel before creating =
domains

Xen toolstack is not changed as part of this series and it expected to be r=
eworked
further to follow the same approach to probe guest binary before creating d=
omain.

Tested (Arm64):
- dom0 a32/a64 boot
- dom0less a32/a64 domU boot
- toolstack create a32/a64

[1] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01647.html
[2] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01648.html

Alejandro Vallejo (1):
  dom0less: Parse memory properties in the common bindings

Grygorii Strashko (6):
  xen/arm64: domctl: set_address_size add check for vcpus not
    initialized
  xen/domctl: introduce XEN_DOMCTL_CDF_is_32bits
  xen/fdt: kernel:  add generic is_32bit_type flag to struct kernel_info
  xen/arm: probe kernel before creating dom0
  dom0less: probe kernel before creating domains
  xen/dt: kernel: add assert(!domain) in kernel_probe

 xen/arch/arm/arm64/domctl.c                | 28 ++++++++++++---
 xen/arch/arm/dom0less-build.c              |  2 +-
 xen/arch/arm/domain.c                      | 10 +++++-
 xen/arch/arm/domain_build.c                | 40 ++++++++++++----------
 xen/arch/arm/include/asm/kernel.h          |  7 +---
 xen/arch/arm/kernel.c                      | 10 +++---
 xen/common/device-tree/dom0less-bindings.c |  3 ++
 xen/common/device-tree/dom0less-build.c    | 28 +++++++--------
 xen/common/device-tree/kernel.c            | 12 ++++---
 xen/common/domain.c                        |  3 +-
 xen/include/public/domctl.h                |  7 +++-
 xen/include/xen/bootfdt.h                  |  2 ++
 xen/include/xen/fdt-kernel.h               |  3 ++
 13 files changed, 97 insertions(+), 58 deletions(-)

--=20
2.34.1

