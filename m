Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BBFC70CFC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 20:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166355.1492914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnse-0002gW-Ol; Wed, 19 Nov 2025 19:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166355.1492914; Wed, 19 Nov 2025 19:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnse-0002cW-Kj; Wed, 19 Nov 2025 19:30:16 +0000
Received: by outflank-mailman (input) for mailman id 1166355;
 Wed, 19 Nov 2025 19:30:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GacY=53=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vLnse-0002Z9-1a
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 19:30:16 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bea38ed-c57e-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 20:30:14 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB9PR03MB7690.eurprd03.prod.outlook.com (2603:10a6:10:2c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:30:08 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:30:08 +0000
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
X-Inumbo-ID: 2bea38ed-c57e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feqDyk6P4heFKV/K+PijOozUKe2/WI65zCFcuv9xf6fvCIkHbhFBTOb1a5HfGdyz7MJWFu7puGbi8WqO26+7egh/shONoY3/ETggT+Ctyy4i7U9qAMX2H0zZpxDYrMuVI4sYNKcsoGDWl5nKrgAIKvOYn24cXme7lJ9I7JLhekXnp1sEjLdi0GKtpBoA7atS96JyEUyglT+GvdHQARg4MMMZS41SSYjd3efCJr19U/tl8Kd9/usMiijs+02oQkmMwgUXBiw2vq0vWY71yGqIjxPpfQri0HIJjaOWkSOWVl042BQtpGMtzoEvgVC7iIjDPffmsKwGU2AZ5di4L7A1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jR9H82uqN6Pq4sjQFVnEVcGPJ2uolsJHWh6buD+pW0=;
 b=fBBfIvdAJeiLiyZAKTUZce4f/HyBz4nCYcteGZqq6f2D+upMtX7OgKHgykml4pSHEszhPQmbX22Tflg6hzuM4e60ekdcgntBUYO9qLxqYYzKCXbLTNnKeW+kuhU2XxiZYzXCnEcMdS3Mf4iJhuPEi9SxLajCTL4Kic7JwSUmbIQgmVx2TtBpVgxz52GvMqAIjl2c6xME4RHVntpgOBb4vfyKNkxhKOruI39C1YxiS9mgrNyFx8f8a9+iLjF/eLKaoeMd+2OQ+HENcj5e7NX1mtxQ39HdDNv9gL3IH+4Pblfus1LqY7avs6YdzrNE2Z5GERWRVhMXVdWUIfo6++v0+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jR9H82uqN6Pq4sjQFVnEVcGPJ2uolsJHWh6buD+pW0=;
 b=UDDgVCtwIfMNgkVBwQnTY+65oJ+VttF5jgbfj2hHq2ko2wFJB6RRUVXJbSbZ6mseFKOuI0Hmty92rKe7LTSr1yF28/o0ozUIFa86gPh/R8KnwgJ37RzP060uTLM4Ibd1ivpbBgrnlihQv4HTilyIkwU+0+mIUePF1CZkmy52L5xGBwSzP0+F35O/7fFbzLt9P1GC+5nsdi500M6GUUZA3XKG5fJ2gelMKc3zJXMe5zxMSHK2IVWwLNfgCGliLrxV+8lP8hB7CJqDB49LqHuYrOZqbz5bLSbEpWSCk/eXqC3X7aNk/OyOdRcwotCZJVVmm/46CBnz+whInj348RNcJQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN][PATCH v2 0/4] x86: pvh: allow to disable 32-bit (COMPAT)
 interface support
Thread-Topic: [XEN][PATCH v2 0/4] x86: pvh: allow to disable 32-bit (COMPAT)
 interface support
