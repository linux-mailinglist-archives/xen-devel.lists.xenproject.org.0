Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA47A138F8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 12:29:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873516.1284493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYO47-0008HV-K6; Thu, 16 Jan 2025 11:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873516.1284493; Thu, 16 Jan 2025 11:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYO47-0008FR-FU; Thu, 16 Jan 2025 11:29:35 +0000
Received: by outflank-mailman (input) for mailman id 873516;
 Thu, 16 Jan 2025 11:29:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dy9H=UI=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1tYO46-0008FL-9j
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 11:29:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [2a01:111:f403:2613::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 282029ff-d3fd-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 12:29:33 +0100 (CET)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AM9PR03MB7541.eurprd03.prod.outlook.com (2603:10a6:20b:410::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 11:29:30 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 11:29:30 +0000
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
X-Inumbo-ID: 282029ff-d3fd-11ef-a0e2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcqdOgJ7kZ1glDYlQcohnnwArXlIDygMWwXA5415niZx7gM/CE80cK1h2eabMgibGZOOxt2LQvGlIsc6Jl7rsrEIDJmIl3j2HGT+G/FjYy+ZdhSwcQ47gpDau1JOuJf/MOEbROE+jHGz8QfVgxwPYQPIaXPcYOXb0L2AhZEq8gv+S+Gui7kKwXDvgzw0HhOmpnO6gD0hqR8OMI7QHH/77aS44+UKIO03URdd6GIEGxwEASC/1Qhtz7tCm/Ijbe2CBjDlnVItoicbm91eWdMpu8B5jqzrbw4IZ00c1sdV6oildmprg58guFmWU0HSzQ9PhuxdwV60QwbqYN3BqGy2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzJcRdDFcNa/JHdo6ET0bo0EE20NiRzFULe0NfJ3fVU=;
 b=xlVvv/euiOMS7BFI0OBtnEb91sSd1UXmdkUzuh+KFH/tExkwSrQBpMGBFptBHhkpkA5CJloR1m5/ibeg63Bgiyq1111pU5BWkE9dxDcwPoAvqCIQjzIw13U5Vho18tJFYjFIOAgP2zQwzpG4WaLt4Gg+5YYu58lZ6ut1RdDC+c8Pj1QidkV2FE1RPV+LWs3MgUNC3Anp/GLwMSX39mfxGLUzJPBFTonUR5kTj8LVAkBQyLa1M7AkwPB2E1rONyei4BJIu49V4VhndKF33h2gBmUR743PsfQWS4m80pcNsBBMB9oL9+y4cgFigH5N/0yd8CrijQtqUCdk56eWbv96wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzJcRdDFcNa/JHdo6ET0bo0EE20NiRzFULe0NfJ3fVU=;
 b=p+uynT1tMmwdRwqCXxbfdayIzz6sjkFrU32ixyms4j5GDcjrzCrYTEAz8pnb+/zMVsSHqkGnRtIsskbpSlcUMg0hNqVjnOloKwhpI7gYs6jmv1q7dArjbGvj4PJsJfbOVK3ucpiIEQY4XsNGsc7WNV3Wq7R8n0gmm15jcOtV82cHvw4XkZefBD3r/xNub/InUoaljkx46kwVx8QcvpcjciFZrNg5iAWjoyVSC7yzxL9lQcgeXdBgPyqoNw/t0I30mjBwm0rm3GgW3dU+J5c4pvnFMwzhTjwZQSP96nTRYKtiwsuaWiufiNr4xMYOdhnNvPdCuApUZXf0ZKVaV8QfRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f475354d-5df6-41a5-9928-519eaf4eb7b3@epam.com>
Date: Thu, 16 Jan 2025 13:29:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20241230063051.3332332-1-Sergiy_Kibrik@epam.com>
 <c8684340-33f9-41d3-94e4-77ee3bc18306@suse.com>
 <CABfawhk4pzA9bSMzJDX7ZwaYC50dfn_ntCnk=bePmiKCpDnN3w@mail.gmail.com>
 <8fc662a1-4c74-4f97-a116-3bc5a0b71cf1@suse.com>
 <CABfawhkyg+TVB-uc04OefDhOXEfeQyQypW6gL4qsYO3ZrDxYfQ@mail.gmail.com>
 <a0c50fb6-516a-4e0e-8c3b-49c4dbc7b863@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <a0c50fb6-516a-4e0e-8c3b-49c4dbc7b863@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0134.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::13) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AM9PR03MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb02eae-c624-4291-60a4-08dd36210b16
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2wwWUtCSlFzNFdEbWtEQmI2UVpBc0lDci9MaWlEWW12Ym5QMHM0TnNUdE9E?=
 =?utf-8?B?OFkvUG1iZ2lIdW84emlXR2dTaUhUdkQxTGFsR2JWeFdHbE5jNUk1RXZPTXYz?=
 =?utf-8?B?WW1JUmthQ3ptNVdPeVpTTnlwTkJ1N0VOYkNZQVBCNkJKNTJOQWNtMTVpS3FD?=
 =?utf-8?B?QmpRbEI2N2ZsWnpzTmxGbWU1R1BIdXQzYStoMmc4Q25jUkdSYzlLWXlLZmVB?=
 =?utf-8?B?VEtxZ0RHVFo3UVRKRVhQNFdyT1VjN1d5alZRck1OdFU2T1lWZSsyOWxET3Jr?=
 =?utf-8?B?dkNrczB3TlFqRHlDdGh2aUlCZHE3VCtXOFlUa3ZtYW5ucytFNENqWW1wdG1B?=
 =?utf-8?B?NENHbVgwbWVsWFJKa3Z1VGhUa3NqeVBGMFhlMzhKY0pkQWlLRlNURVZqN0VR?=
 =?utf-8?B?dUlZUmljU0U2L1ZucnZRUjN2NGZpV2RvVHpRMXA3MzlVTWFNcDAyQXhoMXh0?=
 =?utf-8?B?NTFTSERPTTJRa1dBZmRDUVlNajAzS2FrZXBhTjRZamVoUkE0TVNOVWFzUVBp?=
 =?utf-8?B?OWxqK0xXZFBzVzdIMTVJN1N3Zml0KzFuck9xTy9OSktSNmFDL1FFRklHUXln?=
 =?utf-8?B?dHJBZ29mYmQ3U2JUUi9Ocm5heFRYcHo0YXA1RG9Ud243WThMRms4Q3Y2Ty85?=
 =?utf-8?B?dWI5VW50R1pkdjNHWGNmOExGK2hZdFl4cmRKZG44UG5uZzFuNTZrTGFVRVcw?=
 =?utf-8?B?UkpReWEzbVUwdUFBM2NjMjAxQm16QnZNMU1RVEwzWFBBMThTZ04zakxUMlFX?=
 =?utf-8?B?QjNhaVVrQ09lSEw4Kzczcm8zT281aWpFcGxpWHNTYUFmc2xGTTNML0tHRUVD?=
 =?utf-8?B?M0R4YWJ1bTJtdmY3d2tYaUtHcUdSa3pJTDlVU0FoaWRWTFNGSVEveUFCSkQ0?=
 =?utf-8?B?dzJlM0dPNTJwWldjSnZqZkJVRUwrWHA3bG9ud0cwUlhUWFBlZGwwWTQzbktE?=
 =?utf-8?B?ckN3c0djQUFmcXlMcWlVS2RQdGllSERjSGhSQXlpTExUS3N3L3hhWTB4ZGRq?=
 =?utf-8?B?RzVQejN4UE1EZzYzTk1kZkkxdlNtZXNERlRYT0dhWVRpTSs3a0Q0MkNpdnBE?=
 =?utf-8?B?QjZiZGpIZU90MG1Nb25od1VuNUFIcjRRNEhqeFFVSC9UbGxmUElMTVFXVzVV?=
 =?utf-8?B?b29sczVwdmxOa2lFUDh2blUwWjlZTDJMWERoRTV1b1JxQ1lFNjNHMWRYcFcz?=
 =?utf-8?B?YU9yNytnSFp2VU9OOGU3aFQ4dTU3cURSbUwvbkJ1bk5yUUY2TUtCU2FucCtJ?=
 =?utf-8?B?c1JWMXBMK2VTbW4yVitXWWI5UjlzTHgzbFVRMHBxTnBZM0oyc2xKN0Fyd1lF?=
 =?utf-8?B?V3NWdWJDYTVKTXlpZkw0ZDNwTWJSNFRQaVBFTzU2VkJ0SGtLUHMxUDFnUVNL?=
 =?utf-8?B?TXJGSXdLMU9HakdsSFdvUk15cE9TbThzVjRyTVV5VkF0Mm94Q0kxZkxNaU9W?=
 =?utf-8?B?UmVLRmYvVHYyQ0VtWUtsY1BocXlIUEIydmVPeExzUmJHODJkUmlZQ1VNd3VV?=
 =?utf-8?B?RGFFeC9aN0VyQ21wMy94anVYaW1EQkx2ZjMyOHJ3NHpzNVAyYVdRWitXZ2dB?=
 =?utf-8?B?UHdxMkdXSXlTSzAyYTIwaU5QaG1sQk11MHJlYWpuV3ZaNENVMHhsN0RrN2da?=
 =?utf-8?B?eVc0ZFZLNXp1YkhXM1BOdFdOM2M4cTRnd1VndUdEMmhVVkp1NjVRMUplZlcy?=
 =?utf-8?B?eThWRWdWdnZkek9EQlhIUm5vend0VUwzRGtLTzN5VzFvOW1RM0tma3Q1KzBq?=
 =?utf-8?B?VEp6QlR4STk5SDFidkpzb0xOVVhzc0NaRDlRZHdxYW9WODhvcmZiVkNQdXlF?=
 =?utf-8?B?T3RmVU5QSGFGVjd4L3NtTS96c25qNzF5a0xvaVpHQTA0eU0rdFZqb29Ub2Mr?=
 =?utf-8?Q?eFEViyINQq/nm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am52NE5TdjhkTEZJZ1VvL3F0UDZ3Rk14dWdKdklBcVpmcVVCNEpOcWJ4SUlJ?=
 =?utf-8?B?NFY2QkhzTlU3Nk0vYVRuQjkvd05CNTVEY3JuMFVpWCtJOGQwdTNRZEZOdnhk?=
 =?utf-8?B?UzhNRkczQmsvWjA0bGVyZ3VJU1dqZ3hjQzlkZDUvSkdUWVcrcUQwWFZHWVZE?=
 =?utf-8?B?Ynd4VFdzZWtvSzJ1U1N3TmZlMXRvLzEvMk9HWml6TWkwcHZDUXlPamhHZFFm?=
 =?utf-8?B?YzRpTlpXUEx6di9VWVZXZHZHcHdobWNzUVgzbG5nYVNwSVJyVmxmN0dTTGRI?=
 =?utf-8?B?c0VINFJJeHFOL3ZYeis3aVVRWTk3dWxYcHVRNHptVDY3ZkliRnNwUnlWdlBL?=
 =?utf-8?B?RUpJRjNKY21DcGhpa255dm40aTdIQjhsdHFmdXhtYlB3TFV5UDEwYm5tRnZh?=
 =?utf-8?B?S2wrMks2T3hxNkRseGFiYWdtNzBxWHJKNHFmVzBMcXlEbjJhWHhtWllhWm5Q?=
 =?utf-8?B?L0psNUZ3TUxydGd5dmJUUUZMVEgrd0cyOEZWT3FDOTdXeDFSTFlwL2dMampr?=
 =?utf-8?B?c2lQQmhLaERPSjFhaTQwZGJLYVJoV1pHV0lBNmduQ09OU1U3S1N0YlNKbmRi?=
 =?utf-8?B?T0tid3NHM3k0WkpTRUdoQTNwUEROWkxFRkYyODd2RHVLU1BYRDQ2ei9nRjdS?=
 =?utf-8?B?bHVRUW9aQUJEMFZSUURxVVBHaHIrY1Z3WXo2VHRSNmVvZGFHK3FNZ1R5S0wr?=
 =?utf-8?B?V1ZZTWdBSE1ZQmMvU2IvS1M3Q2poZWgrRlhqS2hYZm84YzZOVnc5d0FEMUdk?=
 =?utf-8?B?dXR3VkVjd2JYcXlnZEdBUys3VWE4bUJkR0ViQU14UkdCYnk4ckZ6aFFIalAx?=
 =?utf-8?B?VkRYV2I5aTUzM3pBOHp0QlVrYWJXVWJnSm5UU2RFUFZWMlVURnRNdXQ0eXNs?=
 =?utf-8?B?dmNwUWZOQ0dXdmY2T1BxSXJ6NkV2bGZHVENCWVJTWlFldWRaeTUrOFA3dmV5?=
 =?utf-8?B?SVdsSEpwOTMyaVVucXdXQ0lXMTBCWHZqNldCSUFCUVJxRmhHWnd6QS9UYVNP?=
 =?utf-8?B?SmJHMWRWa1NwZ3JzeDBpenJxTzZ0UW9QV2ZEY3QraUNkWng3Qjl6WWF5L0d5?=
 =?utf-8?B?N29EUlhhZHJCMGMza0xxYU8wTXVaNk0wcS8rWWE0OXhVMHY5UzdFclNRNnUw?=
 =?utf-8?B?bDl3MmN5Y2JMWDBHTkJaS1BnWC9BQXdWWWh2cTFaNWJ1VFhYWXN6VjY3clZY?=
 =?utf-8?B?eGFscG1DUWpjUktwT2VDQmNWZGZ5WmpRNFVNMDRrOUhpWDhoM0JXSGpEdFdk?=
 =?utf-8?B?N3lDYXJZNDFmNVd2bXhpUzVEcElEMkxUNWdiWFNhdXAzcjVVT0RWZktxTWs5?=
 =?utf-8?B?T3BGNFE4YmROTFZtUWZDbzNFSGlZWXBxNlRvQ202b3FrdStXSkFSdkc4R2Yy?=
 =?utf-8?B?Tlc2OVRTOHB3NmF2MmdYQ0F6WjFxajV0VUJXcWE5bFphVmtqdFM1NnBJMU85?=
 =?utf-8?B?SzlIakRRUUpSbldoQTN0elFqNS9adWl4eXdhSnRGMWJjbVo1SXVzdVk4Qzhy?=
 =?utf-8?B?UGM5MFMzb29PbVl2OWdnQTM2cUtXTWNiWlp4UjRFakE5NDIvaHcvd1VIM0No?=
 =?utf-8?B?Z3lpK0FFZDJHRjJlU3crZHhOdXJDNTEzMDJybEZtbWNuMEpOUnQ1enVQenlH?=
 =?utf-8?B?Y0xCRVhkY1orQm1JYzFNd05xNzZJZEIvR0QwVVNNUXRVY1RGN3N6YVZRdk43?=
 =?utf-8?B?VE1DUmxvaDB4QklNUFNZZmZWMmExTUI3MzVpTkwyVlRNQVhDM3p6WTNua1dP?=
 =?utf-8?B?MVh4dXFab1N3NnVuN2xZYmZVR3FKNS80ZDRCN1FGYVNZVkJFcjRNaDBENDFs?=
 =?utf-8?B?MXMxbGQxTElZUDR5VUY1eTZXb0hmMlJ2bzQ1MGtzVTFTWXMwZjFIMUIvSjM3?=
 =?utf-8?B?eHhoM2RGaTF3NEcwOUpidFdGOFQ1TjQ2Z0hXd3hEMXZmckRvYy9PdzYxMkhF?=
 =?utf-8?B?ZGdHdGlId25PSi84UGVhZTdCS2Y0VkZIZjJhdjR1bllMeHB6MXo2Q2dqM0NU?=
 =?utf-8?B?UklZZlUyU1g3RVM2M3ovWlhEL0ozWThCNW9Kd1k0SzRxRDBWT0krcWRsMnBU?=
 =?utf-8?B?ejRwZHFzNFQyTkF5bnlSL01iRS80bjlReVBqdUR1QXhOTU5rNWRaMGZUc1Jv?=
 =?utf-8?Q?CD1PJ8r3sWKvJLtU3rZLnKEBH?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb02eae-c624-4291-60a4-08dd36210b16
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 11:29:30.5465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fQhqcn1vMe4DebINJW0GKm5wMnYnSX0PRU9RIuGrm+J1lFZvE2jEqlWqcRn2gBeiiKjsDpvWG2eS6idV5yLgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7541

07.01.25 10:46, Jan Beulich:
> On 06.01.2025 19:09, Tamas K Lengyel wrote:
>> On Mon, Jan 6, 2025 at 10:10 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 06.01.2025 15:05, Tamas K Lengyel wrote:
>>>> On Mon, Jan 6, 2025 at 5:16 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>
>>>>> On 30.12.2024 07:30, Sergiy Kibrik wrote:
>>>>>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>>
>>>>>> Extend coverage of CONFIG_MEM_ACCESS option and make the build of VM events
>>>>>> and monitoring support optional.
>>>>>
>>>>> Yet doesn't this end up in things becoming misleading? Don't we rather need a
>>>>> 2nd Kconfig option, with a dependency between the two? Or alternatively a
>>>>> rename of the existing option (to describe the higher-level feature rather
>>>>> than the lower level one)? Tamas, I'm particularly interested in knowing your
>>>>> view here as well.
>>>>
>>>> Thanks Jan, I was thinking the same thing. The dependency of these
>>>> subsystems is mem_access -> monitor -> vm_event. If the goal here is
>>>> to disable all three levels the ideal way would be to have separate
>>>> kconfig options for each level. It may be a bit too fine-grained
>>>> though on ARM since there are only two types of events for monitor
>>>> (SMC & mem_access) and only the monitor uses the vm_event channel (no
>>>> mem-sharing/paging on ARM). So if doing separate kconfig for each
>>>> individual feature is an overkill I would suggest using
>>>> CONFIG_VM_EVENT that disables all three levels, including both
>>>> mem_access & smc monitor hooks.
>>>
>>> Except that "disables all three levels" doesn't work, unless the other
>>> option(s) are promptless (and selected). I'd have expected VM_EVENT to
>>> maybe have a "depends on MEM_ACCESS", whereas a "select MEM_ACCESS"
>>> wouldn't make much sense as long as MEM_ACCESS can be enabled
>>> individually (with it being unclear to me whether such a configuration
>>> is actually useful in any way).
>>
>> Not sure I follow. None of these systems make sense to enable
>> individually. Without vm_event monitor/mem_access are useless, that's
>> why I would pick CONFIG_VM_EVENT as the option on ARM to disable all
>> three levels if we don't want to start splitting it into multiple
>> kconfig options (which I think may be an overkill here).
> 
> Oh, okay, you suggest to replace MEM_ACCESS by VM_EVENT at the Kconfig
> level. That would be fine with me, so long as it's also appropriate on
> (in particular) x86. Then, if there was ever a 2nd use of mem-access,
> MEM_ACCESS could be re-introduced as a standalone option.
> 

Thanks Jan,
would it be ok to replace MEM_ACCESS with VM_EVENT everywhere at once, 
including in defconfigs and automation script etc? Or such changes would 
better be done gradually, starting with changing Kconfig only?

   -Sergiy

