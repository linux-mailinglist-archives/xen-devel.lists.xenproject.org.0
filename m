Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFauH/31jWlw8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:47:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B8612F164
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229378.1535350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYu7-0004p2-Pd; Thu, 12 Feb 2026 15:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229378.1535350; Thu, 12 Feb 2026 15:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYu7-0004mR-LQ; Thu, 12 Feb 2026 15:46:55 +0000
Received: by outflank-mailman (input) for mailman id 1229378;
 Thu, 12 Feb 2026 15:46:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRx/=AQ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqYu5-0004mL-UW
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 15:46:54 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ba1de22-082a-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 16:46:50 +0100 (CET)
Received: from BN9PR03CA0087.namprd03.prod.outlook.com (2603:10b6:408:fc::32)
 by BL1PR12MB5780.namprd12.prod.outlook.com (2603:10b6:208:393::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 15:46:47 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::5f) by BN9PR03CA0087.outlook.office365.com
 (2603:10b6:408:fc::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 15:46:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Thu, 12 Feb 2026 15:46:47 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 09:46:45 -0600
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
X-Inumbo-ID: 0ba1de22-082a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tc8BkgMzle81Queu9MGc1MeQUqauFzoATgM4UX8uOXum+CcVg/lIj55oBi3M7avP9fL7tts1VlVv+QVd8cy2RuQKLF5dxYxq5E3Aa08Q/l9NAufM9GM7ETkz0FzSawZiuDHpBmAgBt/3GhsYYyIvLu4CJvznsJSgFUhLuUDTgdWS1Ht6h3e7HG4IJXMNH5PMknjZ0bKPIBPaKk5PcGbcGtLzytot+dQggZg3GEmZQ+swkFH3+trbmvVFgBiCeB8nx6wdZfloqndDjkwfEbUKyKiVi8X87djMOWseypWMMT5+J2iYC/C0wthqhot3vrXCik/ej1a3oglYaSG+Ll3Uqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+61SZlI0ufxy97zKkBt+DLY0apk1WU8TXSyRaADQhc=;
 b=Ke7/dknUqyhJUvcD8qFeeTNJjqbTAkVPqJn4/+rmZcTFSMKuQDhTSD6stA2Fx5Y08xuAx+UiBu2WoAhEKjNrvzYXnVJl7lmeyf58WcPpDP3Thrpyu3MiP9lEKpGUayjub+498HYlJMd/lpd2VOGFCdPYWkmYa9qAZAJzRI6NLtDZUVbi9vOWUwSpCIjqTDmDf3hzsyjxdzXB+LM0cvD8vkcznf3WCuUx+kG7fDzNUKtvidF/I0YA7pJ0nxxpCREUwMayiBWs0svuNiyfhRmDeuFyvwdHDojDn9MFKQQak9Gemeql6vwxNzscKpxHv8+d2HPkrTpqgkyufQcyZU7Hpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+61SZlI0ufxy97zKkBt+DLY0apk1WU8TXSyRaADQhc=;
 b=HS4sqx9b/S6/A99i/Htm+jSFgnQ97L2aL3ScgEkPR1kNplWjQ1Jx/E0pSL/4QogCa1TUezhmx5Kgd9KaI8JJnwYT93pzKK/LTJ0eE2xC0Okt3sWDsKTej+cGEAbkHAJs4+JDe9+2lQgSH9ZAa2nDe2abSS5vGY709DMtlpXA7z4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Feb 2026 16:46:43 +0100
Message-ID: <DGD3MNWTMG1O.GMQFJ5MS7BG9@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 10/12] x86/mcheck: Migrate vendor checks to use
 cpu_vendor()
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-12-alejandro.garciavallejo@amd.com>
 <18795ddc-c558-4a51-9b61-717e96bf5150@suse.com>
