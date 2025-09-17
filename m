Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F29BB8135E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 19:40:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125483.1467425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyw99-0002EP-AG; Wed, 17 Sep 2025 17:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125483.1467425; Wed, 17 Sep 2025 17:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyw99-0002DC-7H; Wed, 17 Sep 2025 17:40:47 +0000
Received: by outflank-mailman (input) for mailman id 1125483;
 Wed, 17 Sep 2025 17:40:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZihP=34=citrix.com=alex.brett@srs-se1.protection.inumbo.net>)
 id 1uyw97-0002D4-L8
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 17:40:45 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e500556-93ed-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 19:40:43 +0200 (CEST)
Received: from BN9PR03MB6027.namprd03.prod.outlook.com (2603:10b6:408:118::7)
 by DS7PR03MB5656.namprd03.prod.outlook.com (2603:10b6:5:2d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 17:40:40 +0000
Received: from BN9PR03MB6027.namprd03.prod.outlook.com
 ([fe80::1479:e1e0:cc3f:e779]) by BN9PR03MB6027.namprd03.prod.outlook.com
 ([fe80::1479:e1e0:cc3f:e779%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 17:40:39 +0000
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
X-Inumbo-ID: 6e500556-93ed-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMFBCudxkmZF6bbzW/Nq6NQzUic1ytqzC30H4LiNgeHeu6PJqdnIEZQdsVlzXE2331qHUNteot85aVRU2Mu+OMlt/5yc41R9M2h7jHrS8NLnxFHS7Uk6UdsJ7H9PmOMAuSBVsQYmNWcwykiu1+GLqpSh3tW/p8e32499I/KRxGIWKJA5xG+c/6ox1MlwEna9AbEy4ZzDWp/6R7HmS7BYCGVW+BCy8Okbb1lQGoQKt/EYl+mR5Kz5zGyNhk8jRyS1bvADwOc/kLzgDbLvXSuziKPzdMhp3hzZiqhxZNlU9pE4uIPQlFWq0MPm5SG1l9OrtjHeCNKTUZqh/ruoXNqb9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbrb2wxqRuklyfzT+m16BmV/WY7n7MdaBKmHfR7ZfhQ=;
 b=Jm3jsfgfHZeD4/o4+C78s1hIK7A9bUpC1ACNZ9/l1D9VuIJ6ojjBSletKMvSr7PGXG2bs/ymRkRca0qtS3DUu1hlZwDY6L8U+lbnu4D+0ItLWYbRYf+uVrFgSVd893l1jfPOsL1eWPbtJQ6NKQ/pojMDY/9hux1+RtEFbgztLXsa/d9jJZ9wefpNhZZT4JcCzBE2JlmmxtPXbk2/gkuxaMlW7kBFd7I0EOTokIiYpfq5aT89dB3aE7hzVtPspHnmrU5/jN2VtMux7YWgR2A2p2QLCGBQHcWQrm1MjLPl9MKEnshNZC9iPxtp+AZAooTzqfDru0ckvuFRORVsxRn2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbrb2wxqRuklyfzT+m16BmV/WY7n7MdaBKmHfR7ZfhQ=;
 b=K8yK6f0WhqbyD8b9cEQGMvKmpG93Bb3nD+xl+69NEZGmxSmajMExWCtuSrgz1yMZBIEhrLrqv5UackpK2BmJ2EB0YOa15PvphSxZbqz6tFRzDlPh+7TKIoFZ53QYXyA/exVUcx7HLJGMVEHvFr2Yr37r48a4uvQtGTVozcyiZpk=
From: Alex Brett <alex.brett@citrix.com>
To: "Alexander M. Merritt" <alexander@edera.dev>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen Summit 2025 - Design Discussion Notes - Xen ABI
Thread-Topic: Xen Summit 2025 - Design Discussion Notes - Xen ABI
Thread-Index: AQHcJ46CuGDSzyyGzUK1N7jB9+iAwrSXpRTH
Date: Wed, 17 Sep 2025 17:40:39 +0000
Message-ID:
 <BN9PR03MB6027B98759C0D28DF2764D17E317A@BN9PR03MB6027.namprd03.prod.outlook.com>
References: <DCUSYP0Y5FYU.37Q6RNEA7AMZQ@edera.dev>
In-Reply-To: <DCUSYP0Y5FYU.37Q6RNEA7AMZQ@edera.dev>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR03MB6027:EE_|DS7PR03MB5656:EE_
x-ms-office365-filtering-correlation-id: 23633fe2-9366-4a28-4b28-08ddf611518e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?K79h4XRQYMxnUt6t2bX8Wo7819pU/mBdOAuKo6Q+i3lKVWXHrGd7+OmvgD?=
 =?iso-8859-1?Q?7xjt6QkyvdfxE1c07CCIwvnMUvuqyJ99z+NOIUcs+BkGUl9OFc09rPFj9z?=
 =?iso-8859-1?Q?BIq2i/rPTAekagGLfrF7eSOkHjn7bs1yJHbj4Ds6ttiJQJ5dt3nHKJeIhH?=
 =?iso-8859-1?Q?u8d3J65cxPoU83obJJ6U9LRdO4onAVsofFJmo3sco0hSUyms8262QkODv1?=
 =?iso-8859-1?Q?BuMBNYjk0JwSxOGtbl+t+NXJjwzON2vi7hqJxKZ3+KVgim41oIJyWzDag6?=
 =?iso-8859-1?Q?ieZqwBakgbFdvX8IP1/PDh7gPzWtLghtChK30RWLMfcRbyPNTMqe0hZWsX?=
 =?iso-8859-1?Q?3nang2+3F8GEtnquYhfyDoPO41YHs+m9TRUgG0xndESaqKkPqKJRRQyfHb?=
 =?iso-8859-1?Q?svXoqhJqG8rwZ9fNwy2EbdPLEKwdX39jayigA43eY2VEtbwsQkuPNYapGv?=
 =?iso-8859-1?Q?TBVOB1ee8qJalSTR5/gnSxtta666ZuJHMfL5hwyTueFnCId/RVnkUl3/Yw?=
 =?iso-8859-1?Q?z+bSCrtVWCrTUMU1CDSmN53BnmYb5IUCXBPh77DfCwYYCdRTzNl6GeBVF9?=
 =?iso-8859-1?Q?mST4Y/e7b9NW2YoMGgGFLGmro6K7iejhG4LFCad65jHjMI41UcM+MNc1IR?=
 =?iso-8859-1?Q?bANLhjOQNk8Zx+qoHnuGTnalNahsTtcYXYrDc/8DrMBAoAAe+JG2eVTkbU?=
 =?iso-8859-1?Q?yhtYHEEEC3YIWhno9hKTDy3f73hVszQmaS19ax5Zx/N+Snm9zVbGTev7iI?=
 =?iso-8859-1?Q?42A563PQ55QSJl5IEeEuiwyZ6pObVT0bXtVa3hjS5sgtyvgvN8nxmFYZuK?=
 =?iso-8859-1?Q?3tgW9nScQyzD+RFipr3lWs9T96yf2ODKbaEc3c+DcbdGcgbB9Ym36eP3mL?=
 =?iso-8859-1?Q?v281iPUUujmFjjMlnsyYSpUuNnwM8/sgorptcQMEgzfvouh+m1OpzWb6up?=
 =?iso-8859-1?Q?xAv+gzZOdBN6cRHq5EhVkFhr7fNqLKZImj7zGgm4NmD954oLyUyBGyvb4p?=
 =?iso-8859-1?Q?4OnIqIIMOwzsKXRmMGvY6C55mIUCr3CcHuq19qmGz67DDAFHV9odqBQUUV?=
 =?iso-8859-1?Q?GDJy3ylEbowre32Z71jO40iWXQShuF/sh+h+ahSQNEhmbMhmSJEc8uliLd?=
 =?iso-8859-1?Q?UDVV1EPDQlzQyXvlMIRsTAHalGFONzjgyjH94B1ivfTReh1/l4kLIV3VFk?=
 =?iso-8859-1?Q?v42jANQxO1/PlIrrqw74615eyK0kNabnChiIhKEQbafLWeV+4o9oFdNrxR?=
 =?iso-8859-1?Q?paHfAC3WUZVrrmdRNebCHWXvSa3x4ymSM1rCZeZ/BUxkXu0V9ttjidbU+o?=
 =?iso-8859-1?Q?BMyeZQVM6c/1OAcH/Sqk6YNKno7ZRajmQPYh6Z0JynbJwHH9+F+VO+SFyx?=
 =?iso-8859-1?Q?qOi/u+Gu5U5YTT1tMVJvtIzk0Y0Wb4wVhAurn0DKFjeiwE49tilEbZrRgq?=
 =?iso-8859-1?Q?qoOraK5ekydXfUk3BLtEuiPJbFiEjTdyOGX/GNwc4ztiepeqTNuVR/c2En?=
 =?iso-8859-1?Q?VGT+TnKIR6PNrLYui77Z+u1+denOOAi4SLQ9kqr+Mv4A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6027.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AEsqntl2rNEYtszRL8v0XDZtQdVJINR4jel7wdoAJ9UU0kpinrI7v8IycK?=
 =?iso-8859-1?Q?gAMLSdnhbKPWxxZrO/6YvUC9RW0g/sPAtgB18BL17V3YfsD0fgAgjMr2Ed?=
 =?iso-8859-1?Q?9Otd5hxDGiN66k0bRBrqnxBMSzTdSTBeIBbXaQnY8nkii2Aop95FcmYc1Y?=
 =?iso-8859-1?Q?dB3tuocyBvZRvKUQcH95Arxawgzz7zl4ApEW1UkptaTBe3wDyRfXZCDrw0?=
 =?iso-8859-1?Q?zHfHFph1FuYUIXs5AHKbSzYAYd/wm1tMctg8vHfSDe/SaCYutIfFxSOylD?=
 =?iso-8859-1?Q?Ak5le6lKomY88qq+rzgZZ5cajDz6n7BvIbGfdz0/YYwH4+OFQoEByjGt2m?=
 =?iso-8859-1?Q?slzf/8712PSqt9ImDU1Rm1mso2z+3LMZ3qi+GzgbRwx3WshMTFPM+1QoWL?=
 =?iso-8859-1?Q?rHlVriaswtr5ngy0CTPy5ziSWJRNzpAfuUWmCOHed9oNt2YhUWjnnNRW/y?=
 =?iso-8859-1?Q?1CHSePfFllfLOuoenndNCDHlMpfjACEP1taPKD/Jrt27oH0Y+9rxosNs0S?=
 =?iso-8859-1?Q?MPSQwbCLweRhcXMHCfAwcYbDD5VdwqPNuNxJNkuVloMCPBrwRXJzovm2Fy?=
 =?iso-8859-1?Q?h9VX3+tnD/1LqHiZD7AJWDrclhnX7P+4Eu7PqjUvfed2vba0NXzc5+iYJ4?=
 =?iso-8859-1?Q?o74zXAUFc5gAGQ/royk/PxdvEjo7M8cvV3NEs79X9fG0kSp6pWYXntLrwv?=
 =?iso-8859-1?Q?qXDR+J/zIY9I2SCO37uZUN6O4ArvuDspx3rbkaLhhNDtKF+Zma+7hJMDfZ?=
 =?iso-8859-1?Q?fW7+nyj0+QMi8YQiGRKaEEi2aG9/ZnuXNtJCStTLqYiHJa5TBugYTWCC0n?=
 =?iso-8859-1?Q?iC3GnMF59qgwqNh7boKdl6sKR37ATTF+9EPysjErMRB599nXFGH5KVgfHl?=
 =?iso-8859-1?Q?mhPOXShctffy2javgHfWaeAHAP8CmH+3ZbWJ/X8YObx/R01uGKFbfQ6+Hi?=
 =?iso-8859-1?Q?3fKMJhI9Wnf1B1m2bj3lEPAtYnkHFESc7dZd36YgCAzdnDKfFbR6LfZgxI?=
 =?iso-8859-1?Q?QMtLxFMKQf5WNQR3V0Pupnu4JARVE/ZfXW2Xvx5apjmA9oTUSnSU1BPTF0?=
 =?iso-8859-1?Q?PTZ5xIThTzouLMc6P9e6EMqI06f2tbv5QGXFHq9nBsWpCBcrFjKRwaBH8P?=
 =?iso-8859-1?Q?bmAcPQzlYI9uBKkNIzeQOOXR3Iaow27DXXT4uwx7lO1AaXcT6daNyD4QGQ?=
 =?iso-8859-1?Q?r18m8hiN7TPr1MHPd4lq5kN6pgWphCuoYkH2ACuNtjw3wBqQBMh6iPUEyf?=
 =?iso-8859-1?Q?WXdUZZ2dHeYGGe1CfoSTWtU3ZFIWxqZzia/egqZ4YtVX6Q/bj2ZlpVep7Q?=
 =?iso-8859-1?Q?eRh6FoK9zmhBQk81OP68Rdz4Zo6EdBYccrEODUEBFUS7e3G1vhprg2BHJf?=
 =?iso-8859-1?Q?8JoM5mjSA4GSv459SydwP8iT7poCFizN4Z4mu+hSgXqhICKUE9BFduBKkW?=
 =?iso-8859-1?Q?H0B1OX899ty+R484UEbOMMr4eE9qgNq7vxtqpD867h3MfRPxyFDtqsDOB+?=
 =?iso-8859-1?Q?bWFqconfVsdmo5yXjB0Q3dMWHQeBusZbdMgqwTA0ECp+LvCgfXtgf0iL4e?=
 =?iso-8859-1?Q?G8FgxE0K+I+QVveUhviYlsAijlBC0o73jC/tLZIduUw+vHYjeMIOqPVpwS?=
 =?iso-8859-1?Q?svTjT6fH9XSqysuoFc3soAUtzHF67VJ7B/?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6027.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23633fe2-9366-4a28-4b28-08ddf611518e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 17:40:39.9085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oJ+91ZM2pkGbrO616uArnLP9vbA0dx3uKImltOYEdiocVFOw04RBVZpabru/2NHdysVMYHZToV5qtscOiWssIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5656

I also took notes during this session - as usual apologies for any misquote=
s etc:=0A=
=0A=
Christopher Clark (CC): Preparing a collection of docs to understand the pr=
oblem space and what we want to achieve ahead of doing the work=0A=
- List of API/ABIs=0A=
- List of known limitations / issues / concerns with them, indexed back to =
the API/ABIs=0A=
=0A=
Andrew Cooper (AC): Previously tried addressing some of the issues, but add=
ressing only part of it results in a lot of the feedback being "what about =
this other thing?" etc. Designs presented so far fix part/some of the probl=
ems, but not all. Trying this time to identify all the problems before iden=
tifying a design to fix them.=0A=
=0A=
First enumerate the APIs and ABIs that currently exist. Set of problems not=
 apparent when you just think about API/ABIs, e.g. people think it's "just =
hypercalls", but it's not, there's things like enumeration information. Lon=
g history of bugs due to Xen originally being a monorepo and having forks o=
f kernel/qemu etc, so many ABIs not properly defined/enumerated. Also e.g. =
initial state of vCPUs is an ABI. ~46 hypercalls, but around half are speci=
fic to PV guests. Hypercalls are the way they are as Xen started with x86 P=
V guests, HVM guests were created by doing minimal adjustments to PV and th=
us resulted in lots of legacy poor choices (e.g. having to walk the guest p=
age tables).=0A=
=0A=
Other examples:=0A=
- evtchn_send passes a 32-bit pointer to the event channel to use, rather t=
han just the event channel id.=0A=
- hypercalls have a shift by 12 assuming 4k pages, causes problems in ARM=
=0A=
- Changing the version of Xen breaks userspace (intentional choice early on=
, but causes user pain) - unstable ABIs are killing Xen=0A=
- Security patches nominally/officially require rebuilding userspace (inclu=
ding qemu)=0A=
=0A=
This is relevant to work like host UEFI secure boot (introduces new privile=
ge boundary - admin with root in dom0 can't violate the MS defined boundary=
 of not reading/writing arbitrary memory, hypercalls work currently with /d=
ev/xen/privcmd which entirely violates this).=0A=
=0A=
All problems compound, want to look at all of them before figuring out solu=
tions.=0A=
=0A=
Bertrand Marquis (BM): Need to look at problem discussed yesterday - how we=
 create/configure a guest (two ways currently, dom0less and xl), duplicatin=
g code and configuration format etc. If modifying ABI between dom0 and Xen,=
 can we have a coherent format we can use in multiple places to solve probl=
ems like this and prevent duplication / reduce required hypercalls to creat=
e a guest.=0A=
=0A=
Alexander Merrit (AM): Regular applications don't make syscalls directly th=
ey use libraries, is that an option?=0A=
AC: Xen has libraries, but they currently need to be recompiled every time =
Xen changes=0A=
Jan Beulich (JB): This could be solved by having a user library vs the libr=
ary that actually calls into the hypervisor=0A=
AC: Libraries currently all C, would like libraries for other languages tha=
t are stable. Need to consider all these possibilities when designing a sol=
ution.=0A=
=0A=
JB: Concern about taking a global approach - will changing everything in on=
e go mean we never end?=0A=
AC: Idea is to come up with one global design. Parties have specific intere=
sts (e.g. XS around secure boot, Vates for SEV) that will lead to implement=
ation, but we should agree the approach up front rather than having people =
pulling in different directions.=0A=
=0A=
JB: Could we deal with e.g. the hypercall problem up front rather than havi=
ng to redesign everything else at the same time?=0A=
AC: Don't need e.g. function prototypes, but need the broad strokes agreed =
to ensure things don't diverge later on.=0A=
=0A=
AC: Important to ensure backwards compatibility (can't break HVM guests)=0A=
=0A=
AM: Is the problem unique to us, or are there historical references we can =
copy?=0A=
AC: No one problem we've found is unique, but there's enough overlap betwee=
n problems in different areas that we can't take something off the shelf=0A=
BM: Potential problems with lots of compatibility code etc - do we still ne=
ed it? (Room: Yes)=0A=
=0A=
AC/JB/BM: discussion around whether to use physical or virtual addresses fr=
om PV guests. Currently made HVM consistent with PV, should it be the other=
 way round?=0A=
=0A=
Rich Persaud (RP): Unlikely this task can ever be completed, but any work d=
one will be very useful to people after this task has failed. Xen already f=
orked once (Bromium), other hypervisors focusing on specfic verticals etc. =
Xen is last entity standing trying to pull all stakeholders together, uncle=
ar how long this will last, but the products which will last the longest ar=
e certified items, and whatever snapshot is taken at that point will thus b=
e the things which last the longest.=0A=
=0A=
Andrei Smenov (AS): Can Xen and guest negotiate which version to use?=0A=
AC/JB: Not really, can be multiple instances within a guest (bootloader, ke=
rnel, kexec kernels etc). Another example OVMF coming up to do boot service=
s (blkback) load a file then handing over to the kernel etc (can leave shar=
ed info page in a bad state)=0A=
=0A=
AC: Shared info page another problem by itself. Layout done with unsigned l=
ongs which change size between 32 and 64 bit code, so layout of shared info=
 page changes. Different vCPUs can be in 32 or 64 bit mode so we cache the =
mode of the vCPU at the point it makes one of two hypercalls, so final vCPU=
 to crash / go through kexec hypercall will change the format of the page. =
Something we need to address. Whatever we provide must have in mind aspects=
 like this.=0A=