Thread-Index: AQHcWYrqEdLIdxgHq06iG/KRChB4+A==
Date: Wed, 19 Nov 2025 19:30:08 +0000
Message-ID: <20251119192916.1009549-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|DB9PR03MB7690:EE_
x-ms-office365-filtering-correlation-id: 7fcc194e-186d-4a31-3b06-08de27a20ccf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?irI3hVksnb9E2WANveVnzmJ+7hT/F6SDNVpVGIvJVuwK2WNAOXs7CQTZ8+?=
 =?iso-8859-1?Q?qUVzcZCB0GGQdh5wx6siyIT3xC6mqfCGjA19dHUerNeKzT16r/qSwu0E4b?=
 =?iso-8859-1?Q?t7yIlLHzkO7iD8nvrE93wZE9SIk4XJJQvuySnAZs/tYcJ8UslxBMZfkyH/?=
 =?iso-8859-1?Q?bo5SCZRO5h/ixnb2KQf9ToL/Afv+9SXlNdDiJllHn8k6Qj/VzhoA5sZlcv?=
 =?iso-8859-1?Q?vHYj8MeIX9ZjTn49maHYEGUKj9Z6//PQO4WDeaJNUZCVzGjsY3iUowgOHz?=
 =?iso-8859-1?Q?vP3gkwcHwc70OfJsJNcDRJ8dQR56OqhlnjNccl7bm5wQtdF/za/rrDJFMo?=
 =?iso-8859-1?Q?nsC48DD0wu0ea9tU3FpHbRK6rw658ncU8WzZixB62bM5nPugvYnNHYtmRV?=
 =?iso-8859-1?Q?32Su1pKnqIMrFoPGo66hO6rKXPYRn3IXsEDnvlu4k08SWuLqfLIZU8Id1y?=
 =?iso-8859-1?Q?lJGKiY4L/zK0t6dl4vALTIOLX/c0AfOx7UlXVZY44Rx0ebut2Mv5L/Wz5H?=
 =?iso-8859-1?Q?zq3rMSFPPzo7m5G7n/um+HJaZRJ+8SUUA7qVRrIgOTyxeRHD1JhypDHKLe?=
 =?iso-8859-1?Q?V/ZGzm+y76/220GdPopaGsAHcejtalzYPQOvorULD4aWO4uJqq85IQcCjp?=
 =?iso-8859-1?Q?8fPWkVJ+VF3TWBQwc8WXSUOiP9pcbBCQhOzP9b4zzLEx5aBF8zhggfySU9?=
 =?iso-8859-1?Q?0N17PXWdGss3e1U5DVo2veUxUjfsd9KHLpJjMiFSNbtKp7S76DuAdK29o6?=
 =?iso-8859-1?Q?cZWcMl/MSU/DC4zAX88ex+Hdwj/dXOsZbJrWsL5WcRN2HOoTS2hQdJMBUA?=
 =?iso-8859-1?Q?79ikd5ndPshrfDD4wUsJr/Gg5Gf4pZzrM4+Y1qbnK2Prj7E6yqfTqFfKSd?=
 =?iso-8859-1?Q?5Zzj8AktHPpIdEc/BqD4JojFkcNGgK67dUTYri9XfTMsmdcSRtmGj39OxX?=
 =?iso-8859-1?Q?1bBk4GyjLwXpkYIpJjo8fjWd2I7pjC/pgpjS4KUoCQ0cDF23tzrPcIrITC?=
 =?iso-8859-1?Q?KTke6UGXYyFvblAf4EnjakdruSXFPjNik+NH2kohIPYeF9ETKhrWdy+RbV?=
 =?iso-8859-1?Q?cjJ7SkqoClXUz7gReKnnLsx5DHPrOWbkwowA73oBbc91I8F9IZiX3S2hqA?=
 =?iso-8859-1?Q?I+V71fgy16TDAJjEgUmrCoS0QWfNkqy0kdJ+As58XR0Zeo+lZhZJWh/dfY?=
 =?iso-8859-1?Q?+bBeQFGLoltAtXPFrr9cTNp2kO1Aswol5odkqTVD/g88e9UmXIIjisZ2ba?=
 =?iso-8859-1?Q?PeelYntVdxTmTtu0P7gQGD0SSyqTAuWwt10871BCrVIQMXSVfSAU7kcNcM?=
 =?iso-8859-1?Q?htr3l9EZ9nUzUbDwbPdbjNH3Wx8u4SCohOv1Jyi09idHODzWwKrDfLmyG6?=
 =?iso-8859-1?Q?FyMtG0JYkag2XcF8tuPH+xEnVt4RGEHaXWtUpYrAZsJJZmNMLN/qc+lGC8?=
 =?iso-8859-1?Q?ffMu2Bh3oT5uL6WO8rbmRtJim4SETq3fPjHFUyt/PZYq71oReXweyu4Xld?=
 =?iso-8859-1?Q?bjEbForc52k8QYmMWcwsZABCTn3ZYbUfdiFQdoa/Fs9s9nzOyq+GLHMa4+?=
 =?iso-8859-1?Q?QwjIyHrIyLkFfrYnF5mN89JE+vJR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wLcwTYA4UsP74oNmEw37b8GkrqWp4V4f5TSoNmzB6H3hQkvxvTeQpX1qoL?=
 =?iso-8859-1?Q?E8jWRLcHhWk0OwdGmnbyRT9L6JOpf4VjFnh6rXZR33nsWwtS5xVvuJkWPC?=
 =?iso-8859-1?Q?So/PxKMT02Y8oin8DSVfV26zIs21H5DSN9GKDwKz0NSybeS5peSLwvoFYh?=
 =?iso-8859-1?Q?N1iush+YaQw0zoEFq9W2epWUTOv//PoXpiiD0s3OtATdNm6yh5VWROWlQ+?=
 =?iso-8859-1?Q?p7iaObMZrPwWhOTsb8sMXcm+XPygJdHjW4sAWnec9AUnAsC2GQULXuRzuN?=
 =?iso-8859-1?Q?LNXXZoqYPgXHLk11S32wte5K2iR1X7ep6WqFTH0fdhdVk82WHXauIdADVB?=
 =?iso-8859-1?Q?TA6eEHRt50wnmnI7xeb5Vldqtolwf+tiMVzIv7FUj7Iz4EDQNHbUgEe3W+?=
 =?iso-8859-1?Q?Zy7qn/Q9lHdk7ywjlBAhe9pkfAVdwCFk52GGPajGBy00v3FMolIQDnQdFk?=
 =?iso-8859-1?Q?DQsODdecrT1xdCj+Gf7QoZSs/F+YjiD3I3N23wPOX3IORKT+1jUQWxuGzr?=
 =?iso-8859-1?Q?gS85HU0NKzOcBfKgkFacmD6Xjps2fU7wmPrbioHORG0YH5NTUBCGvgHK5U?=
 =?iso-8859-1?Q?xfZQQAeK5gI55mtmrNVtoEuGq/T92LXPIv6MeyuzjwMJn6RZzFAQG3Z2Ld?=
 =?iso-8859-1?Q?DYABciiAEFDa3kOiGWI65doilQfKkNjYQIL34fSLv0ZVEMBMOsh+iujyEk?=
 =?iso-8859-1?Q?4Bte2X8w8FpK+ZWbb+DjbbYZTSU27QyygASboA2uJ7/82HiEm8gILKNN9Q?=
 =?iso-8859-1?Q?yDjb7VkqrHaMkVCtZbMWDvBTNriGkyasn7Py8BuTYGNF5UKanLgGN/1my5?=
 =?iso-8859-1?Q?meonDePfm0C/pSqFSIFrGZnoikgMzp3vvtokhJr7fjm2e6FAu3/9wOyGJV?=
 =?iso-8859-1?Q?GsNCdZlK0+p8evg+2MVUbqLKXqmizuuPJoDqxtovmuB/oLMKR76Zm7TBjy?=
 =?iso-8859-1?Q?ssGLlwLURIGNZG3vQzoszB62CD6LCKckRcB8rWohAgNeIfdCqVP4Io1jk+?=
 =?iso-8859-1?Q?Fdw8r4v0vxhAbOd14ID/973oB6zBsCADxhWIcBI/C0aO3ZjOuTSW7y7cwk?=
 =?iso-8859-1?Q?Bkf7uJ+vaRw79DRI6XQUCrnkTx/GVzVKlQhmB9XvbA1O48SDUlGSdpx3eX?=
 =?iso-8859-1?Q?IEEN298r8YagPh1tV8V79UN2HJIid1BCPYDzo7lLwJm0iEv0lQaHf4kHtc?=
 =?iso-8859-1?Q?KhhkBsCiP/5KAV1DsSU/Wdquhw0VAKat6KjjUcuSLsV8zjrqnbA/qAvkBq?=
 =?iso-8859-1?Q?ZZ0Ct8GEZlEbbSbl/DydJvc6alZiakh/NOoCuWDlmKYO7JsJ71fiqU6A2i?=
 =?iso-8859-1?Q?b2j5q9DKWr8ax9xFGUWhTyax16hKZcn5N3ZnuZrOu9cRmJDZn2gLGSolOX?=
 =?iso-8859-1?Q?PBk7TpUzgUX6xZqQ++Mlo6vCUOWGjyXQh5ieAO39Dvyd1LXzeUkdIFDbEs?=
 =?iso-8859-1?Q?XLLoFaCkj2BsdS8jbKOA13lG0AUTWaSmUFmh7vzqZ8iVjsyFpcgRC97ZQn?=
 =?iso-8859-1?Q?1hm9Rs5oedh2E7TJqSKZmjntPbs2fVqLHm/1I6axUGWxB4+gS6mmh4mlW9?=
 =?iso-8859-1?Q?QXwu3dwvDv/7MDC22EtowiyLqC4eEEwexKWBKr4e9/WooTrz9GFAWRoqSS?=
 =?iso-8859-1?Q?fclueyGXZXazLSC6LLT2bwvmrG//LHRWTRtW/Knk1fqICSnlK8s2htHg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcc194e-186d-4a31-3b06-08de27a20ccf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 19:30:08.5844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zFXxTYSuGzbwPBg6WbhPQkImVLYguyrD3Fmh5cbHedni8Y3BmsCC5hAqY7frarvaESN2/uxkckAyXnftN48ysy6wIQVwQQQ5WJUZA//X73w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7690

