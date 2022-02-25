Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30A94C43E1
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 12:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279033.476545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNZ46-0002Cg-C1; Fri, 25 Feb 2022 11:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279033.476545; Fri, 25 Feb 2022 11:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNZ46-0002AA-94; Fri, 25 Feb 2022 11:47:14 +0000
Received: by outflank-mailman (input) for mailman id 279033;
 Fri, 25 Feb 2022 11:47:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfiy=TI=citrix.com=prvs=0484f4aa7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNZ45-0002A4-1Y
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 11:47:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9cc1772-9630-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 12:47:11 +0100 (CET)
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
X-Inumbo-ID: a9cc1772-9630-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645789631;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=0Ktb92adsVkmWTCw5E6AmJZ00+bq5/0UXmMSrAVMpSU=;
  b=iAkN2Rb8CbX6QWRUHgYhm+QedTpwhgWLorpRlvdLATG8udSYLqFXnwPu
   4PyIHwWlIZJQicdi9DabFbLIvcxQEkPOQgvkvzUAopXsV2ySoSj+oeKFE
   6V//NAlckxggAVmBxaoTG5KPQEzra7O923wJdwyZZ5WQjBzlkq4j0T7DJ
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64985351
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:O3EBhKKs4Al757lWFE+R05UlxSXFcZb7ZxGr2PjKsXjdYENShGdTn
 DFKDG7QbKveamX0c90jYdzk808GvcXQm4VkHFFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2NQ12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OpLm6ybYwgzBOrRhO03fB1BIyZzAZQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gls15ATRquHD
 yYfQSg0agnpbiQeBnEGUo4TvP+4vXfUVgQN/Tp5ooJoujOOnWSdyoPFMtDYZ9iLTsV9hVuDq
 yTN+GGRKgEXMpmTxCSI9lqoh/TThmXrVYQKDrq6+/V2xlqJyQQu5AY+DAXh56Pj0wjnBowZe
 xd8FjcSQbYay0qFfvLXUAeC52OYtzQzX8NgFOAG0VTYokbL2DqxCm8BRz9HTdUpss4qWDAnv
 mO0c8PV6S9H6+PMFy/EnluAhXbrYHVOczdeDcMRZVZdu7HeTJcPYgUjpzqJOIq8lZXLFD752
 FhmRwBu1uxI3abnO0hWlG0rYg5ARLCVH2bZBS2NBwpJCz+Vgqb/NuREDnCBsJ59wH6xFAXpg
 ZT9s5H2ABoyJZ+MjjeRZ+4GAauk4f2IWBWF3wIyQMV4q2n1oyb7FWy13N2YDB04WirjUWW0C
 HI/RCsLvMMDVJdURfUfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDJrDwk1DXN8K1vFyRB2+YlmY
 M/zWZ/1UR4yVPQ2pBLrFrx1+eJ6mUgDKZb7GMmTI+KPiuHFOhZ4iN4tbTOzUwzOxPjc8VWNr
 o0GbJPiJtc2eLSWXxQ7OLU7dDgiBXM6GYr3u4pQcOuCKRBhA2YvF7naxrZJRmCvt/09ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:HNVGa60VKQdNEG4iYLxt8AqjBLYkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rf6gylNyri9vNMkY
 dMGpIObeEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64985351"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQ7B3ukD7yRi8vctcmCEY/+ppIS1yXl5Ew9TypzlYcorf73Zft2gzwEGAr2TNj1XOVBprx+fw+rmMA6wUpSAeMkzwwLcFi88/Ri3NRkfS5Ikz6rWaoPHx6Oykaq3CGHkVGgCgzXgTmD1WGABxbC73pNd9QAD+APcHp5H8ERclYZNJxJrgX7t2Zg8JwmccefXii5ceA1ps0IA3MOcWPvR4n+dKI6E0y6ppbAn0R+pubTJSeFdePQx01X2Jo70qhhY90Y0hH0oBhPHIXitd/YcBYJ6zZdCScH3Nfqnw/eucQdbObB5zgQ3dvPwTrrdMwlOs8C0cP7L9vg3BF0QV5zQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yx4r1lSZIl1pe2SrW52IVtMxwtt6xWeMduyLUDwhOFc=;
 b=ZycM94aGaz/GDb7qsf3y60aUp6NrJPKDTjYQbG4o3sneLguMlLzr7GxSxz7P99s+NietpOAnEAkPcFpTqzptNRdazSihZsjWjIsoptK5vA9RrDkJrEhQ8n4aWALKQw2XjNpbxk/dz+m6X7nWog9WALzY/kEanTY1wg6aHn+N7t6llwcrx1LyyTjg2h2aTXNy0u8kpOb0QGAZcPA9DqL5S2WduD68BAmiMp4CiNuD+qK415CdMpAlAQ98hyhDduUHzuqYYZBh4QB4YI1PHFPZn6kHBRQ3skKdEAhwFKi31FTxm+Y6uqOns4U2xCTZqnM42AG9Tj/tbiB72JxilPk33g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yx4r1lSZIl1pe2SrW52IVtMxwtt6xWeMduyLUDwhOFc=;
 b=oTfOuiyKztwsUZFy0DaBMeZ7RUO21MgPKaSdTSOPR5O5dUGJqK+WkTnKpGQdfVzHE+BzlGhnQbWwlbTeExqTfpqxiAUogLqY36LO852rcTP3H/wE0qhkNBNPu4EtGJ0BpNFLsSOJ4jkRMFXBr12RtxypZ2TtlK1boofqPxlxd5Y=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] vpci/msix: fix PBA accesses
