Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B6ECB62E8
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 15:27:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184175.1506692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vThda-0005PX-Ru; Thu, 11 Dec 2025 14:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184175.1506692; Thu, 11 Dec 2025 14:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vThda-0005NA-On; Thu, 11 Dec 2025 14:27:22 +0000
Received: by outflank-mailman (input) for mailman id 1184175;
 Thu, 11 Dec 2025 14:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cEbC=6R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vThdY-00055n-WC
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 14:27:21 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d204eea-d69d-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 15:27:15 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SN7PR03MB7036.namprd03.prod.outlook.com (2603:10b6:806:32d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Thu, 11 Dec
 2025 14:27:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 14:27:11 +0000
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
X-Inumbo-ID: 7d204eea-d69d-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqiq+BhO40xjTcUN8h/9DFw94D85s7FaPDlr46dV4LN3Wba2d7y5x+mLqgVh/lhG26QhJvxVx971FCss4lF3HkxeMtZXGCdiMacaNhGtNcIGvPJv/Feix/Gtn0ZAraAT0zZoOsQO9+qvIPq3rOX8pfUnxynygtHWll24eb7HQInByezS11TvxFsANucLHRj9qd351FaEGsgXzwRMg7+2dnzGAiVuL7VHOPT58VlI6dcuGyD/EAdLeukIfKH2/+vzf1ar0IqFGFnDnN7aGBhrBnIHl/9z5NMHLCAAPfcRbYuPylBxQEEGuAsrUWDVMzbdqDsdUwwrL9+7XE3FjtA1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7wf8aT5VdYTH0KwJsw0mmsingAtaUp/HW2l1zuI1TY=;
 b=IVcUgANbrbzVcISR1rv2NKPlnGZynywf32cGf/u6gPGeQiWiILwrbszwWsVMpqII1B6x5gYdBXoSggvGlNXwluuywy3gky/4pw+zy67fNv1o/pf1yAEE+S8quMtoFBWivSpKP639Xk1OlBN1a0FYgKqjRCL15qkLS3SRqUxfJhW7LbYFyvyr12oyw3DIlAKGOZznSuSqwwhi0mNyMfRHsPAAQFEhRTgFAJEQRcsgcln8wjYmoTTVn7cJlSHvd8sk3PnRFrLnPiR4nlPRvmh+vMNtegGDddGtz8V0LObtqZKtOkA9UJwSoJVnHfju7v/uIAlp+luActsBgIt9CigmMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7wf8aT5VdYTH0KwJsw0mmsingAtaUp/HW2l1zuI1TY=;
 b=btpNHNPRoYO3tbksEMJmty+QgLcZ531rnLic2raP+B9sGLtAjv5/+WauU/s0IN7mwyEXGcxiCNK68XCpse6cX7Z1qAmvGMUSnIgh+J6co/CVYCOmkBkNZwaxsThC7gjpBvpZtS8K3+X2dilsWee2xmqoX03Kq2mMrrxWznCk5DM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8335c03a-0635-4a97-98d2-4f12ab352d5a@citrix.com>
Date: Thu, 11 Dec 2025 14:27:07 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] automation/eclair: Run *-testing jobs only in some
 branches
