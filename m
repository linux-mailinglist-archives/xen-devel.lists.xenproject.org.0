Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28642C8A257
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 15:05:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172850.1497943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOG98-0006hf-48; Wed, 26 Nov 2025 14:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172850.1497943; Wed, 26 Nov 2025 14:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOG98-0006g5-0Z; Wed, 26 Nov 2025 14:05:26 +0000
Received: by outflank-mailman (input) for mailman id 1172850;
 Wed, 26 Nov 2025 14:05:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSqE=6C=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOG96-0006fy-21
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 14:05:24 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2bd846e-cad0-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 15:05:23 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM8PR03MB6216.namprd03.prod.outlook.com (2603:10b6:8:27::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.12; Wed, 26 Nov 2025 14:05:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 14:05:18 +0000
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
X-Inumbo-ID: f2bd846e-cad0-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsqFfkzrm082+uF7ucepYiB3BNvVDuDFFNqojioEtZ5QFzs80ph8NVTW0scbU5VKolPeV2rBGxfHHXbDsmQn6hgRS/RZxm91PykekiSMqneWiwiZsR5M/v/wh/vjipqtKvqi1GSBP2yRbI/AEETxcpC4Pb0LECFtAUCQFSOFUofjyI5ToeTn0FrAxjxrSnY98CpWI+b9A/EJV96MUvvt6/HmaEfAlxthjyJ8Fd0UfGcnobOTQXChcuh6InPnLYkY7vcKyMcM/Xr/dPcCaXCAUd4euW4GndpSm2lGwhe7N8UgeGSOvT3DBrlqil4ZtgxvcVJhq3GiAvJitvY+ZTfjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZfwpcTQurA766ntXImfDf3eH9Y0z6qHEQfGaKSaKkE=;
 b=eTiTxLETmo83mNFBLy7ltzGzVmeenIbQ2qeP1PJt7iuHl9GQehEsyZfWhAE6nGy52wwdKkp0P7rVuZLF4NRQYZM/P8XxfuENlsl+r5Nxe1GuwCJxU9xClgO8CYheKJInoJ3/Q5iv5L1KlnwpnPb/IedFebwTsUnHSf+JAY5tA258DQcXTA0Gj4ub7KNfmM2G50KUim93+4PDDoVIyCGZoejwnXsjzoW9OhhS8BINmGP/qZtHmov8SGN584CjR3OpAjFyFoG/fndZjl0/X8uQUirtRBkoM2S+oriIkikJ5PyYxivWEbwJIuU1eiCBqYbQV9GyBxReeP7ZGbVEHTXg/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZfwpcTQurA766ntXImfDf3eH9Y0z6qHEQfGaKSaKkE=;
 b=TZsd6joFXZ2AZIt3dscMBSGRwUaLYOcA6JO1xJe/R+OTzXA6PWsf8HgiNP8/btFY4sbGqqtuR6CtpoyoZPDXdytL8WVwzEGk1tGUrzXmXFyMssh/t66C1etS9D1d4qWblDC071GFEdRJopOl0lgk/QcKIEJFRoK0aBGx4rKNEH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <afb03d32-c723-457f-8a29-fd2f6c9c69f2@citrix.com>
Date: Wed, 26 Nov 2025 14:05:15 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] x86: move arch_generic_hweightl() to arch-specific
 library
