Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CD34BA69D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 18:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274928.470567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKkBH-00011o-Sb; Thu, 17 Feb 2022 17:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274928.470567; Thu, 17 Feb 2022 17:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKkBH-0000zD-PO; Thu, 17 Feb 2022 17:02:59 +0000
Received: by outflank-mailman (input) for mailman id 274928;
 Thu, 17 Feb 2022 17:02:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKkBG-0000z7-R5
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 17:02:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73d31d92-9013-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 18:02:56 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-iqJYVE2kOnC5xMYaYvygjA-1; Thu, 17 Feb 2022 18:02:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR04MB3236.eurprd04.prod.outlook.com (2603:10a6:206:10::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 17:02:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 17:02:47 +0000
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
X-Inumbo-ID: 73d31d92-9013-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645117376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YXp4RbEIbzc2Q/K8u3a5bLeNx0tNOf/jd4Orl7119vU=;
	b=mJmbY3uPeEqejv1qoCD6T+HCCV9hDAnKTZyKnRcAaCB60XdKqouC2E2SUhjQyHpWQXzS9C
	rZN5h3Gpoc3FqhwF1DUVKS1KsR0DSirIKO/wu0lZMbPuve7bMaPDYoVyAQF7susAnObvW8
	xkzntKiUCMkRuYvM7Coxjjzs7vYcRd0=
X-MC-Unique: iqJYVE2kOnC5xMYaYvygjA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NguKtD5JM5agdXafeDiEYWLzPsPhjnB/jiw5TUr6H/C6quBbL+WLQVx0yEtPp47YEn03l0yEFaVbM/RsskubcClPWNaR76GNy66nc+6Wz2SGYFnyAr1jNqMUCVNjHdGjAoG+JvBGzJaWRNVy4zvzo4ltKdf8SpHknghtKrMeS8NJIWqipvMfgQDfdWiapWLKUBX5sbHejb7R267s3xv8S74nn8WVqZcVojflqHDzcl9MsTG7OycQcCSZPWspo0ieufbZ6YvC5e+vJPRtKb1ayr/bd/bFwtyFPDM7on/smdL4bjhF31xSJtqILV+Bnt0pVwaOdx/9G1mbLsGsF0vHEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1b8je33a3kDzpyjFIEH//zYsdb7s/5A6gEIoDTLooGI=;
 b=SbvSoATf8XBj/Ezt4QP4IFNZ7YCGETIdQ0aQuZcyKBDUblE0tF2U9W6LIu30l9dFFd49dOfo6GKK5z4p/iy6z6CgVmHJl2QeHhpwSU4JZAB5VNCvfkSYB0VRZZV48RC+/A6f/0JpBefCK2leR0woET+wniJqR6XvW9QogpJxYXv6iwcOU2Et0uvMkJex84jtPZHDWs+VWnbn47kbPv71ux8brlYTsih9KzzdDd3JBldHMinzJyaH9MLnnNiIgCvU42pZQLQSbBlRH6OiKOVmMNp+m2xioTpb30zueCECK213SVfFTbYzk8WFswIxvrARVrCcxbEIOnvnrIqip0128Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f26b785-ae03-34a7-7dfc-d36121a44ac2@suse.com>
Date: Thu, 17 Feb 2022 18:02:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] MAINTAINERS: update TXT section
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0318.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 600f9d3d-7dc4-4d5e-da0c-08d9f2375281
X-MS-TrafficTypeDiagnostic: AM5PR04MB3236:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB3236D029A2DC335C19DF953DB3369@AM5PR04MB3236.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WxKF2uDs1oMp/lRNrO0blqwiwtyHrxoXvh3bxj7EMu4pQjyjprNofz3ovfEIO919vrMk+NJViZLeg3M3vN8YQGr1O3SxwGC3ne2HdSeyFTK0mOa0JJAJEPrPgjInesYeJPHtPNpSpQdhjMhYjVURDEaQRtlDqQ2LHoZCBN10ixAZqI3y0xxvyPYErcy/HtSp4EOTUeN9Txb3Cj21vDBv79tGLxX4RivKsip8IPrb1OjW32xO1RCleGU1B+/X88k0oMAuHGI8YzsGGa+Dmc9Fi+DkGSjT4P810jSJj1IMatuYJ8rKGNhfJPuVIO191WKaPBzq+Gyvrs0U7g6qU4+n5ndj9jHw5PJh+Vz0TYyaSVpG0AX7H9LI3Ap90vl6Kt1I7N3QHxo/5R/nnhcXvbxJ6OFTl+rPSEKhp996HWIHBSqDAuZfIONc8I77wvXQ6ts1uyl9pzM62vyP/Zh4NAZbL3My7Q0dd8pKALk0HwifoQFmWh1+IZQ1FqrO9QX4PK4t6ezNVY2Il7GBDM8yFnHjJsP4q2g3JMdAcsknX+FDQOpmGQzt5ZcmVIzIrctECeAts7FHY4JB7nxNKTJkvNfn70gEhcvc3ygy98Av3VsLLvrVWGtik6AV2mqyEFUFL8QWPK+tP9JtyToToqM7VybRDYuXlu0PhFVHvo5uWhWpFPw+SDMqgdyfQvw91cWimsbmJZXFUYn6Faxi6Nopagm0yT8hfMq98JV614T0n1pDSN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(508600001)(6486002)(26005)(316002)(31696002)(6916009)(54906003)(4326008)(8676002)(2906002)(38100700002)(66556008)(66476007)(86362001)(66946007)(6512007)(8936002)(2616005)(4744005)(5660300002)(31686004)(36756003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tKTzKIQ3BMYBAXAQdinPLeMD+5aSSbq3uvrDATwXVFPrjej6uXxWm/rx+/p4?=
 =?us-ascii?Q?mysK2ChqSiXESgJlw8gnL3tl318rPVMC7PLZH3ktskKaCwgx23CQdTN/XKcj?=
 =?us-ascii?Q?9DX75mbcXBFkev8XqBx/dLou1RDLRpFK4V1rc8avm4DAlEIJi4wF44qunrw0?=
 =?us-ascii?Q?6t74CSRyVlOKp5koIhyDplDrCKeFjJpZGkIJrx/DPnAljUpKj1aMsIGZrO1F?=
 =?us-ascii?Q?PZCGcVm+RmGGhFRnC1v3+fWqS3ZOZNCRfWR8xB4XDiBzRS47X9R0yP6zTlMp?=
 =?us-ascii?Q?JnYCdhBqB+vYIa2Hyzq8PrB4yUTUT1EaXBIJXZDOT1Abt/rbE+WgKHefdS3h?=
 =?us-ascii?Q?9FoVai+DsGKhY2PTXlX9RLWYU9Z6bt0xEQA6VIaegdyzjy3qLKa9xSjUy4ev?=
 =?us-ascii?Q?snWBLe6/ADsoEwoIBugJBDRlS59C0q0d16zix6dJSoSUO7zvTuLll3oqxuLz?=
 =?us-ascii?Q?wJ8KGtf/0yaiav9V/Ire54dIY8GHcwYmdqPPg1odOdfU9p/qpNPFWLvUwuFW?=
 =?us-ascii?Q?O3cmPiRITHv5zh5BhoLGxWiJNBNKcO8K8VTLiu4K2c4OYs8AozkEOpnlFGQb?=
 =?us-ascii?Q?tKHJdqr8WYTH18XTB0pL1dKGF8M7PoM7rmP97K2EMoc1h6tqi1Vysr9eV7IN?=
 =?us-ascii?Q?UIEVozAr94xe1ZE3/m7DRndTNgrDolhVTm8MymNbhCXuP9orepZPaMB7NerE?=
 =?us-ascii?Q?dBv4/1dLz0MkMXJ5C9xsJ6i97y7Y00JyfY0psJofrzUkD6euN/7M4fV9SQfT?=
 =?us-ascii?Q?fP/uHoD9jHPWTBYdjYquklTsps6nKvDlpkL+/zeAxlxeYgQmygaiTygiT7G7?=
 =?us-ascii?Q?Um4DJUOxw/Hl+S2JDsjB1S3w+Jkzl0mIebbtRLljU7HrznGE/E20it5sZY9V?=
 =?us-ascii?Q?dhNhfVjUB7zTzTt2Bv1EbeG/c/OeU1uMTF4QajVyrDxZH1fUD4FQmTVvKcPa?=
 =?us-ascii?Q?B6nr/mBaNmvTiu95zQnTCcN74Z8za1jgHYWgw5JvYnW5AtEhT4ByW88j+yOk?=
 =?us-ascii?Q?lA6MJpRZOrya6UxHJFKa/V6w/+3vuSUniK/u2n4rhQsev7u397fkgc+yUNZO?=
 =?us-ascii?Q?d2b0pvy4s5GkEYtu02Ig/dh9c6GA1oiPmO7BuQMNgBXQJxgIuZNbOpIHr1Xg?=
 =?us-ascii?Q?FVXKgc7t3WFvgpGVNedJlWqyR9/Fye1LMny6C/Ps2yDaIYnhfNyvBkWssama?=
 =?us-ascii?Q?ubwFNfG+zI4tFhXwyjF/u209b4KbdtJG6efbKW9W8EltT1U7Ipvljb0N7i2w?=
 =?us-ascii?Q?KIAQ/mcXf8qNS4B8n1zUYv5Q/5O+hePBkgb33Jun2RrfTqB6+/dRfQVk399L?=
 =?us-ascii?Q?hS/h/nYw9ISd1Fcd20gh1yuGe3VfwrvZLLXw7gT5kYClEuqoD8hViGJBfOXw?=
 =?us-ascii?Q?1DoKAynFXkrE4FXVbXqHO3Hko9TP9S4RpI5sUpkWKT3aISLG+cWFKjhI87Mu?=
 =?us-ascii?Q?/d5ZEotCFHeAL4rHeYv+cqyYDR1WXZVunNsubUd5ycXbsYs3SmC7l/pzf8H0?=
 =?us-ascii?Q?7ISK3cESxPvrlYMJIkhT8h8nFu2GDdXsJV5oz+KpU75btM0eWDzhJEHoCaAc?=
 =?us-ascii?Q?EsG7PgRMf80jbaRNnAA26+tYZBXbtJ5UrPOHSYIkoIGAdXcZlZTkR/AApvQw?=
 =?us-ascii?Q?/7QitK9qoVcqXYdJpxxPwf0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600f9d3d-7dc4-4d5e-da0c-08d9f2375281
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 17:02:47.2875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oyq/Yibl2fjiK/107gyzIdTrWadPscCZQRJxtVIMh3gHdv9z6aR5M46K/dW8lbgIPoh4O7O2sX42hM+wZoetA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3236

Since Lukasz has left Intel, they have suggested a replacement contact.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Only add Mateusz, and only as reviewer.

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -318,6 +318,7 @@ F:	xen/common/hypfs.c
 INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
 R:	Lukasz Hawrylko <lukasz@hawrylko.pl>
 R:	Daniel P. Smith <dpsmith@apertussolutions.com>
+R:	Mateusz M=C3=B3wka <mateusz.mowka@intel.com>
 S:	Odd Fixes
 F:	xen/arch/x86/include/asm/tboot.h
 F:	xen/arch/x86/tboot.c


