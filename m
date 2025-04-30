Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A44AA4E98
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 16:30:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973628.1361708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA8Rs-0006pE-MG; Wed, 30 Apr 2025 14:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973628.1361708; Wed, 30 Apr 2025 14:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA8Rs-0006mM-J2; Wed, 30 Apr 2025 14:30:08 +0000
Received: by outflank-mailman (input) for mailman id 973628;
 Wed, 30 Apr 2025 14:30:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kwm3=XQ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uA8Rr-0006go-AV
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 14:30:07 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2009::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ac71698-25cf-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 16:30:04 +0200 (CEST)
Received: from DS7PR03CA0275.namprd03.prod.outlook.com (2603:10b6:5:3ad::10)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 14:29:58 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:5:3ad:cafe::4f) by DS7PR03CA0275.outlook.office365.com
 (2603:10b6:5:3ad::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 14:29:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 14:29:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 09:29:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 09:29:57 -0500
Received: from [172.25.248.240] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Apr 2025 09:29:56 -0500
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
X-Inumbo-ID: 9ac71698-25cf-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8OiC/hs5OLtxXL5q0yFrDwVn+gB+PXb3TekhAimNRHyK5xfyVP3999yzEmFRAnKFrttKrnwcCNq9zQakvSCLBFJf2Y5C/JeduL3zJFUQqVfJDSANL3/6Xsmt9GMLowF7JfwjNQ5bmL3f/TRrR+eiSOwzn1g3d6SpJ6y6FQEWkkxa2RHo2mgSEwrLihnmCuw6tB7IguDsbzq0tNNfCEqJY6syiaQnQ1Etgp4Vw5ALdbG506ab3b5Bzg+C8FafZzGyStOU9lgsuqZs+uRwkuyUYdHe4L3bJUeG72UECZf4GWcpLP/2E+aqzhGQqycEhKGZypl/nlyNubvsQyDa/x6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nj4RH+eKlAWDYAxghd5E9mS1Ai32Wi5A5IgSdoR0AMg=;
 b=hUZZF2azFXkCTbqbCS9v59sisWqrmIorXm7OlBoTgSn+SsgAR0gC7HyKYtKCh02RgmQ0LtjJWmX8MQGLmdbUhivBAvqiD7eJ/KYd0FQAdQeEaCUeGgM7PyHauIYmg65WTIKfP40165nYlJnVKDk419SUd+Xe9CBZfxxmLV1MDz7vEx6wLn9dic5I2HFKy8HB0venfU0QlDVINMFEGJelgxI/6C14Efee3B1gmBt59ABYv6gEogu+Q8A2IYFXAI8lzHTpPgVo6FnNOFBzxwIuPu5K/1cHPf9bIEDLgi9dg4h9CP2WCKX1TAYEvDSljN9pO4sjzaT6s7n+FG3VxpK0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=invisiblethingslab.com
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nj4RH+eKlAWDYAxghd5E9mS1Ai32Wi5A5IgSdoR0AMg=;
 b=v0McVZR9FqNJFPClKNG5XotXGjiYcUAw52D+HT65xVYOznBxwT3lSjMUGWTcVeoc6GthnCllnMwMRdE7K2JO08MPbNV++7fkzoFKkH/clj/6Jsxe5MfrCQla5FsUmjVaLJ8U5PoMc4zO3WoL8u21mWn5Sz+nZvyfzpVX7qt6yek=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <641aef98-5dde-4618-9fa4-7ccfa2e1989d@amd.com>
Date: Wed, 30 Apr 2025 10:29:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NULL pointer dereference in xenbus_thread->...
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
CC: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
References: <ZO0WrR5J0xuwDIxW@mail-itl> <ZTUuRj6e5x5xFVqb@mail-itl>
 <ZgGjf3hpLHXXtb8z@mail-itl> <0f8c0e27-e60d-4e64-bc8a-6cb407c67ab2@xen.org>
 <ZlpTwbmDjNLkCNgH@mail-itl> <aAjgGKRAW95BnTiK@mail-itl>
 <CAKf6xpu7=2O96XK88WL02c-4po3qX-4P4i=2JbD2=o2JcM+_EQ@mail.gmail.com>
 <aBIBy5eQPypM_UbJ@mail-itl>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <aBIBy5eQPypM_UbJ@mail-itl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: e7429879-f022-430f-9ee7-08dd87f37be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWVRT09zNEdwWGRoS3Jvekw2UmdSQXdRZVpsWFZUYVFkanc3aVVUS0hDVHla?=
 =?utf-8?B?T3dnMVVxTGhWajNOTjR4Qjd6SUtuUUVLbGx1dklNa2pFQ1NGMDhPM1NITWRT?=
 =?utf-8?B?ZkFtUVZ3ekFBOGZWVXFSM21nQnZ6eGtGb2ZiWDJVazlmWWJzSFcrOXZ6SWxE?=
 =?utf-8?B?NWFFV3drQ3lVZlNEN0R4MzZCTThCSWx0VWpvaTM2enc4S2dCSkdXSHlKSmp0?=
 =?utf-8?B?T1dJdzZ3UlBHV2hDNXNvT1Z6UEQxUlErL1N3a0psZysyaHovdlQ3Zzg2eUlL?=
 =?utf-8?B?VUFST0xQcVV6bEFrTHUvVWpkb25aRmRmRnlCOFp1cE9qMkxjYXRxWTJkQzk3?=
 =?utf-8?B?V29hQmpveXh4aE9JU29SUWNQZXpUZ1pBS3NzYlVBbFl2bTRSakhmM244Z2hM?=
 =?utf-8?B?aTd5VXpNb05mZitkNk9FVDBzZEdKQlR3cGliTTlsWmxLVkNPQnJMWnlJNXc0?=
 =?utf-8?B?MW5razdNRi9Ob3J1dkpUU0M1WU1FTUMrS050NXZ4aUhMcVd6THdMUURiM051?=
 =?utf-8?B?MDJ3bWFSR0greWI4bFlyTEQwWXRtbHB1WHRmZjcvTTJKREdmWitnbEltYTJL?=
 =?utf-8?B?VnVrOUVXcWlNOWZRSmVsc3lEbUFrQW9JQ3dmTU1hNmdBSURFVGxQNmRjNWpW?=
 =?utf-8?B?QTZiN0doWFNqKzVRV0RpYStIbFd2U1RsdGgwOXE5aGFrMnRuYjdtM2xJSitU?=
 =?utf-8?B?MnlBZHAreG1QYnUyeHhLbEZxemcyNTcrYTllUFIyVWpTSTJwZm9SODBzU3Iw?=
 =?utf-8?B?enBpQU9RZVMwMS9QcGdxN3FuQlpFSHZsc2c1VEp6TnVDVlQ4UnloTXloOGMw?=
 =?utf-8?B?RkI5R1RZd0VGRFNFcUZYM0pBRlJwRFppR0JiL3ppN2dFU3o1d29oeldidGha?=
 =?utf-8?B?NUdDdCsvRW9Nd05hb2dlYnp1QkM5OVpEMEJCWm9BbnlrVzM5SjhMTm1UU2Za?=
 =?utf-8?B?WStUdjNBQmtQeWh3Q3RKdWlZT1JrR3lJWk1Bd0gzeWxoSURYQjdBaFFXdnZa?=
 =?utf-8?B?a3gvR1lFVnJyNHYvZWk2NWp6S2tFbS9xYlZWNFNGamtJb3VVSlFLeXdtNFoy?=
 =?utf-8?B?YXNNNlZnWktGQzNadEdCM2RxR1UzVFV1OUhpcWdNeTlyM3A3TmxhN2QwMDBQ?=
 =?utf-8?B?c0pRNUpidXRMMWVpNkZIQTNVTms1b1FpYW5laUs3ZDRGMWxNMnJsK0ppWTVS?=
 =?utf-8?B?anI1bzZjUUVLVnNaeWdWaDNtZHJZb1U4VEM3Uk1jaHVaWDROdDVmR25EWU9j?=
 =?utf-8?B?L0pIVnpXdm5VWlhqTEJNSWl1UkRXSUs0RlFDQ1FVQmsybDJtZXlldGFJUkRQ?=
 =?utf-8?B?TzBaaFFDNHU3Zm8rV01ZMElPTVc3T2svQlpqdDBydFVITThTcWtUYzdCQnNy?=
 =?utf-8?B?enlwK0JaZElvMjAyKzFEUHFkdDhEKytuTndSU3BJeUZZMzBPZWxRbHZVVDNY?=
 =?utf-8?B?c21xNURBZDI0Mk03UUNreDVmRUxDNmFERjZaeFhoOHZIaTB5SWFXU3p1azBI?=
 =?utf-8?B?Z0JFVnQyWFd5cEVpUTNSay9wM04vUFhhSXdkaldiVUVUL0Y4VmtGZVM2c09a?=
 =?utf-8?B?UUVSMmUvbjRvNER5ZFpVc1RhdGloTWg3ZENxaDd5ejd2dHFDbHByNzI2TW1J?=
 =?utf-8?B?TDJ1S0JWclN3dVVaMWxLM3oyL2xQZUs3OXE3UzJiUEp3UWNWWnRUTU41bVJD?=
 =?utf-8?B?ejhZSDZsYUliSFRGdkxmN1lMSnArZ3BSQzJUVExKSkhaR2FUUHV2MGZYRDRw?=
 =?utf-8?B?R1NySmtCelF5ckdvT0swQmFPQ29xem1GQ1pESmxGMjM1RDBGaGxpUnJxOHBS?=
 =?utf-8?B?U0wvWXNoemdTOVBXZ1hTcWJtaXBPcExRNFdOSHdUZ3hFUW9ia1UzWGE4M2gy?=
 =?utf-8?B?d0Zpb1gyNzBPU1VxNjlPOWFpK1hRME40bHFyb0M4NzhRRFBMdDZqeTNCL3Vx?=
 =?utf-8?B?NWVVL1V2S0lXdkZPMmEvZURYOXRqalE5TmVRRWU2V1JDSnBPNFJ1aWxCellj?=
 =?utf-8?B?UDIxUzRKcGZmRDdxSHlMZ3RtRmlSTHMzUGxhZ2ZRS1g2UWtyRGFyVGRjM21m?=
 =?utf-8?B?WFhYOURkUFJBQkhZVmpPeG8zM2R0eEY1NDBIZz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 14:29:58.0470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7429879-f022-430f-9ee7-08dd87f37be5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229

On 2025-04-30 06:56, Marek Marczykowski-Górecki wrote:
> On Tue, Apr 29, 2025 at 08:59:45PM -0400, Jason Andryuk wrote:
>> Hi Marek,
>>
>> On Wed, Apr 23, 2025 at 8:42 AM Marek Marczykowski-Górecki
>> <marmarek@invisiblethingslab.com> wrote:

>>> I've got some more report confirming it's still happening on Linux
>>> 6.12.18. Is there anything I can do to help fixing this? Maybe ask users
>>> to enable some extra logging?
>>
>> Have you been able to capture a crash with debug symbols and run it
>> through scripts/decode_stacktrace.sh?
> 
> Not really, as I don't have debug symbols for this kernel. And I can't
> reliably reproduce it myself (for me it happens about once in a
> month...). I can try reproducing debug symbols, theoretically I should
> have all ingredients for it.
> 
>> I'm curious what process_msg+0x18e/0x2f0 is.  process_writes() has a
>> direct call to wake_up(), but process_msg() calling req->cb(req) may
>> be xs_wake_up() which is a thin wrapper over wake_up().
> 
> There is a code dump in the crash message, does it help?

That's a little deeper in the call chain.  If you have a vmlinux or 
bzImage with a matching stacktrace, that would work to look up the 
address in the disassembly.  So if you don't have a matching pair, maybe 
try to catch it the next time.

>> They make me wonder if req has been free()ed and at least partially
>> zero-ed, but it still has wake_up() called.  The call stack here is
>> reminiscent of the one here
>> https://lore.kernel.org/xen-devel/Z_lJTyVipJJEpWg2@mail-itl/ and the
>> unexpected value there is 0.
> 
> That's interesting idea, the one above I've seen only on 6.15-rc1 (and
> no latter rc). But maybe?

I am guessing, so I could be wrong.  NULL pointer and unexpected zero 
value are both 0 at least.  Also Whonix looks like it may use 
init_on_free=1 to zero memory at free time.

Regards,
Jason