To: Nicola Vetrini <nicola.vetrini@gmail.com>, xen-devel@lists.xenproject.org
References: <cf852fe2b233bf98e57bcf82d4c9253b59aa17ab.1765459392.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <cf852fe2b233bf98e57bcf82d4c9253b59aa17ab.1765459392.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::29) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SN7PR03MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 7706bb25-6a2d-4cfa-276c-08de38c15f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QStpYmhDeStNK3ZPK2wvTkFMd3laNjJtSmJLdVptcFNnVTN4QmZnbVljd3Zt?=
 =?utf-8?B?Ry8xcjJTRkVUcWdsb2JKUGYxQXNCckV0aWU5M3Z1R1BCZTNOMmRRQ3lEV09i?=
 =?utf-8?B?eURJZlg4THp4VjFiK2ZzZitHdmxWSXZJVUVDQWNCTlhyemRSRkdMSEdsVFht?=
 =?utf-8?B?YUp1RHNwUm5IYzNYWk1YSTFoZWNibFFPaHVJRVhsMVlCNzIvYm9OeThQZC92?=
 =?utf-8?B?YUJIUndNd3h1WUtybkprZ0ZvMXczR3ZRdHNWR2wvcitBWjdBNnpaZzFNMExh?=
 =?utf-8?B?ZkN0eXlXRXJSVXp6Sy9BcUlkK1pQZ1NOdTJRY01CbjhFelJ2cVlzMk1QNXRC?=
 =?utf-8?B?bm4vRHNjVDVtT2svQTlwU0N2TjdCZGNqZmE3Mnh2a3BlWm5NTGtxRWpwbXJ1?=
 =?utf-8?B?NTNvZ2VVV044RlhDdHYvTXlVbmRTQ0RJK2FQUjJYU01zV3NGSS94V3dXRnlW?=
 =?utf-8?B?eXozbndXNVMweFpPVUdNTnJTb2IwSnFickVLMEtWN1F6T3FUcCtwN3BOank1?=
 =?utf-8?B?eGZzYlJKdUczMEVkeGNSYlFYRU9iY1M3Z0J1NHZZcGIrKzZVMVBhcTlKMjZo?=
 =?utf-8?B?NmJJTjBkbjZOekVxaUhXLzVIVUFsQzRrZVpsbUtiZm5kbG5acTV6b1l3VUFt?=
 =?utf-8?B?aFNGbnM1RmdBaHZlaE51ekJGTERhM1g0Wk9Rd0FyZXBKT2lNcDJNczVxWU1y?=
 =?utf-8?B?VGJQSWdpTktXZDFNZFhnWDZtQnF4ODlUOTBHalhnL1NtS1JKVjNiWGw0ZmMv?=
 =?utf-8?B?Vm5uSnVWWDNBUTA2V1NnazFtd1EyVFhicWtRRy9EL1NMNUs4VUdUSWQ0enFu?=
 =?utf-8?B?M2NuK283VlRCblZpOXM5TEpxYTlFTitzbzc0QXZFNllSNTZ3MVYrbHN2ckli?=
 =?utf-8?B?YWloeDFta2UyVUk5dmNJdnVQbEtlaU1qYVkxalE0SVBTS1dOck1kQVJ5b0ow?=
 =?utf-8?B?S2FzMVRZbDdVY2VKN0U2Q2ExSU1YamxlbHRLWWFyOVJjUXNiTFFtemlyWSsw?=
 =?utf-8?B?ay95YnZJbWYxQXFoVUhhVkdlT3hHTUFyZEdqS3ZabUkxRjdidHE3R0puSDNs?=
 =?utf-8?B?d2I3U3Y2bk9hRThrRlVQZlB5Vm4yU3RZZ1ZOVnY4SFF2SzdPdktIQVF6aWtz?=
 =?utf-8?B?Q0RHT1p6Yk53TWh0QlcrcWdqYkNGK1NPWWYzc1VtbXJXTXVUR2lnOXdPWmho?=
 =?utf-8?B?QXhtQjFFam1lVHNuUjBwYnVnczZjK01SVTF5alB1UGVyaHZLUFlDeDIrZ1Q3?=
 =?utf-8?B?SDBDNDM1N1VjSnQ0VStBREpZMFRaRWMwcHdnWkR5TVpyNHA3aG5GUHY5Z0Fy?=
 =?utf-8?B?RU42aXg2SmNFT0tDa1RuTjdHR1NTS2Z2SFZDTUVsMUk1REJ4Q1VqQ0JKV3Zz?=
 =?utf-8?B?YmtmSnpzNldTVFBGS2Q0UDNmU0RrbURGR0dDQmlGbnZZc25aWWFCaTUvS3No?=
 =?utf-8?B?Z0xyTHV5dXZ5RGR4QkwyRjdOTmNqZ2Y5SEJzaks3YmpVVTVSZ0FDMjN4OUlF?=
 =?utf-8?B?ZXFGT0hFdmtHUVI1dDRHMW80djkrMHQyN0J2eG00YTFlRmRIdjZWYzFLc1ZQ?=
 =?utf-8?B?a0ZVTVBWY1pNcUx5QW42QzUvN1g1Z1AzQlp5RktreXkrUStLa2hDSWdQM0gx?=
 =?utf-8?B?TThBakZBZENKN1UydXJCYjg1S0xrVVBxM1FnU0pLSnZKU2xsYXZUNzFzcE9D?=
 =?utf-8?B?ejY5b3lQM2MvdnJ5WEZwVjdjN0ErWnJ6UzBmNGtTS1lHM2p2RzRVS2FLZnlo?=
 =?utf-8?B?NkcyV0x2MElmcUFoK0pDb0YyVHJBUVVlVmI3L2t3blpRK2RzL3J4cklLeGZP?=
 =?utf-8?B?WGZYeXkzK3BLNUFOQUdFUENXSEF3ZWlDLzZrZFhGODBFOEtidWtxVE1wREt1?=
 =?utf-8?B?QWdPeWRVZTRSbmNlaFBuYW4zSVc1TUxWWGtPVjl1bVgzSG95NUZJblJJZmk5?=
 =?utf-8?B?YWhYdGxHK0p6Um9oKzdKZlZwVldRK3Q3TkZvM01YKzc0dGVBVnFheHd2alZB?=
 =?utf-8?B?c3lmd296SmxBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUdmRCtGZ3hTdzlqdzJjcWhMaFR5czVCUnBsU3gybDhMQVdwaVFxWUtwZ3Zk?=
 =?utf-8?B?RXhiK0NKU0ZvclRxWDdwMTFrU3p4OUFJWWhFUU44anpBN3lGL0Mwd28rV05O?=
 =?utf-8?B?cG1LODkxT2xhczZEMFF1T25Pd3lQdDg4MURNeWRtaDh5NVMzT2YvZHBxazdz?=
 =?utf-8?B?czNkYmVqUWpzZW9lQUVvc3RGSDc5b0N2dllqaFNjYnhtcXBFWWRuT0JITUMr?=
 =?utf-8?B?b0x3bUdkWlJlN3RpVEhwT2lURWNnSkx0UnRzTjNVaHRVRG5IUGJLQzdaZGZG?=
 =?utf-8?B?MSt2cDJtbTdJT1lnQjM3Q2x1ZmcvNlBUbmx6UUR6K1lhZy93S2pvWXhkczdI?=
 =?utf-8?B?MXVkTVV5Y0h3N2hLT0xZeDVlKzdnUU4wVFhGTUs3Z2xkWExXbzdRSDJoZjc2?=
 =?utf-8?B?WHgxSHRoSkRJVlZ5R1YwanlZcUtWOW5pRmtDMHJ4RGswZlZ6WUVZdmZNQjJx?=
 =?utf-8?B?OG95Wk1PYVphckdkSEtDRmZrd2E5eWZ1ZHM0WDF4QytId3JHNGdnNGl3aWEr?=
 =?utf-8?B?cjR3N3JVUVRYTWZHQUd1V3R6L1FnSENvVUpoQmtIZGF3NEVWK3hJQ3RJWUJU?=
 =?utf-8?B?UWdVWVNRQnhOWkYzaHAxNXd0ZEM5R1VFZ0pFVTZQcjRPL1pMNTltT0lJVEN4?=
 =?utf-8?B?aEx4TFYxc3U2OGFLUmMxbDdGb29GWWFFOUN2REZVOWN3QjliTkpnU2FyekdM?=
 =?utf-8?B?ek1OKzdXRVpNaWNYWXFnSzFVQ1FWTzJwbnR4RlBzZzNYWXcvbFZ6TFlrTE54?=
 =?utf-8?B?WDJ2ejYwSFlvWTNvMWJDOWpzaVJ6alJNSFBBR0oydHNwUlBNL1Azbzl4WFNr?=
 =?utf-8?B?bStFaE1seFZJVXkvd21aK1FSd2dkWHZpZ2NKMXJzOTRhT0lEc3RUVjR4N29X?=
 =?utf-8?B?NGhkZERlemU1UlEySXQydkE5amRWS2hTVDEzQWZickxZVVRJQ2VPR1dBemIy?=
 =?utf-8?B?UlpBdW9QcmdwMGFmSllHbWR2ME1pbnhiUzRKQ05mK1d6WUV0c3ROM3AweXBq?=
 =?utf-8?B?cEdsZzc3Q2tZc0VwTG9TWERJT1h1bUxoV0FGWE94c2xSUGV4Mkd6bWp4MUVh?=
 =?utf-8?B?amMrMkV2Ukx5VnVsUmg5c1hOS1lSVitNb3JmMzF5Z3ZqNFJoV3JUVnFwbXMz?=
 =?utf-8?B?SlhaSW5GazU5Um43SHM4b3pzRUx3dEJxQ3dZMmdoaitGa0Y0dW9HNWluTndp?=
 =?utf-8?B?MjB4R3FFK3loa0FqRVpmanF2ZU1CZ2E5b2szSUFXcDhNZHAyZFhBeVdCRUd4?=
 =?utf-8?B?Z1NXdUdvbW1veW0xWXhVdlI4VkhkMWFwcytHNnREVWdsTmU3TmlnVFRQVGQ0?=
 =?utf-8?B?Ry9Ca2V4bmlCaERHTlBtVmpYS0REaHhET0JTZk82Yk1aaGxIaEwwTS9ON1Fj?=
 =?utf-8?B?SXNKdG8xM09OVDVkT2ZSVkIzM1ZDd09YR2k3T2lkU2JnbG5nMkhtdkJDWTJk?=
 =?utf-8?B?WWhuakVCSFhqYld4ZzFZU01ncG1TaG1Mdmh3UHlpS3dwcnk0VHQ3aEc0Szdt?=
 =?utf-8?B?SEZlTHJIWFExNXNVbGxhTFd2RTdFU0FhcHI5ZlhIOTh3ZUJZa1YzYjVjd0t0?=
 =?utf-8?B?bUV6RmZRbDRrTlJRS0FLbC9TZ1lQczN2RHpxRVlDaC96LzcvcDdaOFFjOGYx?=
 =?utf-8?B?SnBxaEo4U05vUHZGODdTZ3JNWWpwSmppUldKeW10UFpGT29EWlg5Sjcrejg2?=
 =?utf-8?B?TGhTNVNoVlU1SHpKdzR2TXdZVWVSRG13K0xuTk9INzM3c3lEU2l2RFZVYmJH?=
 =?utf-8?B?amovN01CT3YrS3gxU3FJZnZTNW5LdisrTkU3R1JEK3k0WjFXWWZESE10dUFz?=
 =?utf-8?B?SVFJS3E1VG9Kc0UzSkNXZW9TVm1PSkh4dmJJTDdoOFgvdWh1VU9VMEFTbXAx?=
 =?utf-8?B?YzhpNWRXQlc1czRYQy9tUTF2TzJKenJNWnFVOW1UU3VweGtKZDJSejNiTVZW?=
 =?utf-8?B?TVI3MWx2dFkrQVgxek1DUHNZV3VOQ2VnMXMzUG0rczVaTWQ0MHlrQktORlFN?=
 =?utf-8?B?RnpVK1JDOERUYWUwbnYzSGlLZHpid08wRm5BREZ2Tmg1bmcvMGZ1TzZhVlp2?=
 =?utf-8?B?MVRBNldWOFpYbCt4b0JEVW90U295UnJ2U1lTUi9lMzRIRDBrOU1kckJPbk1r?=
 =?utf-8?B?b1pRczhJR0NqNnB5RnAvOVZ0Vi9yRDBMdzg1b3NYcjc1UkJVdXBlODdsQ0dP?=
 =?utf-8?B?ZlE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7706bb25-6a2d-4cfa-276c-08de38c15f8d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 14:27:11.8363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e97n8wmhtRT46Trn0KgUkULLlJcpo31EhH5tggt6uNUko/QoW8MPlskKz8Y+yj35GHJr10VR6yZohWinU0YEkqos4mZjxVCecMjl0QufC8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7036

