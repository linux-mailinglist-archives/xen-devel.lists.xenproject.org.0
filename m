Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E85B1C3CC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 11:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071506.1434971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujamM-0000iR-6b; Wed, 06 Aug 2025 09:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071506.1434971; Wed, 06 Aug 2025 09:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujamM-0000ew-1H; Wed, 06 Aug 2025 09:49:50 +0000
Received: by outflank-mailman (input) for mailman id 1071506;
 Wed, 06 Aug 2025 09:49:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Mu=2S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujamK-0008SJ-DM
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 09:49:48 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afbf7411-72aa-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 11:49:46 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU4PR03MB10887.eurprd03.prod.outlook.com (2603:10a6:10:592::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 09:49:44 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 09:49:44 +0000
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
X-Inumbo-ID: afbf7411-72aa-11f0-a322-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFJY5SHTBQrN+rtdTMaTx7BnzPu4p3f96yxlw3fIPu4f11d+QeSdyUSOrn1lHXE1B3dv15v5uYBuLGt2ASwdTSpCZZQpybFVReqgnfpZHjp08ciMXow9crQ0WbN5UuINTOiEbNyTy7ROrKpxN3chSuZwmsUR4uyku7//l8etTudiJAqVD6wfzlGpwgfaPS3LTnRSLQqtdMZnTf3zUaDJ4AEtjq1pwg8R4FRX/tJgMAMu8bKbDYUx/cDpJ3OOFImG6Pk0MZmKq1/3af+NNN9EQalxgQpqMagssYuVFOcfGDFRoLStV0UlMp9qhbxOm6XfA13C4I/trauC/Y5fQexJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cac1eHPMfPSKn+UlXRQpi44QFtXgjkvUpQCfsG56pnU=;
 b=uvkbeVLTaKwMwFvtD7mZOVZCyOmTaqDiTotp5kjZ5S0reVfN9QmNF+MjsXPGG+nWhtdhsygF0m0l07sbISyhP+waauIEVr8BgxNAiTco4sE2Rj6gvaeTtKH4CU7Iwy5I7dCQ7itpBGLqlEqCEn9F2JBUk8teCUgEAyfP8ayY7PShYjVjGyl3xFLdqQzj+lgaygUyTNEVcrfg3Rd253V6UiuEcEtxaDdhserwf2urssQXD9x5cY90qfeetSANzamoLlxh5bOZFa4hGOc778U7NNQ92UDcQNZyT2tYbHMH2W1WrfZ4TjiygBgGe1pNRQZKiz/QyAGvCy+k8n3bVqLuEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cac1eHPMfPSKn+UlXRQpi44QFtXgjkvUpQCfsG56pnU=;
 b=DFffcKyMOCaJfonwD97fq7HtORPSEtPC1yBLBArM9RgLwBu7jbK62bhfj5sSXt2N+rJu8P255+Aiy5Ml/P6T1cqPREV/YzXOBsxdwE/gR4JAhqXYwDvsxV2tlJkwGv0w62Zm8WyyGZtuZotQTP8wZLhMSHzJIyF3aXWfw8fqFAf2Pf5KDAew/pe0M3shiM481/fLtTQ00H8zST5gBs4B67Y1qGL32r5boyciFvbHLINavJR2D2XaRAuDDAz7V8b1C6TWCtWPSfNWJ1hNEBSeN/j6SGbifW36GxuXog55u7zs7oyckmvqyxZ/mkixUYui+k5LrM1QBmSAivSIo6mipg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
Thread-Topic: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
Thread-Index: AQHcBrdvViXWS71ZxEGq4HoaR7N2PA==
Date: Wed, 6 Aug 2025 09:49:43 +0000
Message-ID: <20250806094929.293658-4-grygorii_strashko@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
In-Reply-To: <20250806094929.293658-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU4PR03MB10887:EE_
x-ms-office365-filtering-correlation-id: 91ebd3b0-afcf-4152-5a11-08ddd4ce925c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ws+YeJGObgdtjr//T5Jwd/mnEnALJd8d5w8WehjSZI6oC92DHCsu3lT9Rs?=
 =?iso-8859-1?Q?VoK1SL+vdplhgLT08+0kaSv3ahsp8ZcOJdg99HjaJFQlUclzzj22CeAMKX?=
 =?iso-8859-1?Q?1Ssjo2rwMA4vrlUn1u+viQEGHOYKcwJgUvbzWab02o6zI29y8K4JgtzxAP?=
 =?iso-8859-1?Q?fvITIg2ILCtJryr+3ctpBbIem4dIlbz2Sgad36yecMGYPM0aHZciaJTfit?=
 =?iso-8859-1?Q?yZaLkwvE95F9vsfYUKEQzshYQXUSEp/1p3vhx1eajSIdWqBAEKti9RHl3k?=
 =?iso-8859-1?Q?2vHTJwR6LM/W2ZDB07pFaug0QUkhHcpd/Fe69q/hUswXWS3AIGxXdRJ4j/?=
 =?iso-8859-1?Q?kPbm9aLkQgzbl66NEyG55To2fjzqlIAMGkJW/qwWyl7zx3OL2WO45x52Ol?=
 =?iso-8859-1?Q?CiNeEG2KXadBV8+6JEGfEEnMkLNTWBnniBa8RAAt4OcYK0m12xNJ0faL2A?=
 =?iso-8859-1?Q?Rl5C3Cls56l+sEB7kKGuEmcXI2biMA8JolPgQm/wRxKQdYB3YSGVsGnHHj?=
 =?iso-8859-1?Q?BnMTsf9M5lEAsLgOFNZIj80dbZDTCIs1E+K69pG3nbtZuSN/9OvqvxU0DI?=
 =?iso-8859-1?Q?j9AHEqBb4juokgeQXsKtQNtM4l8ZJbjuzA6yKwJzjSxemIQbpdQcMbC7wz?=
 =?iso-8859-1?Q?SIB0EY5ksphg0zxV1f0MZWbE6YW+TWTJpC/kt4VPwB2/IeNuTECi6dQTRy?=
 =?iso-8859-1?Q?4Ijj5Loti4ZAPQBFMvGXjv2hWInAyzqA3XUZ2t/j6s3eqsbhO4FPfqd+3M?=
 =?iso-8859-1?Q?Te8bDVqjRV+W8wYVnWCoWncSt2/rikDF2hGGNz8Co6sNGmmy6cmHsbmJvT?=
 =?iso-8859-1?Q?37SUJls3h/vQ97/pGK1oM3squaNWq2p3bv/fP+SGrbmUCHb06r+ODajAik?=
 =?iso-8859-1?Q?OYl9Db74+tehyXdeh1Z8XrrwlFgedgwvhVn1uw74wfEYi2XvPuJlWVJwF+?=
 =?iso-8859-1?Q?CYPZydla+qrbNnI31bOFEWL5sWkBK7hmCuosR78NTfpvrVfUHiipdyqZHf?=
 =?iso-8859-1?Q?e5zLfWugL9wfvaqAkWo+7HLEAZmwQm1C7tRYY8uuQ9yNPoXN8EqqmdoVog?=
 =?iso-8859-1?Q?M2auSF212DoPMRqvJ9GXTAkyJxpVCyyTp+K5ESsmx5NR9yVcTNzYkwMCWq?=
 =?iso-8859-1?Q?OYPaLsGub/hG6ShHE0I7WivHyn4u2gjQ/zY2HdIQAF71fSTnKZrsKpixNe?=
 =?iso-8859-1?Q?WLs1GEaM5gwNCGK3BBxDsWRoylH/18fQxYku/HMhneqk0AvkUPndeLhyon?=
 =?iso-8859-1?Q?Vf/59zJ7LbHJFWldLDxh1Z5ob7ugKbWnBPxInxaDyttEABP+E4HvHcMLkS?=
 =?iso-8859-1?Q?QpNmW7FRrn2iV9umSYHqJ4Rusmqyu43IDSfacFM08N3X5iSAAromOzDW8r?=
 =?iso-8859-1?Q?PMKJlMGR0rj1/Vlzd9nc3rutJxlGI3VR3aaJyRIaD0Z/LJEK2CLeKRayy8?=
 =?iso-8859-1?Q?GOUtOAK5xD5VdTX+bUQjYPip3vI6B4sCEjTNi8Vs5woZ/ULJvf9yJHtS3c?=
 =?iso-8859-1?Q?jiYE7Zxp4is2n2VYTZV8+7S7jgtePKuoT3EUk6imSr7Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?h2xzkYkJPeVQyXmybYaEHLQ+nxl29S8TmnEJBaUvIru+Fxx99baYclcSEB?=
 =?iso-8859-1?Q?ZBNaVPHKUXWmZRs4ww4kFxZz206uBmvcnTeuhfC7buiOXfsXYmV4DUmX2w?=
 =?iso-8859-1?Q?eaDAgO1Sh4f61X24xpv8ZCqjj42u6BW1WPdQcf+f4NOfTWdsJgU2kwq7MW?=
 =?iso-8859-1?Q?IqYNnoRdzVmLxoP/SV0OUUua1pAAeTvAqZ/GjlE01iPy7NAanVNUuX03mx?=
 =?iso-8859-1?Q?SN3br/obKfKvN+t/zAXvzPXhhSOhFJJvn0YuJ3MPhNis82d+5LXmkCptvS?=
 =?iso-8859-1?Q?V0+qqQEfuSIcsPfmJLLA34il8b1MlRIU+4G7UP82lr2QqihbbLLFD3SrZJ?=
 =?iso-8859-1?Q?pWzHFltXmESXHpBciiHXy0cvxpvs/uu3TJCA7ptyxUmYEiGrYjX3tA6qqp?=
 =?iso-8859-1?Q?/efYJYimbX5P9C9AbUr8fQn2QqYhld5uRqNwRhVh8idmQj/FZ3HVUKYZ0g?=
 =?iso-8859-1?Q?pKETILe6WgBKbHvg8gK5eYtSZlWVUxPO7OJ9brkFtutrZOAd+GOxURcg53?=
 =?iso-8859-1?Q?2RLZmRLBfU1PMmE9W1hlilZ+bsCSuFWUK/DsPkPUuEJQdAKRhEdcLMhrNz?=
 =?iso-8859-1?Q?ND8UtuqOfPDGch/dU6gU0285LhrUr0VHzPWFXkrhLgfagW9OHLKN5+/1oQ?=
 =?iso-8859-1?Q?Ujo03hGdypXoAeBpw/sBU5bbupJv4T/F5ttwasd7SumjDeXZh6mVVct8tj?=
 =?iso-8859-1?Q?atF6NXKtScJVPdqbBe5D008JabPlUHRvnCoVXj9f4JHIEuRQJEmt0zynhd?=
 =?iso-8859-1?Q?otTm23/yCw/S3RH6niORe+pSjhp1cAWFanBR/UyAY8i/iOePlORsE3ssFc?=
 =?iso-8859-1?Q?vMUwdvCuKC4f1DP1Qy0FNwxPXTaCCUV2G7CzjNa+EqdFfPKXrmzJI9LdpC?=
 =?iso-8859-1?Q?5lTPV/emyVngVMQVMqH5C8fHY/h9pxWmXknAy0GE6YfD57+iRw6GS8TF34?=
 =?iso-8859-1?Q?WYvBH+iaAHKMsZlregPdJ5KvUzbyuzEk6SwCujNjunzZPekRPiKum0xGay?=
 =?iso-8859-1?Q?M+zWYkrXJD9V5wHaAuyY2fCqqQ3CWlLAnZMd2QXyDcePB3nbQ+Q8TajVDh?=
 =?iso-8859-1?Q?ckkGm0k8dFN/yUhOJgJxxmbwgmn/SeC8OuFWHvPozBpE0DE/unsRGqM6fp?=
 =?iso-8859-1?Q?qxCq7CBRARMc9ppJgQdcYW3ey1zxfnADkh3KyjJnmSL+e9Y5hvyR6p5AXK?=
 =?iso-8859-1?Q?3LWuWvJzQzQIF88vTz0swrkdj5U9ti8pmzCr6PLwbd1rRmrj+afftfg3AL?=
 =?iso-8859-1?Q?aD+bzM2CSEKUtCpHVg5uCS9DETu4BIN16t+FYj/J0pEgshbXB5zhsaW8QC?=
 =?iso-8859-1?Q?UoH9WKubnrHTlbRc0QEsrb9FHffMGN6csREPL2AHMd1xLeVkOWIE680q6i?=
 =?iso-8859-1?Q?4qT18HV6DK4MJDY5FWCyw3YvMWNjUWsGvWpllsUiiMxK8GnrYzT4jIHFiz?=
 =?iso-8859-1?Q?5fBY8cfxb7SNq+5a0L0wHi+arI14Ic6uIyCFICfQptiw4dl1tvQtOQ8i6k?=
 =?iso-8859-1?Q?p2LFMb278Xq/VQJzWmcrv0IRtjQO2YIZFlgRemScENum7wFhhlWb2Wex9a?=
 =?iso-8859-1?Q?fAgy8sN0XZEJ0IFuOiZRpnm0DPu1oL8R5jmdVMsGHoOFp/xshdLR5Jj5pG?=
 =?iso-8859-1?Q?m8v+faTRvGh68ygkFMumLETzLuwoWVsXQNLJuhCiJ+kLmhjt0616Delg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ebd3b0-afcf-4152-5a11-08ddd4ce925c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 09:49:43.0249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YOlMbvS2ph2cE4aai3wRyOfLpAdt2fkoBV4m+aoR7VojMcnqw69q/JWYYHfNxbV+ZHWK2fjAe5R9ncha2MuZIOt73jdVUDKvDVAMwsuS3uU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10887

From: Grygorii Strashko <grygorii_strashko@epam.com>

Now Arm64 AArch32 guest support is always enabled and built-in while not
all Arm64 platforms supports AArch32 (for exmaple on Armv9A) or this
support might not be needed (Arm64 AArch32 is used quite rarely in embedded
systems). More over, when focusing on safety certification, AArch32 related
code in Xen leaves a gap in terms of coverage that cannot really be
justified in words. This leaves two options: either support it (lots of
additional testing, requirements and documents would be needed) or compile
it out.

Hence, this patch introduces basic support to allow make Arm64
AArch32 guest support optional. The following changes are introduced:

- Introduce Kconfig option CONFIG_ARM64_AARCH32 to allow enable/disable
  Arm64 AArch32 guest support (default y)

- Introduce is_aarch32_enabled() helper which accounts Arm64 HW capability
  and CONFIG_ARM64_AARCH32 setting

- Introduce arm64_set_domain_type() to configure Arm64 domain type in
  unified way instead of open coding (d)->arch.type, and account
  CONFIG_ARM64_AARCH32 configuration.

- toolstack: do not advertise "xen-3.0-armv7l " capability if AArch32 is
  disabled.

- do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
  AArch32 is disabled.

- Set Arm64 domain type to DOMAIN_64BIT by default.
  - the Arm Xen boot code is handling this case properly already;
  - for toolstack case the XEN_DOMCTL_set_address_size hypercall handling
    updated to forcibly configure domain type regardless of current domain
    type configuration, so toolstack behavior is unchanged.

With CONFIG_ARM64_AARCH32=3Dn the Xen will reject AArch32 guests (kernels) =
if
configured by user in the following way:
- Xen boot will fail with panic during dom0 or dom0less domains creation
- toolstack domain creation will be rejected due to xc_dom_compat_check()
  failure.

Making Arm64 AArch32 guest support open further possibilities for build
optimizations of Arm64 AArch32 guest support code.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
- use Arm64 "cpu_has_el1_32" in all places to check if HW has AArch32 suppo=
rt
- rework Arm64 XEN_DOMCTL_set_address_size hypercall handling to work with =
any
  initial domain type set (32bit or 64 bit)
- fix comments related to macro parameters evaluation issues
- do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
  AArch32 is disabled

 xen/arch/arm/Kconfig                    |  7 ++++
 xen/arch/arm/arm64/domain-build.c       | 46 +++++++++++++++++++++++--
 xen/arch/arm/arm64/domctl.c             | 16 +++++----
 xen/arch/arm/arm64/vsysreg.c            |  9 +++++
 xen/arch/arm/domain.c                   |  9 +++++
 xen/arch/arm/domain_build.c             | 21 +++--------
 xen/arch/arm/include/asm/arm32/domain.h | 12 +++++++
 xen/arch/arm/include/asm/arm64/domain.h | 23 +++++++++++++
 xen/arch/arm/setup.c                    |  2 +-
 9 files changed, 119 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a0c816047427..bf6dd73caf73 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -266,6 +266,13 @@ config PCI_PASSTHROUGH
 	help
 	  This option enables PCI device passthrough
=20
+config ARM64_AARCH32
+	bool "AArch32 Guests support on on ARM64 (UNSUPPORTED)" if UNSUPPORTED
+	depends on ARM_64
+	default y
+	help
+	  This option enables AArch32 Guests on ARM64.
+
 endmenu
=20
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/arm64/domain-build.c b/xen/arch/arm/arm64/domain-=
build.c
index 3a89ee46b8c6..5951f002e3af 100644
--- a/xen/arch/arm/arm64/domain-build.c
+++ b/xen/arch/arm/arm64/domain-build.c
@@ -4,13 +4,55 @@
 #include <xen/sched.h>
=20
 #include <asm/domain.h>
+#include <asm/arm64/sve.h>
+
+int __init arm64_set_domain_type(struct kernel_info *kinfo)
+{
+    struct domain *d =3D kinfo->bd.d;
+    enum domain_type type;
+
+    ASSERT(d);
+    ASSERT(kinfo);
+
+    type =3D kinfo->arch.type;
+
+    if ( !is_aarch32_enabled() )
+    {
+        ASSERT(d->arch.type =3D=3D DOMAIN_64BIT);
+
+        if ( type =3D=3D DOMAIN_32BIT )
+        {
+            const char *str =3D "not available";
+
+            if ( !IS_ENABLED(CONFIG_ARM64_AARCH32) )
+                str =3D "disabled";
+            printk("aarch32 guests support is %s\n", str);
+            return -EINVAL;
+        }
+
+        return 0;
+    }
+
+    if ( is_sve_domain(d) && type =3D=3D DOMAIN_32BIT )
+    {
+        printk("SVE is not available for 32-bit domain\n");
+        return -EINVAL;
+    }
+
+    d->arch.type =3D type;
+
+    return 0;
+}
=20
 #ifdef CONFIG_DOM0LESS_BOOT
 /* TODO: make arch.type generic ? */
 void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
 {
-    /* type must be set before allocate memory */
-    d->arch.type =3D kinfo->arch.type;
+    int rc;
+
+    rc =3D arm64_set_domain_type(kinfo);
+    if ( rc < 0 )
+        panic("Unsupported guest type\n");
 }
 #endif
=20
diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
index 8720d126c97d..4f0f143daef8 100644
--- a/xen/arch/arm/arm64/domctl.c
+++ b/xen/arch/arm/arm64/domctl.c
@@ -13,6 +13,11 @@
 #include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
=20
+static void vcpu_switch_to_aarch32_mode(struct vcpu *v)
+{
+    v->arch.hcr_el2 &=3D ~HCR_RW;
+}
+
 static long switch_mode(struct domain *d, enum domain_type type)
 {
     struct vcpu *v;
@@ -21,14 +26,14 @@ static long switch_mode(struct domain *d, enum domain_t=
ype type)
         return -EINVAL;
     if ( domain_tot_pages(d) !=3D 0 )
         return -EBUSY;
-    if ( d->arch.type =3D=3D type )
-        return 0;
=20
     d->arch.type =3D type;
=20
-    if ( is_64bit_domain(d) )
-        for_each_vcpu(d, v)
+    for_each_vcpu(d, v)
+        if ( is_64bit_domain(d) )
             vcpu_switch_to_aarch64_mode(v);
+        else
+            vcpu_switch_to_aarch32_mode(v);
=20
     return 0;
 }
@@ -38,7 +43,7 @@ static long set_address_size(struct domain *d, uint32_t a=
ddress_size)
     switch ( address_size )
     {
     case 32:
-        if ( !cpu_has_el1_32 )
+        if ( !is_aarch32_enabled() )
             return -EINVAL;
         /* SVE is not supported for 32 bit domain */
         if ( is_sve_domain(d) )
@@ -58,7 +63,6 @@ long subarch_do_domctl(struct xen_domctl *domctl, struct =
domain *d,
     {
     case XEN_DOMCTL_set_address_size:
         return set_address_size(d, domctl->u.address_size.size);
-
     default:
         return -ENOSYS;
     }
diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index d14258290ff0..9f7e735c9b74 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -330,6 +330,15 @@ void do_sysreg(struct cpu_user_regs *regs,
     {
         register_t guest_reg_value =3D domain_cpuinfo.pfr64.bits[0];
=20
+        if ( !is_aarch32_enabled() )
+        {
+            /* do not expose EL1 AArch32 support if disabled */
+            register_t mask =3D GENMASK(ID_AA64PFR0_EL1_SHIFT + 4 - 1,
+                                      ID_AA64PFR0_EL1_SHIFT);
+            guest_reg_value &=3D ~mask;
+            guest_reg_value |=3D (1 << ID_AA64PFR0_EL1_SHIFT) & mask;
+        }
+
         if ( is_sve_domain(v->domain) )
         {
             /* 4 is the SVE field width in id_aa64pfr0_el1 */
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 310c5789096d..544d1422a793 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -791,6 +791,15 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl =3D config->arch.sve_vl;
 #endif
=20
+#ifdef CONFIG_ARM_64
+    /*
+     * Set default Execution State to AArch64 (64bit)
+     * - Xen will reconfigure it properly at boot time
+     * - toolstack will reconfigure it properly by XEN_DOMCTL_set_address_=
size
+     */
+    d->arch.type =3D DOMAIN_64BIT;
+#endif
+
     return 0;
=20
 fail:
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 47ba920fc6b0..c616127e8da5 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1873,19 +1873,6 @@ int __init construct_domain(struct domain *d, struct=
 kernel_info *kinfo)
     BUG_ON(v->is_initialised);
=20
 #ifdef CONFIG_ARM_64
-    /* if aarch32 mode is not supported at EL1 do not allow 32-bit domain =
*/
-    if ( !(cpu_has_el1_32) && kinfo->arch.type =3D=3D DOMAIN_32BIT )
-    {
-        printk("Platform does not support 32-bit domain\n");
-        return -EINVAL;
-    }
-
-    if ( is_sve_domain(d) && (kinfo->arch.type =3D=3D DOMAIN_32BIT) )
-    {
-        printk("SVE is not available for 32-bit domain\n");
-        return -EINVAL;
-    }
-
     if ( is_64bit_domain(d) )
         vcpu_switch_to_aarch64_mode(v);
=20
@@ -1983,6 +1970,10 @@ static int __init construct_dom0(struct domain *d)
     if ( rc < 0 )
         return rc;
=20
+    rc =3D arm64_set_domain_type(&kinfo);
+    if ( rc < 0 )
+        return rc;
+
     return construct_hwdom(&kinfo, NULL);
 }
=20
@@ -1994,10 +1985,6 @@ int __init construct_hwdom(struct kernel_info *kinfo=
,
=20
     iommu_hwdom_init(d);
=20
-#ifdef CONFIG_ARM_64
-    /* type must be set before allocate_memory */
-    d->arch.type =3D kinfo->arch.type;
-#endif
     find_gnttab_region(d, kinfo);
     if ( is_domain_direct_mapped(d) )
         allocate_memory_11(d, kinfo);
diff --git a/xen/arch/arm/include/asm/arm32/domain.h b/xen/arch/arm/include=
/asm/arm32/domain.h
index 1bd0735c9194..30e8818ff2ae 100644
--- a/xen/arch/arm/include/asm/arm32/domain.h
+++ b/xen/arch/arm/include/asm/arm32/domain.h
@@ -3,11 +3,23 @@
 #ifndef ARM_ARM32_DOMAIN_H
 #define ARM_ARM32_DOMAIN_H
=20
+struct kernel_info;
+
 /* Arm32 always runs guests in AArch32 mode */
=20
 #define is_32bit_domain(d) ((void)(d), 1)
 #define is_64bit_domain(d) ((void)(d), 0)
=20
+static inline bool is_aarch32_enabled(void)
+{
+    return true;
+}
+
+static inline int arm64_set_domain_type(struct kernel_info *kinfo)
+{
+    return 0;
+}
+
 #endif /* ARM_ARM32_DOMAIN_H */
=20
 /*
diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/include=
/asm/arm64/domain.h
index 1a2d73950bf0..bebcbc582f97 100644
--- a/xen/arch/arm/include/asm/arm64/domain.h
+++ b/xen/arch/arm/include/asm/arm64/domain.h
@@ -3,6 +3,10 @@
 #ifndef ARM_ARM64_DOMAIN_H
 #define ARM_ARM64_DOMAIN_H
=20
+#include <asm/cpufeature.h>
+
+struct kernel_info;
+
 /*
  * Returns true if guest execution state is AArch32
  *
@@ -17,6 +21,25 @@
  */
 #define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
=20
+/*
+ * Arm64 declares AArch32 (32bit) Execution State support in the
+ * Processor Feature Registers (PFR0), but also can be disabled manually.
+ */
+static inline bool is_aarch32_enabled(void)
+{
+    return IS_ENABLED(CONFIG_ARM64_AARCH32) && cpu_has_el1_32;
+}
+
+/*
+ * Set domain type from struct kernel_info which defines guest Execution
+ * State AArch32/AArch64 during regular dom0 or predefined (dom0less)
+ * domains creation .
+ * Type must be set before allocate_memory or create vcpus.
+ *
+ * @kinfo: pointer to the kinfo structure.
+ */
+int arm64_set_domain_type(struct kernel_info *kinfo);
+
 #endif /* ARM_ARM64_DOMAIN_H */
=20
 /*
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index bb35afe56cec..c29573f0ffec 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -530,7 +530,7 @@ static int __init init_xen_cap_info(void)
 #ifdef CONFIG_ARM_64
     safe_strcat(xen_cap_info, "xen-3.0-aarch64 ");
 #endif
-    if ( cpu_has_aarch32 )
+    if ( is_aarch32_enabled() )
         safe_strcat(xen_cap_info, "xen-3.0-armv7l ");
=20
     return 0;
--=20
2.34.1

