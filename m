Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB70563EB9E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 09:53:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450289.707576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0fJR-0001ku-Lp; Thu, 01 Dec 2022 08:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450289.707576; Thu, 01 Dec 2022 08:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0fJR-0001he-Ih; Thu, 01 Dec 2022 08:52:57 +0000
Received: by outflank-mailman (input) for mailman id 450289;
 Thu, 01 Dec 2022 08:52:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecKG=37=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1p0fJQ-0001hK-7I
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 08:52:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c0ff30d-7155-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 09:52:55 +0100 (CET)
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB8439.eurprd08.prod.outlook.com (2603:10a6:150:ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 08:52:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 08:52:25 +0000
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
X-Inumbo-ID: 8c0ff30d-7155-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XydNvFx5pbA66zMVqNoFOut5WtAxgqOYNhTivA1jWdvdeTDLkHUX18YXm8TqL00qicuBwa/dp3Bc8EUmKrf+gd0ZpZSkHooJAxypnV5anDgYncpujErnfGjr2ssxExgmX91fBESJjdXjgNGju9thkSyl/GYxE+COC0P0EctShBn9DIqxR4pMFIBRmMi5O9hmZxMfxYHUKMjAgm7vaaDj1OfPU+kI1DJYrHDkSY/Vw7GpnY5V8MCoRBWvooeSCZnfxwAvUOjlPklOMHU83tRJs5cNm5IF48jN3+5YVqlSYifoZPXTcVeUtm6vxARveP9CL2+KOkG1oZPjfSRe/DnP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ry8aIQFsYD5zw2guxY3LkcXgZB9WbcfDbCo9iDWmyKQ=;
 b=EuZTKSaPLok/RyedGaka2Fvq7cgERfs2Rla07SNb4kOmjwW0x7hE/l3x8RaheHNhOTeP+Bkd6frrnXiM27+F2zBoaVnsmPfTwRj/JAmzB13/SZtwOzrSqMgkIiWLdfAoPA0xge6dOMg3L0NsHiy1fZ6Cd2VrmJUKdQysiozXkJt+bR9RkomlnDP2zUuAXDpw/xH1/KtGozj0aaVNj+s4KKNKnJWQdtRbF4pM1By77DIXTp6CpZfvbEuRBx0bWKbPBM6ZyDpw/tlsQ5KorX5UASS12L6wGe26s3y2d7FqV5YLEnUFnNMam0lRz8E6fzC8QvezdGbxuYASZuki+/YJEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ry8aIQFsYD5zw2guxY3LkcXgZB9WbcfDbCo9iDWmyKQ=;
 b=64jzheRaFSWVcD1HXCZytkNilNinto3YzOgTmNOmPOhXMtbRw8Roy/WE2kuOEdrH+T5N6f+4+RPLixuAC+dwgSyc+zA9xD7WcYsmGDG3eQQJjOUgf5Ty8LPj05CgUbSGO3MQopzMu8xcR3doAlbQNQbUoyPdu03DxkfHHeF2m+0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: Re: [PATCH v5 0/3] Yocto Gitlab CI
Thread-Topic: [PATCH v5 0/3] Yocto Gitlab CI
Thread-Index: AQHZBLWAGwGw6fltyE6VAxC7RJU5cK5YaY6AgABRfQA=
Date: Thu, 1 Dec 2022 08:52:25 +0000
Message-ID: <D730BED6-4964-46A3-8BFB-4519B87CCBAC@arm.com>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2211302000361.4039@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2211302000361.4039@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3784:EE_|GV2PR08MB8439:EE_
x-ms-office365-filtering-correlation-id: 1d46f8e2-5503-4f77-3235-08dad3795e72
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OVkf5xAgmM8MhDtezsfstoOlgIQB6STnDw337fxJOXWTKEkwvY34LIEuIRudKKbhJoL9OUVJbIue3iXg4ww6gH+B2hnjHK13WyCNyYiHbQt03GqP8/xiY04zYvRXngNy2APKmXFz7TDVmeNK7M2m+VoC0YJ1eoDWkvj1FoPKh3+OGQhQNYPCSO0P39GKIIERTSJioKK6AAoRr1+E5VAqkLv3i6y6UtatUAf50gIlbnTml8bA15PYQimuS+79cgFfSi1pZJvhb+N/7hYpzRTTwr1XS23ajRO2WJLGhkKUQ7ToFBI4jUpBD5EAWMDTOI4liTfUvwFVYpUwi+GwCiai5hsR1awRCeu2WS2LyjENnLeK4W+mzDMLDfe5U8uu1KluF4/VyBw+N5KjQZ1vJbFmimqKA3Kpi03hHWN3eQSKdTzDoLsWGMDsD5sxs+T2bMtL/lPIvALg0qZ/dfGak0euet6vsejHFlVdDf9OnKPvTHXJfalGkChyedrpcOttJE9FaL3bIYz5KvVdSdX4UCVNEv+oqM1BjjD4Yoa1d1sPZ2VKApk0V4MK+IPSGpnPOZS2JBUihGkxt5X6bj0cfObBtqltY6wEdY9M6ArBdkrIYckcolLnKYqPRC3EyK/IN9CCkrwaS3vLTgWUv9ENVRbQXtYmdx6mkLeaHw59io5C6A7QVXGWlRiZ9dcsfSNa72z+bKzhWeYBs9sCwc2cXl9TDQVfH+bsr/Ax5suZGstHpFM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199015)(54906003)(6916009)(71200400001)(316002)(122000001)(53546011)(38100700002)(6506007)(36756003)(26005)(64756008)(41300700001)(2616005)(186003)(5660300002)(86362001)(4326008)(66556008)(66446008)(66476007)(8676002)(6512007)(8936002)(66946007)(33656002)(91956017)(2906002)(83380400001)(76116006)(6486002)(478600001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ld7X2/XuSEXqI+NcPYfZ8lH7gzClVytd2Kfv4CfrAtN6sbPaAJdpwluifoOz?=
 =?us-ascii?Q?+3Ur78E/FsqJktineBmEYaS/LYp7AKgPC3bvOejUv554WWySacwh/UEl+VMU?=
 =?us-ascii?Q?uEk4cZFE9aeKir0yf4LPVjDIoxUjTqlArL66E7fLVkKNIYZOCw+nZedk6cy1?=
 =?us-ascii?Q?3+4NvVvO7Fi+V4H4IhV8On1wvIpFcPjLbLLxGj4VIBN0d9w6/Vz6FWbuEf5i?=
 =?us-ascii?Q?jTttLRKdaB+FH3jzmbWMi1nWcRwTUe6iUviWybz4140iJlsSPEVWaT88JANN?=
 =?us-ascii?Q?X1UHrQprPJaSnMTBCo9a51vSQcZ+mStnEB6seeKKqdd7lxfmQP/ZWhTKE7EH?=
 =?us-ascii?Q?sZYLU1cvNInq+UK4vkSA3BUdHs7XW6uukve3WuwJjGxhfHd2ffdMpAb/tewo?=
 =?us-ascii?Q?hgIChGaYDwi4SCFkyCEBpYY7+Y3SKsaFC+YPtD3YbvkjV+sH4hwYey4DWygQ?=
 =?us-ascii?Q?Aeo8rVDJFsxd4/U86Q8+6LhhokF8qRYwFFFXzH10b+UWwQAz95WBVNmw10tm?=
 =?us-ascii?Q?A+QRa0o8tdwlD0CvCzeo6/DWQj5zuF04CSzrJPMusfkynxwbcxab8/x1jlLQ?=
 =?us-ascii?Q?o5jEf7TZZPOIo+THVabg9EdNK442f3PEX4tKjEo7FFKmODyQ0KfmZF8s8TOx?=
 =?us-ascii?Q?NhH9K30h1fqBNJxD9qL3PJCUBDbl6rNa4E0WV2p+f28MhyJ1RWqwPUfeYZhi?=
 =?us-ascii?Q?RghOtv6H1Pz0gt6SvH056vEa4vNCAUHrN/ukNoEopSeq32arqnr7q+tX/qsr?=
 =?us-ascii?Q?746Vsd0qAZgRMZaCG0peGGYZkbIUEwAkLwz3AYILONjD6u8MJ7QNZmyNo6vw?=
 =?us-ascii?Q?pmjp0uqTRyoCqAq7hzw8IwO1QuCWzZzuTb1no0DawqlFUNoGo1rO18LGBT3Z?=
 =?us-ascii?Q?9r1NEBo3OAXpJ51lryA0yTMSBJiiXYtpqgH+Pslt8e4kruuvXU3hJOpqZT0f?=
 =?us-ascii?Q?vxQg2Rxkngn9KVvwdADqF7pHzL6Tvb44vvHpzALVJyGNA63La8n6AXKYkqAA?=
 =?us-ascii?Q?3sOfWqvAuupGH3m0iXvmuwRURHsV8REuqdN1na6GNDI5kGpeoP3A39RjPXZi?=
 =?us-ascii?Q?A9Nq5WQAKhP2Gjese28ff1hRllvuRjDjzZiN7CsCKy+dMiczzW7r1IJR/zyo?=
 =?us-ascii?Q?HrwC9Z0iML4k7QFadVZji/0n3eA6wtxy+ALg+kgBj40jHDUetlkbG2xsKSny?=
 =?us-ascii?Q?P1zQy7qekF9+pBoOCBwwB392A02fo8YG2rpdYkOEfAyRu/Y4L8i9uX0e3Ycu?=
 =?us-ascii?Q?0hXAjSyvmONEnoBYc58V8SqaNRgyBUFhxsP2qP1kz+SFdq+gCyXI8hcnSQnf?=
 =?us-ascii?Q?zk0ZyYchBq9NxJ0ttu7XSV49XY8u3SiuRAZ7RDTTk1N0QMp4GEG/xEHwm4S7?=
 =?us-ascii?Q?Bhq+6Zl0TjTlKPh42yA5dZhVVT8ZccktOphwbTTD8DpIsWBWKfBBo2A4h39J?=
 =?us-ascii?Q?rKfE+MJ/cyUECiKvGPFbVvUyflzzgLhPlv7L32VMTUI6i/ALYpawVj2Ycsz4?=
 =?us-ascii?Q?lMdQCu/2wDznKS9Yo2FaSyP1b7yYPhGagkGAqmZUXpZJbn51C7KiH7NrJDqS?=
 =?us-ascii?Q?aqJfkcn/FAiUDA7FHPS8+moOLOw1Br/BHRmWRwH8u7UcDcn9DGzg/t617h9C?=
 =?us-ascii?Q?3g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D9BDCC998C37C447A80A3E5A6060F850@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3784.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d46f8e2-5503-4f77-3235-08dad3795e72
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 08:52:25.5079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: golGbcBnfpzW+UFl31uJz7D49RlCSPe/x0OtP6gZ5OyzoEj4GxBYUSW5W98lWR0jgOaT8ChvYzfuQlxzF+6ifx3VuQcvXO89CbJvId/GeEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8439

Hi Stefano,

> On 1 Dec 2022, at 04:00, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> The build of the qemux86-64 container still fails, logs attached.
> I tested the full gitlab-ci pipeline for qemuarm and qemuarm64 and they
> both succeeded.

This is actually because we build 4.16, this was fixed on master.
I will enforce to use the latest version of Xen available.
I will modify and test that today.

Cheers
Bertrand

>=20
> On Wed, 30 Nov 2022, Bertrand Marquis wrote:
>> This patch series is a first attempt to check if we could use Yocto in
>> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
>>=20
>> The first patch is introducing a container template from which container
>> files can be generated for all combinations we want to support (qemu
>> arm, arm64 and x86 targets and hosts x86_64 and arm64).
>> It is also introducing a generic build script (build-yocto.sh) that is
>> used to create, build and run a Yocto project.
>>=20
>> The second patch is adding a way to easily clean locally created
>> containers.
>>=20
>> The third patch is introducing some gitlab CI templates and jobs so that
>> we can test a Xen source tree in gitlab-CI using Yocto.
>>=20
>> This has been tested on a x86 host machine and on an arm host machine
>> (with mk_dsdt.c fix).
>>=20
>> Changes in v5:
>> - automatic cleanup of generated docker files using INTERMEDIATE
>> - typo fixes
>> - rebase on Stefano's next branch
>> - remove clean rule cleaning all containers
>>=20
>> Changes in v4:
>> - rework the container generation to support multiple hosts
>> - rework the container generation to use a single template for all
>>  docker files (make process is generating the docker files).
>>=20
>> Changes in v3:
>> - limit number of jobs in yocto
>> - do not copy build script inside container
>> - add patch from Michal to create gitlab jobs
>>=20
>> Changes in v2:
>> - remove gitignore patch which was merged
>> - add a --dump-log support in build-yocto.sh script and use it during
>>  container creation to see the error logs.
>>=20
>>=20
>> Bertrand Marquis (2):
>>  automation: Create Yocto docker images
>>  automation: Add a clean rule for containers
>>=20
>> Michal Orzel (1):
>>  automation: Add CI test jobs for Yocto
>>=20
>> automation/build/Makefile                  |  24 +-
>> automation/build/yocto/build-yocto.sh      | 351 +++++++++++++++++++++
>> automation/build/yocto/yocto.dockerfile.in | 114 +++++++
>> automation/build/yocto/yocto.inc           |  42 +++
>> automation/gitlab-ci/test.yaml             |  43 +++
>> 5 files changed, 572 insertions(+), 2 deletions(-)
>> create mode 100755 automation/build/yocto/build-yocto.sh
>> create mode 100644 automation/build/yocto/yocto.dockerfile.in
>> create mode 100644 automation/build/yocto/yocto.inc
>>=20
>> --=20
>> 2.25.1
> <log.txt>


