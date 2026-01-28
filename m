Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM3sN84eemlS2QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 15:35:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F1DA2DBE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 15:35:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215735.1525856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl6dv-0008Ky-E1; Wed, 28 Jan 2026 14:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215735.1525856; Wed, 28 Jan 2026 14:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl6dv-0008Im-Ag; Wed, 28 Jan 2026 14:35:39 +0000
Received: by outflank-mailman (input) for mailman id 1215735;
 Wed, 28 Jan 2026 14:35:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gM1e=AB=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vl6du-0008Ic-Cg
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 14:35:38 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9afc01ca-fc56-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 15:35:36 +0100 (CET)
Received: from DM6PR07CA0132.namprd07.prod.outlook.com (2603:10b6:5:330::25)
 by LV2PR12MB5965.namprd12.prod.outlook.com (2603:10b6:408:172::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 14:35:22 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:330:cafe::c8) by DM6PR07CA0132.outlook.office365.com
 (2603:10b6:5:330::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 14:35:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 14:35:22 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 28 Jan
 2026 08:35:22 -0600
Received: from [172.23.49.162] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 28 Jan 2026 08:35:21 -0600
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
X-Inumbo-ID: 9afc01ca-fc56-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxA/2Xii0HEaj18jv2jcXYbcsSf+MC4DYE/NjR9cojO+w7AlJdDjHctH4aNRY1rkp/pttBCAyoea8Td9loM5zxg87CLPE1i3hQK/uTiSUH/knRfZ5gn37C1aKEFxG8teDgjYBzp9Td5+DylCMdyUJgN7uVdJ77YddhjcsbrQLgitc7vT3V2EKH/rYB4WL+k+XND2beee0UPnkBM2QXilRi+JNEie7kdNMAw5AQUuhEbiqkoFtz5NzTMMF03m2h1qVh0p6AIIGI3MN1Sg4Ns5ht4a0J5b8WumAnMd0N5iucx4Qk25NjW/L6bODv/xo2yf2QZRU85pdk/uucIgA/rIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHu8Cz4NJZCZKEg8BY5ysWNTXUrzN9kwI/SmKpiBfws=;
 b=lqlnUk9NBeQqw3Id4YkXMLTBpvJ+KRRxQmR8PAKEEdTEQIHHTzmVe+MQtJ8u6N/UrcgpI6IeTHSwE8EJ3QaQzebFBGfxumirQcym8NXFZ3NWlYI/1HQrCNfniPhAKaLJVD6YvkU6w0IHNbTrvZjyisi+YD0v+G4e7iXHeehnCBdt46CYmgkCjS5TVVbY1GkinUndOiuweo3uLCT0Ca/tBAjtDT3YMjj3xCnZRuhmoAJ931htYj/XyMEVDwrfiBXwPO1cdIUESCxN+x+1MKQUh9VwyE2lOxHE+B1x6HwFVf1vLOxFqTqnjaRSnIRNqfRU4JoYB4Qt+DIvs83yLixGOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHu8Cz4NJZCZKEg8BY5ysWNTXUrzN9kwI/SmKpiBfws=;
 b=xReESmj4mSpNy9hl7BZEZNhV99hgjq5mcBcH5hI7HzYeVRX28IbhN4Oj/OricbBjgkgt74Kn8gLHQYheTvdQlPq4eEXQIOA5Iu6f4jtKZaeoNZiEgNiehUmfX7dqDDWCwOEeu2baI73ajcyDT5gZt8NzqKk+6jlYCHQ3jXvLFL0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <bd656991-59bf-4435-b6e2-554b9ef4725e@amd.com>
Date: Wed, 28 Jan 2026 09:35:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v9] common: honor CONFIG_CC_SPLIT_SECTIONS also for
 assembly functions
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <a11e692c-2bfe-440d-915b-818b133874c2@suse.com>
Content-Language: en-US
In-Reply-To: <a11e692c-2bfe-440d-915b-818b133874c2@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|LV2PR12MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c93adc-c0b4-4694-6918-08de5e7a77dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1kzVFo3UERlN3VvOWhvb09SYkJMUjl2bWRJcjcyMHc5QUF0Y2N3S2trSG9m?=
 =?utf-8?B?di9YM0lJenZQa2hlUjFHM2xFQzVnakV1dkdnY2FmQlZsenFSWVZGcE8zaW4y?=
 =?utf-8?B?YzA5UDVWTjZmOWp2aU9kNENabElHY1ZwSzNhVTdJcHlyRDl4ZHZ3eWRmdjZ4?=
 =?utf-8?B?VkdIYStyekN6ckt6a05TTnNDeW1Rc1p1bmxCTDMzZ3ZTTlduYTlSSXdwVytu?=
 =?utf-8?B?bERDM1g5UnFOUmdFNEhkMjY1ZVJwTXo3ZWFreUI3WlpicnJNS0lENW1mMWE0?=
 =?utf-8?B?RnlDWnR3aktzQWQzZUJGbHJmTUN2bXMya0dtZjIzVktIeVBYdUJjZkNXbXJj?=
 =?utf-8?B?NjZYcU1JYXl5M0Fqam50eFd4OEtDTmZsWmtuY1lQVUsxWWJYcHl5SFdQS3RR?=
 =?utf-8?B?Z0F6eTd3eEJSSENzSllSU28yRnE2RXhsblJrN2hCWmYrczI0ZG5tL1dVZ0hH?=
 =?utf-8?B?UWs4ZC9Od0t3cStOak1UWDhNUG1SY3dZNFdlTlg3eXlnMDRhQmpvU3V2Uk1l?=
 =?utf-8?B?bTBQcFdNbE9iTEh1Nm56L1BJSU94QXRnSHJYVmxTVkpjeUxIZEZEYm9nYm1S?=
 =?utf-8?B?R0ljZlY0b0NZTWdlWUFKRHFwN1pkQ0NSU0k2NWo4Z2d1RWt4OTBCZzQ1YXBD?=
 =?utf-8?B?L2FiaHp3Z0toRzhZanEzTy90aWE0bk8xcUVXRklaUjVzQ2Y0NUM3Z2x3ZGho?=
 =?utf-8?B?bjVkL1JqSENlMmQ0Z2NZRXJoU09FcVdVdzMwUXVqWUVpbGVST3cxbmYwNjcv?=
 =?utf-8?B?M0FOVmE1RWJsRXp4Z2hiZGRpOUQ4bDR3bDg5ZEtPTUdQNHNUUHlVdERHUUdY?=
 =?utf-8?B?SldpUEEvU25XS3RVY3NPOUJUUi9FcmhqeUs5RVBLdGpoRk5rUnVnUWV5anlF?=
 =?utf-8?B?WFZnYnNZaFFRQnpqdHIrTlNkZjFPWU5MYWJWcGM3RU85WE40VzBBU2g0QWw3?=
 =?utf-8?B?bDJ2UVdYRXBSdU04NStCci9QS3d3RHU5dUg1dTNVTS8zaUIzdUh1eXd0Umpu?=
 =?utf-8?B?OEtZRit4QVlqRU0wRDlOVjVRMGxZWk9VRXYxNDZ4U1VDV0QrbHZVQjRoR3Vy?=
 =?utf-8?B?YmszQUNzTm9RYTVwK0RKcVArWW1OemV5cFpvWWI4eG9DTVFVVExMdlgvK1Iv?=
 =?utf-8?B?VUp1K0FPUVVoUTRmR0FPUVc1d0ZjYUpnRmh6bVJuQnFwMFcwZ05pcitrVkVq?=
 =?utf-8?B?QkdEeGd2NjVjY252R0VkUXpvdkZiWkhHUFA2L1p0bnRSaUY5d3ZCaTUveWhZ?=
 =?utf-8?B?WVN3dE9EN0RUSVVFZGw5czRxNU1tMWVNMXVlNHBWRG9NQVJ6dFQ2dktPcmxx?=
 =?utf-8?B?ekdQdGtkb3EwZjY5aXB4R2tneG8yYjdvWHp0OFdUdVJKNkZzK1BJSzZ0OWRw?=
 =?utf-8?B?Y0IrbnFmaDB4OUFHSGdaZkRDSG5Hc24wT0lJOE1qaXVUZFJWcmp1aC9RZ2NK?=
 =?utf-8?B?M2VKK0JPaVVTenB2dWdqNHIzdW1VcnlIbzVpc0ZZV0RmUU9nWkhXMVFhaFI0?=
 =?utf-8?B?a0x2b2JCZVZiTkF3K1REeEppUWxYTHZsaWF1Z3VlS0R4bm9PNDZJUmdwdEpQ?=
 =?utf-8?B?dk9aelpFSHJENmpKUFNna0ZhaDZxUDJrd0RYS2h3bXRnbW4zQ05LNjRMRlhV?=
 =?utf-8?B?S2g3ak5sVnpHQmNYRVNZWjUwTjNnUG9sbEVpbW8veEUwSHV0K0pzeFNsSDZy?=
 =?utf-8?B?QTd0L0NyR2l0YlozY3VVNkxiU2tHR0pseHlLOHE1U3cvcC9oSk54SytlNzZl?=
 =?utf-8?B?aW9nNGtVOFhvejlZTm5mZEZEUEYwRFNKNE5GWThCNEVaK2hEaGFsMVhHYk5Y?=
 =?utf-8?B?K2Jjb25TdGlMb0ZMUDc4RWtxbU9zckc1YTZjSTQyM1lZaHBRNHdZd091TjBa?=
 =?utf-8?B?SFRwNnBTUmpzenZBWCtVVVdqZmRuaTlOT2VoOHFYVTV5Wk1NSjBHME80c014?=
 =?utf-8?B?a2d5WnFYaG55ZnBTU2g1Q1Z5VG1PM2c1eCtWSzlUZGo1cHlqMit3R2RhdnhQ?=
 =?utf-8?B?bE9XUjdFbStuY2JPK3hERFNENE93YWtjcUpsVTkzekNLT0EvZEg0UUNyVnJY?=
 =?utf-8?B?ZmFSNUFYeXROcldCU2xlcjNaVGxLbmdVdi8za3NWcHNrMm5taG1yNFd3emp5?=
 =?utf-8?B?bERTVVFrZURJdHBFTXdoSEJSN2wvRUtOakxzbG9BdU1ZOHlDVlJPN2NQQzFn?=
 =?utf-8?B?aVdhSW1YemhpVmFEbFBneVFCR1NkSC9RWmExM203RHdXVlNaU0hrOUo3K1k2?=
 =?utf-8?B?QStzVHZzVjA2MFRaODlraExhNHRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:35:22.2318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c93adc-c0b4-4694-6918-08de5e7a77dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5965
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,arm.com,epam.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 41F1DA2DBE
X-Rspamd-Action: no action

