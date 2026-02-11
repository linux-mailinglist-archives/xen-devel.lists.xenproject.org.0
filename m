Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLgtCNXBjGkmswAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:52:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C13126B9D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:52:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228166.1534508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqENZ-0001N5-N4; Wed, 11 Feb 2026 17:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228166.1534508; Wed, 11 Feb 2026 17:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqENZ-0001Ku-K1; Wed, 11 Feb 2026 17:51:57 +0000
Received: by outflank-mailman (input) for mailman id 1228166;
 Wed, 11 Feb 2026 17:51:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWxp=AP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqENY-0001Ko-1O
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:51:56 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58e545c5-0772-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 18:51:53 +0100 (CET)
Received: from BL1P221CA0040.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::15)
 by DS0PR12MB8344.namprd12.prod.outlook.com (2603:10b6:8:fe::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Wed, 11 Feb 2026 17:51:46 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:5b5:cafe::ea) by BL1P221CA0040.outlook.office365.com
 (2603:10b6:208:5b5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 17:51:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 17:51:45 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 11:51:44 -0600
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
X-Inumbo-ID: 58e545c5-0772-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxHgZyPqfnFUCu8wxhECOJLkTVG82Hw46b3XxSLz9zYk90mAjIGcqbWGRIgz7fYym35tMs1kOLx8eeJHsooEKbQulUFiPL29oklvLhbWH41mPqdnojgF9iIFbvhiXJrEIw6b0HESDl1mToCSwhQWnX9w5F1F1bMHPm2QIWOSIaDW7B4RtSBYhazT9GWxcurVoyXSaCWdjQoSBw+5xAmQtdCYLTnN1KJkaFoPAeipnFVhOCP+yMgFh30OP9kTRRaknXBBLJWaWwNIjlM4ZCMlfIzSzs4S+ymxSYhkQynbR0VqYEcFqLdHR2dLEF1QHRV/9I710FQQrUp5vtRgonQJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyUdysUO+/Aj6zW6ycXlJSe1qFojlP8/6o7CifbAs9M=;
 b=SdYoy0o4Zgl6qBwQbE2RCsMcDO8N8WRN2xpLwAr9V4+eGJqdCzp3M47DG88u8ZyH2uZYC8AeW40Am5TQZXcyWdk3M0QvHSCRe33R86WBgIV2cYdsctMVZVRtm77PVbSYZ63B8yv6yNy5oPLLnN9pXZHr+5ybf5xG08JLdiAOTe3TeObevLW+JksynukpMWzR3/mgY19U9lyORMoTRYPDssfRGtawTV2XhtFxOaQhrxyortDkGog1IpwBw0UIgZBd8BRJGp7j4S8SSuticBP/d+wADFYP+H5ImpVQg1xtUeAGQziqiXld00EXFyuQazIZG+1/H2Hu2Yk8kjNYXlye0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyUdysUO+/Aj6zW6ycXlJSe1qFojlP8/6o7CifbAs9M=;
 b=gJS1/NUx6WnTeg8skrIlgY2U0pXgYDNl7zsd5oRQXy/f3qJLbNWXBJTWAoHdmfTaau0YzEbNAIOpZ/pz4DzyQ6fIyKEKjEL54Yq570Cif7x//kljVcXhMRPbkM+jcWQnLgoBhq5/Hc0ncMwZfP9Tbpg6j37whHTuEEp3SxO6BAk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Feb 2026 18:51:43 +0100
Message-ID: <DGCBNTE7OB2D.3M7278B98EYPZ@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 02/12] x86: Add more granularity to the vendors in
 Kconfig
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-3-alejandro.garciavallejo@amd.com>
 <b284e16c-cd99-4595-8fcf-264c378fc57d@suse.com>
