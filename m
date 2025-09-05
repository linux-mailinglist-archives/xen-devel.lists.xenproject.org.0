Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5F1B45A4E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 16:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112038.1460508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuXLc-0004Xv-Nz; Fri, 05 Sep 2025 14:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112038.1460508; Fri, 05 Sep 2025 14:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuXLc-0004VH-Jn; Fri, 05 Sep 2025 14:23:28 +0000
Received: by outflank-mailman (input) for mailman id 1112038;
 Fri, 05 Sep 2025 14:23:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRNw=3Q=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uuXLb-0004V6-83
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 14:23:27 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2417::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e18fb50a-8a63-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 16:23:24 +0200 (CEST)
Received: from BY5PR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:1d0::34)
 by BL1PR12MB5756.namprd12.prod.outlook.com (2603:10b6:208:393::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 14:23:17 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::cd) by BY5PR04CA0024.outlook.office365.com
 (2603:10b6:a03:1d0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Fri,
 5 Sep 2025 14:23:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 14:23:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Sep
 2025 09:23:16 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 5 Sep
 2025 07:23:13 -0700
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
X-Inumbo-ID: e18fb50a-8a63-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hclL765Ah+0nwN5jTe5vSFVeNcLQbEE7xAftUwlvsu9QfBTnad6zIkthz2V3n+j++9wgFkBibvcBu2Pg2s4lnwK8LBotO8j2+JH2VFK3LWd3JI9oZXtQrnGksxLDAQV5FDhI48Twahq18juTJz4GdfyCcPBAT5hK/w/47yc1uW+hbwTHdmZDolI7RfQLsvPQHHT3VMjFZr7ZzvBkVM+0USsY2zAhUHaD23q6Ziq6frm5PQXGeAV9rEnY50zTPUjJxWOIAN3EGGShBxGndodMBiIF8qtl6YcxGm7p3D1vA4N309RVuPXiaN9xsXmZ1CZ/2hIwyfRpxc3EfbC70B6c+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBMpyFtOkrIZHsOBkab5BX5XX/KDsJxINZyIGOe9kc8=;
 b=JeIntKn1U47FS8eDW8XdxoRODbml8oOEIu2ROG3S8zffnkthy3Bnh6HVQ45vkV9suUKakmT9YZSriiE3UC/YiZOYJNKb+XdASaBV9OgfyAe/XoZ820+jXTMWI9A+c9wKdSFp3TmM5SsLd8F+QTCG/aUwQMjpkjSBxhT94QA0we/2nY5nSpSagm7Esah/zSXE/6H+fK81AZVNp8ub0II4CKz5fl/EU6whFD8K357YnoabWKajVopvU2h3Yb3964XQAVa2TFmfXyCWnNTEDU3zUk2zmfnzu2r6wWFj49/FHSGMbY85W8H4sT/eoUwCeBq+SDUC9I3W5fdLAMDx8c/Akg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBMpyFtOkrIZHsOBkab5BX5XX/KDsJxINZyIGOe9kc8=;
 b=Mt/Nz1PZoBaD/rDIwSj+JX0z6MPT/n2LqGphLcCplDfv9JXoR76YJuU1qlG72u7fE7PXHg0k9AFwIUEn26v/3eW6TCgfZwN9tynSM3KNPgVjpYa6rSMre0Mdkype2xZVHd6NJFGc96HkOzpuzIFoP8f+Ek0S6Y70or8ivKu4IV0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 5 Sep 2025 16:23:12 +0200
Message-ID: <DCKXNJQ1AVB9.1PE1JBUJXW93Y@amd.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, <dmukhin@ford.com>,
	=?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Simon Gaiser
	<simon@invisiblethingslab.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v17 0/4] xen/domain: domain ID allocation
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Demi Marie Obenour <demiobenour@gmail.com>, <dmukhin@xen.org>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250829232132.3460081-1-dmukhin@ford.com>
 <4bfee720-f117-4ac5-8cf8-8d9e718f6694@gmail.com>
