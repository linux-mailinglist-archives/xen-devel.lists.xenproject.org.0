Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1C1B43CA1
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 15:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110142.1459469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu9iH-0001Gh-VN; Thu, 04 Sep 2025 13:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110142.1459469; Thu, 04 Sep 2025 13:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu9iH-0001Es-S0; Thu, 04 Sep 2025 13:09:17 +0000
Received: by outflank-mailman (input) for mailman id 1110142;
 Thu, 04 Sep 2025 13:09:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uu9iF-0001Eh-Gf
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 13:09:15 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a057d62-8990-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 15:09:12 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DB9PR03MB7356.eurprd03.prod.outlook.com (2603:10a6:10:221::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 13:09:08 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 13:09:08 +0000
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
X-Inumbo-ID: 5a057d62-8990-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cmy+5EkCM3ohipKIdn4xQm3qq61AS5jZbjjUEFonrdcc24siJCiJ3UPqeRbcMsmfiPnbe9sFxwfUtni1OU9xm7XtkSBFzXH0LgLY/mqBIX8j48ErbBu1BkcklFfslEMIvZJPrDgwUC9gsIZjdxu0extmSnmUB9Bw8TH2qiEdhJ6OGka20NJVAkgdc+eMQpe/vd0Fnv6LE29yEISskQQKGllQrtTHUkc1pXD/THG6MGKh899QLUkaUpHCDH9ydyoK8bqSl7qApNVxnjKPPALpLb6eEXC5vmd/q67rUw5vkLdOp8UDJL+rsCW7mMafcEfFWlAxNEbDD8hyOxAvljCuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvtIxUnKBZJdSQxeuDSB4loFJi01Y3ZB3Aql2NIpYSk=;
 b=mcUtD0u5wXI2cDL5Lbbz/vg0PGUpEcf6CG+36gH8HdqYZq51P1VIGOLyp/ZeeMZjTHz9vTO9esMffGGWtRYhaqNXrXs8hGoPMaXWv/EYM8tPo9JUQbEmNuXYnW46dBgquUm4zFbdv1jopjSosDu8eLcMMyfUbThdgxKTt5JF9zdAVVKPfMYLzRj7uG3/fv1JiUwT6Eef95gCntX2TUZ7lONc+xEamEOOvUcaS8m5YEqwBfxLocbB1383p1SUz4HANGbjQS4o9vsGdn5L1Dbv5E+ZYmcqgmwP3Yv84dYg/s2ElElwERIesfJoKrNpbPHYBKcLkOGEnjx8Myt3USit7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvtIxUnKBZJdSQxeuDSB4loFJi01Y3ZB3Aql2NIpYSk=;
 b=KmXeEm/+AZKwoMYDqRYHpz+4fYhgmzSrvcaHgzpIsOY88D+MvH0QGVrvz8L+s5zWPu2cN5poJjHR+VIIZlxPZ4RlD0sOXJSXfrhORVrZTEGZxTFejZjE5CP8Fa2tjCJi+HQPxP2DDSK69GHcXpgF0mGFEXb5diXWlS16ii3BBV5/69LilxTl1r9aik0oXf0FZLYlJ20CnOeWUX6Dta3tSwxeBJ8c1BUpvlQTcLi2WAsOhBCEMwmd66BpUFJIwp+CP40cgF5kgkAifXTwycM4R+3WZNs64Ikwy8wSRiiPfkbnBrkZ5o+sI7wLgOUp8uO/YymXA6bbkHJzI47tfeptog==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Topic: [PATCH v6 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcHN861IdGTmH+JEChpQbSpoZJ2bSC9NmAgAALmYA=
Date: Thu, 4 Sep 2025 13:09:08 +0000
Message-ID: <eb80f8b5-b36f-4ebb-a2ce-72eb2fb02927@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
 <bdaec9b9704a6f21325b507365a165cce89cca16.1756908472.git.leonid_komarianskyi@epam.com>
 <aa9456c8-f997-4aad-96ba-db8fb7659b5d@xen.org>
In-Reply-To: <aa9456c8-f997-4aad-96ba-db8fb7659b5d@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DB9PR03MB7356:EE_
x-ms-office365-filtering-correlation-id: ef542897-b7f2-4726-fb6d-08ddebb43b7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OW9QbHJrNENBcjNPTU5EL2tLSC9XeUpnQUhkMzFuOGJJVDcyNFUyTldwNTVY?=
 =?utf-8?B?WE41dFdDT3hHUjI3QnVBelNjeGRjM2NFY3pPTHh5Y1phTUJMYkFFMUJXVHA1?=
 =?utf-8?B?Mk5UdHkxU3g2enJYS3p0L1lqUDlEdDdMbmlZSjNqdmVxckYwakk5Z0dwL3NG?=
 =?utf-8?B?anl4eTJsUmFiZHNYaHBnK3pjbGd1YWRvZFhEZFlnZFFoOHAyUG5ES2U1UXBa?=
 =?utf-8?B?cWFtcXg0b21hQU9iVGJPUVRoa1lUenQ4b3pLWmtsSXZZVk01MGVPY1UxMHl0?=
 =?utf-8?B?OHJBdDNRWnJDZHFZTlAxMEdrSTExanBMMnVKS2oxLzBhbk1weXNuUk9pT253?=
 =?utf-8?B?TEVzWXZmbFpjTXhlYWQxS2pqY2xQcVBlRGt1M2pqUXV3TnVkcVNJelRzcEJz?=
 =?utf-8?B?WXVJd2plcGdyWmU4a3lYc2xaNVUxNUh0ZTdSQkpISjlPTkJKVkxmTHRkZVVS?=
 =?utf-8?B?NjBHOFhta0xsbDdzV1ZQSzUxamUwZVRTWlBxR010ZkdOSnBwWFNST0k0SXEv?=
 =?utf-8?B?aERRNjU3WmVwOXQxRGVCaDI0RktOTC9rODlWV1ExWk1Pdy95VStZN1M1RFBE?=
 =?utf-8?B?TFRCMVU5dTFKcFlRRUpnSjZMQ1FIUUFPTWxKazZtNHIwNUpWYUQ5S1ZoUXgy?=
 =?utf-8?B?REJCWXlIMDZueDhkZHArUHdnNjZyM3FsM0x4RHdrejVXWVdrazFkU0FvN2Ey?=
 =?utf-8?B?VjRCTUszZmt3QXdqSGFjRGQzN1pVWTJoY285K3pLelhYbk93c2tlUHJkd29y?=
 =?utf-8?B?RXM0bHptakduaWF1RnN4OVpQM0VGQytRaXJaOW9oMVFOTmhja2FReHI2c1FY?=
 =?utf-8?B?QnVXWUJ5TmVGdk9ReWhxeW9yd2h4RzZlNC9aM3I4VnZURWM2TVlUbEtWUEtL?=
 =?utf-8?B?NndRUXovVnpKbWRGSXU4djRtaklmdDBrYWtVZnkwdE5lcWVhUCt0VUVJZGU3?=
 =?utf-8?B?WGdSOHEvM1lsek02aUFjVWE2bEpQaGlseEhPRzIrd2ZXTlpBSVF4elFpVUx5?=
 =?utf-8?B?d09UdGQyQUVpTElEMmkzSTJUeFpQU1FzQWJhcStsd0J3QVQ5M3BkcFp4SUVD?=
 =?utf-8?B?dURVbHdNTHg3OXVTMXMzYnhVVkZIZGtNU2o3aHRnNkFNRjlCR1ZVV2pvcldU?=
 =?utf-8?B?WVZmOHVkZDJJek85RlBMb3NHcmdKcmgzOC91c0dqd0pmdys2Nk5CUjV3ZDJy?=
 =?utf-8?B?TFl4S3dHK2IrSnlUQnlEOTdCME9lSzVSeXh3ZTJRTGVTclQxek9od1FRTGpk?=
 =?utf-8?B?NXl1WWpMQWdFcUkwVWZqaDROblBHOUFDNDFvRmkxbVZ6RERLcm56SkV2K2Ew?=
 =?utf-8?B?cVVReTJURlMzSHFjb21aakYva2xKdWxaNFpZenB3eUNCR25QTkkvQS9QUTR6?=
 =?utf-8?B?YlFTdTkzd3hkM3hndEZVcGU0UXh4cWtBeGIwQ28yQmxWTVFlZGYvYzN2UDdY?=
 =?utf-8?B?dy9GN1dSQmZjWEVzVWxsNXF4ZHh4dWQrNW5GK1NHSEFwMmpHN1NiaUNPdU0y?=
 =?utf-8?B?Ry9ieGdDSW5RblFhRitTY0dJQTJHZEVkcThjZlNJT2pOc3ZxNmwyOXF1Umd0?=
 =?utf-8?B?bXB1cXltcnFFOWpSNTAyL2s4S0pyL2hGb09HTkc2d0w4eW00Q0Q1Nm1KNjlP?=
 =?utf-8?B?VWxvcEppTWtrYjdYSWRTN3FwTElaeWR4c05wVjVXYThvUytYRkVYT3NBZWI4?=
 =?utf-8?B?Q2hJNTRvMnVVcUhMUXByUDRIZzZWOU45YkpiZVJJOHZNN2lYcWY0QzZTV0l0?=
 =?utf-8?B?aWpGMkFTaHplcEtMTnIxN2FZb0djK0VPLyt0SzB4T3BQNEZ5dFJnRTFLMzdH?=
 =?utf-8?B?WjQ1TGdRL2Q0bFlzY0xUd1NHbnEyaFljWC9zU3dnZG80c3RwUEtYWjhXa3lV?=
 =?utf-8?B?K1djNzcwNlEzSHNFZHVWYldzSktrSFM5a0JGalhya2NYb3lJcU95NDRZdzUx?=
 =?utf-8?B?Q2ZBdFd6ZEJRQ2lHK0ZOaFVZdTA2Q3ZpUVdicUhWRXVxbXJQRklENzRXeldi?=
 =?utf-8?B?WTB6WjJlVmhRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWtoL2tpVk84cFJoSVh4UHRRZmdnTVJLenNMOHlqZXRyNU4wTmgvNXFtOGRp?=
 =?utf-8?B?bzBBM0MyZE4rWnU1RUZtUEN5SVJna1dHRmxSL0hqUGh4eHdqY3I1NkJXZkEw?=
 =?utf-8?B?QWtEWFhEVEF1VFUybmFBRk5FdUptWGJtV0pPMm5qOVVWU2l1b2JZelRWY0tv?=
 =?utf-8?B?cnBYczNrZHYxU0N4dTVaL2lybS9zQ1hPK0ZOOXlmMlptZmNzME5NUEdRQ1VT?=
 =?utf-8?B?eVVjdm5nR1krSDFRcFVDc3YvWmFqZUJwOGdobjloNVBJVUhuWGZjb1kvUDBX?=
 =?utf-8?B?NENLSDFrVGRMMVlXbHF5czBUaFpaMFFIMW1uUTZFVWhCQ1dKZUd4dWRKQUd6?=
 =?utf-8?B?eDI5R0dhTU9VSmRzTWpEMDhNZm5kWDQyWVhLZS9pcy9zSjZyZWc0dTVZWVZM?=
 =?utf-8?B?VWdRcTJBcTZGMHQrRzBPSTVPajJKSE4rMmN6Nk5LOWVWNnpFY21peHp3MW1k?=
 =?utf-8?B?TmhHaU9TeUxNaHcyeUpJeHRlS2lCOHhXRlVxa3c3SXZibUc0ZllRMjdET2Fv?=
 =?utf-8?B?OXVsb3lFTUZPNXdhSlgxREI4c3ovQmZET2NBcVBhZzdpd2s4K1dIZ1o1M29Q?=
 =?utf-8?B?R0J0Uzd5bTVORWp6VjdqRllhQnpKWUFqR2pjak9DU2IwTGJadGZ6Qm4xZDhD?=
 =?utf-8?B?cjdGQ0pFNlQ2MU1lUmFWZjh6U05mc2VERnFVamRUMWtjUVQ1OVB4STB3WVlq?=
 =?utf-8?B?VUFmUGg2K1pnSk9YY01uMEFnTjF3bTdsV29Hbi9IbjJrVHlHSTJVSDNwK0Vu?=
 =?utf-8?B?ZmZZYmNjdmplb3JCakZ2UW1hUmRwYW1jRkhlOTc0OWpWMnVrOGNrMG4xMmRT?=
 =?utf-8?B?NjlCR2NKbGc2Mnh5NUFJdDhsM0xRdXM4c1BFVU9wQ2xMeVBoZW9qSFFET2Fj?=
 =?utf-8?B?Rm9lVHJVYkcvd0xDWGlHMzRTenNqaG9IVXBTRlF0dVVHR1ViWDBlNDlwdWdw?=
 =?utf-8?B?dHplaXR2QTZvZWpvdit5bWJQL0pJZzVqOWVDNVFQZ0VmZzk3WTU0dEhYMmxG?=
 =?utf-8?B?SDFKQ3hGWEQwUEQ3TDN0N2lNUEV6c3RkK2Juelh6dk9ySWtINk5KaVNzdVlB?=
 =?utf-8?B?SFFEQ1dMbjJyTk1CWXJ3SHlJT2hOUGpSQmlTdVpGRWVZWS9DY2FhOXp4blZq?=
 =?utf-8?B?OU9oSzJiSkVYZTRTMGg4bXdzV1FGaGZzdW1ibmlEanhreVJhR1E1ZXhGdTNE?=
 =?utf-8?B?ZEZiVlNkRzAyYy84WEtZS3hDYVZDUUlvRTg1ZUxjL3drSjBlamFvVW1xUDlT?=
 =?utf-8?B?Z0JVblJxRWp4QTJLaTRncGpIQ3l5aXQzOVBqR1FNSUFkdHNkVVFHR2RDMVRN?=
 =?utf-8?B?c2p4WUZzSjVFNTlzSzhFSzdVSXhTUDJTdjNRU2orWElQWVJ0YVQ2ZncvT3Fj?=
 =?utf-8?B?M0hFV1I1clRZaEU2WXFIemxqUEZ3QUpnb09FdGhLS1VjSmY5T0wwbmoyQjdz?=
 =?utf-8?B?aStiaGpwLzF0UCtDV0g5OGtkQUR2UlY5dDc2ZmdQa0dUeEpNMElDNG52d3Fy?=
 =?utf-8?B?L2owOC80a0FEdk5mNDR3OWJWY3ErMWE5NFpUNzZiclNBK0U0ZHBHa1djOWVt?=
 =?utf-8?B?Uko4clc3T3NGcGdrRENQYVM1TitOSnE0YVlhQ09VSXhteW9abCszWVJJWktB?=
 =?utf-8?B?cVJXZmlnR2FpZlVHTXJacGFxOWNqcEs5K1VDdWhxcVVWZDhxUnZ2WFFLV1Nt?=
 =?utf-8?B?SW5ZRlJuVVpoYVNHK3hxMnROK2dUdk1acUMwMVBvVEZudktLb2h4NFNxcnZU?=
 =?utf-8?B?OEFwcFN1amFTdE8waFBXbjBjVGFHRlNDbWlCSlM0WnVRZWVQVFltdmRuYnh4?=
 =?utf-8?B?V2Zybk1KRVhzcTdCMGcrV3NMdnVuUWo4c2VXdGVHWHZzUFY4czZyUWR0WG1Z?=
 =?utf-8?B?MWNPMVUwY1E4VHJlcVAxWCtGTW8yRnJPc05Kb0VPUVFFdVpXN20xZ2pWWWI4?=
 =?utf-8?B?MVpVSFBUenNvazE1MjEzOTZpWm9ORW13MVlYaWhhbktlcmlWZE1DckV2MnE4?=
 =?utf-8?B?SGtJcWdzNlJ2YmtYOW1oVWJ6a1JzRVpqUG8yblFRc2c5Qmtzd1E1S0JCV2VN?=
 =?utf-8?B?eUczbzBCempTNlhhTzlpNXVJOTVUTERHOGo0TkkxbGxEV1NoYk9BVnJjSGRo?=
 =?utf-8?B?UE5kbmZacUxxV2c2d3VzL3VBc0N2cDFxNWFkZmYrVFlOUXFMS2I1SHZCcFZE?=
 =?utf-8?Q?5p8AtPRpMH/tuKYesLQDs7Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F09754AA0AD9824BBEB3BB14DB2256FA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef542897-b7f2-4726-fb6d-08ddebb43b7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 13:09:08.0855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2A7B2eu0C0Ehku+rwoIx5lpl7n1U5/eqg4escIielmj4ZIbSU/Fa3omrzp5rgW2KuPBST0f45zJtMyHAYy0kLvgU3dWHB44E8mxgGR0vBnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7356

SGkgSnVsaWVuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudHMuDQoNCk9uIDA0LjA5LjI1
IDE1OjI3LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIExlb25pZCwNCj4gDQo+IE9uIDAzLzA5
LzIwMjUgMTU6MjksIExlb25pZCBLb21hcmlhbnNreWkgd3JvdGU6DQo+PiAtLS0NCj4+IMKgIHhl
bi9hcmNoL2FybS9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDggKysrKysNCj4+IMKg
IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9pcnEuaCB8IDM3ICsrKysrKysrKysrKysrKysrKysr
KysrKw0KPj4gwqAgeGVuL2FyY2gvYXJtL2lycS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
NTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPj4gwqAgMyBmaWxlcyBjaGFu
Z2VkLCA5NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+PiBpbmRleCAx
N2RmMTQ3YjI1Li40M2IwNTUzM2IxIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25m
aWcNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+PiBAQCAtMTM1LDYgKzEzNSwxNCBA
QCBjb25maWcgR0lDVjMNCj4+IMKgwqDCoMKgwqDCoMKgIERyaXZlciBmb3IgdGhlIEFSTSBHZW5l
cmljIEludGVycnVwdCBDb250cm9sbGVyIHYzLg0KPj4gwqDCoMKgwqDCoMKgwqAgSWYgdW5zdXJl
LCB1c2UgdGhlIGRlZmF1bHQgc2V0dGluZy4NCj4+ICtjb25maWcgR0lDVjNfRVNQSQ0KPj4gK8Kg
wqDCoCBib29sICJFeHRlbmRlZCBTUEkgcmFuZ2Ugc3VwcG9ydCINCj4+ICvCoMKgwqAgZGVwZW5k
cyBvbiBHSUNWMyAmJiAhTkVXX1ZHSUMNCj4+ICvCoMKgwqAgaGVscA0KPj4gK8KgwqDCoMKgwqAg
QWxsb3cgWGVuIGFuZCBkb21haW5zIHRvIHVzZSBpbnRlcnJ1cHQgbnVtYmVycyBmcm9tIHRoZSAN
Cj4+IGV4dGVuZGVkIFNQSQ0KPj4gK8KgwqDCoMKgwqAgcmFuZ2UsIGZyb20gNDA5NiB0byA1MTE5
LiBUaGlzIGZlYXR1cmUgaXMgaW50cm9kdWNlZCBpbiBHSUN2My4xDQo+PiArwqDCoMKgwqDCoCBh
cmNoaXRlY3R1cmUuDQo+PiArDQo+PiDCoCBjb25maWcgSEFTX0lUUw0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGJvb2wgIkdJQ3YzIElUUyBNU0kgY29udHJvbGxlciBzdXBwb3J0IChVTlNVUFBPUlRF
RCkiIGlmIA0KPj4gVU5TVVBQT1JURUQNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZXBlbmRzIG9u
IEdJQ1YzICYmICFORVdfVkdJQyAmJiAhQVJNXzMyDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL2lycS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvIA0KPj4gYXNtL2ly
cS5oDQo+PiBpbmRleCA1YmM2NDc1ZWI0Li5mNGQwOTk3NjUxIDEwMDY0NA0KPj4gLS0tIGEveGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL2lycS5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vaXJxLmgNCj4+IEBAIC0zMiw2ICszMiwxMCBAQCBzdHJ1Y3QgYXJjaF9pcnFfZGVzYyB7
DQo+PiDCoCAjZGVmaW5lIFNQSV9NQVhfSU5USUTCoMKgIDEwMTkNCj4+IMKgICNkZWZpbmUgTFBJ
X09GRlNFVMKgwqDCoMKgwqAgODE5Mg0KPj4gKyNkZWZpbmUgRVNQSV9CQVNFX0lOVElEIDQwOTYN
Cj4+ICsjZGVmaW5lIEVTUElfTUFYX0lOVElEwqAgNTExOQ0KPj4gKyNkZWZpbmUgTlJfRVNQSV9J
UlFTwqDCoMKgIDEwMjQNCj4+ICsNCj4+IMKgIC8qIExQSXMgYXJlIGFsd2F5cyBudW1iZXJlZCBz
dGFydGluZyBhdCA4MTkyLCBzbyAwIGlzIGEgZ29vZCBpbnZhbGlkIA0KPj4gY2FzZS4gKi8NCj4+
IMKgICNkZWZpbmUgSU5WQUxJRF9MUEnCoMKgwqDCoCAwDQo+PiBAQCAtMzksNyArNDMsMTIgQEAg
c3RydWN0IGFyY2hfaXJxX2Rlc2Mgew0KPj4gwqAgI2RlZmluZSBJTlZBTElEX0lSUcKgwqDCoMKg
IDEwMjMNCj4+IMKgIGV4dGVybiBjb25zdCB1bnNpZ25lZCBpbnQgbnJfaXJxczsNCj4+ICsjaWZk
ZWYgQ09ORklHX0dJQ1YzX0VTUEkNCj4+ICsvKiBUaGlzIHdpbGwgY292ZXIgdGhlIGVTUEkgcmFu
Z2UsIHRvIGFsbG93IGFzaWdubWFudCBvZiBlU1BJcyB0byANCj4+IGRvbWFpbnMuICovDQo+PiAr
I2RlZmluZSBucl9zdGF0aWNfaXJxcyAoRVNQSV9NQVhfSU5USUQgKyAxKQ0KPj4gKyNlbHNlDQo+
PiDCoCAjZGVmaW5lIG5yX3N0YXRpY19pcnFzIE5SX0lSUVMNCj4+ICsjZW5kaWYNCj4+IMKgIHN0
cnVjdCBpcnFfZGVzYzsNCj4+IMKgIHN0cnVjdCBpcnFhY3Rpb247DQo+PiBAQCAtNTUsNiArNjQs
MzQgQEAgc3RhdGljIGlubGluZSBib29sIGlzX2xwaSh1bnNpZ25lZCBpbnQgaXJxKQ0KPj4gwqDC
oMKgwqDCoCByZXR1cm4gaXJxID49IExQSV9PRkZTRVQ7DQo+PiDCoCB9DQo+PiArc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBpbnQgZXNwaV9pbnRpZF90b19pZHgodW5zaWduZWQgaW50IGludGlkKQ0K
Pj4gK3sNCj4+ICvCoMKgwqAgQVNTRVJUKGludGlkID49IEVTUElfQkFTRV9JTlRJRCAmJiBpbnRp
ZCA8PSBFU1BJX01BWF9JTlRJRCk7DQo+IA0KPiBDYW4gd2UgdXNlIGlzX2VzcGkoKT8NCj4gDQoN
Clllcywgc3VyZS4gSSBqdXN0IG5lZWQgdG8gY2hhbmdlIHRoZSBmdW5jdGlvbiBkZWNsYXJhdGlv
biBvcmRlciBhbmQgdGhlbiANCkkgY2FuIHVzZSBpc19lc3BpKCkgaGVyZS4gSSB3aWxsIGRvIHRo
aXMgaW4gVjcuDQoNCj4+ICvCoMKgwqAgcmV0dXJuIGludGlkIC0gRVNQSV9CQVNFX0lOVElEOw0K
Pj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBlc3BpX2lkeF90b19p
bnRpZCh1bnNpZ25lZCBpbnQgaWR4KQ0KPj4gK3sNCj4+ICvCoMKgwqAgQVNTRVJUKGlkeCA8PSBO
Ul9FU1BJX0lSUVMpOw0KPj4gK8KgwqDCoCByZXR1cm4gaWR4ICsgRVNQSV9CQVNFX0lOVElEOw0K
Pj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgaXNfZXNwaSh1bnNpZ25lZCBpbnQg
aXJxKQ0KPj4gK3sNCj4+ICsjaWZkZWYgQ09ORklHX0dJQ1YzX0VTUEkNCj4+ICvCoMKgwqAgcmV0
dXJuIGlycSA+PSBFU1BJX0JBU0VfSU5USUQgJiYgaXJxIDw9IEVTUElfTUFYX0lOVElEOw0KPj4g
KyNlbHNlDQo+PiArwqDCoMKgIC8qDQo+PiArwqDCoMKgwqAgKiBUaGUgZnVuY3Rpb24gc2hvdWxk
IG5vdCBiZSBjYWxsZWQgZm9yIGVTUElzIHdoZW4gDQo+PiBDT05GSUdfR0lDVjNfRVNQSSBpcw0K
Pj4gK8KgwqDCoMKgICogZGlzYWJsZWQuIFJldHVybmluZyBmYWxzZSBhbGxvd3MgdGhlIGNvbXBp
bGVyIHRvIG9wdGltaXplIHRoZSANCj4+IGNvZGUNCj4+ICvCoMKgwqDCoCAqIHdoZW4gdGhlIGNv
bmZpZyBpcyBkaXNhYmxlZCwgd2hpbGUgdGhlIGFzc2VydCBlbnN1cmVzIHRoYXQgDQo+PiBvdXQt
b2YtcmFuZ2UNCj4+ICvCoMKgwqDCoCAqIGFycmF5IHJlc291cmNlcyBhcmUgbm90IGFjY2Vzc2Vk
LCBlLmcuLCBpbiBfX2lycV90b19kZXNjKCkuDQo+PiArwqDCoMKgwqAgKi8NCj4+ICvCoMKgwqAg
QVNTRVJUKGlycSA+PSBFU1BJX0JBU0VfSU5USUQpOw0KPiANCj4gUmVnYXJkbGVzcyB3aGF0IFZv
bG9keW15ciBtZW50aW9uZWQgYWJvdXQgdGhlIGFzc2VydCEoKSwgSSBhbSBhIGJpdCANCj4gdW5z
dXJlIHdoZXJlIHdlIGd1YXJhbnRlZSBpc19lc3BpKCkgd2lsbCBub3QgYmUgY2FsbGVkIHdpdGgg
YW4gaXJxIDw9IA0KPiBFU1BJX0JBU0VfSU5USUQuIEluIGZhY3QsIHdlIGNvdWxkIGhhdmUgdGhl
IGZvbGxvd2luZyBjb2RlIGluIFhlbjoNCj4gDQo+IGlmIChpc19lc3BpKGlycSkpDQo+IHsNCj4g
fQ0KPiBlbHNlIGlmIChpc19scGkoaXJxKSkNCj4gew0KPiB9DQo+IGVsc2UNCj4gew0KPiB9DQo+
IA0KPiBXZSBjb3VsZCByZXBsYWNlIHRoZSBjaGVjayB3aXRoICIhKGlycSA+PSBFU1BJX0JBU0Vf
SU5USUQgJiYgaXJxIDw9IA0KPiBFU1BJX01BWF9JTlRJRCkiLiBCdXQgSSB3b3VsZCBhY3R1YWxs
eSBwcmVmZXIgaWYgdGhlcmUgaXMgbm8gY2hlY2sgDQo+IGJlY2F1c2UgSSBkb24ndCBzZWUgdGhl
IHZhbHVlLg0KPiANCg0KVGhlIG1haW4gcmVhc29uIHRvIGFkZCBBU1NFUlQgaGVyZSBpcyB0byB0
cmlnZ2VyIGl0IGlmIHRoZSBjb25maWcgaXMgDQpkaXNhYmxlZCBidXQgYW4gZVNQSSBJTlRJRCBp
cyBkZWZpbmVkIGluIFhlbiBEVFMuIEluIHRoaXMgY2FzZSwgaW5zdGVhZCANCm9mIHRyaWdnZXJp
bmcgYW4gQVNTRVJUIChhcyBwcm9wb3NlZCksIHRoZSBmb2xsb3dpbmcgd2lsbCBvY2N1ciBpbiAN
Cl9faXJxX3RvX2Rlc2M6DQoNCi8vIEFzc3VtZSB3ZSBoYXZlIGlycSA9IDQwOTYNCnN0cnVjdCBp
cnFfZGVzYyAqX19pcnFfdG9fZGVzYyh1bnNpZ25lZCBpbnQgaXJxKQ0Kew0KICAgICAvLyBUaGlz
IGNoZWNrIHdpbGwgcmV0dXJuIGZhbHNlDQogICAgIGlmICggaXJxIDwgTlJfTE9DQUxfSVJRUyAp
DQogICAgICAgICByZXR1cm4gJnRoaXNfY3B1KGxvY2FsX2lycV9kZXNjKVtpcnFdOw0KDQogICAg
IC8qDQogICAgICAqIFRoaXMgY2hlY2sgd2lsbCBhbHNvIHJldHVybiBmYWxzZSBiZWNhdXNlIGlz
X2VzcGkoKQ0KICAgICAgKiB3aWxsIGFsd2F5cyByZXR1cm4gZmFsc2Ugd2hlbiBDT05GSUdfR0lD
VjNfRVNQST1uLg0KICAgICAgKi8NCiAgICAgaWYgKCBpc19lc3BpKGlycSkgKQ0KICAgICAgICAg
cmV0dXJuIGVzcGlfdG9fZGVzYyhpcnEpOw0KDQogICAgIC8qDQogICAgICAqIFdlIHdpbGwgZmFs
bCB0aHJvdWdoIHRvIHRoaXMgcG9pbnQgYW5kIGF0dGVtcHQgdG8gYWNjZXNzIDQwNjQsDQogICAg
ICAqIHdoaWNoIGRvZXMgbm90IGV4aXN0DQogICAgICAqLw0KICAgICByZXR1cm4gJmlycV9kZXNj
W2lycS1OUl9MT0NBTF9JUlFTXTsNCn0NCg0KU28sIEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gdXNl
IEFTU0VSVCB0byBzaW1wbGlmeSBlcnJvciBkZXRlY3Rpb24gaW4gDQpkZWJ1ZyBidWlsZHMuDQoN
Cj4+ICvCoMKgwqAgcmV0dXJuIGZhbHNlOw0KPj4gKyNlbmRpZg0KPj4gK30NCj4+ICsNCj4gDQo+
IENoZWVycywNCj4gDQoNCkJlc3QgcmVnYXJkcywNCkxlb25pZA0K