To: Jan Beulich <jbeulich@suse.com>
References: <245fbc16-924b-4fd9-8cbc-a539b569edac@suse.com>
 <76f2d454-ee2b-4aba-a6e5-974b1b2dfbb3@suse.com>
 <859d60ce-165d-416f-a1f1-89ba11de2839@citrix.com>
 <3e6d9b74-f606-4774-8767-c71391b9c741@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <3e6d9b74-f606-4774-8767-c71391b9c741@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM8PR03MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: d75617ad-97ba-4598-3a7a-08de2cf4d4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0l2ZXJQYmRjZTNMbmNCcmFuUWEvbE9PS28zV1o1RnVVWS9rM3dwV2x6SWFM?=
 =?utf-8?B?dmpzYkQxSlZxSDY5aVgyc0tpTUhsM1o5SUd5Z2IwdTJsd0t0SFcxWGxCNG9T?=
 =?utf-8?B?QnBUWkFtam5la2pWZjA0Ulc1Y2o5WElMYUFHcnozTFZHRGtBNmIxNDBkK0Ru?=
 =?utf-8?B?YlUwdDFIKzZxMHFsTEN1WFpZZDFwbUErazMwWjRyUTJ2ZWoyS0s5bXlyYjhu?=
 =?utf-8?B?a25meERrUFBtK3VVdTNkKzlMQnE5WlNtRFJENGM1YURod2lxdlRoK3EvRm5V?=
 =?utf-8?B?dHBXbE1MZjhIdDdUaXVJbVVkUnRJRTMzTU5mSHlXeThQQ2QvcC9nOGJYVlZO?=
 =?utf-8?B?cUxSUkRrZkI0dlptY2VKdkc5dEpubVhPWmd4ZUViZ29mSUwxaUppRHFEbnZn?=
 =?utf-8?B?dmFGZ1h4VXozZDdteTBTSjNqeE8wNUlVcUN5NjU0VHVEek5hZUsrc3NKMHB5?=
 =?utf-8?B?dDNHZ2IyM3JXdXRQeDRqSFFINlNieVUzNll0WGd5K2MyUEw5elE4OXpzdXcw?=
 =?utf-8?B?VXpFdDY3VGx2cGxYNXVvTUNRblFFKzNTZFMrVWxFdmVFbjAyZ1BOYldWWkJp?=
 =?utf-8?B?Uk0vbE1OdkYvY25kOEdrN2g4M0V0a3pqWnRzcG1VVE5LRnlXV2dsOVhZL2xY?=
 =?utf-8?B?OG12YldqdkQyTG1KbkE1czl0RWZlbEZZWG0rU3Ria3pBQW9QTThSeUlxNVFa?=
 =?utf-8?B?UHFLM0ExdG1semxIOSt2S1lUODJFMWd1U3FxTDQxVUI2TTRRWWc4YmtiRC91?=
 =?utf-8?B?SXhkenRBdzl0enhHRXNUWlk0YnQzK2VjOHdObHFBWUV6US93aGRQNlNtNkhD?=
 =?utf-8?B?a2ptOXNzNXNOdEVRRTNNcW9Qc0hEV3g3QUVEK2JUaXdzZTJQa3lUSDdZUk1R?=
 =?utf-8?B?K3ZiSzdDb0xFNlJqQUZNWkNDMURrSDhsaDFPc0pJb2poK2J3WUZmWHlPbFBE?=
 =?utf-8?B?NlI1L1VROEcrbjc2dWZYbm5nVXVnUFBzdGI3SDczaEtSSGZaQ29XWTYvMUZh?=
 =?utf-8?B?UktEYmQ0U1pvTjlYakhDZ3B4cXJHd0RmNkxHcVpnNGFwcHZ1ei8vSnl3UXZx?=
 =?utf-8?B?OEZVWndpTlFrNVUzZ0VuVXNqcWs2Tjh0L29PTHJ1cDJ3dGMvMi9sTXBjdEhu?=
 =?utf-8?B?NWUraEdvUk9vM3QwZklpdWpKdVZkeUNlK0RNZy90YnYrZ3h6TVR0OUcxbENZ?=
 =?utf-8?B?NDZvcHBIVVhwTS83azYyMUt3cW9xUXViNStTOFIrSGZJbDdMcXlkU25GaE45?=
 =?utf-8?B?cS9CMnV5Nmh6ZmhsL2ZtVllmTmQxYVNKWVQ4djM1WlFCQ3N3cHVyWW52NDg2?=
 =?utf-8?B?djNJaVp3OEN2aXB3b3Q4REd3YXRHNXlyaXQzYktzaHh5VXVqTmYzTklTbWJz?=
 =?utf-8?B?T3JPK293NDNtdURkQWp3VTZ2aVpnNDN5TWFUNm5waVcwMUdwcUxWNW9xRFVQ?=
 =?utf-8?B?cnBxTmhPYlVoc3Z6Uis3N2o1clBTSXVpNFVVL2FRNldhZlNPbzZMNFg3ZVpZ?=
 =?utf-8?B?Zks5ZE8vaEd0eDBrKytCNG1sS3p3SUJzMUtSL3I0d3pmTnJydXFSZjcyUDRs?=
 =?utf-8?B?cUh0N2dsVUlxQmJvMXMwZUJKQS9lcHhjQktucmRoZFRGL1FXTkdJTjFPNXIr?=
 =?utf-8?B?U2ZnRFVBOVlBbTdJMHhaMFBHaEFyVWkvZVFSU0g3SVZzbjdQRFVydmJBMDFY?=
 =?utf-8?B?bU1ocVljV0h1QjB0OVR1d2lXNjB3ZWQvZGNHUm9NdUd1OU43R3lldU9FZ01u?=
 =?utf-8?B?VFp0clU0WkVzY1lrRzNFTHoyTzF3NHRxTjk5K3k5Z09XbWVRcWxWeG1mbEtH?=
 =?utf-8?B?U2hFeXl4ME1MK3dRZzdaRENTY2tQbW1MdlhEa3VRNjNIbGFtL1I4LzFZWmcx?=
 =?utf-8?B?ZnkyVzJLQkg1QkJqYnA5S0l4NjVHYnM1V2Nsdmp0T1J4WlM3MDFyTjdzVXNH?=
 =?utf-8?Q?ZpsM8NsnHVmwWNlTGitPFT3FwXnY8idI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWhPR1U2WEIzeFlEWmhzQnNuRXpSbis3dVh6VXZ6QWh0RjRtWXJNVGR6bVNG?=
 =?utf-8?B?aTRLK0ZrSmFvUUxreG54YngrT2YwZ3diRXM3bWk5anV6Z0VZY3VaSGt1MVdz?=
 =?utf-8?B?Q2hTbURRTEhXVEpEYjd3amRKbGhQYVUxb3hwZWRZejZucWlaYVdGWWVCTHph?=
 =?utf-8?B?cC83OEUyT3hUQWpRMXJibXRaeEd3empGMEhpbUVrZE5vbWxobHVMaDB1WVVG?=
 =?utf-8?B?NmFxbnFsUGlGSzBWQi9FczMzcExPYXF0eStNWXoxWEJ6My9sY0VqUEhNMWtn?=
 =?utf-8?B?TStac1cySlZrdTNEMjdOMEI3Y0FCdHRhYXJZUWFoRHI2ZVF0QW04ZFlVWHRK?=
 =?utf-8?B?M2hWa0FEeHA3U1JzTWtncVYvdkxXeGRRaDJJLzM3SUR1T0IvQ0w2VWl0dXpu?=
 =?utf-8?B?enp1SGtPbTA0cy9QWCsyNThJRExML1RkSW5GTmhOYlhwZGxybktPRXZaS3NZ?=
 =?utf-8?B?WmJuQkE2blYrdlE5bU41djlhUHFhd2FVeEFnM0ROVURXWVVyWEFQUjdIWno2?=
 =?utf-8?B?elNCQjFmWjRnYU12VExIZXNxUzF3TUxNNm5NK1N4a1dFZ21uRFNvRjJZWWpD?=
 =?utf-8?B?Zm56b3Q5aWpqNkFISWNSSkhUU3NaTnhqMW9mWE9iZmVhRzlUaXJaWXJrQzZp?=
 =?utf-8?B?ODRuQXJ6a3dVbTlHSENSWmpvK0N3Lys3SDd5cU1QWEN6Rm93VzFxMEEzMGpY?=
 =?utf-8?B?WDduREVRUmw0bC9GdjJiRU9FQUVqWkxhOEJsS2p6M29UdWpjSk9mL3Fyc3ZK?=
 =?utf-8?B?VnN3V3h6MWxMRVcyMTZCM1U5U1VkT0s0SkpFdFllR05CZkdyRmtEdXgyMzJz?=
 =?utf-8?B?SkpXUnQyZkhpVUliZ2U3Q2ZER2RrS2VURlFsUy9LWS9wZ0xJbEhwNXMrQ0J4?=
 =?utf-8?B?Q2pkWnlBQXhyYWZGRm93RDc5Rk1rc1RZYVo3RTE4cGVpOHBLN2IyZklGVlk2?=
 =?utf-8?B?UkdLNlZadm96YUUxMU5yRnJTU1g3ZXZaVUJ2bUZlY1pCenA3dlFYZlJWb0li?=
 =?utf-8?B?K1NnUWRxcTNkNWhRWmlaSlRZZHlvbU9vMHdhSmhKTGJpUGZXVWRKbEdlSmha?=
 =?utf-8?B?MkdhelJVNGJXMDlERUVJSWJNWnBnOEEyN29GbU9tSzRqY0JWRUt0dlVmQXYz?=
 =?utf-8?B?R1FuYjhDL003TUdvZ002L08yQmNzbjgrcnR2UzRRRXc3ZnpVdGF0N2dLZUhG?=
 =?utf-8?B?N0h5Yi9RRVQvNHAvbnFtMHF5Ti8ralZNa3NuMjljTTN6RnN2cW9sOUZqUUV3?=
 =?utf-8?B?TklWeHhqaFc4djEzVHpwMzNhNUxWMTNydzZDUnRUT1d4RGdyZGpGVE5vYUt1?=
 =?utf-8?B?eFNmWFk0VHRYeS8waVlyYjdWTG54cVZHTHhiMGJXbkFQY29oMWlwUVBYZC8y?=
 =?utf-8?B?OHlQbEhkYks5ZW1Pd2VBcWVpY0ViZzhaYVFBUHdDelQ0cnhYUWY1c3NwTmZT?=
 =?utf-8?B?QWJzZERCbWhTQ2FjNkZTaGRLalQ3Q3Q4eE00RDRqTGhBSDJOLytFM3FYQ2lB?=
 =?utf-8?B?OFIydDRKenJmNzhLblMzTS9DV3hZaGJHSHVNYVJjbjZreGV5dEtIbkJOWUNa?=
 =?utf-8?B?TTFlcnZpdjFySGtVdGZERmpnUEFFRkhpSUJHcHl3aWVsdVdsSFlQZ21WcXZW?=
 =?utf-8?B?WGk4V3dQNVkrVUt2V1Z1N3lMV0RmWFZPVCtRL3JKV0wrM1c1MlNnMTN3blUz?=
 =?utf-8?B?N1hPSC9EZDNUbG93Z01XQk1YK1FCM0pTblZNSTB3bGpnVWJGaGhDUk51Y3Yw?=
 =?utf-8?B?U0FSdHhJVis4SjB2SlBjWFl6aENRN1pucHZrc1I2RVYxelk3YkVzWDU4OFN1?=
 =?utf-8?B?ek1MeUloRFV4YmR5Q2U2ZDJqSk1WdjByZzAwTUp4YWNUWUlmVnpURDFwQUxY?=
 =?utf-8?B?L0prRDRlbGVSTWJWamVVakZScEc2MkdqQ2h0Skx1T3UvMVNHQ3FFRE0wNHR1?=
 =?utf-8?B?d2U4ampoeVhuMXlYM0hJSWlFM1RtZ1MyRFZIZkdTcDd5dVRxRERROG1EcUFC?=
 =?utf-8?B?alZwV0N0WGRhQUYzcDNrTUszbU1EUllDQkdWMzl1NFZDejJqZXdzcy9keWJq?=
 =?utf-8?B?TmpnM2pkQmE1UW13SGthcEE4QXo1MGpTdU1qUzF4YmlJZHNGNis5NGl1U1Q4?=
 =?utf-8?B?MGI4ZFl5eTY0bkozY1pQSGwzNzM3WUdweDc2QkJuaUNjUnRPK1pYMFhKSldw?=
 =?utf-8?B?SkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d75617ad-97ba-4598-3a7a-08de2cf4d4cd
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:05:18.8495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpTBlfmFu0nHb+aW09Ua3mentyXUjzSrWQDlHVQZxexBqPNlXJPx6RGsqPpXx+LJrK/W2wC/sLnHh3gZJ4iyit39ViRjqQ2G9Zi1pyYDKf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6216

