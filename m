Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB1235E5A9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 19:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110049.210046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWNDs-0005Ih-LB; Tue, 13 Apr 2021 17:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110049.210046; Tue, 13 Apr 2021 17:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWNDs-0005IH-Gv; Tue, 13 Apr 2021 17:53:12 +0000
Received: by outflank-mailman (input) for mailman id 110049;
 Tue, 13 Apr 2021 17:53:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J6X8=JK=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lWNDq-0005IC-Qq
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 17:53:10 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1510cb5f-176b-4422-9c99-97776ace3247;
 Tue, 13 Apr 2021 17:53:08 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13DHa7or102589;
 Tue, 13 Apr 2021 17:53:06 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 37u1hbg3as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 17:53:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13DHZT7F057159;
 Tue, 13 Apr 2021 17:53:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by userp3020.oracle.com with ESMTP id 37unssq9t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 17:53:04 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4020.namprd10.prod.outlook.com (2603:10b6:a03:1b5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Tue, 13 Apr
 2021 17:53:01 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::819c:ca1f:448d:3024]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::819c:ca1f:448d:3024%7]) with mapi id 15.20.4042.016; Tue, 13 Apr 2021
 17:53:01 +0000
Received: from bostrovs-us.us.oracle.com (209.17.40.37) by
 SJ0PR03CA0313.namprd03.prod.outlook.com (2603:10b6:a03:39d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Tue, 13 Apr 2021 17:53:00 +0000
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
X-Inumbo-ID: 1510cb5f-176b-4422-9c99-97776ace3247
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=kSnrvwXMCO9TXXJnpjmYOHrl4EtOgHp4cDv8n1E/eYQ=;
 b=ma/NRMT8xa5qCasu9/YHP1tMiLRUfgWHXtbnaSirCM6OxzAGqr2yPtxCeRLACmU5Lr9y
 p6czOgHBf0/EQ6U/DKzKURCdmjxJhbNVsqyltvwG6/OWYOMeF1MBOVKUAUMTpUTVFX/M
 1Q98U2au4fgCPvYc68o2eK2ZKKGfCZjGPZy6/0Qq/4vEgybmTtoDrgQWjnL01gRqYZMY
 q1ooWzeDeF6XyW0+nKPBJq2RS2fqWS7tAVBL98FZTOC2UtRqXggwAB2R58lunsEvRd83
 L0POMxc0EHXNff7mGJ5knK4gKnPto5+1YY2AzfD4zuFXsoTSrvgeYTUPBw4PdVw4XY5j /g== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMovgX6JF8j2Ok6GA7guX9ArUHjmiukdks68abnmnI9SsvvKH0gktDXnGBvji+yc2+/ItDyoFOpo0gr5gX3Q389HXIqcq5gWxmOBjzeqtjz4WSBVphxsOZzStqtfnir295iFFjdubjkeL6sihGmHc5nG9EuGZZtDAPyQPW7zMsTxOuSMGj+mJ7tjk5WlQbb97XFY/SCZzUasVc4uPwBxtwHINC0oJvNjLMyZKB7GyUHPeLQA14g6/ReLhFWV5+NvpGYHY4kT+uqy1+cCrcS/esJKjG759KugV83QrrB64I/UOezb2k5SqMxkIzvrco7W+yCWfhW3+4sQXnyHbFS7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSnrvwXMCO9TXXJnpjmYOHrl4EtOgHp4cDv8n1E/eYQ=;
 b=nMT3Qkpa0y4KRw8eQ9iOfJixp5cX+tnXMh8rUJwXj2tU2q9bskm9ZE/ekMKR1xQIqbUgv9v7jTNpgwpPl1Hec+B3zXnqA5eB5v1/y7beNkjgYiJWS1NigAwfKQC/Dp2WTTupdGKraj/tFaN3Z//VkQmFLPZ1KL9HdA8j03WFJf876FDVYBSWzm311CUCW3OXMjK5ABU+fPLheU8ehnVAv3N1xix/DkNvrhB7308wjMyzXBiKwsfNh8v9P1Ab7zvHoOKeBIpZz1qlKWDnXhAwuun+EKz83NbOOgFsy0reX/ZkgWYEE4zzBBV/tX1zecN26HXD8EuDz0aTR6XnggDkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSnrvwXMCO9TXXJnpjmYOHrl4EtOgHp4cDv8n1E/eYQ=;
 b=Kzhay29y+G0kJfTTLoY2IssteVec8orv4yoWMxYQf/GoRlf/bfqA0FcVU3qyvJCjgxkA+nN6PYDG9XzxFKul6aQyDhlQXyoc2VuMRbkmsHpYRJd6hNMq8B/pPI8ElpO+p/IZxB+cqjaMXzwBaZGHu1ug4DuVR1hh3uar11b8JEk=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com, sstabellini@kernel.org, rafael@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] xen: Remove support for PV ACPI cpu/memory hotplug
Date: Tue, 13 Apr 2021 13:52:24 -0400
Message-Id: <1618336344-3162-1-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [209.17.40.37]
X-ClientProxiedBy: SJ0PR03CA0313.namprd03.prod.outlook.com
 (2603:10b6:a03:39d::18) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0147801-99ba-4eb5-fbaf-08d8fea4faf4