In-Reply-To: <18795ddc-c558-4a51-9b61-717e96bf5150@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|BL1PR12MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 55848d6d-4b97-4c7b-b741-08de6a4dee0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHNwK0QydngwMkYwamFHRldoSEdBMWRtVU1JSHhORW1YTE9qMlJTWGRabzdO?=
 =?utf-8?B?d3g1WWJSYXU3VHVmaTBBaXBLaWxuaXhzNnBSMlVyYmJsMTYvazlKUXVGMDVy?=
 =?utf-8?B?blJwQjRVM09RckdNcnM5eEU0c212dVh3djVpdzJmNUk2aldTZ3FuTkgwdkJV?=
 =?utf-8?B?YklFV0xKNktHS2NZcWF3bWh5ajdqZDNDdksxRk8vZkVvQVNWa1l4aXlGWUdU?=
 =?utf-8?B?VlhoN3NNUEVMd3VZQTZsYnI0aXdxaVd4dkw3LzBXRXRHZDk0a0Y0RzZCcWZZ?=
 =?utf-8?B?TGVRZHRUenA4MWRoaHNlTUNuSE5ScThodkZMQTRHQXl2bXZnazF1TTc1OHZP?=
 =?utf-8?B?dzRweWw0RnZ5NEVpcHM4RTV1djA1TkZmeTNib0E0YUhlcktCZGFLK0dYcDJa?=
 =?utf-8?B?QzFlQ3F1WWd0YTIzZlMvUVN3TkhOb2plT2RST3h6NktGU2t6RTdkR085SXFs?=
 =?utf-8?B?OFV1c1JxTTl1L2RJNVlDN3dpSFpQKzB0bDNXam1UeU5UTlRxQzlnYUwxWmpy?=
 =?utf-8?B?Y0dJVnQyd1JtU3N2YkhVdjVQWEVoOUtwQ2FqaXlWTW5PUmJaeFUwTlNrcU1T?=
 =?utf-8?B?ZDdpdjc3bmNqNUNHOStyMzNkWUtZb3E3OWpLdjlUNGVBb0VRVUFkOW1hdDJR?=
 =?utf-8?B?VlYrZ21CUW9ueGpYKzhaS3J4WFV0VzdRNGo1MzkyS2dkaU0rK0ZqKzIwWXg5?=
 =?utf-8?B?M3NTUFAyNVRCTzlQTFU2REl1TzZLbTRTUnh6aTB1dkFQa0t1ajduZVNFeXFI?=
 =?utf-8?B?eWI0MVEwa0NtQjNPa3dHNmUraEFuTkM0N1R3ejFSUmtmVFlIVEp0QitaU21O?=
 =?utf-8?B?bGpURUV4ZXVMbmJjVEVldnk3WDhkcWJMRUI4OVcvYko4bnQwMXQrZXVMWGQy?=
 =?utf-8?B?SVBhMTUvOUswQ05NY0theitZM3lGdWR5TmE0Rk1zMWgrZzBzTUNqUXM5Tlhz?=
 =?utf-8?B?SmNvMCtkZzB3M08xSlNqT3c4dkk1QlUrMkthczA4RW9JaGxBT3hwVmlzbGk2?=
 =?utf-8?B?eGo5YkRPeDhXQm1zWmo2aExVU3lhWnkxV1V1V3pOOGd3NmhMdVJKQjgxQlZ6?=
 =?utf-8?B?alV4WGVMbFNHYjU0Z21MVk13WG9ZNURjS0ZJSHdqL2s3VUY1Ung3YjZwbzE0?=
 =?utf-8?B?YlZBSUpSY0grcW5TUTVOQkVUWDI3ay8vcTJqQ0VEK1Y1aVozUTN4QVhjNm5W?=
 =?utf-8?B?RFZxcDM1VjFHS05YYzcybHhsVGp3aWduYS9JSWo5OTh6enl2RlZWY3U0a3Bo?=
 =?utf-8?B?T25zRGlHWjFENHN4c0lJRDhPWDlmNG9Oa0VoZUpudTJuUEkvSWwraGU0RE9C?=
 =?utf-8?B?UCtIUWtmQ0VUeEZzbEtTbmkxcHpWemdZb3UyQXRkVkFEVk1lM3BKN2FRSkF2?=
 =?utf-8?B?ejh6cnpMc0JTeDRXOEpTUGlxWEJBSS91OWZ4aDRiWFpqTG1LZWFGeWNTYnJ0?=
 =?utf-8?B?Zm5tL1A1UUh1Yy8wbXZlZUZua3dxSHp4MVI0QUZYOUdQdmlWR2dzM0VYOHBy?=
 =?utf-8?B?U3IzbHpVVFdJRlFXUWFTbDN3TlhiSUF0cDU4WDlTMjBMOEJnRXYxMHp6MmZn?=
 =?utf-8?B?OS94eDNqRG9zeVZYY1lUdU9Yd3RicnIvdXppWkFJWTNBNi9wWW9TZEhuSGxk?=
 =?utf-8?B?OUxHTjlPbThSQjJXY3VRZDR0M0RrRXUvVUE3QnR3VWZtb28rQkpxTGw3TXJN?=
 =?utf-8?B?VjErc1NZZlF4amZzTXVaYnVWVnVxNTM4MjhBRWI5UUN4OXcvWnNadHZEVHpt?=
 =?utf-8?B?WHFqdFNucjhtSFVwdEYrVU1xNnpYUktEZVhscC8xeEpTL3FKVEhhRTBqMU9K?=
 =?utf-8?B?OU0rbnNOQ2JXVnBaNDFHenNFd1JYVTVkZml3Q25DZkIvYk81QldJUHNqOHpm?=
 =?utf-8?B?MFA0N1Rsamp0RlBtTUJLRW1NZ01JZWFTU3luclhLUFlMc2tMWUQ2NkdTMnlF?=
 =?utf-8?B?SmdoL21sRHI0bFpYSDJpR3RYL21lRFkxVGFMa0RqUFh2VXJzWXJVSHgzU2pi?=
 =?utf-8?B?U29kS0QxNzNzR0RpYmIvT0h4bUtEdlRjTVZ2ZWE4VWZ3OXdvME5JbnhncWox?=
 =?utf-8?B?RUhnbVRRamlpaTAzaC9EOUFsc0lkZ1ZZamdLaFdWZGttR0owQmZlaDh2NThQ?=
 =?utf-8?B?NTRVVllCS051ZUxNUFdUVVIralBXK2Z6WkxGdVdKWkpha3NJRlBaVEx3SDJV?=
 =?utf-8?B?ckkreUFvQVcyRnRCR1k5VjV0TUQ5aUV5SGNtV2pDQlNvelRrVzlJVzF5UTFG?=
 =?utf-8?B?VFJWWDdlbW9WSURWZVFacG5ITGt3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vxh1TZT8s/f+YGlQuFDUJZXiON2YcIQsno4/sQQcICwb2RJLibQs/cX7dgG0X+Fz7FkefqRrgkYP3tkmgVJqjPULGq0HIS70xXgbneMQpZ01QBV/mXb3R+zDPSfVV1Nt91AHEEDzYq5o++zDAntAVDWAEF1vVJAYK6URURTLhUtaHlvJjPYDmZFTUdtZMMaOY3NmJXaOmIfryojn007C8dJ618lsxLJDIygAcm4gRvy2GrrGVdm3iC6oHFB9ziWwq6gnX68DlMWz+nZLr3OpTItnW5uktOpokYQIF7xpX1cEYfRqaWPwHYBuvKjFRz+yba6znshmmfFSbFRDhlsBVutDUiiFUlGbRXviu7Dr/dcilwVu1CxaD2eyhV+MBOqKJg+Z9ocTTSGJYZML3xFonBJjeplbR6Api+MyYe+il67gJGMCpOevV1PkOXEmNckl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 15:46:47.1592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55848d6d-4b97-4c7b-b741-08de6a4dee0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5780
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
X-Rspamd-Queue-Id: E2B8612F164
X-Rspamd-Action: no action

