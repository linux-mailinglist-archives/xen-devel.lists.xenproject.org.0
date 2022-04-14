Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA8C500688
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 09:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304487.519125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1netW5-0006IR-RB; Thu, 14 Apr 2022 07:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304487.519125; Thu, 14 Apr 2022 07:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1netW5-0006FQ-Nk; Thu, 14 Apr 2022 07:03:45 +0000
Received: by outflank-mailman (input) for mailman id 304487;
 Thu, 14 Apr 2022 07:03:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8iUY=UY=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1netW3-0006FK-Mo
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 07:03:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 044107ec-bbc1-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 09:03:42 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB7PR04MB5994.eurprd04.prod.outlook.com (2603:10a6:10:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 07:03:39 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%8]) with mapi id 15.20.5144.029; Thu, 14 Apr 2022
 07:03:39 +0000
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
X-Inumbo-ID: 044107ec-bbc1-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDjml8HlNc2QmUS484OkRShGsDVbKlijdbGKi+gFE9WwvbuGA74WVh6swiqSfdQMgnnMNeBcw9Q9HEr/n0UABAt7wuwa8TiNmQQZkBCkXdgwpAcYCE3+5eMFcEeVJ54XjwM76EQ+PMICkVkjVT6ZpZGqCU0T1Vy76opPFXCZynvOGEmt0Rn4slEEOsuZmhBDkemu31skpIBhH8FClKIa4vJNIo+Hz6qXIGdkJ9KJ7p+fQ5+NV5p4DEOEDQL2UT33nlI/J6UAJ8ltA9cfkpspkBO+17Ej3X4PqfkcaULl5kRIK7SrmFy83264GgfJagE3deBAJiKNSgzkq3jaw9RkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeH0WJvPHx8xXkKGkPt9WDGrUtOayTZIRZa7m1vrAa0=;
 b=Q/CecqEcJboauitMNUwL+gBtNrEDYAPaPxEpjOrDOOydJ3nvQ9jGRseG8HyAdI+Ke0ab1VC6aZYRIB82oSWZNeU4XfYVcbbNRWWPGj3FAIhsGVlXPR0SbS2vSIOPl1OZ3t6oVrENlbobdhYu7PG1N1Cd8g4Rzp/VkcCOVnOimI1EjheCJWb5Ci4H8zkhe6eABC1ntzHCzcA18lkgChAtSOoZ1KlZRw7OYRCdvaENJiXqHAV7PwEPKzBndxTx/MWQea4MxU/9hccFJL40b2WpvHvQ5Qd6l20uxGQ9k2mQUutIM2TJ2VSHLoHkRkNnqFwOnFhe7/oBYyl79gl2gIYtwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeH0WJvPHx8xXkKGkPt9WDGrUtOayTZIRZa7m1vrAa0=;
 b=LUO5jfnhW44M5tu89OmwlpjXmVikGsFfDNmYmzYrwXqP5MfNmW7I8aljzMKRNnOyqWFnQvT6Nou0U7OBNzCqZ0+Hp36F8LFbniFb5g7rRFBqn3PWz1hjLwOIQWTtQQ90qq+EMQ5b8oIPTeY49aUJvU6akPs+kB+xyzkw2voDUuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	wl@xen.org,
	xen-devel@lists.xenproject.org,
	van.freenix@gmail.com,
	michal.orzel@arm.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 0/2] xen/arm: add i.MX lpuart and i.MX8QM initial support