Date: Fri, 25 Feb 2022 12:46:47 +0100
Message-ID: <20220225114647.93879-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c966e0b-d76e-4596-8c9f-08d9f854887f
X-MS-TrafficTypeDiagnostic: MWHPR03MB2896:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB28965D4D2C6366F1692826768F3E9@MWHPR03MB2896.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q2A8oXFuEFOHiK8sk47CNAPGjjONGP9c6cj26B4XwTADZPV1WKJejTizWTOjsn7uTwr0aPg/0SWKVEirOuN/iEyAVa4PPCNL917T/2iWXJy2l7YgRH1Qr1752ZGb7YokwK6TBQ7yvJ6h+YLAFeua8ELkrMbZykx9MU0S4jSfcBsR/7p/HoavihIOFfCkpq6QnYJ/H5MCr76kVI4Dx/sB1vvU8JpeeTbtm0w5Eo/VSoBPtO4LLNjAEBuN9LK/+K4hy6Z9bIMB+tVt5y6iePlSsca19YE89/p/6nughkckqFtddQ6PZy+2QKh21ldld8ccw+osAMOpIgB2fsEc/o9hlgC7dVAzRdl3fx7yU/E1Q1+xnJ4YzFl7bEtxS/Xzk2vkJvx3Y9mPyjuBV8lYHo9rvhQvnMp2deM2H18LcIaucqn40XbleXRRiHfRIbZ9Z1UjY1+MWjUmYJyx195Su3einjrECkemSyhVG4sTwHiqDDyswfL1Jr52/elSpM9ycs4jH1Erxx2ywxCL/K2DzEgShcC+KeAsc5UCoWqiHwVNS2uDI7ve7Wv8ISvvJVuRxBfIyfomKVHbSqqzRSeOUOj4NlV0TFyPMa2+wKN1w+QYdYe7GuQFu3ssT4wWvEjIjmo8b53JThA7FmcPf6VG6VSEQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(8936002)(6916009)(508600001)(6486002)(54906003)(38100700002)(316002)(82960400001)(1076003)(2616005)(4326008)(2906002)(8676002)(6666004)(26005)(6512007)(6506007)(86362001)(5660300002)(66476007)(66556008)(186003)(66946007)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnovNTBWUTg4MHdZclUrMVdxVDZGTUVvK2RDNW5yM0VoUmZHcUwxcVdQR0dJ?=
 =?utf-8?B?WjBQMlNUZHVBbzlnWjk2R2hwcUNJNC85RE1yMTJDMFBUclZFTUZSMlladTJQ?=
 =?utf-8?B?L1c4WVE5ZUkzVFVJc0F2M3liKzNTRDRBNWpqTkhaNENzZnZrMHI0MlB1UnNN?=
 =?utf-8?B?eXRtYnZJVkVqQndyVE1RVFMvZEh6YmxuSXJTMWFhYjJWOEFnYzZyZUdXMWNr?=
 =?utf-8?B?eUtyb2o1bVdUUHhMZmx3QVQrT2c1WlB4UTdDNWNieVFIVkMzVXBiSzhJczBI?=
 =?utf-8?B?SEpBNTZmVTV6REw0VkM4bFdiQzZyS2IvR0dUcW5xL3VrS0JHUlhtNWEvQ0Zx?=
 =?utf-8?B?d3JOTzFNQTlNR2ptRThYSUx3MUZOWEg3QmRwTjFxcEFOVTE2WVhpbnV4V0R3?=
 =?utf-8?B?UjY3ai8vK3ZGNE5GQklCRElSMlVyZXdKWHd5aWhZZStZNzdMUDRQbk1pYlNn?=
 =?utf-8?B?M0RKN3J4aHJZQXVDY0ZDb3d3dS9JN0tYenhDdldKK0RTenk0dVJoalpESm1X?=
 =?utf-8?B?ajlMc3ZBV1VocXFRWGd1Umg1TEtzNDRzcW5CcGF1K2x1bjduZ3NJa25kMnp6?=
 =?utf-8?B?Ym9GZmF3NEVwZW1ROXVOM0o0ZE9rWmdGYXdGOSt6dS9aYlEzbk5qQ3VJQjh2?=
 =?utf-8?B?Zzl1Q25TdEZ1S2pnVGZId0tLY1VYM2I4clVBUTFYcHVqdjBwNXEvbGYyeGNt?=
 =?utf-8?B?Sit1Q2cyNnhhdFpVN1g1Y0VlUWlCK1RYcUl2RnNtdzVxU0c0MlFBNWpudzVY?=
 =?utf-8?B?T3pPbWVYVDhTaUJsMmdkeTFzNHg4aWlwc2Vad1pSYnBoZ2VNMnEzTUMyVzRH?=
 =?utf-8?B?NU9NL1NzQ0VPbUhaNEtiYXhRT1BkcHovRjZXbjY2Z29CT2VObXdyY3p0MlY4?=
 =?utf-8?B?Z1plenBETzVxMTkyOWU1WkJSYUNoODZyUSs3aXpWRlJSNlFkeGFHRmFXa1lh?=
 =?utf-8?B?ejA0Y3JHNUJBVXZzQkc1ZnhBUkNRYTd0b3ZrbFJ5VnRTYzlQZG01QStoSUtx?=
 =?utf-8?B?UHpxNHFKOTlSSmRUVVR3YkthRVZydWgxQWlNQSt5bUJWajB4bzJjdExGSWx5?=
 =?utf-8?B?S2JzMUtkZUtJNjJ6WmFPMlpxSzRqeVlSOXdYME1NNlRPV3JRUGtGNHNxSXc1?=
 =?utf-8?B?ejllRG5IRUduTFdGQWJRQ2VkbjcxaUNwTlhIK2dxN0daNSt4UkdKZFdMWmw3?=
 =?utf-8?B?Q0Rvb2c0SGNZYzJHOHBLV0kxNW5ZV29qWlBuZWRuajBicS9KdDJkOUUwcE9G?=
 =?utf-8?B?VWdZdzRPZ09QTXBaUm51UnZYRW9ONE1LU2x4WGZWYzl5b0FPRTBtUFJ2RVAz?=
 =?utf-8?B?UnV1eGNWUEZiVVZxYkEvUXFFYnorUm4rb1pnQVBYQU40T2N5ZVBrTEFBaWlP?=
 =?utf-8?B?QmdFNHMzWXBDaEZRN1o3TW1KVG1RYTBxZjMrcFZCRi84ckZ2ZzZSaStiZjhT?=
 =?utf-8?B?czlKNmF5Nm1YT2tkT3pEN1JOWWE3Y20zbTRpT1Q0RUViTy9xd2FjRDErSTc0?=
 =?utf-8?B?RHNMNXBmekxISXVtdTl5dTFrMTNESjBMWE0yWllkSGppbWFYeUpYdkZQVXpI?=
 =?utf-8?B?U3pxd000dmJoZkxNTkxhRnppU0d2bjgxL2JPellqeFhHMmgxUFk4STU5RzZD?=
 =?utf-8?B?YzNITWIzMVdJZ2V3VHdBYm9xR0w0WTJibGlCRW15VHFOeGZzYlpDUU1CTEVZ?=
 =?utf-8?B?dTE2T2I3OWZnTlR5cVJCMndaazRlSkNrQ2hDVnR4Q1lzcklaQ1FHTHU4bU5y?=
 =?utf-8?B?c280NFRVaVJHVE5GVnErSnB4Q0Fsc2RJd3JTYlRrN0Z0Z29SZmtQY2FMLzJp?=
 =?utf-8?B?b3JrTUVYZEVUOWxaUlhuTEkrSmg5TkpqVXdxY1BML0RMSC8zWnRCb29mWVRF?=
 =?utf-8?B?cTFXR0diUnltZEtyb1V1dDE0bE05K0Y3akNNQUhTeVg1UUNZREtRV0dLUnZz?=
 =?utf-8?B?dkpDbStIRTRPckRoQUJjZ3pyWHFRYXNPa1huQmZIbCthL1ppNHZBL3M2djRv?=
 =?utf-8?B?NWs4RGoxbTdOOGFsU1NqY2xwSHJWcFI1Qm5WVDZVaHJGTlNTVnhPQ3JQTi8v?=
 =?utf-8?B?clVrWk1aS2YwODRZbGdFdENjU01oZFVsKzRnVXhzM1Jsd25xdWttTWd0OXRJ?=
 =?utf-8?B?SmIydGhZbFU0c2NGZERCRVFZa0hNMDZUZkY3RkJuYUVSeHh0MHIwNWVlbldV?=
 =?utf-8?Q?ZbL74SHs9vD2L3blOg+y+K0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c966e0b-d76e-4596-8c9f-08d9f854887f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 11:47:00.2043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIYiGkilxNq9B27A8fPHOtBuXCOLKga7NYxACYg5cz/1d/viMssS3mgSxjmu0AO59UetFIzuMqIU2eNdUMq1xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2896
