Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB1nBi3zjWlw8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:35:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2A612F01B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229327.1535302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYia-00012W-O5; Thu, 12 Feb 2026 15:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229327.1535302; Thu, 12 Feb 2026 15:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYia-00010S-KA; Thu, 12 Feb 2026 15:35:00 +0000
Received: by outflank-mailman (input) for mailman id 1229327;
 Thu, 12 Feb 2026 15:34:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRx/=AQ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqYiZ-0000kF-Hl
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 15:34:59 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6341d878-0828-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 16:34:58 +0100 (CET)
Received: from BL0PR01CA0030.prod.exchangelabs.com (2603:10b6:208:71::43) by
 IA0PR12MB7673.namprd12.prod.outlook.com (2603:10b6:208:435::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 15:34:49 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::c2) by BL0PR01CA0030.outlook.office365.com
 (2603:10b6:208:71::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 15:34:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 15:34:44 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 09:34:41 -0600
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
X-Inumbo-ID: 6341d878-0828-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+cftdzfPAp4XdOZxZ9x3QFh/ksThVaZWR5Olzt5FHJv7NqM832N9XpNlK99+tmmdvg3YMl2RAHsejsppH2MXcmtP0m/APvRAAtKTsNi4HFoPDwdx5VvfHXqZLfRfw44NFN/T13XPHLjCFIZOEdPBHqlXLUFJ/csr3JwWTC12OGj7pWCpk/PaumQVpiA3QWx3FJi8kcKZmVKIBCeQetrcUQxERuun/wseW/tdzOcs+mdtG0V6IJNNJcxGIveDq6NXiObPqIOlHd4KaxSVUjrbrw0aapANZ+6SaOO4MVRqK01me397wIEi3+T3y2AfrktxjZ8P1Er1xXf3JvAI8Rj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeB3jl45216Tb9wmhjc1qsJK8CK25FqNZlvx38O8AIg=;
 b=bvup8b4p8PwKvqZwgtLNhdNaDmCM5d8s5xRl7rLkr9KrD3Yr07OmlmZoo00kfVXeV6HSWYz0AJyVmUrORZsOWKdQqRnYKX7v+6XBSd1swj7L5xmVhRuPt4RQ+ZDZPc0hjJB71lRydPTBz2xqUBjOHCiSBSZQhLDUq+4iBW60+yK+Xy22n0vYfDb6QRLZyULZbLzNcLij/F4UROqIda4FDr5L3on8fClg9LOTD8JvReN2mPHW3Ylp9O5SP+QeO/WnZ96GrN0AU01ygOOsIU3Q6Lj62IszPl5+b8FWCTbp3yTtVAXnDlgH/bSYhKQxaK7ANzGXeSf3uakRtM7Dgqkspw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeB3jl45216Tb9wmhjc1qsJK8CK25FqNZlvx38O8AIg=;
 b=bdNzpIp5PLuNEK4FckkFwYLwXz5eF0fgcd/aYKXzcs4/ihn/BA1WttRV7XVdgvzPJcRC+P96Mp9UfYVzXio2M7NUcd9ZiPhf2ihkQdirkCUsp65eZcsSsbsZv8yc+7J9ZmEGfeFMetxwhn2eYDEY3ZhGqKn4ml9dkF3LwLWEjZ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Feb 2026 16:34:40 +0100
Message-ID: <DGD3DFQLJI17.2Y9ML8QC93NOU@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 08/12] x86/acpi: Migrate vendor checks to cpu_vendor()
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-10-alejandro.garciavallejo@amd.com>
 <3504e0eb-973c-427f-98ac-27801819e175@suse.com>