Date: Thu, 14 Apr 2022 15:44:50 +0800
Message-Id: <20220414074452.14419-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::35)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c6679b3-028b-47f4-8ba9-08da1de4e6d3
X-MS-TrafficTypeDiagnostic: DB7PR04MB5994:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB59946077A161D6886476FD69C9EF9@DB7PR04MB5994.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uQQWf5BAVUZGnZ2OCgaDe0CJdEwiLPJEdnSTRjy33/MaSD+R1iJU9co7AL6QwSxuEtZAAzz2CNk/W9t2dokY3/x55M5fFi/9QibCTg+JE8dmnrLBvY65m/8sVW8zNNhrxDeuRMnMW3Vb0OPXUAXCm2EDCazosL5N065+vfQpOVhv69vjGeu5KEWtD6N9F/BtbZ/GNQNuLnwSec3zqRuhFQZDnaLq4FaioeYxsMHoQnRFWxBN9Szw1npE89Pf2xIcfJ11RsibOtTANhK64MxgPDkl0WATd/1W+5i/FsfvdYTdcLUAbYv8FFin9PfbGPV5vI5zqUvdr2oQTrmMONFwhc8WDjrjh0ULC7wmzteZ02GHSNp7hknnz0WEC9gYSgnOJhN/TfQmXLOMrndFim5VZ1YsaEhy18obvxTNkRBRlspTgF3PiXIiko/r6iHc/V85JEp/1APDxsYSn+8fQsOQ1LHUYsUgo6mQNPWh0byeSCKIdIfvX/12BQ3KKxFZKfXnBmDQsKJExWlPISFzX7oHQ1FGn9WnohXW8y1sRdiwsYJFxV5Fcuw4vqAwSGXae45n1lIzZw1YNZysmLWbYoBVANYkjHe9jxH79KPF+zpQQznV/GaecCg3XqN2AoCbMg++XLcCZq8qcojKXgXvYyMNkWAycfXR8e9HlSdUx+iKRfk+mKvKSsgwHz4iL+gzgizSuiv2Dyyxdk0/GNtMZ7Rqgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(4326008)(8676002)(6666004)(6486002)(8936002)(7416002)(2906002)(4744005)(186003)(5660300002)(2616005)(1076003)(86362001)(508600001)(26005)(6512007)(316002)(6506007)(52116002)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JPpD17BOWJ7ZlNbG8fjJ5nCk1acR8GuL3A7Vbhg+gmct+p7kt0dgctC0clzP?=
 =?us-ascii?Q?Wg2MxUp0/FzKwh53CUUmU7kRFHMjdrHOsAogQcb7HAj/gVQ2I0B6qQ7K0GCw?=
 =?us-ascii?Q?HVqAouacbzI2pjheXWxNB6/VyPXFIzq7+j+0Ko1OdF9rs3DjlSAZDHo2SHcJ?=
 =?us-ascii?Q?x8e/6rF4DjFgcI6W73lAtmXwgvABs+D2zmzQ2x1J5ImuA39V9fITDnlO0NPK?=
 =?us-ascii?Q?Ux3YHDi/p6qqZ0FZNCpxlbJONzVIyS8NrfLtVtDLlOsgqqB8PoKISL4sfbdp?=
 =?us-ascii?Q?IiWR3zuoXxx+pLvbMpKVeGe1e6aick2cONDvnvKHrr8Ln2PTc96A7tG6R5K4?=
 =?us-ascii?Q?0WvhSz4WK+DNR+h5YoxHgoKwddjdWt04zGzS1PbuFweL4tG5m4x+mewnbnbs?=
 =?us-ascii?Q?vt1zv+b+HzEqxKzuXjBepAhIPJLcSgtA+GdJX8zB5vvpFB/bo6IHUdxtpPkj?=
 =?us-ascii?Q?bbqfz2RjFLSTGzPIyHKp6SMH/lJOcC0rnrwltuzLsh/2qn6fEib8qLQ4xxl0?=
 =?us-ascii?Q?m835caIzDKzLuq2GtA+GE9V8TJYgLD6J3iZn1f06KrDtqar8zbOUSa/1ZnuY?=
 =?us-ascii?Q?Er7IaPUnj5qTSRq9B70E6FCofrHWrz82WkONECRKXWrjVdmggD8ZGNR09tnn?=
 =?us-ascii?Q?c0RfrXTtEMQwY52oeppYHMUoKYm3EUCan4djIfZGXUPwXqxs3CF6+uR4YiCg?=
 =?us-ascii?Q?MOlqEbALR9S06AbQLYAV6Xzz53Qq/xzYUwTiR/qb74A7m/gJKTUM4lWseZ7/?=
 =?us-ascii?Q?XpwjXoDg7ACsxgHy2ZBLgwcqPYz4iE1SmZvbk0vAcyIn3LVUjIdaWZKduMx4?=
 =?us-ascii?Q?NV11dg3f0aD+ztMD4X8GcXSQM7ZbGKYYJNRQ1n5C5hKXQ4WiC8a5kWgEJmDQ?=
 =?us-ascii?Q?qGq/wQ502+Xub8JQq9ZR68kt1K3q3HWuPG4b49GIvLEnHWt+pRc2LlHKYCb+?=
 =?us-ascii?Q?xc9OQnhhFQ0c6L+jU9ZKw+mXclT5AgHGdHqpmH6TwhYvJKydKJjqsDnqIcsR?=
 =?us-ascii?Q?PWXSjD8cY61aTeeNH97VG5yYB4t41UdfHcvHJj8MlkcXOqh8fitDD7YDEIiI?=
 =?us-ascii?Q?WNYHCG0fCWVVJYvKyPA3I+XGB61HzCHkMy1l86uOW+eRgh3f9CizwhbgJrxI?=
 =?us-ascii?Q?/SftGmhSBe5N7Duep1fYLeZ3G4Z06JdcUfunI2jH9cthqXWITgKQU23DfPK6?=
 =?us-ascii?Q?huvGiquBBpTa07JEowHGV+elvRERyKsgIbSRrp1vQBzajVdhFwyZhsi3MDGo?=
 =?us-ascii?Q?hXyn0qgKpgFALR5evqQeLM5MM8BnEfjstVJK5oOYc0YWaqTOlHB/w+vn+RlU?=
 =?us-ascii?Q?fj52T5vjIwIUEH/IbCT5YKDMyOcLAMTAG2t/7cqmJwa5mNlo9PKZ1MwnxPXO?=
 =?us-ascii?Q?XDfytkNQLEpIEPm3lvMtfVyr85RvQ8X4Gu/L3SWeuPsvW9QW4D4QWfF5U9Yl?=
 =?us-ascii?Q?T/x/+LZM8Glhuvot0TWpWNWghF984IcqNcR8motgXH1BGFJwGs0T3ug8Wpdw?=
 =?us-ascii?Q?zA1elblh/9+e1RDydtjyMrxda3QmlPJZG1wAKmCFNzJkblWIJtz4nGMArskl?=
 =?us-ascii?Q?DtqwgxywX7FLTrxtJH7PqH/kOvzp4rGbjP5Mw9jfd1eeOuxW4L1m6XuVLWQt?=
 =?us-ascii?Q?2HXC5rcy+op8ekC5hUJDBD6Q9ocHHcis2IpfL6SCw6IYpdEvHh5DOzyVsMSA?=
 =?us-ascii?Q?M/dLRw4QvR9sH1l67goLdJB5/mDR03vxkl+JIt1we5roKWTX4sL1f9kdG3VZ?=
 =?us-ascii?Q?vHws3k0hzA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6679b3-028b-47f4-8ba9-08da1de4e6d3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 07:03:39.1842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwspO5hWVEjBpyo+v2RVN1oITBuPbYetJwliGrpX7EKd56S1RslK7h66NFkptORuzU4Lu9NwoRSXhm9mwMUobw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5994