On 11/12/2025 1:34 pm, Nicola Vetrini wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>
> These jobs should not run in regular scans, but only in xen-project/people
> repositories and branches to speed up pipeline execution.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This should alleviate some of the recent delays of the ECLAIR pipelines
> ---
>  automation/gitlab-ci/analyze.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index 5ddfe37903..88bc42f5c3 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -52,6 +52,8 @@ eclair-x86_64-testing:
>    tags:
>      - eclair-analysis-testing
>    rules:
> +    - if: $CI_PROJECT_PATH !~ /^xen-project\/people/.*$/
> +      when: never
>      - if: $ECLAIR_TESTING
>        when: always
>      - !reference [.eclair-analysis:triggered, rules]
> @@ -110,6 +112,8 @@ eclair-ARM64-testing:
>    tags:
>      - eclair-analysis-testing
>    rules:
> +    - if: $CI_PROJECT_PATH !~ /^xen-project\/people/.*$/
> +      when: never
>      - if: $ECLAIR_TESTING
>        when: always
>      - !reference [.eclair-analysis:triggered, rules]

Thanks for the patch, but Gitlab thinks there's a syntax error.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2209479095

The / after people needs escaping, like it's done elsewhere.  The result is:

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2209482948

which is looking far more healthy.

With that fixed, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
and I'll be taking this fairly promptly.

