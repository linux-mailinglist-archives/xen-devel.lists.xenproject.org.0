Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000E4B17D35
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 09:12:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066871.1431908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhjvA-0004Nj-4A; Fri, 01 Aug 2025 07:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066871.1431908; Fri, 01 Aug 2025 07:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhjvA-0004LY-1O; Fri, 01 Aug 2025 07:11:16 +0000
Received: by outflank-mailman (input) for mailman id 1066871;
 Fri, 01 Aug 2025 07:11:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpGp=2N=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uhjv8-0004LS-OW
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 07:11:15 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b013a7d1-6ea6-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 09:11:04 +0200 (CEST)
Received: from CWLP265CA0353.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5a::29)
 by AS8PR08MB9337.eurprd08.prod.outlook.com (2603:10a6:20b:5a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 07:11:01 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:401:5a:cafe::fc) by CWLP265CA0353.outlook.office365.com
 (2603:10a6:401:5a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 07:11:01 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Fri, 1 Aug 2025 07:11:00 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB9653.eurprd08.prod.outlook.com (2603:10a6:10:449::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 07:10:28 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%2]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 07:10:27 +0000
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
X-Inumbo-ID: b013a7d1-6ea6-11f0-b895-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=p+GXfYzy6PSKJZo+e2ouzmtuaOfdpccth5BVwfmLqvG5YNR/fSlSM2fBrq9j8tNKuXyoo4LPv+r751WTnWIcxEqAW7Gldj+fYwBRmbyjZaooR2RUt1cmNk15QT2UpxrP6nmYpcGblx3s1phqqG2MBvC7AwxJKQEIGErB2jV5gGJBbqc8pkjYJgjU4hML/NHmbCPiw6TTjBMWMOR7PtsX2dVKKRZwVUoGnqebZ2vcIytN2WIVLDJJVhvdvwnGylrnVpGKNbJO08HUIrKSAH0u3z5wfGafDWW1hCJBKy8QxDQ37kJ+6ruRBUN6QKs/hrUTLdT3mD0wEkt32cqLP75IJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkzy3umRnmqtfIGARryYAc4SJikWAU+EFjxAQcqS3Qg=;
 b=NWmgzcgNG8+lB7bJqEdjLoPcBS6RGdfiE/3brtvCIsvEbkb5jbpVyGJ15Q1TMUl+o3w+v2HXLVLE8pI8wEE1jNp5TgcINlGtMFPyQw5DKFT07ztCOGIMj9J8TZ5opiDDow3S2tVDQiV/I3t75xmGn5xv3+DqIqWphlszWdrNBskWGH/vFj8Ud3FHWPBREtksfi2wu3M7cBwU6JOR02dUx5F0u55AHJdPJ4rJDmpqUFBxnR+ZRYK9Euu2/7d5BOEdIoVWN3ZpmqYOE/Qec0KP+5bVhnoBlcCzwzEQ6EyxLnbgbU1ambMX1bOd591Hf40Y9t0KGyrdfbfkeM/+NycpWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkzy3umRnmqtfIGARryYAc4SJikWAU+EFjxAQcqS3Qg=;
 b=OV3zYUbJQDdaaFjN36IOWyzgHqWvV2tDr8wf4ITcmC+gggnGKgCqheUbBfXdwLjsSEF0vQyX/0wmV3BfghnRfmywWMRt0G3EWm5ySDeY9xoly+8LuD99kIzdSHLzJFJXCYFHXeIuc+Ov9e2VwmO7czF2ZhVmjOEwmotSTa8Jts4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJ7S5MT41L6slKCJJdyNo6kUHd+sVQXMN3ugvW4+Zm+A5FMlUjHwwRGwgrRa3Io0yV/NdH0qejdUjqvDL9TDWFR/z6dywqxjYUbYdWW3IWt+F5Xe52z3jZlKTpSyYKqkQJFYat8MXNs5F7d+tEfZpp453RwWaaO7lIoAn9m2RxfMBzcQqvDEMh5eaAyo8jXhbpqFh4sq+ykH2J4RdowMFz6AhPmQXRa7S2V/RA1i5TNdMSLycoc3tzAb+EWE9RTmCPhlTioZ3G0ht0fkVm4mTLw58fIxdyMzLai4C0oLG9cU/swjloYFqCi3nncFmSCjZxY7P2MHq8LJJi/w4LdzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkzy3umRnmqtfIGARryYAc4SJikWAU+EFjxAQcqS3Qg=;
 b=CQveCUl7K51L5OyXaj4+Ko+KFT+zk/DsmY4WqtyZa0cpXq5SKfk1sYjYYrdoLmNlBoEZTOLSSMoEuhJOugkwMNFryLRyacJPhp+3lkzRc/jS6c5JSGHdJt7eLnjytB5vnQAMRqfhlmB+XAgZvaSlxYIPPST+WhuobNXSoarcljnB2yBJSuvM/GVRrgkLPDsGNDctu9oesTYR6XdHYjWOuUcYE+wj82rzFw3K9N8vIWvpRf0AJKP2K4tCH+fDfmZDlMPG29Fsr1NSbzCyrfsvAMYayK7+rgyY+iu/K388xIskXa71kZVpNdNpX4a53Zlnzf1OGq13a73K5KZDYOOwlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkzy3umRnmqtfIGARryYAc4SJikWAU+EFjxAQcqS3Qg=;
 b=OV3zYUbJQDdaaFjN36IOWyzgHqWvV2tDr8wf4ITcmC+gggnGKgCqheUbBfXdwLjsSEF0vQyX/0wmV3BfghnRfmywWMRt0G3EWm5ySDeY9xoly+8LuD99kIzdSHLzJFJXCYFHXeIuc+Ov9e2VwmO7czF2ZhVmjOEwmotSTa8Jts4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v7 3/6] xen/arm: ffa: Introduce VM to VM support