On Thu Feb 12, 2026 at 1:02 PM CET, Jan Beulich wrote:
> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>> @@ -862,7 +861,7 @@ static void x86_mcinfo_apei_save(
>>      memset(&m, 0, sizeof(struct mce));
>> =20
>>      m.cpu =3D mc_global->mc_coreid;
>> -    m.cpuvendor =3D boot_cpu_data.x86_vendor;
>> +    m.cpuvendor =3D cpu_vendor();
>>      m.cpuid =3D cpuid_eax(1);
>>      m.socketid =3D mc_global->mc_socketid;
>>      m.apicid =3D mc_global->mc_apicid;
>> @@ -964,7 +963,7 @@ static void cf_check __maybe_unused do_mc_get_cpu_in=
fo(void *v)
>>                          &xcp->mc_ncores_active, &xcp->mc_nthreads);
>>      xcp->mc_cpuid_level =3D c->cpuid_level;
>>      xcp->mc_family =3D c->x86;
>> -    xcp->mc_vendor =3D c->x86_vendor;
>> +    xcp->mc_vendor =3D cpu_vendor();
>>      xcp->mc_model =3D c->x86_model;
>>      xcp->mc_step =3D c->x86_mask;
>>      xcp->mc_cache_size =3D c->x86_cache_size;
>
> What we do internally is one thing. But what we report to the outside sho=
uldn't
> be inaccurate, imo.