X-OriginatorOrg: citrix.com

Map the PBA in order to access it from the MSI-X read handler. Note
that previously the handler will pass the physical host address into
the read{l,q} handlers, which is wrong as those expect a linear
address.

Map the PBA using ioremap when the first access is performed. Note
that 32bit arches might want to abstract the call to ioremap into a
vPCI arch handler, so they can use a fixmap range to map the PBA.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I don't seem to have a box with a driver that will try to access the
PBA, so I would consider this specific code path only build tested. At
least it doesn't seem to regress the current state of vPCI.
---
 xen/drivers/vpci/msix.c | 28 +++++++++++++++++++++++++---
 xen/drivers/vpci/vpci.c |  2 ++
 xen/include/xen/vpci.h  |  2 ++
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 846f1b8d70..70085e98b9 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -198,8 +198,13 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
     if ( !access_allowed(msix->pdev, addr, len) )
         return X86EMUL_OKAY;
 
+    spin_lock(&msix->pdev->vpci->lock);
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
+        struct vpci *vpci = msix->pdev->vpci;
+        paddr_t base = vmsix_table_addr(vpci, VPCI_MSIX_PBA);
+        unsigned int idx = addr - base;
+
         /*
          * Access to PBA.
          *
@@ -207,25 +212,42 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
          * guest address space. If this changes the address will need to be
          * translated.
          */