In-Reply-To: <3504e0eb-973c-427f-98ac-27801819e175@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|IA0PR12MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: cc402a00-004b-4520-d021-08de6a4c3f19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDZMeVBWbnpSeUwxek05SjJlOE40SzFYNndMQWlrL21QWEJWeW05L1Jza2FJ?=
 =?utf-8?B?NFFhYTRlajlOUGxBY3Q4RHZzVFV4SnVCak90cjFubi8yOXNzVUNhNzJKc2Fj?=
 =?utf-8?B?aUF5czE1aFpsdU42ck5nL1dPVzhQQ0ZTUVBueVJBbmFDTDk5VklJUlFUdmZj?=
 =?utf-8?B?dFJTTDRlUS9qUEVOYTY5NWN5SCtxTzNzeWhxMmg2TlFBeXN3Y3hERVJoNnhJ?=
 =?utf-8?B?SnVvVUordTh1a0dMQ2lMZGlWb0srOEJGNnFaaTJIVGMrN014dXN2MGY3SFlk?=
 =?utf-8?B?bklSckM3QXBkL2VYb21FbXJiNzVNdFUzOGdtdDN4MmNyakJPMk9SME9PMkph?=
 =?utf-8?B?TjJwNjQ5aFcyU3A2Z2UwKzRxLy9GaHYrL3cwM2JGSWs2bXhIZkc0S0I1OFBI?=
 =?utf-8?B?a00yMU9rejVhOXM4dmxSeW0rbmNKbmw0V2dRVmRqMWZpQlh5RFZHbmdaNEIy?=
 =?utf-8?B?czRkQXBRaWgyQ0VWaTFTNjBMN2JNb1p0RmxHZ2N0TUxsbC9TVkRMTkt3WEtj?=
 =?utf-8?B?WTdnM0haWFFtTGxDRU4xVTlzdlVBL040RFJLN0liRnIzblovcVBudWw5eU5p?=
 =?utf-8?B?dENMVlFRTS82UHV0SDErc1VUb0lhTm9kaWsvRkY4alh2eUVoeTVNeS8xMlpY?=
 =?utf-8?B?bEtmOWI5YkVuakRKcGNMc0hxVjdCMGFDNmNKNnBJSzUrWGU1MlBGT2tRbndL?=
 =?utf-8?B?WXIwckV2YlFYY01mK1ppbnhhTlVqeWdCd1FEdXhXMW5rY3NNZFRPdlQ4dVo4?=
 =?utf-8?B?MTl3a2RBM0s1Sk41NHFXdVNhR3B1RjEzRHNDNkxTWXcxT0phNjgvY0hyNHlv?=
 =?utf-8?B?cFJUNFEzOGV0UXU0cmVCRS9ibjdPYUhITnJmVkgrdjVCZDRhUUxkUUlNdFBC?=
 =?utf-8?B?SnJsL0hQSFBlV1JEeEtvdkp4M09oVURkampIKzJNNTRVL091Z3QwV2pIb3pB?=
 =?utf-8?B?YmdPeFVVT1I3VDQrYjIzQjdQVUJ6YVhZWUN1VUZlR1JhUXRBYXN4NC9VZFRJ?=
 =?utf-8?B?alpldmM2MlVDdGF0TUQ1a09oZkpUb3RBRXVsb3pHNVA0WGh1TjJWVUJsaEs3?=
 =?utf-8?B?NVFTYldXRk1PZVBiL2JoVEYrb2RqMk1ZbnJNN3dYUW90eTVqZ1U4cU9iYXM3?=
 =?utf-8?B?Tm5BTUZHVERlYmF2d2liZGVxa3NJYkRWYlppRGxMRG50SGpiSzN5Mjl6RzFE?=
 =?utf-8?B?U2pnQ09LT1FBNDdRb3FSTTV0bjZvYXBTQXltbXRjNy8wNzNBR0J4RTVOTkRz?=
 =?utf-8?B?Zmc3dlRDM3hVSWhYZ1VQK1NQcm9hSEhmamlCeGJKMFFXbjdaUHFDNmprNVVp?=
 =?utf-8?B?V3htdk8rVHlucjZpTUwyY2drL1Y1Q3hCNDJ0RDR1YzFNUW90U3pOQ2g5WEUz?=
 =?utf-8?B?V0lEYmEwNXA0Qyt1TlhISzJ0Mk5vV20wNGNFNWk0S0JncGNkRWtZSzlWczc4?=
 =?utf-8?B?aURPRkpZRjFZK3pVYlFnaG9VWlJIbVhKcTNpeFN3L1VieGxJNnFLNXI5RXZk?=
 =?utf-8?B?N0VvZ0hFanpGLzQ4KzhZRVBkbm55bWpjU3FnQk1hWFhxUDZpNHBRcGdrWGtJ?=
 =?utf-8?B?R3VDUmN1QkRMd3U3OWhNczhkU2hTZjd0d2NHUzBQZUtZdEFPc2tBOHpPQzhy?=
 =?utf-8?B?ZGMzQk10MjNyMUM3bEk4dU5PbkNpMXUyd0lPZmliSWlWRmNjV294N0h3Ny9Q?=
 =?utf-8?B?anlNQWk5eXZIdFZTelQ1UWVmSGx6dkJKRUt0R2lyTDJRQko0OVluckdjaDM3?=
 =?utf-8?B?Q2YwYnNObjJMUEhVWk4veE9iNjd5OFBaWnNvVFQraUJHaDFnZlhqeW1pUVYv?=
 =?utf-8?B?a1dqbFNMaEZqQmZpcjArMWk0N2l5L3c3UThXamk2aVlPV2JpUVgyeGx6a1ZZ?=
 =?utf-8?B?UUdnT3krTHJLOUYyRVV2UzBqNU5uU3hHNlBLOW9sNUxrNWZPaWtvRHNVQWdC?=
 =?utf-8?B?d2VYcUZKSlpJUGpsdEVwWGM3WGx3Kzk2UWVVZVBwVm82bG55RXg1ZjhpZUdx?=
 =?utf-8?B?TW9CeVdjZktZMERaMEk3Slo5YTEyT1hjVG1vRSs0NmJ4NG5DMmc0VkRTSE1P?=
 =?utf-8?B?bTJGcmhoN0FvRmZteVlrc0RyZHhYUHpZNWNkUE9wUHVBOHphSDd5L3doQkpR?=
 =?utf-8?B?cVBMR2txV2hxTlFGbDY3UEZjdnJySHJtdm4xTkEwYlFzNTlNN0VCeHh5QUpT?=
 =?utf-8?B?eXVHSTBiQytYYlBFekNwSVcyUlJRaXZNWFplNEtDOFViK1VYcklxK2NsUFRG?=
 =?utf-8?B?Mm9pTUhxTXhNNWtvVnFaSDd5LzlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Zc5cCPFlS9iZudKhUu+WC8ZG2hm0gHBo75+RohcYbhtxnz2viukv+U4tP0H84xAm/fnH61oxtPmgrKFij92vsWuYkUzP2sbTFNlPmjAqCxmrXY0TKIqvGKe0wCQpdL4GEw4mmQRP7Jh1vqQhNOrorD6Xz+uLZ7vyj3U8oWp43xoLD3ctj65oAfo6hLstD8qcRU6fzu9tw/mAh1ABXnyQ4rUXIHhojEkqa4AfJF+WOIbbGeWzVCTOotdvkcsS3mHmGzYDSy7widMi0pbQ2uc7rVLiLyFxRRHxlsY5E7sNVNKZTxX+nnWopp1Hq7Rilw3Mxl8dIypJ7OjyxFQHkSMpDz3+UTy5lTW0F/PyocdLbFbBEV2wMBAWwuY0kkZHyKNBlUSPkYZC4XXumiKw7WhBf3J881PfJsBN91fHk55xBRwutgtjDIofebeLfF/JW9MF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 15:34:44.1469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc402a00-004b-4520-d021-08de6a4c3f19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7673
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AA2A612F01B
X-Rspamd-Action: no action

