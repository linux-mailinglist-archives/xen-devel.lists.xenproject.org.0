Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E29A80CE5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 15:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942173.1341432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29Mw-0005vw-03; Tue, 08 Apr 2025 13:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942173.1341432; Tue, 08 Apr 2025 13:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29Mv-0005uJ-TH; Tue, 08 Apr 2025 13:52:01 +0000
Received: by outflank-mailman (input) for mailman id 942173;
 Tue, 08 Apr 2025 13:52:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wetR=W2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u29Mu-0005uD-9s
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 13:52:00 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2060c.outbound.protection.outlook.com
 [2a01:111:f403:260c::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a17f6265-1480-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 15:51:55 +0200 (CEST)
Received: from DB8PR09CA0007.eurprd09.prod.outlook.com (2603:10a6:10:a0::20)
 by AS2PR08MB8623.eurprd08.prod.outlook.com (2603:10a6:20b:55e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 13:51:52 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:a0:cafe::d) by DB8PR09CA0007.outlook.office365.com
 (2603:10a6:10:a0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Tue,
 8 Apr 2025 13:51:52 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 8 Apr 2025 13:51:51 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AM8PR08MB5649.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Tue, 8 Apr
 2025 13:51:16 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 13:51:16 +0000
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
X-Inumbo-ID: a17f6265-1480-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pelgwOq0hkBQ2jc5lg5ROGXduz5tcigKhz0LcEbPm8vWhmebdUhrrmDT+6WHQfZ5MjJf9gBdf36UL97bh48byCNH3HBLM58SDgdWIs57CJ/PZEyBifX400FLspTcM689ZqaU8d75+nmWqW5dNfUd7sWKVZffF43BOZNyHUZeMqaudLfT3vH8QVElcD6fPSszV2hu1ZGnjpsHwAoN1csYkfZqHZ7TWTuBgReWmdwQliKM/GJnc8biWEGZgIId0WDb4fSRxvb8lOXUre5MFbtASOVsOTQglfX0rmIF9YojtrGGUhGQzVzn2iEa+H0P2pZba7SXGJL57RWFUjyFoW4UNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkAhJGFZ8z9K8xfbv6VdMslWE50kNgMXq4B/WMozGCc=;
 b=JZzjyg4xUA2SmL3MYlX8n0lX28zvgKLycLqRDL+ZZL4szZlXeSHyRYCRH2PVP5hBAeelAbomPiBEZDpfXPaBgIqMu+M9Qp1nyu6R61WtKj7IWjKBLVX2uh4+oC2ywhzeS6E25CkFzQkHJZ8QfXbGwd+aEKs7LNK3JeDMsDvUSdL881BYVYkvLGKNxbTCPntiULwyTWMypews4UtqY8CYmIEHDvqOshf+aqQ3SyyNWG2WBnz2VZyBZEEDv5n31FXU9IibIpPXanGBEuWn7fx4IMzi6E2Yq/MzvWuF0Ipt4e5ky8sHsO7FEghkFzxAyHiduueGIAgFwhd/X9UUWiH5pw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkAhJGFZ8z9K8xfbv6VdMslWE50kNgMXq4B/WMozGCc=;
 b=iUr4Z0cKdkiYoz+4aZOH1pEnIi6eq2h2Z1wNy4f/mkZGkAjPr3fML9vlS8fw2r2lRvUma78QqofCUoJV2hG8SPlvQNDkt4NmijbeU8Rw7Fpe+lzuxEgcT9rVmecjvKcFkdJVzh+DUWUQwPMkh+s9Z2JfNfW/RoL5ZSk+ACeZezs=
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzOv7Y0lRSB9lPobNqLV7XH+rebaS62irV5jPW49o1jAqJJ0UuPIi7FkL4W5bYIj3TyXBd8cemG7KEx3yOHas8nzgAPdAWhnSHuWQpyNJlGEpabEifs3FZgvnc9DROOgpOA9hdRzpeSxHMr+HdPAlCUTROqNoQtPpFFnHSRZWLwLIk1m30eI3gbGz7R87PxiL0WvRdbDQfW/HZFVVntDGjlD4LWizJKQAWTLcoLgiMpDE+SsWueI//VWHSPQ8/uHFrNlo4YVU/htidA/m+Q8AZOtUYlsDTvQnKj54JmUUgMeNJQwHwXDkqzCn1wpsiKRlUlKl27HaGwhULp+QLRsZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkAhJGFZ8z9K8xfbv6VdMslWE50kNgMXq4B/WMozGCc=;
 b=aPMFLgYmXsFYpfIK2rfkoD2yG6BgCfLq5hn0+nHVLrHARSTnxT4fNlhDVxO7jfiCba4KoRzWnFJ3AmhmUd7vUSvzGtjSEK2RcfxW+c2GmenEcUfxrTxC786NVRFEmiDzYvEopYwaoPv04PIXcxGas/TJLakkUlE9FOKEH+WhcqbXY3fu2P9u8eU4VmxI5x1qQjROeAnSxlxbhuRxixfmJA6/IxUuQW1ECECYUeHtXA6aoBh+io8RYlBb70FcRV/EdxTRSQlmtuzAZr698USvPl0FRQkVaSAK9da6K8I3teGXDQ/v2EWuxCHYPIhTGMF+wAqmd/e8xn9SVj8Vg6bqbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkAhJGFZ8z9K8xfbv6VdMslWE50kNgMXq4B/WMozGCc=;
 b=iUr4Z0cKdkiYoz+4aZOH1pEnIi6eq2h2Z1wNy4f/mkZGkAjPr3fML9vlS8fw2r2lRvUma78QqofCUoJV2hG8SPlvQNDkt4NmijbeU8Rw7Fpe+lzuxEgcT9rVmecjvKcFkdJVzh+DUWUQwPMkh+s9Z2JfNfW/RoL5ZSk+ACeZezs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 7/7] arm/mpu: Implement setup_mpu for MPU system
Thread-Topic: [PATCH v2 7/7] arm/mpu: Implement setup_mpu for MPU system
Thread-Index: AQHbp52TIeRvK12Zd0u5W6JGpYxUxbOZxiEAgAAFGAA=
Date: Tue, 8 Apr 2025 13:51:16 +0000
Message-ID: <7591A04F-8BEF-4FE7-A895-90E5DA0D9936@arm.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
 <20250407091430.2342709-8-luca.fancellu@arm.com>
 <d6c12013-235a-405f-a87f-529648d6f340@amd.com>
In-Reply-To: <d6c12013-235a-405f-a87f-529648d6f340@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AM8PR08MB5649:EE_|DB1PEPF00050A00:EE_|AS2PR08MB8623:EE_
X-MS-Office365-Filtering-Correlation-Id: 8048fd2f-1c3e-40ec-f9ab-08dd76a483f5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MGJxMW5TM0JRTkRBWDBwa2pOMytpR2FIa0l2V05DTEIyejFZT2xGMnNIRStW?=
 =?utf-8?B?cTZ4THRRUFpybisrOGFjNkJaaG1TcjhKN2lObWdFZDRva3BjWVErYTRwTmlt?=
 =?utf-8?B?NkRkeEloekdqQktkWW5sdWIzdWZpeGdjemRBN1NTZ2o5NFpuS0tSVmxsL2dw?=
 =?utf-8?B?cVZJTUVEbVZJOEpJc0Exa2kzY2hUcGpheXNLVzlBRkM1SFpmcnA5eVV5NGRj?=
 =?utf-8?B?VHBwTzkvWCsyTE1OWEI1OFpVek9QVmRHSmRzM0FIWUMvU0VwTjVhcVZRMjlP?=
 =?utf-8?B?T3VzZUlWbDJPOVNjS2prOUF0aEhnZ2N6MUFCcjhzUjhhRkRiL3Rpb2tSWkU1?=
 =?utf-8?B?K1JyRGRLenNBblZKSDdzSGtROGhseUtGeEVES1VIR0dZL2xNbkFnUjZTNFds?=
 =?utf-8?B?L0tYRUdsaEw0R0RhdWl2MUxibExzV212aFg0bGRkYndaUXJ1MHFPT1pHNnYy?=
 =?utf-8?B?dVVkNlduMDYyTzlobVRMOGx5ZHdjUjNFa2dYNFB0dm5EOFI3eHdBMDVKQVIv?=
 =?utf-8?B?WVdTeE9lRlMwY2NMVWVVZ2w5M0FXTk9aUTBETVNqK3JTM2QyMU5oVTZzRUxI?=
 =?utf-8?B?U0syRDZ5dzluVEFCVis0Rk9FZGN2VjFzOFgvL0hDOGlGM0xLN1QwQUxkRkg1?=
 =?utf-8?B?Zjg5ZU1EandPSGlmMnJIbjVwYVhqYmhCdEo5eDJTNFFCbk4rQlBESFFlRms5?=
 =?utf-8?B?disvOFBmbzYwZEVrN09xNkYwbDF5cmpUVkloUXZUeWg5bmgvYUJHTEZKbjN5?=
 =?utf-8?B?T3hNaFZyMTBsVlpNR3N4YzhVcDM1TTIvV3o3elYrNlNzQnFuaDNrWE8yY0tS?=
 =?utf-8?B?MW81SUI2eHR0N2I5b2Rxa0ZIa3ByNWRLQTdwRXRKend0ZlYreXhObXpTVXFN?=
 =?utf-8?B?K1h0eWlseFgyMEVaTmRwY1dTRGVTQk1XQzl0NWpUU0x5Q0QzbWx5dGNud2tt?=
 =?utf-8?B?UVppaUlLMk5rZXQ2bmx4UU5OLy9YNWlBVmR4blVuZlVOdEE3anVBbktkY2Qz?=
 =?utf-8?B?eStMVHhJR1NSdFd2Rm9NazFwdmd2UlpscHk5Z2Vra25UMlgzOElLUnVPTVNX?=
 =?utf-8?B?Zjlsb2NFSHhPWXA5UzFLZnU5WUVMVS94eEx2STdqZTlqNTR5TkZkQVFkc0lZ?=
 =?utf-8?B?bnhOY3huTGhqNlRWRTZ0RjFGc2NaTTAvd1h2K2FZMEJ2bXE2aTBSRnhhLzFj?=
 =?utf-8?B?djBIbWs4NDVkVUFkd1Q0ci9lbWxCeE1yVGI3SGhMNEpOU01neExTMFlHR1I2?=
 =?utf-8?B?b255OEVQcDV4WjRzbkJzeklheHZZaUhBWWpXVDNqSy9sWTJ4OTBDV09sd29W?=
 =?utf-8?B?MG9ENzEyUDhqQ25zR25uRGJJc2hLcW9Xa3N1aS9NYUZwUnl3S2NBTUYvbUFn?=
 =?utf-8?B?TmdYOEt2cjFJSzM3UHhMa3p3SGRlRmNNYVBwVGM0ZHgrc2hkRGYwTElMcFlD?=
 =?utf-8?B?RTlvQUU5bTQyeUZPUjI5MjFuMUQ2UWdDQ20vcnkveXpHbXZodExzT1VPNmlY?=
 =?utf-8?B?S1h5TjNNS2ZvaWs4VlRMVWhUN1Q1SGU2eDRzaFYxK0gzbWtUMytHY1liV21J?=
 =?utf-8?B?WUowTUhzanVTaGZKK1dDLy9UTy82MlI4UE9HZTRYczVaY0lYSUQ5Q1ovUmNm?=
 =?utf-8?B?Vk1HUG5JTmhvOXV0RXFBNmJ5RzFSVTlaaWZyTndNUm5iNEltN3NHTWhmZGU2?=
 =?utf-8?B?SmV5eDRQdS9rTTdiaFZEaXJZMkVKdmtIWi8vMnJDbHZsNmpja0s3OVVUYVQy?=
 =?utf-8?B?ZWxjeWVSU2tOQmhoM2RrUFY4ZXVuVHdXdGJ3MDQ4N1lMZTJLS2p1UGM2c2tx?=
 =?utf-8?B?Nk5JUzEyaks1VFhVZHhXTW9XOXVUQkE4TUlPb3BVSlBEc1RDRWxwdUl5UWpz?=
 =?utf-8?B?aVc0Tno3RExnUHpRRzBhM2FMbHZUTVdpaXZNNTArTjlVdUE5SFhIdE45UG9D?=
 =?utf-8?Q?TiRuilvVWOFtQrHLuOzvoVA1bgL9BHEu?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <10EA152A5EC984439750A27FBC5130A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5649
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	11f920f1-fb46-4f32-cf19-08dd76a46f05
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|35042699022|1800799024|14060799003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2JFQWNMS3N5ZXJyclhxR2NjV2pXNFgweE1qdG54QnRaV09EMkNxTEh6dTU5?=
 =?utf-8?B?bzJXMlJTWXd1SUt2MWduMWZPV05aT2ZyRUVkR3k4UWVqVTNIMVZka24zYkl6?=
 =?utf-8?B?a2VrK3pEelQ1QzVFT0Y4cnJ2Y2Nla2djUkRURWk0ekh2UFBWNG9oOUxaZnc0?=
 =?utf-8?B?SGw0VVNsdmlPZFRQMkU0SjdtTmlERnYvVEVNb1pzWkNnODYwQ2dDYmdzaFZ1?=
 =?utf-8?B?eDgyOE0vbnVZam5QNjlTaVdWVFl0M2xsZ1B6U3FMUnNyalV4dE1JMVhncXB5?=
 =?utf-8?B?Uzc2aHZ0WUo5UzVxWTZiM0dVdXBpUmVEQUNOUVJCbURBMWpmRHp1UnUrdUh1?=
 =?utf-8?B?VVdJZmNxYktueDhhcjkwcXVGSjNVdmR1cEYwOC96QXRyNkZ3emdPeENtTTVs?=
 =?utf-8?B?WkhLRHdNVGR0b01OdWltYWJjeW96TmRsb0JENWF6UGhSQ2R5NWh0cVlRVk4r?=
 =?utf-8?B?K0RLbFVvVTllRkVrZTdjTnU5ZkMybE5aclNPODFlZ3JHR2dQbE55S0RLSGpC?=
 =?utf-8?B?V1RpWXNuRVFqRFd1L1h2bzRaZHlmdGlPMW9xR1VMRTRNRCsyU2wyelJZYjcx?=
 =?utf-8?B?N1FXWFhsUEZGemJBY2tKTkthNUlCT0RPK1Z6T1pWdFl2dmlOUWg1NXE2U0RI?=
 =?utf-8?B?ZWJEbGJUeVpXODgxbnlTNU1pYk5aeFZrVWdpYWd1Q2FQeUNBYUdMY2w3MUpn?=
 =?utf-8?B?c01Fbk9wbmdYVEMraFFaY3J0UTQ4L2lMZjR1bHRJRnRWKzhaZ0VSY2t0bUh3?=
 =?utf-8?B?RlRiVTJLK2QyRmFtMlRUS3BmbzNoWHZvTENDcXlCem1CMlI1TmZjUTV5SGVy?=
 =?utf-8?B?NTI3S1JrMDNYYlVPdlVFaHdaYWZtSzFzL0svUkVLTnZwNi9DSDZKdm9iWXZi?=
 =?utf-8?B?eFlRblF2T3hoeEpZQ3JVNlBIYUZ3bGdNR3hXMC96ZW5uRWYwR1c0MEY1QlBX?=
 =?utf-8?B?Wkp5NVFxektqR0JnRUFHM2lCeURPRzlndWk4L0JSMVBLdTRTY0loQ0VSZllX?=
 =?utf-8?B?bml3eXJxSnVWcVdNUm5ydGxrMkduaEx1bWJtbU9ZWG9zdnlLUlV0aW9uK2E4?=
 =?utf-8?B?TFI3Mm1qa3paY0haWFprTldrWDhaSm5uRWhrYUgwdHpieGZITDc3QXdhZ25J?=
 =?utf-8?B?K1FKclZvTnB0U0MrUzFDaXg3SkhkVUtUaVJYaXZaaklFeUdnZmdqTm1IUk0w?=
 =?utf-8?B?bllCOHVURnFEK1Z0ajhqWHRqMnEwcW04SGg1WE96RzdiS2JGZTZycW0xOEda?=
 =?utf-8?B?THZaS3lOeXpzN2pWL2VWMUorUUYxRno2RE52M080Ylg5MGZIaTJoWStQZWdq?=
 =?utf-8?B?a2Y3OXFrUWlEN0UwWkQxaDdVUmd6YlN0RFhGdHlNd2dPMWgrSjdqZjhxQWVy?=
 =?utf-8?B?a2FJem82Y0pFN2M1N2gweGIvWmJraXZiTkRXekUxZ05qbzM2clVud2VaRmtP?=
 =?utf-8?B?U0xkYkE5b0w4MkJMdU96NFNqYU8xZTVRM2o4L3ZmdEw3L2pLWHZFOXNOVFpN?=
 =?utf-8?B?MEpOTDdXUmIvZ0dpakhrVHN4TEFiYVgzbStPcUZjV2IrRVF1SFdNWUVBMm92?=
 =?utf-8?B?eG5mTHRLSnJyR25ObkVEQzdzK2tQSWFnWVpXaEtPUzlITng1emtpdGduaTl6?=
 =?utf-8?B?YUdIazM1bzBZZ2YyM09teHE4RENQZTlmZ2p3UWtPRm1ZMlBEeUdPalFyOWYz?=
 =?utf-8?B?bGY3NkxQazhpZ2poM3JJeUJtNU5QNVc2bUFoSE1IVlVhQUpzUmZVZlBGd1Vm?=
 =?utf-8?B?VkxlUlVCajRVU3dBZDdmc3loc3FSdDN6UkRLZGErVUsrRHNkUHRPd3JGWkZJ?=
 =?utf-8?B?NHpRTzJHYW50OE00RXoyUFcyV2w4a0pCUmYxWlNuWUk2TXBkNHdscHE4QXRZ?=
 =?utf-8?B?bzFvRFNyOUlpT1A4TGxPdGxjNmQ4ZFRxc2RPQlJJTWl6R3lpTmt4SWdqbFhZ?=
 =?utf-8?B?Z0hyU0xOVENHZHVIU05kSDIrYnVPRE1tdFZwU21GdGtPTzNiblY3U1Y3WkNM?=
 =?utf-8?Q?ECO66ZV6C9bMPqpwJzo92Bcyp+vVW4=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(1800799024)(14060799003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:51:51.6190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8048fd2f-1c3e-40ec-f9ab-08dd76a483f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8623

SGkgQXlhbiwNCg0KPiBPbiA4IEFwciAyMDI1LCBhdCAxNDozMiwgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW5rdW1hQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+IE9uIDA3LzA0
LzIwMjUgMTA6MTQsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBDQVVUSU9OOiBUaGlzIG1lc3Nh
Z2UgaGFzIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFBsZWFzZSB1c2UgcHJv
cGVyIGp1ZGdtZW50IGFuZCBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tp
bmcgbGlua3MsIG9yIHJlc3BvbmRpbmcgdG8gdGhpcyBlbWFpbC4NCj4+IA0KPj4gDQo+PiBJbXBs
ZW1lbnQgdGhlIGZ1bmN0aW9uIHNldHVwX21wdSB0aGF0IHdpbGwgbG9naWNhbGx5IHRyYWNrIHRo
ZSBNUFUNCj4+IHJlZ2lvbnMgZGVmaW5lZCBieSBoYXJkd2FyZSByZWdpc3RlcnMsIHN0YXJ0IGlu
dHJvZHVjaW5nIGRhdGENCj4+IHN0cnVjdHVyZXMgYW5kIGZ1bmN0aW9ucyB0byB0cmFjayB0aGUg
c3RhdHVzIGZyb20gdGhlIEMgd29ybGQuDQo+PiANCj4+IFRoZSB4ZW5fbXB1bWFwX21hc2sgYml0
bWFwIGlzIHVzZWQgdG8gdHJhY2sgd2hpY2ggTVBVIHJlZ2lvbiBhcmUNCj4+IGVuYWJsZWQgYXQg
cnVudGltZS4NCj4+IA0KPj4gVGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgZnJvbSBzZXR1cF9tbSgp
IHdoaWNoIGZ1bGwgaW1wbGVtZW50YXRpb24NCj4+IHdpbGwgYmUgcHJvdmlkZWQgaW4gYSBsYXRl
ciBzdGFnZS4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5j
ZWxsdUBhcm0uY29tPg0KPj4gLS0tDQo+PiAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0
L21wdS5oIHwgIDIgKysNCj4+ICB4ZW4vYXJjaC9hcm0vbXB1L21tLmMgICAgICAgICAgICAgICAg
fCA0OSArKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA1
MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvbXB1LmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vYXJtNjQvbXB1LmgNCj4+IGluZGV4IDdjZjhkMzU1YTFhZi4uZmY1YTk1N2JmMDg1IDEwMDY0
NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L21wdS5oDQo+PiArKysg
Yi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvbXB1LmgNCj4+IEBAIC02LDYgKzYsOCBA
QA0KPj4gICNpZm5kZWYgX19BUk1fQVJNNjRfTVBVX0hfXw0KPj4gICNkZWZpbmUgX19BUk1fQVJN
NjRfTVBVX0hfXw0KPj4gDQo+PiArI2RlZmluZSBQUkVOUl9NQVNLICBHRU5NQVNLKDMxLCAwKQ0K
PiBUaGlzIGNhbiBiZSBtb3ZlZCB0byB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1LmgNCg0K
SSBjYW4gc2VlIGZyb20gdGhlIEFybcKuIENvcnRleMKuLVI1MiBQcm9jZXNzb3IgVFJNLCByMXAx
LCAzLjMuNDYgSHlwIE1QVSBSZWdpb24gRW5hYmxlIFJlZ2lzdGVyLA0KdGhhdCBIUFJFTlIgY2Fu
IGhhdmUgMTYvMjAvMjQgZW5hYmxlZCBiaXRzLCB0aGUgcmVzdCBpcyBSQVouDQoNCkJlY2F1c2Ug
b2YgdGhhdCBJ4oCZdmUgcHV0IHRoYXQgaGVyZSwgbWF5YmUgeW91IHNob3VsZCBpbXBsZW1lbnQg
aXQgaW4gdGhlIGFybTMyIHBhcnQgc2luY2UgeW91IGhhdmUgdGhpcw0KZGlmZmVyZW5jZSBmcm9t
IEFybTY0Lg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