Thread-Topic: [PATCH v7 3/6] xen/arm: ffa: Introduce VM to VM support
Thread-Index: AQHb9xP9tgnM92Sxpk+5sdmAsJMirrRNeIKA
Date: Fri, 1 Aug 2025 07:10:27 +0000
Message-ID: <83336841-32E9-498F-8D72-13F7B07A9DB3@arm.com>
References: <cover.1752754016.git.bertrand.marquis@arm.com>
 <50224eb7cca4eaef2646ad8e33f689d912704733.1752754016.git.bertrand.marquis@arm.com>
In-Reply-To:
 <50224eb7cca4eaef2646ad8e33f689d912704733.1752754016.git.bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB9653:EE_|AM3PEPF0000A78E:EE_|AS8PR08MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 348d5070-5d8a-419f-ec06-08ddd0ca91ea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?iliutpi+AvY3ObuvtylNLXpFWpHOungRXwwVx22eW+inUTwsdxn4KXz85Owv?=
 =?us-ascii?Q?j+dMOUgmKktsK+VX04koaQsXYXuOuVMVb9M1JghTsDEJtItJwyGXl28zPFIw?=
 =?us-ascii?Q?p/3DoCEWkyXNEvK5h7ujmHFKNyTAr6HWWahF2gNxfrPR25ZNzwLrfJGc+o1R?=
 =?us-ascii?Q?wYyknlJIb/SDJ6aIqMn5VAUXu63ZUfUYagzd0GGrAxypf9nYzgn3ctDUEGL/?=
 =?us-ascii?Q?9RvmrmDAqDtMsK/gqPky58Qp2P5anabhj5trfXlkBWXz5p625cttd1hUjPHk?=
 =?us-ascii?Q?cOksqr7/G3fIHgTEq/5TXJL7wm9MC6x4NdgpWVQkSm8o8m3YS4Fa/QfbIqwg?=
 =?us-ascii?Q?WZ8ZwbVmBuom3eRV+emAzjZVNcp1J9lXbYxcPu3Vew4LWFQla7Rv8G28ARU1?=
 =?us-ascii?Q?s+EPUzKBORyo01PaoxvnSlXG1qZ+37dik3xbRBAYUbBJUWB/TphLWd6CZb94?=
 =?us-ascii?Q?FxvBtvY4muejQcOxv+BbcW9rBK9FIcvk22EB6ZUZItnmz1WWCmWpPpkdRy1v?=
 =?us-ascii?Q?lnruVupao48KCJAsRdMrK1D8vkqVQ8kDSWeOL0ktlK6reMT/dVE2QaekMwGa?=
 =?us-ascii?Q?KQGMhYtmylcU+Aty0eniN3stLxAW4+qX7cRWKvZjv4b/cgKS2PMRHch1OTTr?=
 =?us-ascii?Q?vGHA955kHgHWnCXRI3KqMvyjK+5AYVCbljX3sKra0vB66qof0OxxBqHvDvzz?=
 =?us-ascii?Q?R6IJkXKW9W5lCJfgNUWhrxen1bY//PvFHdo+KYQlXAb8EhNzNBpILlkVeB5T?=
 =?us-ascii?Q?sCE6WRhbFw4wuWiOnqq5jIvpfW1ZapLh17UO4dIlwvSEf92Vnlb1OicH+HFh?=
 =?us-ascii?Q?2q3UKPryc9jCp1NiSvQmRjs6SajpYJmKd2tIa2XJRn6P+7jUux12gnhxlac7?=
 =?us-ascii?Q?eyBgxcDzDdAwoTMWdB+g7mYNmyDBcARIkvpeKbWhlswMChtUJ0Prhai60r8x?=
 =?us-ascii?Q?00SSdO4bAKZDzUU/KF7ddb1uS9+60v96GuXeMoPeHbs8tNr6DGYkgZq9R9Jf?=
 =?us-ascii?Q?qJm/GPzLSw9QGy+aGWGZlchcgNYnXnLT8yUqWwRdstN3RBl3WkvZRUE8m5Fg?=
 =?us-ascii?Q?8erlLjsItSx2vW4qVBqFlVJntlICCaogC08cArSc4y+NwD831uI+gQ5ib1LO?=
 =?us-ascii?Q?DHVW0Fetuo9n0987LPxojzd7cIrBWpm5lLcfCJn276aa0/EeQxCwR+/gM46N?=
 =?us-ascii?Q?K11Vqthb8XwFZVOTTcoG3KjJq6cFEbjALIn5VeEV/7hBZStJ5OUseu3Mo1lX?=
 =?us-ascii?Q?irxqtEmxTJ2y0fdZoao1oVyxcJ65DlkHi1bsEpJw9srdjwztQzTMSvUHianU?=
 =?us-ascii?Q?/axOk7g6i0ZM+moBzfvNGTgB4139ytpd+u+6mhsDgldSIyhE1Wq3Tl/VqGKO?=
 =?us-ascii?Q?ilKi0AZzBI92dEDChbV8Qlw3h7+qd+BzeN/v9K0DjN43TINLvx3uoYDCQ7+W?=
 =?us-ascii?Q?+lKuttBUTtnSzq0aE7Oh0JC/Ggim4lYuYfHnou4QSmNM8KzvqcoK4TYP5hZP?=
 =?us-ascii?Q?ueAwH8qQ+CyIRGM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <89809D960E9CD34B9FC38AAE487B887F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9653
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a011ef5-b17d-4abe-2598-08ddd0ca7e5e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|35042699022|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FPubN1RT7lDyH7qj7jpA+h6AfX7E0qxEoXY+fUlEx8d93ROzYVcKCgwOhlt4?=
 =?us-ascii?Q?xIsqtEiXsf4z/9JX1cBz2zXllhNS/7iHMw3ffvPHxnniBPtNXydzSo6+gSPK?=
 =?us-ascii?Q?8DFsgkVyysNhle3Rg37drWtJCEbARFwFUY7IcaNFYGeetUHiplwvma2brxyo?=
 =?us-ascii?Q?C5O+HEeuREPCDcjDRPUb2GSmXNBJrj06XI3RAJiFS9c+ur09qnwCVw7w72zj?=
 =?us-ascii?Q?xIqhfb7KLalNJUyrIR2phORsGalZEsb61RdJphWh4Uvrqluij1BUKJBx8Qxt?=
 =?us-ascii?Q?ppZL0Z9gE1Kqe6M83Q5K2itBej30tcIT63a03EQFQdmVijrVNL50osOziowt?=
 =?us-ascii?Q?uYc9f/tckDnI54nGLTrbDXR87MEFoKiVJYGuvFCw62QPgxIhZCsmy/aCEmP/?=
 =?us-ascii?Q?0hnKkTilWVvv5ZWOCfI/Qvcvr2bRi3RBBnJcO9OKDOWTLQosgWVUOEicFDf1?=
 =?us-ascii?Q?mcnBO+7fU0OFzfO26Efz/jMTUTyTANWQ6cm5Ob8KK6wrn8CbIPNBc7Qzsk+k?=
 =?us-ascii?Q?bX8kcE0EZD02xsYT0xxEiyJ6IE5kXwWnx8pQJVnWsDGKxkUhlYp4LLPv7cc8?=
 =?us-ascii?Q?P3rrArK5xul+aRXaNu3z53exkniwc12G0/P8QuopMh6vZYBrwCLlflLG6u64?=
 =?us-ascii?Q?KanRUGarDZmHiRbNVqowE2HJDTbH6e07tqQtHvDs6BcD4PTqsh5BJzxQ0BVH?=
 =?us-ascii?Q?GiulvpunxrQjurn3BV6SAj1doV5KBeMjqFBNm//Xes6N7t48OwwnF21+9VSv?=
 =?us-ascii?Q?4qK6XP+sKM3pZeJ+McIj/mLrE2vKOFwHxtpeE8Ww1LvXq2yrAmFzm323Usvo?=
 =?us-ascii?Q?r834hOvY5rp+Nk3RqxzFvBb9zKDzhtAFoqmaRyahDSQfYd4pkACFV53NBqsQ?=
 =?us-ascii?Q?RvGdvFTXKt6OqTfyILtEAAzbKrP4723w4E6vQje3XlpGKh7ujktfubJNae9i?=
 =?us-ascii?Q?DiJDqVW2FbbFc9q3+NlSAQ1QNykwFXFvz2Vt1rUSdg22XRYzgQHcbUAfZodu?=
 =?us-ascii?Q?pPTySUVQTAWM8LDvTQDV8HffByLbuUwalJqBUE0uiYG+CBSrE2JHBdw/lcHy?=
 =?us-ascii?Q?CX+VFrGrAooKrHLURtsXxzHnbwaQIkAMfG/t25C0Lb1Vb6/PsCZgINlC7g0i?=
 =?us-ascii?Q?QvQhLjI3RUIJYLfz1Gb+cBmFdxbaDxaSSbgTJ4IMCL86ReUM4QjRNWIWcsge?=
 =?us-ascii?Q?tI2MQnrMVbN4WFAOMNXI5kBG1zFrouXbDK0e0ztP9QZtjfPXFbXJ9VMXWgnY?=
 =?us-ascii?Q?znyGRySBIcrk5SsINYSghi38bMBlcEAq7WkT9pX1ns3vJr1VZwVSuu5RZEp6?=
 =?us-ascii?Q?RBP7aWq5oQ7+vMmy+hm9fMOJNbcBxlQrRHvkV4+U60COmmu4ysZovPiJ5ZoM?=
 =?us-ascii?Q?P6xpfQDSInIfFm5OMJzzwgYtBA7a8hg9bOsy90Ru8Q3pSPePB095PDjF+DnD?=
 =?us-ascii?Q?z+FaaemY1ShohsTVHK7FYCQDYEF+EcRJs7iPTcela2akl5OXBFcrMbHnp3j3?=
 =?us-ascii?Q?ZwzIVIoLJ0s2xVu1MiAAtJxK5f5PVWGiHg7eDLtv9FtlI0597f8wPGbv/w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(35042699022)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 07:11:00.5512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 348d5070-5d8a-419f-ec06-08ddd0ca91ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9337