On Thu Feb 12, 2026 at 12:52 PM CET, Jan Beulich wrote:
> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/acpi/cpu_idle.c
>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>> @@ -178,7 +178,7 @@ static void cf_check do_get_hw_residencies(void *arg=
)
>>      struct cpuinfo_x86 *c =3D &current_cpu_data;
>>      struct hw_residencies *hw_res =3D arg;
>> =20
>> -    if ( c->x86_vendor !=3D X86_VENDOR_INTEL || c->x86 !=3D 6 )
>> +    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || c->x86 !=3D 6 )
>>          return;
>> =20
>>      switch ( c->x86_model )
>> @@ -915,8 +915,7 @@ void cf_check acpi_dead_idle(void)
>>              mwait(cx->address, 0);
>>          }
>>      }
>> -    else if ( (current_cpu_data.x86_vendor &
>> -               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
>> +    else if ( cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON) &&
>
> While we certainly make that assumption, shouldn't you add explicit check=
s
> that APs' vendors match the BSP's, in order to be able to also replace
> current_cpu_data uses? Or do we have such a check, and I'm merely overloo=
king
> it?
>
> Jan

In generic_identify()

	c->x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx);
	if (boot_cpu_data.x86_vendor !=3D c->x86_vendor)
		printk(XENLOG_ERR "CPU%u vendor %u mismatch against BSP %u\n",
		       smp_processor_id(), c->x86_vendor,
		       boot_cpu_data.x86_vendor);

But I'm not sure why this is not a panic() (I thought it was). Such check
triggering can only mean a Hypervisor bug and a security hole.

Do you see a problem with s/printk/panic/ here?

Cheers,
Alejandro

