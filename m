Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C6CCF442B
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 15:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195477.1513410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcm2B-0005dg-Ll; Mon, 05 Jan 2026 14:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195477.1513410; Mon, 05 Jan 2026 14:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcm2B-0005bs-HC; Mon, 05 Jan 2026 14:58:15 +0000
Received: by outflank-mailman (input) for mailman id 1195477;
 Mon, 05 Jan 2026 14:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtAc=7K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vcm2A-0005bm-Kf
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 14:58:14 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f40bc348-ea46-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 15:58:12 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6425.namprd03.prod.outlook.com (2603:10b6:303:120::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 14:58:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 14:58:08 +0000
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
X-Inumbo-ID: f40bc348-ea46-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N81HSWSklfr0s+HkvPFwEE0C1nBlG/tajm7WeDIb6smySEH0G4nEy5pnWpbQBXfl2zspQpmGFj0+dN7yg/08NZxvCjtIm8+T3SLMZ9Ia7oeeGSQJf1HTDHravAw1Sk/Ggk99Qk8srUf80ZnnhvC8DZtZe4M7EUpL0O+PZj0Spotv1izQEcuJnAV1zg+rRneoyrhsFxdKgoPJ2P2ADQ4Sh6JNqa/j/4Zq83F1tEUIOUfapWfRhOmoV5qUso+ZwanD3i4F7JTv8UlzqmLXb7pc7WzDuNLWmp4TgYiAfL0EzvfCH7wvHoNJ+6s9g4Fw5P5wM5CU6HRE7HiHoBzhZLA3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3H64XTLbV7Q4tYtJ9M0Bb8wNfaPHGjyyFsHtSDBmlA=;
 b=jCeIVBXsGJIJp+T5dDl13Jt8khQUSUkLVMNQ/18YCfhDG3vtWrG9RKsqdbCB7h6XNGo/l8D/xpA2yBOECKLcYEIfkiB02UpD9b0enIfTbzWWtdW2SJimEVERlLir3Qmp+N4I9SCACaUaJxFJZSx+gHRV5lSCJc7Vli7ICU4rR7Jj43uCPejj3d4ezEZzFzx8mLu/RvrkUb6QYKk5mn8y4rBO3QaA6kDwjAn3A9EzASWTpYrWzqkOYL88dgXRB1yvJhZrcmLbqChpLJW5MZKbIkABxO9Y9YGsL119HMXclB/fBkAKeWNPChLy0aJpiTwVMUaGm6bja3uhORLFLeNuUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3H64XTLbV7Q4tYtJ9M0Bb8wNfaPHGjyyFsHtSDBmlA=;
 b=UM/a1FDU+98fPKig5dcbacDv2JbGBfimfn6ajoERAH0QFfT1UJY6nGUuJFCctHY6MQdpiSg9ZRlQfvMs04Qff0162tVw3spGzCJ6fwFT4bNDPz5wopjGD+R5aQsAvFbFw2F9L7XGzESx2p55dnA6u2bnpQg97WQNRGIS0hQslgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cfaadea1-62a4-42b2-89ce-8b016ec030fe@citrix.com>
Date: Mon, 5 Jan 2026 14:58:04 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, sstabellini@kernel.org,
 consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] xen: rework deviation to address varargs MISRA
 violations