Hi,

A gentle ping for someone to review this :-)

Thanks
Bertrand

> On 17 Jul 2025, at 14:11, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
> between VMs.
> When activated list VMs in the system with FF-A support in part_info_get.
>=20
> When VM to VM is activated, Xen will be tainted as Insecure and a
> message is displayed to the user during the boot as there is no
> filtering of VMs in FF-A so any VM can communicate or see any other VM
> in the system.
>=20
> WARNING: There is no filtering for now and all VMs are listed !!
>=20
> This patch is reorganizing the ffa_ctx structure to make clear which
> lock is protecting what parts.
>=20
> This patch is introducing a chain list of the ffa_ctx with a FFA Version
> negociated allowing to create the partinfo results for VMs in parallel
> by using rwlock which only ensure addition/removal of entries are
> protected.
>=20
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v7:
> - protect ffa_ctx list with a rw lock to allow several partinfo_get in
>  parallel but protect adding/removing entries.
> Changes in v6:
> - remove ACCESS_ONCE for guest_vers access and take the context lock
>  before modifying it
> - move guest_vers in context declaration to fields protected by the
>  context lock and add a comment to state that lock in only needed when
>  modifying it
> Changes in v5:
> - remove invalid comment about 1.1 firmware support
> - rename variables from d and dom to curr_d and dest_d (Julien)
> - add a TODO in the code for potential holding for long of the CPU
>  (Julien)
> - use an atomic global variable to store the number of VMs instead of
>  recomputing the value each time (Julien)
> - add partinfo information in ffa_ctx (id, cpus and 64bit) and create a
>  chain list of ctx. Use this chain list to create the partinfo result
>  without holding a global lock to prevent concurrency issues.
> - Move some changes in a preparation patch modifying partinfo for sps to
>  reduce this patch size and make the review easier
> Changes in v4:
> - properly handle SPMC version 1.0 header size case in partinfo_get
> - switch to local counting variables instead of *pointer +=3D 1 form
> - coding style issue with missing spaces in if ()
> Changes in v3:
> - break partinfo_get in several sub functions to make the implementation
>  easier to understand and lock handling easier
> - rework implementation to check size along the way and prevent previous
>  implementation limits which had to check that the number of VMs or SPs
>  did not change
> - taint Xen as INSECURE when VM to VM is enabled
> Changes in v2:
> - Switch ifdef to IS_ENABLED
> - dom was not switched to d as requested by Jan because there is already
>  a variable d pointing to the current domain and it must not be
>  shadowed.
> ---
> xen/arch/arm/tee/Kconfig        |  11 +++
> xen/arch/arm/tee/ffa.c          |  47 +++++++++++++
> xen/arch/arm/tee/ffa_partinfo.c | 100 ++++++++++++++++++++++++---
> xen/arch/arm/tee/ffa_private.h  | 117 ++++++++++++++++++++++++++------
> 4 files changed, 245 insertions(+), 30 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
> index c5b0f88d7522..88a4c4c99154 100644
> --- a/xen/arch/arm/tee/Kconfig
> +++ b/xen/arch/arm/tee/Kconfig
> @@ -28,5 +28,16 @@ config FFA
>=20
>  [1] https://developer.arm.com/documentation/den0077/latest
>=20
> +config FFA_VM_TO_VM
> +    bool "Enable FF-A between VMs (UNSUPPORTED)" if UNSUPPORTED
> +    default n
> +    depends on FFA
> +    help
> +      This option enables to use FF-A between VMs.
> +      This is experimental and there is no access control so any
> +      guest can communicate with any other guest.
> +
> +      If unsure, say N.
> +
> endmenu
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 3bbdd7168a6b..be71eda4869f 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -118,6 +118,13 @@ void *ffa_tx __read_mostly;
> DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> DEFINE_SPINLOCK(ffa_tx_buffer_lock);
>=20
> +struct list_head ffa_ctx_head;
> +/* RW Lock to protect addition/removal and reading in ffa_ctx_head */
> +rwlock_t ffa_ctx_list_rwlock;
> +
> +#ifdef CONFIG_FFA_VM_TO_VM
> +atomic_t ffa_vm_count;
> +#endif
>=20
> /* Used to track domains that could not be torn down immediately. */
> static struct timer ffa_teardown_timer;
> @@ -151,6 +158,7 @@ static void handle_version(struct cpu_user_regs *regs=
)
>     struct domain *d =3D current->domain;
>     struct ffa_ctx *ctx =3D d->arch.tee;
>     uint32_t vers =3D get_user_reg(regs, 1);
> +    uint32_t old_vers;
>=20
>     /*
>      * Guest will use the version it requested if it is our major and min=
or
> @@ -160,10 +168,23 @@ static void handle_version(struct cpu_user_regs *re=
gs)
>      */
>     if ( FFA_VERSION_MAJOR(vers) =3D=3D FFA_MY_VERSION_MAJOR )
>     {
> +        spin_lock(&ctx->lock);
> +        old_vers =3D ctx->guest_vers;
> +
>         if ( FFA_VERSION_MINOR(vers) > FFA_MY_VERSION_MINOR )
>             ctx->guest_vers =3D FFA_MY_VERSION;
>         else
>             ctx->guest_vers =3D vers;
> +        spin_unlock(&ctx->lock);
> +
> +        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !old_vers )
> +        {
> +            /* One more VM with FF-A support available */
> +            inc_ffa_vm_count();
> +            write_lock(&ffa_ctx_list_rwlock);
> +            list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
> +            write_unlock(&ffa_ctx_list_rwlock);
> +        }
>     }
>     ffa_set_regs(regs, FFA_MY_VERSION, 0, 0, 0, 0, 0, 0, 0);
> }
> @@ -345,6 +366,10 @@ static int ffa_domain_init(struct domain *d)
>     ctx->teardown_d =3D d;
>     INIT_LIST_HEAD(&ctx->shm_list);
>=20
> +    ctx->ffa_id =3D ffa_get_vm_id(d);
> +    ctx->num_vcpus =3D d->max_vcpus;
> +    ctx->is_64bit =3D is_64bit_domain(d);
> +
>     /*
>      * ffa_domain_teardown() will be called if ffa_domain_init() returns =
an
>      * error, so no need for cleanup in this function.
> @@ -421,6 +446,14 @@ static int ffa_domain_teardown(struct domain *d)
>     if ( !ctx )
>         return 0;
>=20
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ctx->guest_vers )
> +    {
> +        dec_ffa_vm_count();
> +        write_lock(&ffa_ctx_list_rwlock);
> +        list_del(&ctx->ctx_list);
> +        write_unlock(&ffa_ctx_list_rwlock);
> +    }
> +
>     ffa_rxtx_domain_destroy(d);
>     ffa_notif_domain_destroy(d);
>=20
> @@ -464,6 +497,18 @@ static bool ffa_probe(void)
>     printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
>            FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
>=20
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {
> +        /*
> +         * When FFA VM to VM is enabled, the current implementation does=
 not
> +         * offer any way to limit which VM can communicate with which VM=
 using
> +         * FF-A.
> +         * Signal this in the xen console and taint the system as insecu=
re.
> +         * TODO: Introduce a solution to limit what a VM can do through =
FFA.
> +         */
> +        printk(XENLOG_ERR "ffa: VM to VM is enabled, system is insecure =
!!\n");
> +        add_taint(TAINT_MACHINE_INSECURE);
> +    }
>     /*
>      * psci_init_smccc() updates this value with what's reported by EL-3
>      * or secure world.
> @@ -538,6 +583,8 @@ static bool ffa_probe(void)
>=20
>     ffa_notif_init();
>     INIT_LIST_HEAD(&ffa_teardown_head);
> +    INIT_LIST_HEAD(&ffa_ctx_head);
> +    rwlock_init(&ffa_ctx_list_rwlock);
>     init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0)=
;
>=20
>     return true;
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index dfa0b23eaf38..fa56b1587e3b 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -150,6 +150,73 @@ out:
>     return ret;
> }
>=20
> +static int32_t ffa_get_vm_partinfo(uint32_t *vm_count, void *dst_buf,
> +                                   void *end_buf, uint32_t dst_size)
> +{
> +    struct ffa_ctx *curr_ctx =3D current->domain->arch.tee;
> +    struct ffa_ctx *dest_ctx;
> +    uint32_t count =3D 0;
> +    int32_t ret =3D FFA_RET_OK;
> +
> +    /*
> +     * There could potentially be a lot of VMs in the system and we coul=
d
> +     * hold the CPU for long here.
> +     * Right now there is no solution in FF-A specification to split
> +     * the work in this case.
> +     * TODO: Check how we could delay the work or have preemption checks=
.
> +     */
> +    read_lock(&ffa_ctx_list_rwlock);
> +    list_for_each_entry(dest_ctx, &ffa_ctx_head, ctx_list)
> +    {
> +        /*
> +         * Do not include an entry for the caller VM as the spec is not
> +         * clearly mandating it and it is not supported by Linux.
> +         */
> +        if ( dest_ctx !=3D curr_ctx )
> +        {
> +            /*
> +             * We do not have UUID info for VMs so use
> +             * the 1.0 structure so that we set UUIDs to
> +             * zero using memset
> +             */
> +            struct ffa_partition_info_1_0 info;
> +
> +            if  ( dst_buf > (end_buf - dst_size) )
> +            {
> +                ret =3D FFA_RET_NO_MEMORY;
> +                goto out;
> +            }
> +
> +            /*
> +             * Context might has been removed since we go it or being re=
moved
> +             * right now so we might return information for a VM not exi=
sting
> +             * anymore. This is acceptable as we return a view of the sy=
stem
> +             * which could change at any time.
> +             */
> +            info.id =3D dest_ctx->ffa_id;
> +            info.execution_context =3D dest_ctx->num_vcpus;
> +            info.partition_properties =3D FFA_PART_VM_PROP;
> +            if ( dest_ctx->is_64bit )
> +                info.partition_properties |=3D FFA_PART_PROP_AARCH64_STA=
TE;
> +
> +            memcpy(dst_buf, &info, MIN(sizeof(info), dst_size));
> +
> +            if ( dst_size > sizeof(info) )
> +                memset(dst_buf + sizeof(info), 0,
> +                       dst_size - sizeof(info));
> +
> +            dst_buf +=3D dst_size;
> +            count++;
> +        }
> +    }
> +    *vm_count =3D count;
> +
> +out:
> +    read_unlock(&ffa_ctx_list_rwlock);
> +
> +    return ret;
> +}
> +
> void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
> {
>     int32_t ret =3D FFA_RET_OK;
> @@ -164,7 +231,7 @@ void ffa_handle_partition_info_get(struct cpu_user_re=
gs *regs)
>     };
>     uint32_t dst_size =3D 0;
>     void *dst_buf, *end_buf;
> -    uint32_t ffa_sp_count =3D 0;
> +    uint32_t ffa_vm_count =3D 0, ffa_sp_count =3D 0;
>=20
>     /*
>      * If the guest is v1.0, he does not get back the entry size so we mu=
st
> @@ -191,15 +258,18 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>         }
>=20
>         if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> +        {
>             ret =3D ffa_get_sp_count(uuid, &ffa_sp_count);
> +            if ( ret )
> +                goto out;
> +        }
>=20
> -        goto out;
> -    }
> +        /*
> +         * Do not count the caller VM as the spec is not clearly mandati=
ng it
> +         * and it is not supported by Linux.
> +         */
> +        ffa_vm_count =3D get_ffa_vm_count() - 1;
>=20
> -    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> -    {
> -        /* Just give an empty partition list to the caller */
> -        ret =3D FFA_RET_OK;
>         goto out;
>     }
>=20
> @@ -224,9 +294,19 @@ void ffa_handle_partition_info_get(struct cpu_user_r=
egs *regs)
>         goto out_rx_release;
>     }
>=20
> -    ret =3D ffa_get_sp_partinfo(uuid, &ffa_sp_count, dst_buf, end_buf,
> -                              dst_size);
> +    if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> +    {
> +        ret =3D ffa_get_sp_partinfo(uuid, &ffa_sp_count, dst_buf, end_bu=
f,
> +                                  dst_size);
> +
> +        if ( ret )
> +            goto out_rx_release;
> +
> +        dst_buf +=3D ffa_sp_count * dst_size;
> +    }
>=20
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +        ret =3D ffa_get_vm_partinfo(&ffa_vm_count, dst_buf, end_buf, dst=
_size);
>=20
> out_rx_release:
>     if ( ret )
> @@ -235,7 +315,7 @@ out:
>     if ( ret )
>         ffa_set_regs_error(regs, ret);
>     else
> -        ffa_set_regs_success(regs, ffa_sp_count, dst_size);
> +        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm_count, dst_size=
);
> }
>=20
> static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 0a9c1082db28..1a1dcabcdc28 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -195,6 +195,18 @@
>  */
> #define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
>=20
> +/*
> + * Partition properties we give for a normal world VM:
> + * - can send direct message but not receive them
> + * - can handle indirect messages
> + * - can receive notifications
> + * 32/64 bit flag is set depending on the VM
> + */
> +#define FFA_PART_VM_PROP    (FFA_PART_PROP_DIRECT_REQ_SEND | \
> +                             FFA_PART_PROP_INDIRECT_MSGS | \
> +                             FFA_PART_PROP_RECV_NOTIF | \
> +                             FFA_PART_PROP_IS_PE_ID)
> +
> /* Flags used in calls to FFA_NOTIFICATION_GET interface  */
> #define FFA_NOTIF_FLAG_BITMAP_SP        BIT(0, U)
> #define FFA_NOTIF_FLAG_BITMAP_VM        BIT(1, U)
> @@ -297,36 +309,72 @@ struct ffa_ctx_notif {
> };
>=20
> struct ffa_ctx {
> -    void *rx;
> -    const void *tx;
> -    struct page_info *rx_pg;
> -    struct page_info *tx_pg;
> +    /*
> +     * Chain list of all FF-A contexts.
> +     * As we might have several read from the list of context through pa=
rallel
> +     * partinfo_get but fewer additions/removal as those happen only dur=
ing a
> +     * version negociation or guest shutdown, access to this list is pro=
tected
> +     * through a rwlock (addition/removal with write lock, reading throu=
gh a
> +     * read lock).
> +     */
> +    struct list_head ctx_list; /* chain list of all FF-A contexts */
> +
> +    /*
> +     * Data access unlocked (mainly for part_info_get in VM to VM).
> +     * Those should be set before the ctx is added in the list.
> +     */
> +    /* FF-A Endpoint ID */
> +    uint16_t ffa_id;
> +    uint16_t num_vcpus;
> +    bool is_64bit;
> +
> +    /*
> +     * Global data accessed atomically or using ACCES_ONCE.
> +     */
> +    struct ffa_ctx_notif notif;
> +
> +    /*
> +     * Global data accessed with lock locked.
> +     */
> +    spinlock_t lock;
> +    /*
> +     * FF-A version negociated by the guest, only modifications to
> +     * this field are done with the lock held as this is expected to
> +     * be done once at init by a guest.
> +     */
> +    uint32_t guest_vers;
>     /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
>     unsigned int page_count;
> -    /* FF-A version used by the guest */
> -    uint32_t guest_vers;
> -    bool rx_is_free;
> -    /* Used shared memory objects, struct ffa_shm_mem */
> -    struct list_head shm_list;
>     /* Number of allocated shared memory object */
>     unsigned int shm_count;
> -    struct ffa_ctx_notif notif;
> +    /* Used shared memory objects, struct ffa_shm_mem */
> +    struct list_head shm_list;
> +
>     /*
> -     * tx_lock is used to serialize access to tx
> -     * rx_lock is used to serialize access to rx_is_free
> -     * lock is used for the rest in this struct
> +     * Rx buffer, accessed with rx_lock locked.
> +     * rx_is_free is used to serialize access.
>      */
> -    spinlock_t tx_lock;
>     spinlock_t rx_lock;
> -    spinlock_t lock;
> -    /* Used if domain can't be torn down immediately */
> +    bool rx_is_free;
> +    void *rx;
> +    struct page_info *rx_pg;
> +
> +    /*
> +     * Tx buffer, access with tx_lock locked.
> +     */
> +    spinlock_t tx_lock;
> +    const void *tx;
> +    struct page_info *tx_pg;
> +
> +
> +    /*
> +     * Domain teardown handling if data shared or used by other domains
> +     * do not allow to teardown the domain immediately.
> +     */
>     struct domain *teardown_d;
>     struct list_head teardown_list;
>     s_time_t teardown_expire;
> -    /*
> -     * Used for ffa_domain_teardown() to keep track of which SPs should =
be
> -     * notified that this guest is being destroyed.
> -     */
> +    /* Keep track of SPs that should be notified of VM destruction */
>     unsigned long *vm_destroy_bitmap;
> };
>=20
> @@ -336,6 +384,12 @@ extern spinlock_t ffa_rx_buffer_lock;
> extern spinlock_t ffa_tx_buffer_lock;
> extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>=20
> +extern struct list_head ffa_ctx_head;
> +extern rwlock_t ffa_ctx_list_rwlock;
> +#ifdef CONFIG_FFA_VM_TO_VM
> +extern atomic_t ffa_vm_count;
> +#endif
> +
> bool ffa_shm_domain_destroy(struct domain *d);
> void ffa_handle_mem_share(struct cpu_user_regs *regs);
> int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
> @@ -368,6 +422,29 @@ int ffa_handle_notification_set(struct cpu_user_regs=
 *regs);
> void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t =
fid);
> int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
>=20
> +#ifdef CONFIG_FFA_VM_TO_VM
> +static inline uint16_t get_ffa_vm_count(void)
> +{
> +    return atomic_read(&ffa_vm_count);
> +}
> +
> +static inline void inc_ffa_vm_count(void)
> +{
> +    atomic_inc(&ffa_vm_count);
> +}
> +
> +static inline void dec_ffa_vm_count(void)
> +{
> +    ASSERT(atomic_read(&ffa_vm_count) > 0);
> +    atomic_dec(&ffa_vm_count);
> +}
> +#else
> +/* Only count the caller VM */
> +#define get_ffa_vm_count()  ((uint16_t)1UL)
> +#define inc_ffa_vm_count()  do {} while(0)
> +#define dec_ffa_vm_count()  do {} while(0)
> +#endif
> +
> static inline uint16_t ffa_get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
> --=20
> 2.47.1
>=20
>=20