In-Reply-To: <b284e16c-cd99-4595-8fcf-264c378fc57d@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|DS0PR12MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f868fc-744a-43ad-1dac-08de6996392a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1pob1o0NDlDbkprd2V2czlCOFFiTENPUm5MVks0R0tvMnNyWUczcU00WGhB?=
 =?utf-8?B?L01VV3dvQWN3NzhDTU45bDJjR1hOSkpQSWdXSlA4WGVRSndZbEY3cWVBRVNW?=
 =?utf-8?B?SnRzL1Npd1Q4NVIvcjBKV2lSMWJUTzVHT3pLMGx2bjZSQTRaZDdxQmFVZmdJ?=
 =?utf-8?B?MHp4eStxUWNwdEIvbndrRmxxeXMrWktCRU03YVE3Qkx1VndnSXVydHJRN3l0?=
 =?utf-8?B?S0ltV2lWV1p6a0JQR1hwNTJkRVlQT1FIM01meTAzVXVmUG5PZVZHSFF0Smgx?=
 =?utf-8?B?QWZZT0RZZFNVV2lzNTdOdVBjaFJUY3BHb2NDeEpTSDdIcTRUdEtyTmMrY3JQ?=
 =?utf-8?B?QjZzYlNhWXhPUW52TVNBVnFkekgwSGNNM2NpNXBPV0lXbnRjT1FwZmVCeXZM?=
 =?utf-8?B?eHJkOXpoZ05kZ3l3SUFCKzdGOVEwTlRUdGZYemlsNTZ0eE1waWw1SW9aNkdn?=
 =?utf-8?B?QTBPNzQza0Iyd2piWnFGRURlNnNUQ3FEVVZxV05Dc3FFb1B2aTRKeGpuRmxh?=
 =?utf-8?B?WFBDbnErRXJxdEpiQzhLbEdKaFFXMklmM2FvcERTenQyZkovWC80WnQzL3oy?=
 =?utf-8?B?K0FvU01JWDl0MjNDMTZOZHZrcSt6bmVOZ3Bna0Y4ZzF4ODEvU2pTTElwMG5M?=
 =?utf-8?B?dVhKcEhlODFhWTVWUzdDT1c0R2FoR0ZxV2hDSUxyaUtRc3F3ekpLQmpoUVl4?=
 =?utf-8?B?aGFpNWxrRDlHMVdXVjJpUUVzSW5meGQ4Q1dRUHJTRmowclpWcW9ObkhmWTBR?=
 =?utf-8?B?Q1RUUk9LeUIwNHB2SUZXdGc0RzZBVUwrdERhMnpuUmpTZWhaa0ZyUWRjamV4?=
 =?utf-8?B?WmkyWENqRlFuSXUwcTN0RzY5QW1PNlExanpoQlhtVGI5eUZSanJ3bmNKUTdo?=
 =?utf-8?B?anNENm1mSnNBNUNKQWN6YjEyekNQVmw4UHlGc0d6S1Q2aGRlNzlmakNNS1Zo?=
 =?utf-8?B?WjdEZEdDbmlVWCtXTHpVSTEzUEt2VVEyZkZaZWlpNnlwb3JoTFFNelFNcFBa?=
 =?utf-8?B?cHRtMnR1L3BUc0IwNUlsWmtaeVdCTG5RdENCWFh0VWpreDNPaWhjdVp4ZUdX?=
 =?utf-8?B?cWgxaDV4ZUdxbHdHQk10SHJQeXV1bXFsb0MxZGJxR21oaUprblFidGs0RnN4?=
 =?utf-8?B?V1BQV2NSdjlYc21yKzlzK1V2RThnbldDSHBZWktFN2M4MU5HRmtLNFpUK0pD?=
 =?utf-8?B?VnZrTW50TENHdDRBTkNMVlF2VGUzMkNYSmNnOWk4L1lOQk9oUHBnaFIrT0lJ?=
 =?utf-8?B?WGtWVjB2Y1VBS3FPRnBtYUpVaDQ4T3RQcFpZWWxpK0VjeDdGdDFFWE9XQjI3?=
 =?utf-8?B?Uk9waFZ4SWdxOFZ0eEx4bVBqVjNBczVXNDNlaVVrL3hrV1hHWHFLaUxmdkpz?=
 =?utf-8?B?OWFXV0F0bzJmQmVaRkM1VThaNldCdm9XN1VEc2ZTT0RaYk9wYzk5djErWVpR?=
 =?utf-8?B?R3JrVG5Zd0IrK0pIZWVTa1ZKZWgza2tjUWFPMTlOU0gwcStkbXVnaHBESTZh?=
 =?utf-8?B?cTlXeGVyMFI3N2xqUnd0MTA0LzdRSzc3Mmw1RHpabzZXTGFabStOZGE0UUpP?=
 =?utf-8?B?eXhIOHdIZG5UUStoWmdScmJsRGZ2M0o5TG80NVJPOWRIQ3JuM1ZJTTJkZ282?=
 =?utf-8?B?TW9PMHZ6L09jMFFXMDlFU0xiVU9VQ0lCTnN4QlVqeC9pczNnNGlzWGtxcVF6?=
 =?utf-8?B?S0pmRUF4UUt1c0x5elVPWjZ1RlJ5LzR3dTFib0k0bzh1L0VUdDRlb0gvb0tR?=
 =?utf-8?B?SUZTcmNOU1kxdnhGZklxNEdaZzZNa1B2TkJ0dTg3QmhxSjduS0dNaWFVOXhS?=
 =?utf-8?B?T1hpVElDb3VHQ1AvNmF2azlhTDZyRHl0eXFHQ0paNkJXZUJhT2ZZZk9RQmhl?=
 =?utf-8?B?bUxYdmUrbzJSc2syV0puTjBleHdJN1dFc1VNZng5UlB5ZVE5YlBMd29lVnRU?=
 =?utf-8?B?OHpxTVdWRVVOMCthd1lEVmIwVmJJdWNGZGY4TExYZW5CNWZVNlZvNEVxUFhJ?=
 =?utf-8?B?VllDUUVOZmd0RUlyc1ZwdEFaR0xmSXdNWnZpNWJUV0NHWTY5emFJZHFBbzVh?=
 =?utf-8?B?Nm5uL0JoNXQ4K3VXUlpZcVpMcXJpaE1KMVhkVTR4d3J4d0MzblB3ZDVHZ09a?=
 =?utf-8?B?aG1nUlkrVkRmSUZRdTQ2a2dhQU9ZaWRRY1pMV3N5SWtUY20vYVdyeHRDQ1dp?=
 =?utf-8?B?TDkwT2pJZk9YRVBONDlEWHJheUVpTE9EVDBOVm13QS8rWWNWM1QwMUtSRzlS?=
 =?utf-8?B?cXYyTkN6WDlENjN4OEMzSEVMZFN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pFbh4tTB/lxnIaYPHpbCoKby2i+3Z+JaIKDoXD13AegDGX6KCXQzNvfFiFB3E75A3k2oYHEOnx+o8doHwYj/6U2zKFTCrFZ5vhjh3QsySlzVhvm/NeOKMO7+3+k8NC1ZbpSUbPBScX6Q3gGrgUkSv82Mb0bYYWrm4gEUCh63pDbGX1ac6cBRiogMtpg+Pd6yf+WjtBtByKViCuGTEiXqRXvLa2IBVjQ0hbnzYfrMCIkfnD5yDa1f1CT7q+08kf06XtDHK0LyO+PWRXiW/oBE33Dd8fQqPTevJfntj6ewRGxjHzC/DXvX7RayIheRCyCRYixYcl3bRaqbpBY/esjj28OfOJ4dZj4JRATcEU19u/wd2VIXxaP481hsaLIinhjPeFa0ekDieA/y0yRkR56h+K9QnD1lKaurJa85jEWIxEwyBD/LMaVVjk2e4StLIxSU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:51:45.7832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f868fc-744a-43ad-1dac-08de6996392a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8344
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 87C13126B9D
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 5:06 PM CET, Jan Beulich wrote:
> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/Kconfig.cpu
>> +++ b/xen/arch/x86/Kconfig.cpu
>> @@ -19,4 +19,47 @@ config INTEL
>>  	  May be turned off in builds targetting other vendors.  Otherwise,
>>  	  must be enabled for Xen to work suitably on Intel platforms.
>> =20
>> +config HYGON
>> +	bool "Support Hygon CPUs"
>> +	select AMD
>> +	default y
>> +	help
>> +	  Detection, tunings and quirks for Hygon platforms.
>> +
>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>> +	  must be enabled for Xen to work suitably on Hygon platforms.
>> +
>> +
>> +config CENTAUR
>> +	bool "Support Centaur CPUs"
>> +	select INTEL
>> +	default y
>> +	help
>> +	  Detection, tunings and quirks for Centaur platforms.
>> +
>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>> +	  must be enabled for Xen to work suitably on Centaur platforms.
>> +
>> +config SHANGHAI
>> +	bool "Support Shanghai CPUs"
>> +	select INTEL
>> +	default y
>> +	help
>> +	  Detection, tunings and quirks for Shanghai platforms.
>> +
>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>> +	  must be enabled for Xen to work suitably on Shanghai platforms.
>> +
>> +config UNKNOWN_CPU_VENDOR
>> +	bool "Support unknown CPU vendors"
>> +	default y
>> +	help
>> +	  This option prevents a panic on boot when the host CPU vendor isn't
>> +	  supported by going into a legacy compatibility mode and not applying
>> +	  any relevant tunings or quirks.
>> +
>> +	  Not selecting this options while selecting multiple vendors doesn't =
have
>> +	  any major effect on code size, but selecting a single vendor with th=
is
>> +	  option cleared produces a much smaller build.
>
> Shouldn't this option's prompt be suppressed when all other vendors were
> selected off? Else the degenerate case can result that I mentioned in
> reply to patch 03.
>
> Jan

You mean having the option disappear when any explicit vendor is enabled?

I guess we could. It wouldn't be very obvious to the user this can be toggl=
ed,
but now again, if they are unticking vendors they would end up noticing.

Cheers,
Alejandro