To: Jan Beulich <jbeulich@suse.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <d2ba22d6a36a4f2b952a80712aac2cfe632e8609.1767174251.git.nicola.vetrini@bugseng.com>
 <b05b3746-6611-4aaa-820c-b45e9c6a8ed6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b05b3746-6611-4aaa-820c-b45e9c6a8ed6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: c65d5db5-2c80-491e-2da9-08de4c6ad680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1l6ZFJNakJsZW4yNExhQjBkL3Q1VVZ0VHNIbjV1a2RFbGdnSE95NDlhTlYw?=
 =?utf-8?B?TkhLSWhSNlI4WDY4cnd0MW1ObVNqbDFBR0MwZXh6OWVNb2NzOVkxNkxsaXhP?=
 =?utf-8?B?WDZiejNjZ1ZnbHFrVGVUd01aOU1lTkg3Y1I5ZWNGa3pIUUF0cVBYTTZuQXh0?=
 =?utf-8?B?Q3RJeitwMXlUSzJmTzJRTmQxeExkbXZhU2dUN3ZQcXBydXN5VTBXVzFpaFNF?=
 =?utf-8?B?VFAxUEppUTFkUkFGRm56SUtCcVRnUk5FY3NZZmlZY0x4NnRUV01aNFQwTldH?=
 =?utf-8?B?MC93NCtOUzYrUVNzcnJOaWlhOWZ4anJkL2F6ZXVhdVB0MEdpaDE3MHBmWWdy?=
 =?utf-8?B?MzZLVDBMZTBmM0pNMTFHeENXNm5hc1ZaWklTcXlBZTZvYTd4WVBXV1l4M25z?=
 =?utf-8?B?RUdWbUxidTVNcEQvREdQUHhjalE2R2F3ajdSZDFxcnBoQlY3cmllbVErRzVz?=
 =?utf-8?B?VWQ4Y3luNTBLOFpJejhhdkRyNk01K1RlRTAySVhhRFE4VE5PcmQ2NkV5NTFl?=
 =?utf-8?B?cXpRL3JGb0EwMlBrRisrYzVLTzdHM2RDbW9Fa0tZTGZlK09ENVRETFpwMzcz?=
 =?utf-8?B?ZWRZb2lBMkx0dTAzT0ZLVEllUFAzeVZZa3lBUVREemNMbkltSklDdWo3Zi9m?=
 =?utf-8?B?blFZV05QQW1ZcDR2Tmgxc2RsaHBCdnF2czhJdmFHdTJycXQwY1FuQTViamly?=
 =?utf-8?B?YkZoWEdnWkFxNlJ6cTVMQlNvbkxKK3FLalBUclVlSy8wUC9Rcmxtb0xhZThv?=
 =?utf-8?B?YUN5MktIOEhpQmFFZERrc1NNTG5PalBHUFRJR3U1Qm5ZNXlSTFBxOE80UU5D?=
 =?utf-8?B?cjVDSGQ4aEZqOTNRazJVRVNVNEx5bHJxVTg1M3JmcjBOc05Oalp1NjdkWVdM?=
 =?utf-8?B?TE50dFVQcFFYNGpEdWlpZ29kWFAvbHkxRng4WVF1Y2MyNnM1Zi9wQU9TRjlT?=
 =?utf-8?B?dUd2bUtmKy94OElBdkd0RUlaZ0VnVEVCRVk5dXlIQzdlNXFKME1IcDYxSENm?=
 =?utf-8?B?NGVxc2RranJsTDRUek00aklSUGRHTjUxK1NObTJSV1h3UDhiTVovYVgydlpD?=
 =?utf-8?B?R3VhazZiOWNjMVdYQzREQ3Ixb05kSEFXRnBtWVowZk5MSzZCdzN4bmloUkxh?=
 =?utf-8?B?T2JLWDdEei9wRnhKOTlqOEEzb1pIWm5na2xBOWdibVlPSkE1N0ZHVFBoUUY2?=
 =?utf-8?B?MjJUWVRleUtoTk5RQnd3RC82QnFteDUxby9QWnUzUU9qZzV5RDBUc1VNd2FO?=
 =?utf-8?B?QmlQUWQyN1R1WjM4cytKS1p1M3piV21BOWZWeFRCcFRjWnJxdmFlOFFGUm05?=
 =?utf-8?B?YlpuMTF6QlZFS2lGbHdIRHVFM2xIVkJvSDZ2MEwyRmRtbWZPUzMvTmVMd1cv?=
 =?utf-8?B?ZVNqbGJyc2FTOU5QT3kxbzB5UnY0d3J6Skw2U09BS0JWdGg4Uy9hTnM3WE1L?=
 =?utf-8?B?UW1aODNEQ2lnQnkzeFBKYkNIczM1cDVMTDA5b20yY1A2anRZbjZHajY2RTds?=
 =?utf-8?B?ZVhkK2Z0QnFxa0RGellRbHpNRFU4Qkl1VVlGS0V2elFNWk45SzdnR2ZpY1V0?=
 =?utf-8?B?ZjNsaUEySXZuelZHUmo4eW9JdWVpRndIQmNJd2xNVUo4eUdCekZ6MDVQbjFJ?=
 =?utf-8?B?VVRJcnJQMVBxdlh3K09QazBGMDJJR1RxUExrTEhKNi9Md01NUjlvU29aU29a?=
 =?utf-8?B?eXlKS1JnMkE0akhYbWszczJMbitseVJYZEthcFFqWWtQWkpHN1BDaHF0OUtB?=
 =?utf-8?B?VUZyZmdKQW56V20raG9jOHJyVUY5L3JkOGxVbkEvTmV0QzNVeTBtcjFMemF5?=
 =?utf-8?B?MkpqSC9uMEZLd1FsZzZkb1N0SSt5NTRTWmpkOTl6V1UweC9tQjZMRnF1ZVlV?=
 =?utf-8?B?MW1RcFA1aVcrUm1YNllkbHNxTnAzN3l6Nk8xVE43djdJaytDT0ljODlGbTFI?=
 =?utf-8?Q?AVnVUtbc6NGWU3TYLryl3902JdGzcde1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWNkT3JadWsyYUtiUEdseWJJUVgyZ3RXRVRpY2pDSTMrdE1sMmxySlhXaFVC?=
 =?utf-8?B?enF5dTZZWkUyUlBJdHlBYmJtbDJRMVF3QW9ZL3dmRS9VSU5LQStESVVkTDU5?=
 =?utf-8?B?KytmYmRkQkhhWW1lMktNMXB1RE5pRlNJSVZVLzVTK3pEaCs5UTNsVGQ0WDVX?=
 =?utf-8?B?SUU4MXRWclg4K2c1THNCdXBRelBTTXpXb0oyTFkwOGdPK1lEd1ZxaVNZd3dx?=
 =?utf-8?B?Q2VCWDlZWHRZZlMyT3luclR1SmJRTG5zTEtrcGRqTlBaOUJ4U2dYQ01wdEZh?=
 =?utf-8?B?WXhtNS9vQzFwR1RTbmp6enBOakVUN0ZuZGZuT0JJczJrUW5YN05PcTJLRk1S?=
 =?utf-8?B?dXA0ZGpXVkRydy9ZZk9SL1JVNTNMNTRvT2ViQWNwL0RCYjlUTFU5bzRGN3F0?=
 =?utf-8?B?TEVDcFY4dXVYRlZEQmZTb1lYLzEvbjAwTmxOSGZDdHl4L2luL1IwVlJQQzU2?=
 =?utf-8?B?TUo0NTlkRllMQTNVZWlmQ00zMk1PTlVnSnpHNVE3TEp5L29zQUlFS3JiRGd6?=
 =?utf-8?B?dGhVQU1vQmxYck1OSUtmZlF5b1hzTnk5bUVCN3hqMmJPTW9tR1UvNlBEQjdR?=
 =?utf-8?B?TnpuOXByb1BRL1JZa3BJY2xmNWoxNVNENFRKSEsvN25zaml1V0dtZE1jUkdm?=
 =?utf-8?B?WEd5bTJLQXlJVlFSMlpHSmJwM0M4UDJ2cFpjZUp2a3JmNUNXNzl5L3RDZUc2?=
 =?utf-8?B?MXNJbEp4cjdrQXgrRWNGUFZ5dE42MzdGaHZ5R2YySXZVdU93NGgyQWxrUlRZ?=
 =?utf-8?B?VFgxdHY0MUZjTlBETDl2RnNqNG1oKy81eFJLMk1td3JvZkQraXI5cjJlUTRI?=
 =?utf-8?B?UzhMZ24ySUp0WEovMzdDSXRwOWNQU2Q4N1pDZEJDNEFtZ0tpQmF0Rk1FRU1l?=
 =?utf-8?B?cWIxNTJhb3pERjVSMUdoUjZyYitsOVQzQ28vRzNIcDYwb2RSbnV4OTdNT3hw?=
 =?utf-8?B?eXp3T2IveWZhMW9JcWltYkxoSk95dkRMb1JyaTB3TzF5SzdZRU5XNEJjMnUv?=
 =?utf-8?B?cGtlV1lpM1cwajh6TVV5SlBJT25NWGErdDZXMyt6aFJCNjByMG04UFNEMlZt?=
 =?utf-8?B?Yzh5ZkViS1BVR2xCRnd3TWc4eFJhdUFrS0hGYk5XbzUwYzVyZ3NLeHFmbFlw?=
 =?utf-8?B?czhSQXJXa1VwL29RdGVHR0UreGF0UXFOeS9uQkNMS0VhNWFGd3dJN1pvenZH?=
 =?utf-8?B?S0ZmbnovZUdxQVdMQTNaenA5T3BEZHRZUUhvYmRXaFRrM09XeXBhd2tkSGp6?=
 =?utf-8?B?bnVHdmJNVEtGTWFBWStVK2ZRM0MrUVVON2ZmRjM0SUx5Vmc3bm0wWlVCS0VH?=
 =?utf-8?B?aVRZRGlWWTJpOGNrUEVXb3ppT1VJcHVzZzdoUHMzLzFsZ1RKeWFTckxjWVFD?=
 =?utf-8?B?TDlFNW9Ya3owVXhtM0ZvMC9ONnU1T1d4bUdnczdmQllyUjEzZmJjcGo2RWgr?=
 =?utf-8?B?cVZVMEVWR3J2Z0FyV282ZThRS2xLTHJrUE9NZ1k2cXRIR0d3bUNmUmQ4Yncv?=
 =?utf-8?B?THU2YXYvZ09ORzBWNW9VNFRueWR5ZGpIOE9JU2hKUys5UGVjY1FqeFh0TXBt?=
 =?utf-8?B?Uklpd1Nja1VES0prNjNTVS9Gc2RZUGFVNWpUZDAvOCtwMGtiRWlZMFhmTjFw?=
 =?utf-8?B?czA4bUtHd1pYUzVjbGFPekRhWWphN3lBcTcra2NQNitZK0JRSmQ4b3JCVHdV?=
 =?utf-8?B?d3l4ZkJIQTk3MU1PN1YvRy9HdmRyNmlOUG9yN21qMVdYQWJpRllFZ2FQRHZp?=
 =?utf-8?B?NEdiMEcvek55MjVQTm53RUZyeldORTNGVXdMNkpBNTlSeEUwOU9FM2RCWG1S?=
 =?utf-8?B?ZzR3MDc1Y0FmTjVDR1hveWM2MG9vb0dTd0hNcnkwQ1lnK1l0NHhtdkVJTmVG?=
 =?utf-8?B?ZHlaUmdxVGZKSXVjWHh0TFRTK1F1S2pQSHlCMzhtQWp3RzdORW12eDJOK056?=
 =?utf-8?B?c29LSCtvOUw2YUkwTW9zZ21PdmFVTjUwVEZtaXBJV0J1ZHBhNU9MZlBkYkZk?=
 =?utf-8?B?OUhtRXMrc2VYTFN1OGNVaWlYdU1NWUkxam1MeW1ZN20wVlYwUVVyeElnZTJl?=
 =?utf-8?B?TG5OOXRDWGdsSEJmdmNRWTgxRUFjbHRwbkxZY3p2NTlEUDloaEpJZ2sxbmcw?=
 =?utf-8?B?UEdHbnUwa0oreHJybjJSTURYbGhjZ1BxMVUzeUpVcVJ1OHkrazNNdW9tRzF0?=
 =?utf-8?B?WXhBVEhxaGsxdS9YV25YQWtNU2dleC84Z3hWYitvTzl0aXkzaHY3WDBXTk50?=
 =?utf-8?B?VlNaUytVY3hRMFBaN0VmSTN2ZTEvTnVkbDlodmhVVGdkblNsdjN4dXlvWUYv?=
 =?utf-8?B?NHpMUDNMSUlaNDJIcGg3a0wzQlA0bm5kR3NpQVAxS0ZQVXJaNGltUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65d5db5-2c80-491e-2da9-08de4c6ad680
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 14:58:08.3756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlExak2rixeBWiHRlfOvv9fEDOb/ck1lxEitte+Un8bXGrqEof+cnF/skVRjLBqrJrTDfrWxNZroHTOoRnX0S8Iwjjcc3jUHsscNuZy2ZtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6425

On 05/01/2026 2:55 pm, Jan Beulich wrote:
> On 31.12.2025 12:22, Nicola Vetrini wrote:
>> --- a/xen/common/libelf/libelf-private.h
>> +++ b/xen/common/libelf/libelf-private.h
>> @@ -84,7 +84,9 @@
>>  #define elf_err(elf, fmt, args ... )                    \
>>      elf_call_log_callback(elf, 1, fmt , ## args );
>>  
>> -void elf_call_log_callback(struct elf_binary*, bool iserr, const char *fmt,...);
>> +void
>> +__attribute__ ((format (printf, 3, 4)))
>> +elf_call_log_callback(struct elf_binary*, bool iserr, const char *fmt, ...);
> Just one tiny, nit-like request here: If already you touch this, can the
> missing blank ahead of the first * please also be added at this occasion?

The parameter also needs a name.  I have both fixed up locally.

~Andrew