In-Reply-To: <4bfee720-f117-4ac5-8cf8-8d9e718f6694@gmail.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|BL1PR12MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 14cd9070-c99c-4f7f-1e1a-08ddec87c187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1N3dGFkcVFpWTkrNDNnc09RQ2tvSjRMaTVxbFZra0diRWMyNmJLMkVPeVhD?=
 =?utf-8?B?U2ZmRStuVmIxNmdWQUpyZW9lNS9sMWFkU1lQYUcrNi9CZld0eWtqeXF5eGQr?=
 =?utf-8?B?ZlgrUFcxV2hpVTFYMG9XMkVVYmFpM2hxTWZ5OWdtS08yN1lwZ2hWZWEwck1J?=
 =?utf-8?B?KythOWF4eVJnUkxvdkFsM1JCT3cxaXhJV0dmOXF4Qk1jOHloU3BRVmVlOXMv?=
 =?utf-8?B?TERYSUtvVEdqcU9aRkhkZWxreEN5RzBpUVNSckp3SGdubS9NRDgzZFRPalV4?=
 =?utf-8?B?UlFnVFplcjJDR2s2QXRERXhucW5oWnU5NGRidWgvTVEya3U4cHFiRGZvdExl?=
 =?utf-8?B?VWdUSjVZZE04QWhEZmtESG9peW9rUStQSFFSdmZRdjFEbEpmalltNWcyT1p5?=
 =?utf-8?B?NGJYcXgrczEyR0Q0MmhZdHhvR3RTaXFKS2NzMDcvNnBBeGRVVllzRnJvNDU4?=
 =?utf-8?B?UnpiamMzWC9VUGlPWG54ZkVPZXc3dHQvN2swOHhXUXlZTmFMbFVtb3Y5N1RK?=
 =?utf-8?B?RWQ5K083a2x4NG1LWjNydnpkeTFwTXVHT0NteFpGSGU0UEdWQUwwQXVjSVNy?=
 =?utf-8?B?VnlyTjgyaEpOS0lDak4zSTNBR0I3UlluSDdrTTBvcThLbkpETEJTL0VLbzMw?=
 =?utf-8?B?Qy92aGc0UC9GdFQ5aHJIMEM3RlY4RDIwY2tKVGZML1BCbmg0QjJxRndlS2h4?=
 =?utf-8?B?K0FORlc4aGZWSk40T1Z5VVZ2RExUdzFmcjlpVm9iaUJxYlRvYXNpbUlNR0Jh?=
 =?utf-8?B?MUhQUndPTnRHVDhsQk41TXArNHp5b3REaWV4WGFoa2xqODg2Um5raTErRzJk?=
 =?utf-8?B?VG9uWk11RVJ0S24weXJLUTI4QVBvWDF1dkMzYmtzeXVEUkhqRCtSanRMa084?=
 =?utf-8?B?aUpGam9PSmpEWVp1MkpNc1NZRDN3alBrbDE3dGQycm1KMnEyWFE3RGp2M2FM?=
 =?utf-8?B?djdVeUMrdCtGSlRJb25IVVZmVHE5YlcraER2Z0piQjkvclhOM2haVWY1c3ZJ?=
 =?utf-8?B?Qyt5RHFGYi90dlF2SjQ0bWdxZm5GaHpLakNlNmI4RUJlVTZDeW9ITjJCZHNH?=
 =?utf-8?B?QkZlMjdNaWg1cjNvN3FHbmtnMkFqYzdwdml6aUJsaWR6K3MzREVMQWlNTllW?=
 =?utf-8?B?aG43ZXJMNzRPTUd1LzcxQS9BOUZnMUNJU1ZRN3FlYUxXcTk2cTFZZHczdURO?=
 =?utf-8?B?ZTdhTmdkcExLY2I2RUNZWloyMlJEcy8yK1JZZ3BuYlpDRGlRMDQvMFRKaWxK?=
 =?utf-8?B?SlE0UzhKVDZydW5kcXUySURmblZvbm5xekpiTkJtWHU1eTJwelR0dElFUmw5?=
 =?utf-8?B?ZFQ4UVJFckVSQjF3OWtleFpNb29OWHFSTE1kcllwbTYrZXpnQWRGYkVjUGVF?=
 =?utf-8?B?ekJTL3lWMGlkdHBQaHJrQ2RwZkluaGJka3FCYVFlaHNsclMrZjNBOE5oc1Ri?=
 =?utf-8?B?K01UNlhTeitHNUFNN3dXWFlFakpjdGZYT2NpVXV2em43UU9qR0I5T2NNVHBN?=
 =?utf-8?B?V0J5NVgxaU4yMUxmaWJ6TU5pWEJ4SlJUY1BzKzB3ZTZJRnhIblZLd1Q4VFhO?=
 =?utf-8?B?K0ZUV2FlVUVhc1VMNlJSbFRPQ202VUwyQnJxb2pZbk9LQzIxMkpvcDR0a1Jn?=
 =?utf-8?B?TllzOGxFTkYyQlpmWGxBSThJWmpRelZPdEs1YitsZVVPWW9MZ21kVi9Yb3pH?=
 =?utf-8?B?YmE5Z29Ca05IOHVOYlp3UlJyYkh0cXRkcnVtZ21SMXBuZE1vMmM1NXRnVUlz?=
 =?utf-8?B?blhPVWpsVUJxdlE2TFRaMG1lVDJ4cExBdEJ6c2grZ0VjU2tiaHlabHU5Q1pY?=
 =?utf-8?B?azNkUnF5ZldiU2RxWmUrMHJpMUNKd3lLWVV2MEtwWFpGbSs2Ykt4bllDTm9Y?=
 =?utf-8?B?RWxJdVk3bkxZMUI4blFlaFcyY1NXMEFKcHhyTFhOVmpOalJjU1JLdXhacTVH?=
 =?utf-8?B?WXk1Rzdodm5DeTViRmpCYWlPVVcvdWxXQTFUR2M2VUlNWmRacEJQNnhHdzFQ?=
 =?utf-8?Q?tpV8xog6KJD5KxkmRNmiOVXFa+RAnw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:23:16.6736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cd9070-c99c-4f7f-1e1a-08ddec87c187
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5756

