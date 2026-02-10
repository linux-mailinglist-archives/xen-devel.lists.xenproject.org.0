Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLNgEX8Ei2kMPQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:12:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A68031197E7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226181.1532713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpkiW-0006Hz-M5; Tue, 10 Feb 2026 10:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226181.1532713; Tue, 10 Feb 2026 10:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpkiW-0006Fu-Hs; Tue, 10 Feb 2026 10:11:36 +0000
Received: by outflank-mailman (input) for mailman id 1226181;
 Tue, 10 Feb 2026 10:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBUt=AO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpkiV-0006Fn-8X
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 10:11:35 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df64b4ca-0668-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 11:11:33 +0100 (CET)
Received: from BL0PR0102CA0019.prod.exchangelabs.com (2603:10b6:207:18::32) by
 DS0PR12MB9322.namprd12.prod.outlook.com (2603:10b6:8:1bd::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.12; Tue, 10 Feb 2026 10:11:28 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:207:18:cafe::c1) by BL0PR0102CA0019.outlook.office365.com
 (2603:10b6:207:18::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 10:11:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:11:27 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 04:11:26 -0600
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
X-Inumbo-ID: df64b4ca-0668-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWxfiUqzB+0lbe+PX5K9pDlBSK6ZOEE+Lplp1FtfxaAJWTp+nFrl6bmYxwfi1YuB3rUXMaPeG1xLxQ3GH8w7ra1CLkVxAAPFIEhaUb7Moc4LL/g8pSm5ox0dalgpsNqBZJKkhzfeOFQoqLjLigESlwAFMTgfhe/y2J0Jw2W74d4hecJRndEIgBHDeFqIsGmcQPK/hQiC12CXQkewtZxCL2GTNU1nyqvUXoK+oE7kAibS3at0lsMIZ2rXybFRdvPujAS69whm8yoc3kecraGhc7+l8m6GPHTjGV2lpZQPOtqfuu2qYHKe2bAFPxVPZIqBf1zvOO1EqAlPvJ811ledQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfIaAL9d2E0xKt3C1F/0Z4M4a1D2voeXJKTaSPKkyVc=;
 b=MWg4IPmulIbXm0zSCy8LX/h9nJmsMAxnTi5PwiKksQHtPCcBFM2d7khZQNMyNGmRWkacoK1YlG2UWZeKhkjS9ajsky+4g1raxkIkxvNtQ/fuCXYva8KDrfayTjr7KNd+UypJ6gOkaYlg3TczdWyCp8rYcUggJhS8l8HDVRN+sonEnenCCnADbWfWPv113kGIsNFaliNhbasoVJGMeawluCFt3gswhOO3LJA8Hr25mwU36xiwXh57pWLriuoTU4TfkmyzRiJJzmguTe8MfrhSVq0CfasyM19R47+1IvTj8tl9UwoozSNBgY5fzY9rDkj0sZNhupwYlLFhduY/rQDOeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfIaAL9d2E0xKt3C1F/0Z4M4a1D2voeXJKTaSPKkyVc=;
 b=D3LddHupmS6JEclBEPLo0KecM/X3/RgFO54ZwBkXnLUHATiDWChg/jMx4SnekHCfOxmxVuvS8ctDuOvshMVwW0VQsdpK8mOScHnuj4m/mhoL40UdSVzI6mVux86oUkfQQJVjU8jVXa9RFZnhVKeMQQt0IeV0fjdKqfK1QHhP2xY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Feb 2026 11:11:25 +0100
Message-ID: <DGB78UFCYSUN.3AGZ9BQ3901DA@amd.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 01/12] x86: Reject CPU policies with vendors other than
 the host's
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-2-alejandro.garciavallejo@amd.com>
 <aYrqDLFGqEVYMyU1@Mac.lan>
