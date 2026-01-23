Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EODRGgdcc2l3vAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 12:31:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20D575079
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 12:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212166.1523447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjFNH-0002Uv-FG; Fri, 23 Jan 2026 11:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212166.1523447; Fri, 23 Jan 2026 11:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjFNH-0002SE-Bw; Fri, 23 Jan 2026 11:30:47 +0000
Received: by outflank-mailman (input) for mailman id 1212166;
 Fri, 23 Jan 2026 11:30:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hx8e=74=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vjFNG-0002S8-5e
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 11:30:46 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3d77fae-f84e-11f0-b15e-2bf370ae4941;
 Fri, 23 Jan 2026 12:30:44 +0100 (CET)
Received: from SA0PR11CA0069.namprd11.prod.outlook.com (2603:10b6:806:d2::14)
 by IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 11:30:37 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:d2:cafe::a4) by SA0PR11CA0069.outlook.office365.com
 (2603:10b6:806:d2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 11:30:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 11:30:36 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 05:30:35 -0600
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
X-Inumbo-ID: f3d77fae-f84e-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a475LqwRHy64zRa0FR3ObDc5DT5sy5925/E+YJE/e8rUSj2NzF3GL671dku7ZQhnaJWUpDYwXMYe84fEt8CV4q1T0zUkRNhJdUXM8r5Y0j0pYI5tAco3r6PeXLYUmCkHhALQ0oosEoobl3ui58GtdY+zsEcoyNC3kMVSsxkgBTFjfbm/BK2bjlNmjATXaSfAAFPcATDMiHnWrhKnxl0VFrL1++HqJmpuETjAh6J4TKezX29G/GLtm47edF3pwzJKNSErSjLBBb7YjwM0rG4q2InJmzd0OzUZhM9JPysu3MBIMrNQ+k1kY7c1UmXfF2oj5JzJhKS4/cIWNfIpCVhvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=All5rhqj5Rzs0kQTv90z7MbhvCo4QWprTk/QfjbAQbk=;
 b=xXT+nlkUxlt0Fw7JD0RxkrJhTPbqu38PVTVfBAhra6UPXCYqmMfxiYZH4gBQ8TElk4S+4xSi6blWoO1//wtR8NkKHEoTE3qcikRAgXAOvLAtwiW2zwJjPiRImwOVvvFgiEATXMPl3wscr8UF3yCPCP//DZb2sbbLDPKG6yMd4JuwZhMn5sIsOhDRi+kreDqshDmAai1OKG2IMFT82a0622mZc2kxOlqOVOt6WHaNNL/wCpz47wTSIDqQOPFigFtEI3gCD8EmXfv2Nl04IQE/jKBxWFlLNKr7+RAdk1SAY2k61uhic1aJXvbI+GzOJbvzW4EiwcrRGiRAjvES8Yld6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=All5rhqj5Rzs0kQTv90z7MbhvCo4QWprTk/QfjbAQbk=;
 b=VXfFO4KbWza5338jO1CidhmJKDXCq6ppt2bMrzOYIecGEcxOdoyM45X8r4fgfJpjTnEfreKGmYNxYJpFBq5dppaquL/X8LOh7U+kDNCzMTw7FT8mtRNRQh8RfbEp4K5u1YP4hk+kro/kQSSPOIPGYo76V9uAF2X0RI4Rl7FNeTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Jan 2026 12:30:33 +0100
Message-ID: <DFVXNMUYBPUS.JMNJIXEVQ264@amd.com>
To: Teddy Astie <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 1/4] x86: Reject CPU policies with vendors other than
 the host's
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <20260122164943.20691-2-alejandro.garciavallejo@amd.com>
 <5a96fb6d-ce8b-409e-9050-3499ac90eb65@vates.tech>