From: Grygorii Strashko <grygorii_strashko@epam.com>

Hi

This series introduces possibility to disable 32-bit (COMPAT) interface sup=
port
in the following case:
      - Only PVH domains are used
      - Guests (OS) are started by using direct Direct Kernel Boot
      - Guests (OS) are 64-bit and Guest early boot code, which is running =
not
        in 64-bit mode, does not access Xen interfaces
        (hypercalls, shared_info, ..)

If above criterias are met the COMPAT HVM interface become unreachable and =
can be disabled.
Coverage reports analyze and adding guard (debug) exceptions in hvm_hyperca=
ll/hvm_do_multicall_call
and hvm_latch_shinfo_size() confirm that COMPAT HVM interface is unused for=
 safety use-case.

Changes in v2 described in each patch:
- patch "x86: constify has_32bit_shinfo() if !CONFIG_COMPAT" squashed in pa=
tch 2.

v1:
 https://patchwork.kernel.org/project/xen-devel/cover/20251111175413.354069=
0-1-grygorii_strashko@epam.com/

Grygorii Strashko (4):
  x86: hvm: dm: factor out compat code under ifdefs
  x86: hvm: compat: introduce is_hcall_compat() helper
  x86: hvm: factor out COMPAT code under ifdefs
  x86: pvh: allow to disable 32-bit interface support

 xen/arch/x86/hvm/Kconfig          | 19 ++++++++++++++++++-
 xen/arch/x86/hvm/dm.c             |  2 ++
 xen/arch/x86/hvm/hvm.c            | 24 ++++++++++++++++++++----
 xen/arch/x86/hvm/hypercall.c      | 22 +++++++++++++++++-----
 xen/arch/x86/hypercall.c          |  6 +-----
 xen/arch/x86/include/asm/domain.h |  9 +++++++--
 xen/common/kernel.c               |  2 +-
 xen/include/hypercall-defs.c      |  9 +++++++--
 xen/include/xen/sched.h           |  9 +++++++++
 9 files changed, 82 insertions(+), 20 deletions(-)

--=20
2.34.1

