Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M6zKjKncGlyYgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 11:15:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F0E550B6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 11:15:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209571.1521541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viVEu-0000tE-Uy; Wed, 21 Jan 2026 10:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209571.1521541; Wed, 21 Jan 2026 10:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viVEu-0000qf-Rd; Wed, 21 Jan 2026 10:15:04 +0000
Received: by outflank-mailman (input) for mailman id 1209571;
 Wed, 21 Jan 2026 10:15:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6Gw=72=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viVEt-0000qS-Di
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 10:15:03 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b92b4d0-f6b2-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 11:15:01 +0100 (CET)
Received: from MN2PR10CA0034.namprd10.prod.outlook.com (2603:10b6:208:120::47)
 by MW3PR12MB4476.namprd12.prod.outlook.com (2603:10b6:303:2d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 10:14:57 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:120:cafe::82) by MN2PR10CA0034.outlook.office365.com
 (2603:10b6:208:120::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 10:14:56 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 10:14:56 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 04:14:55 -0600
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
X-Inumbo-ID: 0b92b4d0-f6b2-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrDogGQnxmp2zTt5CQh+Yl/NCjXmReTCfsBaVtvZ88fh7Gra9GS0FotXyxEkRJsFGHGfleMv7qBfHvDYvraZlDkP3k/foSYPYiBgMj+3pSNQONwwPYY3y0XPQGkQNRJdJ3tOU/tSa/L7oztA/Pb3TOfWF8tlivyA04dqnQin9RTrdI8+C1wCz4scINLw27PSwaHjDFlRQnqJPJFruvQkLaxUCu9GuzV70aj3ULOyJyCu0+YXUJpB7t7lHXHOaKjp+6hGR0d+YdzR8eDuM+Ab21ZhyJTlrA+wH3q+ZwZfRge4qP/U7GVckkaH8ij90WJuKG3DY2TT7IuJtqWtZXZSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kb/tGiyo3qWKeaMR0COArIKTzjNddp3s/jztw8KHiG4=;
 b=sX6RjPHc72jxNXPXLUbBCGdsVptYihoDucUCS6jdnvUcg3/gu5ws3NB8tHUtIU9CfD5zQ0dwdwpQr8AqsukG/lds0faYCsfmDt5+lrDG+byWjdOMhRY0djjV0ULI15cRBJP+9N53pIWyzMu3AkEs0C58ea82xBO66chJ340CjcjWjdoQAHmazA+IhQkYMkwfk8oTKNDDTnX0EQaztXXhc5tW9qzKpWydm5SD7L8b56PjO5rU1fqzXGHeWKIBlc9vfVYQcEMfe8yoLttYNZNVnSYne/+3q6Ri4CstrviaaT/W46XAwejbts49KonnFv2PJLRt9WFv4+Eglo84JOUGeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kb/tGiyo3qWKeaMR0COArIKTzjNddp3s/jztw8KHiG4=;
 b=5aqNW6pVPZbx5Sa/iCqShgGb7xpnUcpm3hx++snenVdppPO6bqStzEXOiAcmw5vU/jifdOpVoTv5vHsOAw8PXFfKfFRIUJQH7/4xs4AB/Y3FqBx3fvxzMUDflI9IBOiRpAVD2AEDr5PGnKR92WgHx5Xk5Q+S+0X11WVDoTv8B20=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jan 2026 11:14:53 +0100
Message-ID: <DFU6SLZE4AMS.35ZPC6NEOJZ9N@amd.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan Beulich"
	<jbeulich@suse.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v2] x86/hvm: Allow pre-enabling x2apic mode on BSP
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Teddy Astie <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <0cb4d1f91212a65baf924ed0ef825d8adb4b5423.1762958551.git.teddy.astie@vates.tech>
In-Reply-To: <0cb4d1f91212a65baf924ed0ef825d8adb4b5423.1762958551.git.teddy.astie@vates.tech>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|MW3PR12MB4476:EE_
X-MS-Office365-Filtering-Correlation-Id: 569e70f8-3c70-4186-9b90-08de58d5ed6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3VpQWRmbWtIT244SWVHWkdkRjd5dzU3WHlZQ0o3VUFQRkZIVFdjdmNKMk1i?=
 =?utf-8?B?NUJ0SWZSTEo3V244dHd6alk4elpaZGhhcFhXK2p0eDlSMlNrdXlEYWRZeE1F?=
 =?utf-8?B?MlhoMy8wTW42ZzdoKzV3RnVya01sRFk5QlpqNzZjb2dwRE14OU9yY2pIY1h3?=
 =?utf-8?B?TTRkVStVUFZ5dzNoNWlYeHpPL2FYRlc0Z0Z1MjQwcnlYOEtWbHBBOXR5L2xY?=
 =?utf-8?B?cXp4VmNGczJ5Q1NROWdOalpIWXdpcGhhQnJTNTNSUExrelU2ZVQ1ZitvNGFQ?=
 =?utf-8?B?eDQyakhvajZOd0tvWk1Ea3FwUW5MbmNxQXYzZFdyaVBzWWpHYm01NGxxM1ZL?=
 =?utf-8?B?N0xxd1dSc2FhYStUNTRCZ2E4eXkyZStBZXFHWUVCTEFVR2hoczZtQ3Q1MUdv?=
 =?utf-8?B?bzBGM3ZLKzFsNWVBeW42NnZaZ0IvMUNJSFpCTHBaSUZGMmtQUjYvcjF1SkJV?=
 =?utf-8?B?SjZaMkRRbjFEUWdUV3FCcWNvTjFtTi9LVU1OK0ZDeTlETk9SZnZkcjRab1ZH?=
 =?utf-8?B?dkhTc3p1WTA3OTRRbjBGWDZQMDRuaERPZDlJRHhoYWhZTHhoNHJPNFdhaWlU?=
 =?utf-8?B?b29PRFNwOW9YYjRZOG13dlZIOTI0M2ZvODk3TjFYSmZIMDEyWDg5Ym9BRlNI?=
 =?utf-8?B?V1lnY3BUNVdPdzhuWis3RWhJcUJoNXVJV1VHMEVVN2hsazVkbnRWTi9NTk0x?=
 =?utf-8?B?WU1VdDNSTndaelY3cXlPTm9rM2VjRGpkaFJLa1AwTHhId1NwRk9sNEtNVlFM?=
 =?utf-8?B?R2VXT1IyZlZ3anpwSGh4dU14V3krTU9ua3dVMHQ1VHFFcUlRcDJsWVRZWURi?=
 =?utf-8?B?VmEvTVpSQytsQzlLaGJVMWNPUFMxNTdSeDE1bHRUMzhnZWZ6SmliU1UvUXc1?=
 =?utf-8?B?MlF6eHpMMjZKWUZqOGJycmRMMEZVUHJ2UHQzVTFFZkZyS1NqNkpMZnl4QUZB?=
 =?utf-8?B?SmQ5SFdsOWlqNEdIdnJRZUlzK2F6anZSbjExdU9QYU5tN0s3YjM3WGdyRUhw?=
 =?utf-8?B?S1ZhaytZNDcxalpkaStLM1FJMHRHVEFuYkJ3VCtyUHUrV1RFb2k5RkdCV00x?=
 =?utf-8?B?SGxlNG9nVXVpaFV5cVFEaWp6NUwwcm43bDJHRWlKQTQvT1lzZEhPd2dvNUl6?=
 =?utf-8?B?ZUgzZW9KVjNjUnNqVXJnZUlGTWtQbFE3RGoxK1FRRzMrMENYaVJVWndzZmg1?=
 =?utf-8?B?U2N5dCtiaWFPRVVEWWNvZ0R1NjAzdEYzd042Qm1vNW1qZXo2ckx2bXhYY1RO?=
 =?utf-8?B?NElPUDRud29YOVdLbElXaWRlNjljS01VenIxenh1K1ByamYyb3M5Vnp1VE56?=
 =?utf-8?B?K3kwV0cyY0JjWDZNY2xwTXBWSWFuYjVRd2VlK1F3Z2FkWXdhQTFkdVFRREdl?=
 =?utf-8?B?dFRGRDNaMTJaVlpoNGVkSWlyWkxNS2o5L2FZOVNoVHd4OTE4cUZNRGtrd1k3?=
 =?utf-8?B?N3lmamxuemJaKysyZzNEYnl6UmxhbldSdW1hRFFPSUxLcDQzTHgyTCtEREJl?=
 =?utf-8?B?OXJBdTIxN29rejFhbHdZRm5rcnkyaWd3UW0yRGZUNGo2eE8vRmVxMFZvQ1dZ?=
 =?utf-8?B?Q254blhrdFFBV0NoK1lwdXVnR1Z3S2VyQXV0RmFyUlhjaFM5ZWZrZnQwMlQ2?=
 =?utf-8?B?bmZxWC9OdHlKSWdhaVdtT0JSOW4xN1RsYUQvMDVxMFVLUHdiejB3eGNvT2RT?=
 =?utf-8?B?SlFVNjF2OHNWMGtCcEF0U2d5WnVxeGMvU0N4TU85V01vY2p0WG1rSjZPOUg0?=
 =?utf-8?B?YktlRjlWaHJ1aTFLZzhhRXZiRld1WS91QmVXRTVMWnlZeGx0QjlpR1hydHRZ?=
 =?utf-8?B?ZDFUMyt3SnhLcU1mUzN0Z1IybmtOOFpZS2kxZUpvYW5OV3ZoYUJPcWQ3Y2t2?=
 =?utf-8?B?ZHQ1amU0VUZ0cDBZdUQrUVdCTlh6dTZ2Y1V2L0lhVFZhb0pGSHNGa2dPSUdY?=
 =?utf-8?B?TXRVOVBkSVRtTmo4REZaMzZZdVJVTHZQVEVBZjFPQXBUWXRlNnU3WkhoeE1n?=
 =?utf-8?B?OXN2ZCs2cmUySmpQYzlsMS9ENFRMQ0d3dTJrc2xtbzdtL2xuT0tkd3FJaWx1?=
 =?utf-8?B?bEhGclZiK3pFb1grOGxicTJ6QUdJY290TTN0Ry8yRG5MMW0yZDhseE13Zzlh?=
 =?utf-8?B?VDdGNHdGZGErMVVzZWFxSitZcDB2c1JwZkN5WnFmWEFkV3dpRlRsNFhTV3FB?=
 =?utf-8?B?aWgyc1hzZEtPVUVPRGlidEUzcWhHK3RhTDlSWCtZU2F1cXlVMzQ1bzdKNnhW?=
 =?utf-8?B?a3ptaEhKb0FwUzB5bVdBRmh5SlZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:14:56.7413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 569e70f8-3c70-4186-9b90-08de58d5ed6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4476
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,epam.com:email,citrix.com:email,suse.com:email,vates.tech:email];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:grygorii_strashko@epam.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 15F0E550B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Nov 12, 2025 at 3:51 PM CET, Teddy Astie wrote:
> Introduce a new option to start the BSP vCPU in x2APIC mode instead
> of xAPIC mode. Expose this in xl through a new "x2apic_mode" option.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Cc: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Later on, we could consider with this option to use x2APIC ACPI
> tables instead of xAPIC ones.
>
> There is also some room into introducing a new Kconfig option to
> only support x2apic mode, which would change how the "Xen default"
> would behave.
>
> changed in v2:
>  - only pre-enable instead of forcing
>  - use domain builder to pre-enable instead of introducing a new domain c=
reation flag

Hmmm. For dom0less/Hyperlaunch and CPU hotplug it'd be beneficial to actual=
ly
have it in the domain creation struct, I think, annoying as this might soun=
d
(because it's a circle back to what you had before) could we keep the misc_=
flag
with the different meaning of "preenable x2APIC" rather than "force"?

Then on each vCPU creation (or even hotplug) we could check whether they ne=
ed to
be preinitialised as x2APIC or not. Otherwise hotplug needs different treat=
ment.

On the plus side, Hyperlaunch would merely have a new trivial binding rathe=
r
than an ad-hoc solution.

Cheers,
Alejandro

