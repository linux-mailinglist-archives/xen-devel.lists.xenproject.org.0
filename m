Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEA16B2A9C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 17:20:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508327.782914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paIzp-0004bN-Cd; Thu, 09 Mar 2023 16:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508327.782914; Thu, 09 Mar 2023 16:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paIzp-0004YH-8z; Thu, 09 Mar 2023 16:20:01 +0000
Received: by outflank-mailman (input) for mailman id 508327;
 Thu, 09 Mar 2023 16:20:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaV7=7B=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1paIzo-0004YB-F3
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 16:20:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c5e9dd7-be96-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 17:19:59 +0100 (CET)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by AM9PR04MB7667.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 16:19:56 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487%4]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 16:19:56 +0000
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
X-Inumbo-ID: 3c5e9dd7-be96-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5DuWm+rI847UkkMaoPZGlho+qQrjI7n5ckR7B+CKYNqIHVQJct9mgwH+bH/y8b37T5MdhuUUK7DZ4Qa4I24PQebc9cdK+Eh0GsHgQt+wJjcSlN0OXt/l8XKds10/8mWjOQW0H+dtpaGdW+7Q/LLwmVDfhL887U2dubcCUUqO1uDGeEiN5/HdOQPlY2ECU3ZFkt6IlRkwMw6zKRe2vW0MGbKqhIqmOjmTnd7xChAsR/yv4R1qBqLHi5zC79snx+V7h93ybHDdstLzikpiYd0dEDjyPgb4gFW55/CFKu7ESoWYma0ZdqK2kZcfbWYkEavDJC0O8rRAXedz9yXXjqb+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bTt5zhJULGm/vo8RbHug4DIETlhKUeesiyygA6gBJ0=;
 b=OPU2gNu+OhyB8qfgHGC6UWJvEagiYd8fRIImCKQF2jsE6hGKnu1cfrdrlo+QdteOVh3geXwHxzJAwLjZfOV7RTsertKNMX/PeYitwZ8YTz0KwMDrGe9veejMcX1OMPFpAm3uvVajIy6MV4bCElajz1wxeYpr5dcPSIkFxmyqL+rJekragO9KfPuswZUSvF+UDUc690o2GVL1LlMiDCNHCudEtMx+X8zx9qiZFvCniuVutHPTEoMwO1X+9vb61uyMtce//MKmB0BOiegs+dNywgvp8BAR8Wcxg/jAiAS3W/ARE1gbxVXImQxTnNi7P1P/wU75+qFgvGTAalJdtWvgOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bTt5zhJULGm/vo8RbHug4DIETlhKUeesiyygA6gBJ0=;
 b=R7mbtTXaX7/+nXIrnBk88XsBKRTgH7HXy527Ev8jj+7TM3zAoCkfZJvgzjEayJgIvMGbpag6BCkNZ35Gz41SjWp1euy/SYkXdS7yGXtW+04jhCRQycMqHZb1Cx0KVPSGYNTmXNaFH6/huGJqKqnxlBkkG0ALRbBRXtYbjed0NA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [PATCH v2 0/2] Fix ARM Generic Timer interrupt parsing