On 26/11/2025 1:58 pm, Jan Beulich wrote:
> On 26.11.2025 14:51, Andrew Cooper wrote:
>> On 26/11/2025 1:24 pm, Jan Beulich wrote:
>>> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
>>> index 16368a498bb7..a0ee050c931b 100644
>>> --- a/xen/arch/x86/arch.mk
>>> +++ b/xen/arch/x86/arch.mk
>>> @@ -3,6 +3,8 @@
>>>  
>>>  export XEN_IMG_OFFSET := 0x200000
>>>  
>>> +ALL_LIBS-y += arch/x86/lib/lib.a
>>> +
>> Oh, I'd realised it was this easy, I'd have done so straight away when
>> adding x86's custom arch_generic_hweightl().
>>
>> I assumed it was going to be more complicated getting the order of the
>> arch specific lib correct with the generic lib.
>>
>> More concretely.  Given an x86 lib, we should move things like
>> arch/x86/memcpy.S to it.
>>
>> Therefore, when we have common/lib.a and arch/lib.a, do we guarantee to
>> have arch/lib.a with higher precedence so for matching functions the
>> arch specific one guarantees to be taken?
> Not with the change above, it would need to become
>
> ALL_LIBS-y := arch/x86/lib/lib.a $(ALL_LIBS-y)
>
> to achieve that, requiring that ALL_LIBS-y won't change into a lazy-expansion
> variable. If that's okay (please confirm), I can adjust the patch.
>
> Things would be yet easier if every arch had a lib/lib.a, as then in
> xen/Makefile we could simply have
>
> ALL_LIBS-y                := arch/$(SRCARCH)/lib/lib.a
> ALL_LIBS-y                += lib/lib.a
>
> Alternatively we could move the setting of ALL_LIBS-y in xen/Makefile to
> after the arch/$(SRCARCH)/arch.mk inclusion. I'd be a little wary of that,
> though, as it would then be different from ALL_OBJS-y.

I think this would be better handled by common code.

Arches are going to want a lib.a eventually.  ARM even has
arch/arm/arm{32,64}/lib/ but like x86 they're just simple obj-y += at
the moment.

However, arches shouldn't be forced to make an empty one simply to build.

Does this work:

ALL_LIBS-y                := $(wildcard arch/$(SRCARCH)/lib/lib.a)
ALL_LIBS-y                += lib/lib.a

?  If so, I think it's the nicest option.

~Andrew

