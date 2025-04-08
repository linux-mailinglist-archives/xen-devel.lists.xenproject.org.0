Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C3A7F852
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 10:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941586.1341042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u24dV-000806-IT; Tue, 08 Apr 2025 08:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941586.1341042; Tue, 08 Apr 2025 08:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u24dV-0007y0-Ed; Tue, 08 Apr 2025 08:48:49 +0000
Received: by outflank-mailman (input) for mailman id 941586;
 Tue, 08 Apr 2025 08:48:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wetR=W2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u24dT-0007xu-A5
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 08:48:47 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47665839-1456-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 10:48:44 +0200 (CEST)
Received: from PR0P264CA0082.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::22)
 by DBBPR08MB10747.eurprd08.prod.outlook.com (2603:10a6:10:536::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 08:48:41 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:100:18:cafe::cc) by PR0P264CA0082.outlook.office365.com
 (2603:10a6:100:18::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Tue,
 8 Apr 2025 08:48:41 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.0 via
 Frontend Transport; Tue, 8 Apr 2025 08:48:40 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DBBPR08MB6028.eurprd08.prod.outlook.com (2603:10a6:10:208::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.20; Tue, 8 Apr 2025 08:48:07 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 08:48:07 +0000
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
X-Inumbo-ID: 47665839-1456-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Feodd4phq5pNA6X4Ksm8OsvUzkZSCz/hV5yYl3QuglXA3zVUYPQH+Shv064cKL4DXePGwjEAJGngwcWLCwwWMF5cIIpoM5X5GSEmZOStkqVZDqgOneqaPZL3qnqef0CIkWtgleXC+AkGXNlivKkOj3W3JTNaAGkGcziHWw++bWL29wCIj5PUdlCCAHvaLcMvLdNCrstlKf4RhJEjaTqA6UbJa8JgEm73s0Ymzaq5XawQ1p0Zxehc88ioeuyDrmtKv/rbR/MVMzvRWnM7mv67I5JlVOPMB/0XsM5RgnzidHIkDRmVoHSADT2VPm5ThpNcyHcGVOLJxF16eKuLIeorKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Iu9WyAfujjXUe0oydplzBXeTotu+Yxz+H+GFmIP2QU=;
 b=lUAvLkN7AeFiQrpZt+fDrP2jneMObA8aJYyb1TznwqZOEP1JDpfkD/IVpE5XmS79dN7EByO3Vfgy2gBam99TdWA6FKmDxkYl3+FlsxuFcZnxzJwbC3d8RIWNE/ib+/8/OpCMr0xhPxHveUY9+UXf4+DqOkmSSPkkSsndz1IvojGLT++ElHlUnbFYxdLXukUb5+e2yL1/vogLlr0YTP514XTO8BEBvEtSFbKA8j2XPLeE2WhDJcS8lqeFjskXmec64LZDwNKOQvmPv+3wzwVd11mPWy5f+AhzIQNslHVObJvlye5BzS/8miQdZs5F1XAUeZq9JVTmsbk1n/lknAAFZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Iu9WyAfujjXUe0oydplzBXeTotu+Yxz+H+GFmIP2QU=;
 b=rPr87IPyTwxWuE7VXoKG0JVvzPR2eVfwgFt0ExBvf2v9dG7SJEV2hnckH/XZOSUUQaqBUaVErbzDUU41cDmLJYiOWC0waYWv28Q9/kVm0IDljMs03V1W3d8bw4q4INyUtbREJe+kMfepWfygKeUR+etJkEc+mvKC+m2FIwm+770=
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSHCHuu5XEQL3JOb2Lph9sfsQguTXozSTs62UUdAw4ViU7DsC4gMy5H0iDmY4GJcPgWZpOysHhTyJv3AIkEBB4VOO1zxLj2QnXQMCH9N8v1vZmxeFNMC/2h8xS/+kS9dF/dt8xiQBT7pAVSoxIjpXbVgiH7doJyqz/4liKf1zRFBkEVSYWNbjbnkXU21Kwkg4MtvmIrgOyYuZ3UT9wMbTWuCli0WYRRtNuwUBOxGo08XPsLSPG1YLl71pkd+uhgGGEeo7qGhrCXZanAPcJzYTly1bV2inG2l49y0Ann7uQ15zHVzfuq50siZOKVrbHv67RLD3LEoUsHEDZInbOdDdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Iu9WyAfujjXUe0oydplzBXeTotu+Yxz+H+GFmIP2QU=;
 b=XevPJ5w7cKJqQ7UqLL78gEc4plNKwr7IJ823s6OX8fdC94/nMjmAgo8hCEYia6HQt0G55B54ZEPpu/9RPso4Dj1PDUfPTXw8D77zi/5rDW4hTeMuzjApe3gAkHffF/hLc2Aufid+xIfGI5VS8NSpQt7PSZXVqRa1BQ60yV8eI28mKRTXw1xs4rZz69p4BlMw/XCqlGRmxI5aJ+NazvmzuyiqsN7vU0PNbd00wqBvnUWQTAI8qVQYh6gWBK8HiOOVoY4d9Q0TC+RWSpXrnG5fJ6z4aiTnm6LzT7LvoYYZZ6cEwyAfRuvLKrlvYsv1qCTLbtCYIthgkvyegB2x+tWYig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Iu9WyAfujjXUe0oydplzBXeTotu+Yxz+H+GFmIP2QU=;
 b=rPr87IPyTwxWuE7VXoKG0JVvzPR2eVfwgFt0ExBvf2v9dG7SJEV2hnckH/XZOSUUQaqBUaVErbzDUU41cDmLJYiOWC0waYWv28Q9/kVm0IDljMs03V1W3d8bw4q4INyUtbREJe+kMfepWfygKeUR+etJkEc+mvKC+m2FIwm+770=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 0/3] Enable early bootup of Armv8-R AArch32 systems
Thread-Topic: [PATCH v5 0/3] Enable early bootup of Armv8-R AArch32 systems
Thread-Index: AQHbp+05ANvpnp6IH0WRbtuqNwkbyrOZdeYA
Date: Tue, 8 Apr 2025 08:48:07 +0000
Message-ID: <C45D2686-67F1-4CE9-8CDF-F35AE7959DE0@arm.com>
References: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DBBPR08MB6028:EE_|AM4PEPF00025F98:EE_|DBBPR08MB10747:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae25d7b-dba4-4a26-5687-08dd767a28e8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aTRkU24yeHFWK0M4ekoraVpMSFNXd0xJYStlY1lpTkZZbUxIT1g5K1d5SnZ0?=
 =?utf-8?B?UjRzSEFNMGR3N0dIbWVCVjRRMFRoYWQ1RHRscjRhQ1Y1K2I0ZFIyd25qNDkr?=
 =?utf-8?B?RFpIOE1ic3JadUhsZmc3eVFYZGc1VTlUcFdyeCtpU1VoRkxpdm40RDNubTFK?=
 =?utf-8?B?M0Z4NWJYT3ZzUFFGZ1lsTkVHSVlXZmJmQmlYL2swbTRvd3BMRWJaMDVTRXF4?=
 =?utf-8?B?dXRraDJKZEF6WTV5dUZGNjQ4TmRrKzNhTHhGeDQvaGZOQjBpUXZvNkZFOEJo?=
 =?utf-8?B?WnpzSVhsQ25pVlVXcGllSUhlRFJUaE5EMmF0UVhNOVVoOFpaK3ZiSGpYZ216?=
 =?utf-8?B?aVlRZXpYQU5HS0dJZ2wxOVdBUTA3cy9FQXRVSDBQN1dnQ0lOTDVFakEwMlBk?=
 =?utf-8?B?QXRTV052YXlwY3FML2NiamUyWnFlbndyOW9tRUtjYmJJNFVxTmZxRUpWVGZy?=
 =?utf-8?B?TDM1amp3VVVFNlI4OHc4RWFjVTBaaTVML0NhRUVqd25tWEhPL0xnVHMwaWhD?=
 =?utf-8?B?UHBXcysrZDZ2T3haSW9uQlQxUjc2b00yMUVxdmFWVmtZWnJqSnQ2YWtsemJs?=
 =?utf-8?B?a3JFdE9NZjUwQkJwbUMzSEI5N3FVZEFMQzRKdW1TT3FDMTU3OFpMSzZYSzVx?=
 =?utf-8?B?Q1NHSDVSeUMwY3dsak1yT3Z6K3QrNU5hSlV2aVpHdHNYQjdCMUlGVXUxV1lp?=
 =?utf-8?B?RmRuVWRhMURlT2lDVnp0bXJSQ1FaRFN6aFN4Y3lsWjE2a24wcjVpVWVHUkFM?=
 =?utf-8?B?S1VrN3htV0ZDYmVBdFpkcnU5UmRYejlrQUZDNTBIOVI0Y0t1WU16aU5uU2xz?=
 =?utf-8?B?ZlFVbjl3YjFBcjFoTEVLamZYTDZ0djNwTloyamdzNkdFT3pyMmtXbTFLa204?=
 =?utf-8?B?YkVnYzVDbk5SY0lsdHFuK25QUjd3WTRKU3JWNVc1ajRINW14c1VCS0tCQlFQ?=
 =?utf-8?B?R0R4dFoyckpKRkdCcnE1WFl0Ym1TZWtxMGdlSUh2ZUkzQ3p4MmQxTVBCenh0?=
 =?utf-8?B?S1N1VVV4OStLZTZ0Z3UzT3dVVFNjVURPSmo5SlIrKzVGZEcrVjdmdy9xTUI1?=
 =?utf-8?B?UUhNLzM2NzVnWGtaU2MxK1FoY1J2OTlhTk5KQ1Q1M21qcWJuclhLbVdhM2oy?=
 =?utf-8?B?Z2Y0cVAyd1JuRVFQWTNNUW1wbTdPUWVJT0M1WnBYSmZJTFRRVjhGb1VwNWZX?=
 =?utf-8?B?bWpPOTVCMWNYRGFqVWdZTUJpTjRwUTN4Z3UrV1YvMGw5OWZiMHRCejg3blY2?=
 =?utf-8?B?N0ZWL2VBSzJpSnV4L01SVmxPU3NxU2Z6ZkpkTmd6b2djYkdBZXM0WFp6ZWdl?=
 =?utf-8?B?VWF0cWQ3OFFHWitNcFZtQmo3UjNBT0NTM003MFBHSFRnTHZFZ1hhRUpaYVFN?=
 =?utf-8?B?TVdrVERINkN0V1gzSGZ5K29MNGdSZlcwcjZhYlZPeE1scEYwLzFONTJGako4?=
 =?utf-8?B?d3puL1VtUEpxeE03LyswYmNpV1pFRk5ZWmdaaW5NQ3ZUNlJlbGVVZkpxWC9V?=
 =?utf-8?B?bHZWZEpWcXVMWUFkN0RQZldVbmZvcTBtOXY1M1FtdHNXbGtrWi9QdUFiWkN2?=
 =?utf-8?B?V1RJM1plQXJMSUVLZ3Q0RHk5VEJ3K09sUUNUbm1mRUR0b05YTVZCblY2MW94?=
 =?utf-8?B?alNrT3NnbDNEN1MrYzE3dW5YcXdhbTRWeWxIVTNFVERDMWdRYW5GaTJnNXZ1?=
 =?utf-8?B?dEQ0N2lqVEdLRk9Yam5pNVVmamNoNmI3M0cycUh1M293enBiZnZqeUtwQWdl?=
 =?utf-8?B?Nm51TzdwbnYwNmhWWWMwVlBSTGtKT2U0RnMxWGxwMng4dkN1Wmc1aDU4Um9s?=
 =?utf-8?B?S3UydjcvK1gxTVR4V2k0MGVTUUhnUVRtYXN1OGEwbjVuTVJWWDlITlNqRVZq?=
 =?utf-8?B?V1l4NmxIN3lDWjllcG82S0pYRDRodFp0ZSttNC94RGg1UU8zUlBPam8wUFRX?=
 =?utf-8?Q?0Jd07TgtrzXrteXXdt+rLn7bQgypvUVB?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <024A2D6F1EB31C45920304784F7DD7E2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6028
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0606bb48-71f9-4a66-569d-08dd767a1551
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|35042699022|1800799024|14060799003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEVwaStCbDRaaEhjWkg0Q0NDY1BRcU00VjUrRlkwaDhvNDNORzU2UEV2US9E?=
 =?utf-8?B?emZ5YWVGUkV4K0Y0UE0xNTVyRURQSnNYOGhVc0pjR08rSnpsQXVVYTQyakFo?=
 =?utf-8?B?d3ovSWNNZHZVdUpSSWdjSWRSQWRGWUpYL0hrbkg0eVV5c09qUDJvNk1FS3hY?=
 =?utf-8?B?aXhuZnBnUE1pa0lRZThVSmpZcnI2aW5wL3RTVHFzWUhIL2ZlNmxmYi9LNW5m?=
 =?utf-8?B?VGJuZmVKTStVZ3N4WUN3SkNtTkN1TDlGb3FidGt4ck1vbElBdlh0cjQ5NWZm?=
 =?utf-8?B?eElYM2tibW5iMkltOW8yd1NOc3lKZmp4c01aVHBLSmN6TllES2J3d1lTZ0FU?=
 =?utf-8?B?S0ZIcWNEZEM4TTh6ZDdSK2RIenlVNnp0WGFKNUxnblI3Qms5L3k5aEp6ODB4?=
 =?utf-8?B?eEhRVlBsZWlvWWhmc1ZMTW0xOWp3d241eHNaM0NybUdURUVqTnJEbC9DaEtt?=
 =?utf-8?B?TEFERmd1NUZZTkVPaGJ6NTloWlBFVU5FSkZrdkRFbEkvMmFuYk84SHFJdzQr?=
 =?utf-8?B?M1krUi9WeGFVd2RXZVN4cm52U3BjV0ptWFNCTVpYM0plczFYSDljcUtWbUV0?=
 =?utf-8?B?dGlUNEtaVUJmRGNBa3VRUmpZNDNIZlYwRCtXRHdLS2VsMzRYVENONHdtM01a?=
 =?utf-8?B?dWVCcTArL2w4UWVHZUJYRDlmcUcvN3A4U3d5SjRMemd5ZTBqakdMSXA3RDNE?=
 =?utf-8?B?cENMZ0hwWUpRZGk3M0xoZ3dPQUZEeUZKcTdDS3pXamdsbSt0UDl0UWhwazQx?=
 =?utf-8?B?Z3RLSG16UFllUGZocVlFNkV6SThZN3c1WS9IK0RmQU1pa1E2bEJOYzNtV2I5?=
 =?utf-8?B?OGYrWGhyNzJJSXgyamJvdWx4YW00akNadkJPZW91MHhubUVRYk1rUFNkWUl3?=
 =?utf-8?B?aHRBYWRMb0t5Z09DNk9EZU8yVUhwdjZpQ1QzK0ZTVTB4YmpHMGpSV252eURM?=
 =?utf-8?B?OWp2WW9lV3VXdGlMSlU4Rnhham1mZ2Vmdm5kM1JjYkpRekZTdUE0cjVvc3da?=
 =?utf-8?B?c0YxV0Npclg4T2pURVpmRGFGeGlmVFBrNmxTR2wwR3I2VE1sU2o1UW5EV0RO?=
 =?utf-8?B?V0NxQmMyVU1ZR2E0dFZVSEprN1lXUzlzVkJvbjVoMXNyeUVvcmpYb1FVcGV5?=
 =?utf-8?B?ZnNocndDWGRONGtJRmVpM2JFYVZGSGFmejJrWTVQWHZLbDRTelFsVy9NaVZF?=
 =?utf-8?B?bFlwYVRoVXp5bk1ucmdjSzRrVkFtMEdVb3E4M2VqakxESVN3SW8yR3YwN2Js?=
 =?utf-8?B?L2N6ZytHeGVkUFJOZjF1aDFLRVpnT3pIQkdmUUxxbUlXV0VxK2pFMW5aQlhv?=
 =?utf-8?B?RndTRTJhTGlBN0k4U1JjVFBjYW9VSjdWTzlLS0c5Y3ZYUU4waG5rbVJiWEZq?=
 =?utf-8?B?aHBIeEdPUi94cGdxNFV4T2Q5SHlKNlM4VUFoZlJLNGZrWitHZ01kVUJiN1N4?=
 =?utf-8?B?bWRZTkYrWmhTaDlyamlUd0dYempoejZGcmZuOWZEQ01sN0pHSk55eVRhUjdZ?=
 =?utf-8?B?cTNoSHhrQjUyYXdaV1k4K3JuTHZGdGRHRnBrU3dKNTQvY0tSMCtDSGdEWWhR?=
 =?utf-8?B?VkhBSnhua3Q0bXI3SjFWVlk1dDhnV2k2RnI4ZnZMYXcvYXFCKzRTQi9mcE9u?=
 =?utf-8?B?MjRvWjZPc2hrbWxzMU9oaFpDM01FM0dPcThld0RMcnQ4YU9idnlkMExKUnVt?=
 =?utf-8?B?blVvRFhQQTVxUHdzWTBnTERvb1NzenlQY0ZsVXlBL2kzMldvc0pMaVIxRjl0?=
 =?utf-8?B?MEFiNXZwNFpLRkxHRjRvSFhSOElTOWI1ek4vcDh1RnJ4UDZXNS9VSHU5RHNV?=
 =?utf-8?B?dFRhQ200REpYaTF6UzNkdTRyZEVsRHIzRGx3SXhTZTFNN01YN29yOHhlK0RO?=
 =?utf-8?B?WEUrV2pLTVJqM1ZMTDVKQ05xeGVuSW9WT1E5SDNXaEdhV1BIN0pYOVJvOFgz?=
 =?utf-8?B?ZW5NZUNITmg5MkhyamVEYTQ4bnczRDZVNnluM242b2tzQ3dnSWFjM1JmVkU0?=
 =?utf-8?Q?sWSlv1AtLoT6GhCLQqV22pRot7DYiw=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(1800799024)(14060799003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:48:40.0060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae25d7b-dba4-4a26-5687-08dd767a28e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10747

SGkgQXlhbiwNCg0KPiBPbiA3IEFwciAyMDI1LCBhdCAxOTo0NCwgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gRW5hYmxlIGVhcmx5IGJv
b3Rpbmcgb2YgQXJtdjgtUiBBQXJjaDMyIGJhc2VkIHN5c3RlbXMuDQo+IA0KPiBBeWFuIEt1bWFy
IEhhbGRlciAoMyk6DQo+ICB4ZW4vYXJtOiBNb3ZlIHNvbWUgb2YgdGhlIGZ1bmN0aW9ucyB0byBj
b21tb24gZmlsZQ0KPiAgeGVuL2FybTMyOiBDcmVhdGUgdGhlIHNhbWUgYm9vdC10aW1lIE1QVSBy
ZWdpb25zIGFzIGFybTY0DQo+ICB4ZW4vYXJtMzI6IG1wdTogU3R1YnMgdG8gYnVpbGQgTVBVIGZv
ciBhcm0zMg0KPiANCg0KSeKAmXZlIHRlc3RlZCB0aGlzIHNlcmllIGJ1aWxkaW5nIGFybTY0ICYg
YXJtMzIgTVBVICYgTU1VIGFyY2hpdGVjdHVyZToNCg0KVGVzdGVkLWJ5OiBMdWNhIEZhbmNlbGx1
IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCkNoZWVycywNCkx1Y2ENCg0K