On 2025-04-01 06:58, Jan Beulich wrote:
> Leverage the new infrastructure in xen/linkage.h to also switch to per-
> function sections (when configured), deriving the specific name from the
> "base" section in use at the time FUNC() is invoked.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Though I have two suggestions below.

> ---
> TBD: Since we use .subsection in UNLIKELY_START(), a perhaps not really
>       wanted side effect of this change is that respective out-of-line
>       code now moves much closer to its original (invoking) code.
> 
> TBD: Of course something with the same overall effect, but less
>       impactful might do in Config.mk. E.g. $(filter-out -D%,$(3))
>       instead of $(firstword (3)). In fact Roger wants the detection to
>       be in Kconfig, for LIVEPATCH to depend on it. Yet the whole
>       underlying discussion there imo would first need settling (and
>       therefore reviving).
> 
> Note that we'd need to split DATA() in order to separate r/w, r/o, and
> BSS contributions. Further splitting might be needed to also support
> more advanced attributes (e.g. merge), hence why this isn't done right
> here. Sadly while a new section's name can be derived from the presently
> in use, its attributes cannot be. Perhaps the only thing we can do is
> give DATA() a 2nd mandatory parameter. Then again I guess most data
> definitions could be moved to C anyway.
> ---
> v9: Move Arm32 SYM_PUSH_SECTION() overrides here.
> v7: Override SYM_PUSH_SECTION() in arch/x86/indirect-thunk.S. Re-base,
>      notably to deal with fallout from fba250ae604e ("xen/arm64: head:
>      Add missing code symbol annotations").
> v6: Deal with x86'es entry_PF() and entry_int82() falling through to the
>      next "function". Re-base.
> v5: Re-base over changes earlier in the series.
> v4: Re-base.
> v2: Make detection properly fail on old gas (by adjusting
>      cc-option-add-closure).
> 
> --- a/Config.mk
> +++ b/Config.mk
> @@ -102,7 +102,7 @@ cc-option = $(shell if $(1) $(2:-Wno-%=-
>   # Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)

Maybe expand to illustrate extra flags will also be passed 
(-DHAVE_AS_SECTNAME_SUBST)?

>   cc-option-add = $(eval $(call cc-option-add-closure,$(1),$(2),$(3)))
>   define cc-option-add-closure
> -    ifneq ($$(call cc-option,$$($(2)),$(3),n),n)
> +    ifneq ($$(call cc-option,$$($(2)),$(firstword $(3)),n),n)
>           $(1) += $(3)
>       endif
>   endef

> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -48,6 +48,13 @@
>   
>           .section .text.header, "ax", %progbits
>           .arm
> +/*
> + * Code below wants to all live in the section established above.  Annotations
> + * from xen/linkage.h therefore may not switch sections (honoring
> + * CONFIG_CC_SPLIT_SECTIONS).  Override the respective macro.
> + */
> +#undef SYM_PUSH_SECTION
> +#define SYM_PUSH_SECTION(name, attr)

I put this through CI and it passed as-is, so it doesn't need to change. 
  However, included in a different branch with some --gc-sections 
experiments, I needed to add SYM_PUSH_SECTION re-definitions like above to:

xen/arch/ppc/ppc64/head.S

or ppc failed the linker script
ASSERT(_stext_exceptions == EXCEPTION_VECTORS_START);

And these:

xen/arch/riscv/riscv64/head.S
xen/arch/arm/arm64/mmu/head.S

riscv and arm64 built, but hung when booting in CI tests.

There are also these:
xen/arch/arm/arm32/mpu/head.S
xen/arch/arm/arm64/mpu/head.S

They aren't built or tested in CI, FWICT.  And they are not in alternate 
sections.  Maybe an ARM person can chime in on those.

Thanks,
Jason