In-Reply-To: <5a96fb6d-ce8b-409e-9050-3499ac90eb65@vates.tech>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b64dd29-e36d-4575-b8a5-08de5a72d452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnFPbEZPQWdZL2FaSVVSelZCeGxremVGaS9aakRPd0pzR2VOZDlFQWVRTnhI?=
 =?utf-8?B?YnJwM1pUdHZwN3FYQzJtMTZJalZLcXZJaVYwa003czJiYWJIRzVyeFBzUHZ3?=
 =?utf-8?B?VXluV3Z3R24wcGJ4aGYxczdTYjhJZU4zRWhoNDlveDh1aHhEWDVHNmZrY3hK?=
 =?utf-8?B?NlBKUzVhSFhHTVYrS1pEWlJmdGx4Y3FJYWp1NnM3WTJiY2trZ1poajlWZGU1?=
 =?utf-8?B?L1NGQS83d2ZuU0p5WCtCMlZyZnlocFJVME9UNE0yUTdrSnFLaXJQM1JHeml4?=
 =?utf-8?B?SVVsdkVYb2V3c1JCS3kzWkU4WjFVeFFpYUVZMU1GV0dSRWFSYUtXWWVwWGFW?=
 =?utf-8?B?azB5NTZ0NmlORDhaUlF0cDU4UERYSm4xa1g3Y0dZTlh5TVcyRnZPMTV5US9u?=
 =?utf-8?B?VGhVSnphNEVJbHJjQ25JckxKandENW9IMkRTZkU0SktIb25YSzRJeFJOUldN?=
 =?utf-8?B?T3lNc0JiVzJRN3hHY3lTdklZMTlNcCtHNXpsazJwQ2hJSzhHcEVrUlhtb1Y1?=
 =?utf-8?B?WWlGTU4vWVFEb0VUaGc1SjVlUHpmSy8vYk0zcUJVVmZhNmZLa2VDTW9JMzlH?=
 =?utf-8?B?Z1o4RFo4cjRhaEJiS3dmYVo3NnZPdTRsK2NxNzhscHRLOXNxNTg1RjFqVTU4?=
 =?utf-8?B?bVRHZHlEc2pHazEvVWZmc2cxZTZpR0NaRkpLVGhYQ1ZmQjg0N25KcWc5cWpv?=
 =?utf-8?B?YU1MeFY0SzJQYk5uSitZMmFtaUNrRVRHbjN4SlBUS3Y5eU1YYk1qWXZZRDV4?=
 =?utf-8?B?Sk0xYmJkbXIxQ2JGaHMwVHZRRnlJTGp3U1pCZlRpcnJkaVB2OWx5RC9aVXg3?=
 =?utf-8?B?SUp2akJkNXpvSEY0LzFGRUFQa0dLcE0rN0s4blZpUHgyYVZzOEp2clIyUGdU?=
 =?utf-8?B?U1cxZDRheEFFejlWR3JEamNNOWR0a2NmdFFjNmFUQlB0ZFdVcXpXV1Boa2xa?=
 =?utf-8?B?Mk5xWkJlRkFaSktLL3VyQU5CMHlKRk9QclpBQjlQYVlnaWVpN2dBVXhzUVlB?=
 =?utf-8?B?RWwxa2orUTNlc2Z4TnBtMCtlUUtIUWNlNjZqdHR4ak1mRVRaVU1xV3lXS1Jl?=
 =?utf-8?B?VmFob3FsaTlCbDJzY0RoMU56cFhNWlU3RS9KRkd5YmhhaGFac255SmIyakFC?=
 =?utf-8?B?VmZCZWdxYmhsanR0czI4emk2b2dxd0J1em80aDlTb21hQldYYTZQbzRnOCtN?=
 =?utf-8?B?TmFqMGdjNS9VYkZNUUFkRCs1L3JtWkdML1BjclgvUE1nbWlWb2phL0FjMDI5?=
 =?utf-8?B?YTVSYUxoZXM4MHRLa2xtZ0o2TVgrTmhOUlJERnZtakQrVVRiWWxvYnZ6c3hI?=
 =?utf-8?B?WnFNS25FTklBQ3llUEZsZVRVcHNwY2MvOU8wamkzWW53dGFwb0dIaGhFNTFM?=
 =?utf-8?B?TkowQjZuZUg3a1F5S3hDdDVOcWs3V3FxQ0JocytFNVh0bFVzRk5yUUs5b2Y3?=
 =?utf-8?B?alpyOS84V0NzQ1JuMzg5dlR3dUN6cUhIeFAyTnRZblpNRVJCU0NlZ1g4VThT?=
 =?utf-8?B?TWFhMjVxSnlyVnZZRmdGWThJZUNMSHlvckpIQXJQT3VIeVVaUFZ1dXNJQW1U?=
 =?utf-8?B?NzZRRU1TYmNURm9vcVVDTVpic2gvS2duZVJtSGZ5c3BHR21PTmZ0QmZuaTNz?=
 =?utf-8?B?Q3NzVzhJemUxbG0zR3NITkFGVFp6aHI2TTFCV2VXVXZFSHBCRlk5cE9rMGpL?=
 =?utf-8?B?TUIxeVMxK0xpNzFCQjdGVW5EQkxNenJLaE5aeEgrVTNUUmtISnNGRHJiazR5?=
 =?utf-8?B?ZUU3MDBGMmVvbXlNbnpCblhtSE1mdUt3MTdxVUlnNG9nbCtyZ3c0OXFYZk1q?=
 =?utf-8?B?RlNwSTdMOXcrYnFrR3gzN3lwQnp1czdvelhDM2twaUUzSndXcC9Pem1JSVFC?=
 =?utf-8?B?VGI0dU5odEhvVzYvVEQ4dFFuUVJ0djdiaUY2dEkwYnphVXFZcjcxSG5HdlhC?=
 =?utf-8?B?aUxQQlB2enZFbFpQMWpBekxpVVRHSnJOZXBDNllzMWZUZUhNTzF0NHVJSWZR?=
 =?utf-8?B?T1VmRFlYNFJ4ZVVQekd2TmNrU3pjRHY4Mm44N0FjYkQvZ3B0cWdJdkY1RUly?=
 =?utf-8?B?QVJVQXVrTnA3aFZNSWJ6TjdhdExUUTkzNUZCTDBEZ1ROZGRyZ3MrM1gvWFBH?=
 =?utf-8?B?aHFEMXdDVmYyM1VaYWFqb1RvQU9BMCtpeHowZWVGZll5RG1SZnh1MVBHNUxO?=
 =?utf-8?B?Tmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 11:30:36.7523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b64dd29-e36d-4575-b8a5-08de5a72d452
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,suse.com,citrix.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid,vates.tech:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.975];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A20D575079
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 6:13 PM CET, Teddy Astie wrote:
> Le 22/01/2026 =C3=A0 17:51, Alejandro Vallejo a =C3=A9crit=C2=A0:
>> While in principle it's possible to have a vendor virtualising another,
>> this is fairly tricky in practice and comes with the world's supply of
>> security issues.
>>=20
>> Reject any CPU policy with vendors not matching the host's.
>> > Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>   CHANGELOG.md         | 4 ++++
>>   xen/lib/x86/policy.c | 3 ++-
>>   2 files changed, 6 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 18f3d10f20..eae2f961c7 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -22,6 +22,10 @@ The format is based on [Keep a Changelog](https://kee=
pachangelog.com/en/1.0.0/)
>>      - Xenoprofile support.  Oprofile themselves removed support for Xen=
 in 2014
