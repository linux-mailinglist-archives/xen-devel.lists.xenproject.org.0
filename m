Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELhCLL1Si2kMUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:46:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E778111CB2B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:46:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226534.1533042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppvv-0002Y7-OK; Tue, 10 Feb 2026 15:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226534.1533042; Tue, 10 Feb 2026 15:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppvv-0002Wa-Ky; Tue, 10 Feb 2026 15:45:47 +0000
Received: by outflank-mailman (input) for mailman id 1226534;
 Tue, 10 Feb 2026 15:45:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1KCy=AO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vppvu-0002WU-Cb
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 15:45:46 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f61f081-0697-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 16:45:44 +0100 (CET)
Received: from AS4PR10CA0021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::9)
 by DU0PR08MB7921.eurprd08.prod.outlook.com (2603:10a6:10:3c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 15:45:37 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::42) by AS4PR10CA0021.outlook.office365.com
 (2603:10a6:20b:5d8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 15:45:37 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Tue, 10 Feb 2026 15:45:37 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by VI1PR08MB10148.eurprd08.prod.outlook.com (2603:10a6:800:1bc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 15:44:33 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 15:44:33 +0000
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
X-Inumbo-ID: 8f61f081-0697-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NNPI3rVkbYTLdDkdQ2AFX20M8gmbFgwJB2HXWkci/UFPAX98asT4iX+NwnfqPM6Jl5K5sShmjJ6QhOZeojgtHuE9j862L12t6L2HIV7B/RSnvXRoIV1dLGz6Xak2KhqM30aFIBgBOInxTIzHjEy0wngrkg1mpXU95A92PYbBALOil0OfVG6/33u967KqmKNbDOYSF+iDRU8yLmYjf6q1fLLgus79Hrl4m3v/1sCVKm0MLiVD41NBMbK21LwFnxygALG9XwCkPw7M4EZ01bAqDdVa55dAl0VgqIeynBHXPrCgE33PQiwUdF1ppCdVPzo1Td28hKR52u4Oro/JhtDYNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vF6m0x9VN7V7vBQiJYweyuyAMDhdyN/JKcy16z90xZc=;
 b=UYA6418pvdnYtf9rvo8yWM8L3/hn4ifi/0aVpdza4uNe7lVahShKbqQP9KU2f3NuGBD1SXBz8JUGlTE33+aNQK1jPAnARzsDeUMeuxVNdL2AZbLEmKFqqglzJeBpX4oGyH5EOL9adfx7wjWJNQEZcKjWcf8XRKGMlthRFDEwggKvuqQ4vLDX2fHWxpmSml0l0H+62jVNbXF57SfhHFUqksgWjyU073wXKCQX9c6mf6AgL+suMboQo33e+9ELxtZzz3aIoERXD9O2Ls7EgtzCeZhyGPZzvGAFErx9fcDhNorVOCZWNi6aWxc+3U59Bx9V3japjrWorgWwrSC5hcdFGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vF6m0x9VN7V7vBQiJYweyuyAMDhdyN/JKcy16z90xZc=;
 b=RorBOIGaE3845moJkc55YJDdYISztfU68clutimSM3f/8BDmY4pTeWfL4HxwGUJv4vfnjusxJSM7u2VBTVSuBKl3kJZIeETx5GXnWMI6KRY8+4sWabGIFhIcnkqZvOSpJnJne9hRTmvm9PFKj9rKYn0Ya86gtwdsZiKOw63nPwU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0xHF6XjXMjy1CavU5KnYNoxKq6IOQXhiJd04rTxYYOjh5hQT0B/cC0KyKWXVQSoUgKMqZgWQBv6QtHL6pRQAnsVq2Ydrj+QoaQ8+7RJYBCQ9nEptLJd8vxIN5AgXzx9cQQAkweGBaZZz+uyrAqBN/mSglP5fD+sJD5tmVr49lkC0ArBkGMov6fac1wDqZ9kUm94FA8KGQiyJ5xFDTrS+1P23uN0m9YoCcYQdmpwW63sqAyxX6rSdRIHisw7RfGZBAzfJjB6P6Xo9hmb5Qg1N08iJpi/4b3WNlWvnQRsAp+6H5jJJ0XqbnevgJchKiTGqVlPgRrjcOfaDlihGiLywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vF6m0x9VN7V7vBQiJYweyuyAMDhdyN/JKcy16z90xZc=;
 b=A4+6UmlxWd6OUZaBzaMyxQVr41Y2N0e2AhkVU4W6T+y/8a0HaHubmHzqKLo+ryJu8dNOW9cyHBpINh7abTtgInp3lKS4On0+O8hzxxxfPT3ga9ca+P0RcGsMUveF29oMKPfy7YnJPC+M+zEC0gmvph+ENF2zX7zrg9/THcK13RyEukLSJCe3EOY7xOEt1onOAaHTLc+JB86rB35FelHN41UuYTzDr1Dxkpsz+bixPLTKi5zbQ31kV+pZrB9TzecwHvllYID30U5+CPzWbc5aAQzjNnbnuNICNMZPlJx+DQkZZhyLMd36vi2uOpzIIhN+JxTAodmmMNjbp2K31lj5eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vF6m0x9VN7V7vBQiJYweyuyAMDhdyN/JKcy16z90xZc=;
 b=RorBOIGaE3845moJkc55YJDdYISztfU68clutimSM3f/8BDmY4pTeWfL4HxwGUJv4vfnjusxJSM7u2VBTVSuBKl3kJZIeETx5GXnWMI6KRY8+4sWabGIFhIcnkqZvOSpJnJne9hRTmvm9PFKj9rKYn0Ya86gtwdsZiKOw63nPwU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH] xen: always consider '/' as a division in assembly
Thread-Topic: [PATCH] xen: always consider '/' as a division in assembly
Thread-Index: AQHcmp+J15vvFrxtUEGxE7lRiZXN1rV8EwEA
Date: Tue, 10 Feb 2026 15:44:33 +0000
Message-ID: <FE2A96EE-5D99-4CD4-82AE-7538B94DBB0F@arm.com>
References: <20260210151110.26770-1-roger.pau@citrix.com>
In-Reply-To: <20260210151110.26770-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|VI1PR08MB10148:EE_|AMS0EPF000001B2:EE_|DU0PR08MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e5b54cb-d345-4d92-3bda-08de68bb6fca
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YzNiL1VsWjdjTWkwdlFoODMzWTBGTFNsb3JhN2VnVXhScE9OU2hrU1BBdzYz?=
 =?utf-8?B?Qzl0VDNiK25nQ1IrTUF2WU03VitvNStmSC8zVjllV1JWT1NweG9pOEZCVUlu?=
 =?utf-8?B?NXYwN2NzN0xTK0l4VmxxZGJzd3RLdGt3aE4wU3Q0SVhYVmQ4T2dzLzVWejIy?=
 =?utf-8?B?MkVqZDRNYm1OWVZ6TUtQMW5KYWN4OWtZZUVuejViTmwrRHZTU1hsQlplSDdy?=
 =?utf-8?B?VkIzd0dGOGpDOSt3em44bkdpMzVCTHV0MW9pTkRNVHNtK3AveEtmdGVpQkM1?=
 =?utf-8?B?TWo4ZE9GOFc0UG9aOHBKNmltK0hjRXVlQzE4VWZuSXo2Y3ZOWGkxd0dJNDFV?=
 =?utf-8?B?MjVhdjN5MVIwUEFKUEF3aUJmbjAzbDVDNE9MaUptWE91eHphSGhsRkZRa2tM?=
 =?utf-8?B?TUQwS05kNlZFdGtsK2N1ZGJ3ajdvSGVISDhOVm83RFZsclc4ZHI5RjJ6OThM?=
 =?utf-8?B?bzMyMVZUR2FrcTBIWk03ZkpMQlB0OVhmL25QU2E5cW1kdEFON09KUkJibTR2?=
 =?utf-8?B?QTVpaHZvdkhxQTYxUjV5MTNBME5JdHpNRUtYelowVTl3SDNGRFZILy9mNW1y?=
 =?utf-8?B?d0l5RWJWQmkzMFdOdm9RSHF5cU5uY0NsUDhjQ3RzOURtZ2Ixam1NdTVQV0Rv?=
 =?utf-8?B?M0xHMUg0MmdLb3h4WEV5a0hrTVJvU09uNTgxRFp0KzQrL3VvaXIzOHgrSEdq?=
 =?utf-8?B?SHJqUnJiamo1SkNaWFFQY0dISTVwWnU0a012bG45bFhTbUFCSWVIWEJwbUVV?=
 =?utf-8?B?LzBUcjAzK0ZEeEZ5YStRQW1lRnQ4N1dwWCtSRWJBbmtlMDZRV1RnZTh4Yks0?=
 =?utf-8?B?cmM0SzVXVkhpK210VnRRZWdoSHp2eitHZC9KUjd5Zmhmb2oxTkhmRUQ2aGlH?=
 =?utf-8?B?aVJjTXdyZjZSMGl5NFZPNE9BMWlKcmdtTkdBZmpkU2xhRFMwYUJDMGhYcU5S?=
 =?utf-8?B?algwZm9OSEJjRHNmV3JKWjNUUHJjS3lMQ3FMdFdrbFNDRFphcWxnUFd2NUd6?=
 =?utf-8?B?MXViV1pQb3VCMW9NbXN3TzR3bnIxTDIyUXlhWWkyc2Vzb1hXUnhzVEduZFpN?=
 =?utf-8?B?S2hRWE4rUDE3Z2oyNWVkQ3JKeGxnTzdCWmFXa0FidFdFZlhLNlM5ZGJqRFl2?=
 =?utf-8?B?bnZISU1tNXM2TllzdHFVamJrQ2doMjJEbnB6Qnk4alBRV09nWXoyOERkY2Fz?=
 =?utf-8?B?VUEzWlVqVUt3bUczc0xTcHYwVVQxVVg2QnQ0MGx4b21iUmJDWXFtTkJVbVpO?=
 =?utf-8?B?L3ZaSUd2R3RXU1hBcEZhT2ZGblJ1bGthWUlNTHhTYVRMR1ZyS2YxcHYvMEdp?=
 =?utf-8?B?dkR3NmNTcU11ZTNaV3I5SXd6NU1IbVE2bWlacVBveVZWVkdDbTNUdHN5VFc0?=
 =?utf-8?B?WGNkSkZYNWJhUTkxS2tzMFJJUHRTQkJmVlJYVkdSMU9BSXhxeHZYdUdCQThL?=
 =?utf-8?B?M2thai9RUU1ES1JXQmd0eHowa2loVVZIeGpRRGVwNHlOVjZNVzdkY1NoMmFC?=
 =?utf-8?B?clJ3YnNkZGdjdm4rSzB3QitJUWh5NUtoekMrQUlMS1YrQlBSSURGd0IrOWIx?=
 =?utf-8?B?MnpxaUw2UkREbWpVQVd3WHBUaURSOUl6bHEzSFVsUlZPNzlQUEdmY2JJVDJB?=
 =?utf-8?B?SWZvWnNUcVI4ckt2a3czZ1hSMTRVNkwzbXl2NmM0MmIwNnFnQ0dGRGZGY28y?=
 =?utf-8?B?V20yRDQzWk5lbmk3MXNtUnBaYzFHc1Myam45dVZCODFzRVBYdFlYcWt2dVEx?=
 =?utf-8?B?RnhTZ01wTGhWMUU1WHVSSnIyNTloZ2g3emdOakNkTHpYV255bWNTemtlNm9i?=
 =?utf-8?B?YzFOVlZ6aDB2S2Q1VnhKell4ejJmeUh3UVpvdEJKY3JLbUcrdDkvSkpQS2pt?=
 =?utf-8?B?bFNFUG55SU56cldZWXJHT1RjRWk2NjlFRWYwSnBqdFdSWXJlWXhocjhQQWRU?=
 =?utf-8?B?QTFIT0Rvcmc0Si9PaFBzQU5ZQjR6L1dWcTJocFdmYVhGTnBWUGt3TUVVVU4w?=
 =?utf-8?B?WGlxMlpzMktndzRqK0JLWVBMdlUyZnliYUxHV1pTb0VObmI5SE9VN3RIYk9x?=
 =?utf-8?B?OGIzQmJCZFBFUW5oYlZOVHF2Y2o2cEhGRE13bTJucFd6WEhRYTRiLzhEY09S?=
 =?utf-8?B?UzcvL3NLQTVZSFVwaDZDSjk0WDhBVUthUjBIbGo5L1JYbjcwWHJHbWFPWm1q?=
 =?utf-8?Q?bZw/9NACQuplXz0Lv/t256s=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <84F6B3D0CBA2384391E43112FF3A54B7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10148
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	34c1d1c5-58dd-4255-0ade-08de68bb49a0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700013|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ankxeWMzRTJGY2w2bXA4UDRUQ2VxNEJ0cEt6VzRjNjI5cUxTaWRTWDVLUE5X?=
 =?utf-8?B?d0lJV2FjNEF1YnRESW1YcHdCTnVoam5WVTBuM3FHQ2hlTmw4bTREZndySnZz?=
 =?utf-8?B?cDVMNHpFQ1NaaU05QklBSmcvY1NpaUdHYzJRc0NJdlJKVlUrcEw2NitVUmx1?=
 =?utf-8?B?enlCeXBZdzc2K01tM2JvMWp2QzNOTURuVjFNR0g3RUV2Z1U3OCszTDlxdjRE?=
 =?utf-8?B?QnhrZE1lUmdmVHFlRzM1K09xS1lyY3VTSG0zZXlWRzlHV2xjMXhoNTJPNG5V?=
 =?utf-8?B?dDVpSFFEL1l5VnNLa3hVODFSOTZSTWIvNE5pMndnWFlnSzY4ZTAzMkJ5RFJK?=
 =?utf-8?B?dGhYb0tWc2lad2ltZ1lZZ1lHWnRUcDVkZDM4YVRtVFMzYlhpTHIvek5uVVdO?=
 =?utf-8?B?eVhjYm5SV0VSekZ5cm1MYnZSUkZZNTYxK281Q1VkV1B1eU0rSFZlUFhHSThF?=
 =?utf-8?B?UHlHbmdoR2Jib251R0tsT01yY1g3TnYwM1RnV2NNbmVtQ2JHTGJFVnp1cEdo?=
 =?utf-8?B?eTFvMGtWandOMmptdDVidkVjbGRuaUpQTldrWWdhajJ5UGdNRzh6RUVWcVph?=
 =?utf-8?B?YlFxK0YyQzRjUm1VT2p6NE44YXZFVGcybmtnZWlQdlgxQjc0Mml5L0puQ2ZT?=
 =?utf-8?B?TlB6TFZ6NDQ1dUJweThWM0R5TzBsN2JDT21qVi92WmV1WHZSSFNJeWNCVStO?=
 =?utf-8?B?OTdVY2Q2NVRHM01vUWxtdlZ5KzFha3cwNnZzemVKMXVra2ZZZHBRZUJsSGFX?=
 =?utf-8?B?SUNJV294QllBc3pDUXAzb1BaNEg2QlVkQjVvNnpLOEVNWmw4K0R2bk83RWF2?=
 =?utf-8?B?Y0Vuclc3ZGR3bUJrL0NvQmM5Wnl6dkZnN0VOVmkrTEhwRWVmTUtoZm1Dc2o4?=
 =?utf-8?B?d0JzK1FwdmNySjk1N0VqSXU1Y2IvWmc1ZTc5RUNFV0c5T1pEbU5od3ZCU25J?=
 =?utf-8?B?RG0xVEh6Q25lVURmL1NHL3dyOWliRit5bm1xZ1RRZ2RNQllRNUdJeGllM0FE?=
 =?utf-8?B?ZHN2MDFVbkFvSXNMRS9sMkk0SndFMnIrZlVzR1daeDhqM3VncWNVeUVGY0hh?=
 =?utf-8?B?c1Q3b2hUWEtERjZSVGhJRzBwVHgyUm1KSjhLdTlvcVJLeGFPQXVBVlVxSXhW?=
 =?utf-8?B?TU10Z3BxY1VRTkJ2VG5tQy9hb2RQNmlwZU1WUzN4a2VuY1p0THdKZGJweEIr?=
 =?utf-8?B?c2Z2ekxJLzR0VkZKWFJWeWlpY2ZDdnhNUmR2Z3RrM2JaMTA5THE3amhFeVhO?=
 =?utf-8?B?N1diVzV6eUM5aEUvZUFON3hVL0VDNUpJSVRDZEdBQmtVQzBXSzRhZjZralVw?=
 =?utf-8?B?ZGRsSVZnbUVkVyswbmszZmpFYVdDSUtyL0U5MXJHRFo3Z3NSUXlTbGRGZGgx?=
 =?utf-8?B?WjBmSzhEYWE3ZU1LR3ZIQVg0RFZYRGtLbko3MExhMUJvVFhhRS8wdFZRdjhZ?=
 =?utf-8?B?NERVTWxKbnpRUnptK1lZL2FCQ29WWE9pVUJsdnZqQ3ZNZWppdDlZd3hzWTU3?=
 =?utf-8?B?dkZnQi9QSEUzUERTQVZEVXZJUnJxcTJ4bDJjNXNiVEl6S2xaTGZoRUZ2cFhR?=
 =?utf-8?B?cWd4WlJlNkZuSW5sLzZPTDFBNTVjamd0K1RZT2RyWFFBeW03QjNuQ2s1MmhY?=
 =?utf-8?B?YXR1SWRLNXhVSHBsNHhEa2xLU0NscE5PYjJaL0ptNlExckJnTTgrS1BXYWQy?=
 =?utf-8?B?Z3l3aVNsQzBZMGRjV0ZpUVVrQzZSV2ZTV04zRFNrR3RkNWErdVBFajZ3VFdG?=
 =?utf-8?B?ZW5sTzRhUWRhb3ExYVRyWGdDUlZVOTdZRVZIZHpmekRKbTZaYXNBMnNIVHhm?=
 =?utf-8?B?Q0RCVFhZRXJxN3Uzc3ZOTVp4ZEU5QW5tcEtONUNBV3AvMVd5a3ZMaGROdUtU?=
 =?utf-8?B?K2ZWSjRJK0QwZTZWWnByN2dKSDl1d0ZXcjRNMytHbGNVbUFmWk5sbEJ6SVpt?=
 =?utf-8?B?ZkVrcmZtYWh3Y2F5TzZYdUhhOE9objl6Tk5WTytaemFGc1Zvb3BjT0MzRzVo?=
 =?utf-8?B?ZnhPVzJyQWlvZHBYZGpUNVpmNEgxRXBKbjVzZ24zZFpEbEE5U2JmS2Z2NlJu?=
 =?utf-8?B?TU1jbGhzZEUvdjhlUjFHZWNKSTRQK3V0Rlp2dE50NG9MTGNNcUN0Y2lGWXBV?=
 =?utf-8?B?bGxtNXZkZ3lzSGhrVjRyaXlSTUFRZThrVnVYUXN0MVV2NW9uK2o3aW9yUXFw?=
 =?utf-8?B?V2hjUDg0RVljZm93RUxzWHJuajBMNCtBUWhVaEcrR0xnZlFlYm9zZE8vTDl3?=
 =?utf-8?B?aFZvQjhyYkNOK3I4TFBXL0hYU0Z3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700013)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CqFPMChgGBRRgcLDVF68tN7i9v+NtWYXzsG68KDG4IaANch4HsxJ7ysjxFmHEatwZCZsmKJvQz5l2J/tK1Vhg9u6Ywa695deSbi4FbpftTZ3wLjc2hgymbTmkZriR5rcnG3DfgzckRDAOrPBYSLeV43C3bu/l52gAOBSuwEalndRe8HjFZtBw8KyEVcqVxlwTE3ijkVwMR3Fds+s/5eI3bkYY/xQbHBPmN1n7V3FWhxi6GlYR2tjoNkgdNvArcUge4bOMlqlU9kWfrRfL8oXgJ8nSBnIqss3PR8VnXo5pAII615rWddfPhUWB54/G6/J964Wq8D7Uo2fA5WYVYG9jyToGhhkuO1T8igA2ATQjNZDbVglX9baWmihGe+VtBoyY1+FuTwQ1WO6DygI9Pwh95J432mjJnF6gFIKrbyDi204ogBJxxgkphl/AtS8EUIF
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:45:37.5995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5b54cb-d345-4d92-3bda-08de68bb6fca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7921
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E778111CB2B
X-Rspamd-Action: no action