Date: Thu,  9 Mar 2023 18:19:31 +0200
Message-Id: <20230309161933.1336367-1-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0138.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::35) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|AM9PR04MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ef81d1-390c-4dab-62cb-08db20ba1ef2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	84f+YjNfDEWjTllVMqSQzdmIhA8MKb2l13sDkELtrtA2CB3G8PN3Ky7uToDxLPKyjfAS9NJa5tEovDGzrncrZU8XG20A53Kk2u8S9w3zpfKKsoJPKBmZZnnHDOSDof3z0HQrqXR8z8tspMveWWdZss89rThugPYcVubL1tyZwCdBp4htdDB7WzjVtuk9k5DSi8mWISb8+d5L6I8yuEYvNaADxsaX8NypnGzYoPqhpvVIU0dzVhtNv1jT1WqxZ9MC0xiutuizCU6sYxQE4vbXkL7/MFFf3lbZN0UURHYc+79nFhLtnPKDC0nfY0pJ6UQDgL9Zw5PXeGn75lRaQ1F1I/xpY8RrQtAFEdcc14Vvc49IK2lB4pvbmaCQyo5FI2thtE2L9BIrZ1JNj6OhHfjnQRVr4/rv/zbDiLY+FHrfVGn+EC59cHyU3T4Pj9swgm18wK+aT4a4VuMSNCubFRs9N1tA3/KUpNFIW0u3zmlmClVW7FrGaHD56YkVqXuxQtt+LxswEUCrtVwlY+Pn5cVAMYpoWBMvFb6CjU4bTsWyNJwlZdfD6BdiCpJiwdEDM6VXHPPnySiEV5o7n+Ahx08eBFCMh5Pehi4+NYNdVeCfKeO5ehO6n3KdNa19Evnm/l1rQ9KNdzKhKI8FLct9mt3V8pISP3ixQxxm6XFEE9jhNzrvbWkrL3Ne9TuvJFnxslGg9no5h7xDom0VrVlWdG2YQR5hgumMUTHWvAH+Lpudtr4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199018)(86362001)(316002)(52116002)(478600001)(6486002)(2906002)(8936002)(5660300002)(4326008)(6916009)(66946007)(8676002)(66476007)(66556008)(41300700001)(1076003)(38100700002)(38350700002)(186003)(2616005)(6666004)(6506007)(26005)(6512007)(83380400001)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k8qDF8xeRbeKiMFBxzT1lHInuw0X7GkANyARAXB2IUEcm7osBLc1ayPs1ELj?=
 =?us-ascii?Q?IeuUF602MA00l22HDx6k2k20xwPs0fjpUkKmdTrRISkZEt92TaQvE8z3bbl4?=
 =?us-ascii?Q?Nkm9xMhpDwULc+FRVkNd8TzR8+r9v0U3CWWA8H/8bYF2g8wp4hjnztmo2d31?=
 =?us-ascii?Q?CRfg6X+Rlf0wxGF86X1NH3maURyrUB2tlQ6Ah4ktZoMGYVx3TtK59eT7XlSZ?=
 =?us-ascii?Q?LxVeXcElnHWV5HaUGYdcxCtL7dBxC91XbNxZ0F6p3viegvT/OlLWChe9/lhS?=
 =?us-ascii?Q?ahX5+9Wd0qj7auD/PovxbAx0bmjsOe4Ufss2A3AUGngUpcpOccfo7AKOt47Z?=
 =?us-ascii?Q?QDbGYBfElfvY1RdXCohzBoUzYZlRA/Fe5NDJEaRZlSACEiS1PqH+YmrTaKA6?=
 =?us-ascii?Q?tH5mzDR5Kh3a8q5dg05kpFZpivDuYWfB6MVxTh8CcwTwQKzxjQEBgRS6I+GG?=
 =?us-ascii?Q?UyWvCBWqV26PFHTFDB0yFEL68zkdNDJEJIrqyFAaEyHptNOBTpTTkOutUMCv?=
 =?us-ascii?Q?+QlR72jrvXEhzeUUu+ggFBJMjgRzRSS+L2MwoF6AWj/CEcstrqu8Zepf7UGL?=
 =?us-ascii?Q?b1ZsVSDMwC/pSgOjshku6qTIza1MmNUfvkw94CoZD4G4RuiyuOk6tody76lG?=
 =?us-ascii?Q?wDZLjC/H6uveLd1p4/nsa2ZInvWG4ViSidpgXt/ZduqqtcUwXqaqy0EOHIhl?=
 =?us-ascii?Q?Ns2H0tiQbFL5Y5fA4LDX61kOZQXMZGZnk0bxxlY9anK5aGNla+/cZw2wpsmv?=
 =?us-ascii?Q?FtVOzQRabPC/e1MC157ldiWbbKiR5Cb6CCOG0W/LEiJKe18nXBerT6CrcZFJ?=
 =?us-ascii?Q?sEJBB4iaP/OzLjQkif5pgNc06jUYTF7IkYkdcFMpeWroikPnOP4CtPjfFaZV?=
 =?us-ascii?Q?uTjVb5wAKy1XAQgyCwJQ9uQ66QqArGxZbhpfmrkYgpzDwPbvWA0Is3CEWlxR?=
 =?us-ascii?Q?1KDaM90rSbIT+ArDHTyhvOFs2d/hkmKz+8JMB6OkDekIU+OxGUDSmV9DrkaA?=
 =?us-ascii?Q?smuafSKJS5HIdZ09XIR8rTaAAjsoK7GGW591HYAnlhV48NWLPk5k2VRKDbBf?=
 =?us-ascii?Q?GrY7ofOrpoUiH5RtRFYM6QbZ8SbfU87MoZ61uctw+h3caMNX99svx1OtzdJV?=
 =?us-ascii?Q?WGTsaf1bz6kkrKYFiCHMVeBR8eEGTpmSQemSmIAjW2S4PFIp3QygW+7pmgjo?=
 =?us-ascii?Q?PFe2g6Rna+ZvhpIf0Q/BC542zvj+sULSYNeOnQ+Q/Fn/U2pKdpN8kz7S+tpo?=
 =?us-ascii?Q?0xlPi7IP+Q5TgCdBa1ocWctC8Zg+Uwo7Cs299KgHxZQ5sIpQOEGkJFbwCEkf?=
 =?us-ascii?Q?8VojbN/zvr/vNAlUZL5jKigloMl2Iz+raE/Il5DQKmvSWn6pEuH3VXPKv3k6?=
 =?us-ascii?Q?UTrnxie1gCGaI7b81yu5GUj1lfya1sQkmYctDFy91Vrl/kDviPQcpkd1j6Gp?=
 =?us-ascii?Q?79JiLwXsj3Q86c7D4SGGKiybXKjZvuEkTFKiDJXB1E4qAn6vI+WE7yClIaig?=
 =?us-ascii?Q?816OcdnywPjQ3VaF4ZJ9B1mwuVOTNY9tZ42NFzY+qlXeqtO7n308pTIZ812i?=
 =?us-ascii?Q?VuWAUj20ZcktWH+dzUCi+G52UGST2Yk8XnL07JL3Kn5LnKvJ5iiPpD7kcd94?=
 =?us-ascii?Q?/g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ef81d1-390c-4dab-62cb-08db20ba1ef2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 16:19:56.3889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXhVONaDM0UW4O3o9I4LNcgjSjQkvgEkQWW9cpJpsm2LLKO9Dg4kpafrfjHkvz8UP7YbqraAmWWTJETFwS8VDlLdLOhgPcCqvadlpJABBC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7667

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

This 2-patch series fixes the parsing of the ARM Generic Timer
interrupts from the device tree.

If the generic timer interrupts order in the DT was different than
the expected order in Xen code, these interrupts would no longer be
correctly parsed and registered by Xen, and would result in boot
failure.

This method with using "interrupt-names" for the generic timer
interrupts instead of having them hardcoded in the DTB in a specific
order is the newer approach already implemented in Linux. Xen did not
have the necessary code for this approach, and it has been implemented
by the means of this patch series.

Functionality should remain the same if "interrupt-names" is not
present in the Generic Timer DTB node of the platform, but the
interrupts should then still be present in the expected "sec-phys",
"phys", "virt", "hyp-phys", "hyp-virt" order. If "interrupt-names"
is present, now it is also correctly handled.

Changes v1->v2:
 - Rebased on latest staging as of 2023-03-09
 - Fixed coding style of comment added in 2nd commit
 - Added to 2nd commit message explanation as to why 0 should
be treated as an error case for platform_get_irq

Andrei Cherechesu (2):
  arch/arm: irq: Add platform_get_irq_byname() implementation
  arch/arm: time: Add support for parsing interrupts by names

 xen/arch/arm/include/asm/irq.h        |  2 ++
 xen/arch/arm/include/asm/time.h       |  3 ++-
 xen/arch/arm/irq.c                    | 14 +++++++++++
 xen/arch/arm/time.c                   | 27 ++++++++++++++++++---
 xen/drivers/passthrough/arm/smmu-v3.c | 35 +++++----------------------
 5 files changed, 47 insertions(+), 34 deletions(-)

-- 
2.35.1