+
+        if ( !msix->pba )
+        {
+            msix->pba = ioremap(base, vmsix_table_size(vpci, VPCI_MSIX_PBA));
+            if ( !msix->pba )
+            {
+                /*
+                 * If unable to map the PBA return all 1s (all pending): it's
+                 * likely better to trigger spurious events than drop them.
+                 */
+                spin_unlock(&vpci->lock);
+                gprintk(XENLOG_WARNING, "%pp: unable to map MSI-X PBA\n",
+                        msix->pdev);
+                return X86EMUL_OKAY;
+           }
+        }
+
         switch ( len )
         {
         case 4:
-            *data = readl(addr);
+            *data = readl(msix->pba + idx);
             break;
 
         case 8:
-            *data = readq(addr);
+            *data = readq(msix->pba + idx);
             break;
 
         default:
             ASSERT_UNREACHABLE();
             break;
         }
+        spin_unlock(&vpci->lock);
 
         return X86EMUL_OKAY;
     }
 
-    spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index fb0947179b..f8674f3ea8 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -51,6 +51,8 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
+    if ( pdev->vpci->msix && pdev->vpci->msix->pba )
+        iounmap(pdev->vpci->msix->pba);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e8ac1eb395..bf93fc8d22 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -127,6 +127,8 @@ struct vpci {
         bool enabled         : 1;
         /* Masked? */
         bool masked          : 1;
+        /* PBA map */
+        void *pba;
         /* Entries. */
         struct vpci_msix_entry {
             uint64_t addr;
-- 
2.34.1