I agree. There's also zero benefit.

>
>> @@ -1122,7 +1121,7 @@ static bool __maybe_unused x86_mc_msrinject_verify=
(struct xen_mc_msrinject *mci)
>> =20
>>          if ( IS_MCA_BANKREG(reg, mci->mcinj_cpunr) )
>>          {
>> -            if ( c->x86_vendor =3D=3D X86_VENDOR_AMD )
>> +            if ( (cpu_vendor() & X86_VENDOR_AMD) )
>
> Nit: No need for the extra parentheses here.

ack.

>
>> --- a/xen/arch/x86/cpu/mcheck/mce_amd.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
>> @@ -160,7 +160,7 @@ mcequirk_lookup_amd_quirkdata(const struct cpuinfo_x=
86 *c)
>>  {
>>      unsigned int i;
>> =20
>> -    BUG_ON(c->x86_vendor !=3D X86_VENDOR_AMD);
>> +    BUG_ON(!(cpu_vendor() & X86_VENDOR_AMD));
>> =20
>>      for ( i =3D 0; i < ARRAY_SIZE(mce_amd_quirks); i++ )
>>      {
>> @@ -291,7 +291,7 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bs=
p)
>>      uint32_t i;
>>      enum mcequirk_amd_flags quirkflag =3D 0;
>> =20
>> -    if ( c->x86_vendor !=3D X86_VENDOR_HYGON )
>> +    if ( !(cpu_vendor() & X86_VENDOR_HYGON) )
>>          quirkflag =3D mcequirk_lookup_amd_quirkdata(c);
>
> I wonder if this wasn't better switched to the positive for (checking for=
 AMD).
> This would the render the BUG_ON() above useless.
>
>> --- a/xen/arch/x86/cpu/mcheck/mce_intel.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
>> @@ -711,8 +711,8 @@ static bool mce_is_broadcast(struct cpuinfo_x86 *c)
>>       * DisplayFamily_DisplayModel encoding of 06H_EH and above,
>>       * a MCA signal is broadcast to all logical processors in the syste=
m
>>       */
>> -    if ( c->x86_vendor =3D=3D X86_VENDOR_INTEL && c->x86 =3D=3D 6 &&
>> -         c->x86_model >=3D 0xe )
>> +    if ( (cpu_vendor() & X86_VENDOR_INTEL) &&
>> +         c->x86 =3D=3D 6 && c->x86_model >=3D 0xe )
>
> Nit: Why the re-wrapping of lines?

No good reason. I find it marginally easier to read. I can restore it's pre=
vious
state.

Cheers,
Alejandro