In-Reply-To: <aYrqDLFGqEVYMyU1@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|DS0PR12MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: da6e9da4-96f5-4641-69ca-08de688cc12c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SC9YcENSWUNoL2dxTmpTbzhFMmtiY3pMSDdHMlpydnZ0Q09OYkhGZmZLeXRG?=
 =?utf-8?B?ZUpoTmZQcS9mWjBMc2dGTUcyN1Q0K1pKajA0bWNXT3U3dHNiUTNzazNUdTRq?=
 =?utf-8?B?OCtkMUQzQTk5NVhTemphc1NXdXBJM29ZUXpMRXlVWGVuUytDeVMrUW5zZTU2?=
 =?utf-8?B?NUVxbkd3NllnTHViZWZOaWRoUWVDckxvOUN3MzZLalR5WGlrdzlzclYrQm1N?=
 =?utf-8?B?UHBqN3JLaGlEYlR5UmQ3a1YvU2F4bEpzT01mU0E2RXJnRnAwcWlPQXh0bVor?=
 =?utf-8?B?d3RqdTRkdCs2NDZobUFrd2lJaENVSVRYWmtoblpxUVlhdGMvd1NmaWlTckxX?=
 =?utf-8?B?b1pvemRRZzJ4SnRwK1JxdVFRTTNNMFZSa0MyVytheHlsU2NzWnI0K2NMazBO?=
 =?utf-8?B?Rmh6Y1BZaEY5cTV2YnptR2FyMTU3WlNGY1Q4citPNE9xc1YrKzNkRzdCSjdF?=
 =?utf-8?B?K2FrckpNUHVENlJTYWUyV3cvMmptcW5LdjFraWRGb2pEd01Sd09wVUVFaitz?=
 =?utf-8?B?YW5NdXFIWlc3dmNka1FWaXpCTUpPMkR0Y1daTmRBc3JwWXlyMXcyc1dWMnEx?=
 =?utf-8?B?RzE5RUVGa0hEbUhIWnFWUlREZklQMnVsNlpOSjNWeC9NMTJQY3BrcDFYbEFE?=
 =?utf-8?B?MEg5bHlISkRVZlN6YjY2S2dZcnpTU3FXZkdISnl0SVZiZ3ZHRXRVL01PN3ZT?=
 =?utf-8?B?b2FpREhsaGMxZjZWQ2NHY0FGbDZ1dC9UbWJrNXRkZ1ZyVzNIWmRteVEwanRu?=
 =?utf-8?B?OE1QT2FBWHZWWmZUSGd2OVUxQks0dFpWOVFkRFdtSFFVNVlWMTVPYmI1OU9S?=
 =?utf-8?B?WXRQUW5acUVlWStzRUlSQTdNOU5LMWo5NmZZQlBWZWVYSndvNUxpU0VGK2Nw?=
 =?utf-8?B?K3k2elEvdkdhd0xwT3V2c0dRWG5qTERSMGhKdXMxS0Q0eHprb3RINjBXYU45?=
 =?utf-8?B?Y3hQdkFzUndqVytrUlNTWjkxSDJMd29uTWJqRkhZTVEzVjZ1SE51SDNtc1A2?=
 =?utf-8?B?Y1ZURnRkT1Fqbk1NTGUyV1ZxeEpBOHRHN0xTYXROc25meVRkTStZb01KSk01?=
 =?utf-8?B?ME9EQlFBa2g4VzFKaCtvTXoxL29HR2FTTU4zM2FUVHVhMkdIQTR2cmk3Y1VG?=
 =?utf-8?B?djlOM2tZdDRaWEJndlBmRldFNGNabnZVL1lpcW9DTXI2TTVVUk9jditEWUFR?=
 =?utf-8?B?S0xtYng0M0dXa1F2a2ZDcUgyUlJUY05uSm40eVRrSC9lZmxFMGhza3VXa2dN?=
 =?utf-8?B?MTgwVGFHSFU5Q1YzbmpuQXBIOUQ0KzlaRndIM1JrSFR4K05RYkx3Vit3T2w1?=
 =?utf-8?B?OWRwMGVVeDVVL0VaaWFVWlozdEM4TmI4VVFiekt5NkpyaCtpbUVBTjhrbG82?=
 =?utf-8?B?aldQck5XUXZ1TTlyL2dVNVFubmM5eVU4NFZBRkx0cWxSVVZhVWdJQWVRelRL?=
 =?utf-8?B?VGt4TWRKbXpTVmN4SWVzWWtkcy9QVHpGbUM5VVJEOFNlOENtU25zQ212RGxR?=
 =?utf-8?B?RjVyNWZGQjhqaHlUOTN6TStPYUVNMHZicW05YkViU3Q1M0p5NjRNMUZydUc0?=
 =?utf-8?B?QUsvMFBKQUprYjE1ZG1uUEdreWlwcUhMREtrVlZETzJFNG9JbkduNm1IRWxy?=
 =?utf-8?B?YWJXc2lsTUljVUE2VVhVWEUzQ2ltZjhYUitJYnRGRy9LVTRBMldUYUN2Z1V2?=
 =?utf-8?B?YTZuMk9RK0l5WFpBK256WDVQWm10VGZZZVRjVUJETkJnL0VXdUZSWnRjbHlF?=
 =?utf-8?B?dHN0dE5FU3pXdW5aaTFKa0VBRlNNc21ORG5rTUpmbzVTQVozUXVISGpWTFFB?=
 =?utf-8?B?c1FNU1hMaGtod0tnbi9HcFIva3hPVEtJc1FLY3F0dzFaTCtZalBzRjhDeVJT?=
 =?utf-8?B?SFpwTy9VdDdtNDdENktGRTBMbkUvRjUrdzRjRG1IQlBPNGloQlh1VFc2Y01n?=
 =?utf-8?B?cXZtOWNTR084ZUtCMXUzNGFtQndjWmhZdjEvQTBjS1ByWW5kb2hsbjBzNzJU?=
 =?utf-8?B?dmEydzdIa1RuQi9LWGc2dCsweW5iN1Rma2FySktJcXAzMGZnYzQvSFFCNm9J?=
 =?utf-8?B?eExrZU9EV3MzajVSQnRrVTgzTFh4MDZ0elU4VXEzYVpuL2M0Yk9sL1dPL2JK?=
 =?utf-8?B?YUw4Qkd2WklSZ2cyZzRoSndWdzN6UFArdXlsZk1DMXhwaUhRQnF2QUp0d0Rw?=
 =?utf-8?B?eWhGU2FoODk2YjNzR0Jwd3NHQlVEWHVoRTQwY05BQkF4eEZEc29oTE14L2Ru?=
 =?utf-8?B?Y21CbTJZOHorUkR1YVJTbDBrUWxnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lLvwscv4HVQdLqf3VHsIvZsH1hIpHXJkkilH1JEl6ApJzZwRBwLewqzhoamKFCalkGklUHIzMtAKREJE8VWyeAqEODUAcsbEl7FUl0ur51lQZOkFWbFQc5qmaWn3w/czcCJfIX3Aj/h09h1lmVhARKl1vij2Yq1DiXbkw6Jk0EkjmR9TEY0d5wFzAKZaXXrTTzqYEJSC9jnUUrZTZ8sK0MpX4q/uUTmwouUS3pyRkbLQHBXDzdLoBbolb/oYdon5MHsQ+61VS4XrTIJFmYUXuYeLVCTT5QSxfaUtoImOXfd1r0guyUP5knLqI3LNuOut3NG3HUHeh6MSNIP93SZmPxoAXdxvd7Mf/srLZBJmFsLJA98TzX6yHsP+emawbH/3quycfKVWY23S4+uV8MOl+gVB0gCugXfcy3pw9ubETnA3BT9Gfn4YfmwhML6bw329
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:11:27.8457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da6e9da4-96f5-4641-69ca-08de688cc12c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9322
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
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
X-Rspamd-Queue-Id: A68031197E7
X-Rspamd-Action: no action