X-MS-TrafficTypeDiagnostic: BY5PR10MB4020:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB4020F4C3FA9C4F9C30937B598A4F9@BY5PR10MB4020.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UJ//sgoLfgfX1TWrPWMVpXjGpUi9xio1j14hDXiM1upguwGtb7ogEbntQMKdgb+aHJLl1aV3n5qUw+gzcjiX036vQvpkDkj1utzXKV6fUkzjRJ5eGDCgmJC/ehKZj6t08CZokyzF41DMgFjtJY7xRsLOVHt0aFSZWhAjpEb5YJP7V7K19mLqF3X2vPRsJaByASwGg3GhC5chMM+1LP95Pg6G5DeNaEeRXAlrM2o1yS6S6mS+UAnIn25rLZWY/loUl3o1kCTQzxMlqdYjWarxtEcBs7JO3NpuXzGcd9mvgcAobCQ4ldNB+/MomP/WI/J2kW48/144+JyQAyhNulIbqD0aKIB4n8u/c63+xYPpCjNsjk6z81ONkgrYNK9TqSij/Yv+jcQVF3MgwHJ+7Gab/9wYqcKjg+w4PxLRw7K7WcJMMDVd3fRw7dQlfveWaUi1N5HzZ0sgjSwbUvOfvyeYaVA5Tk7ZdOhuV87RP1871RE2MNIYy73Y8KRPGBW7sBSxAdF/Od+I+DaBLs1O4TcubkEhAAduQ6L5g3TuuWL2kB/c+JK2qzeLZYJkWCZ2skqI4p4VNPVkspB0nlZEclQsb5scPWohR0sATUWJYIcWY3LAcECeGDi+k8ksxObPdt66xIS4S8txHuiJnzYwBtprFGUEOTQBF+C9vQUCsDLlhUo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(136003)(39860400002)(366004)(396003)(30864003)(8676002)(38350700002)(2616005)(4326008)(38100700002)(16526019)(5660300002)(316002)(8936002)(956004)(478600001)(66946007)(66556008)(83380400001)(6916009)(66476007)(6666004)(36756003)(44832011)(186003)(2906002)(6486002)(26005)(52116002)(7696005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?3bikyFLpDxHFEkvURj1XtV3w2eCUshK0qfqLFtoeHK1co0bth270g2cX9qqT?=
 =?us-ascii?Q?cmpXIROVAmOJRm/2Hp/qhpE6S2f3w7EkNlmMxIEoG8oQGMQgtxn/B1a79ENM?=
 =?us-ascii?Q?h9CK1Qak0EtbpUxsw25xv4sDWz0TcTlb3MDeGD9oVgwWXyOMLBVNzM+bJSrA?=
 =?us-ascii?Q?JeY8ukuIEjrD2D8PzguDpq/a7VT+IZWF7xBERnN43w4FGYWq3GcE8KYNgN6n?=
 =?us-ascii?Q?fPkhAF6ZYV++oPHLWAS1NHN4WIcukidQQOmFc2ZIjy/QdMxewwe/GKNdl2a9?=
 =?us-ascii?Q?AW/mpzkQxhbYpXa6P70i02LRkqOs/NEzCUNkjbrdEotRwawDVkSN9jeiK5tl?=
 =?us-ascii?Q?dFvbpbAR6eEDt1ovc/RwJjHdo59cW8ZS056/ec2hD/wnTr7vEvwc3eVugzER?=
 =?us-ascii?Q?MKgCujcVE9GL/B5OWlp4AbjoHc2FuB7sA88hrqoW1nut/hd7qeX42AG1kZ4D?=
 =?us-ascii?Q?N7mP6thM7vit+sIKZGl8htWzJsaK9OjZv10lEPCKVPGzQks8aP7tV1BBVx4I?=
 =?us-ascii?Q?lMS56r2CGKgeEQzkw84ouB6ycddhldeJk2UWvSe30fmG2OtEmel3PN/vqf3l?=
 =?us-ascii?Q?l6x7XkoS4fD/5weZ7HkwoDGGDP4ySdMcdStXhQhAJj5aoNueUAgdmo71NLNq?=
 =?us-ascii?Q?2FdtC3TflKlCPqGVAix900mIkwZnsrAU1HfOFxl2yWaEk3ZoSQ3VXj3rwS1f?=
 =?us-ascii?Q?m6G01yO6uh/WhBWuoTaXQnpm0AXyGausy/7xClfQkJy4R6Ssv44+YZyirQpP?=
 =?us-ascii?Q?IKI1gHqVuekD8ES2nV/8cfoo+5GeM4ormsXhhjtzvA+1R2xtKMIVByIs3Es6?=
 =?us-ascii?Q?U04fD779pQfwui5o/v82vRbQinhJwVgDIwcdKhYm8aT/BT5YLsWKRXI3DLrm?=
 =?us-ascii?Q?tcN5ieNbmfex/CEH9xUYKiFZdu9xP4+06TvFmW5NklEJbiIiuQNScYkGm1N1?=
 =?us-ascii?Q?bUtVW9QYNKgXhfQDVR4WKX9Up3BOghqwoYHAv6/XapGYUVqmIiM01XAOB5zh?=
 =?us-ascii?Q?EmJsdLkBYKy8+9I0TuzLRq33LMlY5nVJtAsgvOfN7qokRjLsKzkyM3CcZF0j?=
 =?us-ascii?Q?MuPy8T+mV0JGTt+yZN3t+8fQXaWAyh+6X96pl6NFolQFsbq+554B0Rm4l/cK?=
 =?us-ascii?Q?uG3yr41dO44b96E33ixDgyFst8dPdEs8PgVhPeCwskGAcELGQmvTv4f8T7Z6?=
 =?us-ascii?Q?QZZ0dkUsPumQCwcr8O5CtoTKJT3/9AAKGcV+S7gpAp0C3NRUIYnwBUlHfgzx?=
 =?us-ascii?Q?IcdPqAUXF98nz+OzYwP+149RL5Jio34bb9ZmL/F/E0PWql8DaoeGHQpxvk1u?=
 =?us-ascii?Q?Fabtwov+KyASqkJCBj3ubQWv?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0147801-99ba-4eb5-fbaf-08d8fea4faf4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 17:53:01.7362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvYqwG/7t//0uRr6kRs/wE2MQXMvv+BApcDNNQ3Qs5oiX+8nadvbN/8HYe/9wBoxlaO4LOrurJkAkxqkAYsBBJDRdv24/S3bWetb5yx6l5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4020
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130120
X-Proofpoint-GUID: dgaXhUrM5NuLCcK95dDs2AxGc-3YA715
X-Proofpoint-ORIG-GUID: dgaXhUrM5NuLCcK95dDs2AxGc-3YA715
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 clxscore=1011 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104130120

Commit 76fc253723ad ("xen/acpi-stub: Disable it b/c the acpi_processor_add
is no longer called.") declared as BROKEN support for Xen ACPI stub (which
is required for xen-acpi-{cpu|memory}-hotplug) and suggested that this
is temporary and will be soon fixed. This was in March 2013.

Further, commit cfafae940381 ("xen: rename dom0_op to platform_op")
renamed an interface used by memory hotplug code without updating that
code (as it was BROKEN and therefore not compiled). This was
in November 2015 and has gone unnoticed for over 5 year.

It is now clear that this code is of no interest to anyone and therefore
should be removed.

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 drivers/xen/Kconfig               |  31 ---
 drivers/xen/Makefile              |   3 -
 drivers/xen/pcpu.c                |  35 ---
 drivers/xen/xen-acpi-cpuhotplug.c | 446 -----------------------------------
 drivers/xen/xen-acpi-memhotplug.c | 475 --------------------------------------
 drivers/xen/xen-stub.c            |  90 --------
 include/xen/acpi.h                |  35 ---
 7 files changed, 1115 deletions(-)
 delete mode 100644 drivers/xen/xen-acpi-cpuhotplug.c
 delete mode 100644 drivers/xen/xen-acpi-memhotplug.c
 delete mode 100644 drivers/xen/xen-stub.c

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index ea0efd290c37..5f1ce59b44b9 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -238,37 +238,6 @@ config XEN_PRIVCMD
 	depends on XEN
 	default m
 
