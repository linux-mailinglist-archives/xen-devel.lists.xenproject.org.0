Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOHiE1xlc2mivQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 13:11:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3B575915
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 13:11:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212223.1523486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjFzj-00019d-4B; Fri, 23 Jan 2026 12:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212223.1523486; Fri, 23 Jan 2026 12:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjFzj-00017D-1L; Fri, 23 Jan 2026 12:10:31 +0000
Received: by outflank-mailman (input) for mailman id 1212223;
 Fri, 23 Jan 2026 12:10:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hx8e=74=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vjFzh-000177-5m
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 12:10:29 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bc95126-f854-11f0-b15e-2bf370ae4941;
 Fri, 23 Jan 2026 13:10:20 +0100 (CET)
Received: from MN2PR01CA0066.prod.exchangelabs.com (2603:10b6:208:23f::35) by
 SA5PPFEC2853BA9.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 12:10:16 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::66) by MN2PR01CA0066.outlook.office365.com
 (2603:10b6:208:23f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 12:10:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 12:10:15 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 06:10:14 -0600
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
X-Inumbo-ID: 7bc95126-f854-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMA3LrMzGvjn+GLtm5OT7Iii/iJD5aIg063qDy7Fpb3JM+yfSWd7VLJKGLQf9mjrrY99ebnM5e2/A38XrTBnbVHrYCxWZLtvL03sZgX3bgLwWoU21gpRDcbDvnbDXPHAbRk3mPN7YY+KS7bpEOTJatHM2HqJDrgy6072FsJ6uC3vsp3MBSBLnKkmexTII4XfezB2jVShPob/pU474C8GkRZjxB1qw3ETKV5kcIWiMn/A2HkC996nv7y5GpI1LAXhsVHxdyTeMBJsQ2DtJ+kH5VBLnYKpm0UVKfPxQn/X9n43tJH8RmpE18xRUodsMAJJaiqIhsQVTl3ttV03fozZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rStHt3a2IjkI2MGQuSwJxr8R0DeCq4nsz0nSCRcDeA4=;
 b=pNW0A6Thb+h0oTiaSdJ0H8d8Yu0tuCd3xpQOWXfZLYlhEt/B90GTbgSD2JqgF+WwywR4GCsIK5sZ9tV3iXHfGaBme6ecU2q6TJ+devCyXhbpeE080UcCgkbDSnLHGu54DVzVxbNrEmFCHGrGYQo653e7R4AByKA29KPnTCfHMzyfKKpF7xGWNbfxQkRjoLGB7XVsN1eYdlNTKz9ezrSfyCbUSqBcN1MDa8yl9IwS5esn1iFAH6kq0wN0eshx6dvss6WUKjweHUVychgnJjpvjzSKiYpo2c1z1QHtFg3P/aaP+2ChXMmxby0ZM1XHC4vmTvn7SvRY8xs3npUOvioEWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rStHt3a2IjkI2MGQuSwJxr8R0DeCq4nsz0nSCRcDeA4=;
 b=iHT/rjTImi4wN1UTdrPnPeWDzf6roGt7Psl2qBS2F7lRKUzxxX2UbHYtDq8Uy0Oafaadz1nKrCcZBPFJ6Wv0YgY5cyssAxBivRNU0ROmWaxXJt0RaXF2KlhEDmSWdtJpAW3fjJmZcLRb6e2zHoKe88+P7pVf1jxXhPzWQT5NHUk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Jan 2026 13:10:13 +0100
Message-ID: <DFVYHZSG5YAX.3U4HA3MGMT19C@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: Re: [PATCH 0/4] x86: Drop cross-vendor support
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Teddy Astie <teddy.astie@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <3421e525-fb04-4306-9320-4fa359c2ee28@citrix.com>
 <DFVAXLGSFPWC.3UXT3BXSBVFRZ@amd.com>
 <26c416ea-1c4b-464a-bcb9-d34f0600eaac@vates.tech>
In-Reply-To: <26c416ea-1c4b-464a-bcb9-d34f0600eaac@vates.tech>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|SA5PPFEC2853BA9:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bfffbcf-9c42-429a-fcb2-08de5a785e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1JDVmg0c21wREJpaWRwbmZpRjBCYVdScmdJTEZFZjdMQ0pseWlNWk5sQktQ?=
 =?utf-8?B?aHgyc09jQlVYbUdoMG9qVUt1b29EQTFNMUd6ejJTL3ZMQlFFZXozbGZVYU5O?=
 =?utf-8?B?VGtqQjFOZkNaRVRIUURaMmltYi9mR3hkVVJ3OWNzVDlMdWx4d3VVZkdyc1NF?=
 =?utf-8?B?SFVtcjIxZjE5c2d2aFZyOEZlOVRuUU1oc2FjYTVXSTVnWEYwRGZLOGVPcU8r?=
 =?utf-8?B?eXRXazFXR29Sa1ovZDlOUzB3djNCSUxibms1alBFRXdZQko0aXZUMm9aTDMr?=
 =?utf-8?B?UDN1TnJUZXNwS1RaQklKT1RaemEyRnU4bHpjV2hNaVlpTjQrRmdqS3FFR1lv?=
 =?utf-8?B?WXhUNFBKcEJKN3UzaGJkOFdibVllcGlaejR6VDVxOXJsKzF5YmU5b005dm9I?=
 =?utf-8?B?aUpVWHY5NUtGOEZ0TkNjVTU5OTU3QVZYajdMUnJacUl2WDVta1lkOUdBclJh?=
 =?utf-8?B?OGUzUWhRS1ZTNUFQeHZqSkx6akdLMVNXcG04NzV0N2M3dGdMeURtd0FyTTNr?=
 =?utf-8?B?TkpDWXdSQk5Oc3czVlVLSW93cU9JWGdrZ2RmTUdDREIwNU9sUXo5dFhYTnpX?=
 =?utf-8?B?cmFLbEtSL3NqMnVxakNtL1h4MVVhaUlOOStjamxBU0RuUWE2NmkzTnhvS0kz?=
 =?utf-8?B?a3UwTFZqRVhSY3JlVHFicDFkVnppQ2M3MkZLYUJySzZ3UE9zZXNiL2R4Q2lv?=
 =?utf-8?B?YThXMktkbEx1b0JUMWkxalhEcWpiazMvQzM2NzdrNlpMMFk5bnVnRDQxNzJz?=
 =?utf-8?B?dE5IcnlkcmxXSEJrY0JBYmVLVU5PNGFybHZ2TVV5clUwbCttYk4rRkhLM2xh?=
 =?utf-8?B?dHd3bXhlQnJwRjk3cFJpZFlFS2xKcERyTjgrc3Y5RTRxM2FJbHlOME5KLzZG?=
 =?utf-8?B?NkZlZEl5SmZHT2VEdi9uWVNmUFVFanJ2Zk5RakZaWUJiY21jUVpRZmh4QTlD?=
 =?utf-8?B?ZS9aeUNMNjI2NXhmeWI0ZWVPanBmRTY2WWZBZEQyMHdhOGE2UENXTm1pZERJ?=
 =?utf-8?B?YVhIaFh6YlpkZXhaOUdZQlkyR2krSUJMK0xiQk8vYzJYWEU0NGZiSTRRN29y?=
 =?utf-8?B?a0ZKNEdQVmpOM3BXQ1kxNFdXRkFwcEgwUzB2M2hhRGpYanhzOEpkZWFQZDRN?=
 =?utf-8?B?YnM3L2ZoYzM1cC9Idnlzd2FjbXhaZUlzRDVGQU5lUVZraXZ1VjVyZ1Z2eEQx?=
 =?utf-8?B?cmIwYVllcnVVQVNpekZ4WXdXSFp3RHpIN2hCaUtiWVVUZTQxR1VFN2d3ZEd2?=
 =?utf-8?B?NElvZUlPd1huYnZqN2VxV1NSQUtHZlpGNjhORWVsZ0tVOGd6QWtuelRtRWhn?=
 =?utf-8?B?b0NEQ2gydGVSNDRscWc1eDJBWWRyemlFcjZTQ2hZSkYxR0M3SlVwNXgxS2lD?=
 =?utf-8?B?MzFKTGpxYmc1anVrYjR3czJDTXkvS3ZvRUNqd0owRjNQOHdQdWl1Z3ZMRnhn?=
 =?utf-8?B?bmFPdDlhWk9TWE9YZDlnOTVSRldFNHF1NmFvOExTdDI1NWdrSUpZZ1RkS2l4?=
 =?utf-8?B?K0tIaGhSR0l3MTZZeFJWZm1rckVVMXdocWNQRHpjK1AvTTcyOVlZditkcVdj?=
 =?utf-8?B?MEtQRzAzUDVnTDhwNGtlSXNmc1l3TEdFOEJLUGhGRmRnbGJDUEJadFM4UGs3?=
 =?utf-8?B?UmJtRlV4ckpSMTNqSnpQdmJFQnV2a0gzR1BhZ0pGbzY5Mm5hbmw4UzNCZTR1?=
 =?utf-8?B?eDlUaXErRVpiZEVOSnoxdXJ1MktGck9TVU5kZitkNU1XejladWJZODcxUkV5?=
 =?utf-8?B?UFE0WkdaVFNUS3BTbXV3cnlPVGFhaXNyZVFNc3dvdGdQbFl4dE1CRmlLWXg5?=
 =?utf-8?B?OEM0UlVIalpHblJseG1VZGgwdnBOWm1DRndSUzdUV0szaDBKdTJhazRkTTNo?=
 =?utf-8?B?UTRUblJkaURIa3QxeUh4WGFJWFZBNEYvZm9tSnNJRi9lM2M0N0RFNDlFT1U3?=
 =?utf-8?B?RGt0djNlS2UyTHZQSVJhUVNpVURJN3REd0lnMFVYSDd4aHhJeWtZdmRYZXNI?=
 =?utf-8?B?T3RjOTBJNG1KM3FYQXVZVkViK1JpVkh5ZE1BMGpqL25xYklTeitoTEZ5Z2ZF?=
 =?utf-8?B?RlVEQ05McDc1MXVXRmwrdVlDVGl5bTk4MFREamFGVmRHR0Y1SERNczBROC9O?=
 =?utf-8?B?UmxXQkNUTzhXaVRLaVo4NENFTjA2SzlMeGNNc2FvUFJ5NTZBeU80TXV2M3M3?=
 =?utf-8?B?YUwrTzA3Y25SeC8xWlgrbjc3S1VKSUVIL2NCMXg2eGozdnZ4VmhWdWpqUkRh?=
 =?utf-8?B?aFJSOTNzakFFa3IrWC9XUHZJMk5nPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 12:10:15.7037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfffbcf-9c42-429a-fcb2-08de5a785e45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFEC2853BA9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,suse.com,citrix.com,amd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AD3B575915
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 7:16 PM CET, Teddy Astie wrote:
> Le 22/01/2026 =C3=A0 18:44, Alejandro Vallejo a =C3=A9crit=C2=A0:
>> On Thu Jan 22, 2026 at 6:10 PM CET, Andrew Cooper wrote:
>>> On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
>>>> Open question unrelated to the series: Does it make sense to condition=
alise the
>>>> MSR handlers for non intercepted MSRs on HVM_FEP?
>>>
>>> I'm not quite sure what you're asking here.
>>>
>>> ~Andrew
>>=20
>> The handlers for LSTAR and the like are dead code with !CONFIG_HVM_FEP a=
s far
>> as I can tell. The question I'm asking is whether there is another code =
path
>> that might invoke MSR handlers for non-intercepted MSRs. I can't see it,=
 but
>> I'm not sure.
>>=20
>> If there isn't I'm considering (conditionally) getting rid of them.
>>=20
>
> I think you can enter this path by making the guest execute directly or=
=20
> indirectly a rdmsr in a emulated path (there are some cases like certain=
=20
> cases of real mode or maybe vm introspection). I don't think that FEP is=
=20
> the only way to do that.

For the emulation path, I think HVM_FEP is the only means to trigger it, as
neither {rd,wr}msr access memory. VMI (as you mention) and nSVM (as Andrew =
did)
do make sense, but I don't see any others. I don't see how real mode could =
cause
anything (I'm fuzzy on VMX, but I _think_ instructions do execute, just in
a weird paging-on mode akin to v8086).

I'll munch on the idea I bit longer. If I can't come up with any other case=
s
I'll send something to remove that dead code for the cases in which it's tr=
uly
dead.

Cheers,
Alejandro