On Tue Feb 10, 2026 at 9:19 AM CET, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 06, 2026 at 05:15:23PM +0100, Alejandro Vallejo wrote:
>> While in principle it's possible to have a vendor virtualising another,
>> this is fairly tricky in practice. Not doing so enables certain
>> optimisations with regards to vendor checks in later patches.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>> Patch 1 from the cross-vendor series. Do not merge here. It's simply for
>> consistency.
>> ---
>>  xen/lib/x86/policy.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
>> index f033d22785..079c42a29b 100644
>> --- a/xen/lib/x86/policy.c
>> +++ b/xen/lib/x86/policy.c
>> @@ -15,7 +15,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_p=
olicy *host,
>>  #define FAIL_MSR(m) \
>>      do { e.msr =3D (m); goto out; } while ( 0 )
>> =20
>> -    if ( guest->basic.max_leaf > host->basic.max_leaf )
>> +    if ( (guest->x86_vendor     !=3D host->x86_vendor) ||
>> +         (guest->basic.max_leaf >  host->basic.max_leaf) )
>
> You possibly want to expand test-cpu-policy.c to add a small test to
> ensure this works as expected?  Not that it shouldn't, but it's
> trivial to expand test_is_compatible_{success,failure}() to add a
> small test for the vendor checking.
>
> Thanks, Roger.

I didn't consider it. I guess I could. What I'm thinking also is that this
vendor check should probably check the encoded vendor (ebcx/ecx/edx) rather
than the decoded one.

Cheers,
Alejandro