SGkgUm9nZXIsDQoNCj4gT24gMTAgRmViIDIwMjYsIGF0IDE2OjExLCBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IEdOVSBhc3NlbWJsZXIgd2lsbCBj
b25zaWRlciAnLycgYXMgdGhlIHN0YXJ0IG9mIGNvbW1lbnQgbWFya2VyIG9uIHNvbWUNCj4gcGxh
dGZvcm1zLiAgVGhpcyBpcyBpbmNvcnJlY3Qgd2l0aCBYZW4ncyB1c2FnZSwgd2hpY2ggZG9lcyB1
c2UgJy8nIGluDQo+IGFzc2VtYmx5IGZpbGVzIGFzIGEgbWF0aGVtYXRpY2FsIG9wZXJhdG9yLg0K
PiANCj4gVGhlIGJlaGF2aW9yIG9mIHRoZSBhc3NlbWJsZXIgY2FuIGJlIGFsdGVyZWQgYnkgcGFz
c2luZyB0aGUgLS1kaXZpZGUNCj4gb3B0aW9uOyB1bmNvbmRpdGlvbmFsbHkgcGFzcyB0aGlzIG9w
dGlvbiB3aGVuIGF2YWlsYWJsZSB0byBmb3JjZSB0aGUNCj4gZXhwZWN0ZWQgYmVoYXZpb3IuDQoN
ClRoaXMgaXMgc29sdmluZyB0aGUgaXNzdWUgYW5kIEkgY2FuIGJ1aWxkIGZvciBhcm0gd2l0aCB3
aGF0IGFuZCBmdXJ0aGVyDQpmb3IgeDg2IG9uIG1hYyBvcyBidXQgaXQgZmFpbHMgb24gY2hlY2st
ZW5kYnIuc2g6DQoNCi9iaW4vc2ggLi4vdG9vbHMvY2hlY2stZW5kYnIuc2ggeGVuLXN5bXMNCnN0
YXQ6IGlsbGVnYWwgb3B0aW9uIC0tIGMNCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBSZXBv
cnRlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+IHhlbi9N
YWtlZmlsZSB8IDUgKysrKysNCj4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL3hlbi9NYWtlZmlsZSBiL3hlbi9NYWtlZmlsZQ0KPiBpbmRleCAzMTM1
MmQ0Y2QyNjAuLmVlZTAyNjI5MzNhNyAxMDA2NDQNCj4gLS0tIGEveGVuL01ha2VmaWxlDQo+ICsr
KyBiL3hlbi9NYWtlZmlsZQ0KPiBAQCAtNDA1LDYgKzQwNSwxMSBAQCAkKGNhbGwgY2Mtb3B0aW9u
LWFkZCxDRkxBR1MsQ0MsLVdpbml0LXNlbGYpDQo+IENGTEFHUyArPSAtcGlwZSAtRF9fWEVOX18g
LWluY2x1ZGUgJChzcmN0cmVlKS9pbmNsdWRlL3hlbi9jb25maWcuaA0KPiBDRkxBR1MtJChDT05G
SUdfREVCVUdfSU5GTykgKz0gLWcNCj4gDQo+ICsjIFRoZSBHTlUgYXNzZW1ibGVyIHdpbGwgaW50
ZXJwcmV0ICcvJyBhcyBhIGNvbW1lbnQgc3RhcnQgbWFya2VyIGluc3RlYWQgb2YgYQ0KPiArIyBk
aXZpZGUgb24gc29tZSBwbGF0Zm9ybXMuICBQYXNzIC0tZGl2aWRlIHdoZW4gd2hlbiBhdmFpbGFi
bGUgdG8gc2lnbmFsICcvJyBpcw0KPiArIyBhbHdheXMgdXNlZCBhcyBhbiBvcGVyYXRvciBpbiBh
c3NlbWJseS4NCj4gKyQoY2FsbCBjYy1vcHRpb24tYWRkLENGTEFHUyxDQywtV2EkJChjb21tYSkt
LWRpdmlkZSkNCj4gKw0KPiBpZm5lcSAoJChDT05GSUdfQ0NfSVNfQ0xBTkcpLHkpDQo+ICMgQ2xh
bmcgZG9lc24ndCB1bmRlcnN0YW5kIHRoaXMgY29tbWFuZCBsaW5lIGFyZ3VtZW50LCBhbmQgZG9l
c24ndCBhcHBlYXIgdG8NCj4gIyBoYXZlIGEgc3VpdGFibGUgYWx0ZXJuYXRpdmUuICBUaGUgcmVz
dWx0aW5nIGNvbXBpbGVkIGJpbmFyeSBkb2VzIGZ1bmN0aW9uLA0KPiAtLSANCj4gMi41MS4wDQo+
IA0KDQo=