On Thu Sep 4, 2025 at 10:15 PM CEST, Demi Marie Obenour wrote:
> On 8/29/25 19:21, dmukhin@xen.org wrote:
>> Patch 1 introduces new domid_{alloc,free} calls.
>> Patch 2 is a prep change for domain ID allocator test.
>> Patch 3 introduces some basic testing for domain ID allocator.
>> Patch 4 adjusts create_dom0() messages (use %pd).
>>=20
>> Link to v16: https://lore.kernel.org/xen-devel/20250812223024.2364749-1-=
dmukhin@ford.com/
>> Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipeline=
s/2012378054
>>=20
>> Denis Mukhin (4):
>>   xen/domain: unify domain ID allocation
>>   tools/include: move xc_bitops.h to xen-tools/bitops.h
>>   tools/tests: introduce unit tests for domain ID allocator
>>   xen/domain: update create_dom0() messages
>>=20
>>  .../xen-tools/bitops.h}                       | 16 +++-
>>  tools/libs/ctrl/xc_misc.c                     | 13 +--
>>  tools/libs/guest/xg_dom_elfloader.c           |  1 -
>>  tools/libs/guest/xg_dom_hvmloader.c           |  1 -
>>  tools/libs/guest/xg_private.h                 |  2 +-
>>  tools/libs/guest/xg_sr_common.h               |  2 -
>>  tools/tests/Makefile                          |  1 +
>>  tools/tests/domid/.gitignore                  |  2 +
>>  tools/tests/domid/Makefile                    | 88 +++++++++++++++++
>>  tools/tests/domid/harness.h                   | 54 +++++++++++
>>  tools/tests/domid/test-domid.c                | 95 +++++++++++++++++++
>>  xen/arch/arm/domain_build.c                   | 13 ++-
>>  xen/arch/x86/setup.c                          | 11 ++-
>>  xen/common/Makefile                           |  1 +
>>  xen/common/device-tree/dom0less-build.c       | 15 +--
>>  xen/common/domain.c                           |  2 +
>>  xen/common/domctl.c                           | 43 ++-------
>>  xen/common/domid.c                            | 95 +++++++++++++++++++
>>  xen/include/xen/domain.h                      |  3 +
>>  xen/lib/find-next-bit.c                       |  5 +
>>  20 files changed, 397 insertions(+), 66 deletions(-)
>>  rename tools/{libs/ctrl/xc_bitops.h =3D> include/xen-tools/bitops.h} (8=
4%)
>>  create mode 100644 tools/tests/domid/.gitignore
>>  create mode 100644 tools/tests/domid/Makefile
>>  create mode 100644 tools/tests/domid/harness.h
>>  create mode 100644 tools/tests/domid/test-domid.c
>>  create mode 100644 xen/common/domid.c
>
> Would it make sense to support virtualizing the domain ID space?
> That would allow the toolstack to only allow a domain to communicate
> with other domains of its choosing, rather than with any domain XSM
> permits.  This would also allow avoiding domain ID reuse problems,
> because a virtual domain ID would stay valid even after the domain
> it refers to no longer exists.  It would need to be explicitly released
> by the guest kernel before it could refer to a different domain.

I'd be all-in for something like that. For context, this is something we
briefly touched on over lunch on the last Xen Summit (it was Juergen, Marek=
 you
and I, I think?). Regardless, this series is only tangentially related. Eve=
n if
you do have several domclusters, you'd still need a per-cluster allocator o=
f
domids. For something like domcluster-namespaces to work, we'd need to exte=
nd
createdomain to also take a domcluster-id, then the unique domain identifie=
r
comes from a domcluster-id+domid.

I tried shortly after we discussed it to sketch out a credible plan to gett=
ing
there, but there were more wrinkles than I expected. You'd definitely want =
some
domains to be in several namespaces at the same time (The hwdom, at least),
which involves some refcounting I was unsure how to do. Not a major show-st=
opper
but I hate refcounts with the intensity of a power plant.

grants also become more complicated when you have a domain in several
namespaces, because now you need several grant tables per domain (one per
namespace). The ultimate consequence of this means that if dom0 wants to cr=
eate
a new domcluster and bind itself to it, now it needs to create a NEW grant =
table
for itself. Xen is also unaware of this multi-grant table shenanigans so th=
at
needs accounting for too.

Then there's adjustments to be done on the maptrack.

So. I'd really like for this to become a reality, but it requires someone w=
ith
time to do it to sit down and walk down the rabbit hole. It was definitely
far deeper than I expected it to be. It doesn't seem to be untractably deep=
,
but deep enough that I don't want to do it in my spare time. It'd require
coordinated changes at least in Linux, Xen and the toolstack.

Cheers,
Alejandro

