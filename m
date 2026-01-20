Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIt8BDK0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C2F48255
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208706.1520858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9W9-0004Ky-TZ; Tue, 20 Jan 2026 11:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208706.1520858; Tue, 20 Jan 2026 11:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9W9-0004IB-QL; Tue, 20 Jan 2026 11:03:25 +0000
Received: by outflank-mailman (input) for mailman id 1208706;
 Tue, 20 Jan 2026 11:03:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi9W7-0004I5-FU
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 11:03:23 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0f973f4-f5ef-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 12:03:20 +0100 (CET)
Received: from BLAPR03CA0074.namprd03.prod.outlook.com (2603:10b6:208:329::19)
 by DS0PR12MB6606.namprd12.prod.outlook.com (2603:10b6:8:d2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 20 Jan
 2026 11:03:16 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::7b) by BLAPR03CA0074.outlook.office365.com
 (2603:10b6:208:329::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 11:03:14 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 11:03:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 05:03:15 -0600
Received: from localhost (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 03:03:13 -0800
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
X-Inumbo-ID: a0f973f4-f5ef-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fh+8lXjhssQVlN3kODVZFf5dOVqIG0PSBoTKnYqvsSATGJfA4vE0Ph3HyPDhOI/yZoPLKMyiCo4was9x4eKmf2k4osR8+wasFf9HiaoqnUxJ9LvOqbAC4aXEiVd0ctTeTRb+/S/mp6sVm6+Zw7cUdh1Wtw3CnGU6uyjQnyixLlTH/etPz9qWhpNydzJVRhWaplSS5QL7IaubOMoWHTRM3pGecsg8jC5IndqI60acBhcABDFGhjfHPj+5zCyfp0DJfQwEVFaMLt7efSgnA/aWzB/JWl5L8ins+Gc36q4zV/yfb3vLwVlHKASAd9iATbtm4+mIEPOshZBjVwVog1fEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAaqlEIFeuFOikFHuyswMwv7u/t3Ra0RT6WIQ1l1vk8=;
 b=vLgQmU2eBaR33p6sX/tKTLYgyzY+484FHnHFG4pFUsK+FuFmUT0hOlHa6vYT7kHD4tRy4DrT8rcjSfSNcEBuIAbWuD0Ly7QTnWNQFzcdEb/PynPgGo8YY34iXJXXB/yFj8gy+IPgmJx7+zHGLzxlN3uw82Y/mp3F2eZ78yfOMd+acYIx20qh5vv6Ys+rulKDw9kXWSPILJshV5nnESAeT0/MCPCoywE3KhnQVAnsnu9qvnO7zadmwB1IMLkJpmeYNs+LQzw7KDgtKyNdUlfBjnIVfOQ8oD6szPc2sEeLD7s06OA/zRGpp1eNbMa0YiO7I9Cjg8H5IC5Sr/w8+8VjOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAaqlEIFeuFOikFHuyswMwv7u/t3Ra0RT6WIQ1l1vk8=;
 b=X6KCLfHxumXEHVn4hT+/GQnoDm2EQ1xQdX24qM+eE+UEiBdkkLz1zNfVKgOxJh1wR7Jb6nBTAwzICwbDxxQICnb2gZYbjbyvFqfWjKpKDZKm8+hsQfjvorJ3Mjkw3Pv3H+9+q9Szrfe9eNSEW/F0aRSKKIUhgf3b2DizHOshmE8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2026 12:03:11 +0100
Message-ID: <DFTD71OIC6E9.16UX1IJAIGMWV@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Doug Goldstein <cardoe@cardoe.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 0/4] Add Kconfig option to remove microcode loading
 support
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <d5620135-5e91-4223-a0ba-c6876fb8702f@suse.com>
 <DFTCOGP65Q9O.3S2TVE18USSUP@amd.com>
 <5e34118f-af8b-45ca-a5e3-ba214ab101d3@suse.com>
In-Reply-To: <5e34118f-af8b-45ca-a5e3-ba214ab101d3@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|DS0PR12MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: c861e593-3bfe-4c56-28c3-08de58138336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YThSZEt3b0RDb3c1ZElMNTErZThRNEVFQ0NsbDVwK0h0TzVvQkUxRVBtOVEy?=
 =?utf-8?B?MjcyaWNyeHpQcjBtSzBZYkhhS3ZoeEhyNGUzbTZ1Z1F6ZWE3eU1laHo5bTdm?=
 =?utf-8?B?YWcrajdTQVhMRFVESzVxQXFLbWNqQ2NWZ2ZnaW1CMWhSLy9pRHBMZTBHcUFB?=
 =?utf-8?B?bncrdmVoWFVkTHVNNFR5cGZtMmV3RFFNU0k3K01nMEUyNUlwNXU5ZFpGeUt2?=
 =?utf-8?B?MFd2UkphbUZkMjF3UDZaei9QSTJLUDZkVVA2WXJyR2RibVJhOTdRbFFBcVBW?=
 =?utf-8?B?OE12NjlaUzY5Q3dweTFkZDlwVFFRUjJpci8wR2sxTjdmYTZHM0xLRXlmOFNq?=
 =?utf-8?B?c2U2Qi9WZEhHeFhrWVBBM0pHTlNPdkNxY2VXaHZZQUI0M0wwMjFZR0pRc3pC?=
 =?utf-8?B?bmJSZ3dYQ0hocGdsNGh5dmxDTE96eFNSUUQxaWkzSEZ5SjNMdXRoZDVqT0Ev?=
 =?utf-8?B?THRFc0NZRmtNSkErSFcyTjZheC9jbkVVRVZwZU40WDFBbkNvcXNVaG9rNDFt?=
 =?utf-8?B?dFlOU2h6SlNmVm11UVRsek9xQUFvWDJCNEtuNE56eFhyN1hHZWhmQXZtOWYz?=
 =?utf-8?B?QkU0R2svMW5NRFV3ck5jSS9zdjdUWDFrd0tiMnNNZFhGMjQyQ3BpeUEzNktv?=
 =?utf-8?B?ZWdib0RSdUxlWTg1aWRhTE9EWUtWS21KRllJemo4K2ZTWHVPb2pEWlE1Uk04?=
 =?utf-8?B?RGJkWlFwVkdETnJKNTlPdStLUmJIN252cDcwMHAxR0FvZkk0M2poNjhDMDh6?=
 =?utf-8?B?dFp2VkVHYXVTaHoxZ25KeFRlWFZnR3ZITEFRd2FOdVMwVFdhOVFVRzA5azNR?=
 =?utf-8?B?Skovb25LZmpVQVgrczhDMC9oNndxVXFsL25xNHBSaXFzR3NzdksrR0ZXWVJr?=
 =?utf-8?B?NlkxVVBpMi83dS9seFZPZWpmRThvUkNudFNGT3RPZG80ZG82QllweEFPMmtC?=
 =?utf-8?B?cWozRUk0QmtWY1k1QVlvRStLanFuK2ZhVHJjZEpMbk4xZmF3bzMvUW1ZV2R0?=
 =?utf-8?B?Q2NQQmxWc2xVY05yV0RZc0RpVUlKeGE4a1hZVkhMeTJ5NXhYVG0xcWxjeTVt?=
 =?utf-8?B?aVQ2ZndCdU5Sc08vV1hGYityNWRoWUtoWktNdGo3S0lmKy9yNVp0a2YzNjg2?=
 =?utf-8?B?clVvVGh1Rk5QbnBmNFQ4NGs0R2E2aElhZWJQdDZabHF6QUU0T0R3K25pNGtL?=
 =?utf-8?B?b0p5S0ZxSU9ROTducVlyckRFU3JvUHJ3d2xYbm1ZbmlLYmpScnMrZTUveVpm?=
 =?utf-8?B?WllPQ2lKTFNjZDFQMTdXdTl2WXN4Z1ZSQXUrZE5Vb1VDaWcweHlSN29jbDIx?=
 =?utf-8?B?U2toUjdNOTRXV0lUaUtUWnRZUVhiL3Vhc25pTms2MFdkOHNCeTRZMllyeVI1?=
 =?utf-8?B?ZFY3VFUxZ1BQcit0cUNMcWJlMVNkNituditUUXFPNXYveEh4TFFqUzFDT25P?=
 =?utf-8?B?ZVpFb1VaL2JxUi9INitGeGZBNG9hQWRQVG9Jd09ldy9ZUEFLZHRMb04xenZV?=
 =?utf-8?B?dHNBTjhPUlRBcGFDajNnSFd2QlBlRFlGUTNMK05URWFnUFQ5VENUZ01qVzVr?=
 =?utf-8?B?WVRkQVJDZHdqTnBOV0xJL1JXOG9ZL2dXc1pEL0g1aFJVVzhzbC84MVNCVVRF?=
 =?utf-8?B?ZU1hdlRrUHhnUldXUXNubU9vZ0lUZ21ZM01mUlhVSkxLWU85Y2lobmU2QzZy?=
 =?utf-8?B?M0dtYUZDR2NXeDkwM3ZuMk5WbWNtbEVOTjJmU3ZPTjE1a3A0c1BjV1VXczcy?=
 =?utf-8?B?aEJzM2pJQWE1Tm4rQzFrQlIvZzlRTmlPam5lcitpOGJRd3oxb1U0UHcrU1pD?=
 =?utf-8?B?TzFsSFY3VFlmSFFqeStmYWFGMkp0WU5UaXFGdC9ESjNxM3NaTFZBTnJSNGc0?=
 =?utf-8?B?V1JmZTdqdjlYK29mam5WNUpjaVVWQ1pzZ2JBaDVzZXBKOXdKY2toWWswcTNV?=
 =?utf-8?B?ZkdzUDNVSDVyYmIzazVKUzVXTXo5K3ZEZVEwMmJrTWkyd3lzaEpiYXJFTCt1?=
 =?utf-8?B?ZDdnWER1WFVhSFlCNW1LYkg5bzhsSm5hS3RPajBIODFqMFF6djV5cnk4aU40?=
 =?utf-8?B?alpzWGdZdnlmbEFJN3l5V0hPc1NhaTR3ZXJLbFd2Z1c0Qk9zbWQ3dy9iM0xm?=
 =?utf-8?B?UVRsdG44M1RZU2U5TzRKR05pSEpGNWc0M2lhY3pBdjcxNXdtQzZnbmJmQXV6?=
 =?utf-8?B?aEcxUkZZRnFzeXQwT1U5NWlyZFJTenZnQVV0a3RCNW1MSFFBdUErS0Y2dWJ2?=
 =?utf-8?B?bXJQNHI2VERGbEoxazhkQUphSTFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:03:16.1735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c861e593-3bfe-4c56-28c3-08de58138336
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6606
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:cardoe@cardoe.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 93C2F48255
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 11:52 AM CET, Jan Beulich wrote:
> On 20.01.2026 11:38, Alejandro Vallejo wrote:
>> On Tue Jan 20, 2026 at 11:20 AM CET, Jan Beulich wrote:
>>> On 20.01.2026 10:38, Alejandro Vallejo wrote:
>>>> The only dependency here is patch 2 going in before patch 3. Everythin=
g else
>>>> can be freely rearranged.
>>>
>>> Is this correct? Didn't you say (confirming what I observed elsewhere a=
 little
>>> while back) that there's a complaint when a file listed in the exclusio=
ns doesn't
>>> exist anymore (which may have been cppcheck, not Eclair, but still brea=
king CI)?
>>> IOW can patch 4 really be separate from patch 3? Or, if its description=
 was to
>>> be trusted, wouldn't it need to go ahead of what is now patch 3?
>>=20
>> Doh, you're right, they are out of order. Patch 4 now just removes the e=
xclusion
>> so it's fine to do it separately.
>
> I.e. the description there saying "it's clean" is accurate, and it was ex=
cluded
> for (effectively) no reason?

All I can say is that I looked at the report after running Eclair and found=
 no
trace of earlycpio.c in the violations. It's not clean, but I don't think i=
t
is as of now.

As to why it was excluded in the first place, your guess is as good as mine=
.
Maybe all decompressors were excluded regardless of them being clean or not
(e.g: zstd is also excluded).

Cheers,
Alejandro