>>        prior to the version 1.0 release, and there has been no developme=
nt since
>>        before then in Xen.
>> +   - Cross-vendor support.  Refuse to start domains whose CPU vendor di=
ffers> +     from the host so that security mitigations stay consistent.=20
> Cross-vendor

???

>> +     setups have been unreliable and not practical since 2017 with the =
advent of
>> +     speculation security.
>>  =20
>
> I don't really like the wording, it sounds like guest will suddenly stop=
=20
> to work for some reason. AFAIK, in the Xen Project only suspend/resume=20
> logic is going to be affected, and we probably want to reflect on that=20
> instead.

You also won't be able to start a cross vendor VM, which you can do by
manually picking the CPUID leaves in xl.cfg. Though you're right that for t=
he
overwhelming majority of affected users this would manifest as not being ab=
le to
restore a saved VM (or not being able to live-migrate, which is effectively=
 the
same thing for this purpose). It's unlikely anyone abuses xl the way I
described.

I'll reword it differently to note the overwhelmingly most affected workflo=
w.

>
>>    - Removed xenpm tool on non-x86 platforms as it doesn't actually prov=
ide
>>      anything useful outside of x86.
>> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
>> index f033d22785..4c0c5386ea 100644
>> --- a/xen/lib/x86/policy.c
>> +++ b/xen/lib/x86/policy.c
>> @@ -15,7 +15,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_p=
olicy *host,
>>   #define FAIL_MSR(m) \
>>       do { e.msr =3D (m); goto out; } while ( 0 )
>>  =20
>> -    if ( guest->basic.max_leaf > host->basic.max_leaf )
>> +    if ( (guest->basic.max_leaf >  host->basic.max_leaf) ||
>> +         (guest->x86_vendor     !=3D host->x86_vendor) )
>>           FAIL_CPUID(0, NA);
>>  =20
>>       if ( guest->feat.max_subleaf > host->feat.max_subleaf )
>
>
>
> --
> Teddy Astie | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech


