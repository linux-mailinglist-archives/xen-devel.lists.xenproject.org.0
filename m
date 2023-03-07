Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7686ADB7B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 11:11:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507262.780541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUHQ-00068A-H0; Tue, 07 Mar 2023 10:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507262.780541; Tue, 07 Mar 2023 10:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUHQ-00065d-EG; Tue, 07 Mar 2023 10:10:48 +0000
Received: by outflank-mailman (input) for mailman id 507262;
 Tue, 07 Mar 2023 10:10:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ob8o=67=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1pZUHO-00065X-6H
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 10:10:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52883f9f-bcd0-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 11:10:44 +0100 (CET)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by PAXPR04MB8094.eurprd04.prod.outlook.com (2603:10a6:102:1c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 10:10:41 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487%4]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:10:41 +0000
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
X-Inumbo-ID: 52883f9f-bcd0-11ed-96b5-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvEdzOSw1rhiQck+CykGp8XyuoR5LIeMa2IPCKgLCP7oNcSZsg3FYpL/JdXxePtZPnM5xF2Tnnq4RoFXZQ/+DkchsPBR4o8jhZGyYeW9R1JUVeony9x5Z9ybxhCOUxB93Wtg2QszcNtaIgCgzCdAJ9ccLXSXtwDjRt31aY412bzwG5CuBSl7BGGW2pJv/9WTa2hAZNxvBA23BV+gRj5Qt2bzfUMTuMqViTDGsTnM25Kp+RIxAFVrgi0TkcSxhfyF/qbqVbzhXVtVGMkpGN6eJHFY/nX1krW/fYQg0rWZUe5Zu5O5INloYLV59sLsLSvGvH8pG5Va631jg5ymIK9QMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXeBE1/jUqceiRWYKQbfilh/+nWktBFKKG1WSu9F9Ig=;
 b=PiIzuH8FHi64gR2m6h6PyeZqNV7SYdEYRpQsRw6rAjaCPLOHDahSlMhOKbRU2j9bUwD/+s9R4A0d03WOyqqypg1jIyAN5Z85q/uFMkfFiTGj6NRJp9lRyHXPco3xg0HKJHOclKtx4zEWmRYOh80RpiWAgHOtCQpikZIyS0CxtbkHoOXrfFtiX2bHUvdoYVxd7jJG00iP3MfW7sxAom+UOSbc61kTNyVapARHZanffcDvP3oGPN39ZLAxnqIdTwwZXaiL6AVV1te9iPajeSmngiztEL4LWJLZCmg/mSvEcPMfQDlfzmqKkuBOJTOVtkfLic73EP4Egp+h8VuJnjVriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXeBE1/jUqceiRWYKQbfilh/+nWktBFKKG1WSu9F9Ig=;
 b=KfanVV7JoUmvpVp4ABQJmXEkMznCniE15UhdEThOB5A04MwNlFUGotoYrjiPsyyutmpW3n7RRsWkPrdA9AOwpBgzWAF0G7d9buGt5430f0pf9BhUbfBIKa/5H5Pm8EIfZpoSj4eNHjmtrN/LREeBKIzKcpgsdAjhEacu0hJTNWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [PATCH v1 0/2] Fix ARM Generic Timer interrupt parsing
Date: Tue,  7 Mar 2023 12:09:47 +0200
Message-Id: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P250CA0006.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::11) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|PAXPR04MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: dbde6252-e2ee-4ec6-5ba5-08db1ef434e7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/IRSviBWNvBw7c4QdThF6o47hgWIwZL/OIifncUY1YJuh7cvyQvvnDYWLsl4yul4NoyOUJVkyBlh4oHf616DxM/OYnAd/HtJNlB8IGLkCZ/rSiES7FEs9X5n1YAR34ykiHeqmlSGRAGnWYMsRibKHa8ZDxK1q6UWsDCmNQ1MQDxFCiIInimQB8w23Sh0fXeixuU2QDMtsVUpSdsWHJwn5YB6qzdjfCmrN75WdSrpOpvf1oQeaEARIJDbyj3iLQ9XJXLvuHFFv6oeaML0wND2cNiSujj8ndyfW4CTcgb/YGTc7lXvvPwVSqQTfMk/XCxoba1uNM6TDErBAlwNjHe3NBfnGknsMUr+9t1+o5yT7ZBHT9jZ2CFakKVwwnSoGwHt/IGRfAR/e9pzf62YMm8mfFfAsntec/C36eCcrvEy7RZpJITNWhqnkG3RjrJg94mwOX640lzv6aMlE6bj1qA9UjhMpl5pYtWT+N9bbkswVjvp8cfJ4D9eLyvHUI9qpMWV842Nw+BSbhfMbxw+Leg0UoJGuX/0XRgYHxGNs976PoWJYFr9mp4b8yWF4aCRk6myYq/ajmeHYnlOWu/GGRkYFx5Uf0HDzXukeTBjXpOBZFS+Wmh7W/09b5t+BwknscjoiDcRrOj8PxxIjgWxEZgs1aJJ8w20Bo4iQCnUlJZX2ULifMcz/YxWv/VMLeMQ7F0xXQ/gtQACTjeHibD5v5dxW/WWGQ5xEVLvnXAHtVZW6TY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199018)(5660300002)(8936002)(2906002)(41300700001)(4326008)(66946007)(6916009)(66556008)(83380400001)(66476007)(8676002)(316002)(478600001)(6486002)(52116002)(1076003)(6512007)(6506007)(86362001)(186003)(38100700002)(26005)(2616005)(38350700002)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8ZvX5b55Z/Ev58JLVEORY2zAVb1E1/H18AS90D3koG6txEqxjytxhRYNG3K4?=
 =?us-ascii?Q?OsT2KTc1uIrYj/k+I/d6JEvBky39JLCBR2+fP+QDl+qCyHJS17lOjfAp4lAw?=
 =?us-ascii?Q?8lkqQCAFGshRj0El8hYtFoiRqKphYPD6MgY4h5HAgPXYz2lZ8fujhqwEhSxG?=
 =?us-ascii?Q?MoNUBrNZJqXhfbYLC21lZiRdCeHZpkfNTrHjC7da3SBThp+kgaQKeMQjoGSa?=
 =?us-ascii?Q?frubTVCyTG1GdOfFHUOCDOeQNEI9nEr0gPqe8b0Afy9jiS/ntpNltxzhQ8jt?=
 =?us-ascii?Q?GgfhrrYXWhpKeuvkkL9tyOAyNaN8vxZeZfCJ/+N3Pgm7gsKDZr795JUR92+N?=
 =?us-ascii?Q?qpJNypIMAtnGMGPInBI8bT4Qq6RXH5SotxRW9ngGQwxnknELapvgoAGvDTLi?=
 =?us-ascii?Q?U2zDC63bnujMdlAapAWnn1VgXluwZq0cXfBB7YH9ik+gDfQT3vbNltV9IraC?=
 =?us-ascii?Q?zy3l3CbEn1UMPEcHWqnKfPIaUxE146HdYh+cmBe2tiR59Jsa5uuHWo+bgl7i?=
 =?us-ascii?Q?jK43YIdYqpuDcxtB2xdCuHWtRGYOC7AaErKJ9rFwSzk8s5sSxoMEfvopnqsH?=
 =?us-ascii?Q?PLHwPXaOepK4UwMZ+Dup8/CCg1JWZ4ckiojvLiPHjC/GBcbGM+bAJTNCEpkq?=
 =?us-ascii?Q?V2pzuc1pfpnZ4sU9V/Qu4DIvHo/MiHdkgNl+gDiciBow89s/YeMkHC8EwgNU?=
 =?us-ascii?Q?kBYGo/6IqU/4g6sp55zlPqKS6WAuj3sUfOU8hzaKAc1uvQDqduiML8bNUzui?=
 =?us-ascii?Q?wE27YdAoF7lolpc7XXPAf5vi4rW1dJ+2Wbus8QO1941Hep+YsU842VLIyeYA?=
 =?us-ascii?Q?yg2SMJ6nOisyBySOpCcaCXn8+gNMDuLmJdvjInPb+6cnAMPu0kT6zRDDNtVI?=
 =?us-ascii?Q?zF2q9ZK8/vq8sjuzx7gemuUZrbuLJQ+Ba+PZMx42tLEt//83n0UBoWuCoesH?=
 =?us-ascii?Q?y/J5yoccFQiC5CFdZLYw73nD7cQEC9DC+hxT6caXhJ6ZAuGD2EpwNEByptuo?=
 =?us-ascii?Q?nra3btxaygk3wW9Nr73HUqs6HH6UtGn2Skdac/1uIOtIuPSMl15J4r3L6qOA?=
 =?us-ascii?Q?ze5e9ZBdMeoNUKoL3Hz+L/M/cf9qzcB4vpKBVUMjSIsi4A/3tN7tuy8G6F/6?=
 =?us-ascii?Q?X2HLWXNgAjW+ZE7XNpPcTTzegFKWR+tys+NM0C/YZnFgRc7NAy/XxDieXWlW?=
 =?us-ascii?Q?jl7PQD7Q7QCb29Bshu8G591EZFmDPwri4akjukUaVSbyyqwpmC0SqlaGGmhp?=
 =?us-ascii?Q?SxqK4QdexxaVj0SLwDzm23V0R67qlu9Uak4UfHBKX+8FMO8OfIk/9KodADYS?=
 =?us-ascii?Q?f6COL2YyicdZymS+PsATAD/a30N0pLeHTdH2vkm8aqM0YGFRHVIlZq4SeyCB?=
 =?us-ascii?Q?xYWQy3zbVKNGu5gFI+/yZHwviCK4grVs5LRO0KocDrGamrTWBy2mhvOiJpRl?=
 =?us-ascii?Q?nQ4U5EUtgXDZA9NTJdXcA9K+EHdbbW2ozRUIWt3XGwcW0WqlO9ixbykLyq6V?=
 =?us-ascii?Q?EIjly9qiEeylxS1gpuiMiXOqjB3vrczjCdW3ihVijqwQqgN+Qtf+1+wBJPB9?=
 =?us-ascii?Q?AQyvmtyJRj8ytnM6tfZzPJziqBK+hl7oVTfRUAsKympp8cEsn1qYwpQFedRe?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbde6252-e2ee-4ec6-5ba5-08db1ef434e7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:10:41.3987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzsm47ehxtveClf4USKm7fZMdCmifTxgtoGQg7Nd+d2hrh4zR1hY/HqfNBY49/RZwfCjmFGsQ7+jP+VQXzqL0n8Dao8WjfO+Mhgw3Rypvx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8094

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

This 2-patch series fixes the parsing of the ARM Generic Timer
interrupts from the device tree.

If the generic timer interrupts order in the DT was different than
the expected order in Xen code, these interrupts would no longer be
correctly parsed and registered by Xen, and would result in boot failure.

This method with using "interrupt-names" for the generic timer interrupts
instead of having them hardcoded in the DTB in a specific order is the newer
approach already implemented in Linux. Xen did not have the necessary code for
this approach, and it has been implemented by the means of this patch series.

Functionality should remain the same if "interrupt-names" is not present in the
Generic Timer DTB node of the platform, but the interrupts should then still be
present in the expected "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt" order.
If "interrupt-names" is present, now it is also correctly handled.

Andrei Cherechesu (2):
  arch/arm: irq: Add platform_get_irq_byname() implementation
  arch/arm: time: Add support for parsing interrupts by names

 xen/arch/arm/include/asm/irq.h        |  2 ++
 xen/arch/arm/include/asm/time.h       |  3 ++-
 xen/arch/arm/irq.c                    | 14 +++++++++++
 xen/arch/arm/time.c                   | 26 +++++++++++++++++---
 xen/drivers/passthrough/arm/smmu-v3.c | 35 +++++----------------------
 5 files changed, 46 insertions(+), 34 deletions(-)

-- 
2.35.1


