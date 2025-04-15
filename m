Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C0EA89B87
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 13:11:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953620.1348091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4eBm-0004Rr-Gp; Tue, 15 Apr 2025 11:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953620.1348091; Tue, 15 Apr 2025 11:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4eBm-0004Nx-DZ; Tue, 15 Apr 2025 11:10:50 +0000
Received: by outflank-mailman (input) for mailman id 953620;
 Tue, 15 Apr 2025 11:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JN3i=XB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u4eBk-0004Nl-IL
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 11:10:48 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47832fb0-19ea-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 13:10:46 +0200 (CEST)
Received: from AM9P195CA0022.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::27)
 by DBBPR08MB10699.eurprd08.prod.outlook.com (2603:10a6:10:52f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 11:10:41 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:21f:cafe::19) by AM9P195CA0022.outlook.office365.com
 (2603:10a6:20b:21f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Tue,
 15 Apr 2025 11:10:40 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 15 Apr 2025 11:10:39 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PAWPR08MB11204.eurprd08.prod.outlook.com (2603:10a6:102:469::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 11:10:06 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 11:10:05 +0000
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
X-Inumbo-ID: 47832fb0-19ea-11f0-9eae-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=m9fDLxK0yfEP20VB999hajEZE5djtHlnk/7fWMyP5+qGiKWMlcLKG+2LvWL5MvQH4BsXueiChENOjFh0Dhvf0vbM4fonQDZVF6oaRM3yFakAi2r6uWkT8j9RMRpPHSoMp3oTf+LD8tBORM2Hlw6V2vYJWpriYikF16LdMUeHLiBwqjon1ASeTt3CWujjpumW8mENpMpyJCS+/EQt42M8yQa96urt97lewJ4CcKL0PHrTDwCz+gQ5IvSrLPcdMlmuHClOj9XZ8aFJDEG6iRoeHlKFFoQmb28b51eC+EPSK4UKmEwslPLHfSiwk0SGyrufOxIHo4YKMiqhXWXmbd+gjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcCK8iqlyIcEIn3IY3AHEPQLB09ABwqhkUzFqcAHqrY=;
 b=aeaCLSXoGirpSLbcQVUtJkyenC6MWa2vB7G+qagXwFU0h0Lh9QCk7DzloG198BF3ncDbJNeeHh+4RMIopoeggo60GqArk3FKF0lFPZJGfTRt18AsLRFzBjv/ygGTlJP/T/I1O9+lC1jBe71TvVWSGMJOJzOMu6K+ZGrnltzE9pD+MLuLmTcjiHYAn0qFNdU9CpemA00ThEYDHNeeEetpMme/6BN+kJx8fp0UKLSseqrpIioZwi0M3ZzL2pMeJ5SvwF3qyG3AJyGDMEmVdfkv4iZma2m2z/uAk7jkZiRcts4wbhbBYxM0tdgGt05iTCslm/QWlRK3ZKzjHDnTaPcFcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcCK8iqlyIcEIn3IY3AHEPQLB09ABwqhkUzFqcAHqrY=;
 b=mu86oYCX15dNRAnxidmfiC15hAgO/oqte0imsrrmQTn5w+N78vcBcuND02PCrEt6lMum6B+QX41zt385QIiC2L2YM93XhI7EipP3EzKj4SJSCb2X+g2IRE5/Uuf2NW0k13f16LMqZbmqEBa38eQokY1PNEI3nmf4DDkTbjUzVtg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yY1pTQGs/QJaocIrA5ld0OYk/cNix1GOxdImqnYZpkgpOf421DjipZ4V8jehTqnfZwtnd5SwiyRU8o5+6UsG3JSxL/OO6v5xSQLkctRclknZKqS3PyhBKH6yKBpMYuwIrPvI/wDn/bxIgqmM8hlppcE/vhk+gvuUX0u8sw7pTLdc0p/ByTsrXFYWht4eFIyCiTNuOz+Y8E0mUuVchTanlhRf2qk8tGl9Srv+JFgB8Tl/Ryvh7wuB5gX0sMb2xhyWuxWeVgH5bdkvZwBPKO8oc/C+SMZ8jV7YvbRf+R3V6D0QS7EuhBzmryalW2MpqSh10D7KZje21Q154uxsc0Safw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcCK8iqlyIcEIn3IY3AHEPQLB09ABwqhkUzFqcAHqrY=;
 b=MX6Fyzu6k4pHh/f9x1AU7i9J3pcKufImS8H0Fnl0EU4AEtCWs7nSSPPEbLZmg0ibiLUIERFetMyuFTKt0HTEfnxZrSLiTMALLCnTSg+8Q9+djypEcVvTKxol8FsLcxpOMYDEXzO2Cv6MLEtgTRdh9tjBRvoAN9O0BQqentHDlCCtu34+nwWAPFhjqWQSdtIkHfTJnTn+8lS1fb3isCRcbAT90/wpN/hb/AYc7YBjF3v+s2sZdmNECNYd7Qi94qq6pyoYiZWDNTKqE1dWoQSWZHqAyJCvJ0PTpkthR6bAd0Lu08UYFSKdHwWCRfELj2J/Bivw3wHgq8u6pDy/31IVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcCK8iqlyIcEIn3IY3AHEPQLB09ABwqhkUzFqcAHqrY=;
 b=mu86oYCX15dNRAnxidmfiC15hAgO/oqte0imsrrmQTn5w+N78vcBcuND02PCrEt6lMum6B+QX41zt385QIiC2L2YM93XhI7EipP3EzKj4SJSCb2X+g2IRE5/Uuf2NW0k13f16LMqZbmqEBa38eQokY1PNEI3nmf4DDkTbjUzVtg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] arm/mpu: Implement setup_mpu for MPU system
Thread-Topic: [PATCH v3 7/7] arm/mpu: Implement setup_mpu for MPU system
Thread-Index:
 AQHbqvIOcqFIKG0Dnkidmosr/dM7hLOjFvuAgAAzsICAAJ2ngIAAeRkAgAAozwCAAA2fgA==
Date: Tue, 15 Apr 2025 11:10:05 +0000
Message-ID: <0CED25FD-5706-420A-BDB7-EB36BB7FEE71@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-8-luca.fancellu@arm.com>
 <923a2fc0-4eeb-4e09-a56d-7471a56fe3bf@xen.org>
 <4771188E-B307-4452-A900-2ACACC1CE333@arm.com>
 <fcacc6b6-ea4b-4917-ac46-5264ac3e4039@xen.org>
 <A053DC71-B301-4D64-8EDB-C225E2ED3FA7@arm.com>
 <9eec0359-e9e9-4d38-abc0-3cde6eb94e3b@xen.org>
In-Reply-To: <9eec0359-e9e9-4d38-abc0-3cde6eb94e3b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|PAWPR08MB11204:EE_|AM1PEPF000252DD:EE_|DBBPR08MB10699:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cabe30f-ac47-4cc8-048b-08dd7c0e27a0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QU1UcGM0cDRKaTN0bUFIOVNPM3IvbFZUbkNvaFZjTVZ6elZibGN5WlpYQndZ?=
 =?utf-8?B?SHB3UmN5bS9aVDM0QkxDNFZFL3BsOEJHUkxUYjNQTVY4VllFRWhYb3NwVnFX?=
 =?utf-8?B?bnJaRmVsRnkxU2hNMWtqOGN6V3ZqSzRvQ2ZrWmJtZ25tZWJrR1NDRkJsNFIz?=
 =?utf-8?B?YUFZdGovc3lGRkNtb2pqQ3FyUDFycFRYVjVMVGRBbCtXVnc4MGFpeGM4SkVr?=
 =?utf-8?B?QmlaWnZOVDRBSlk5eXVmdjdrTUs2cnpycE8wd2tuZnRzVW1Td29SSEtoTTVE?=
 =?utf-8?B?MXZ5dWFaY0dTOW43VUpTZHpEWXlyT1NvWVNxUXRXN3I3SUtNTEJwNWVvbENP?=
 =?utf-8?B?bXdNRjZuMDlHc0JsRm1SQVhIZThWL2wxSzVpUmhKVEN5ZWJ3YnAxWE9RcUxU?=
 =?utf-8?B?S2xlelJvTE53WE4rK2VWcjBoMnVtOHNIcXpKYmtXS0FFcW1RWlc1Y0ZsSm9a?=
 =?utf-8?B?ekVhMnl1RkFudlFpdjZJdmExMlFoVjY2dG5ScnAwSitralpmVHRoK1htUU5v?=
 =?utf-8?B?RDVkTFVCMldKSE1VREZBN2xEOS80YnpSTE1VeVZQVjJ4Rnd2QXlYSlgxN0NM?=
 =?utf-8?B?ZHJsUGYwRzMvaWdEREd0MllRR3FidmNJMndESVhFZnVnSUs5dFVRUEFFbEE5?=
 =?utf-8?B?TUNpR2FpdExkMXNjNGhMQ0l5bzVnN3JCOEEvTHpVZGNkVjdhVEY1SVdaeEF3?=
 =?utf-8?B?NHQwNEpVd21nZVZERWZqeFpDSlc3K1I5YVQ1SVVjMG9yNS93YnMvRk5BSmx1?=
 =?utf-8?B?NmVJLzkyV3dtOXJ3ZzZBeGJmZ1lpK0RSOHFXRDVPNGl5SGxXUzlWdWd1RG5y?=
 =?utf-8?B?VEkyTFI2bmhHcjZxWW9sTXRhTlhudnFNa3BuUXk2bVU0NnJKNzZ3NFlsbG92?=
 =?utf-8?B?L2pTRlBEZWEvNjYwbWpPaUlLNjdWREVxbVBaTXlBeEgyVkJaNUwyYm1vZ05K?=
 =?utf-8?B?Ly9XS3A5UEcxUTd1bmlJU0M0Uk1ZajZ2QlJxR1Z1OWJDRTl6ZDZjOEJNYWFi?=
 =?utf-8?B?TGs3K0syME8renk3NjBEV3F5ZUcvcncyZlFKTmJBaGtuVGNJeVVXN3ppOFYw?=
 =?utf-8?B?S1lNL0IwaUxKR01NRUt3RnZ3clJGR0dFR2dSK2RZd0hqdEtZc3RDREF3Y0JS?=
 =?utf-8?B?LzVsSFRTSzJ0Q0pRYmk0aVFaMGh1U3hLVk1LckZCYVNRVmpNclZjM3pZQUFt?=
 =?utf-8?B?a3pjMWgxdGR3UXVsSWNkYWJXMHlyMlNBcnFRdUl4SERCSnYvcVR2cml5bjQw?=
 =?utf-8?B?L1lXNFlzNEUzdFNzWDdaN1UyM1Rxa0Z6RVAyYjllVGloWXBjSkF2dXZVVzVL?=
 =?utf-8?B?YS85VSsxZ0RubW9yam5PazUxZnpLemRaUVBrQSswajdiZHQ3aHB2V3p3TFFR?=
 =?utf-8?B?MXdYM3VkNDRYSE55dUwyUitqOWRnR2c3YkdxU1M3UW90aXJLZ20xY09sWGFZ?=
 =?utf-8?B?YXgrbHloNGlWLzR1V3RoaTd3emVxeVgwTGl1Kzl5TmZMbnJxNEhpY0E1cDBR?=
 =?utf-8?B?OHQyZ3l0TCs3TFUvRlVlZGh4enFVNWFHWDZQYng5UU1hYVM0bG5aUXRIMnVG?=
 =?utf-8?B?RTZyN25LZVRheGQ5d29Jb0IwVlJxTmxHY1NRaFMxdXF2TXJIMzI4TklGMU43?=
 =?utf-8?B?cE0rdnhMN2w5WG5IS0RpT3h4KzZiUG9hNklaSm5ZQ3dFVTRtT1BxRm9vRm5i?=
 =?utf-8?B?YlVucnh1VEpPMUlWOW51aVdITVBNOWhjV3hCd1hhOWFPK0RFckpBUWRFU0Zy?=
 =?utf-8?B?REdRN1NYOFpaclQwM2RDaS9kZlN3cFViblJiTXVPRU1xVG9SWGZLbGNlQ3Zk?=
 =?utf-8?B?N1B0MElqTVNXSjErNHEybXZpQzlSOVFDK0FFZXFRZHgxR1FIT0thbXh2anAv?=
 =?utf-8?B?MlhnY1pCMnNhelhhbzV6WEFzRDE0UWVDZVpueTV6d1dJNE42TWNReVp0U21I?=
 =?utf-8?B?cGJVbzY2TW9ZWGtXb1dFUTdUUUNqOVVOS3htRVRvSFUwSTNWWXNpL1dDVEtp?=
 =?utf-8?B?RXNLSXZ6dHV3PT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C72C2CAFB2D5B540900CE74C36E42324@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11204
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd47ba10-874d-45f4-2cf9-08dd7c0e13b3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|82310400026|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnN3b2p0enJGTkFTcktpOFNaM21YREQ2WG5YaE5WdVFRejlsQ2JqMVFWRFRO?=
 =?utf-8?B?cUNpanY1SVlTb3lmZWd0MVltQmZWZDNQNG5Id2dwdDFQTmNMVjJ0d1pWL21Z?=
 =?utf-8?B?cGxBd09BWTJOczJNc2JGUFdoMU81cThPNDI5Q2dTUzhHNlhzeGlTUWZSNzgw?=
 =?utf-8?B?MG5yaVN5TTNCSWZiaDFNbTc3a1RQNHB2VitzRXJGOWQrendyaDNxMWxvVTJt?=
 =?utf-8?B?ZzdPQkNjTzZldFN6UjlBMHZPbXAwa0J2S0tNRzFVUWNXNVh0N3ZSSXZ4ZFNI?=
 =?utf-8?B?b1FLaWVkdEhzSHBBd09KM0RHaXh2eGhNMDd4dGFqeUw4cU9rdDAzL3dScXB4?=
 =?utf-8?B?WWFxUnQwM01LZHNIT05mcVEwamFrM1dOV2QxYjhqcGNEOEQvWVl5cU0xaElO?=
 =?utf-8?B?dktoN2duLzlOdWlEVEN0QW9IK2gxUExQbU5rQ2l5YkJabGxmSkJyMFZXb3Zr?=
 =?utf-8?B?dXRpdmo4a0YwTTdJQ2NPZzRDYkVRelJzYlhHZXl2cU83ZDJxL3FaQ2QzNFJ0?=
 =?utf-8?B?c3UxQ0pzM2pQOTVFeW91WWtKQ0NYc0J1bGYrR0w1cEx2SDlzTHV0Zkx6aEph?=
 =?utf-8?B?c1N1TURoYzNFSTlidXFKdk5seXFGcU1rYWd2NENsYTJGNzdMSWdpNkVqRE1O?=
 =?utf-8?B?Z3prMXZjNjQ1Rm54Nm9RQTR1aFNEb1VoQUlqeHU0bDQ3RlZ4YzdYbnNvNFNQ?=
 =?utf-8?B?Q2JHWHlUWkU2elQyZTFoSTUwQmhTMEhJVVhZcVluRE9qblJyYjhKTjZEUG1C?=
 =?utf-8?B?dEIrbHVjbHdRRmUrUUVCWjFtUEozc1dXRmwrMTdTMGVOYzZWdjN2MDdWVU9u?=
 =?utf-8?B?YWlaTTdXRXF5cWZxTjJwNDhaWUlEd1RGNWVKYTJBZkNxWHNteWVyWVNCUjlz?=
 =?utf-8?B?dUtUS040K3Q2b3pReDJHT3Fjck8vR2tmbVQzdklITnIzUXdCM0hub0pHT084?=
 =?utf-8?B?RG5XOFFONlFONU5xNWM3ZGlheXJCUXBoUGI3MzN2QkZ2UVp4M1JXU1NBU09q?=
 =?utf-8?B?RmlwTGYxY3JNTHZhbnNrbnRGcjRDY3BXVXMyNElYWkk3NEk5TGxDdGNZcE5w?=
 =?utf-8?B?WG51VVhkUlZhNzRReXVuRTZON2ZhWFdxSVg1amdKSW5DbVBHSS9zWnYyOVJi?=
 =?utf-8?B?NE1nRlJ1bnFIMWtQL1R2emRIUUtRd1o0RDJ5N092TjR1TmtpWExYK1dZbytx?=
 =?utf-8?B?SEJaVHlvMEs0WFk1YTZsbUJkaGdnR056em5jUDNFbUg3MmZ5ZEt5NlR1WnVN?=
 =?utf-8?B?UjNnNzdMU3JTZzhKdzE2aEFtdlpFQXViaHVTc2NxQS9iTzdxNXZ3OWhLNTNQ?=
 =?utf-8?B?SWtkOXhoWk1zQitZRkpXTUhRaSsyK3VETzhrK0ZpQXN0aGJmTjh6dHFHc1NC?=
 =?utf-8?B?WERiOEFyMXN6UElHOGdjN29jeEc5SW9QenNveExwUE5nN3FrUk56RitHeG9H?=
 =?utf-8?B?MGlDTU1yUm9DaXFNWUxNTnM4R0ZyOUJNQVJ0L0hlQUFOWWRtMkpqd0l5cHBv?=
 =?utf-8?B?V2VLUHFvWTdxTUpydmNiMXZrWFVqb0I1WGVhdVVGNHd3YXpGQ2xTSGhyNUhk?=
 =?utf-8?B?anV3VjdpdFRibkJNeUhUYWJJdWlzMU1YTFl3VUZDbUVIRjdia05pRzA4aE9U?=
 =?utf-8?B?Y0VRYUVia3RPZlB4YnZyREEweEgwUEZkVytBMk1TYThzZUNFL1oxMU9LeHRK?=
 =?utf-8?B?ZlE5YkNqQjJGSFh0dUZRRDVyTmw0RGRvbmdJbnppdmQ0SUk4YTVka3crOExN?=
 =?utf-8?B?MFdhemRiRHNabURVZjdyZjB5Q2VvSHNVWmN5NXFmd0ZmTlBMc3hjZWRHcHYv?=
 =?utf-8?B?dmlaVStBYUFOYmpQM2RnOFk2eEhwTWtrcnlYbkZldVJJeElES3hDRCtGelZF?=
 =?utf-8?B?RVJrQ0FMMmdjSmZUK1E3a1I5Mkhra1F6ZTJ4UG9iK3VwTFJrYU53WXdySlRI?=
 =?utf-8?B?MUQwczM4bFg0RHJsaU0rVVU2M0lrWmcxdnRCbUg2cGZzRmVCUUI1aWFpdzRG?=
 =?utf-8?B?VmRPUTJGN3IrL293ZVhER1JXQmdVR0dDZUFid0duS1gzcDlpWm5JZHdRUmlH?=
 =?utf-8?Q?ocaUy7?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(82310400026)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:10:39.1569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cabe30f-ac47-4cc8-048b-08dd7c0e27a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10699

SGkgSnVsaWVuLA0KDQo+IE9uIDE1IEFwciAyMDI1LCBhdCAxMToyMCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMTUvMDQvMjAy
NSAxNjo1NSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4+Pj4+PiArc3Rh
dGljIHZvaWQgX19pbml0IHNldHVwX21wdSh2b2lkKQ0KPj4+Pj4+ICt7DQo+Pj4+Pj4gKyAgICBy
ZWdpc3Rlcl90IHByZW5yOw0KPj4+Pj4+ICsgICAgdW5zaWduZWQgaW50IGkgPSAwOw0KPj4+Pj4+
ICsNCj4+Pj4+PiArICAgIC8qDQo+Pj4+Pj4gKyAgICAgKiBNUFVJUl9FTDIuUmVnaW9uWzA6N10g
aWRlbnRpZmllcyB0aGUgbnVtYmVyIG9mIHJlZ2lvbnMgc3VwcG9ydGVkIGJ5DQo+Pj4+Pj4gKyAg
ICAgKiB0aGUgRUwyIE1QVS4NCj4+Pj4+PiArICAgICAqLw0KPj4+Pj4+ICsgICAgbWF4X3hlbl9t
cHVtYXAgPSAodWludDhfdCkoUkVBRF9TWVNSRUcoTVBVSVJfRUwyKSAmIE5VTV9NUFVfUkVHSU9O
U19NQVNLKTsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICAvKiBQUkVOUl9FTDIgaGFzIHRoZSBOIGJp
dCBzZXQgaWYgdGhlIE4gcmVnaW9uIGlzIGVuYWJsZWQsIE4gPCAzMiAqLw0KPj4+Pj4+ICsgICAg
cHJlbnIgPSAoUkVBRF9TWVNSRUcoUFJFTlJfRUwyKSAmIFBSRU5SX01BU0spOw0KPj4+Pj4+ICsN
Cj4+Pj4+PiArICAgIC8qDQo+Pj4+Pj4gKyAgICAgKiBTZXQgdGhlIGJpdGZpZWxkIGZvciByZWdp
b25zIGVuYWJsZWQgaW4gYXNzZW1ibHkgYm9vdC10aW1lLg0KPj4+Pj4+ICsgICAgICogVGhpcyBj
b2RlIHdvcmtzIHVuZGVyIHRoZSBhc3N1bXB0aW9uIHRoYXQgdGhlIGNvZGUgaW4gaGVhZC5TIGhh
cw0KPj4+Pj4+ICsgICAgICogYWxsb2NhdGVkIGFuZCBlbmFibGVkIHJlZ2lvbnMgYmVsb3cgMzIg
KE4gPCAzMikuDQo+Pj4+Pj4gKw0KPj4+Pj4gVGhpcyBpcyBhIGJpdCBmcmFnaWxlLiBJIHRoaW5r
IGl0IHdvdWxkIGJlIGJldHRlciBpZiB0aGUgYml0bWFwIGlzIHNldCBieSBoZWFkLlMgYXMgd2Ug
YWRkIHRoZSByZWdpb25zLiBTYW1lIGZvciAuLi4NCj4+Pj4gU28sIEkgd2FzIHRyeWluZyB0byBh
dm9pZCB0aGF0IGJlY2F1c2UgaW4gdGhhdCBjYXNlIHdlIG5lZWQgdG8gcGxhY2UgeGVuX21wdW1h
cCBvdXQgb2YgdGhlIEJTUyBhbmQgc3RhcnQNCj4+Pj4gbWFuaXB1bGF0aW5nIHRoZSBiaXRtYXAg
ZnJvbSBhc20sIGluc3RlYWQgSSB3YXMgaG9waW5nIHRvIHVzZSB0aGUgQyBjb2RlLCBJIHVuZGVy
c3RhbmQgdGhhdCBpZiBzb21lb25lDQo+Pj4+IHdhbnRzIHRvIGhhdmUgbW9yZSB0aGFuIDMxIHJl
Z2lvbiBhcyBib290IHJlZ2lvbiB0aGlzIG1pZ2h0IGJyZWFrLCBidXQgaXTigJlzIGFsc28gYSBi
aXQgdW5saWtlbHk/DQo+Pj4gDQo+Pj4gVGhlIDMxIGlzIG9ubHkgcGFydCBvZiB0aGUgcHJvYmxl
bS4gVGhlIG90aGVyIHByb2JsZW0gaXMgdGhlcmUgaXMgYXQgbGVhc3Qgb25lIG90aGVyIHBsYWNl
cyBpbiBYZW4gKGkuZS4gYXMgZWFybHlfZmR0X21hcCgpKSB3aGljaCB3aWxsIGFsc28gY3JlYXRl
IGFuIGVudHJ5IGluIHRoZSBNUFUgYmVmb3JlIHNldHVwX21tKCkvc2V0dXBfbXB1KCkgaXMgY2Fs
bGVkLiBJIGFtIGEgYml0IGNvbmNlcm5lZCB0aGF0IHRoZSBhc3N1bXB0aW9uIGlzIGdvaW5nIHRv
IHNwcmVhZCBhbmQgeWV0IHdlIGhhdmUgbm8gd2F5IHRvIHByb2dyYW1tYXRpY2FsbHkgY2hlY2sg
aWYgdGhpcyB3aWxsIGJlIGJyb2tlbi4NCj4+IElmIHdlIHdvdWxkIGxpa2UgdG8gZmluZCB3YXlz
LCB3ZSBjb3VsZCBjaGVjayBldmVudHVhbGx5IGZvciBjbGFzaGVzIG9uIGVuYWJsZWQgTVBVIHJl
Z2lvbnM7DQo+PiBzbyB0aGUgb25seSBwYXJ0IHdoZXJlIGEgcmVnaW9uIGlzIGNyZWF0ZWQgaW4g
dGhlIEMgd29ybGQgd2l0aG91dCB0aGUgYXNzaXN0YW5jZSBvZiB4ZW5fbXB1bWFwIGlzIGVhcmx5
X2ZkdF9tYXAoKSwNCj4+IGFzc2VydHMgZXRjIGNvdWxkIGJlIHVzZWQgaW4gb25lIG9yIGJvdGgg
c2V0dXBfbXB1IGFuZCBlYXJseV9mZHRfbWFwIHRvIHByZXZlbnQgYnJlYWthZ2UuDQo+ID4gPj4N
Cj4+PiBGdXJ0aGVybW9yZSwgcmlnaHQgbm93LCB5b3UgYXJlIGhhcmRjb2RpbmcgdGhlIHNsb3Qg
dXNlZCBhbmQgdXBkYXRpbmcgdGhlIE1QVS4gQnV0IGlmIHlvdSBoYWQgdGhlIGJpdG1hcCB1cGRh
dGVkLCB5b3UgY291bGQganVzdCBsb29rIHVwIGZvciBhIGZyZWUgc2xvdC4NCj4+IG9mIGNvdXJz
ZSwgYnV0IHN0aWxsIHRoZSBlYXJseSBEVEIgbWFwIGlzIHRlbXBvcmFyeSBhbmQgaXQgd2lsbCBi
ZSBnb25lIGFmdGVyIGJvb3QsIHNvIGl0IHdvbuKAmXQgaW1wYWN0IG11Y2ggdW5sZXNzIEnigJlt
DQo+PiBtaXNzaW5nIHNvbWV0aGluZy4NCj4gDQo+IEl0IGRvZXNuJ3QgcmVhbGx5IG1hdHRlciB3
aGV0aGVyIHRoZSByZWdpb24gaXMgdGVtcG9yYXJ5IG9yIG5vdC4gTXkgY29uY2VybiBpcyB5b3Ug
YXJlIG1ha2luZyBhc3N1bXB0aW9uIHRoYXQgYXJlIGRpZmZpY3VsdCB0byB0cmFjayAodGhleSBh
cmUgbm90IGRvY3VtZW50ZWQgd2hlcmUgYSBkZXZlbG9wcGVyIHdvdWxkIG1vc3QgbGlrZWx5IGxv
b2sgYXQpLg0KPiANCj4gU28gaWYgd2Ugc3RpbGwgd2FudCB0byBoYXJkY29kZSB0aGUgdmFsdWUs
IHRoZW4gdGhpcyBzaG91bGQgYmUgZG9jdW1lbnRlZCBpbiBoZWFkLlMgYW5kIHByb2JhYmx5IGlu
IGEgbGF5b3V0LmggKG9yIHNpbWlsYXIpIHNvIHRoZXJlIGlzIGEgc2luZ2xlIHBsYWNlIHdoZXJl
IHRoZSBNUFUgbGF5b3V0IGlzIGRlc2NyaWJlZC4NCg0KU3VyZSwgSeKAmW0gZmluZSB3aXRoIGRv
Y3VtZW50aW5nIGV2ZXJ5dGhpbmcsIGxldOKAmXMgc2VlIC4uLg0KDQo+IA0KPj4+IA0KPj4+PiBT
byBJIHdhcyBiYWxhbmNpbmcgdGhlIHByb3MgdG8gbWFuaXB1bGF0ZSBldmVyeXRoaW5nIGZyb20g
dGhlIEMgd29ybGQgYWdhaW5zdCB0aGUgY29ucyAoYm9vdCByZWdpb24gPiAzMSkuDQo+Pj4+IElz
IGl0IHN0aWxsIHlvdXIgcHJlZmVycmVkIHdheSB0byBoYW5kbGUgZXZlcnl0aGluZyBmcm9tIGFz
bT8NCj4+PiANCj4+PiBZZXMuIEkgZG9uJ3QgdGhpbmsgdGhlIGNoYW5nZSBpbiBhc20gd2lsbCBi
ZSBsYXJnZSBhbmQgdGhpcyB3b3VsZCBhbGxvdyB0byByZW1vdmUgb3RoZXIgYXNzdW1wdGlvbnMg
KGxpa2UgaW4gdGhlIEZEVCBtYXBwaW5nIGNvZGUpLg0KPj4gbm90IGxhcmdlLCBidXQgc3RpbGwg
c29tZXRoaW5nIHRvIGJlIG1haW50YWluZWQsIHdlIHdpbGwgbmVlZCBhcm02NC9hcm0zMiBjb2Rl
IHRvIHNldC9jbGVhciBiaXRzIG9uIHRoZSBiaXRtYXANCj4+IChjYXVzaW5nIGR1cGxpY2F0aW9u
IHdpdGggYml0b3BzLmMpLCBjb2RlIHRvIHNhdmUgdGhpbmdzIG9uIHRoZSB4ZW5fbXB1bWFwLCBj
b2RlIHRvIGNsZWFuL2ludmFsaWRhdGUgZGNhY2hlIGZvciB0aGUgZW50cmllcyBpbiB4ZW5fbXB1
bWFwIGFuZCBmaW5hbGx5IHdlIHdpbGwgbmVlZCB0byBrZWVwIHRoZSBjb2RlIGFsaWduZWQgdG8g
dGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBiaXRtYXANCj4+ICh3aGljaCBpcyBmYWlybHkgc3Rh
YmxlLCBidXQgc3RpbGwgbmVlZHMgdG8gYmUgdGFrZW4gaW50byBhY2NvdW50KS4NCj4gDQo+IEkg
dW5kZXJzdGFuZCB0aGUgY2hhbmdlcyBhbmQgcmlza3MsIGJ1dCBJIHN0aWxsIHRoaW5rIHRoaXMg
aXMgdGhlIHJpZ2h0IGFwcHJvYWNoLiBMZXQgc2VlIHdoYXQgdGhlIG90aGVyIG1haW50YWluZXJz
IHRoaW5rLg0KDQp3aGF0IHRoZSBvdGhlciBtYWludGFpbmVycyB0aGlua3MgYWJvdXQgdGhpcyBv
bmUuIA0KDQo+IA0KPj4+IA0KPj4+IEFzIGEgc2lkZSBub3RlLCBJIG5vdGljZWQgdGhhdCB0aGUg
TVBVIGVudHJpZXMgYXJlIG5vdCBjbGVhcmVkIGJlZm9yZSB3ZSBlbmFibGUgdGhlIE1QVS4gSXMg
dGhlcmUgYW55dGhpbmcgaW4gdGhlIGJvb3QgcHJvdG9jb2wgdGhhdCBndWFyYW50ZWUgYWxsIHRo
ZSBlbnRyaWVzIHdpbGwgYmUgaW52YWxpZD8gSWYgbm90LCB0aGVuIEkgdGhpbmsgd2UgbmVlZCB0
byBjbGVhciB0aGUgZW50cmllcy4NCj4+PiANCj4+PiBPdGhlcndpc2UsIHlvdXIgY3VycmVudCBs
b2dpYyBkb2Vzbid0IHdvcmsuIFRoYXQgc2FpZCwgSSB0aGluayBpdCB3b3VsZCBzdGlsbCBiZSBu
ZWNlc3NhcnkgZXZlbiBpZiB3ZSBnZXQgcmlkIG9mIHlvdXIgbG9naWMgYmVjYXVzZSB3ZSBkb24n
dCBrbm93IHRoZSBjb250ZW50IG9mIHRoZSBNUFUgZW50cmllcy4NCj4+IFRoZSBQUkxBUi5FTiBi
aXQgcmVzZXRzIHRvIHplcm8gb24gYSB3YXJtIHJlc2V0LCBzbyBhbnkgcmVnaW9uIHdpbGwgYmUg
YWx3YXlzIGRpc2FibGVkIHVubGVzcyBwcm9ncmFtbWVkLCBJIHRob3VnaHQgaXQgaXMgZW5vdWdo
Lg0KPiANCj4gVGhpcyBpcyBvbmx5IHRlbGxpbmcgbWUgdGhlIHN0YXRlIFBSTEFSLkVOIHdoZW4g
dGhlIENQVSBpcyBpbml0aWFsbHkgdHVybiBvbi4gVGhpcyBkb2Vzbid0IHRlbGwgbWUgdGhlIHZh
bHVlIG9mIHRoZSBiaXQgd2hlbiBqdW1waW5nIGluIFhlbi4NCj4gDQo+IEkgYW0gbWFraW5nIHRo
ZSBkaWZmZXJlbmNlIGJlY2F1c2UgdGhlcmUgbWlnaHQgYmUgYW5vdGhlciBzb2Z0d2FyZSBydW5u
aW5nIGF0IEVMMiBiZWZvcmUganVtcGluZyBpbnRvIFhlbiAoZS5nLiBib290bG9hZGVyLCBvciBl
dmVuIGEgcHJldmlvdXMgWGVuIGlmIHdlIHdlcmUgdXNpbmcgS2V4ZWMpIHdoaWNoIGNvdWxkIHVz
ZSB0aGUgTVBVLg0KPiANCj4gU28gSSBhbSBsb29raW5nIGZvciBzb21lIGRldGFpbHMgb24gaG93
IHRoZSBleHBlY3RlZCBzdGF0ZSBvZiB0aGUgc3lzdGVtIHdoZW4ganVtcGluZyB0byBhbiBPUy9o
eXBlcnZpc29yLiBGb3IgYSBjb21wYXJpc29uLCBvbiB0aGUgTU1VIHNpZGUsIHdlIGhhdmUgdGhl
IExpbnV4IGFybTY0IEltYWdlIHByb3RvY29sIHRoYXQgd2lsbCBzcGVjaWZpYyBob3cNCj4gYSBi
b290bG9hZGVyIG5lZWRzIHRvIGNvbmZpZ3VyZSB0aGUgc3lzdGVtLg0KDQpPayBJIG5vdyB1bmRl
cnN0YW5kIHRoZSBxdWVzdGlvbiwgc28gSSB0aGluayB3ZSBzdGlsbCBjb3VsZCB1c2UgdGhlIExp
bnV4IGFybTY0IEltYWdlIHByb3RvY29sLCBidXQgd2Ugd2lsbCBuZWVkIHRvIGRlZmluZSB3aGF0
IHdlIGV4cGVjdCBmb3IgdGhlIE1QVSwgaXMgZG9jcy9taXNjL2FybS9ib290aW5nLnR4dA0KdGhl
IHJpZ2h0IHBsYWNlIGZvciBpdD8gU2hhbGwgd2Ugc3RhcnQgYSBkaWZmZXJlbnQgdGhyZWFkPw0K
DQpTbyBJIGNvdWxkIHVzZSB5b3VyIGhlbHAgdG8gZGVmaW5lIGl0IGluIHRoZSBiZXN0IHdheSBw
b3NzaWJsZSwgc2luY2UgdW5mb3J0dW5hdGVseSB3ZSBkb27igJl0IGhhdmUgYW55dGhpbmcgYXZh
aWxhYmxlLg0KVGhlIG9ubHkgaW1wbGVtZW50YXRpb24gb2YgYSBib290bG9hZGVyIGlzIHRoZSBi
b290LXdyYXBwZXItYWFyY2g2NCB3aGljaCBrZWVwcyB0aGUgTVBVIG9mZiwgSS9EIGNhY2hlIG9m
Zi4NCg0KU28gc2hhbGwgd2UgYWRkIGluIHRoZSAiRmlybXdhcmUvYm9vdGxvYWRlciByZXF1aXJl
bWVudHPigJ0gdGhhdCBvbiBBcm12OC1SIHdlIHNob3VsZCBlbnRlciBYZW4gd2l0aCBNUFUgb2Zm
IGFuZCBEIGNhY2hlIG9mZiwNClhlbiBzaGFsbCB1c2Ugc3Bpbi10YWJsZSBhcyBlbmFibGUgbWV0
aG9kIGZvciB0aGUgQ1BVcz8NCg0KV2Ugc2hvdWxkIGNsZWFyIGFsbCB0aGUgYXZhaWxhYmxlIE1Q
VSByZWdpb24gYmVmb3JlIGVuYWJsaW5nIHRoZSBNUFUgdGhlbi4NCg0KUGxlYXNlIGxldCBtZSBr
bm93IHlvdXIgdGhvdWdodHMuDQoNCkNoZWVycywNCkx1Y2ENCg0K

