Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C021EA903FA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 15:13:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956055.1349569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52Zy-0002Wv-0Q; Wed, 16 Apr 2025 13:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956055.1349569; Wed, 16 Apr 2025 13:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52Zx-0002UA-TO; Wed, 16 Apr 2025 13:13:25 +0000
Received: by outflank-mailman (input) for mailman id 956055;
 Wed, 16 Apr 2025 13:13:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hq9D=XC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u52Zw-0002U4-KM
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 13:13:24 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20614.outbound.protection.outlook.com
 [2a01:111:f403:260c::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92e8db5f-1ac4-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 15:13:23 +0200 (CEST)
Received: from AS9PR05CA0100.eurprd05.prod.outlook.com (2603:10a6:20b:498::17)
 by DU0PR08MB8019.eurprd08.prod.outlook.com (2603:10a6:10:3e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 13:13:18 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:498:cafe::7b) by AS9PR05CA0100.outlook.office365.com
 (2603:10a6:20b:498::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Wed,
 16 Apr 2025 13:13:18 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 16 Apr 2025 13:13:17 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PR3PR08MB5771.eurprd08.prod.outlook.com (2603:10a6:102:83::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.34; Wed, 16 Apr 2025 13:12:45 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 13:12:45 +0000
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
X-Inumbo-ID: 92e8db5f-1ac4-11f0-9eaf-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I4QoZhF2c0RIj6ebj5G/LxsuhgKUdxD5c00ojTK/St+Eh6DcEyQEot7bjke/J4zCWjw0hrMRyLfQycyU9gH5nDEw+WeFDSF/fssUSVY/+538qyXEe77on15/deNPAPA7fyQ+G9eyYap2Bbbo3EU/9APZyWidKP0avDKtIVGlgybmg3r7fMVj6jM+07wJeNeAlg0oDQ8fygrDT8TvdCkPC7jptsDH/q1/t6liZo2369HO18/gxGpc7gLjaMIhPBglIHYS3t8Q9evLFuQp7hDvno0shdXLYIn3SS74SR1v5GRfiimwzrbj/tXdxDZDaj9iX3RUs5XfQ1rrYz8WHX3D9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SPq0io0Fd7Ioym5XIdVQiUiX7DqiYIwbUOd6mrI6Yc=;
 b=OT7YZjR3nhgh8f+dC+T7lYLh6UfbV9SEWzEs1wbubuuBi9yG9Rx20fQqoLRAy1Eh7umRYdFqpnOxk2NyY69q84DMw9KmI0K/fre2xou8D8WZeoHeEN25gU+fBq/8AYY01IjV+MGW1JnHE8AO9jj/9y2bEX7dvGj937PIvo6SkK2NQtuMz/AMhOz6xCugEcE8AoCLCkCsWemBvKlnqfaoV00znztuRjF3vCFKbggJQmxFwHRpX5dnZnfcih0J4Tr6sURWZssUJN74nRgn/7gr/+I+oLLddDynwOZMqdN1m1xvx3L5AL6FQxIS0X+x8rrZCpGSIMXxKw/9xN6bPXikfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SPq0io0Fd7Ioym5XIdVQiUiX7DqiYIwbUOd6mrI6Yc=;
 b=WUG//dDkPbQe+pILiLRY+Nip9jg/xYtiuLYlDIKHfsPDH0uS4+7LtGwlOfleW7SfBDUGdjWeaRLl8GwiOplE1MnDK2b7ImXx+gvU+vp/cyB6Y9NskrRqy/HSAHjizHIK0p1uNlhcb1htoFVweuA05J/gt3sa7fBVsiZ08pDSfBc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4QBrauIgcC+zWhg22Ief+od9nmJAyuOjeJjU+xXJeZKkjR+qOfhvILNQ3Xrkfs7Au2LUQnVPARpsBwgz+W9SojI6hB+q1ZuD9oCN8OXUayF0NiphK3KlYolgtvSPPTorA6klWLroTz+edr1GiuwSkaVeqc0orCQxcD4gJ7IO96m4NejVD+7FxQyUdtcT4KNxm6qnsec6BFGwGI7vPxJLw3gOf9p/pnladaQJI/rvsZ/3Vpg4HWCnpEA6jRTDID21ZPKo12KW3/++q8WVGfZg3EIf8T61yD0z25rrXqDdoIfmZOfqfzHAcHycZGDXXhRoKnXgNY+buMFgDhY5zaqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SPq0io0Fd7Ioym5XIdVQiUiX7DqiYIwbUOd6mrI6Yc=;
 b=pRAyaUCqEFoBT88+r4d8NlWfVTvwoFJndC4w3xiCh0059oZoZEDiTDBXtunYAkSno+MCKBERUPnb20KIVCZYqiyFp4W13PxGc1iUTXqSlbbv0W9ySaqzk/ZF8DjzGGTca++a/vecNK0+O9RlsaHBInLqu3ykFP+0gUvU5OxujU09FQXlKRd22AUoA4eJjxyRV38EsnJS8Yn3eWCfZIketraPp6HcO05X6YLxYZP9L6L50J2J/rtLK8pCI+nWd1dYhSK6vXGNSTwuG1j9Rj85WSRGORtMqzObe9tBBX2yQQKwbBVoempohsX8VMwBYPwj0keYMllD+72m7wDVMtHSKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SPq0io0Fd7Ioym5XIdVQiUiX7DqiYIwbUOd6mrI6Yc=;
 b=WUG//dDkPbQe+pILiLRY+Nip9jg/xYtiuLYlDIKHfsPDH0uS4+7LtGwlOfleW7SfBDUGdjWeaRLl8GwiOplE1MnDK2b7ImXx+gvU+vp/cyB6Y9NskrRqy/HSAHjizHIK0p1uNlhcb1htoFVweuA05J/gt3sa7fBVsiZ08pDSfBc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/7] arm/mpu: Introduce utility functions for the pr_t
 type
Thread-Topic: [PATCH v3 3/7] arm/mpu: Introduce utility functions for the pr_t
 type
Thread-Index:
 AQHbqvIP34UccZOkWUuu+Y+Ap2U3MrOmJOcAgAAb/QCAAAMjAIAABC8AgAADsYCAAACNgA==
Date: Wed, 16 Apr 2025 13:12:45 +0000
Message-ID: <B7BE82AB-2264-4B97-A39B-F9565951D5F9@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-4-luca.fancellu@arm.com>
 <d2b51729-e5dd-4325-9275-615ab1cbb68d@amd.com>
 <0877268B-138F-4FC9-B95E-544699D8AD91@arm.com>
 <22a7f8b1-6614-4354-830e-30dbf6210ec8@amd.com>
 <605B837B-7EB4-4A00-A4C5-D86630D764FD@arm.com>
 <8251ff44-0b45-4f9a-9762-077763f620b1@amd.com>
In-Reply-To: <8251ff44-0b45-4f9a-9762-077763f620b1@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|PR3PR08MB5771:EE_|AMS0EPF00000198:EE_|DU0PR08MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: e55c8b7b-999c-4e5d-2f91-08dd7ce8741e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aVVhQVBMQnFINkJTb2pVVW1oMklCWCs5eVlIS2dWelpiTU10Ung1WG1kNFBp?=
 =?utf-8?B?YlMzL2swd2svbzJXQUVydzFvOEtSWktoOUx1QkVkRC9ndTRPNWYwWjR5Z21l?=
 =?utf-8?B?cUpOY010QUFCcVliM1FnV1JzMWoyQkpQVTVCeVZpMGVNWWM2aGFldzI5YmFK?=
 =?utf-8?B?ejhLMXU5RkVSeGFEeGRsTG93WlpsR0JBMlpRemp5SWRNT2VOeE9HbTNJWFFz?=
 =?utf-8?B?TEl2czhjNUN3U2FvOXBad3NMMDc2WXZTeU5UY0xkVzB6NkQwRmNZNXNjV2Q5?=
 =?utf-8?B?cDg2UVVyOGYzVmlrdUFUV09DTDRoeEZBU2F3cEFwVFBLeGgzRVRMZVYyeU9Q?=
 =?utf-8?B?cWdXQ2o1aEZyOFlVdG5hQTh3YWVmN1dFby9GMnZTL3FYV1NQMGZ0d1VkV2xY?=
 =?utf-8?B?bXBvRDRZNEVxa3JlMkYvTDQvTGFnZjVCM09LWlE3bTluTk5nbEl6QlY4RTh4?=
 =?utf-8?B?dCtFVXNCQTVST2orRmpnRktRREZkWjlJcXlXVXBreUNyZXA2N0habTVCdnlu?=
 =?utf-8?B?UnQwNEs0MDQ3WStqVFZ5Snh0TlZhT2lJc3pObThwbnNxWGFydHpydm9kUXFZ?=
 =?utf-8?B?VkZiMkEzVHJlVWlUaUNQckNSandKeldseFk5Q0VGK3h3WmdQM3VxeXQ4SVA1?=
 =?utf-8?B?R2kzVFVhVVcwRVpUVTYyU2tmT3U4dHJpUGFnb1Y2ODkrei9qUlVuTm5CeWxR?=
 =?utf-8?B?LzdXcTE2cUI0WkVqaVQyYkJ3aldIMWVhUU5CV3B3ZFFYRE96dEFWVThxNkRV?=
 =?utf-8?B?b1p5NWlUWWYzTkNiZkI2NXByS3RES3RPQUIyellCYXhFbGd4NFBkci9ncHF1?=
 =?utf-8?B?bitMYnA4blBlYkN2REUxY2krS2ZxRU1UNVMrQythdUc1djNmMlhMdGlZQnox?=
 =?utf-8?B?SXpOMVl3MTJ4c1ZKODcxSUxCdmpSMjlaS1FUTktDY09qdXE2KzJQSDZoZXo2?=
 =?utf-8?B?blgvdThnMzZwd3VDRjM4WUZBK1c2RjJoeHdMZ1pLS3VkWk80ZUhmQ2pkaHlO?=
 =?utf-8?B?VlVSTXZTWHI3bGxXMFRXWnFCaDJnT1EzOHYyb3lNL0xYNG1jeXVtanZ1QTF1?=
 =?utf-8?B?ZjBxNG9xU0E0Z3N4WW1RbUwrQTVKVmt2UXVyUHdMaVJxbnArSi9ZMG1XUSt2?=
 =?utf-8?B?VzRzcjE0bzhzV09BN01vak04UFh5eHdmNmlBSEZtU1Q0d3NNTWRFUGJtSlov?=
 =?utf-8?B?NEFVeDVIa3NJeWc4SG1xeC9qSTVKRDc1ZzRPYkltN1NPbDhPdnVDdXV4Wk50?=
 =?utf-8?B?bW9zSm5COWNiTzJmWlpNQ2h3a09hYnFzTzhTQnlIb3JxdlVZYVQ3M2RIVHJ0?=
 =?utf-8?B?VG5TWjJZRkZSeG1kcndLUEpIb3RDb2dGRTFaM1pnRzdDc21ibytWSElESVRG?=
 =?utf-8?B?S1NHUFZqNnA2ZG1mOEUrbUNoQjBWaWg1NlNINHZERHNxaG5KUXM4aDFvdnRo?=
 =?utf-8?B?emJ3bklrSklldmRSUnVYSk8wMUg3NkxIVnFsekJuaG0vU0YyR01xQXdzSFQ1?=
 =?utf-8?B?bkV3c2FueEZDeTB3ODB0bTRYdDBhYjVUcFBhU3JkOHpha2dmdTlBWllqdDlS?=
 =?utf-8?B?Ly9TbkRVaDlVRlZWdm52RkdiaU5HYkVRZGZxdy9WQTMxb0lNNEtUUy8rWGRn?=
 =?utf-8?B?QmVZVjNoWG43VUVLYmM0aEM0dFlZWTRaYVNBTlVXLzQwS0gxaUxHYlpiejVQ?=
 =?utf-8?B?aFhwcHJrVTJJWWxrZHB4Rk1PN214cDZUWTU3djA4RXVFVkdRVmYyUWt5c01B?=
 =?utf-8?B?bFp4NWdPRUZYV2JtRUc4MlMrTm1aV2lnZUxWOFBmTm5YM0IxN0hOaEFmTHVj?=
 =?utf-8?B?dWIvTyt2U0FDQ1hSdVhwa0dQY1pUUWE1dWRIbm5HQWNSYnAwb3ByNVRGWE9x?=
 =?utf-8?B?TitNeThxU2tsRlFwcUJNV2NjQ1JUOHNlQWs5L1d4dnRsSHRxeHU5YUo4WTk3?=
 =?utf-8?B?MUR5RElsay9YeUFTamhIK24wZ0xzblF0VGxxS1dIbGhaSkljOERvdUpucUpa?=
 =?utf-8?B?NE1ZcmhCMkJRPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BCB7D5CA847AE4796CCA252EC310BA2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5771
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	12c0d5d5-930b-413c-a86a-08dd7ce860bd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|376014|82310400026|14060799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0g2S2k3VE51TWVOM1Z6TXNxTnRpanNnT3pDZ3g3Vk9zOThHOHVvbGdBNjd0?=
 =?utf-8?B?Qmo5TmZGOGpCOHNZVnVWRDFZa08yMEhzVzIvZDZXSVZaa05HN3oxZGhacE45?=
 =?utf-8?B?dlo0QjJZR2tqNEdHRlBReUppOVNsd2VscFhGZlVWUDdaZjZCeVhxaDJNK09O?=
 =?utf-8?B?eEFoSWRiOTl1K2ltM2ZyZHVKbmFPR3FGaTZLS09sQWhYbnVJWm5LNTFwZVUw?=
 =?utf-8?B?ZXFQejl1cFlkYTJoY0NVazlKSVpVcjZjK3p4aFYxdXAveWRyV0tzSGUvUXNW?=
 =?utf-8?B?dnN6T1JhRzJPZnBPYktIaXdka2o5dC9hZ2FiSVpNblpvd21jWlNDS29GNGVJ?=
 =?utf-8?B?R2ZPNU1ySHZINVBtYXJsaUVlMFR4TTMyLzlFbnpEdTFKOENJdjJSc2hUWWEy?=
 =?utf-8?B?Yjh5TTBJMVpDTVYyajNhQmpOZVlzRTdtQzJTN0JRaWVmc3R2dmhtKzBVMFhD?=
 =?utf-8?B?VG42NkdoRklCbVRER2VkTElsamtndVhvWCs3R0l0UFVsVEdmOFdIa0Q5bmNS?=
 =?utf-8?B?d3daUDZ0UTZSYVFqUmhsN2xoakJZRlJiTi9ISTFZYi9UM2doK0pyYVdQTS9n?=
 =?utf-8?B?Sm04d05SL2xBNUQxZ3o5YWduOCs5OXlOaVVvaGxhU1F2V1NVN3gyQWc0aFhj?=
 =?utf-8?B?aDRLZ0xtZUZFZTczeTNpbm5UVVpneWJFTFREZFR0RHhXQW1mUFdWQWNKdEJo?=
 =?utf-8?B?NFdzeVJROFpKblc3Y0k1VjE5RzlZRFRXVkFDL1JPanpSNHptRkJ6OE9JczZw?=
 =?utf-8?B?WDZFWXowS0dwWFVGRldmRmV5cE1wMTJER1Z2MFhUK0pZcHJYa21lQkxscTlD?=
 =?utf-8?B?bndYczVLdWV5ekNOMkYwWEt0bXFZRE5sL2dUSWU2am1DUlVLZVF0V1ZvNmJB?=
 =?utf-8?B?L1VuWnJsLzkzQ3l1eWxCVG9xM0drZVkxMHBjbnVweG0vUm5tT3F0MlByd1N5?=
 =?utf-8?B?MnZMRTRKZVJ2MEppc2FBTTIrWXdlMUJsemtTVVVsS1pUc0pWcXo5c3JTS2lk?=
 =?utf-8?B?RlBjRzloWis2Tk5JVGVkMFhnUWdURjhDRjdtZGx4ejBIZ1Zab2t1S3BzZGtu?=
 =?utf-8?B?OFZuK2RZaXNxV3U5blZJVTZxcWtiYWJOQUUvRmhrZnl5dzJ0SU13cVZWS1F6?=
 =?utf-8?B?RzAzQTFjZEVaM05MdmZDYktpalVpMjFsNk94U216S1BHeXFzNmp0ZVBmNEJM?=
 =?utf-8?B?Z3owWUFpVm5MOTRwVWtZQWhVcWt1S3hrZ1ZFTUJ5cGRlNVpEUFJySWM2ZDZq?=
 =?utf-8?B?RzRBK3RhZHBUbUNtRXk0Q3NGSDM2YnNZNHAxRTV1SGQ3bUhiUWwvQ2hacjJN?=
 =?utf-8?B?WnhYNGtDQ3ZQejNVZXF6ajFvaFNOWE5jd3BZM0dqV0FHbVRyc2I0dTM1WDNt?=
 =?utf-8?B?NzBGZnl0WnVvMG9oS09iVkpCeHVtbmljTkthSnV3eG9VS2RtMXpBQ2NVQUhC?=
 =?utf-8?B?d3FxbnU3SXY1UHJaVFhlMnc4b254cFRXUEF1MSs5SWZHeHIrZTV5OWZGc0pM?=
 =?utf-8?B?eWVMaU5VYVMzbGhZZmMwMmpwTkpDMU1qNml3dlkwOVJwVVZIekF5b2pLaFUw?=
 =?utf-8?B?VHFTV1lKcno1NlN3YXkzcTQvbUZEc3JrUytWZkFCYkhBbzlNTmJKZS9tZ00w?=
 =?utf-8?B?T1NMNVVtRWJZK1ZXK3BRMGtWbVlQVHYyVUNLUWNRUjdZaVpiUS9JNGRTbXcx?=
 =?utf-8?B?QjdSQmZpM1JiaGN1UHo4ZDZrUlUrRGhJS2RXTWRkQ3VOSVIvWll0cUJPMEFu?=
 =?utf-8?B?NDBVZkVMdDFhWm84RmpHdk1DRTF3TGJ1dmE4aGlmV1FtSnJweXEveFpaSCty?=
 =?utf-8?B?eFF3dUYvV2Jyd2ZwYWh1dks0b2FvRTRLcERwU3c5Q0dmejRTcW91UUJSOHhq?=
 =?utf-8?B?eW5jY3Y0eWZ1c2F0YU1QRDF5SGsyTEp4RitpdVhSUFNCRzZISUtwZldaRzZm?=
 =?utf-8?B?bVhUWlZPNDRoazhHMFhsZERRbmJNTTl3Qk9WTFAvMnpjcTZUU1B4TE9uSHBu?=
 =?utf-8?B?dHU0MlNTYWR4Zkg4RnczaTYvYXZibzJQdUwyRXNnaEZueHo2VXFsU0dhQTJL?=
 =?utf-8?Q?1wvxFN?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(376014)(82310400026)(14060799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 13:13:17.7933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e55c8b7b-999c-4e5d-2f91-08dd7ce8741e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8019

DQoNCj4gT24gMTYgQXByIDIwMjUsIGF0IDE0OjEwLCBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6
ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDE2LzA0LzIwMjUgMTQ6NTcsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBIaSBNaWNoYWwsDQo+PiANCj4+Pj4gDQo+Pj4+PiANCj4+
Pj4+PiArfQ0KPj4+Pj4+ICsNCj4+Pj4+PiArLyogU2V0IGxpbWl0IGFkZHJlc3Mgb2YgTVBVIHBy
b3RlY3Rpb24gcmVnaW9uKHByX3QpLiAqLw0KPj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgcHJf
c2V0X2xpbWl0KHByX3QgKnByLCBwYWRkcl90IGxpbWl0KQ0KPj4+Pj4+ICt7DQo+Pj4+Pj4gKyAg
ICBwci0+cHJsYXIucmVnLmxpbWl0ID0gKChsaW1pdCAtIDEpID4+IE1QVV9SRUdJT05fU0hJRlQp
Ow0KPj4+Pj4gV2h5IC0xPyBBRkFJUiB0aGVzZSByZWdpc3RlcnMgdGFrZSBpbmNsdXNpdmUgYWRk
cmVzc2VzLCBzbyBpcyBpdCBiZWNhdXNlIHlvdQ0KPj4+Pj4gd2FudCBjYWxsZXIgdG8gcGFzcyBs
aW1pdCBhcyBleGNsdXNpdmUgYW5kIHlvdSBjb252ZXJ0IGl0IHRvIGluY2x1c2l2ZT8gSSB0aGlu
aw0KPj4+Pj4gaXQncyBxdWl0ZSBlcnJvciBwcm9uZS4NCj4+Pj4gDQo+Pj4+IFllcyBpdOKAmXMg
bWVhbnQgdG8gYmUgdXNlZCB3aXRoIGV4Y2x1c2l2ZSByYW5nZSwgc2hhbGwgd2UgZG9jdW1lbnQg
aXQgb3IgdXNlDQo+Pj4+IEluY2x1c2l2ZSByYW5nZSBpbnN0ZWFkPw0KPj4+IFdoYXQncyB0aGUg
ZXhwZWN0ZWQgYmVoYXZpb3Igb2YgY2FsbGVycz8gQXJlIHdlIGdvaW5nIHRvIHNldCB1cCBwcm90
ZWN0aW9uDQo+Pj4gcmVnaW9uIGJhc2VkIG9uIHJlZ3VsYXIgc3RhcnQrc2l6ZSBwYWlyIChsaWtl
IHdpdGggTU1VKSBvciBzdGFydCtlbmQ/IElmIHRoZQ0KPj4+IGxhdHRlciBmb3Igc29tZSByZWFz
b24gKHdpdGggc2l6ZSB0aGVyZSBhcmUgbGVzcyBpc3N1ZXMpLCB0aGVuIGVuZCB1c3VhbGx5IGlz
DQo+Pj4gaW5jbHVzaXZlIGFuZCB5b3Ugd291bGQgbm90IG5lZWQgY29udmVyc2lvbi4NCj4+IA0K
Pj4gSSB0aGluayB3ZSBoYXZlIGEgbWl4IGJlY2F1c2UgZm9yIGV4YW1wbGUgZGVzdHJveV94ZW5f
bWFwcGluZ3MgYW5kIG1vZGlmeV94ZW5fbWFwcGluZ3MNCj4+IGFyZSBzdGFydCBhbmQgZW5kLCBt
YXBfcGFnZXNfdG9feGVuIGluc3RlYWQgaXMga2luZCBvZiBzdGFydCtzaXplPw0KPj4gDQo+PiBJ
IG1vdmVkIHRoZSAtMSBpbnNpZGUgcHJfc2V0X2xpbWl0IGJlY2F1c2UgaXQgd2FzIG9wZW4tY29k
ZWQgaW4gYWxsIHRoZSBwbGFjZXMsIGZvciBleGFtcGxlIHdoZW4NCj4+IHJlZmVyZW5jaW5nIGxp
bmtlciBzeW1ib2xzIG9yIG91dHB1dCBvZiBtZm5fdG9fbWFkZHIobWZuX2FkZChzbWZuLCBucl9t
Zm4pKSwgZm9yIHRoaXMgcmVhc29uIEkNCj4+IHRob3VnaHQ6IGxldOKAmXMgY2FsbCB0aGlzIG9u
ZSB3aXRoIGV4Y2x1c2l2ZSByYW5nZXMgYW5kIG1vZGlmeSBpbnRlcm5hbGx5IGZvciBpbmNsdXNp
dmUuDQo+IEhtbSwgeWVzLiBJbmRlZWQgd2UgaGF2ZSBhIG1peCBvZiBwbGFjZXMgd2hlcmUgZW5k
IGlzIGluY2x1c2l2ZSBvciBleGNsdXNpdmUuIEkNCj4gdGhpbmsgd2UgY2FuIHN0aWNrIHdpdGgg
ZXhjbHVzaXZlIGFkZHJlc3MgYmVpbmcgcGFzc2VkIHRvIHRoaXMgaGVscGVyIHVubGVzcw0KPiBv
dGhlcnMgaGF2ZSBhIGRpZmZlcmVudCBvcGluaW9uLiBJIGtub3cgd2UgdHJpZWQgdG8gY29udmVy
dCBzb21lIHBsYWNlcyB0bw0KPiBzdGFydCtzaXplIGJ1dCBJIGRvbid0IHJlbWVtYmVyIHRoZSBm
dXR1cmUgcGxhbnMuDQoNCk9rLCBJJ2xsIGRvY3VtZW50IG9uIHRvcCBvZiB0aGUgaGVscGVyIHRo
YXQgQGxpbWl0IG5lZWRzIHRvIGJlIGV4Y2x1c2l2ZSBqdXN0IHRvIGJlIHN1cmUgaXQgd2lsbCBi
ZSB1c2VkDQppbiB0aGlzIHdheS4NCg0KDQoNCg==