From: Peng Fan <peng.fan@nxp.com>

V5:
 Align code
 drop early_uart_init

V4:
 Wrong v3 version, some BIT definition are mixed in patch 1,2. 

V3:
 Addressed Michal's comments.
 Add Henry's T-b

V2:
 Per Julien's comments, fix coding style issue, drop unneeded code

Add i.MX lpuart driver and i.MX8QM platform support.
 - lpuart is the uart IP used in i.MX8QM/QXP/93.
 - Very basic i.MX8QM platform support.



Peng Fan (2):
  xen/arm: Add i.MX lpuart driver
  xen/arm: Add i.MX lpuart early printk support

 xen/arch/arm/Kconfig.debug              |  14 ++
 xen/arch/arm/arm64/debug-imx-lpuart.inc |  48 +++++
 xen/arch/arm/include/asm/imx-lpuart.h   |  64 ++++++
 xen/drivers/char/Kconfig                |   7 +
 xen/drivers/char/Makefile               |   1 +
 xen/drivers/char/imx-lpuart.c           | 276 ++++++++++++++++++++++++
 6 files changed, 410 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-lpuart.inc
 create mode 100644 xen/arch/arm/include/asm/imx-lpuart.h
 create mode 100644 xen/drivers/char/imx-lpuart.c

-- 
2.35.1