-config XEN_STUB
-	bool "Xen stub drivers"
-	depends on XEN && X86_64 && BROKEN
-	help
-	  Allow kernel to install stub drivers, to reserve space for Xen drivers,
-	  i.e. memory hotplug and cpu hotplug, and to block native drivers loaded,
-	  so that real Xen drivers can be modular.
-
-	  To enable Xen features like cpu and memory hotplug, select Y here.
-
-config XEN_ACPI_HOTPLUG_MEMORY
-	tristate "Xen ACPI memory hotplug"
-	depends on XEN_DOM0 && XEN_STUB && ACPI
-	help
-	  This is Xen ACPI memory hotplug.
-
-	  Currently Xen only support ACPI memory hot-add. If you want
-	  to hot-add memory at runtime (the hot-added memory cannot be
-	  removed until machine stop), select Y/M here, otherwise select N.
-
-config XEN_ACPI_HOTPLUG_CPU
-	tristate "Xen ACPI cpu hotplug"
-	depends on XEN_DOM0 && XEN_STUB && ACPI
-	select ACPI_CONTAINER
-	help
-	  Xen ACPI cpu enumerating and hotplugging
-
-	  For hotplugging, currently Xen only support ACPI cpu hotadd.
-	  If you want to hotadd cpu at runtime (the hotadded cpu cannot
-	  be removed until machine stop), select Y/M here.
-
 config XEN_ACPI_PROCESSOR
 	tristate "Xen ACPI processor"
 	depends on XEN && XEN_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
index c3621b9f4012..3434593455b2 100644
--- a/drivers/xen/Makefile
+++ b/drivers/xen/Makefile
@@ -26,9 +26,6 @@ obj-$(CONFIG_SWIOTLB_XEN)		+= swiotlb-xen.o
 obj-$(CONFIG_XEN_MCE_LOG)		+= mcelog.o
 obj-$(CONFIG_XEN_PCIDEV_BACKEND)	+= xen-pciback/
 obj-$(CONFIG_XEN_PRIVCMD)		+= xen-privcmd.o
-obj-$(CONFIG_XEN_STUB)			+= xen-stub.o
-obj-$(CONFIG_XEN_ACPI_HOTPLUG_MEMORY)	+= xen-acpi-memhotplug.o
-obj-$(CONFIG_XEN_ACPI_HOTPLUG_CPU)	+= xen-acpi-cpuhotplug.o
 obj-$(CONFIG_XEN_ACPI_PROCESSOR)	+= xen-acpi-processor.o
 obj-$(CONFIG_XEN_EFI)			+= efi.o
 obj-$(CONFIG_XEN_SCSI_BACKEND)		+= xen-scsiback.o
diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
index cdc6daa7a9f6..1bcdd5227771 100644
--- a/drivers/xen/pcpu.c
+++ b/drivers/xen/pcpu.c
@@ -345,41 +345,6 @@ static irqreturn_t xen_pcpu_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-/* Sync with Xen hypervisor after cpu hotadded */
-void xen_pcpu_hotplug_sync(void)
-{
-	schedule_work(&xen_pcpu_work);
-}
-EXPORT_SYMBOL_GPL(xen_pcpu_hotplug_sync);
-
-/*
- * For hypervisor presented cpu, return logic cpu id;
- * For hypervisor non-presented cpu, return -ENODEV.
- */
-int xen_pcpu_id(uint32_t acpi_id)
-{
-	int cpu_id = 0, max_id = 0;
-	struct xen_platform_op op;
-
-	op.cmd = XENPF_get_cpuinfo;
-	while (cpu_id <= max_id) {
-		op.u.pcpu_info.xen_cpuid = cpu_id;
-		if (HYPERVISOR_platform_op(&op)) {
-			cpu_id++;
-			continue;
-		}
-
-		if (acpi_id == op.u.pcpu_info.acpi_id)
-			return cpu_id;
-		if (op.u.pcpu_info.max_present > max_id)
-			max_id = op.u.pcpu_info.max_present;
-		cpu_id++;
-	}
-
-	return -ENODEV;
-}
-EXPORT_SYMBOL_GPL(xen_pcpu_id);
-
 static int __init xen_pcpu_init(void)
 {
 	int irq, ret;
diff --git a/drivers/xen/xen-acpi-cpuhotplug.c b/drivers/xen/xen-acpi-cpuhotplug.c
deleted file mode 100644
index 00ab1ece02e5..000000000000
--- a/drivers/xen/xen-acpi-cpuhotplug.c
+++ /dev/null
@@ -1,446 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2012 Intel Corporation
- *    Author: Liu Jinsong <jinsong.liu@intel.com>
- *    Author: Jiang Yunhong <yunhong.jiang@intel.com>
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/types.h>
-#include <linux/cpu.h>
-#include <linux/acpi.h>
-#include <linux/uaccess.h>
-#include <acpi/processor.h>
-#include <xen/acpi.h>
-#include <xen/interface/platform.h>
-#include <asm/xen/hypercall.h>
-
-#define PREFIX "ACPI:xen_cpu_hotplug:"
-
-#define INSTALL_NOTIFY_HANDLER		0
-#define UNINSTALL_NOTIFY_HANDLER	1
-
-static acpi_status xen_acpi_cpu_hotadd(struct acpi_processor *pr);
-
-/* --------------------------------------------------------------------------
-				Driver Interface
--------------------------------------------------------------------------- */
-
-static int xen_acpi_processor_enable(struct acpi_device *device)
-{
-	acpi_status status = 0;
-	unsigned long long value;
-	union acpi_object object = { 0 };
-	struct acpi_buffer buffer = { sizeof(union acpi_object), &object };
-	struct acpi_processor *pr = acpi_driver_data(device);
-
-	if (!strcmp(acpi_device_hid(device), ACPI_PROCESSOR_OBJECT_HID)) {
-		/* Declared with "Processor" statement; match ProcessorID */
-		status = acpi_evaluate_object(pr->handle, NULL, NULL, &buffer);
-		if (ACPI_FAILURE(status)) {
-			pr_err(PREFIX "Evaluating processor object\n");
-			return -ENODEV;
-		}
-
-		pr->acpi_id = object.processor.proc_id;
-	} else {
-		/* Declared with "Device" statement; match _UID */
-		status = acpi_evaluate_integer(pr->handle, METHOD_NAME__UID,
-						NULL, &value);
-		if (ACPI_FAILURE(status)) {
-			pr_err(PREFIX "Evaluating processor _UID\n");
-			return -ENODEV;
-		}
-
-		pr->acpi_id = value;
-	}
-
-	pr->id = xen_pcpu_id(pr->acpi_id);
-
-	if (invalid_logical_cpuid(pr->id))
-		/* This cpu is not presented at hypervisor, try to hotadd it */
-		if (ACPI_FAILURE(xen_acpi_cpu_hotadd(pr))) {
-			pr_err(PREFIX "Hotadd CPU (acpi_id = %d) failed.\n",
-					pr->acpi_id);
-			return -ENODEV;
-		}
-
-	return 0;
-}
-
-static int xen_acpi_processor_add(struct acpi_device *device)
-{
-	int ret;
-	struct acpi_processor *pr;
-
-	if (!device)
-		return -EINVAL;
-
-	pr = kzalloc(sizeof(struct acpi_processor), GFP_KERNEL);
-	if (!pr)
-		return -ENOMEM;
-
-	pr->handle = device->handle;
-	strcpy(acpi_device_name(device), ACPI_PROCESSOR_DEVICE_NAME);
-	strcpy(acpi_device_class(device), ACPI_PROCESSOR_CLASS);
-	device->driver_data = pr;
-
-	ret = xen_acpi_processor_enable(device);
-	if (ret)
-		pr_err(PREFIX "Error when enabling Xen processor\n");
-
-	return ret;
-}
-
-static int xen_acpi_processor_remove(struct acpi_device *device)
-{
-	struct acpi_processor *pr;
-
-	if (!device)
-		return -EINVAL;
-
-	pr = acpi_driver_data(device);
-	if (!pr)
-		return -EINVAL;
-
-	kfree(pr);
-	return 0;
-}
-
-/*--------------------------------------------------------------
-		Acpi processor hotplug support
---------------------------------------------------------------*/
-
-static int is_processor_present(acpi_handle handle)
-{
-	acpi_status status;
-	unsigned long long sta = 0;
-
-
-	status = acpi_evaluate_integer(handle, "_STA", NULL, &sta);
-
-	if (ACPI_SUCCESS(status) && (sta & ACPI_STA_DEVICE_PRESENT))
-		return 1;
-
-	/*
-	 * _STA is mandatory for a processor that supports hot plug
-	 */
-	if (status == AE_NOT_FOUND)
-		pr_info(PREFIX "Processor does not support hot plug\n");
-	else
-		pr_info(PREFIX "Processor Device is not present");
-	return 0;
-}
-
-static int xen_apic_id(acpi_handle handle)
-{
-	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *obj;
-	struct acpi_madt_local_apic *lapic;
-	int apic_id;
-
-	if (ACPI_FAILURE(acpi_evaluate_object(handle, "_MAT", NULL, &buffer)))
-		return -EINVAL;
-
-	if (!buffer.length || !buffer.pointer)
-		return -EINVAL;
-
-	obj = buffer.pointer;
-	if (obj->type != ACPI_TYPE_BUFFER ||
-	    obj->buffer.length < sizeof(*lapic)) {
-		kfree(buffer.pointer);
-		return -EINVAL;
-	}
-
-	lapic = (struct acpi_madt_local_apic *)obj->buffer.pointer;
-
-	if (lapic->header.type != ACPI_MADT_TYPE_LOCAL_APIC ||
-	    !(lapic->lapic_flags & ACPI_MADT_ENABLED)) {
-		kfree(buffer.pointer);
-		return -EINVAL;
-	}
-
-	apic_id = (uint32_t)lapic->id;
-	kfree(buffer.pointer);
-	buffer.length = ACPI_ALLOCATE_BUFFER;
-	buffer.pointer = NULL;
-
-	return apic_id;
-}
-
-static int xen_hotadd_cpu(struct acpi_processor *pr)
-{
-	int cpu_id, apic_id, pxm;
-	struct xen_platform_op op;
-
-	apic_id = xen_apic_id(pr->handle);
-	if (apic_id < 0) {
-		pr_err(PREFIX "Failed to get apic_id for acpi_id %d\n",
-				pr->acpi_id);
-		return -ENODEV;
-	}
-
-	pxm = xen_acpi_get_pxm(pr->handle);
-	if (pxm < 0) {
-		pr_err(PREFIX "Failed to get _PXM for acpi_id %d\n",
-				pr->acpi_id);
-		return pxm;
-	}
-
-	op.cmd = XENPF_cpu_hotadd;
-	op.u.cpu_add.apic_id = apic_id;
-	op.u.cpu_add.acpi_id = pr->acpi_id;
-	op.u.cpu_add.pxm = pxm;
-
-	cpu_id = HYPERVISOR_platform_op(&op);
-	if (cpu_id < 0)
-		pr_err(PREFIX "Failed to hotadd CPU for acpi_id %d\n",
-				pr->acpi_id);
-
-	return cpu_id;
-}
-
-static acpi_status xen_acpi_cpu_hotadd(struct acpi_processor *pr)
-{
-	if (!is_processor_present(pr->handle))
-		return AE_ERROR;
-
-	pr->id = xen_hotadd_cpu(pr);
-	if (invalid_logical_cpuid(pr->id))
-		return AE_ERROR;
-
-	/*
-	 * Sync with Xen hypervisor, providing new /sys/.../xen_cpuX
-	 * interface after cpu hotadded.
-	 */
-	xen_pcpu_hotplug_sync();
-
-	return AE_OK;
-}
-
-static int acpi_processor_device_remove(struct acpi_device *device)
-{
-	pr_debug(PREFIX "Xen does not support CPU hotremove\n");
-
-	return -ENOSYS;
-}
-
-static void acpi_processor_hotplug_notify(acpi_handle handle,
-					  u32 event, void *data)
-{
-	struct acpi_processor *pr;
-	struct acpi_device *device = NULL;
-	u32 ost_code = ACPI_OST_SC_NON_SPECIFIC_FAILURE; /* default */
-	int result;
-
-	acpi_scan_lock_acquire();
-
-	switch (event) {
-	case ACPI_NOTIFY_BUS_CHECK:
-	case ACPI_NOTIFY_DEVICE_CHECK:
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
-			"Processor driver received %s event\n",
-			(event == ACPI_NOTIFY_BUS_CHECK) ?
-			"ACPI_NOTIFY_BUS_CHECK" : "ACPI_NOTIFY_DEVICE_CHECK"));
-
-		if (!is_processor_present(handle))
-			break;
-
-		acpi_bus_get_device(handle, &device);
-		if (acpi_device_enumerated(device))
-			break;
-
-		result = acpi_bus_scan(handle);
-		if (result) {
-			pr_err(PREFIX "Unable to add the device\n");
-			break;
-		}
-		device = NULL;
-		acpi_bus_get_device(handle, &device);
-		if (!acpi_device_enumerated(device)) {
-			pr_err(PREFIX "Missing device object\n");
-			break;
-		}
-		ost_code = ACPI_OST_SC_SUCCESS;
-		break;
-
-	case ACPI_NOTIFY_EJECT_REQUEST:
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
-				  "received ACPI_NOTIFY_EJECT_REQUEST\n"));
-
-		if (acpi_bus_get_device(handle, &device)) {
-			pr_err(PREFIX "Device don't exist, dropping EJECT\n");
-			break;
-		}
-		pr = acpi_driver_data(device);
-		if (!pr) {
-			pr_err(PREFIX "Driver data is NULL, dropping EJECT\n");
-			break;
-		}
-
-		/*
-		 * TBD: implement acpi_processor_device_remove if Xen support
-		 * CPU hotremove in the future.
-		 */
-		acpi_processor_device_remove(device);
-		break;
-
-	default:
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
-				  "Unsupported event [0x%x]\n", event));
-
-		/* non-hotplug event; possibly handled by other handler */
-		goto out;
-	}
-
-	(void) acpi_evaluate_ost(handle, event, ost_code, NULL);
-
-out:
-	acpi_scan_lock_release();
-}
-
-static acpi_status is_processor_device(acpi_handle handle)
-{
-	struct acpi_device_info *info;
-	char *hid;
-	acpi_status status;
-
-	status = acpi_get_object_info(handle, &info);
-	if (ACPI_FAILURE(status))
-		return status;
-
-	if (info->type == ACPI_TYPE_PROCESSOR) {
-		kfree(info);
-		return AE_OK;	/* found a processor object */
-	}
-
-	if (!(info->valid & ACPI_VALID_HID)) {
-		kfree(info);
-		return AE_ERROR;
-	}
-
-	hid = info->hardware_id.string;
-	if ((hid == NULL) || strcmp(hid, ACPI_PROCESSOR_DEVICE_HID)) {
-		kfree(info);
-		return AE_ERROR;
-	}
-
-	kfree(info);
-	return AE_OK;	/* found a processor device object */
-}
-
-static acpi_status
-processor_walk_namespace_cb(acpi_handle handle,
-			    u32 lvl, void *context, void **rv)
-{
-	acpi_status status;
-	int *action = context;
-
-	status = is_processor_device(handle);
-	if (ACPI_FAILURE(status))
-		return AE_OK;	/* not a processor; continue to walk */
-
-	switch (*action) {
-	case INSTALL_NOTIFY_HANDLER:
-		acpi_install_notify_handler(handle,
-					    ACPI_SYSTEM_NOTIFY,
-					    acpi_processor_hotplug_notify,
-					    NULL);
-		break;
-	case UNINSTALL_NOTIFY_HANDLER:
-		acpi_remove_notify_handler(handle,
-					   ACPI_SYSTEM_NOTIFY,
-					   acpi_processor_hotplug_notify);
-		break;
-	default:
-		break;
-	}
-
-	/* found a processor; skip walking underneath */
-	return AE_CTRL_DEPTH;
-}
-
-static
-void acpi_processor_install_hotplug_notify(void)
-{
-	int action = INSTALL_NOTIFY_HANDLER;
-	acpi_walk_namespace(ACPI_TYPE_ANY,
-			    ACPI_ROOT_OBJECT,
-			    ACPI_UINT32_MAX,
-			    processor_walk_namespace_cb, NULL, &action, NULL);
-}
-
-static
-void acpi_processor_uninstall_hotplug_notify(void)
-{
-	int action = UNINSTALL_NOTIFY_HANDLER;
-	acpi_walk_namespace(ACPI_TYPE_ANY,
-			    ACPI_ROOT_OBJECT,
-			    ACPI_UINT32_MAX,
-			    processor_walk_namespace_cb, NULL, &action, NULL);
-}
-
-static const struct acpi_device_id processor_device_ids[] = {
-	{ACPI_PROCESSOR_OBJECT_HID, 0},
-	{ACPI_PROCESSOR_DEVICE_HID, 0},
-	{"", 0},
-};
-MODULE_DEVICE_TABLE(acpi, processor_device_ids);
-
-static struct acpi_driver xen_acpi_processor_driver = {
-	.name = "processor",
-	.class = ACPI_PROCESSOR_CLASS,
-	.ids = processor_device_ids,
-	.ops = {
-		.add = xen_acpi_processor_add,
-		.remove = xen_acpi_processor_remove,
-		},
-};
-
-static int __init xen_acpi_processor_init(void)
-{
-	int result = 0;
-
-	if (!xen_initial_domain())
-		return -ENODEV;
-
-	/* unregister the stub which only used to reserve driver space */
-	xen_stub_processor_exit();
-
-	result = acpi_bus_register_driver(&xen_acpi_processor_driver);
-	if (result < 0) {
-		xen_stub_processor_init();
-		return result;
-	}
-
-	acpi_processor_install_hotplug_notify();
-	return 0;
-}
-
-static void __exit xen_acpi_processor_exit(void)
-{
-	if (!xen_initial_domain())
-		return;
-
-	acpi_processor_uninstall_hotplug_notify();
-
-	acpi_bus_unregister_driver(&xen_acpi_processor_driver);
-
-	/*
-	 * stub reserve space again to prevent any chance of native
-	 * driver loading.
-	 */
-	xen_stub_processor_init();
-	return;
-}
-
-module_init(xen_acpi_processor_init);
-module_exit(xen_acpi_processor_exit);
-ACPI_MODULE_NAME("xen-acpi-cpuhotplug");
-MODULE_AUTHOR("Liu Jinsong <jinsong.liu@intel.com>");
-MODULE_DESCRIPTION("Xen Hotplug CPU Driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/xen/xen-acpi-memhotplug.c b/drivers/xen/xen-acpi-memhotplug.c
deleted file mode 100644
index f914b72557ef..000000000000
--- a/drivers/xen/xen-acpi-memhotplug.c
+++ /dev/null
@@ -1,475 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2012 Intel Corporation
- *    Author: Liu Jinsong <jinsong.liu@intel.com>
- *    Author: Jiang Yunhong <yunhong.jiang@intel.com>
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/types.h>
-#include <linux/acpi.h>
-#include <xen/acpi.h>
-#include <xen/interface/platform.h>
-#include <asm/xen/hypercall.h>
-
-#define PREFIX "ACPI:xen_memory_hotplug:"
-
-struct acpi_memory_info {
-	struct list_head list;
-	u64 start_addr;		/* Memory Range start physical addr */
-	u64 length;		/* Memory Range length */
-	unsigned short caching;	/* memory cache attribute */
-	unsigned short write_protect;	/* memory read/write attribute */
-				/* copied from buffer getting from _CRS */
-	unsigned int enabled:1;
-};
-
-struct acpi_memory_device {
-	struct acpi_device *device;
-	struct list_head res_list;
-};
-
-static bool acpi_hotmem_initialized __read_mostly;
-
-static int xen_hotadd_memory(int pxm, struct acpi_memory_info *info)
-{
-	int rc;
-	struct xen_platform_op op;
-
-	op.cmd = XENPF_mem_hotadd;
-	op.u.mem_add.spfn = info->start_addr >> PAGE_SHIFT;
-	op.u.mem_add.epfn = (info->start_addr + info->length) >> PAGE_SHIFT;
-	op.u.mem_add.pxm = pxm;
-
-	rc = HYPERVISOR_dom0_op(&op);
-	if (rc)
-		pr_err(PREFIX "Xen Hotplug Memory Add failed on "
-			"0x%lx -> 0x%lx, _PXM: %d, error: %d\n",
-			(unsigned long)info->start_addr,
-			(unsigned long)(info->start_addr + info->length),
-			pxm, rc);
-
-	return rc;
-}
-
-static int xen_acpi_memory_enable_device(struct acpi_memory_device *mem_device)
-{
-	int pxm, result;
-	int num_enabled = 0;
-	struct acpi_memory_info *info;
-
-	if (!mem_device)
-		return -EINVAL;
-
-	pxm = xen_acpi_get_pxm(mem_device->device->handle);
-	if (pxm < 0)
-		return pxm;
-
-	list_for_each_entry(info, &mem_device->res_list, list) {
-		if (info->enabled) { /* just sanity check...*/
-			num_enabled++;
-			continue;
-		}
-
-		if (!info->length)
-			continue;
-
-		result = xen_hotadd_memory(pxm, info);
-		if (result)
-			continue;
-		info->enabled = 1;
-		num_enabled++;
-	}
-
-	if (!num_enabled)
-		return -ENODEV;
-
-	return 0;
-}
-
-static acpi_status
-acpi_memory_get_resource(struct acpi_resource *resource, void *context)
-{
-	struct acpi_memory_device *mem_device = context;
-	struct acpi_resource_address64 address64;
-	struct acpi_memory_info *info, *new;
-	acpi_status status;
-
-	status = acpi_resource_to_address64(resource, &address64);
-	if (ACPI_FAILURE(status) ||
-	    (address64.resource_type != ACPI_MEMORY_RANGE))
-		return AE_OK;
-
-	list_for_each_entry(info, &mem_device->res_list, list) {
-		if ((info->caching == address64.info.mem.caching) &&
-		    (info->write_protect == address64.info.mem.write_protect) &&
-		    (info->start_addr + info->length == address64.address.minimum)) {
-			info->length += address64.address.address_length;
-			return AE_OK;
-		}
-	}
-
-	new = kzalloc(sizeof(struct acpi_memory_info), GFP_KERNEL);
-	if (!new)
-		return AE_ERROR;
-
-	INIT_LIST_HEAD(&new->list);
-	new->caching = address64.info.mem.caching;
-	new->write_protect = address64.info.mem.write_protect;
-	new->start_addr = address64.address.minimum;
-	new->length = address64.address.address_length;
-	list_add_tail(&new->list, &mem_device->res_list);
-
-	return AE_OK;
-}
-
-static int
-acpi_memory_get_device_resources(struct acpi_memory_device *mem_device)
-{
-	acpi_status status;
-	struct acpi_memory_info *info, *n;
-
-	if (!list_empty(&mem_device->res_list))
-		return 0;
-
-	status = acpi_walk_resources(mem_device->device->handle,
-		METHOD_NAME__CRS, acpi_memory_get_resource, mem_device);
-
-	if (ACPI_FAILURE(status)) {
-		list_for_each_entry_safe(info, n, &mem_device->res_list, list)
-			kfree(info);
-		INIT_LIST_HEAD(&mem_device->res_list);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int acpi_memory_get_device(acpi_handle handle,
-				  struct acpi_memory_device **mem_device)
-{
-	struct acpi_device *device = NULL;
-	int result = 0;
-
-	acpi_scan_lock_acquire();
-
-	acpi_bus_get_device(handle, &device);
-	if (acpi_device_enumerated(device))
-		goto end;
-
-	/*
-	 * Now add the notified device.  This creates the acpi_device
-	 * and invokes .add function
-	 */
-	result = acpi_bus_scan(handle);
-	if (result) {
-		pr_warn(PREFIX "ACPI namespace scan failed\n");
-		result = -EINVAL;
-		goto out;
-	}
-	device = NULL;
-	acpi_bus_get_device(handle, &device);
-	if (!acpi_device_enumerated(device)) {
-		pr_warn(PREFIX "Missing device object\n");
-		result = -EINVAL;
-		goto out;
-	}
-
-end:
-	*mem_device = acpi_driver_data(device);
-	if (!(*mem_device)) {
-		pr_err(PREFIX "driver data not found\n");
-		result = -ENODEV;
-		goto out;
-	}
-
-out:
-	acpi_scan_lock_release();
-	return result;
-}
-
-static int acpi_memory_check_device(struct acpi_memory_device *mem_device)
-{
-	unsigned long long current_status;
-
-	/* Get device present/absent information from the _STA */
-	if (ACPI_FAILURE(acpi_evaluate_integer(mem_device->device->handle,
-				"_STA", NULL, &current_status)))
-		return -ENODEV;
-	/*
-	 * Check for device status. Device should be
-	 * present/enabled/functioning.
-	 */
-	if (!((current_status & ACPI_STA_DEVICE_PRESENT)
-	      && (current_status & ACPI_STA_DEVICE_ENABLED)
-	      && (current_status & ACPI_STA_DEVICE_FUNCTIONING)))
-		return -ENODEV;
-
-	return 0;
-}
-
-static int acpi_memory_disable_device(struct acpi_memory_device *mem_device)
-{
-	pr_debug(PREFIX "Xen does not support memory hotremove\n");
-
-	return -ENOSYS;
-}
-
-static void acpi_memory_device_notify(acpi_handle handle, u32 event, void *data)
-{
-	struct acpi_memory_device *mem_device;
-	struct acpi_device *device;
-	u32 ost_code = ACPI_OST_SC_NON_SPECIFIC_FAILURE; /* default */
-
-	switch (event) {
-	case ACPI_NOTIFY_BUS_CHECK:
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
-			"\nReceived BUS CHECK notification for device\n"));
-		fallthrough;
-	case ACPI_NOTIFY_DEVICE_CHECK:
-		if (event == ACPI_NOTIFY_DEVICE_CHECK)
-			ACPI_DEBUG_PRINT((ACPI_DB_INFO,
-			"\nReceived DEVICE CHECK notification for device\n"));
-
-		if (acpi_memory_get_device(handle, &mem_device)) {
-			pr_err(PREFIX "Cannot find driver data\n");
-			break;
-		}
-
-		ost_code = ACPI_OST_SC_SUCCESS;
-		break;
-
-	case ACPI_NOTIFY_EJECT_REQUEST:
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
-			"\nReceived EJECT REQUEST notification for device\n"));
-
-		acpi_scan_lock_acquire();
-		if (acpi_bus_get_device(handle, &device)) {
-			acpi_scan_lock_release();
-			pr_err(PREFIX "Device doesn't exist\n");
-			break;
-		}
-		mem_device = acpi_driver_data(device);
-		if (!mem_device) {
-			acpi_scan_lock_release();
-			pr_err(PREFIX "Driver Data is NULL\n");
-			break;
-		}
-
-		/*
-		 * TBD: implement acpi_memory_disable_device and invoke
-		 * acpi_bus_remove if Xen support hotremove in the future
-		 */
-		acpi_memory_disable_device(mem_device);
-		acpi_scan_lock_release();
-		break;
-
-	default:
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
-				  "Unsupported event [0x%x]\n", event));
-		/* non-hotplug event; possibly handled by other handler */
-		return;
-	}
-
-	(void) acpi_evaluate_ost(handle, event, ost_code, NULL);
-	return;
-}
-
-static int xen_acpi_memory_device_add(struct acpi_device *device)
-{
-	int result;
-	struct acpi_memory_device *mem_device = NULL;
-
-
-	if (!device)
-		return -EINVAL;
-
-	mem_device = kzalloc(sizeof(struct acpi_memory_device), GFP_KERNEL);
-	if (!mem_device)
-		return -ENOMEM;
-
-	INIT_LIST_HEAD(&mem_device->res_list);
-	mem_device->device = device;
-	sprintf(acpi_device_name(device), "%s", ACPI_MEMORY_DEVICE_NAME);
-	sprintf(acpi_device_class(device), "%s", ACPI_MEMORY_DEVICE_CLASS);
-	device->driver_data = mem_device;
-
-	/* Get the range from the _CRS */
-	result = acpi_memory_get_device_resources(mem_device);
-	if (result) {
-		kfree(mem_device);
-		return result;
-	}
-
-	/*
-	 * For booting existed memory devices, early boot code has recognized
-	 * memory area by EFI/E820. If DSDT shows these memory devices on boot,
-	 * hotplug is not necessary for them.
-	 * For hot-added memory devices during runtime, it need hypercall to
-	 * Xen hypervisor to add memory.
-	 */
-	if (!acpi_hotmem_initialized)
-		return 0;
-
-	if (!acpi_memory_check_device(mem_device))
-		result = xen_acpi_memory_enable_device(mem_device);
-
-	return result;
-}
-
-static int xen_acpi_memory_device_remove(struct acpi_device *device)
-{
-	struct acpi_memory_device *mem_device = NULL;
-
-	if (!device || !acpi_driver_data(device))
-		return -EINVAL;
-
-	mem_device = acpi_driver_data(device);
-	kfree(mem_device);
-
-	return 0;
-}
-
-/*
- * Helper function to check for memory device
- */
-static acpi_status is_memory_device(acpi_handle handle)
-{
-	char *hardware_id;
-	acpi_status status;
-	struct acpi_device_info *info;
-
-	status = acpi_get_object_info(handle, &info);
-	if (ACPI_FAILURE(status))
-		return status;
-
-	if (!(info->valid & ACPI_VALID_HID)) {
-		kfree(info);
-		return AE_ERROR;
-	}
-
-	hardware_id = info->hardware_id.string;
-	if ((hardware_id == NULL) ||
-	    (strcmp(hardware_id, ACPI_MEMORY_DEVICE_HID)))
-		status = AE_ERROR;
-
-	kfree(info);
-	return status;
-}
-
-static acpi_status
-acpi_memory_register_notify_handler(acpi_handle handle,
-				    u32 level, void *ctxt, void **retv)
-{
-	acpi_status status;
-
-	status = is_memory_device(handle);
-	if (ACPI_FAILURE(status))
-		return AE_OK;	/* continue */
-
-	status = acpi_install_notify_handler(handle, ACPI_SYSTEM_NOTIFY,
-					     acpi_memory_device_notify, NULL);
-	/* continue */
-	return AE_OK;
-}
-
-static acpi_status
-acpi_memory_deregister_notify_handler(acpi_handle handle,
-				      u32 level, void *ctxt, void **retv)
-{
-	acpi_status status;
-
-	status = is_memory_device(handle);
-	if (ACPI_FAILURE(status))
-		return AE_OK;	/* continue */
-
-	status = acpi_remove_notify_handler(handle,
-					    ACPI_SYSTEM_NOTIFY,
-					    acpi_memory_device_notify);
-
-	return AE_OK;	/* continue */
-}
-
-static const struct acpi_device_id memory_device_ids[] = {
-	{ACPI_MEMORY_DEVICE_HID, 0},
-	{"", 0},
-};
-MODULE_DEVICE_TABLE(acpi, memory_device_ids);
-
-static struct acpi_driver xen_acpi_memory_device_driver = {
-	.name = "acpi_memhotplug",
-	.class = ACPI_MEMORY_DEVICE_CLASS,
-	.ids = memory_device_ids,
-	.ops = {
-		.add = xen_acpi_memory_device_add,
-		.remove = xen_acpi_memory_device_remove,
-		},
-};
-
-static int __init xen_acpi_memory_device_init(void)
-{
-	int result;
-	acpi_status status;
-
-	if (!xen_initial_domain())
-		return -ENODEV;
-
-	/* unregister the stub which only used to reserve driver space */
-	xen_stub_memory_device_exit();
-
-	result = acpi_bus_register_driver(&xen_acpi_memory_device_driver);
-	if (result < 0) {
-		xen_stub_memory_device_init();
-		return -ENODEV;
-	}
-
-	status = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
-				     ACPI_UINT32_MAX,
-				     acpi_memory_register_notify_handler,
-				     NULL, NULL, NULL);
-
-	if (ACPI_FAILURE(status)) {
-		pr_warn(PREFIX "walk_namespace failed\n");
-		acpi_bus_unregister_driver(&xen_acpi_memory_device_driver);
-		xen_stub_memory_device_init();
-		return -ENODEV;
-	}
-
-	acpi_hotmem_initialized = true;
-	return 0;
-}
-
-static void __exit xen_acpi_memory_device_exit(void)
-{
-	acpi_status status;
-
-	if (!xen_initial_domain())
-		return;
-
-	status = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
-				     ACPI_UINT32_MAX,
-				     acpi_memory_deregister_notify_handler,
-				     NULL, NULL, NULL);
-	if (ACPI_FAILURE(status))
-		pr_warn(PREFIX "walk_namespace failed\n");
-
-	acpi_bus_unregister_driver(&xen_acpi_memory_device_driver);
-
-	/*
-	 * stub reserve space again to prevent any chance of native
-	 * driver loading.
-	 */
-	xen_stub_memory_device_init();
-	return;
-}
-
-module_init(xen_acpi_memory_device_init);
-module_exit(xen_acpi_memory_device_exit);
-ACPI_MODULE_NAME("xen-acpi-memhotplug");
-MODULE_AUTHOR("Liu Jinsong <jinsong.liu@intel.com>");
-MODULE_DESCRIPTION("Xen Hotplug Mem Driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/xen/xen-stub.c b/drivers/xen/xen-stub.c
deleted file mode 100644
index 3be4e74660b5..000000000000
--- a/drivers/xen/xen-stub.c
+++ /dev/null
@@ -1,90 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * xen-stub.c - stub drivers to reserve space for Xen
- *
- * Copyright (C) 2012 Intel Corporation
- *    Author: Liu Jinsong <jinsong.liu@intel.com>
- *    Author: Jiang Yunhong <yunhong.jiang@intel.com>
- *
- * Copyright (C) 2012 Oracle Inc
- *    Author: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
- */
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/export.h>
-#include <linux/types.h>
-#include <linux/acpi.h>
-#include <xen/acpi.h>
-
-#ifdef CONFIG_ACPI
-
-/*--------------------------------------------
-	stub driver for Xen memory hotplug
---------------------------------------------*/
-
-static const struct acpi_device_id memory_device_ids[] = {
-	{ACPI_MEMORY_DEVICE_HID, 0},
-	{"", 0},
-};
-
-static struct acpi_driver xen_stub_memory_device_driver = {
-	/* same name as native memory driver to block native loaded */
-	.name = "acpi_memhotplug",
-	.class = ACPI_MEMORY_DEVICE_CLASS,
-	.ids = memory_device_ids,
-};
-
-int xen_stub_memory_device_init(void)
-{
-	if (!xen_initial_domain())
-		return -ENODEV;
-
-	/* just reserve space for Xen, block native driver loaded */
-	return acpi_bus_register_driver(&xen_stub_memory_device_driver);
-}
-EXPORT_SYMBOL_GPL(xen_stub_memory_device_init);
-subsys_initcall(xen_stub_memory_device_init);
-
-void xen_stub_memory_device_exit(void)
-{
-	acpi_bus_unregister_driver(&xen_stub_memory_device_driver);
-}
-EXPORT_SYMBOL_GPL(xen_stub_memory_device_exit);
-
-
-/*--------------------------------------------
-	stub driver for Xen cpu hotplug
---------------------------------------------*/
-
-static const struct acpi_device_id processor_device_ids[] = {
-	{ACPI_PROCESSOR_OBJECT_HID, 0},
-	{ACPI_PROCESSOR_DEVICE_HID, 0},
-	{"", 0},
-};
-
-static struct acpi_driver xen_stub_processor_driver = {
-	/* same name as native processor driver to block native loaded */
-	.name = "processor",
-	.class = ACPI_PROCESSOR_CLASS,
-	.ids = processor_device_ids,
-};
-
-int xen_stub_processor_init(void)
-{
-	if (!xen_initial_domain())
-		return -ENODEV;
-
-	/* just reserve space for Xen, block native driver loaded */
-	return acpi_bus_register_driver(&xen_stub_processor_driver);
-}
-EXPORT_SYMBOL_GPL(xen_stub_processor_init);
-subsys_initcall(xen_stub_processor_init);
-
-void xen_stub_processor_exit(void)
-{
-	acpi_bus_unregister_driver(&xen_stub_processor_driver);
-}
-EXPORT_SYMBOL_GPL(xen_stub_processor_exit);
-
-#endif
diff --git a/include/xen/acpi.h b/include/xen/acpi.h
index 4ddd7dc4a61e..b1e11863144d 100644
--- a/include/xen/acpi.h
+++ b/include/xen/acpi.h
@@ -40,41 +40,6 @@
 #include <xen/xen.h>
 #include <linux/acpi.h>
 
-#define ACPI_MEMORY_DEVICE_CLASS        "memory"
-#define ACPI_MEMORY_DEVICE_HID          "PNP0C80"
-#define ACPI_MEMORY_DEVICE_NAME         "Hotplug Mem Device"
-
-int xen_stub_memory_device_init(void);
-void xen_stub_memory_device_exit(void);
-
-#define ACPI_PROCESSOR_CLASS            "processor"
-#define ACPI_PROCESSOR_DEVICE_HID       "ACPI0007"
-#define ACPI_PROCESSOR_DEVICE_NAME      "Processor"
-
-int xen_stub_processor_init(void);
-void xen_stub_processor_exit(void);
-
-void xen_pcpu_hotplug_sync(void);
-int xen_pcpu_id(uint32_t acpi_id);
-
-static inline int xen_acpi_get_pxm(acpi_handle h)
-{
-	unsigned long long pxm;
-	acpi_status status;
-	acpi_handle handle;
-	acpi_handle phandle = h;
-
-	do {
-		handle = phandle;
-		status = acpi_evaluate_integer(handle, "_PXM", NULL, &pxm);
-		if (ACPI_SUCCESS(status))
-			return pxm;
-		status = acpi_get_parent(handle, &phandle);
-	} while (ACPI_SUCCESS(status));
-
-	return -ENXIO;
-}
-
 int xen_acpi_notify_hypervisor_sleep(u8 sleep_state,
 				     u32 pm1a_cnt, u32 pm1b_cnd);
 int xen_acpi_notify_hypervisor_extended_sleep(u8 sleep_state,
-- 
1.8.3.1


